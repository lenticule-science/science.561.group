import VersoManual
import InfomaterialManual

open Verso.Genre Manual

/-!
Entry point for the Infomaterial Verso manual. The document itself lives in
`InfomaterialManual` (Verso markup runs to end-of-file, so the doc and the executable
entry point must be separate modules). `manualMain` renders the document to HTML
(and optionally TeX); CLI args select output mode/destination.
-/

def main (args : List String) : IO UInt32 :=
  manualMain (%doc InfomaterialManual) (options := args)
