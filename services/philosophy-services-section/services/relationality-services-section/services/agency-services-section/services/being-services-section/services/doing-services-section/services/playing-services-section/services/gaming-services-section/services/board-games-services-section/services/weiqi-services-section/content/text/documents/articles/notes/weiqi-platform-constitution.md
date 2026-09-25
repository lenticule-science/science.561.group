---
title: Weiqi Platform Constitution
description: "Audience: the 561 Group board and implementing agents. Constitutes weiqi-platform as a covered services-section child of weiqi-services-section, admitted under the board-approved Weiqi Platform Plan: cover, purpose, inputs, outputs, customers, authority, non-ownership, and refusal conditions, decided from the repository's own service-form rules rather than habit."
date-created: 2026-08-18
date-updated: 2026-08-19
type: specification
authors:
  - claude-fable-5
tags: []
---


Audience: the 561 Group board and agents that will materialize, extend, or consume `weiqi-platform`.

Learning goal: know exactly what `weiqi-platform` covers, which faces it admits now versus later, who owns each, and what it may and must refuse — before any of its filesystem projections are treated as settled.

## Governance basis

This record uses the same governance basis as its sibling [Weiqi Kernel Constitution](./weiqi-kernel-constitution.md), §"Governance basis" — repeated here rather than assumed: the instruction's named reference, `.agents/skills/corpus-normalization/references/service-section-constitution.md`, does not exist anywhere in this repository, and no prior constitution record exists as a working exemplar. This record instead draws on `references/repository-model.md`'s own evidence order, the board-approved [Weiqi Platform Plan](./weiqi-platform-plan.md), the board's 2026-08-18 "Board challenge: constituting service sections" note, and the board's 2026-08-11 "standard form" derivation — in particular its Clause 2 definition of a *services-section* as a region of the base with a covering (a declared set of member services), mandatory overlap declarations even when the cover is currently discrete, and Clause 3.3's rule that containment must match generation.

As with the kernel, the plan's "no speculative scaffolding" clause means this record lives in the parent's `content/`, not inside a fabricated `services/weiqi-platform/` directory — admission is not itself an artifact.

## Distinct responsibility

Serving weiqi as a product — teaching it and, later, hosting play of it — over one shared concept graph is a responsibility no existing service in this repository owns. `weiqi-services-section` currently owns corpus content and (via its sibling constitution) will own the pure rules kernel; neither owns rendering, interactivity, deployment, accounts, or real-time play. The plan's central differentiator — glossary-linked play, where the interface surfaces the corpus's own term and lesson content at the moment a recognized event occurs on the board — requires a component that sits between the kernel's semantic events and a human reader, choosing what to render and when. Nothing upstream of this admission does that, and it cannot be folded into the kernel (which must stay pure, per its own constitution) or into raw content (which is prose, not an interactive surface).

## Generative parent

`weiqi-services-section`, on the same Clause 3.3 grounds as the kernel: the platform is generated directly from this section's corpus (the lesson template it interactively ports, the seventeen glossary terms it renders as hover-cards, the ontology it consumes as a skill tree) and from the kernel this section also constitutes. No other section generates it.

## Form: a services-section, not a singular service

Applying the same test as the kernel's constitution (2026-08-11 derivation; echoed by the 2026-08-18 board challenge): does the candidate decompose into faces with distinct inputs, outputs, and refusal conditions, or does it collapse to one inseparable operation?

The plan's own description of `weiqi-platform` names two faces with genuinely different natures, not two implementation details of one operation:

1. **The Learn face** (Phase 1, admitted now) — board component, interactive lessons, tsumego player, glossary pages. Client-side and static assets only. Per the plan verbatim: "no accounts, no server state, deployable exactly like 561.group." Its refusal condition is structural: it must hold no network key, no socket, and no persistent write path — it is the `apps/<domain>-computer` purity tier of the 2026-08-11 derivation's product spine, applied to this domain.
2. **The Play face** (Phase 2+, declared but not yet admitted) — the Durable-Object game-room service: WebSocket hub, authoritative clock, D1-backed accounts and game archive. Its refusal condition is the mirror image: it is exactly where, per the same derivation, "keys and sockets enter," and it must refuse to let any client bypass the kernel's own move validation.

These two faces have distinct inputs (a lesson/tsumego selection vs. a move over a live socket), distinct outputs (rendered instructional state vs. an authoritative game-state broadcast), distinct customers in the authority sense (an anonymous learner needing no account vs. an authenticated player in a stateful room), and distinct refusal conditions (a purity boundary that runs in opposite directions). This is precisely Clause 2.1's covered region, not Clause 1.1's single fiber. `weiqi-platform` is therefore constituted as a **services-section**, `weiqi-platform-services-section`, with the cover declared below.

**Open naming tension, not resolved here**, on the same grounds as the kernel's: this repository's convention names services-sections with a `-services-section` suffix; the plan and this instruction's given path use the bare `weiqi-platform`. Carried forward as an open obligation.

## Cover, overlaps, and stratum (2026-08-11 derivation, Clause 2.1/2.2/§6)

A section's export is its incidence data, not a bag of entries. Declared now, ahead of any materialization:

- **Cover** (intended, not all yet admitted):
  - `weiqi-platform-learn-service` — the Phase 1 static education app. Admitted by this record as the section's first member once its own constitution record is written (this document constitutes the *section*; the Learn service's own constitution, satisfying the same field list, is a follow-on act this section owes before that child directory may appear — see Open obligations).
  - `weiqi-platform-play-service` — the Phase 2+ Durable-Object play service. Declared, not admitted: no constitution record exists for it yet, and none should until Phase 1 ships and the board authorizes Phase 2, per the plan's roadmap and the challenge note's acceptance test 4.
- **Overlaps** (mandatory to declare even before both members exist, per Clause 2.2 — an undeclared cover is not license to skip this, it is the reason to state the *intended* overlap now so it is not silently invented later):
  - `weiqi-platform-learn-service | weiqi-platform-play-service`: shared carrier = the board rendering component, the glossary hover-card component, and the `weiqi-kernel` dependency itself (both faces validate and render moves through the same kernel; the plan states this outright — "a capture in a live game, an exercise in a lesson, and the glossary entry for 'capture' are the same node seen three ways"). Until the play service exists, this overlap is **declared-discrete** — stated as an intended, not yet checkable, agreement — rather than presented as proven coherence.
- **Restrictions:** the Learn service must restrict to the overlap by treating the kernel and shared components as read-only dependencies (it introduces no new event vocabulary of its own). The Play service, once admitted, must restrict to the same overlap identically — no divergent board-rendering or event-naming logic is permitted to develop in either face independently of the other.
- **Stratum:** L3 (computing/services) for the section as a whole, per the ontological-spine tower — it is the tier where the kernel's L2 rule structure meets an actual client or server. The Learn face sits at the `apps/<domain>-computer` purity sub-tier (no keys); the Play face, once admitted, sits at the `services/<domain>-server` sub-tier (keys and sockets enter). Neither face may import downward past the kernel's L2 boundary in a way that reimplements rules logic.

## Purpose

Serve weiqi as one product across three faces built from one concept graph — Play, Learn, and Read (the living glossary/library, served as pages and an API) — with education as the organizing principle: the Learn face ships complete and usable on its own before any multiplayer complexity is admitted. The platform's differentiator is glossary-linked play: surfacing this section's own term and lesson definitions at the moment the kernel's semantic events make them relevant.

## Inputs

- **Learn face:** a learner's navigation/selection (which lesson, which tsumego, which glossary term), rendered client-side against the corpus and the kernel's pure computation. No account, no server round-trip.
- **Play face (future):** authenticated player actions over a WebSocket connection to a Durable Object game room; clock state; reconnection requests.
- Both faces: the kernel's position/legality/scoring/event outputs (consumed, never reimplemented) and this section's own corpus content (lessons, glossary, ontology) as the source of every rendered explanation.

## Outputs

- **Learn face:** rendered board state, step-through worked examples, playable tsumego with revealed commentary on request, glossary hover-cards, and a learner's local progress against the concept graph.
- **Play face (future):** authoritative game-state broadcasts to players and spectators, SGF export, a post-game concept-event timeline, and persisted game/rating records.
- Both: every rendered move or lesson event links to its glossary term page, per the shared hover-card component declared in the overlap above.

## Customers

End users in two distinct postures, matching the cover: an anonymous or lightly-identified learner (Learn face — the plan's explicit Phase 1 target, "no account required" for the first session) and an authenticated player, teacher, or spectator (Play face, once admitted). Internally, both faces are customers of `weiqi-kernel` and of `weiqi-services-section`'s own corpus content — this section produces no rules content and no corpus content of its own; it renders and serves what its generative parent and sibling already define.

## Authority

- **Closed-world signature:** each admitted member of the cover may only invoke the operators it declares. The Learn face's declared signature holds no network or key operator at all (the purity boundary is not a preference, it is the boundary that makes Phase 1 deployable exactly like 561.group with zero operational burden). The Play face, once admitted, is the only place in this whole section where keys, sockets, and a clock the process was not handed are permitted to enter, per the 2026-08-11 derivation's Clause 5.
- **Change authority:** UI, deployment, and interaction decisions are this section's own; rules decisions are never this section's to make — any disagreement between what the platform renders and what the kernel computes is resolved in the kernel's favor, always, per the kernel's own constitution.
- **Runtime authority:** the Learn face holds no credentials and no persistent state. The Play face, once admitted, is the only holder of the Cloudflare Durable Object and D1 credentials the plan provisions for it; it must not delegate that authority to a client.
- **Section health:** per Clause 2.3, this section's health is computed from its declared incidence (cover, overlaps, restrictions above), not asserted by fiat — once both members are admitted and materialized, a conformance pass computes whether the declared overlap actually holds (zero disagreement) or must be reported with a quantified refusal, rather than assumed.

## Non-ownership

`weiqi-platform` does not own: rules logic of any kind (legality, scoring, ko/superko, SGF, semantic-event recognition — all `weiqi-kernel`'s, consumed read-only); corpus authorship (lessons, glossary terms, rulesets prose remain `weiqi-services-section`'s own `content/`, authored there and only rendered here); bot/engine hosting (GnuGo, KataGo, and the bare-metal analysis box are explicitly out of this section's boundary per the plan, reserved for a later, separately-constituted capacity); and billing/monetization (Stripe is provisioned infrastructure the plan explicitly defers, "out of scope until the platform has users" — this section does not admit a billing face by implication of that provisioning existing).

## Refusal conditions

- The Learn face must refuse to open a network connection, hold a key, or read a clock it was not handed by its own render call — any such need is evidence the responsibility belongs to the Play face, not a reason to compromise the Learn face's purity.
- Neither face may reimplement or shadow kernel logic (legality, scoring, event recognition) locally "for speed" or convenience; any move validation not delegated to `weiqi-kernel` is a refusal-worthy violation of the declared overlap restriction.
- The Play face (once admitted) must refuse a client-submitted move that the kernel rejects, with no override path, and must refuse to broadcast game state it cannot attribute to a kernel-validated position.
- This section must refuse to admit the Play face into its cover until Phase 1 has shipped and the board has separately authorized Phase 2, per the plan's roadmap and the board challenge's acceptance test 4 ("refuse materialization without explicit authority").
- This section must refuse to let the two faces' board-rendering or event-naming logic diverge, per the declared restriction above; a detected divergence is a defect in the section's health, not a matter of local team preference.

## Board authorization

The 561 Group board approved the Weiqi Platform Plan (`content/text/documents/articles/notes/weiqi-platform-plan.md`, dated 2026-08-18) on 2026-08-18, including its "Board decisions requested" item 1: "Approve platform placement inside `weiqi-services-section` and the two child-section constitutions (kernel, platform app)," and item 5, "Confirm education-first sequencing (Phase 1 ships before any multiplayer)," which this record's cover directly encodes (Learn admitted now, Play declared but withheld). This record discharges that authorization's platform half. It authorizes the *constitution* of the section and its declared cover — it does not authorize materialization of any filesystem, package, or protocol projection for either member, and it specifically does not authorize admitting the Play face's own constitution yet; that remains gated on the board's Phase 2 decision.

## Open obligations

- **Naming form**, as with the kernel: `weiqi-platform` (bare, per the plan and the instructing task) vs. `weiqi-platform-services-section` (per corpus-wide convention for a covered section). Not settled here.
- **The Learn service's own constitution record is still owed.** This document constitutes the section; it is not a substitute for `weiqi-platform-learn-service`'s own record (purpose/inputs/outputs/customers/authority/non-ownership/refusal conditions at the service level, generative parent = this section). That record — and only after it exists — is what licenses a `services/weiqi-platform/…` (or `apps/…`) directory to appear for the Learn face, per the plan's "no speculative scaffolding" rule.
- **The Play service is intentionally unconstituted.** Its cover entry above is a declared placeholder, not an admission; no constitution record should be written for it before the board's Phase 2 authorization, per the plan's own gating and the board challenge's acceptance test 4.
- **Board decisions requested items 2–4** of the plan (domain choice, Cloudflare-first confirmation, public-license posture) are outside this constitution's scope; they affect materialization, not the section's admission, and remain open per the plan.
- **Restricted-Yoneda leg agreement** (2026-08-11 derivation, Clause 1.2/PPA-FR-040) applies here as it does to the kernel: this section's identification of its own future apex, manifest, and protocol legs is a checked runtime condition once those legs exist, not an assumed fact now.
- **2026-08-19: sibling kernel materialization resolved, this section's own naming still open.** The [Weiqi Kernel Constitution](./weiqi-kernel-constitution.md)'s naming-form obligation is now settled — the kernel is materialized at `apps/weiqi-kernel` (bare name, no `-service` suffix), because the board's product-spine derivation places pure, no-network packages under `apps/`, not `services/`. That resolution is specific to the kernel's singular-service form; it does not resolve this section's own naming-form obligation above (`weiqi-platform` vs. `weiqi-platform-services-section`), since a covered section with a future keyed/socketed Play face is not the pure-package shape the same derivation clause addresses. The kernel's test suite state is recorded in its own README (`apps/weiqi-kernel/README.md`).

## What comes next

The Learn face's own constitution record is the next act this section owes itself before any code, README, or package.json may appear under its cover. See the sibling [Weiqi Kernel Constitution](./weiqi-kernel-constitution.md) for the service both faces of this section will depend on and must never reimplement.
