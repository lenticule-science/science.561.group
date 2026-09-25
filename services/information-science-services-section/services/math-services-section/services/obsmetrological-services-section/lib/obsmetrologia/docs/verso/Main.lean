import VersoManual
import ObsmetrologiaManual

open Verso.Genre Manual

/-!
Entry point for the Obsmetrologia Verso manual. The document itself lives in
`ObsmetrologiaManual` (Verso markup runs to end-of-file, so the doc and the executable
entry point must be separate modules). `manualMain` renders the document to HTML
(and optionally TeX); CLI args select output mode/destination.
-/

def main (args : List String) : IO UInt32 :=
  manualMain (%doc ObsmetrologiaManual) (options := args)
