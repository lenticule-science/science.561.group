---
title: "Decisions"
description: "Choices the captain has made that aren't derivable from PredCat / PredComp / library theory. The agent inherits these."
kind: index
---


These are the captain's choices over the years — distilled from the archive and made explicit.
They are not theory restatements; the theories already constrain the space, but multiple compatible options exist within those constraints.
The captain has chosen.

## Decision precedence

Decisions belong to one of five precedence classes.
When two decisions appear to conflict, the higher-class decision wins by default; the lower-class decision must be amended to scope its claim.
Per [decision-precedence.md](decision-precedence.md):

1. **Math-foundation** (highest) — bilattice algebra, knowledge-join, regime classification, Lawvere-quantale cost, modal-restriction authorization.
  Cited by library theorems (proved).
2. **Settled-content** — event-log-is-the-truth, time-is-event-ordinal, hash-injectivity-is-content-identity.
  Cited by library objects (defined).
3. **Capability** — capability-not-acl, federation-by-construction, persona-bridges-personnel.
  Cited by library morphisms (constructed).
4. **Performance** — dual-implementation-python-rust, default-fuel-ceilings.
  Cited by benchmarks (measured).
5. **Convenience** (lowest) — mcp-as-default-surface, plain-text-event-log-format, v0.2-split-into-v0.2a-and-v0.2b.
  Cited by surface preferences (chosen).

A decision file SHOULD declare its `class` in frontmatter; existing decisions without `class` are grandfathered and reclassified on next touch.
See [decision-precedence.md](decision-precedence.md) for the within-class resolution rules and the discipline for amendments.

## Process discipline

- [decision-precedence.md](decision-precedence.md) — the precedence-class discipline above (this is itself a convenience-class decision about decision review).
- [v0.2-split-into-v0.2a-and-v0.2b.md](v0.2-split-into-v0.2a-and-v0.2b.md) — split the original v0.2 milestone into v0.2a (multi-user single-node) and v0.2b (drivers, observability, packaging-prep).
- [fixture-authoring-paired-task.md](fixture-authoring-paired-task.md) — every implementation task `t02-NN` gets a paired fixture-authoring task `t02-NNf`; the pair ships together.
- [network-spec-defer-until-implementer-named.md](network-spec-defer-until-implementer-named.md) — network-layer wire formats are stubs until the implementing developer is named for the milestone; algebra specs are written eagerly.
- [trusting-trust-bootstrap-path.md](trusting-trust-bootstrap-path.md) — self-hosting (retargeted to v0.3) ships with three structural trusting-trust defences: bootstrap reproducibility, cross-implementation replay-diversity, witnessed toolchain.

## OS-level frame

- [os-class-target-plan9-or-better.md](os-class-target-plan9-or-better.md) — the project builds a Plan 9 / Unix-class OS by v0.2; the substrate IS the OS, not a layer on top.
- [versioning-is-os-release-style.md](versioning-is-os-release-style.md) — sequenced releases v0.1 → v1.0 like real OS roadmaps; not "phase 1, phase 2."
- [self-hosting-by-v0.2.md](self-hosting-by-v0.2.md) — the OS rebuilds itself from its own source tree at v0.2.
- [bundled-userland-at-v0.3.md](bundled-userland-at-v0.3.md) — the OS ships standard email, calendar, chat, file browser, terminal, text editor, calculator, ledger tool in the v0.3 base image.

## Technology stack

- [engine-language-rust.md](engine-language-rust.md) — Rust for the runtime, with `mash-engine` as the existing implementation to port from.
- [deployment-via-guix-preferred-nix-acceptable.md](deployment-via-guix-preferred-nix-acceptable.md) — Guix preferred (Lisp-all-the-way-down), Nix acceptable as practical fallback.
  NixOS rejected.
- [package-format-is-nix-flake.md](package-format-is-nix-flake.md) — the package format is built on Nix flake / Guix manifest; OS images are Nix-derivations.
- [agent-surface-is-mcp.md](agent-surface-is-mcp.md) — Model Context Protocol for agent I/O.
  ABI/RPC concerns absorbed.
- [messaging-federation-via-matrix.md](messaging-federation-via-matrix.md) — Matrix protocol for messaging-layer federation.
- [accounting-render-as-hledger.md](accounting-render-as-hledger.md) — Plain-text double-entry; hledger-format render and import.
- [web-gui-server-rendered-html.md](web-gui-server-rendered-html.md) — Server-rendered HTML with minimal client JS for the default web GUI; heavier frameworks per-app where justified.
- [web-gui-is-day-one.md](web-gui-is-day-one.md) — The browser interface is a primary deliverable, not deferred.

## Wire formats and protocols

- [event-log-is-jsonl.md](event-log-is-jsonl.md) — JSONL append-only on disk, source of truth.
- [content-hash-via-sha256.md](content-hash-via-sha256.md) — SHA-256 hex digests for all content addresses.
- [canonical-json-conventions.md](canonical-json-conventions.md) — lexicographic key sort, semantic array order, minimal numeric form.
- [federation-signatures-ed25519.md](federation-signatures-ed25519.md) — Ed25519 default for record signing.
- [network-protocols-are-real-bindings.md](network-protocols-are-real-bindings.md) — for SMTP, IMAP, Matrix, ActivityPub, MQTT, etc.: cite public RFCs and bind at byte-level fidelity.
  Don't reinvent.

## Substrate commitments

- [bilattice-as-the-value-domain.md](bilattice-as-the-value-domain.md) — Belnap 2⊗2; not 3-valued, not numerical confidence.
- [witness-pair-encoding-internal.md](witness-pair-encoding-internal.md) — internal $(a, b)$; wire form is the four named strings.
- [slug-alphabet-lower-kebab.md](slug-alphabet-lower-kebab.md) — entity/predicate identifiers in lower-kebab-case ASCII with `:` and `/` for namespacing.
- [everything-is-a-cell-not-a-file.md](everything-is-a-cell-not-a-file.md) — the OS's primitive is the cell (structured `(s, p, o, v)`), not the file (opaque bytes).
  Cells are typed; the kernel can compose them without parsing.

## Architectural commitments

- [self-representation-everywhere.md](self-representation-everywhere.md) — every operative element (rule, skill, office, agent, view spec, driver, package, network endpoint) is a substrate entity.
- [event-ordinal-is-time.md](event-ordinal-is-time.md) — wall-clock is instrumentation; event-ordinal is computation.
- [single-respond-primitive.md](single-respond-primitive.md) — every substrate operation reduces to `respond`.
- [events-are-stratified-substrate-is-a-presheaf.md](events-are-stratified-substrate-is-a-presheaf.md) — every cell carries a derivation stratum (`asserted`/`saturated`/`settled`); fibers are stored as a presheaf indexed by context, not as a flat set.
- [federation-by-construction.md](federation-by-construction.md) — content-addressed, signed, Ed25519, eventual consistency.
  Single-node is one configuration; the protocol is the same.
- [drivers-are-substrate-entities.md](drivers-are-substrate-entities.md) — interfacers and drivers are first-class substrate cells with capability declarations.
- [heartbeat-is-the-scheduler.md](heartbeat-is-the-scheduler.md) — the heartbeat tick is the OS's scheduler; declared-dependency-ordering of closure-rule firings.
- [capability-not-acl.md](capability-not-acl.md) — authorization is a capability fiber via $\Rightarrow$, not an access-control list.

## Predicated-computing grounding

These three lift proved engineering theorems in the [predicated-computing](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/) (PC) theory into normative substrate commitments for v0.2 onward.
Together with the existing [predication-category-grounding](../specs/_patterns/predication-category-grounding.md) (math-layer) pattern, the new [predicated-computing-grounding](../specs/_patterns/predicated-computing-grounding.md) (engineering-layer) pattern indexes every v0.2 spec's "Grounded in" citations.

- [authorization-is-modal-restriction.md](authorization-is-modal-restriction.md) — capability, federation-trust, persona-projection, governance authority, account auth, and agent self-queueing are six surfaces of one substrate primitive: modal restriction $\Box_R$.
  The OS implements one $\Box_R$ evaluator parameterized per surface.
- [cost-is-lawvere-quantale.md](cost-is-lawvere-quantale.md) — closure-fuel, sandbox limits, federation routing, and telemetry all live in one Lawvere-quantale composition.
  Reads contribute the unit; settlements contribute positive cost; federation paths compose by the same arithmetic.
- [regime-classification-is-load-bearing.md](regime-classification-is-load-bearing.md) — every closure-rule system declares its regime (strict / Scott-continuous / transfinite-bounded / aperiodic).
  The regime determines the engine's fuel envelope, the audit discipline, the federation discipline, and the snapshot discipline. v0.2 default is strict.

## Vocabulary and lineage

- [adopt-predcat-vocabulary.md](adopt-predcat-vocabulary.md) — old vocabulary (FARS/FAOH/MASH/CCE/CDS/RTL/GFRTU) absorbed; current vocabulary is PredCat/PredComp/AgOP.
  Translation lives in [references/vocabulary-translation.md](../references/vocabulary-translation.md).
- [persona-and-personnel-distinct.md](persona-and-personnel-distinct.md) — persona-agents (Cassia, Calder, Josh) are distinct entities from offices and from real personnel.
- [identity-is-boundary-projection.md](identity-is-boundary-projection.md) — a user is a boundary entity that projects four fibers (auth, authz, attention, history); personnel/office/persona-agent are projections of the boundary, not independent record kinds.

## Computation discipline

- [cheapest-sufficient-computation-tier.md](cheapest-sufficient-computation-tier.md) — office work routes to the cheapest of three tiers (algebraic substrate, statistical model, language-model inference) that can decide a given respond; LLMs are reserved for natural-language reasoning.

## Inter-session and tool-call discipline

- [inter-session-messaging-is-substrate-cells.md](inter-session-messaging-is-substrate-cells.md) — typed messages between sessions (task-handoff/query/response/completed/conflict) are EAVT cells; the heartbeat surfaces unread messages each tick.
- [tool-calls-are-risk-scored-at-log-time.md](tool-calls-are-risk-scored-at-log-time.md) — every tool call's audit cell carries a risk score and band, computed at emit time from a pinned risk-profile cell.
  High/critical-band closure rules surface and intervene.
- [session-output-streams-over-websocket.md](session-output-streams-over-websocket.md) — per-session stdout/stderr capture is appended as `stream-chunk` substrate cells and pushed to subscribers (TUI shell, web GUI, federated peer) over the standard WebSocket transport.
- [bundled-mcp-catalog-is-normative.md](bundled-mcp-catalog-is-normative.md) — the OS commits to a bundled catalog of agent-facing MCP servers (`sequential-thinking`, `playwright`, `evalview`, `omega-memory`) wired into office work by default, each with a default capability and risk profile.
- [skills-have-manifest-contracts.md](skills-have-manifest-contracts.md) — every skill (local agent skill or operational skill pack) carries a JSON-Schema-validated manifest.
  Manifests aggregate into substrate-resident `skill-record` cells at boot, are exposed through the MCP driver, and are validated locally by `lint-skills`.
- [triage-promotes-via-pipeline-stages.md](triage-promotes-via-pipeline-stages.md) — raw triage notes flow into normative sprint material through five formality-graded stages — `idea`, `review`, `plan-draft`, `spec-edit`, `integrated` — each gated by capability and witnessed in the substrate.
  The pipeline is the normal path; bypass is permitted only for captain-direct edits and incident-response amendments.

## External-system bridges vs. peer federation

- [external-systems-get-drivers-peers-get-federation.md](external-systems-get-drivers-peers-get-federation.md) — bidirectional bridges to non-561 platforms (GitHub, GitLab, Slack, Linear, etc.) are driver records under `specs/drivers/`; peer-to-peer 561 sync is the federation protocol under `specs/network/federation-protocol.md`.
  The two disciplines never mix.

## Implementation-package location

- [pypredcomp-package-location.md](pypredcomp-package-location.md) — the Python substrate is the `pypredcomp` package at `operations/engineering/tools/predication-computer/pypredcomp/`; top-level packages are `substrate`, `storage`, `network`, `drivers`, `shell`, `init_boot`, `process`; runtime entrypoint `substrate.runtime:main`; MCP-driver entrypoint `drivers.mcp_driver:main`.
  Conformance fixtures live under `pypredcomp/tests/fixtures/<area>/`.
  Cross-language Rust sibling at `operations/engineering/services/mash/`.
- [dev-project-relocated-under-pypredcomp.md](dev-project-relocated-under-pypredcomp.md) — the dev project (charter, decisions, specs, plans, questions, references, texts, tasks, implementation guides) lives at `pypredcomp/docs/dev/` (was `operations/command/projects/replit-sprint/`).
  Source-of-truth ordering: predicated-computing library theory → predication-categories library theory → these dev docs → `pypredcomp/src/`.
  Code in `src/` cites spec paths via module docstrings and they resolve under `docs/dev/`.

Each decision file has the form: **what** (the choice), **why** (with archive citations), **what it rules out**, **what it does not constrain**.

## Triage mining audit (sprint realignment)

This audit accompanies task #52's sprint-record realignment.
Every triage idea under `operations/engineering/triage/operations/command/ideas/triage/` not already cited by a MERGED task (#13–#19, #21–#22, #50) was read; its disposition is recorded below.
No idea is silently dropped.

| Triage idea | Disposition |
|---|---|
| `fars-mash-as-packages` | Captured by [pypredcomp-package-location](pypredcomp-package-location.md) (Python side) and [engine-language-rust](engine-language-rust.md) (Rust side). |
| `node-rust-responsibility-split` | Captured by [pypredcomp-package-location](pypredcomp-package-location.md) and [engine-language-rust](engine-language-rust.md): two canonical implementations, both pass the same conformance vectors. |
| `naming-coherence` | Captured by [pypredcomp-package-location](pypredcomp-package-location.md) (rules out parallel `pypred` confusion) and [adopt-predcat-vocabulary](adopt-predcat-vocabulary.md). |
| `system-already-matches-specs` | Operationalised by task #52's record sweep; ongoing audit work belongs to draft #49 (vault-wide grounding-reciprocity audit). |
| `primitive-hierarchy` | Already captured by [everything-is-a-cell-not-a-file](everything-is-a-cell-not-a-file.md) (cell as primitive) and by `regime-record` cell-shape under [regime-classification-is-load-bearing](regime-classification-is-load-bearing.md). The "tick as MASH primitive" framing is captured by [heartbeat-is-the-scheduler](heartbeat-is-the-scheduler.md). |
| `relational-architecture-grounding` | Already captured by the [predicated-computing-grounding](../specs/_patterns/predicated-computing-grounding.md) and [predication-category-grounding](../specs/_patterns/predication-category-grounding.md) patterns and by [events-are-stratified-substrate-is-a-presheaf](events-are-stratified-substrate-is-a-presheaf.md) (σ/Δ as ν/F). |
| `unified-architecture-from-sender-identity` | Already captured by [identity-is-boundary-projection](identity-is-boundary-projection.md), [cheapest-sufficient-computation-tier](cheapest-sufficient-computation-tier.md) (sender→tier mapping), and [authorization-is-modal-restriction](authorization-is-modal-restriction.md) (sender's fiber bounds work). |
| `fars-faoh-mash-architecture-from-first-principles` | Already captured by [single-respond-primitive](single-respond-primitive.md), [self-representation-everywhere](self-representation-everywhere.md), and [events-are-stratified-substrate-is-a-presheaf](events-are-stratified-substrate-is-a-presheaf.md). The "FAOH = harness" face is the agential-layer surface specced in v0.8. |
| `everything-is-messages-from-an-entity` | Already captured by [single-respond-primitive](single-respond-primitive.md) and [self-representation-everywhere](self-representation-everywhere.md): every operation reduces to `respond`; every operative element is a substrate cell. |
| `message-apply-settles-universe` | Already captured by [events-are-stratified-substrate-is-a-presheaf](events-are-stratified-substrate-is-a-presheaf.md) and [specs/kernel/sigma-delta-passes.md](../specs/kernel/sigma-delta-passes.md): respond settles the substrate, not just one fiber. |
| `jsonl-as-holograph-files-as-barcodes` | Already captured by [event-log-is-jsonl](event-log-is-jsonl.md) (JSONL is source of truth) and by the presheaf-storage projection model: file projections are derived views. |
| `graph-is-composition-not-source` | Already captured by [event-log-is-jsonl](event-log-is-jsonl.md) and [events-are-stratified-substrate-is-a-presheaf](events-are-stratified-substrate-is-a-presheaf.md): event log is canon; fiber projections are materialised. |
| `mcp-as-system-api` | Already captured by [agent-surface-is-mcp](agent-surface-is-mcp.md) and [bundled-mcp-catalog-is-normative](bundled-mcp-catalog-is-normative.md). |
| `cells-as-models-mcp-as-io` | Already captured by [everything-is-a-cell-not-a-file](everything-is-a-cell-not-a-file.md) plus [agent-surface-is-mcp](agent-surface-is-mcp.md). |
| `mcp-verb-inventory` | Already captured: t01-30 names the substrate primitive tool catalog (`respond`, `query`, `get_cell`, `get_rule`, `get_fiber`, `entity_history`, `add_rule`, `retire_rule`, `set_alias`, `remove_alias`, `witness`, `evidence`, `node_state`, `peers`, `sync_peer`); skill-discovery verbs added by t02-64. |
| `all-records-are-transactions` | Already captured by [accounting-render-as-hledger](accounting-render-as-hledger.md) and [events-are-stratified-substrate-is-a-presheaf](events-are-stratified-substrate-is-a-presheaf.md) (every event is a transition). |
| `double-entry-operational-accounting` | Already captured by [accounting-render-as-hledger](accounting-render-as-hledger.md). |
| `operational-chart-of-accounts` | Already captured by [accounting-render-as-hledger](accounting-render-as-hledger.md); the chart's specific predicate vocabulary is v0.7 productivity-stack work. |
| `unified-record-sketch` | Already captured by [everything-is-a-cell-not-a-file](everything-is-a-cell-not-a-file.md) and [events-are-stratified-substrate-is-a-presheaf](events-are-stratified-substrate-is-a-presheaf.md): cells carry both narrative and accounting predicates. |
| `lossless-record-compression` | Captured by t02-175 (compaction-on-archive) and by draft #34 (compaction-vs-streaming-replay). The "nuclear retraction" framing is the algebraic basis for that compaction. |
| `relational-expression-syntax` | Already captured by t02-05 (command grammar) and by t02-22 (skill manifest schema as substrate cell). |
| `predication-chain-charter-to-dispatch` | Already captured by [single-respond-primitive](single-respond-primitive.md) and the v0.8 agential-layer plan: dispatch is `respond` composition. |
| `web-gui-messaging` | Already captured by [web-gui-is-day-one](web-gui-is-day-one.md), [web-gui-server-rendered-html](web-gui-server-rendered-html.md), and [inter-session-messaging-is-substrate-cells](inter-session-messaging-is-substrate-cells.md). |
| `persistent-first-officer-session` | Captured by v0.2 process spec (sessions as substrate entities, t02-30…t02-34) and v0.8 agential-layer plan. |
| `four-math-constructs-for-relationality` | Math-library content (humanities/math/categories); not a sprint decision. Cited by the [predication-category-grounding](../specs/_patterns/predication-category-grounding.md) pattern. |
| `algebraic-learning-calculus` | v0.8 agential-layer concern (Voidfleet Academy as fiber enrichment); left in triage with a pointer note pending v0.8 task definition. |
| `continuous-learning-pipeline` | v0.8 agential-layer concern (failure-driven skill/duty refinement); left in triage with a pointer note pending v0.8 task definition. |
| `retirement-as-vocabulary-fold` | v0.8/v0.9 concern (agent retirement as vocabulary promotion). Left in triage with a pointer note; promotion to a decision is not yet ripe. |
| `token-economy-from-predication` | v0.8/v0.9 concern (gamification, token economy as predication-algebra structure). Left in triage with a pointer note; not yet ripe. |
