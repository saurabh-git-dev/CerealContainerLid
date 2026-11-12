"""Preview of a replacement axle for the printed v1 hub adapters (adapters, 608s and hangers stay as they are):
a short hex middle rod with a female thread in each end + 2 stub axles (big head, neck, shoulder on the inner race,
male thread that passes through the 608 and screws into the rod). Turning the heads against each other pulls both
shoulders inwards, and the rod is short enough to leave room for that.

Frame of every part: axis = z, z = |y| from the spool centre. World: B side z -> +y, A side turned 180 deg.
Plain Part shapes; nothing here is in the v1 model yet.
"""
import math

import FreeCAD as App
import Part

V = App.Vector

# ---- v1 parts this has to fit (mm, from v1/source/cereal_lid.py)
D_AXLE = 106.0
HG_Y0, HG_Y1 = 36.5, 41.25                   # hanger plate faces
BRG_U0, BRG_U1 = 21.7, 28.7                  # 608 faces: against the pocket seat, held there by the cap
ADAPTER_FACE = 21.5                          # adapter inner end face (flat out to r 25.1)
HOLE_PCD_R, HOLE_R = 18.0, 4.5               # the adapter's 6 through-holes
FLANGE_OUT = 35.5                            # adapter flange outer face
NECK_R = 2.9
FLOOR_LIFT = 0.057                           # round neck on v1's flat track floor sits this much above the old axle

# ---- stub axle
PLAY = 0.75                                  # neck longer than the plate by this each side (spool width +-1.5 mm)
N0, N1 = HG_Y0 - PLAY, HG_Y1 + PLAY
HEAD_R, HEAD_T = 9.0, 2.5                    # same big head as v2
SCALLOP_N, SCALLOP_R = 12, 1.2               # finger grip round the head
SHAFT_R = 3.95
SH_R, SH_L = 5.5, 1.5                        # shoulder on the 608 inner race (outer face)
TIP_U = 4.0                                  # stub tips 8 mm apart: 8 mm of thread in the rod each side, 4 to tighten
# ---- thread: same profile and clearance as the retainer thread that printed well in v2
T_MAJOR = 3.925                              # nominal major radius
T_P, T_D, T_CR, T_CLR = 2.0, 0.7, 0.25, 0.25
MALE_ROOT = T_MAJOR - T_D - T_CLR / 2        # 3.1 (crest 3.8: passes the 8 mm bearing bore)
THR_END = 17.5                               # male thread stops here: the rod can't screw on past it, so it never reaches the cap (19)
# ---- middle rod
ROD_AF, ROD_HALF = 16.0, 12.0                # hex across flats, half length (24 mm rod, threaded right through)


# ---- bearing cap (one per side): removable, stops the 608 being pulled out of its pocket when the heads are tightened
CAP_R, CAP_T, CAP_HOLE = 24.0, 2.5, 8.5      # disc radius, thickness, hole (clears the inner race)
BOSS_R0, BOSS_R1, BOSS_H = 9.8, 10.95, 0.2   # ring on the 608 outer race only; 0.2 = the pocket's spare depth
PEG_R, PEG_END, PEG_TIP = 4.35, 33.0, 1.5    # 3 pegs press into every other hole; stop short of the flange face
RIB_PROUD, RIB_W = 0.25, 1.2                 # 4 crush ribs per peg (grip in the 9 mm hole)
PRY_R = 2.0                                  # 2 notches in the rim to lever the cap off


def cyl(r, z0, z1):
    return Part.makeCylinder(r, z1 - z0, V(0, 0, z0))


def thread(r_base, depth, z0, z1, pitch, grow=0.0, crest=0.25):
    """Trapezoid ridge on a right-hand helix, phase referenced to z = 0 so mating threads line up."""
    assert 2 * depth + crest + 2 * grow < pitch, "thread profile wider than the pitch"
    half = depth + crest / 2 + grow
    zs = math.floor(z0 / pitch) * pitch - pitch
    hx = Part.makeLongHelix(pitch, z1 - zs + pitch, r_base, 0)
    d = depth + grow
    pts = [V(r_base - 0.3, 0, -half), V(r_base + d, 0, -crest / 2 - grow), V(r_base + d, 0, crest / 2 + grow),
           V(r_base - 0.3, 0, half)]
    sw = Part.Wire(hx).makePipeShell([Part.Wire(Part.makePolygon(pts + [pts[0]]))], True, True)
    sw.translate(V(0, 0, zs))
    return sw.common(cyl(r_base + 5, z0, z1))


def stub():
    """Prints standing on its head, thread up."""
    r = MALE_ROOT
    prof = [(0, TIP_U), (r - 0.6, TIP_U), (r, TIP_U + 0.6), (r, THR_END), (SHAFT_R, THR_END + SHAFT_R - r),
            (SHAFT_R, BRG_U1), (SH_R, BRG_U1), (SH_R, BRG_U1 + SH_L), (SHAFT_R, BRG_U1 + SH_L + SH_R - SHAFT_R),
            (SHAFT_R, N0 - (SHAFT_R - NECK_R)), (NECK_R, N0), (NECK_R, N1), (HEAD_R, N1), (HEAD_R, N1 + HEAD_T),
            (0, N1 + HEAD_T)]
    w = Part.makePolygon([V(a, 0, b) for a, b in prof] + [V(0, 0, TIP_U)])
    s = Part.Face(w).revolve(V(), V(0, 0, 1), 360)
    s = s.fuse(thread(r, T_D, TIP_U + 0.5, THR_END - 0.2, T_P, 0, T_CR))
    cuts = []
    for k in range(SCALLOP_N):
        a = 2 * math.pi * k / SCALLOP_N
        c = cyl(SCALLOP_R, N1 - 1, N1 + HEAD_T + 1)
        c.translate(V(HEAD_R * math.cos(a), HEAD_R * math.sin(a), 0))
        cuts.append(c)
    return s.cut(Part.makeCompound(cuts)).removeSplitter()


def rod():
    """Hex coupling nut, threaded right through (right-hand: hold one head, turn the other, both ends tighten)."""
    R = ROD_AF / math.sqrt(3)
    pts = [V(R * math.cos(math.radians(60 * k)), R * math.sin(math.radians(60 * k)), -ROD_HALF) for k in range(6)]
    s = Part.Face(Part.makePolygon(pts + [pts[0]])).extrude(V(0, 0, 2 * ROD_HALF))
    minor = T_MAJOR - T_D
    bore = cyl(minor, -ROD_HALF - 1, ROD_HALF + 1).fuse(thread(minor, T_D, -ROD_HALF - 1, ROD_HALF + 1, T_P, T_CLR / 2, T_CR))
    lead = Part.makeCone(minor + T_D, minor + T_D + 1.0, 1.0, V(0, 0, ROD_HALF - 1.0 + 0.001))          # lead-in each end
    other = lead.copy()
    other.rotate(V(), V(1, 0, 0), 180)
    return s.cut(bore.fuse([lead, other]))


def cap():
    """Prints flat, spool-centre face on the bed, pegs up. Sits on the adapter's inner end face."""
    f0 = ADAPTER_FACE - CAP_T
    s = cyl(CAP_R, f0, ADAPTER_FACE)
    s = s.fuse(cyl(BOSS_R1, ADAPTER_FACE - 0.01, ADAPTER_FACE + BOSS_H).cut(cyl(BOSS_R0, ADAPTER_FACE - 1, ADAPTER_FACE + 1)))
    pegs = []
    for k in range(3):
        straight = PEG_END - PEG_TIP
        p = cyl(PEG_R, ADAPTER_FACE - 0.01, straight).fuse(Part.makeCone(PEG_R, PEG_R - PEG_TIP, PEG_TIP, V(0, 0, straight)))
        for j in range(4):
            r = Part.makeBox(RIB_PROUD + 1.0, RIB_W, straight - 1 - ADAPTER_FACE, V(PEG_R - 1.0, -RIB_W / 2, ADAPTER_FACE))
            r.rotate(V(), V(0, 0, 1), 90 * j + 45)
            p = p.fuse(r)
        p.translate(V(HOLE_PCD_R, 0, 0))
        p.rotate(V(), V(0, 0, 1), 120 * k)
        pegs.append(p)
    s = s.fuse(pegs).cut(cyl(CAP_HOLE, f0 - 1, ADAPTER_FACE + 1))
    for a in (60, 240):                                                # between the pegs
        n = cyl(PRY_R, f0 - 1, ADAPTER_FACE + 0.5)
        n.translate(V(CAP_R * math.cos(math.radians(a)), CAP_R * math.sin(math.radians(a)), 0))
        s = s.cut(n)
    return s.removeSplitter()


def place(s, side):
    """Local z = |y| -> world, on the axle axis."""
    s = s.copy()
    s.rotate(V(), V(1, 0, 0), -90 if side == "B" else 90)
    s.translate(V(0, 0, -D_AXLE + FLOOR_LIFT))
    return s


def fixed(s):
    if not s.isValid():
        s = s.copy()
        s.fix(0.001, 0.001, 0.001)
    return s
