# New axle for the printed v1 hub adapters

Replaces the one-piece v1 axle. The v1 adapters, 608 bearings and hangers stay as they are. `v1/` itself is not changed.

| Part | Qty | Prints |
|---|---|---|
| `MiddleRod` | 1 | standing on one end (24 mm hex, threaded right through) |
| `StubAxle_x2` | 2 | standing on its head, 100 % infill |
| `BearingCap_x2` | 2 | flat, pegs up |

Print files: `V1_Axle_NewParts_PETG_A1mini.3mf` (all 5 parts), `V1_Axle_Reprint_Rod_Stubs_PETG_A1mini.3mf` (rod + 2 stubs only, after the 24 mm rod change).
Both use (Bambu PETG Basic, Textured PEI, 0.20 mm, 4 walls, 5 mm brim, no supports).

## Assembly
1. Press a 608 into each adapter, then press a cap's 3 pegs into every other hole, behind the bearing.
2. Fit adapter A into the spool, push a stub through it from outside and screw the rod onto it by hand from inside, about 4 turns (half its length). The stub's thread ends before the cap, so the rod can't be screwed on far enough to touch it.
3. Fit adapter B and screw in the second stub.
4. Hold one head and turn the other (both ends tighten) until the adapters are snug on the spool. Don't overtighten: the caps hold by friction.

To take a bearing out, lever the cap off at the rim notches.

## Files
- `axle_preview.py`: sizes and shapes
- `check_and_render.py`: fit check against the real v1 parts + preview images (run in the FreeCAD GUI)
- `export_parts.py`: STLs in `stl/` (run with freecadcmd)

Rebuild the print file from `v2/bambu`, with `STL_DIR` set to this folder's `stl/`:

```bash
python make_latch_trial_petg.py "C:/Users/SK/Desktop/Personal/CerealFilamentLid/v1_axle_redesign/V1_Axle_NewParts_PETG_A1mini.3mf" "BearingCap_x2:2,StubAxle_x2:2,MiddleRod:1"
```

## Not tested in print yet
- Ø8 thread fit (2 mm pitch, same profile and clearance as v2's Ø28 retainer thread)
- how firmly the cap pegs grip in the adapter holes
