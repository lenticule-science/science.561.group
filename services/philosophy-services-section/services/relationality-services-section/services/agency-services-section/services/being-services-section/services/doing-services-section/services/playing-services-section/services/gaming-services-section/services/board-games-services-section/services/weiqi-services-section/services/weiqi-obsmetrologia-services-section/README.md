# Weiqi Obsmetrologia Services Section

The weiqi locus of the Obsmetrologia proof tree: a Lean 4 package that
formalizes weiqi (go) as an instance of the main Obsmetrologia library's
mathematics — the board and its groups/liberties, the three ko regimes and
their `3 ^ n` termination bound, evidence-move monotonicity, and move
admission as a Hoare program with a predicate-Chu bridge.

The Weiqi Lean material belongs in
weiqi-obsmetrologia-services, under weiqi, and import the main library, not
in our main obsmetrologia lean library." This section's Lean package
depends on
[`obsmetrological-services-section/lib/obsmetrologia`](../../../../../../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia)
as an ordinary Lake path requirement.

The modules live in this package's own `WeiqiObsmetrologia` namespace, and
must: Lake's `lean_lib` module ownership is workspace-wide name-prefix
matching (`Lake/Config/LeanLib.lean`: a library's default `roots` is its own
name, and "submodules of these roots ... are considered part of the
library", with no exclusion mechanism), so the upstream library named
`Obsmetrologia` claims every `Obsmetrologia.*` module name in the workspace
and a downstream package cannot own modules under that prefix.

## Package

- `lib/weiqi-obsmetrologia/` — the Lean package (`WeiqiObsmetrologia`,
  `lakefile.toml`, `lean-toolchain`).
- `lib/weiqi-obsmetrologia/WeiqiObsmetrologia/` — the four modules, in the
  package's own `WeiqiObsmetrologia` namespace (declarations otherwise
  unchanged):
  - `Board.lean` — the board, positions, groups (`WeiqiObsmetrologia.Board.Group`),
    and liberties (`WeiqiObsmetrologia.Board.Liberties`).
  - `Ko.lean` — the three ko regimes (`WeiqiObsmetrologia.Ko.SimpleKo`,
    `WeiqiObsmetrologia.Ko.PositionalSuperko`,
    `WeiqiObsmetrologia.Ko.SituationalSuperko`) as trace predicates, their
    implications, and `WeiqiObsmetrologia.Board.positionalSuperko_length_le`
    (the `3 ^ n` bound).
  - `Evidence.lean` — evidence moves are knowledge-monotone but not
    truth-monotone (`WeiqiObsmetrologia.Evidence.knowledge_monotone_of_evidence`,
    `WeiqiObsmetrologia.Evidence.evidence_not_truth_monotone`).
  - `Admission.lean` — the predicate-Chu bridge
    (`WeiqiObsmetrologia.boolPredicateChu`,
    `WeiqiObsmetrologia.functionPredicateChuMap`,
    `WeiqiObsmetrologia.boolean_hoare_is_lax_chu`) and move admission as a
    `HoareProgram` (`WeiqiObsmetrologia.Admission.admission`,
    `WeiqiObsmetrologia.Admission.admission_seq`).
- `lib/weiqi-obsmetrologia/WeiqiObsmetrologia.lean` — the package's root
  module (Lake requires one), importing the four modules above.

## Building

```sh
cd lib/weiqi-obsmetrologia
~/.elan/bin/lake build
```

The package's `lakefile.toml` declares a Lake path dependency on the main
library (`[[require]] name = "Obsmetrologia" path = "..."`, resolving to
`obsmetrological-services-section/lib/obsmetrologia`), imitating the same
pattern already in use by `aagaard/proofs`. `lake build` therefore also
builds `Obsmetrologia` into this package's own `.lake/` on first run.

`npm test` (`lake build`) runs the same build for house tooling
consistency with sibling sections.
