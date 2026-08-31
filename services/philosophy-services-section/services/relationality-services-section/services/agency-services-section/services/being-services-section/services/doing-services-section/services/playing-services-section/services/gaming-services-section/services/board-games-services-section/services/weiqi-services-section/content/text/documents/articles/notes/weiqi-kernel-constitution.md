---
title: Weiqi Kernel Constitution
description: "Audience: the 561 Group board and implementing agents. Constitutes weiqi-kernel as a singular child service of weiqi-services-section, admitted under the board-approved Weiqi Platform Plan: purpose, inputs, outputs, customers, authority, non-ownership, and refusal conditions, decided from the repository's own service-form rules rather than habit."
date-created: 2026-08-18
date-updated: 2026-08-19
type: specification
authors:
  - claude-fable-5
tags: []
---

# Weiqi Kernel Constitution

Audience: the 561 Group board and agents that will materialize, extend, or consume `weiqi-kernel`.

Learning goal: know exactly what `weiqi-kernel` is for, what it may and must refuse, who owns it, and on what authority it exists — before any of its filesystem projections are treated as settled.

## Governance basis

This record was produced without the reference its assigning instruction named: `.agents/skills/corpus-normalization/references/service-section-constitution.md` does not exist anywhere in this repository (confirmed by direct read attempt and repository-wide search). No prior constitution record of any kind exists yet to serve as a working exemplar either — this is the first. In the absence of both, this record is built from the next-best evidence, in the order `references/repository-model.md` itself prescribes (explicit instruction, then authoritative content inside the payload, then local form, then generic convention):

- the [Weiqi Platform Plan](./weiqi-platform-plan.md), §"Governance and placement" and §"Board decisions requested" (board-approved 2026-08-18) — the direct authorizing text and field list (purpose, inputs/outputs, customers, boundary, refusal conditions);
- the board's own 2026-08-18 note, "Board challenge: constituting service sections" (`561-group-board-of-directors-leader-assistant-services-section`) — the four-face admission/constitution/materialization/conformance split, and the acceptance test that a constitution record must be complete and reviewable *before* the filesystem is touched;
- the board's 2026-08-11 derivation, "The standard form of packages and sections, derived from the mathematics" — the definitions this record uses for *service* (a fiber with an addressable apex; the package manifest is one projection of that apex, not its identity), *generative parent* (containment must match generation — a section contains a service only if the service is generated from the section's apex), and *closed-world signature* (a service's reach is exactly its declared operators, nothing borrowed).

This record's disposition: `weiqi-services-section` is asked by the plan to gain a `services/` child named `weiqi-kernel`. The plan itself also states "no speculative scaffolding — each child directory appears only when its first real artifact does." A constitution record is not the kernel's first real artifact; it is the parent section's own act of admission. This document therefore lives in the parent's `content/`, not inside a newly fabricated `services/weiqi-kernel/` directory, so that admission does not itself become the scaffolding the plan forbids.

## Distinct responsibility

Legal-move determination, ko/superko regimes, ruleset parameterization, area/territory scoring with seki and dead-stone protocol, SGF parse/serialize, and the semantic event layer that recognizes glossary concepts in move sequences are one indivisible responsibility: producing and annotating legal weiqi positions with no dependency on a network, a clock it was not handed, or a rendering surface. No existing service in this repository owns "correct, glossary-linked weiqi rules as pure computation" — `weiqi-services-section` currently owns only corpus content (lessons, glossary, rulesets-as-prose), not executable rules. Absorbing this responsibility into the content tree would make prose and code indistinguishable in ownership terms; absorbing it into a future play service would tie a pure, browser-and-Node-portable computation to a stateful, keyed, socketed process that the purity spine (2026-08-11 derivation, §5) explicitly forbids mixing. A distinct owner is therefore required, and none exists.

## Generative parent

`weiqi-services-section` (`lib/emsenn/services/561-group/services/science-services-section/services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/services/gaming-services-section/services/board-games-services-section/services/weiqi-services-section/`).

The 2026-08-11 derivation's Clause 3.3 requires containment to match generation: a section contains a service only if the service is generated from the section's apex. `weiqi-kernel` is generated directly from the corpus this section already owns — the plan states the build motto outright: "the engine is the executable form of the glossary. Each glossary term corresponds to a named predicate or event in the rules kernel." The kernel's semantic event layer is a direct, named transform of `weiqi-services-section`'s own seventeen glossary terms and its rulesets/regression-positions references (`content/text/documents/articles/notes/rulesets.md`, `regression-positions.md`). No other section generates it.

## Form: a singular service, not a services-section

The 2026-08-11 derivation gives the test directly (echoed by the board's 2026-08-18 challenge note): if a candidate's faces have distinct inputs, outputs, and refusal conditions, they form a covered section; if they collapse to one inseparable operation, the correct form is a singular service.

Applying it: position representation, legal-move determination, ko/superko regimes, scoring, SGF parse/serialize, and the semantic event layer share one input type (a position plus a move or move sequence, under one ruleset), one output type (a new position, a legality verdict, a score, or an annotated event stream), one test suite (round-trip SGF, ko/superko invariants, scoring cross-checks against the corpus's own regression positions), one manifest, and one customer relationship (anything that needs correct rules, embedded as a library, not addressed over a network). They do not glue into a nontrivial cover with overlaps and restriction maps between sub-services — declaring them as separate covered services would only produce Clause 2.2's degenerate case (zero-disagreement overlaps, vacuously coherent) dressed up as structure. `weiqi-kernel` is therefore constituted as a **singular service**, not a `weiqi-kernel-services-section`.

**Open naming tension, not resolved here.** The plan calls the working npm name `@lenticule-science/weiqi-kernel` "subject to the constitution step," and this repository's own convention for a singular leaf service under a `services/` container is near-universally a `-service`-suffixed name (`solitaire-service`, `climate-research-service`, `json-codec-service`, and dozens more; zero unsuffixed counterexamples found under any `services/` directory). Separately, the same 2026-08-11 derivation's Clause 5 product spine reserves `apps/<domain>-computer` for exactly this kernel's shape — "operational but pure: no network, no keys, no clock it was not handed" — with `services/<domain>-server` reserved for where keys and sockets actually enter, which this kernel never does. This record does not resolve either tension by fiat, in keeping with the house rule that collisions are represented and either glue uniquely or produce a quantified refusal rather than being settled by a convenient winner. Both are carried forward as open obligations below, for the materialization step's explicit authority to settle rather than for this constitution to presume.

## Purpose

Compute and annotate legal weiqi play as a pure function of declared rules: given a position, a ruleset, and a move or move sequence, determine legality, apply captures, detect and enforce the ruleset's ko/superko regime, score a finished or scoring-request position (area or territory, with seki and dead-stone resolution), and recognize the glossary's semantic events (atari, capture, ko started/resolved, group connected/cut, eye formed/falsified, group settled/killed) as they occur. Parse and serialize positions and game records as SGF. Nothing in this purpose ever writes to a network, a database, or a clock the caller did not hand it.

## Inputs

- A position (immutable representation) and, where relevant, its history (for ko/superko).
- A ruleset, supplied as a declared data object (Chinese, Japanese, AGA, New Zealand, Ing — rules as data, never as code forks), including the superko regime and komi/handicap parameters.
- A move, or an SGF-encoded move sequence / game record, to apply, validate, or annotate.
- A scoring or dead-stone-marking request against a position under a chosen ruleset.

## Outputs

- A legality verdict for a proposed move, or the resulting position after a legal move (captures applied).
- Ko/superko state needed to judge the next move.
- A score (area or territory) with seki resolved and dead stones settled, under the requested ruleset.
- Serialized SGF for any position or game record; a parsed position/game record from SGF input.
- A semantic event stream: named events corresponding one-to-one with glossary terms this section already defines, each event carrying enough position data for a caller to render or narrate it.
- Zobrist hashes sufficient for superko detection and position-identity comparisons.

## Customers

Any component that needs authoritative, glossary-linked weiqi rules and does not itself want to implement them: the platform's static Learn app (board component, interactive lessons, tsumego player) and, later, the Durable-Object play service (`weiqi-platform`'s future play face) as its sole source of move validation, scoring, and event annotation. The kernel has no customer relationship with end users directly — it is a library dependency, never a network-addressed endpoint.

## Authority

- **Closed-world signature (2026-08-11 derivation, Clause 3.2):** the kernel may be invoked only through its declared constructors and operators — position construction, move application, scoring, SGF parse/serialize, and event annotation. No caller may reach into kernel internals to bypass ko/superko or scoring logic; there is no other door.
- **Stratum:** L2 (games/strategies), per the ontological-spine tower cited in the 2026-08-11 derivation — the kernel encodes a game's rule structure, one level above L1 agency and below L3 computing/services. It must not import from any L3 package (nothing that opens a socket, a database handle, or a clock).
- **Change authority:** changes to rules-of-the-game content (which ruleset variants exist, which events the semantic layer recognizes) are downstream of `weiqi-services-section`'s own corpus — a new glossary term or rulesets-reference entry is upstream evidence for a kernel change, not the reverse. The kernel does not originate rules content; it executes what the corpus already defines, per the plan's stated motto.
- **Runtime authority:** none beyond what any pure library has. It holds no credentials, no persistent state, and no independent authority to act — it only computes when called.

## Non-ownership

`weiqi-kernel` does not own: corpus content (lessons, glossary terms, rulesets-as-prose — these remain `weiqi-services-section`'s own `content/`); rendering or UI (the board component, hover-cards, lesson interactivity belong to `weiqi-platform`); persistence, accounts, ratings, or matchmaking (D1/Durable-Object concerns belong to the future play service); bots or engine analysis (GnuGo/KataGo integration is explicitly platform/operations territory in the plan, not kernel territory); and network or transport of any kind. It does not own naming its own final package identity or directory suffix — see "Open naming tension" above, deferred to materialization.

## Refusal conditions

The kernel must refuse (return an explicit error/verdict, never a silent best-effort guess) when:

- a proposed move is illegal under the supplied ruleset (occupied point, suicide where the ruleset forbids it, ko/superko violation under the declared regime);
- a ruleset object is malformed or does not declare a required parameter (superko regime, komi, handicap points) the requested operation needs;
- a scoring request is made against a position that is not settled and no dead-stone marking has been supplied where the ruleset requires one;
- SGF input does not parse as well-formed SGF, or round-trips to a different position than it encoded;
- an operation is invoked outside the closed-world signature declared above (no internal escape hatch is provided for any caller, including the platform).

The kernel must never silently degrade a ruleset, guess a caller's intent on malformed input, or produce a position/score it cannot justify against its own declared rules.

## Board authorization

The 561 Group board approved the Weiqi Platform Plan (`content/text/documents/articles/notes/weiqi-platform-plan.md`, dated 2026-08-18) on 2026-08-18, including its "Board decisions requested" item 1: "Approve platform placement inside `weiqi-services-section` and the two child-section constitutions (kernel, platform app)." This record discharges that authorization's kernel half. It authorizes the *constitution* recorded here — the existence, boundary, and authority of `weiqi-kernel` as a service — and does not by itself authorize materialization of any filesystem, package, or protocol projection, per the board challenge note's acceptance test 4 ("refuse materialization without explicit authority"). Materialization is the next, separately-gated workflow step.

## Open obligations

- **Naming form**, stated above: `weiqi-kernel` (bare) vs. a `-service`-suffixed corpus-conventional name, and `services/weiqi-kernel` vs. an `apps/<domain>-computer`-tier placement under the 2026-08-11 derivation's purity spine. Both readings are defensible from the documents; neither is settled by this record.
- **Pre-existing uncommitted artifact at the wrong address.** At the time this record was written, `weiqi-services-section/apps/weiqi-kernel/` already contains real, uncommitted source (`game.mts`, `board.mts`, `scoring.mts`, `rulesets.mts`, `zobrist.mts`, `position.mts`, `events.mts`, a `test/` directory, and a `package.json` naming `@lenticule-science/weiqi-kernel`) — untracked in git, not reflected in this section's own `README.md` (which still reads "No engine, kernel, or app code exists yet"). This is exactly the inversion the board's 2026-08-18 challenge warns against: a real artifact materializing ahead of its constitution. This record does not move, rename, or otherwise touch that code — doing so is materialization, out of this record's scope — but flags it as the first thing the materialization step must reconcile against whichever address the open naming question above settles on.
- **Restricted-Yoneda leg agreement** (2026-08-11 derivation, Clause 1.2/PPA-FR-040) remains an open obligation of the corpus generally: this record's identification of `weiqi-kernel`'s "apex" with its eventual npm manifest, protocol shape, and conformance vector is a checked runtime condition once those legs exist, not an assumed fact now.
- **2026-08-19 materialization decision.** The naming-form obligation above is now resolved: the kernel is materialized at `apps/weiqi-kernel` (bare name, no `-service` suffix), not under `services/`. This follows directly from the board's 2026-08-11 product-spine derivation, Clause 5: pure, no-network packages belong at the `apps/<domain>-computer` purity tier, and `weiqi-kernel` — no socket, no key, no clock it was not handed — is exactly that shape, not the `services/<domain>-server` tier reserved for where keys and sockets actually enter. This also reconciles the pre-existing-artifact obligation above: `apps/weiqi-kernel` is the settled address the code already occupied, not a second candidate awaiting reconciliation. The kernel's test suite state (pass/fail counts and how to run them) is recorded in the kernel's own README (`apps/weiqi-kernel/README.md`), not duplicated here.

## What comes next

Once the board or its delegate settles the naming-form open obligation, the materialization step may translate this constitution into package, filesystem, and (where the naming lands on `apps/`) conformance projections — reconciling the pre-existing `apps/weiqi-kernel/` code against whichever address is chosen, rather than leaving two candidate homes for one apex. See the sibling [Weiqi Platform Constitution](./weiqi-platform-constitution.md) for the child that consumes this kernel.
