# Flatfile Agentic Resource System (FARS)

A normative specification of an [agential orchestration platform](../../objects/agentic-orchestration-platform.md) whose [predication-graph store](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) is *a directory of frontmatter-markdown files on a filesystem*.
Each `.md` file is one entity, the file's frontmatter is its predications-in-presentation-form (per [frontmatter-as-presentation](flatfile/frontmatter-as-presentation/frontmatter-as-presentation.md)), and the file's body is its rendered surface.
FARS is a sub-theory of AgOP — it inherits AgOP's structural commitments and adds the specifications a flatfile-substrate platform requires (substrate I/O, presentation/algebra interpretation, the algebra at the four-valued bilattice value-domain, dispatch/tick/heartbeat for live operation, federation, harness-exposure surfaces).

FARS is *the whole agent-orchestration system at the flatfile substrate*: substrate, algebra, scheduler, governance, harness surfaces (CLI, MCP, programmatic API) are all in scope.
There is no separate "harness layer" sitting above FARS or "runtime layer" sitting below it — those concerns are part of FARS's own commitments.
(Earlier documentation split FAOH and MASH out as separate layers; that decomposition is deprecated.
AgOP allows other realizations — like the Rust [`mash-rust-engine`](../mash-rust-engine/mash-rust-engine.md) — to make different choices, but FARS the spec covers all of them at the flatfile substrate.)

## Position

FARS is a *spec*, not an implementation.
A conformant FARS realization is any system that satisfies the morphism signatures, the object record shapes, the normative invariants, and the cross-cutting commitments stated here.
Multiple implementations are admissible; one is being developed at [operations/engineering/fars/](../../../../../../../../../../../../../operations/tools/corpus/) (slated to rename to `tools/fars/`) and will be documented under [`examples/`](examples/) as evidence of conformance once the spec stabilizes.

The spec is grounded in three bodies of work:

- **The AgOP and RC parent theories.** FARS depends on the substrate-value-domain (committing to the four-valued bilattice), the predication-graph store, the closure-rule discipline, witness chains, the heartbeat scheduler concept, dispatch composition, and the agential self-generation invariant.
  Where the parent theories have first-class entities, FARS instantiates them; where they have only inlined material, FARS contributes upstream concepts or files upstream questions per the methodology below.
- **Prior FARS research.** Three years of analyses, design ideas, and architectural decisions — the [FARS-analyses](../../../../../../../../../../../../../operations/engineering/research/triage/operations/engineering/research/agentic-orchestration-platform/triage/fars-analyses/) corpus, the [from-first-principles ideas](../../../../../../../../../../../../../operations/engineering/research/triage/operations/command/ideas/triage/) (algebra-native query, voidmath geometry, σ/Δ identification, FAOH/MASH derivation), the architecture-coherence and core-extraction plans.
  The spec absorbs the substantive engineering claims and discards the obsoleted decompositions.
- **Related-systems analyses.** Studies of how LPMud heartbeats, Bussard-style message-as-primitive systems, Kafka log-as-database, openclaw, claude-code, openhands, and other agent-orchestration systems inform FARS design.
  These constrain FARS's choices on tick semantics, message reification, event-log shape, session boundaries, and harness surfaces.

The spec absorbs each of these and states what FARS commits to as a sub-theory of AgOP at the flatfile substrate.

## Layout

This sub-theory follows the canonical AgOP/RC theory layout:

- [`concepts/`](concepts/) — FARS-specific semantic anchors.
  Concepts that recur across this sub-theory's content but do not exist as standalone notes in AgOP or RC.
- [`objects/`](objects/) — definition records: the typed substrate-records FARS commits to (Note, Fiber, Witness, …).
  Per-record bodies state required fields, invariants, and position.
- [`morphisms/`](morphisms/) — operators: the substrate-API morphisms FARS commits to (load, interpret, compose, restrict, settle, respond, dispatch, …).
  Per-morphism bodies state signatures, operational semantics, and normative invariants.
- [`theorems/`](theorems/) — claims about the spec (e.g., settlement-determinism at the FARS value-domain, locality bounds, replay equivalence).
  Current theorems: [flatfile-federation-equivalence](flatfile-federation-equivalence/flatfile-federation-equivalence.md), [heartbeat-converges-under-strict-regime](heartbeat-converges-under-strict-regime/heartbeat-converges-under-strict-regime.md), [instinct-confidence-is-closure-fixpoint-measure](instinct-confidence-is-closure-fixpoint-measure/instinct-confidence-is-closure-fixpoint-measure.md), [rule-addition-is-substrate-local](rule-addition-is-substrate-local/rule-addition-is-substrate-local.md), [scope-composition-is-knowledge-order-monotone](scope-composition-is-knowledge-order-monotone/scope-composition-is-knowledge-order-monotone.md).
- [`examples/`](examples/) — concrete realizations (a Python CLI implementation, a hypothetical alternative implementation, deployment variants).
- [`narratives/`](narratives/) — walk-throughs that trace material across multiple notes.
  The first one ([`input-inference-output`](input-inference-output/input-inference-output.md)) traces a message from arrival to settled response.
- [`questions/`](questions/) — open FARS-specific questions.
  Questions about substrate-general concerns are filed upstream in AgOP or RC per the cross-theory methodology.
- [`references/`](references/) — citations to the prior-art corpus and external system analyses.

## Cross-theory references

FARS notes point upstream into AgOP and RC.
The frontmatter conventions:

- `instantiates:` — the FARS doc realizes / specializes / makes-concrete the listed AgOP or RC entities.
  A FARS object instantiates an AgOP object; a FARS morphism instantiates an AgOP morphism; a FARS concept may instantiate an AgOP or RC concept it concretizes for the flatfile substrate.
- `depends-on:` — the FARS doc reads from the listed entities (any theory).
  The standard predication-graph-store dependency edge.
- `see-also:` — non-load-bearing related entities.

When a FARS note wants to cite an AgOP/RC concept that is currently only inlined in another upstream note, the resolution is one of:

1. *Author the standalone upstream note*, grounded entirely in its own theory, with no forward pointer to FARS.
  (Done already for [`predication-fiber`](../../../teaching/explanations/predication-fiber.md).)
2. *File a question in the upstream theory* citing this realization as motivation, when the right shape of the upstream concept is itself uncertain.
  (Done already for [`presentation-and-algebraic-layers`](../../../questions/presentation-and-algebraic-layers.md).)

Upstream gaps are surfaced explicitly to the user after each authoring turn rather than fixed silently.

## Vocabulary translation

Earlier FARS documentation uses a different vocabulary than the current AgOP/RC corpus.
This sub-theory uses the current vocabulary.
A non-exhaustive translation:

| Earlier term | Current reading in FARS |
|---|---|
| respond() | (placeholder name) the inference primitive realized via [`settle`](code/transformers/settle.md) over a fiber extended by an admitted message; see [`morphisms/respond.md`](code/transformers/respond.md) |
| fiber | [predication-fiber](../../../teaching/explanations/predication-fiber.md) (RC concept) instantiated as the [`Fiber`](code/structures/fiber.md) record at FARS's value-domain |
| EAVT cache | a content-addressed projection of the [predication-graph store](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md); admissible as a derived view per [source-of-truth](../../../teaching/explanations/source-of-truth.md) |
| settle.js | [`settle`](code/transformers/settle.md) at FARS's value-domain instantiation |
| FAOH (deprecated) | absorbed into FARS — the harness-exposure surfaces (CLI, MCP, programmatic API) are part of FARS, not a separate layer or sub-theory |
| MASH (a different sub-theory's territory) | the AgOP runtime concerns (heartbeat loop, daemon supervision, session management) are *included in FARS* at the flatfile substrate; the AgOP example [`mash-rust-engine`](../mash-rust-engine/mash-rust-engine.md) is a peer realization at a different substrate, not an external layer FARS depends on |

## Status

Draft.
Eight spec sections are in place; two remain.

**Drafted:**

- *Algebra core* (input → inference → output).
  Objects: [`Note`](objects/note.md), [`Fiber`](code/structures/fiber.md), [`Witness`](objects/witness.md), [`Edge`](objects/edge.md).
  Morphisms: [`load`](morphisms/load.md), [`interpret`](code/transformers/interpret.md), [`compose`](morphisms/compose.md), [`restrict`](code/transformers/restrict.md), [`settle`](code/transformers/settle.md), [`respond`](code/transformers/respond.md), [`dispatch`](morphisms/dispatch.md).
  Concepts: [`flatfile`](flatfile/flatfile.md), [`frontmatter-as-presentation`](flatfile/frontmatter-as-presentation/frontmatter-as-presentation.md), [`entity-as-model`](entity/entity-as-model.md).
  Narrative: [input-inference-output](input-inference-output/input-inference-output.md).
- *Substrate edit discipline*.
  Concepts: [`event-sourcing`](concepts/event-sourcing.md), [`validation-as-settlement`](settlement/validation-as-settlement/validation-as-settlement.md).
  Objects: [`Event`](objects/event.md), [`Channel`](objects/channel.md).
  Morphisms: [`emit-event`](code/transformers/emit-event.md), [`apply-edit`](code/transformers/apply-edit.md).
- *Closure rule system*.
  Concepts: [`four-layer-rule-architecture`](architecture/four-layer-rule-architecture/four-layer-rule-architecture.md).
  Objects: [`ClosureRuleRecord`](objects/closure-rule-record.md), [`ClosureRuleSystem`](objects/closure-rule-system.md).
- *Tick & heartbeat*.
  Concepts: [`tick-as-iteration`](tick-as-iteration/tick-as-iteration.md), [`declared-dependency-ordering`](declared-dependency-ordering/declared-dependency-ordering.md), [`anomaly-as-contradiction`](settlement/anomaly-as-contradiction/anomaly-as-contradiction.md).
  Objects: [`HeartbeatRecord`](objects/heartbeat-record.md).
  Morphisms: [`advance-tick`](code/transformers/advance-tick.md), [`heartbeat-cycle`](code/transformers/heartbeat-cycle.md).
- *Skills, runbooks, agents, offices*.
  Concepts: [`office-as-fuzzy-cell`](office-as-fuzzy-cell/office-as-fuzzy-cell.md), [`seven-channel-decomposition`](architecture/seven-channel-decomposition/seven-channel-decomposition.md), [`formality-progression`](formality-progression/formality-progression.md).
  Objects: [`AgentRecord`](objects/agent-record.md), [`SkillRecord`](objects/skill-record.md), [`RunbookRecord`](objects/runbook-record.md), [`OfficeRecord`](objects/office-record.md).
  Morphisms: [`invoke-skill`](code/transformers/invoke-skill.md), [`execute-runbook`](code/transformers/execute-runbook.md).
- *Sessions*.
  Concepts: [`three-tier-memory`](architecture/three-tier-memory/three-tier-memory.md), [`session-as-entity`](entity/session-as-entity/session-as-entity.md), [`consolidation-as-settlement`](settlement/consolidation-as-settlement/consolidation-as-settlement.md).
  Objects: [`SessionRecord`](objects/session-record.md), [`ObservationRecord`](objects/observation-record.md), [`InstinctRecord`](objects/instinct-record.md).
  Morphisms: [`open-session`](morphisms/open-session.md), [`resume-session`](morphisms/resume-session.md), [`close-session`](morphisms/close-session.md), [`consolidate`](code/transformers/consolidate.md).
- *Scope & authorization*.
  Concepts: [`scope-as-fiber`](scope-as-fiber/scope-as-fiber.md), [`modal-restriction`](modal-restriction/modal-restriction.md), [`kit-assembly`](kit-assembly/kit-assembly.md).
  Objects: [`ModeRecord`](objects/mode-record.md).
  Morphisms: [`check-authorization`](code/transformers/check-authorization.md), [`transition-mode`](code/transformers/transition-mode.md), [`assemble-kit`](code/transformers/assemble-kit.md).
- *Federation*.
  Concepts: [`content-hash-addressing`](flatfile/content-hash-addressing/content-hash-addressing.md), [`sovereign-node`](architecture/sovereign-node/sovereign-node.md), [`bounded-vocabulary-handshake`](bounded-vocabulary-handshake/bounded-vocabulary-handshake.md), [`algebra-as-protocol`](algebra-as-protocol/algebra-as-protocol.md).
  Objects: [`PeerRecord`](code/structures/peer-record.md), [`FederationEnvelopeRecord`](objects/federation-envelope-record.md).
  Morphisms: [`merge-peer`](code/transformers/merge-peer.md), [`emit-federation-envelope`](code/transformers/emit-federation-envelope.md), [`admit-federation-envelope`](code/transformers/admit-federation-envelope.md), [`replay-from-peer`](code/transformers/replay-from-peer.md).
  Theorem (sketch): [`flatfile-federation-equivalence`](flatfile-federation-equivalence/flatfile-federation-equivalence.md).
  Narrative: [peer-arrival-to-settlement](peer-arrival-to-settlement/peer-arrival-to-settlement.md).

**Major spec sections still to write** (each derived from the prior-art survey): - **Harness surfaces & interfacers** — boundary-as-fiber-composition, transport-independence, the three interfacer operations (extract/apply/compose), the counit law, the cost settlement path. - **Self-representation invariants** — every operative element (skills, rules, types, governance, the heartbeat itself) is itself a substrate entity.
Likely a theorem rather than a section.

**Learning & feedback** is a related section the prior-art survey surfaced; it MAY end up as part of skills/runbooks/agents (the CL pipeline produces instinct/skill entities) or as its own section.
Deferred until the agent-side machinery lands.
