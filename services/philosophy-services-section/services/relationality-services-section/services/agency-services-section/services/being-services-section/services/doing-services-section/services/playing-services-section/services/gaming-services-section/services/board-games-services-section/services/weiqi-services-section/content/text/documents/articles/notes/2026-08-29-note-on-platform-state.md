---
title: Platform State
description: "Audience: the 561 Group board and future implementing agents. The verified, as-of-2026-08-29 state of every app in this section (kernel, weiqi-web, weiqi-lsp, weiqi-learn): what exists and works, actual test results, the unreconciled two-parallel-Learn-apps situation, the deployment chain, and the status of every open platform-plan decision gate as found by this session's codebase and infrastructure survey."
date-created: 2026-08-29
date-updated: 2026-08-29
type: text
authors:
  - claude-sonnet-5
keywords: ["weiqi", "platform", "status", "testing", "deployment"]
---


Session provenance: this note reports the findings of a 2026-08-29 codebase-and-infrastructure survey run by subagents of this working session — every claim below was checked directly against the repository and, where noted, against the live deployed site, not taken from prior documentation. Read alongside [Reframe and Standards](2026-08-29-note-on-reframe-and-standards.md), which supplies the framing this note's findings should be read under, and [Upstream Integration](2026-08-29-note-on-upstream-integration.md), which covers reusable infrastructure this section has not yet drawn on.

## What exists and works

### apps/weiqi-kernel

`@lenticule-science/weiqi-kernel`: pure, dependency-free TypeScript (`.mts`, Node-native type-stripping, no build step). Implements all five rulesets from [Rulesets](../teaching-articles/references/rulesets.md) as declared data with correct ko/superko regime handling (simple, positional, situational), suicide legal/illegal per ruleset, area and territory scoring with seki-aware flood fill, handicap point tables for 9/13/19 (including 19×19's non-monotonic tengen inclusion), a full recursive-descent SGF parser/serializer with variation trees, and a semantic event layer (`events.mts`) that annotates moves with glossary-linked events (atari, capture, ko-started/resolved, connection, eye-formed, group-killed, pass, game-ended). The five rulesets, exactly as declared:

| Ruleset | Ko regime | Suicide | Scoring | Komi | Handicap |
|---|---|---|---|---|---|
| Chinese | positional superko | illegal | area | 7.5 | fixed star points |
| Japanese | simple ko only | illegal | territory | 6.5 | fixed star points |
| AGA | situational superko | illegal | area or territory (pass-stone reconciled) | 7.5 area / 6.5 territory | fixed star points |
| New Zealand | positional superko | legal (any size) | area | 7 | fixed star points |
| Ing | positional superko | illegal | area | 8 | fixed star points |

Full exported API surface, as verified against source: `Game` (`play(move)`, `isLegal(move)`, `history`, `activeKoPoint`, `mainPhaseEnded`), `Position` (immutable), `createEmptyPosition`, `applyStonePlacement`, `applyPass`, `RULESETS`/`getRuleset`, `handicapPoints`, `computeTerritory`/`scoreArea`/`scoreTerritory`/`removeDeadStones`, `parseSgfCollection`/`serializeSgfCollection`/`gameRecordToSgf`/`sgfToGameRecord`, `boardHash`/`situationalHash`, `findGroup`, `coordToPoint`/`pointToCoord`. Deliberately not implemented: cut, false-eye, seki, and group-settled detection — these need a real life-and-death solver, which the kernel disclaims rather than fakes with a one-move diff. Of everything this section built, the kernel matches its own constitution and the original platform plan most faithfully — the least-drifted piece of the whole build. Test result: **71/71 passing** (~0.7s).

### apps/weiqi-web

`@lenticule-science/weiqi-web`: a static, zero-dependency client served over `node:http`. This is the app actually deployed to weiqi.561.group. It offers a four-rung Capture Go onboarding ladder (7×7→9×9, japanese ruleset) against four scripted bot tiers (random, greedy-capture, liberty-counting "Watchful", influence-heuristic "Reaching"), verified in strength order (random < greedy < influence < liberty) via a 240-game round-robin; 44 kernel-verified tsumego problems across three difficulty bands with a vendored FSRS-lite spaced-repetition scheduler; one interactive lesson (`weiqi-overview.md`, ported — the other three, `living-groups-and-eyes.md`, `komi-and-handicap.md`, and `weiqi-history.md`, are not yet converted to interactive form); and a compiled glossary (20 terms) with hover-cards throughout. The board renderer itself supports 7/9/13/19, but the onboarding ladder only ever exercises 7 and 9 — 13 and 19 are reachable in the renderer, not in any shipped play flow. It has **no human-vs-human play, no accounts, no server-side game state, and no ratings** — Black always plays the bot. Scoring UI, SGF import/export, and engine integration are all absent (a `setTerritory` rendering path exists but is unwired); byo-yomi timing has a sound primitive scaffolded but no wired countdown UI. Test result: build succeeds, **168/168 passing** (~4.5s).

### apps/weiqi-lsp

**Not a language server for Go game data.** As built and specified, `weiqi-lsp` is a doctrine-conformance checker/linter for this section's own markdown+JSON corpus, checked against the kernel: diagram legality, `expected:`-block score/claim verification, SGF-block validity, markdown link and `termRef` resolution, frontmatter conformance by content `type`, and app-data (tsumego/lessons JSON) legality. Two transports share one verification core (`src/run.mjs`): a CLI (`scripts/check.mjs`) and an LSP-over-stdio server (`scripts/server.mjs`). `SPEC.md` catalogs rules WQ001–WQ054 across six rule families with explicit, disclosed deviations and known-limitations (most notably: seki/dead-stone status claims are permanently unverifiable without a life-and-death solver, which neither the kernel nor the checker implements). It was authorized by the owner's 2026-08-19 directive ([Weiqi LSP Authorization](2026-08-19-note-on-weiqi-lsp-authorization.md)) and constituted by its own [Weiqi LSP Constitution](weiqi-lsp-constitution.md). See [Reframe and Standards](2026-08-29-note-on-reframe-and-standards.md) for this session's proposed refit direction toward an *actual* SGF/diagram language server, gated on that constitution's amendment process. Test result (before this session's edits): **137/139 passing**, both failures in `test/regression-corpus.test.mjs` and both corpus-drift, not rule bugs — see "Test results" below.

### services/weiqi-platform (weiqi-learn)

`services/weiqi-platform` is a covered services-section with two declared cover members: `weiqi-platform-learn-service` (ADMITTED, materialized at `services/weiqi-platform/apps/weiqi-learn`) and `weiqi-platform-play-service` (DECLARED, NOT ADMITTED — withheld pending a board Phase-2 authorization that has not been recorded). `apps/weiqi-learn` is a second, independent, constitutionally-licensed Learn face: board, tutorial, tsumego player, and glossary hover-cards, built on the same kernel with its own build-strip pipeline, browser-ready plain `.mjs`. It is **not deployed** anywhere. Test result: build succeeds, **121/121 passing**.

## Test results (as run 2026-08-29, before this session's edits)

| App | Result |
|---|---|
| apps/weiqi-kernel | 71/71 pass (~0.7s) |
| apps/weiqi-web | build + 168/168 pass (~4.5s) |
| apps/weiqi-lsp | 137/139 pass — 2 failures, both `test/regression-corpus.test.mjs`, both corpus drift: (1) hard-coded expected corpus file count 45 vs actual 46; (2) a `date-updated`-only message assertion had drifted against the corpus's actual WQ044 firings (which also cite missing `type`, `date-created`, and `authors` on two older-format dated notes) |
| services/weiqi-platform/apps/weiqi-learn | build + 121/121 pass |

This session's edits add new corpus files and update `weiqi-lsp`'s own tests accordingly; see this note's companion edits for the resulting counts, and the working session's final report for the post-edit numbers.

## The two-parallel-Learn-apps situation

Two independent, cross-unaware Learn/Play client apps exist side by side: `apps/weiqi-web` (deployed, feature-richer — the onboarding ladder, tsumego SRS, bot tiers — but with **no constitution record anywhere** authorizing it) and `services/weiqi-platform/apps/weiqi-learn` (constitutionally chained to the Learn constitution, minimal, undeployed). The governance apparatus authorized exactly one Learn app (`weiqi-learn`), and the unauthorized one (`weiqi-web`) is the one actually serving traffic at weiqi.561.group. Nobody has reconciled this; the platform plan itself names it as "a decision for whoever owns the section next," and it remains exactly that as of 2026-08-29.

## Deployment chain (verified live, not stale)

weiqi.561.group is live and serving current content — checked byte-for-byte against source (`index.html`, `js/play-app.mjs`, `js/board.mjs`, `data/glossary.json` are identical live vs. repository). The chain: `apps/weiqi-web` (built via `scripts/build-kernel.mjs`/`scripts/build-glossary.mjs`, served by `scripts/serve.mjs`) → a `node:24-slim` Docker image (`CMD node scripts/serve.mjs`, `PORT` env, binds `0.0.0.0`) → Cloud Run (`gcloud run deploy weiqi ... --region us-central1 --min-instances 0 --max-instances 2 --cpu 1 --memory 256Mi`, origin `weiqi-1019481907460.us-central1.run.app`) → a Cloudflare Worker reverse proxy (`cloudflare-router-561-group`, in `engineering-services-section/.../cloudflare-services-section/services/cloudflare-router/`) that rewrites `Host: weiqi.561.group` onto the Cloud Run origin. The deploy runbook records a clean deploy on 2026-08-20. This is **Cloud Run + Cloudflare-as-router**, not the Cloudflare-native (Workers + Durable Objects + D1 + R2) architecture the platform plan recommended — see "Open decision gates," gate 3, below. weiqi is one of twelve services on the same fleet pattern (play, crucible, solitaire, gambling-trainer, ruinfold, durante, farstone, aletheon, stoke, parlor, tidepool), all `min-instances 0`; weiqi itself is stateless (no GCS persistence env var, unlike farstone/aletheon/ruinfold/durante/tidepool). One further fleet member, `equivo`, is design-only — a documented gap on the fleet, not specific to weiqi, but worth naming here since the Learn app's own content pipeline separately borrows "the Equivo discipline" as a verification-methodology name (see [Go-Science History](2026-08-29-note-on-goscience-history.md) §5) despite `equivo` itself never having shipped code.

## Designed vs. built, and git history

**Designed** (per the platform plan): a Cloudflare-first architecture — Workers plus static assets, a Durable Object per live game, D1 for accounts/ratings, R2 for SGF/media, Workers AI for review prose, with a separate bare-metal box reserved for KataGo — serving three faces (Play, Learn, Read) over one concept graph, phased 0 (hygiene) → 1 (Learn) → 2 (Play) → 3 (Understand/engines) → 4 (Belong/community).

**Built**: only Phase-1 Learn territory, deployed as a `node:24-slim` Cloud Run static server (the same pattern as `play.561.group`'s fleet), not the Cloudflare-native architecture above (see gate 3 below). Two independent Learn implementations exist because two different sessions built them without cross-awareness (§"The two-parallel-Learn-apps situation"). `weiqi-lsp` was never in the original plan at all — it was added later, once the checker's founding incident occurred, and is properly constituted and functioning per its own later-authored spec. Phase-0 hygiene work is done and verified consistent: `provenance-policy.md`, `rulesets.md`, and `regression-positions.md` are all dated 2026-08-19, and the kernel's `RULESETS` table and its R1–R13 regression tests correspond to those documents exactly, cell for cell.

**Git history, as of this session's start**: only three commits in the repository's current history touch this section at all — `375d33adea6` (2026-08-21, the philosophy/relationality tree move), `023cd2c8ce2` (2026-08-21, the `@red-cup-science` → `@lenticule-science` package-scope rename), and `ba929ccf11d` (2026-08-25, the `tags:` → `keywords:` frontmatter-key rename). All three are confirmed content-neutral for weiqi (pure path/name/key renames — see [Engineering History](2026-08-29-note-on-engineering-history.md) §1 for the git-verified detail on the first two). The tree was otherwise clean and untouched between 2026-08-25 and this session's own edits.

## Open decision gates (status as found)

From the Weiqi Platform Plan's "Board decisions requested," verbatim gate numbering:

1. **Platform placement and the two child-section constitutions (kernel, platform app).** RESOLVED 2026-08-18 (board); constitutions dated 2026-08-19. Kernel naming closed by addendum (materialized at `apps/weiqi-kernel`, bare name, no `-service` suffix). The platform section's own naming (`weiqi-platform` vs. `weiqi-platform-services-section`) is explicitly **not** settled.
2. **Domain choice** (weiqi.561.group vs. a dedicated domain). Still open constitutionally; settled operationally (deployed at weiqi.561.group) but never recorded as a board decision.
3. **Cloudflare-first architecture.** Still open. What was built is Cloud Run/`node:http` behind a Cloudflare router, not the Workers + Durable Objects + D1 + R2 architecture the plan recommended.
4. **Public-license posture.** Still open; everything remains `"UNLICENSED"`, `private: true`.
5. **Education-first sequencing** (Phase 1 Learn before Phase 2 Play). Was CONFIRMED/DISCHARGED via the platform constitution's cover mechanism (Learn admitted, Play withheld) — but see [Reframe and Standards](2026-08-29-note-on-reframe-and-standards.md): this session records it as **superseded by owner direction, pending board ratification.**

Additional named gates, unresolved: Play-face admission ("must refuse to admit the Play face until Phase 1 has shipped and the board has separately authorized Phase 2" — no such authorization is recorded); and the two-parallel-Learn-apps reconciliation described above, which the plan itself leaves to "whoever owns the section next."
