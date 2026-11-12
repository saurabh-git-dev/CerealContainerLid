"""Quick PETG print test for gaps between lines (A1 mini, same printer / filament / process as the v2 projects, no brim).

One object, one plate:
  - 4 single-layer squares (25 x 25 x 0.2) near the plate corners: first-layer squish + levelling across the plate
  - a solid 40 x 40 x 1.6 patch in the middle (8 solid layers, like the silica covers): gaps on layers 2+ = flow

Run:  python make_print_test.py
Output: PrintTest_FirstLayer_Solid_PETG_A1mini.3mf (+ the STL) next to this script.
"""
import json
import os
import shutil
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
BAMBU = os.path.join(os.path.dirname(HERE), "bambu")
sys.path.insert(0, BAMBU)
import profiles  # noqa: E402
from make_project import EXE, rc_of, plate_hours  # noqa: E402

NAME = "PrintTest_FirstLayer_Solid"
STL = os.path.join(HERE, NAME + ".stl")
OUT = os.path.join(HERE, NAME + "_PETG_A1mini.3mf")
WORK = os.path.join(HERE, "work")
PETG = "Bambu PETG Basic @BBL A1M 0.4 nozzle"
SQ, SQ_T, SQ_AT = 25.0, 0.2, 60.0           # corner squares: size, thickness (1 layer), centre offset from the middle
PATCH, PATCH_T = 40.0, 1.6                  # middle solid patch


def box(x0, y0, z0, x1, y1, z1):
    """12 outward-facing triangles of an axis-aligned box."""
    p = [(x0, y0, z0), (x1, y0, z0), (x1, y1, z0), (x0, y1, z0), (x0, y0, z1), (x1, y0, z1), (x1, y1, z1), (x0, y1, z1)]
    q = [(0, 2, 1), (0, 3, 2), (4, 5, 6), (4, 6, 7), (0, 1, 5), (0, 5, 4), (1, 2, 6), (1, 6, 5), (2, 3, 7), (2, 7, 6),
         (3, 0, 4), (3, 4, 7)]
    return [(p[a], p[b], p[c]) for a, b, c in q]


def write_stl():
    tris = []
    for sx in (-1, 1):
        for sy in (-1, 1):
            cx, cy = sx * SQ_AT, sy * SQ_AT
            tris += box(cx - SQ / 2, cy - SQ / 2, 0, cx + SQ / 2, cy + SQ / 2, SQ_T)
    tris += box(-PATCH / 2, -PATCH / 2, 0, PATCH / 2, PATCH / 2, PATCH_T)
    with open(STL, "w") as f:
        f.write("solid %s\n" % NAME)
        for t in tris:
            f.write(" facet normal 0 0 0\n  outer loop\n")
            for v in t:
                f.write("   vertex %g %g %g\n" % v)
            f.write("  endloop\n endfacet\n")
        f.write("endsolid %s\n" % NAME)


def main():
    write_stl()
    shutil.rmtree(WORK, ignore_errors=True)
    os.makedirs(WORK)
    lst = {"plates": [{"plate_name": "PETG print test", "need_arrange": True,
                       "objects": [{"path": STL, "count": 1, "filaments": [1]}]}]}
    fn = os.path.join(WORK, "assemble_list.json")
    json.dump(lst, open(fn, "w"), indent=1)
    m, p, _, _ = profiles.build_presets("0.20", 4, "15%")
    proc = json.load(open(p, encoding="utf-8"))
    proc.update({"brim_type": "no_brim"})                  # nothing round the squares: see the bare first layer
    json.dump(proc, open(p, "w", encoding="utf-8"), indent=1)
    fil = profiles.write_preset("filament", PETG)
    r = subprocess.run([EXE, "--load-settings", m + ";" + p, "--load-filaments", fil, "--load-assemble-list", fn,
                        "--outputdir", WORK, "--export-3mf", "test.3mf"], capture_output=True, text=True)
    proj = os.path.join(WORK, "test.3mf")
    if rc_of(r) != 0 or not os.path.exists(proj):
        raise RuntimeError("export failed: rc=%s %s" % (rc_of(r), r.stdout[-2000:]))
    h = plate_hours(proj, 1, WORK)[0]
    shutil.copy(proj, OUT)
    shutil.rmtree(WORK, ignore_errors=True)
    print("%.0f min  %s" % (h * 60, OUT))


if __name__ == "__main__":
    main()
