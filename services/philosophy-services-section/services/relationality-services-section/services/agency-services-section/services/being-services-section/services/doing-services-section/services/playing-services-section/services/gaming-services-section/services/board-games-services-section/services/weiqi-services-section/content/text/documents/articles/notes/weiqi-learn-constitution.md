---
title: Weiqi Learn Constitution
description: "Audience: the 561 Group board and implementing agents. Constitutes weiqi-platform-learn-service as a singular child service of weiqi-platform-services-section, admitted under the board-approved Weiqi Platform Plan and licensed by the platform constitution's own open obligation: purpose, inputs, outputs, customers, authority, non-ownership, refusal conditions, and the materialization decision, decided from the repository's own service-form rules rather than habit."
date-created: 2026-08-19
date-updated: 2026-08-19
type: specification
authors:
  - claude-fable-5
tags: []
---


Audience: the 561 Group board and agents that will materialize, extend, or consume `weiqi-platform-learn-service`.

Learning goal: know exactly what the Learn service is for, what it may and must refuse, who owns it, and on what authority it exists — before any of its filesystem projections are treated as settled.

## Governance basis

This record uses the same governance basis as its siblings [Weiqi Kernel Constitution](./weiqi-kernel-constitution.md) and [Weiqi Platform Constitution](./weiqi-platform-constitution.md), repeated rather than assumed: `.agents/skills/corpus-normalization/references/service-section-constitution.md` still does not exist anywhere in this repository. This record instead draws on `references/repository-model.md`'s evidence order, the board-approved [Weiqi Platform Plan](./weiqi-platform-plan.md), the board's 2026-08-18 "Board challenge: constituting service sections" note, and the board's 2026-08-11 "standard form" derivation — and, directly, on the [Weiqi Platform Constitution](./weiqi-platform-constitution.md) itself, which named this exact record as an owed act in its "Open obligations": "The Learn service's own constitution record is still owed. This document constitutes the section; it is not a substitute for `weiqi-platform-learn-service`'s own record (purpose/inputs/outputs/customers/authority/non-ownership/refusal conditions at the service level, generative parent = this section). That record — and only after it exists — is what licenses a `services/weiqi-platform/…` (or `apps/…`) directory to appear for the Learn face." This record is that owed act, and its existence is precisely what licenses the materialization decision recorded below.

## Distinct responsibility

Rendering weiqi instruction — a board, interactive lessons, a tsumego player, glossary hover-cards, and a learner's local progress against the concept graph — entirely client-side, with no account and no server round-trip, is a responsibility no existing service owns. `weiqi-kernel` computes rules but must stay pure (no rendering); `weiqi-services-section`'s `content/` holds prose but is not an interactive surface; the sibling Play face (declared, not admitted) is the mirror-image responsibility — authenticated, stateful, keyed and socketed — that the platform constitution's own purity boundary forbids mixing into this one. The platform constitution's Clause-2 cover test already decided the two faces are distinct (§"Form: a services-section, not a singular service"); this record constitutes the Learn half of that decided cover as its own service, on the same grounds the kernel used to constitute itself relative to the section that generates it.

## Generative parent

`weiqi-platform-services-section` (`lib/emsenn/services/561-group/services/science-services-section/services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/services/gaming-services-section/services/board-games-services-section/services/weiqi-services-section/services/weiqi-platform/`, per the materialization decision below).

The 2026-08-11 derivation's Clause 3.3 requires containment to match generation. The platform constitution names the Learn service as the first member of its own declared cover (§"Cover, overlaps, and stratum") and states outright that this section, not `weiqi-services-section` directly, is what "admits" it. Containment therefore runs: `weiqi-services-section` generates `weiqi-platform-services-section` (per that constitution's own "Generative parent"), which in turn generates `weiqi-platform-learn-service` as a declared cover member. No other section generates it, and this record does not re-derive what the platform constitution already settled about the section's own generative parent — it only extends the chain one level.

## Form: a singular service, not a services-section

Applying the same test the kernel and platform constitutions both use: does the candidate decompose into faces with distinct inputs, outputs, and refusal conditions, or does it collapse to one inseparable operation?

The Learn service's own components — board rendering, tutorial flow, tsumego checking, glossary lookup, hover-cards, lesson playback — share one input type (a learner's local navigation/selection plus the kernel's pure computation), one output type (rendered instructional DOM state, held in the browser, never persisted past the session), one test posture (`node:test` over pure logic modules, DOM kept out of module top-level per the house rule), one manifest, one deploy artifact (static assets, "deployable exactly like 561.group," per the plan), and one customer relationship (an anonymous learner, directly; the kernel and the section's corpus, as read-only dependencies). None of these sub-components has a refusal condition distinct from the whole service's own — none independently holds a key, a socket, or a persistent write path, and none is separately gated by the board. This does not glue into a nontrivial cover with overlaps and restriction maps; it is Clause 1.1's single fiber. `weiqi-platform-learn-service` is therefore constituted as a **singular service**, not a `weiqi-platform-learn-services-section` — matching the kernel's own form-finding, not the platform's.

## Purpose

Teach weiqi interactively, entirely client-side, over one shared concept graph: render a board, step a learner through the corpus's lesson template as interactive worked examples, run a graded tsumego player with revealed commentary on request, and surface glossary hover-cards at the moment the kernel's own semantic events make a term relevant — the platform's stated differentiator, applied to its first admitted face. Ships complete and usable on its own, per the plan's education-first sequencing, before any multiplayer complexity is admitted.

## Inputs

- A learner's navigation and selection: which lesson, which tsumego problem, which glossary term, which move to attempt on the board.
- The kernel's pure computation: legality verdicts, resulting positions, scoring, SGF, and the semantic event stream (`weiqi-kernel`, consumed read-only, never reimplemented).
- This section's own corpus content: the lesson template, the seventeen glossary terms, the ontology (rendered as a skill tree), and tsumego problem data — authored in `content/`, consumed here only as rendered data, per the platform constitution's non-ownership clause.
- No account, no server round-trip, no data the render call was not directly handed.

## Outputs

- Rendered board state (SVG board component, themeable, faithful at 9/13/19 with star points, last-move and annotation layers).
- Step-through interactive lessons converted from the corpus's lesson template, including the capture-go ladder tutorial.
- A playable, graded tsumego player with commentary revealed on request.
- Glossary hover-cards, attached wherever rendered content carries a `termRef` back to this section's own corpus.
- A learner's local progress against the concept graph, held client-side only — never a server-persisted record (that is Play-face territory, not admitted).

## Customers

An anonymous or lightly-identified learner needing no account — the plan's explicit Phase 1 target, "no account required" for the first session. Internally, this service is a customer of `weiqi-kernel` (rules, scoring, events) and of `weiqi-services-section`'s own corpus content (lessons, glossary, ontology); it produces no rules content and no corpus content of its own, per the platform constitution's non-ownership clause, which this record inherits rather than restates in full.

## Authority

- **Closed-world signature:** this service may only invoke the kernel's declared public API (`Game`, `getRuleset`, `scoreArea`/`scoreTerritory`, SGF, semantic events with `termRef`, `findGroup`, `boardHash`) and its own declared modules. It holds no network operator, no key operator, no socket operator at all — the purity boundary the platform constitution assigns to the Learn face (§"Authority") is this service's entire declared signature, not a subset of a larger one.
- **Change authority:** UI, interaction, and lesson-rendering decisions are this service's own; rules decisions are never this service's to make. Any disagreement between what this service renders and what the kernel computes is resolved in the kernel's favor, always — per the kernel's own constitution and the platform constitution's restriction on the declared kernel/board/hover-card overlap, which this service must restrict to identically rather than diverge from.
- **Runtime authority:** none beyond what any static client-side asset has. No credentials, no persistent state, no independent authority to act.
- **Non-mutating preview is this service's own to provide.** The kernel's `Game.isLegal(move)` returns a boolean only and offers no non-mutating preview and no capture-go ruleset (per the kernel's public API as constituted); this service's `kernel-bridge` layer supplies both by replaying a scratch `Game` and by layering a capture-go win condition over the kernel's existing ruleset/event vocabulary, never by adding new rules logic the kernel itself should own. This is application-layer convenience over the kernel's declared operators, not a new rules capability — the closed-world signature above still holds.

## Non-ownership

`weiqi-platform-learn-service` does not own: rules logic of any kind (legality, scoring, ko/superko, SGF, semantic-event recognition — all `weiqi-kernel`'s, consumed read-only); corpus authorship (lessons, glossary terms, tsumego problems, ontology remain `weiqi-services-section`'s own `content/`, authored there, rendered here); the Play face's responsibilities (accounts, live sockets, authoritative game rooms, persisted game/rating records — declared but not admitted, and in any case never this service's to build); bot/engine hosting (GnuGo, KataGo, the bare-metal analysis box are explicitly out of the platform's boundary per the plan); and billing/monetization (out of scope per the plan and the platform constitution alike).

## Refusal conditions

- This service must refuse to open a network connection, hold a key, or read a clock it was not handed by its own render call — any such apparent need is evidence the responsibility belongs to the Play face, never a reason to compromise this service's purity, per the platform constitution's own refusal condition for the Learn face, inherited here at the service level.
- This service must refuse to reimplement or shadow kernel logic (legality, scoring, event recognition) locally "for speed" or convenience; any move validation not delegated to `weiqi-kernel` is a refusal-worthy violation of the platform's declared overlap restriction. Its own capture-go win condition and non-mutating preview (see Authority, above) are the one licensed exception, and only insofar as they compose the kernel's existing declared operators rather than adding new ones.
- This service must refuse to persist a learner's progress, or any other state, past the browser session in any server-reachable location — it has no persistent write path, structurally, per its closed-world signature.
- This service must refuse to let its board-rendering or glossary/event-naming logic diverge from whatever the Play face eventually adopts, per the platform's declared restriction; a detected divergence is a defect in the section's health, not local team preference.

## Board authorization

The 561 Group board approved the Weiqi Platform Plan (`content/text/documents/articles/notes/weiqi-platform-plan.md`, dated 2026-08-18) on 2026-08-18, including its "Board decisions requested" item 1 ("Approve platform placement inside `weiqi-services-section` and the two child-section constitutions (kernel, platform app)") and item 5 ("Confirm education-first sequencing (Phase 1 ships before any multiplayer)"). The [Weiqi Platform Constitution](./weiqi-platform-constitution.md) discharged that authorization's section-level half and explicitly named this Learn-service record as the next owed act, gating any `services/weiqi-platform/…` or `apps/…` directory on its existence (§"Open obligations", §"What comes next"). This record discharges that owed act. It authorizes the *constitution* of `weiqi-platform-learn-service` and, per the same platform-constitution clause, now licenses the materialization decision recorded below — it does not separately re-authorize the Play face, which remains withheld per the platform constitution's own refusal condition until Phase 2 is separately authorized.

## Materialization decision (2026-08-19)

With this record written, the platform constitution's licensing condition is satisfied ("only after it exists" — see Governance basis, above), and materialization proceeds on the same product-spine grounds the kernel's own materialization decision used (2026-08-11 derivation, Clause 5):

- **The section materializes at `services/weiqi-platform/`**, not `apps/weiqi-platform/`, because — unlike the kernel — `weiqi-platform-services-section` is a *covered section* whose declared cover includes a future Play face that, once admitted, will hold keys, sockets, and a clock (per the platform constitution's own §"Form" and §"Stratum": the Play face "sits at the `services/<domain>-server` sub-tier"). A section that covers a future keyed/socketed member is not the pure-package shape Clause 5 reserves for `apps/`; it belongs at the `services/` tier the section as a whole will eventually justify, even though only its pure member is admitted today. The section's own filesystem projection carries a `README.md` and `package.json` per house form, named `@lenticule-science/weiqi-platform-services-section`, declaring its cover (`weiqi-platform-learn-service` admitted; `weiqi-platform-play-service` declared, not admitted) exactly as the platform constitution states it — the manifest is a projection of the already-decided cover, not a second place to redecide it.
- **The Learn service materializes at `services/weiqi-platform/apps/weiqi-learn/`**, under the section's own `apps/` — not `services/` — subdirectory, because this record's own §"Form" and §"Authority" establish that the Learn service is exactly the pure, no-network, no-key, no-clock-it-was-not-handed shape Clause 5 reserves for `apps/<domain>-computer`, identically to how the kernel's own materialization decision placed `weiqi-kernel` at `apps/weiqi-kernel` rather than `services/weiqi-kernel`. The board's product-spine rule is a rule about a package's own purity, not about which container happens to hold it — a pure package sits at an `apps/` tier even when its immediate parent is a `services/`-tier section, because the section's tier reflects what its *cover as a whole* will eventually require, while the package's tier reflects what *it itself* requires now. Package name: `@lenticule-science/weiqi-learn`, plain browser-ready ESM (`.mjs`), no TypeScript, no framework, no dependency, no build step for its own code — only the one-time kernel-stripping build pipeline that copies the kernel's `.mts` sources to `public/lib/kernel/*.mjs` via `node:module`'s native type-stripping, per Node 24's stable support for it.
- This decision does not admit the Play face. Its cover entry in the section manifest remains declared, not materialized, per the platform constitution's own refusal condition ("must refuse to admit the Play face into its cover until Phase 1 has shipped and the board has separately authorized Phase 2").

## Open obligations

- **Naming form**, inherited unresolved from the platform constitution: `weiqi-platform` vs. `weiqi-platform-services-section` at the section level remains open there; this record's own service-level name, `weiqi-platform-learn-service` (doctrine) materializing as `@lenticule-science/weiqi-learn` (package), follows the kernel's own bare-name precedent for a pure `apps/`-tier package and is treated as settled by this record's own materialization decision above, not left open.
- **Restricted-Yoneda leg agreement** (2026-08-11 derivation, Clause 1.2/PPA-FR-040) applies here as it does to the kernel and the platform section: this service's identification of its own apex, manifest, and protocol legs is a checked runtime condition once those legs exist, not an assumed fact now.
- **Conformance against the platform's declared overlap** (kernel dependency, board component, hover-card component) is not computed by this record — per the platform constitution's §"Authority", that computation happens "once both members are admitted and materialized," and only the Learn member is admitted today. This record's own restriction (Authority and Refusal conditions, above) states the obligation; it does not discharge the check.

## What comes next

Code, README, and `package.json` may now appear under `services/weiqi-platform/` and `services/weiqi-platform/apps/weiqi-learn/`, per the materialization decision above — this record is the act that licenses them. See the sibling [Weiqi Kernel Constitution](./weiqi-kernel-constitution.md) for the service this app depends on and must never reimplement, and the [Weiqi Platform Constitution](./weiqi-platform-constitution.md) for the section this service is one declared member of.
