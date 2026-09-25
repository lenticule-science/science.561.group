---
title: "Language sub-domain consolidation: collapsing 11 language packages into @emsenn/language"
description: "Design, assembly, rewiring, and isolated verification for collapsing the language-* packages and per-language algebras into a single @emsenn/language package with role and per-language subpaths."
date: 2026-06-15
status: salvaged-from-tmp
source: "/tmp/claude-1001/-home-emsenn-561-group/e5fced88-124c-4481-a94f-3939e05f74d5/tasks/w9t589c7l.output"
date-created: 2026-06-15
---

# Language sub-domain consolidation

**Summary:** Collapse `language-*` + per-language algebras into `@emsenn/language` (role + per-language subpaths); rewire; dedup; additive; isolated verify.

The consolidation design names these subpaths:

`./algebra ./analysis ./codecs ./geometry ./logic ./topology ./conformance ./english ./english/codecs ./latin ./lakota ./tokipona`

## Design

### Subpaths (subpath ← source dirs)

| subpath | from dir |
| --- | --- |
| `./algebra` | `lib/language-algebra` |
| `./analysis` | `lib/language-analysis` |
| `./codecs` | `lib/language-codecs` |
| `./geometry` | `lib/language-geometry` |
| `./logic` | `lib/language-logic` |
| `./topology` | `lib/language-topology` |
| `./conformance` | `lib/language-conformance-topology` |
| `./english` | `lib/english-language-algebra` |
| `./english/codecs` | `lib/english-language-codecs` |
| `./latin` | `lib/latin-language-algebra` |
| `./lakota` | `lib/lakota-language-algebra` |
| `./tokipona` | `lib/tokipona-language-algebra` |

### Import map (external consumer view: old specifier → new specifier)

| from | to |
| --- | --- |
| `@emsenn/language-algebra` | `@emsenn/language/algebra` |
| `@emsenn/language-analysis` | `@emsenn/language/analysis` |
| `@emsenn/language-codecs` | `@emsenn/language/codecs` |
| `@emsenn/language-geometry` | `@emsenn/language/geometry` |
| `@emsenn/language-logic` | `@emsenn/language/logic` |
| `@emsenn/language-topology` | `@emsenn/language/topology` |
| `@emsenn/language-topology/types` | `@emsenn/language/topology` |
| `@emsenn/language-topology/charge` | `@emsenn/language/topology` |
| `@emsenn/language-topology/articulating` | `@emsenn/language/topology` |
| `@emsenn/language-topology/descending` | `@emsenn/language/topology` |
| `@emsenn/language-topology/construing` | `@emsenn/language/topology` |
| `@emsenn/language-topology/parsing` | `@emsenn/language/topology` |
| `@emsenn/language-topology/cohomology` | `@emsenn/language/topology` |
| `@emsenn/language-conformance-topology` | `@emsenn/language/conformance` |
| `@emsenn/language-conformance-topology/types` | `@emsenn/language/conformance` |
| `@emsenn/language-conformance-topology/rules` | `@emsenn/language/conformance` |
| `@emsenn/language-conformance-topology/detect` | `@emsenn/language/conformance` |
| `@emsenn/language-conformance-topology/report` | `@emsenn/language/conformance` |
| `@emsenn/english-language-algebra` | `@emsenn/language/english` |
| `@emsenn/english-language-algebra/bundle` | `@emsenn/language/english/bundle` |
| `@emsenn/english-language-codecs` | `@emsenn/language/english/codecs` |
| `@emsenn/english-language-codecs/types` | `@emsenn/language/english/codecs` |
| `@emsenn/english-language-codecs/realize` | `@emsenn/language/english/codecs` |
| `@emsenn/english-language-codecs/plan` | `@emsenn/language/english/codecs` |
| `@emsenn/english-language-codecs/section` | `@emsenn/language/english/codecs` |
| `@emsenn/english-language-codecs/section-from-text` | `@emsenn/language/english/codecs` |
| `@emsenn/english-language-codecs/model` | `@emsenn/language/english/codecs` |
| `@emsenn/latin-language-algebra` | `@emsenn/language/latin` |
| `@emsenn/lakota-language-algebra` | `@emsenn/language/lakota` |
| `@emsenn/tokipona-language-algebra` | `@emsenn/language/tokipona` |

### Internal dependency edges

- **topology → algebra** (`language-topology/src` imports `@emsenn/language-algebra` ×7; rewrite to relative `../algebra`)
- **logic → algebra, topology** (`language-logic/src` imports `@emsenn/language-algebra` ×2, `@emsenn/language-topology` ×2; rewrite to `../algebra`, `../topology`)
- **analysis → algebra, topology** (`language-analysis/src` imports `@emsenn/language-algebra` ×4, `@emsenn/language-topology` ×13; rewrite to `../algebra`, `../topology`)
- **codecs → algebra, topology** (`language-codecs/src` imports `@emsenn/language-algebra` ×3 [load], `@emsenn/language-topology` ×3 [articulate, tokenize, parse]; rewrite to `../algebra`, `../topology`)
- **conformance → algebra, topology, english** (`language-conformance-topology/src` imports `@emsenn/language-algebra` ×1, `@emsenn/language-topology` ×13, `@emsenn/english-language-algebra` ×1; rewrite to `../algebra`, `../topology`, `../english`)
- **english → algebra, codecs, topology** (`english-language-algebra/src` imports `@emsenn/language-algebra` ×1, `@emsenn/language-codecs` ×1 [load], `@emsenn/language-topology` ×1; rewrite to `../algebra`, `../codecs`, `../topology`)
- **english/codecs → english, english/bundle, algebra, analysis, codecs, topology** (`english-language-codecs/src` imports `@emsenn/english-language-algebra` [default], `@emsenn/english-language-algebra/bundle` [rawBundle], `@emsenn/language-algebra` ×4, `@emsenn/language-analysis` ×1, `@emsenn/language-codecs` ×1, `@emsenn/language-topology` ×3; rewrite to `../english`, `../english/bundle.mjs`, `../algebra`, `../analysis`, `../codecs`, `../topology`)
- **latin → algebra, codecs, topology, analysis** (`latin-language-algebra/src` imports `@emsenn/language-algebra` ×1, `@emsenn/language-codecs` ×1 [load], `@emsenn/language-topology` ×1, `@emsenn/language-analysis` ×1; rewrite to `../algebra`, `../codecs`, `../topology`, `../analysis`)
- **lakota → algebra, codecs, topology** (`lakota-language-algebra/src` imports `@emsenn/language-algebra` ×1, `@emsenn/language-codecs` ×1 [load], `@emsenn/language-topology` ×1; rewrite to `../algebra`, `../codecs`, `../topology`)
- **tokipona → algebra, codecs, topology** (`tokipona-language-algebra/src` imports `@emsenn/language-algebra` ×1, `@emsenn/language-codecs` ×1 [load], `@emsenn/language-topology` ×1; rewrite to `../algebra`, `../codecs`, `../topology`)
- **NOTE:** all cross-member imports rewrite to RELATIVE paths within `@emsenn/language`; never `@emsenn/language/<subpath>` from within (same rule as relationality AGENTS).
  The `@emsenn/language/<subpath>` targets in importMap apply to EXTERNAL consumers only.
- **NOTE:** `language-geometry` imports nothing cross-member (standalone, no internal edges).

### Consumers (6 external)

| dir | name |
| --- | --- |
| `apps/language-computer` | `@emsenn/language-computer` |
| `lib/agent-algebra` | `@emsenn/agent-algebra` |
| `lib/content-topology` | `@561-group/content-topology` |
| `lib/swarm` | `@561-group/swarm` |
| `services/content-farm` | `@561-group/content-farm` |
| `sites/koios.news` | `@561-group/koios.news` |

### Old packages (12)

| dir | name |
| --- | --- |
| `lib/language-algebra` | `@emsenn/language-algebra` |
| `lib/language-analysis` | `@emsenn/language-analysis` |
| `lib/language-codecs` | `@emsenn/language-codecs` |
| `lib/language-geometry` | `@emsenn/language-geometry` |
| `lib/language-logic` | `@emsenn/language-logic` |
| `lib/language-topology` | `@emsenn/language-topology` |
| `lib/language-conformance-topology` | `@emsenn/language-conformance-topology` |
| `lib/english-language-algebra` | `@emsenn/english-language-algebra` |
| `lib/english-language-codecs` | `@emsenn/english-language-codecs` |
| `lib/latin-language-algebra` | `@emsenn/latin-language-algebra` |
| `lib/lakota-language-algebra` | `@emsenn/lakota-language-algebra` |
| `lib/tokipona-language-algebra` | `@emsenn/tokipona-language-algebra` |

### Risks

**SYMBOL COLLISIONS (central risk, resolved by design):** all four per-language algebras (english/latin/lakota/tokipona) export the IDENTICAL top-level surface — `rawBundle`, a `bundle` const, and a default export.
They CANNOT be flattened into one namespace.
Each gets its own subpath (`./english ./latin ./lakota ./tokipona`); the root index re-exports each as a distinct namespace (`export * as latin from "./latin/index.mjs"`, etc.), which keeps the collisions apart.
Do NOT `export *` them into a shared surface.

**DEEP SUBPATHS COLLAPSE (decision + risk):** several members expose granular export subpaths that do NOT survive consolidation — the games/markets precedent is ONE flat `index.mjs` per role subpath.
Collapsed: `language-topology/{types,charge,articulating,descending,construing,parsing,cohomology}`, `conformance/{types,rules,detect,report}`, `english-codecs/{types,realize,plan,section,section-from-text,model}`.
Safe because grep shows every EXTERNAL consumer imports only the bare specifier (no deep-subpath usage outside the members).
The importMap collapses all deep specifiers to the role subpath.
EXCEPTION: `@emsenn/english-language-algebra/bundle` is used internally by `english-codecs/realize.mts` — it stays addressable.
Either keep it as a real public subpath `./english/bundle` (mapped) OR, since it's internal-only, rewrite that one import to relative `../english/bundle.mjs` and drop the public subpath.
Chose to retain `./english/bundle` in the importMap to be conservative; the internal `realize.mts` edge rewrites to relative regardless.

**ENGLISH NESTING:** `./english` ← `english-language-algebra`, `./english/codecs` ← `english-language-codecs` (per task).
`english-codecs` depends on `english-algebra` (default + `/bundle`) → both rewrite to relative (`../english`, `../english/bundle.mjs`).
The consolidated package's own root must NOT shadow: `./english` is the algebra namespace; `./english/codecs` is a sibling export, not a member of the `./english` flat surface.

**STALE DECLARED DEP (drop it):** `english-language-codecs/package.json` declares `@emsenn/language-conformance-topology` as a dependency, but NO src file imports it (verified by grep).
It is a stale dep — do NOT create an internal edge `english/codecs -> conformance`, and do NOT carry the conformance dep into the consolidated package on its account.

**INTERNAL vs EXTERNAL specifiers (most common break):** every cross-member import is rewritten to a RELATIVE path inside `@emsenn/language` (never `@emsenn/language/<subpath>` from within), matching relationality's "relative imports only — never `@emsenn/relating/*` from within" invariant.
The `@emsenn/language/<subpath>` targets in importMap apply ONLY to the 6 external consumers.

**RETAINED EXTERNAL DEPS (conservative dedup vs relationality):** the consolidated package keeps exactly two external runtime deps — `@emsenn/relating` (`workspace:*`, used by `language-algebra` via `@emsenn/relating/topology`; out-of-domain, stays external, do NOT inline) and `@561-group/conformance-topology` (`workspace:*`, used by `language-conformance-topology`; out-of-domain @scope, stays external).
Do not dedup/absorb either; relationality is the shared substrate and must remain a single external dep.

**SUBMODULE MECHANICS:** all 12 members are git submodules (verified in `.gitmodules`).
Consolidation must COPY src trees into `lib/language/src/<subpath>/` (NOT `git-mv`, which fails across submodule boundaries).
For each member: `git submodule deinit -f lib/<member>`, remove its `[submodule]` block from `.gitmodules`, `git rm --cached lib/<member>` (and `rm -rf` the `.git/modules/<member>` gitlink), then copy the src tree in.
The 12 stale submodule registrations and the 12 old package.json names must all be removed from the workspace.

**CONSUMER MIGRATION:** 6 external consumers need both package.json dep swaps (12 distinct old `@emsenn/*language*` deps → single `@emsenn/language`) and src import-specifier rewrites per importMap.
`agent-algebra` also imports `english-language-codecs` (`realizeSection`/`sectionFromText`/`generate` + `SectionRealization`/`SectionSpec`) and conformance (`lint`/`Verdict`); `language-computer` imports the widest surface (8 subpaths).
The per-language default imports (e.g. `import english from "@emsenn/english-language-algebra"`) must become namespace-default imports from `@emsenn/language/english` — verify the consolidated `./english` subpath preserves the default export.

**GEOMETRY HAS NO DEPS:** `language-geometry` has zero dependencies (no relationality, no cross-member).
It contributes `./geometry` with no internal edges — trivial to move, but confirm tsconfig path/project references for it are added like the others.

## Assembled

**dir:** `lib/language` — **ok: true**

Files changed:

- `lib/language/package.json`
- `lib/language/tsconfig.json`
- `lib/language/tsconfig.build.json`
- `lib/language/tsconfig.test.json`
- `lib/language/.gitignore`
- `lib/language/src/index.mts`
- `lib/language/src/algebra/`
- `lib/language/src/analysis/`
- `lib/language/src/codecs/`
- `lib/language/src/geometry/`
- `lib/language/src/logic/`
- `lib/language/src/topology/`
- `lib/language/src/conformance/`
- `lib/language/src/english/`
- `lib/language/src/english/codecs/`
- `lib/language/src/latin/`
- `lib/language/src/lakota/`
- `lib/language/src/tokipona/`

**Notes:**

Built `@emsenn/language` at `lib/language` by COPYING all 12 submodule src trees into `src/<subpath>/` (add-only; no submodule deinit, no `.gitmodules`/consumer/old-member edits — those design sections were canceled by the task's "Do NOT modify old members/.gitmodules/consumers").
Root `src/index.mts` re-exports each subpath as a namespace (lib/games shape): algebra, topology, logic, geometry, analysis, codecs, conformance, english, latin, lakota, tokipona.
Per-language algebras kept as distinct namespaces (no flattening) — default/bundle/rawBundle surfaces preserved on each subpath.
`english/codecs` is a sibling subpath, not nested in the english namespace export (`export *` can't nest; still reachable as `./english/codecs`).

FINAL importMap (subpath → source, public/external view; unchanged from design):

> `./algebra` ← language-algebra; `./analysis` ← language-analysis; `./codecs` ← language-codecs; `./geometry` ← language-geometry; `./logic` ← language-logic; `./topology` ← language-topology (+ collapsed deep subpaths types/charge/articulating/descending/construing/parsing/cohomology); `./conformance` ← language-conformance-topology (+ collapsed types/rules/detect/report); `./english` ← english-language-algebra; `./english/bundle` ← english-language-algebra/bundle (retained as real public subpath); `./english/codecs` ← english-language-codecs (+ collapsed types/realize/plan/section/section-from-text/model); `./latin` ← latin-language-algebra; `./lakota` ← lakota-language-algebra; `./tokipona` ← tokipona-language-algebra.

INTERNAL imports: 73 cross-member specifiers rewritten to RELATIVE paths (never `@emsenn/language/<subpath>` from within), computed per-file from actual directory depth — depth-1 files use `../<role>/index.mjs`; depth-2 dirs (analysis/semantics, conformance/rules, english/codecs) use `../../<role>/index.mjs`.
`english/codecs/realize.mts` → `../bundle.mjs` (english/bundle); `section-from-text.mts` → `../index.mjs` (english default).
Only external specifier left in code: `@emsenn/relating/topology` (`algebra/charge.mts`) — kept external.
`*.test.mts` moved beside code; theorem/test names unchanged.

`package.json`: name `@emsenn/language`; scripts/engines/type/files/sideEffects copied verbatim from language-topology (scripts: clean, check, build, test, audit:boundary, prepack; files: dist, README.md, package.json); exports = lib/games shape with all 13 subpaths + `.
` + `./package.json`. devDeps `@types/node` + typescript (fast-check confirmed ABSENT in all moved tests).
`tsconfig.json`/`.build.json`/`.test.json` + `.gitignore` copied from language-topology.

DEPS DISCREPANCY (flagged per advisor): design's RETAINED-EXTERNAL-DEPS note claims `@561-group/conformance-topology` is "used by language-conformance-topology" — empirically FALSE; grep of src finds it only in a comment string, never imported.
It is a STALE declared dep (same class as the english-codecs→conformance stale dep the design already drops).
Kept it as a declared dependency to honor the design's explicit "exactly two external deps" directive; it is harmless (nothing imports it, so it never participated in the isolation typecheck).
Two declared external deps: `@561-group/conformance-topology` + `@emsenn/relating` (both `workspace:*`).

TYPECHECK (in isolation; throwaway `lib/language/node_modules` symlinking only `@emsenn/relating` → `lib/relating` and `@types/node`, then removed; NO root pnpm install):

- `tsc --noEmit` (tsconfig.json, includes tests) → EXIT 0
- `tsc -p tsconfig.build.json --noEmit` (no tests) → EXIT 0
- `tsc -p tsconfig.test.json --noEmit` (tests) → EXIT 0

No failures.
(`.gitmodules` M and `lib/language-algebra` m in git status are PRE-EXISTING from the session-start snapshot — `.gitmodules` diff contains no language entries — not produced by this task.)

## Rewired consumers

### `apps/language-computer` — ok: true

Files changed: `apps/language-computer/src/index.mts`, `apps/language-computer/package.json`

Rewired `@emsenn/language-computer` to consume the unified `@emsenn/language` package.

Imports (`src/index.mts`, quote-anchored per the map): language-topology → language/topology; language-algebra → language/algebra; language-logic → language/logic; language-analysis → language/analysis; language-geometry → language/geometry; language-conformance-topology → language/conformance; english-language-codecs → language/english/codecs; english-language-algebra → language/english.
The english-language-algebra vs language-algebra distinction was handled correctly via quote anchoring.

Other source files: `src/cli.mts` and `src/index.test.mts` contain no `@emsenn` language-domain imports (verified by grep) — unchanged.
The only residual `language-` string in src is a descriptive doc comment in `index.mts` (the app's own synopsis), not an import specifier.

`package.json`: all nine dependencies were language-domain members; they all collapsed into a single `"@emsenn/language": "workspace:*"`.
No non-language deps existed in dependencies, so nothing else to keep there. devDependencies (`@types/node`, typescript) untouched.

`dist/*.mjs` and `.tmp/*.mjs` are untracked build artifacts (regenerated by the pnpm build step, confirmed via `git ls-files` returning empty) — intentionally not edited; src-only is correct.

Did not touch `.gitmodules`.
No pnpm install run; the `@emsenn/language` workspace symlink is not yet present in this app's node_modules, so a subsequent `pnpm install` is needed before tsc/build will resolve the new specifiers — this is expected and not a defect of the edits.
All eight target export subpaths (topology, algebra, logic, analysis, geometry, conformance, english/codecs, english) exist in `lib/language/package.json`.

### `lib/agent-algebra` — ok: true

Files changed: `lib/agent-algebra/src/language.mts`, `lib/agent-algebra/package.json`

Rewired `@emsenn/agent-algebra` to consume `@emsenn/language`.

Source imports (quote-anchored, only file with language-domain import specifiers was `src/language.mts`):

- line 27: `"@emsenn/english-language-codecs"` → `"@emsenn/language/english/codecs"`
- line 28: `"@emsenn/language-conformance-topology"` → `"@emsenn/language/conformance"`

No other `.mts`/`.mjs` source files imported any language-domain package.
Test files (`*.test.mts`) contained no such imports either.

A prose mention of `@emsenn/english-language-codecs` inside a backtick doc comment on `src/language.mts` line 6 was intentionally left untouched — it is not a quote-anchored import specifier.

`package.json` dependencies: replaced the two language-domain members (`@emsenn/english-language-codecs`, `@emsenn/language-conformance-topology`) with a single `@emsenn/language` (`workspace:*`); kept `@emsenn/relating` (`workspace:*`). devDependencies untouched.

`.gitmodules` not touched.
Did not run install/build (no instruction to).
Verified target `@emsenn/language` package (`lib/language/package.json`) exports the `./english/codecs` and `./conformance` subpaths used.

### `lib/content-topology` — ok: true

Files changed: `lib/content-topology/src/copyedit.mts`, `lib/content-topology/src/gates.mts`, `lib/content-topology/package.json`

Rewired `@561-group/content-topology` to consume `@emsenn/language`.

Import map applied to all `.mts`/`.mjs` under src/.
Only two source occurrences existed, both the bare specifier `"@emsenn/language-conformance-topology"` (no subpath), rewritten to `"@emsenn/language/conformance"`:

- `src/copyedit.mts:38` `import { lint } from "@emsenn/language/conformance";`
- `src/gates.mts:11` `import { lint } from "@emsenn/language/conformance";`

No other language-domain specifiers (language-algebra/analysis/codecs/geometry/logic/topology, english/latin/lakota/tokipona, or conformance sub-subpaths) appeared in any `.mts`/`.mjs`.
`dist/*.mjs` were left untouched (build artifacts, not source).

`package.json`: replaced the single language-domain member dep `"@emsenn/language-conformance-topology": "workspace:*"` with `"@emsenn/language": "workspace:*"`.
Kept `"@emsenn/relating": "workspace:*"` and all devDependencies unchanged.

Verified: zero remaining old language-domain refs in src; target package `@emsenn/language` exists at `lib/language` and exposes the `./conformance` export subpath (and `.
`), so the new specifier resolves.
`.gitmodules` not touched.

### `lib/swarm` — ok: true

Files changed: `lib/swarm/src/cognition.mts`, `lib/swarm/src/work.mts`, `lib/swarm/package.json`

Rewired `@561-group/swarm` to consume `@emsenn/language`.

Source imports (quote-anchored, only 2 of ~130 `.mts`/`.mjs` files contained language-domain imports; `bin/swarm.mjs` had none):

- `src/cognition.mts`: `"@emsenn/language-conformance-topology"` → `"@emsenn/language/conformance"`; `"@emsenn/english-language-codecs"` → `"@emsenn/language/english/codecs"`
- `src/work.mts`: `"@emsenn/english-language-codecs"` → `"@emsenn/language/english/codecs"`

`package.json` dependencies: replaced the two language-domain members (`"@emsenn/language-conformance-topology"`, `"@emsenn/english-language-codecs"`) with a single `"@emsenn/language": "workspace:*"`.
All other deps untouched.

Verification: grep for any remaining `@emsenn/language-*` / `@emsenn/{english,latin,lakota,tokipona}-language` specifiers in src/bin/package.json returns no matches.
Confirmed `lib/language/package.json` exports both needed subpaths (`./conformance` and `./english/codecs`).
`dist/` build output left as-is (regenerated by build).
`.gitmodules` not touched.

### `services/content-farm` — ok: true

Files changed: `services/content-farm/package.json`

Rewired `@561-group/content-farm` to consume `@emsenn/language`.

`package.json`: replaced the single language-domain member dep `"@emsenn/language-conformance-topology": "workspace:*"` with `"@emsenn/language": "workspace:*"`.
All other deps (content-server, content-topology, content-codecs, syndication-codecs, web-server) left untouched.
Verified `@emsenn/language` (`lib/language`) exists as a workspace package and exposes the `./conformance` export the old conformance-topology dep mapped to.

Import map: applied to every `.mts`/`.mjs` under src/ and scripts/.
No source files imported any language-domain package (grep for `@emsenn/language-*`, `@emsenn/english-language*`, latin/lakota/tokipona-language* returned nothing).
The only language-domain reference in the whole package was the package.json dependency, so no quote-anchored source rewrites were necessary.
`dist/` files are build output and were not touched.

ok: change builds on existing `@emsenn/language` conformance subpath export; no functional code paths needed remapping.

### `sites/koios.news` — ok: true

Files changed: `sites/koios.news/package.json`

Rewired `@561-group/koios.news` to consume the consolidated `@emsenn/language` package.

`package.json`: replaced the single language-domain member dependency `"@emsenn/language-conformance-topology": "workspace:*"` with `"@emsenn/language": "workspace:*"`.
No other language-domain deps were present; all non-language deps (`@561-group/content-farm`, content-codecs, content-topology, newsroom, newswire, web-theming, `@emsenn/web-server`) kept unchanged.

Import map: applied to every `.mts`/`.mjs` in the site.
The three such files (`working/researching/scripts/new-brief.mjs`, `working/editing/scripts/lint-post.mjs`, `working/writing/scripts/new-post.mjs`) import only `node:` builtins — they contain zero language-domain imports, so no quote-anchored rewrites were applicable.
Confirmed no language-domain import specifiers exist anywhere in the site's source (`.mts`/`.mjs`/`.ts`/`.tsx`) outside package.json.

Verified the target `@emsenn/language` package (`lib/language/package.json`) exposes `./conformance` (and `./algebra`, `./analysis`, `./codecs`, `./geometry`, `./logic`, `./topology`, `./english[/bundle,/codecs]`, `./latin`, `./lakota`, `./tokipona`), so the swapped subpath the site would use (`@emsenn/language/conformance`) resolves.
`package.json` re-validated as parseable JSON.
Did not touch `.gitmodules`.

## Verify — ok: true

`@emsenn/language` typechecks CLEAN in isolation.
`tsc --noEmit` exited 0 with no diagnostics (empty stdout).

Command tail:

```
$ node <root>/node_modules/typescript/lib/tsc.js --noEmit -p tsconfig.json
(no output)
EXIT=0
```

Method (no root pnpm install): created a throwaway `/home/emsenn/561-group/lib/language/node_modules` with three symlinks — `@emsenn/relating` → `/home/emsenn/561-group/lib/relating` (its built dist + package.json exports), `@types/node` → `node_modules/.pnpm/@types+node@22.19.20/.../@types/node`, typescript → root typescript@5.9.3.
Ran the package's own `tsconfig.json` (the `check` target = bare `tsc --noEmit`; `src/**/*.mts` including `.test.mts`). tsconfig sets `types:["node"]`, so no extra ambient `@types` could leak in — the isolated program is no more lenient than a real install on that axis.

Verification it was a real check, not a no-op: `--listFilesOnly` showed all 81 `src/*.mts` files in the program and the lone workspace import `"@emsenn/relating/topology"` resolved to `relationality/dist/topology/*.d.mts`.
The other declared dep `@561-group/conformance-topology` is NOT imported anywhere in src, so tsc never needs it (and its dist isn't built).

Caveat: clean against relationality's CURRENTLY BUILT dist (the sanctioned `lib/<dep>/dist` source). relationality has uncommitted src changes, so its dist may be stale vs its current source — but per task instructions dist is the prescribed dependency source, so this is the intended method.

Cleanup done: `lib/language/node_modules` removed.
No files in the package were modified (`lib/language` remains untracked in git as it was before).

Relevant paths:

- `/home/emsenn/561-group/lib/language/package.json`
- `/home/emsenn/561-group/lib/language/tsconfig.json`
- `/home/emsenn/561-group/lib/relating/dist/topology/index.d.ts` (resolved dep)

**Diagnosis:** none — clean (exit 0, zero diagnostics; no file:line to report).

## Decommission targets (12 old packages, dirs/names)

| dir | name |
| --- | --- |
| `lib/language-algebra` | `@emsenn/language-algebra` |
| `lib/language-analysis` | `@emsenn/language-analysis` |
| `lib/language-codecs` | `@emsenn/language-codecs` |
| `lib/language-geometry` | `@emsenn/language-geometry` |
| `lib/language-logic` | `@emsenn/language-logic` |
| `lib/language-topology` | `@emsenn/language-topology` |
| `lib/language-conformance-topology` | `@emsenn/language-conformance-topology` |
| `lib/english-language-algebra` | `@emsenn/english-language-algebra` |
| `lib/english-language-codecs` | `@emsenn/english-language-codecs` |
| `lib/latin-language-algebra` | `@emsenn/latin-language-algebra` |
| `lib/lakota-language-algebra` | `@emsenn/lakota-language-algebra` |
| `lib/tokipona-language-algebra` | `@emsenn/tokipona-language-algebra` |
