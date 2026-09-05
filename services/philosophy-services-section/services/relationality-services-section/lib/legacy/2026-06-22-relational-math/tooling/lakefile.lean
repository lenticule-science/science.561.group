import Lake
open Lake DSL

/-
  RelMath tooling sidecar.

  This package hosts documentation / representation tooling that runs OVER the
  pure-math `RelMath` library. RelMath itself (../lakefile.toml) stays
  dependency-pure by mandate: no *math* requires, Lean core (Init) only. The
  mandate is about mathematical dependencies, not dev tooling — so doc-gen4 and
  import-graph live HERE, in a sidecar that requires RelMath, and never touch
  RelMath's own manifest. The dependency arrow points tooling -> RelMath, never
  the reverse, so no tooling code is ever imported into a RelMath proof.

  Pins are the v4.31.0 tags, matching ../lean-toolchain (leanprover/lean4:v4.31.0).
-/

package «relmath-tooling» where

-- The pure-math library, by relative path (../ is the `lean/` dir).
require RelMath from ".."

-- Import-root so workspace tools (checkdecls) can load the whole RelMath env.
-- See RelMathTooling.lean. `checkdecls` imports this package's lean_lib roots.
lean_lib «RelMathTooling»

-- Browseable HTML API docs — the Lean analog of TypeDoc.
require «doc-gen4» from git
  "https://github.com/leanprover/doc-gen4" @ "v4.31.0"

-- Module DAG + import-cycle / transitive-import lint — the Lean import-graph.
require «import-graph» from git
  "https://github.com/leanprover-community/import-graph" @ "v4.31.0"

-- The blueprint HONESTY GATE. `lake exe checkdecls <file>` reads a list of
-- declaration names (the blueprint's `blueprint/lean_decls`, emitted by
-- `leanblueprint web`) and fails if any named decl is missing or `sorry`-free
-- check fails — i.e. it verifies that every `\lean{}`/`\leanok` claim in the
-- prose corresponds to a real, compiling RelMath declaration. This is what turns
-- the dependency graph's green from "asserted" into "proven". Lean-only, no C deps.
require checkdecls from git
  "https://github.com/PatrickMassot/checkdecls.git"
