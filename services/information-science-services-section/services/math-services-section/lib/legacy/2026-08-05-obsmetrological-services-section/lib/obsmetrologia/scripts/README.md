# Obsmetrologia scripts

`scripts/` contains local tooling owned by the root Obsmetrologia Lake project.
It is not a separate Lake package, and active library modules under
`Obsmetrologia/` should not import tooling modules from here.

The stable project-level interface is the root `Makefile`:

```sh
make doctor
make build
make check
make clean
```

`make check` runs the potential local gate:

```sh
lake exe checknames
```

Other files in this directory are project-maintenance helpers. Treat them as
local implementation tools unless they are wired into the Makefile or
`package.json`.

## CI and local audits

Obsmetrologia's audit suite is self-contained and behaves the same in its own
checkout and in the wider Union workspace. `npm run lean:audit` runs packaging,
frontier-trust, cross-surface, and Collatz audits. `npm run lean:audit:local`
adds the Blueprint audit. No ambient platform package owns or augments the
project's proof readout.

## The blueprint audit

```sh
pnpm run lean:audit:blueprint:local
```

`audit-blueprint.mjs` reads the Blueprint (`docs/blueprint/src/content.tex`
and its `\input`-ed chapters) and the local Lean declaration catalog. It writes:

- `sites/docs/coverage/blueprint-nodes.{json,tsv}` and `index.html` — the
  claim-site inventory (label, Lean witness, status, `\uses` edges, chapter
  context).
- `sites/docs/coverage/blueprint-findings.json` — graph-shape lint findings
  (duplicate labels, missing `\uses` targets, rootless/unglued nodes,
  overboxed definitions, label/kind mismatches, green nodes without a Lean
  witness).
- `sites/docs/coverage/lean-blueprint-weld.json` — the Lean/Blueprint weld
  profile: per-module and per-namespace-root rollups, unmatched Lean
  references, status drift (`green-admitted`, `red-settled`), and
  source/import upstream hints (candidate missing `\uses` edges inferred from
  declaration source text and the Lean import graph).

```sh
pnpm run lean:audit:frontier
```

`audit-lean-frontier.mjs` is the frontier-trust check. It walks
`Obsmetrologia/` directly and writes the
`sites/docs/coverage/lean-frontier-audit.{json,md}` projection that
`collatz:audit:frontier` reads.

## The Collatz finite parent-barrier audit

```sh
pnpm run collatz:audit:axioms
pnpm run collatz:audit:frontier
pnpm run collatz:audit:parent-gap
```

The frontier audit reads `sites/docs/coverage/lean-frontier-audit.json`,
checks that no hard trust surfaces are present, and writes
`sites/docs/coverage/collatz-frontier-audit.{json,md}`. That Collatz-specific
artifact also checks that `ParentBarrierOneLockCollapse` is present as the named
one-lock proposition/equivalence layer, not as a silently proved implication.
The axiom audit runs Lean's `#print axioms` over the green Collatz κ-package and
two-adic descent declarations, allows only `propext` and `Quot.sound`, and writes
`sites/docs/coverage/collatz-axiom-audit.{json,md}`.
The parent-gap audit checks the residue-gap inequality, the proved-equivalent
carry-quotient positivity face, and the no-bad-cylinder descent face through
parent-prefix length 28, the bound that enumerates 1,166,059 parent barriers. It
writes
`sites/docs/coverage/collatz-parent-gap-audit.{json,md}` with per-depth counts,
separate quotient and bad-cylinder violation counters, and the closest positive
margins, including the parent-barrier word, exact carry quotient, least cylinder
seed, and first-passage image witnessing each margin. These are part of
`npm run lean:audit`, so the scheduled project audit
re-runs the one-hole guardrail, the one-lock accounting guardrail, the green
declaration axiom-clean guardrail, and the finite Collatz evidence check.
