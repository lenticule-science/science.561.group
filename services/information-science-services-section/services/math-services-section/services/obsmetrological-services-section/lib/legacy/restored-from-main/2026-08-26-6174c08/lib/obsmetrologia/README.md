# Obsmetrologia

Obsmetrologia is a dependency-free Lean 4 library: Lean core, no Mathlib, no
external Lake packages. The package directory is both the Lake package root and
the Node package root, and is tracked directly inside the `emsenn/info`
monorepo.

It is a pure-mathematics package. Applications import its declarations from
their own enterprise packages; an absent application is neither a mathematical
defect nor an invitation to add the application here. Exact corrections are
enforced by `package-scope.json` and `make check`.

The library is not a conventional import of familiar subject areas. Its import
spine is the current derivation order for the local corpus: primitive marks,
articulation, language, calculus, sites, closure, cohomology, dynamics,
persistence, relational matter, thermodynamics, and computing surfaces.

From the monorepo root:

```sh
cd lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia
```

Toolchain: `leanprover/lean4:v4.31.0`.

## Verification

The local contract is small:

```sh
make build
make check
```

`make check` is the one real gate: `lake build`, the `checknames` naming-honesty
gate (rejects declaration names that claim an `iff` or equality shape without
delivering that connective), the `auditfrontier` trust gate (every declaration
depends only on `propext`/`Quot.sound` beyond its documented whitelist entry),
the packaging audit (`scripts/AuditPackaging.py`), and the golden-vector
conformance executable.

Project audits are exposed through the private Node package:

```sh
npm run lean:audit
npm run lean:audit:packaging
npm run lean:audit:frontier
npm run lean:audit:surfaces
npm run lean:audit:blueprint:local
```

Those audits currently cover:

| Audit | What It Checks |
| --- | --- |
| `lean:audit:scope` | `package-scope.json` conformance plus its Node test. |
| `lean:audit:packaging` | The package spine, top-level module directories, and stale path/import drift. |
| `lean:audit:blueprint:local` | Blueprint claim-site incidence plus Lean witness matching and status drift. |
| `lean:audit:frontier` | Remaining `sorry` sites and hard trust surfaces such as `axiom`, `constant`, `opaque`, and `native_decide`. |
| `lean:audit:surfaces` | Cross-surface drift across Lean, Blueprint, and Verso. |
| `collatz:audit:*` | The Collatz frontier's external numeric sweeps (frontier, axioms, parent-gap, denominator-growth). |

`python3 scripts/audit-blueprint-refs.py` additionally validates every
`\lean{...}` reference in the blueprint against the compiled declaration
catalog; it is not yet wired into an npm script.

The frontier audit allows known `sorry` sites to remain visible, but fails on
hard trust surfaces. Generated audit reports are written under
`sites/docs/coverage/`, which is intentionally ignored.

Two audits are known-failing and record real drift, not tooling breakage:
`lean:audit:surfaces` (Verso-manual Lean references that do not resolve against
the current catalog) and `lean:audit:blueprint:local` (blueprint-graph
inconsistencies, including frontier nodes marked red whose Lean side is already
proved). Treat their output as a work queue, not noise.

## CI

No CI is configured for this checkout. Verification is local: `make check`
plus the npm audit suite above. The monorepo does not carry a `.github/`
workflow directory for this package.

## Project Map

| Path | Role |
| --- | --- |
| `Obsmetrologia.lean` | Root import file and dependency order. |
| `Obsmetrologia/` | Active Lean modules. |
| `conformance/` | Golden-vector conformance executable source. |
| `docs/blueprint/` | Formal frontier and claim graph source. |
| `docs/verso/` | Reader-facing exposition for formalized material. |
| `scripts/CheckNames.lean` | Lean naming-honesty gate. |
| `scripts/AuditFrontier.lean` | Lean axiom/trust-surface gate. |
| `scripts/*.mjs`, `scripts/*.py` | Node and Python audit tools owned by this package. |
| `test/` | Node tests for the package-scope contract. |
| `AGENTS.md` | Short operating contract for automated Lean work here. |

Use `Obsmetrologia.lean` as the source of truth for import order.

## Package Shape

The Lean and Node packages describe the same versioned project:

| File | Contract |
| --- | --- |
| `lakefile.toml` | Lean package and library identity. |
| `lean-toolchain` | Exact Lean release used to elaborate the library. |
| `package.json` | Private Node package for operational commands and audit tools. |
| `package-scope.json` | The package's declared scope contract, audited by `lean:audit:scope`. |

Versioning should treat `lean-toolchain` changes as significant: changing Lean
changes the elaboration environment. Keep the npm package private until there is
a deliberately exported runtime surface; today it is an operations wrapper.

## Working Loop

For Lean proof work:

1. Read `AGENTS.md`.
2. Read the corpus node being formalized. Do not infer content from a slug.
3. Use the `obsmetrologia-lean-lsp` MCP server (skill under `.codex/skills/`;
   `npm run lean:mcp:tools` lists its tools) for diagnostics, hovers, local
   search, term goals, tactic trials, and axiom checks.
4. Run `make check` before calling a proof change integrated.

For a new Lean module:

1. Place it under the `Obsmetrologia/` stratum that generates it.
2. Put imports first, then the module docstring.
3. Add the import to the aggregator that owns its stratum, reachable from
   `Obsmetrologia.lean` in dependency order.
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
