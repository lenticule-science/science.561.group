import VersoManual

open Lean
open Verso Doc Elab

/-!
Project-local Verso defaults for the Infomaterial manual.

Verso's Manual genre already has checked Lean code blocks in
`Verso.Genre.Manual.InlineLean`, but each authoring module has to open that
namespace. This module also registers a plain `text` code block so documentation
can use ordinary fenced layout sketches without inventing a new block each time.
-/

namespace Verso.Genre.Manual

@[code_block]
def text : CodeBlockExpanderOf Unit
  | (), str => `(Verso.Doc.Block.code $(quote str.getString))

end Verso.Genre.Manual
