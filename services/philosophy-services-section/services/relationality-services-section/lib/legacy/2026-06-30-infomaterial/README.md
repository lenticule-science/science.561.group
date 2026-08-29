# Infomaterial

Infomaterial is the active Lean 4 formalization of the 561 Group corpus math.
It is a dependency-free Lean library: Lean core only, no Mathlib, no external
Lake packages.

This tree is not a conventional theorem-library import of received mathematics.
The local discipline is generative: read the corpus path as proof structure, put
each formal object at the stage that generates it, and let familiar subjects
such as order, logic, topology, dynamics, thermodynamics, and computation appear
only as derived forms inside that descent.

The Lean project root is this directory:

```sh
cd sites/infomaterial.emsenn.net/Infomaterial
```

## First Checks

```sh
make doctor
make build
make check
```

`make check` is the local verification contract. It builds the library and runs
the naming-honesty gate exposed as `lake exe checknames`.

Package scripts mirror the same contract when you are driving the project
through pnpm:

```sh
pnpm run lean:build
pnpm run lean:check
pnpm run lean:check:primitive
pnpm run lean:mcp
```

Toolchain: `leanprover/lean4:v4.31.0`.

## The Rule

Past the base, there is no free data.

`Infomaterial.Primitive` and the articulating base introduce the marks and
recursion that the rest of the library derives from. Downstream modules should
not introduce new `axiom`, `opaque`, `constant`, or `native_decide` trust
surfaces.

Frontier work is allowed to be honest:

- A `sorry` marks an open proof obligation, not imported data.
- A proved/exported result must say exactly what Lean proves.
- Blueprint-green or otherwise advertised results should be `sorry`-free and
  axiom-clean, apart from Lean core logical axioms when they are genuinely
  involved.

When a claim is not yet proved, keep the strong statement as a red/open
blueprint node or as an explicit hypothesis. Do not weaken a theorem until it is
trivial while leaving prose that claims the stronger result.

## Project Map

| Path | Role |
| --- | --- |
| `Infomaterial.lean` | Public root import file, in dependency order. |
| `Infomaterial/` | Active Lean modules. |
| `docs/blueprint/` | Formal frontier and claim graph source. |
| `docs/verso/` | Explanatory documentation for what has been formalized. |
| workspace `dev/content/` | Corpus source for formalization work. |
| `scripts/CheckNames.lean` | Local naming gate behind `lake exe checknames`. |
| `scripts/` | Project tooling owned by this root Lake project. |
| `_archive/` | Prior attempts and reference material; not active build input. |
| `AGENTS.md` | Short operating contract for automated Lean work here. |
| `CLAUDE.md` | Full mathematical and house-style orientation. |

The root module currently imports:

| Root import | Orientation |
| --- | --- |
| `Infomaterial.Primitive` | Atomic marks and primitive base vocabulary. |
| `Infomaterial.Articulation` | Articulating structures generated from the base. |
| `Infomaterial.Language` | Predicating, positing, settling, and related language stages. |
| `Infomaterial.Calculus` | Derived algebraic, order, probabilistic, optimization, and real-calculus surfaces. |
| `Infomaterial.Site` | Site, section, sheaf, enriched, and d-frame infrastructure. |
| `Infomaterial.Closure` | Closure operators, modal/ordinal/regime material, rule systems, and monadic reductions. |
| `Infomaterial.Cohomology` | Cohomological invariants, local constancy, defect, and coordination structures. |
| `Infomaterial.Dynamics` | Flow and gauge dynamics. |
| `Infomaterial.Persistence` | Aperiodic and persistence-oriented constructions. |
| `Infomaterial.Relational` | Relational matter and domain-specific derived physics-style modules. |
| `Infomaterial.Thermodynamics` | Thermodynamic derived surfaces. |
| `Infomaterial.Computing` | Computing-facing format and operation surfaces. |

Use `Infomaterial.lean` as the live source of truth for import order.

## Working Loop

Before Lean proof work:

1. Read `AGENTS.md`.
2. Read the relevant parts of `CLAUDE.md`.
3. Read the corpus node being formalized. Do not infer content from a slug.
4. Use the `infomaterial-lean-lsp` MCP server for diagnostics, file outlines,
   hovers, local search, proof goals, tactic trials, and axiom checks.

Whole-project procedures still go through the Makefile:

```sh
make build
make check
make clean
```

For a new Lean module:

1. Place it under `Infomaterial/` in the namespace that generated it.
2. Put `import` lines first, then the `/-! ... -/` module docstring.
3. Keep docstrings concise and aligned with what the file proves.
4. Add the import to `Infomaterial.lean` in dependency order.
5. Use LSP diagnostics while editing, then run `make check` before calling the
   change integrated.

## Documentation Boundaries

The three documentation layers have different jobs:

- Corpus: generative source and far frontier.
- Blueprint: precise proved/open claim graph.
- Verso: reader-facing exposition for material that has been formalized.

`docs/blueprint/` is intentionally source-only unless a real publication build
is needed. Do not run `leanblueprint new` over it; that would overwrite the
authored scaffold.

## Notes For Contributors

- Keep `Infomaterial/` free of imports from tooling modules under `scripts/`.
- Prefer deriving local structures over importing or aliasing familiar ones.
- Treat `_archive/` as evidence and prior art, not active project shape.
- If a local procedure is wrong, fix the Makefile or package script so the next
  contributor gets the same corrected contract.
