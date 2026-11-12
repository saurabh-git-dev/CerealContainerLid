"""Export the new v1 axle parts as print-oriented STLs in stl/ (run with freecadcmd):
    "C:\\Users\\SK\\AppData\\Local\\Programs\\FreeCAD 1.1\\bin\\freecadcmd.exe" export_parts.py
Then build the Bambu project with bambu/make_latch_trial_petg.py (see README.md).
"""
import os
import sys

import FreeCAD as App
import MeshPart

HERE = r"C:\Users\SK\Desktop\Personal\CerealFilamentLid\v1_axle_redesign"
sys.path.insert(0, HERE)
import axle_preview as ap  # noqa: E402

V = App.Vector
OUT = os.path.join(HERE, "stl")
os.makedirs(OUT, exist_ok=True)


def write(name, s, flip=False):
    s = ap.fixed(s).copy()
    if flip:
        s.rotate(V(), V(1, 0, 0), 180)
    bb = s.optimalBoundingBox()
    s.translate(V(-(bb.XMin + bb.XMax) / 2, -(bb.YMin + bb.YMax) / 2, -bb.ZMin))
    MeshPart.meshFromShape(Shape=s, LinearDeflection=0.02, AngularDeflection=0.15, Relative=False).write(
        os.path.join(OUT, name + ".stl"))
    print("AXLE %-16s %5.1f x %5.1f x %5.1f mm  %.2f cm3  valid %s solids %d" % (
        name, bb.XLength, bb.YLength, bb.ZLength, s.Volume / 1000, s.isValid(), len(s.Solids)))


write("BearingCap_x2", ap.cap())                 # flat on the spool-centre face, pegs up
write("StubAxle_x2", ap.stub(), flip=True)       # stands on its head, thread up (100 % infill in the 3MF)
write("MiddleRod", ap.rod())                     # stands on one end
