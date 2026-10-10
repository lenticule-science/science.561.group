# Obsmetrologia

Obsmetrologia is a dependency-free Lean 4 library: Lean core, no Mathlib, no
external Lake packages. The repository root is also the Lake package root and
the Node package root.

It is a pure-mathematics package. Applications import its declarations from
their own enterprise packages; an absent application is neither a mathematical
defect nor an invitation to add the application here. Exact corrections are
enforced by `package-scope.json` and `make check`.

The library is not a conventional import of familiar subject areas. Its import
spine is the current derivation order for the local corpus: primitive marks,
articulation, language, calculus, sites, closure, cohomology, dynamics,
persistence, relational matter, thermodynamics, and computing surfaces.

```sh
cd lib/emsenn/src/lib/obsmetrologia
```

Toolchain: `leanprover/lean4:v4.31.0`.

## Verification

The local contract is small:

```sh
make doctor
make mcp
make build
make check
```

`make mcp` starts the `obsmetrologia-lean-lsp` MCP server. `make check` runs
`lake build` and then `lake exe checknames`. The `checknames` gate rejects
declaration names that claim an `iff` or equality shape without delivering
that connective in the statement.

Project audits are exposed through the private Node package:

```sh
pnpm run lean:audit
pnpm run lean:audit:packaging
pnpm run lean:audit:blueprint
pnpm run lean:audit:frontier
```

Those audits currently cover:

| Audit | What It Checks |
| --- | --- |
| `lean:audit:packaging` | The package spine, top-level module directories, and stale path/import drift. |
| `lean:audit:blueprint` | Blueprint claim-site incidence plus Lean witness matching and status drift. |
| `lean:audit:frontier` | Remaining `sorry` sites and hard trust surfaces such as `axiom`, `constant`, `opaque`, and `native_decide`. |
| `lean:audit:surfaces` | Cross-surface drift across Lean, Blueprint, and Verso through this package's own `scripts/audit-cross-surfaces.mjs` audit. |

The frontier audit allows known `sorry` sites to remain visible, but fails on
hard trust surfaces. Generated audit reports are written under
`sites/docs/coverage/`, which is intentionally ignored.

## CI

The GitHub Actions workflows assume this directory is the repository root.

| Workflow | Trigger | Purpose |
| --- | --- | --- |
| `.github/workflows/lean-ci.yml` | push, pull request, manual | Frequent gate: Lean build, `make check`, packaging audit, frontier trust audit. |
| `.github/workflows/lean-audit.yml` | weekly, manual | Infrequent gate: independent Lean checkers (`leanchecker`, `nanoda`) plus the project audit suite and uploaded coverage artifacts. |

The CI deliberately does not publish Verso or Blueprint documentation. This is
a private project; the useful remote work is long checking and artifact capture,
not public docs deployment.

## Project Map

| Path | Role |
| --- | --- |
| `Obsmetrologia.lean` | Root import file and dependency order. |
| `Obsmetrologia/` | Active Lean modules. |
| `docs/blueprint/` | Formal frontier and claim graph source. |
| `docs/verso/` | Reader-facing exposition for formalized material. |
| `scripts/CheckNames.lean` | Lean naming-honesty gate. |
| `scripts/*.mjs` | Node audit and coverage tools owned by this package. |
| `_archive/` | Prior attempts and reference material, not active build input. |
| `AGENTS.md` | Short operating contract for automated Lean work here. |
| `CLAUDE.md` | Mathematical and house-style orientation. |

Use `Obsmetrologia.lean` as the source of truth for import order.

## Package Shape

The Lean and Node packages describe the same versioned project:

| File | Contract |
| --- | --- |
| `lakefile.toml` | Lean package and library identity. |
| `lean-toolchain` | Exact Lean release used to elaborate the library. |
| `package.json` | Private Node package for operational commands and audit tools. |

Versioning should treat `lean-toolchain` changes as significant: changing Lean
changes the elaboration environment. Keep the npm package private until there is
a deliberately exported runtime surface; today it is an operations wrapper.

## Working Loop

For Lean proof work:

1. Read `AGENTS.md`.
2. Read the relevant part of `CLAUDE.md`.
3. Read the corpus node being formalized. Do not infer content from a slug.
4. Use the `obsmetrologia-lean-lsp` MCP server for diagnostics, hovers, local
   search, term goals, tactic trials, and axiom checks.
5. Run `make check` before calling a proof change integrated.

For a new Lean module:

1. Place it under the `Obsmetrologia/` stratum that generates it.
2. Put imports first, then the module docstring.
3. Add the import to `Obsmetrologia.lean` in dependency order.
4. Keep Blueprint and Verso claims aligned with what Lean actually proves.

## Documentation Boundary

The documentation layers have different jobs:

| Layer | Role |
| --- | --- |
| Corpus | Generative source and far frontier. |
| Blueprint | Precise proved/open claim graph. |
| Verso | Reader-facing exposition for formalized material. |

Keep `docs/blueprint/` source-authored. Do not run `leanblueprint new` over it;
that would overwrite the scaffold.
