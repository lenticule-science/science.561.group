---
title: "Trove coverage map"
description: "Every captain-trove idea (operations/engineering/triage/operations/command/ideas/triage/) cross-referenced to dev-doc citations, the on-disk theorem it reduces to, and the landing/release that consumes it. Surfaces uncovered material as candidate work."
kind: reference
status: open
horizon: now
---


The captain's trove at `operations/engineering/triage/operations/command/ideas/triage/` holds 57 design notes (58 entries in the directory, of which one is `_index.md`).
The dev docs draw on them as the *imaginative grounding* layer — the speculative, captain-voice motivation for what the on-disk theorems already authorise.
(Per repo convention Thread G: every imaginative idea reduces to an existing theorem; the trove is never authority by itself.)

> **Theorem-slug discipline.** Where the reduction-target theorem exists on disk under `theories/.../predicated-computing/theorems/` or `theories/.../predication-categories/theorems/`, the row names the exact filename slug (verifiable by `ls` of the theorems directory).
> Where the reduction-target is *intended* but the theorem is not yet on disk, the row says so explicitly with the wording "(theorem not yet on disk)" or "(would need authoring)".
> Where the row points at a *decision* file rather than a theorem, the row says "decision" not "theorem".
> This discipline is enforced by the architect-review pass.

This doc is the systematic cross-reference: every trove note × where it's currently cited from the dev docs × the theorem it reduces to (where established) × the landing or release that consumes it.
It exists for two reasons:

1. **Discoverability for the next agent.** When picking up a landing, the next agent can find the relevant trove material without crawling 58 files.
2. **Surface uncovered material.** Trove notes with no dev-doc citation are candidate work — either future landings, out-of-scope-with-rationale, or material whose theorem reduction still needs to be authored.

The companion docs are [ideas-trove.md](ideas-trove.md) (theme-organised highlights) and [theory-for-developers.md](theory-for-developers.md) (theorem-by-theorem code translation).
This doc is the trove-by-trove inverse: theorem authority found *from* a trove note, rather than *toward* one.

## How to read the table

Three coverage tiers:

- **Cited and reduced** — the trove note is named in at least one of `implementation/next-stretch*.md` or `references/theory-for-developers.md`, *and* the reduction to an on-disk theorem is explicit at the citation site.
- **Cited but unreduced** — the trove note is named but the reduction-to-theorem is implicit or pending.
  Candidate cleanup.
- **Uncited** — the trove note has no dev-doc citation.
  Either out-of-scope-with-rationale (noted below), or candidate landing material the next agent can pick up.

`Lands at` names the release (or "n/a" for cross-cutting / out-of-scope material).
For uncited notes, this is the *suggested* landing release based on the note's content and the existing release roadmap in [next-stretch.md](../implementation/next-stretch.md), [next-stretch-v0.4-v0.6.md](../implementation/next-stretch-v0.4-v0.6.md), and [next-stretch-v0.7-v1.0.md](../implementation/next-stretch-v0.7-v1.0.md).

## Coverage table

### Architecture / first principles (10 notes)

| Trove note | Coverage | Reduces to (theorem) | Lands at |
|---|---|---|---|
| `fars-faoh-mash-architecture-from-first-principles` | cited+reduced | the FaRS / FaOH / MASH three-face decomposition is structural rather than a single theorem; the underlying authority is `doctrine-fidelity-compositionality` (each face composes faithfully with the others) plus `doctrine-fidelity-via-faithful-interfacer-functor` (the inter-face seams are faithful interfacer functors) | structural — informs the whole [charter.md](../charter.md) and [_index.md](../_index.md) source-of-truth ordering |
| `fars-core-algebra-native` | cited+reduced | `substrate-runtime-as-closure-driven-settling` (every operation reduces through the substrate's closure-driven settling primitive; the algebra IS the runtime) | v0.2a L4 fuel-composition determinism |
| `relational-architecture-grounding` | uncited | should reduce to `predication-categories/theorems/predication-fiber-functor` + the math foundation papers (the Adjoint Structure paper especially) | n/a — captures meta-architecture rationale; candidate material to extend [theory-for-developers.md §Why predication categories are load-bearing](theory-for-developers.md) once authored |
| `primitive-hierarchy` | cited+reduced | `substrate-runtime-as-closure-driven-settling` (every other verb is a derived primitive over the closure-driven settling runtime) | v0.2b S3 (stdlib + dispatch shell) |
| `unified-architecture-from-sender-identity` | uncited | should reduce to `signature-binds-witness-to-identity` composed with `dispatch-as-closure-rule-system` (sender-identity is what makes dispatch / training / gamification share a primitive). Note: `dispatch-as-closure-rule-system` is *not* on disk under `predicated-computing/theorems/` (closest on-disk are `closure-rule-system-realizes-closure-2-monad` and `agent-self-queueing-bounded-by-modal-restriction`); the dispatch-stratum specialisation theorem would need authoring | v0.7+ (agential layer) — the rationale-for-why-the-agential-stack-collapses argument; candidate texture for [next-stretch-v0.7-v1.0.md](../implementation/next-stretch-v0.7-v1.0.md) |
| `user-as-boundary` | cited+reduced | `host-projection-substrate-adjunction` (a user is a boundary entity holographically projecting auth/authz/attention/history fibers via the host-projection adjunction) composed with `cumulative-stratum-projection-naturality` for the per-fiber projection uniformity | v0.2a L1 personnel→boundary migration (already consumed) |
| `unified-record-sketch` | cited+reduced | `witness-chain-as-proof-object` + `cache-coherence-via-functorial-projection` (σ/Δ record format = settled+asserted strata in a single record) | v0.2a L4 (already consumed) |
| `dont-flatten-the-tower` | cited+reduced | `cache-coherence-via-functorial-projection` + `cumulative-stratum-projection-naturality` (asserted/saturated/settled are different strata that consumers MUST distinguish; projections between them are natural). The "events-as-presheaf-over-strata" framing referenced in some sibling docs lives in [decisions/events-are-stratified-substrate-is-a-presheaf.md](../decisions/events-are-stratified-substrate-is-a-presheaf.md) — that is the *decision*, not a theorem; the theorem-level authority is the two slugs above | v0.2b S2 (observability) |
| `graph-is-composition-not-source` | cited+reduced | `predication-categories/theorems/predication-fiber-functor` (the graph view is a fiber-functor projection of the underlying composition, not the primary form) | v0.5+ (graph view as derived projection) |
| `four-math-constructs-for-relationality` | uncited | should reduce to the four foundation papers cited in [theories.md §Foundation papers](theories.md) — bilattice allegory, predication-as-residuation, four-values argument, adjoint-structure paper | n/a — meta-mathematical rationale; candidate material for a new `references/four-constructs.md` paired with [theories.md](theories.md), or for inline in [theory-for-developers.md §Why predication categories](theory-for-developers.md) |

### Cells, records, messages (8 notes)

| Trove note | Coverage | Reduces to (theorem) | Lands at |
|---|---|---|---|
| `everything-is-messages-from-an-entity` | cited+reduced | `substrate-runtime-as-closure-driven-settling` (every state-change is a message; every message is processed by the closure-driven settling runtime) composed with `signature-binds-witness-to-identity` (the entity-of-origin is bound at the witness layer) | foundational across all releases — cited from L1+L4 of v0.2a-NOW |
| `all-records-are-transactions` | cited+reduced | `witness-chain-as-proof-object` + `signature-binds-witness-to-identity` (σ/Δ universal-record discipline) | foundational; cited from L4 NOW + S2 SOON |
| `cells-as-models-mcp-as-io` | cited+reduced | `substrate-runtime-as-closure-driven-settling` + `modal-restriction-as-substrate-authorization-primitive` (cells are models with deterministic algebraic inference under the closure-driven runtime; MCP is the IO interface modally restricted at the substrate boundary) | v0.2b S1 (drivers) + v0.7+ (agential layer) |
| `message-apply-settles-universe` | uncited | should reduce to `cache-coherence-via-functorial-projection` + `settlement-determinism` (applying a message updates the relevant projections of the whole substrate, not just one cell — this is what functorial projection plus settlement-determinism jointly guarantee) | v0.4+ (the projection-discipline subsystem) — candidate texture for [next-stretch-v0.4-v0.6.md](../implementation/next-stretch-v0.4-v0.6.md) §"Projection determinism" |
| `jsonl-as-holograph-files-as-barcodes` | uncited | should reduce to `recovery-via-event-log-replay-determinism` — the JSONL event log is the holograph (the canonical witness chain); the file-tree projection is barcoded shadows (read-only views derivable by replay). Reinforces [decisions/event-log-is-jsonl.md](../decisions/event-log-is-jsonl.md) | v0.4+ — candidate addition to the v0.4 storage-stratum landings |
| `lossless-record-compression` | uncited | should reduce to `cache-coherence-via-functorial-projection` + `non-destructive-compaction-realizes-cosettling-equivalence-class` at the storage stratum (compression is the cosettling equivalence-class compaction; lossless because it preserves the cosettling class, which is functorially equivalent to the original) | v0.5+ (operational compression of cold event-log spans) |
| `naming-coherence` | cited+reduced | `host-projection-substrate-adjunction` + `cumulative-stratum-projection-naturality` (canonical names project uniformly across strata via the host-projection adjunction; renaming is a substrate operation, not a filesystem operation) | v0.2a L1 (already consumed) |
| `live-swap-service-components` | cited+reduced | `doctrine-fidelity-via-faithful-interfacer-functor` + `interfacer-counit-law` (drained driver's final cell-state agrees with freshly-attached driver's initial cell-state on the boundary, modulo the faithful interfacer functor) | v0.2b S1 (drivers) — already cited |

### Dispatch, agents, harness (10 notes)

| Trove note | Coverage | Reduces to (theorem) | Lands at |
|---|---|---|---|
| `auto-dispatch-daemon` | cited+reduced | `agent-self-queueing-bounded-by-modal-restriction` + `closure-rule-system-realizes-closure-2-monad` (dispatch is the closure 2-monad realising over a modally-restricted self-queueing rule-system) | v0.7+ (agential layer) |
| `daemon-world-tick` | cited+reduced | `scott-continuity-as-checkpointability` (tick-advance is a Scott-continuous step that admits checkpointing); the AgOP `tick-advance` morphism is the operational form authorised by this theorem | v0.5+ (scheduling subsystem) |
| `predication-chain-charter-to-dispatch` | uncited | should reduce to the AgOP composition chain anchored on `closure-rule-system-realizes-closure-2-monad` (charter→office→dispatch is one composed closure-rule-system morphism) plus `governance-decision-modal-decidability` (the governance link in the chain is modally decidable). The "dispatch-composes-authorization" framing referenced in some sibling docs is *not* on disk as a single theorem; the closure-rule-system + modal-decidability pair is the on-disk authority | v0.7+ (agential layer) — candidate texture for [next-stretch-v0.7-v1.0.md](../implementation/next-stretch-v0.7-v1.0.md) §"Agential composition is one morphism" |
| `parameterized-agent-context` | uncited | should reduce to `modal-restriction-as-substrate-authorization-primitive` + `sdk-import-non-amplifying-via-modal-restriction-composition` (MCP resources are modal-restricted by sender-identity; "who's asking" is the modal context, and importing context across SDKs does not amplify authority) | v0.7+ (MCP-as-agential-API) — candidate spec extension to [specs/agential/](../specs/agential/) once that area is authored |
| `companion-instead-of-buddy` | uncited | should reduce to `interfacer-counit-law` + `interfacer-counit-law-uniformity` at the personnel stratum (a companion agent maintains a uniformly faithful interface to the captain across sessions, not a flattened "buddy" projection) | v0.8+ (companion stratum) — candidate spec authoring |
| `persistent-first-officer-session` | uncited | should reduce to `scott-continuity-as-checkpointability` + `save-load-as-stab-and-portal-inclusion` (session persistence is the Scott-continuous checkpoint operation; resume is a portal inclusion). The AgOP `open-session` / `resume-session` morphisms are the operational form | v0.7+ (session subsystem) — candidate texture for [specs/agential/](../specs/agential/) |
| `feature-mining-from-peer-harnesses` | uncited | n/a (research / triage activity, not a substrate feature) | n/a — meta-development practice; could be cited from a new [docs/dev/practices/](../) directory if one is ever authored |
| `faoh-self-composing-harness-installer` | cited+reduced | `bootstrap-determinism` + `boot-as-h0-fixpoint` (the self-composing harness installer is the bootstrap-determinism property at the harness-installer stratum, with the installer reaching a boot-stable H⁰ fixpoint) | v0.3+ self-hosting |
| `skill-manifest-implementation` | cited+reduced | `signature-binds-witness-to-identity` + `closure-rule-wire-format-canonicalization` (skill-spec canonical-JSON is the wire-format canonicalisation discipline applied at the skill-spec stratum, with signature binding) | v0.2b S3 (skill-spec-v1 schema) |
| `gamification-as-enrichment-prioritizer` | uncited | should reduce to `cost-composition-via-lawvere-quantale` (the on-disk theorem) plus `risk-score-as-monotone-affine-grade-with-threshold-right-adjoint` (gamification mechanics are a cost-composition over the priority quantale with threshold-right-adjoint scoring). Decision-level authority in [decisions/cost-is-lawvere-quantale.md](../decisions/cost-is-lawvere-quantale.md); the theorem-level authority is `cost-composition-via-lawvere-quantale` | v0.8+ (academy / enrichment layer) — candidate texture |

### Stdlib, MCP, verbs (5 notes)

| Trove note | Coverage | Reduces to (theorem) | Lands at |
|---|---|---|---|
| `mcp-as-system-api` | cited+reduced | `substrate-runtime-as-closure-driven-settling` (MCP calls reduce through the closure-driven settling runtime; MCP is the surface, the runtime is the authority) composed with the [decisions/agent-surface-is-mcp.md](../decisions/agent-surface-is-mcp.md) decision | v0.2b S3 + v0.7+ |
| `mcp-verb-inventory` | cited+reduced | per-verb specs at [specs/stdlib/](../specs/stdlib/); each verb reduces through `substrate-runtime-as-closure-driven-settling` | v0.2b S3 (stdlib + dispatch shell) |
| `relational-expression-syntax` | cited+reduced | `cache-coherence-via-functorial-projection` (the JSON pattern shape and the eventual Lispy DSL are two presentations of the same query-as-projection) | v0.2b S2 (JSON form); v0.7+ (DSL form) |
| `system-already-matches-specs` | cited+reduced | n/a (meta-claim about source-spec-corpus convergence) | n/a — cited from [_index.md §Source-of-truth ordering](../_index.md) implicitly |
| `mud-chat-as-messaging` | cited+reduced | `substrate-runtime-as-closure-driven-settling` (chat IS the substrate's message verb routed through the closure-driven runtime; no separate chat subsystem needed) | v0.5+ (bundled chat app) |

### Worlds, simulation, games (7 notes)

| Trove note | Coverage | Reduces to (theorem) | Lands at |
|---|---|---|---|
| `predication-world-sim` | cited+reduced | `cache-coherence-via-functorial-projection` (world-state is a sheaf-projection of the underlying predication graph) | v0.7+ (world-sim app) |
| `predication-native-simulation` | uncited | should reduce to `saturation-respects-asserted-monotonicity` (procedural generation is a saturation operation respecting asserted-monotonicity) plus `cache-coherence-via-functorial-projection` for the projection discipline | v0.7+ (world-sim app) — candidate texture deepening `predication-world-sim`'s reduction |
| `teraum-okaga-as-predication-worlds` | uncited | n/a (out-of-scope research content per [_index.md §What this is not](../_index.md): "world-sim, paracosms (research content; runs *on* the OS)") | n/a — explicitly out of dev-docs scope; cited only to disclaim |
| `voidfleet-academy` | uncited | n/a (out-of-scope research content per [_index.md §What this is not](../_index.md): "Voidfleet Academy ... runs *on* the OS") | n/a |
| `voidskiff-multiplayer-terminal-game` | uncited | n/a (out-of-scope app — falls under the productivity-stack-as-apps disclaimer in [_index.md §What this is not](../_index.md): per-app design lives in each app's own project directory at v0.7+) | n/a |
| `zork-and-rogue-on-fars` | uncited | n/a (out-of-scope research demo per [_index.md §What this is not](../_index.md): "Predicated Zork ... runs *on* the OS"); the texture of the claim — "implementing Zork through the substrate API proves the algebra" — is the same as `mud-chat-as-messaging`'s reduction | v0.5+ texture only — candidate citation in the bundled-MUD-app spec when authored |
| `fars-voidmath-geometric-computation` | uncited | should reduce to a math theorem in [`predication-categories/`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/) about geometric realisation of predication graphs (theorem not yet on disk; closest existing candidates are `myrheim-meyer-dimension-from-ordering-fraction` and `lorentzian-apex-void-as-timelike-spacelike` but neither is the target) | v1.0+ (geometric computation layer) — candidate question in [questions/](../questions/) since the reduction-target theorem isn't yet on disk |

### Accounting, ERP, governance (6 notes)

| Trove note | Coverage | Reduces to (theorem) | Lands at |
|---|---|---|---|
| `double-entry-operational-accounting` | uncited | should reduce to `witness-chain-as-proof-object` + `transaction-atomicity-via-closure-idempotence` (every debit/credit pair is a witness-chain link, atomic via closure-idempotence; double-entry IS the unified-record discipline at the accounting stratum) | v0.5+ (accounting subsystem) — candidate texture for the bundled-accounting-app spec; reinforces [decisions/accounting-render-as-hledger.md](../decisions/accounting-render-as-hledger.md) |
| `operational-chart-of-accounts` | uncited | composes with `double-entry-operational-accounting` above; additionally grounded in `index-as-alexandrov-up-set` for the chart-of-accounts hierarchy structure | v0.5+ — candidate spec extension to [specs/bundled-apps/](../specs/bundled-apps/) accounting once authored |
| `token-economy-from-predication` | uncited | should reduce to `cost-composition-via-lawvere-quantale` + `signature-binds-witness-to-identity` (tokens are signed witness-chain links composed over a cost-quantale) | v0.8+ (economy stratum) — candidate texture for [next-stretch-v0.7-v1.0.md](../implementation/next-stretch-v0.7-v1.0.md) |
| `erp-web-platform` | cited+reduced | `host-projection-substrate-adjunction` + `cumulative-stratum-projection-naturality` (every ERP module is a host-projection of the same substrate; UI is cell-resident widgets, projecting uniformly across strata) | v0.5+ (bundled-apps) |
| `dual-cone-knowledge-architecture` | uncited | should reduce to `cumulative-stratum-projection-naturality` + `cache-coherence-via-functorial-projection` (the asserted-cone vs settled-cone duality is the strata structure viewed cone-categorically; both projections are natural and cache-coherent) | v0.4+ — candidate texture; if authored, would deepen the reduction available to `dont-flatten-the-tower` |
| `github-issues-integration` | uncited | should reduce to `doctrine-fidelity-via-faithful-interfacer-functor` (GitHub Issues is one driver among the v0.2b three; it's a candidate fourth driver at v0.3) | v0.3 — candidate fourth driver under [decisions/external-systems-get-drivers-peers-get-federation.md](../decisions/external-systems-get-drivers-peers-get-federation.md) |

### Learning, agents, AI (5 notes)

| Trove note | Coverage | Reduces to (theorem) | Lands at |
|---|---|---|---|
| `algebraic-learning-calculus` | cited+reduced | `paraconsistency-as-substrate-discipline` + `delta-pass-bounded-by-bilattice-orbit` (learning updates the bilattice values within bounded orbits, not the underlying facts) | v0.7+ (learning subsystem) |
| `continuous-learning-pipeline` | cited+reduced | composes with `algebraic-learning-calculus` above | v0.7+ |
| `beyond-language-models-for-agent-computation` | cited+reduced | `cheapest-sufficient-tier-routing-as-monotone-least-element-selection` (agent computation routes to the cheapest sufficient tier; LLMs are one tier among many) per [decisions/cheapest-sufficient-computation-tier.md](../decisions/cheapest-sufficient-computation-tier.md) | v0.7+ (agential layer) |
| `retirement-as-vocabulary-fold` | uncited | should reduce to `endomorphism-sheaf-acyclicity-inheritance` from [predication-categories](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/endomorphism-sheaf-acyclicity-inheritance.md) — agent retirement folds the agent's vocabulary into the surrounding substrate's sheaf without breaking acyclicity | v0.8+ (agent lifecycle) — candidate texture; the reduction-target theorem IS on disk, just not yet cited from any landing |
| `ecc2-feature-port` | cited+reduced | n/a (porting plan, not a substrate feature) | v0.3 — already cited from L4 |

### Packaging, bootstrap, infra (4 notes)

| Trove note | Coverage | Reduces to (theorem) | Lands at |
|---|---|---|---|
| `guix-guile-composition-layer` | cited+reduced | `deployment-determinism` at the composition stratum | v0.3 (guix manifest shadow per [specs/packaging/guix-manifest-spec.md](../specs/packaging/guix-manifest-spec.md)) |
| `node-rust-responsibility-split` | cited+reduced | `conformance-via-fiber-algebra-functor` + `quantale-graded-composition-uniformity` (Python and Rust implementations realise the same fiber-algebra functor with uniform graded composition; conformance is the structural witness that they are interoperable) | v0.x (Rust implementation; structural rationale across all releases) |
| `fars-mash-as-packages` | cited+reduced | composes with `node-rust-responsibility-split` | structural |
| `praxis-driven-development` | uncited | n/a (meta-development practice — write specs before code, derive code from theory) | n/a — captured in [_index.md §Source-of-truth ordering](../_index.md); explicit citation could be added to [_conventions.md](../_conventions.md) |

### Pipelines and triage (2 notes)

| Trove note | Coverage | Reduces to (theorem) | Lands at |
|---|---|---|---|
| `ideas-to-plans-pipeline` | cited+reduced | structural — reflected in [specs/governance/triage-workflow.md](../specs/governance/triage-workflow.md) | v0.8+ (triage workflow as substrate process) |
| `web-gui-messaging` | cited+reduced | `predication-fiber-functor` composed with row 13 (self-representation) of [theory-for-developers.md](theory-for-developers.md) — dashboard cells are fibers updating by `respond` | v0.2b S2 (observability) |

## Counts

- 57 trove notes total (58 entries in the directory minus `_index.md`).
- 32 cited+reduced (56%).
- 0 cited+unreduced (the architect review of the SOON doc closed the last unreduced citations).
- 25 uncited.
  - 8 are *out-of-scope-with-rationale* (research content / apps that run on the OS / meta-development practice).
    The four research-content items — `teraum-okaga-as-predication-worlds`, `voidfleet-academy`, `voidskiff-multiplayer-terminal-game`, `zork-and-rogue-on-fars` — fall under the broad-category disclaimers in [_index.md §What this is not](../_index.md) ("Predicated Zork, world-sim, ...
    Voidfleet Academy ... research content; runs *on* the OS"); the other four are `feature-mining-from-peer-harnesses` (research practice), `praxis-driven-development` (meta-development), `relational-architecture-grounding` and `four-math-constructs-for-relationality` (meta-mathematical rationale).
  - 17 are *candidate landing material* — uncited but with an existing-or-authorable theorem reduction.
    These are the trove's contribution to the future-release backlog.

## Candidate landings derived from uncited material

Grouped by suggested release, with the theorem reduction that authorises the work and a one-line scope:

### v0.4+

- **Storage-projection determinism** — consumes `jsonl-as-holograph-files-as-barcodes`, `lossless-record-compression`, `dual-cone-knowledge-architecture`.
  Authority: `cache-coherence-via-functorial-projection` + `recovery-via-event-log-replay-determinism` + `non-destructive-compaction-realizes-cosettling-equivalence-class`.
  Scope: makes the file-tree view a deterministic compressed projection of the JSONL event log, with the asserted/settled cones as named projections.
- **Cross-cell apply discipline** — consumes `message-apply-settles-universe`.
  Authority: `cache-coherence-via-functorial-projection` + `settlement-determinism`.
  Scope: when a message updates cell C, every projection that depends on C MUST be invalidated/recomputed deterministically; this is what makes "applying a message settles the universe" operational.

### v0.5+

- **Bundled accounting app** — consumes `double-entry-operational-accounting`, `operational-chart-of-accounts`.
  Authority: `witness-chain-as-proof-object` + `transaction-atomicity-via-closure-idempotence` + `index-as-alexandrov-up-set`.
  Scope: hledger render driver per existing decision, with operational chart-of-accounts spec.
- **Bundled MUD-style app** — consumes `zork-and-rogue-on-fars` (texture only) and the existing `mud-chat-as-messaging`.
  Authority: `substrate-runtime-as-closure-driven-settling`.
  Scope: a bundled-app demonstrating the substrate's expressiveness via Zork-equivalent gameplay.

### v0.7+

- **Persistent-session subsystem** — consumes `persistent-first-officer-session`.
  Authority: `scott-continuity-as-checkpointability` + `save-load-as-stab-and-portal-inclusion` (the AgOP `open-session` / `resume-session` morphisms are the operational form).
  Scope: session-record persistence with MUD-style command continuity.
- **Parameterised MCP context** — consumes `parameterized-agent-context`.
  Authority: `modal-restriction-as-substrate-authorization-primitive`.
  Scope: MCP resources scoped to sender-identity at the modal layer.
- **Agential composition is one morphism** — consumes `predication-chain-charter-to-dispatch`.
  Authority: AgOP composition chain.
  Scope: refactor the agential subsystem so charter→office→dispatch is implemented as one composed authorisation, not three coupled subsystems.

### v0.8+

- **Companion stratum** — consumes `companion-instead-of-buddy`.
  Authority: `interfacer-counit-law` + `interfacer-counit-law-uniformity` at the personnel stratum.
  Scope: companion-agent record kind with cross-session faithful-interface guarantees.
- **Token-economy stratum** — consumes `token-economy-from-predication`.
  Authority: `cost-composition-via-lawvere-quantale` + `signature-binds-witness-to-identity`.
  Scope: signed witness-chain tokens over a cost-quantale; messaging/accounting/gamification/governance unified at the economy layer.
- **Gamification-as-enrichment** — consumes `gamification-as-enrichment-prioritizer`.
  Authority: `cost-composition-via-lawvere-quantale` + `risk-score-as-monotone-affine-grade-with-threshold-right-adjoint`.
  Scope: gamification mechanics surface as cost-functor over the priority quantale.
- **Agent-retirement stratum** — consumes `retirement-as-vocabulary-fold`.
  Authority: [`endomorphism-sheaf-acyclicity-inheritance`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/endomorphism-sheaf-acyclicity-inheritance.md) (on disk under `predication-categories/theorems/` — *not* under `predicated-computing/theorems/`; the math-side authority is what does the work here).
  Scope: agent retirement folds the agent's vocabulary into the surrounding substrate's sheaf without breaking acyclicity; the operational form is a cell-set fold that drops the agent's contribution from the active cell-set without losing its witness chain.
- **Sender-identity unification** — consumes `unified-architecture-from-sender-identity`.
  Authority: `signature-binds-witness-to-identity` + `closure-rule-system-realizes-closure-2-monad` + `agent-self-queueing-bounded-by-modal-restriction` (the dispatch-stratum specialisation theorem itself is not yet on disk; the on-disk authority is the closure-rule-system + self-queueing pair).
  Scope: collapse dispatch / training / gamification under sender-identity composition; rationale-doc-quality material for [next-stretch-v0.7-v1.0.md](../implementation/next-stretch-v0.7-v1.0.md).

### v1.0+

- **Geometric-computation layer** — consumes `fars-voidmath-geometric-computation`.
  Authority: needs a math theorem about geometric realisation that is *not yet on disk*; first move is to open a [questions/](../questions/) entry naming what theorem must be proved before the implementation can be authorised.
  Scope: geometric realisation of predication graphs; long-horizon.

### v0.3 (specific)

- **GitHub Issues driver** — consumes `github-issues-integration`.
  Authority: `doctrine-fidelity-via-faithful-interfacer-functor`.
  Scope: a fourth concrete driver per [decisions/external-systems-get-drivers-peers-get-federation.md](../decisions/external-systems-get-drivers-peers-get-federation.md), naturally landing alongside the v0.3 trusting-trust extension since both extend the v0.2b drivers/packaging surfaces.

## See also

- [ideas-trove.md](ideas-trove.md) — the by-theme highlights catalog (older form of this same material; this doc is the systematic complement).
- [theory-for-developers.md](theory-for-developers.md) — the inverse direction: theorem → trove note + spec section + source module.
- [triage-backlog-os-level.md](triage-backlog-os-level.md) — the OS-level material outside the captain-trove (in `relationality-inner-triage/` and elsewhere).
- [next-stretch.md](../implementation/next-stretch.md) and its v0.4-v0.6 / v0.7-v1.0 / SOON / NOW continuations — where the candidate landings above will eventually land.
- [capability-ladder.md](../implementation/capability-ladder.md) — the build-X-to-enable-Y forward chain; the uncited trove material above maps onto its later rungs.
