"""Run inside the FreeCAD GUI with this folder on sys.path: checks the fit against the real v1 parts and renders
preview images into this folder. Works in its own document."""
import importlib
import os

import FreeCAD as App
import FreeCADGui as Gui
import Part

import axle_preview as ap

importlib.reload(ap)
V = App.Vector
HERE = r"C:\Users\SK\Desktop\Personal\CerealFilamentLid\v1_axle_redesign"
keep = App.ActiveDocument.Name if App.ActiveDocument else None
v1 = App.openDocument(r"C:\Users\SK\Desktop\Personal\CerealFilamentLid\v1\source\CerealLid.FCStd", True)   # hidden
get = lambda n: v1.getObject(n).Shape.copy()
dz = V(0, 0, ap.FLOOR_LIFT)
hub = {k: get("HubAdapter_" + k) for k in "AB"}
brg = {k: get("Ref_Bearing_608_" + k) for k in "AB"}
for s in list(hub.values()) + list(brg.values()):
    s.translate(dz)
brg["A"].translate(V(0, -0.1, 0))                               # held against the pocket seat by the cap
brg["B"].translate(V(0, 0.1, 0))
hang = {k: get("Hanger_" + k) for k in "AB"}
box, spool = get("Ref_Box_Rim"), get("Ref_Spool_200x67")
App.closeDocument(v1.Name)

S, R, K = ap.fixed(ap.stub()), ap.fixed(ap.rod()), ap.fixed(ap.cap())
parts = {"Stub_A": ap.place(S, "A"), "Stub_B": ap.place(S, "B"), "Rod": ap.place(R, "B"),
         "Cap_A": ap.place(K, "A"), "Cap_B": ap.place(K, "B")}
out = ["stub valid %s solids %d vol %.2f cm3 | rod valid %s solids %d vol %.2f cm3" % (
    S.isValid(), len(S.Solids), S.Volume / 1000, R.isValid(), len(R.Solids), R.Volume / 1000)]

others = {"Adapter_A": hub["A"], "Adapter_B": hub["B"], "Bearing_A": brg["A"], "Bearing_B": brg["B"],
          "Hanger_A": hang["A"], "Hanger_B": hang["B"], "Box": box}
for n, s in parts.items():
    for m, t in others.items():
        v = s.common(t).Volume
        out.append("%-7s x %-10s overlap %.3f mm3, gap %.2f mm" % (n, m, v, s.distToShape(t)[0] if v < 1e-3 else 0))
    if n != "Rod":
        out.append("%-7s x Rod overlap %.3f mm3, gap %.2f" % (n, s.common(parts["Rod"]).Volume, s.distToShape(parts["Rod"])[0]))
for k in "AB":
    v = parts["Stub_" + k].common(parts["Cap_" + k]).Volume
    out.append("Stub_%s x Cap_%s overlap %.3f, gap %.2f" % (k, k, v, parts["Stub_" + k].distToShape(parts["Cap_" + k])[0]))
out.append("cap valid %s solids %d vol %.2f cm3" % (K.isValid(), len(K.Solids), K.Volume / 1000))
ribs = ap.place(K, "B").common(hub["B"])
out.append("cap x adapter B: overlap solids %d, z-spread per solid (expect only rib tips in the holes): %s" % (
    len(ribs.Solids), sorted(round(x.Volume, 2) for x in ribs.Solids)[:14]))
for ang in (90, 180, 270, 360):                                 # stub unscrewing out of the rod
    for sg in (1, -1):
        s = S.copy()
        s.rotate(V(), V(0, 0, 1), ang)
        s.translate(V(0, 0, sg * ap.T_P * ang / 360.0))
        out.append("stub turned %3d, moved %+.2f: overlap with rod %.3f" % (ang, sg * ap.T_P * ang / 360.0, s.common(R).Volume))
out.append("thread crest dia %.2f (608 bore 8.0), engagement %.1f, tip travel before the tips meet %.1f, rod end to bearing %.1f" % (
    2 * (ap.MALE_ROOT + ap.T_D), ap.ROD_HALF - ap.TIP_U, ap.TIP_U, ap.BRG_U0 - ap.ROD_HALF))
open(os.path.join(HERE, "check.txt"), "w").write("\n".join(out))

if "AxleV1Preview" in App.listDocuments():
    App.closeDocument("AxleV1Preview")
d = App.newDocument("AxleV1Preview")
C = {"Stub_A": (0.25, 0.27, 0.30), "Stub_B": (0.25, 0.27, 0.30), "Rod": (0.85, 0.30, 0.28), "Cap_A": (0.30, 0.72, 0.42), "Cap_B": (0.30, 0.72, 0.42),
     "Adapter_A": (0.91, 0.62, 0.22), "Adapter_B": (0.20, 0.50, 0.80), "Bearing_A": (0.62, 0.64, 0.68),
     "Bearing_B": (0.62, 0.64, 0.68), "Hanger_A": (0.95, 0.72, 0.3), "Hanger_B": (0.95, 0.72, 0.3)}
hzone = Part.makeBox(90, 120, 62, V(-45, -60, -ap.D_AXLE - 31))
all_shapes = dict(parts)
all_shapes.update({k: v for k, v in others.items() if k != "Box"})
half = Part.makeBox(200, 160, 120, V(-100, -80, -ap.D_AXLE + ap.FLOOR_LIFT))   # horizontal cut through the axis and a peg
Gv = Gui.getDocument(d.Name).activeView()
Gv.setAnimationEnabled(False)                                            # else saveImage catches the view mid-turn


def show(shapes, name, view, section=False, explode=None):
    for o in list(d.Objects):
        d.removeObject(o.Name)
    for n, s in shapes.items():
        s = s.copy()
        if n.startswith("Hanger"):
            s = s.common(hzone)
        if explode:
            s.translate(V(0, explode.get(n, 0), 0))
        if section:
            s = s.cut(half)
        o = d.addObject("Part::Feature", n)
        o.Shape = s
        o.ViewObject.ShapeColor = C[n]
    d.recompute()
    Gui.updateGui()
    getattr(Gv, view)()
    Gv.fitAll()
    Gui.updateGui()
    Gv.saveImage(os.path.join(HERE, name), 2560, 1440, "White")


show(all_shapes, "preview_1_section.png", "viewTop", section=True)
e = {"Stub_A": -135, "Stub_B": 135, "Adapter_A": -95, "Adapter_B": 95, "Bearing_A": -58, "Bearing_B": 58,
     "Cap_A": -28, "Cap_B": 28, "Hanger_A": -150, "Hanger_B": 150}
show({k: v for k, v in all_shapes.items() if not k.startswith("Hanger")}, "preview_2_exploded.png", "viewIsometric", explode=e)
show({k: all_shapes[k] for k in ("Stub_A", "Stub_B", "Rod", "Cap_A", "Cap_B")}, "preview_3_new_parts.png", "viewIsometric",
     explode={"Stub_A": -60, "Stub_B": 60, "Cap_A": -12, "Cap_B": 12})
if keep and keep in App.listDocuments():
    App.setActiveDocument(keep)
print("\n".join(out))
