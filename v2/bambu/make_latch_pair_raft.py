"""2 latches on a raft (Bambu PETG Basic, A1 mini). A latch stands 24 mm tall on a small chamfered footprint (132 mm2);
one lifted off the plate, so this set prints on a 4-layer raft, placed far enough apart that the rafts don't overlap.
Output: ../print/CerealLid_v2_Latches_x2_Raft_PETG_A1mini.3mf

Run:  python make_latch_pair_raft.py       (after export_v2.py)
"""
import json
import os
import re
import shutil
import subprocess
import sys
import zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import profiles  # noqa: E402
from make_project import EXE, rc_of, plate_hours  # noqa: E402

STL = os.path.join(os.path.dirname(HERE), "stl_cereal", "Latch_x4.stl")
OUT = os.path.join(os.path.dirname(HERE), "print", "CerealLid_v2_Latches_x2_Raft_PETG_A1mini.3mf")
WORK = os.path.join(HERE, "work_latch_raft")
PETG = "Bambu PETG Basic @BBL A1M 0.4 nozzle"
RAFT = {"raft_layers": "4", "raft_first_layer_expansion": "6", "raft_expansion": "3",
        "raft_first_layer_density": "100%", "raft_contact_distance": "0.25",   # 0.25 gap: PETG snaps off its raft
        "brim_type": "no_brim"}
PLACES = [(71.5, 50.0), (71.5, 115.5)]         # latch min corners, centred on the 180 mm plate (auto-arrange ignores rafts)


def place(path):
    """Set each latch's position in the project (the build items and their matching assemble items)."""
    tmp = path + ".tmp"
    with zipfile.ZipFile(path) as zin, zipfile.ZipFile(tmp, "w", zipfile.ZIP_DEFLATED) as zo:
        for n in zin.namelist():
            data = zin.read(n)
            if n in ("3D/3dmodel.model", "Metadata/model_settings.config"):
                it = iter(PLACES)
                tag = "item" if n.startswith("3D") else "assemble_item"

                def move(mo):
                    x, y = next(it)
                    return '%stransform="1 0 0 0 1 0 0 0 1 %g %g 0"' % (mo.group(1), x, y)
                s = re.sub(r'(<%s [^>]*?)transform="[^"]*"' % tag, move, data.decode("utf-8"))
                data = s.encode("utf-8")
            zo.writestr(n, data)
    os.replace(tmp, path)


def main():
    shutil.rmtree(WORK, ignore_errors=True)
    os.makedirs(WORK)
    lst = {"plates": [{"plate_name": "Latches x2 on a raft", "need_arrange": True,
                       "objects": [{"path": STL, "count": 2, "filaments": [1]}]}]}
    fn = os.path.join(WORK, "assemble_list.json")
    json.dump(lst, open(fn, "w"), indent=1)
    m, p, _, _ = profiles.build_presets("0.20", 4, "15%")
    proc = json.load(open(p, encoding="utf-8"))
    proc.update(RAFT)
    json.dump(proc, open(p, "w", encoding="utf-8"), indent=1)
    fil = profiles.write_preset("filament", PETG)
    r = subprocess.run([EXE, "--load-settings", m + ";" + p, "--load-filaments", fil, "--load-assemble-list", fn,
                        "--outputdir", WORK, "--export-3mf", "latch.3mf"], capture_output=True, text=True)
    proj = os.path.join(WORK, "latch.3mf")
    if rc_of(r) != 0 or not os.path.exists(proj):
        raise RuntimeError("export failed: rc=%s %s" % (rc_of(r), r.stdout[-2000:]))
    place(proj)
    h = plate_hours(proj, 1, WORK)[0]
    shutil.copy(proj, OUT)
    print("%.2f h  %s" % (h, OUT))


if __name__ == "__main__":
    main()
