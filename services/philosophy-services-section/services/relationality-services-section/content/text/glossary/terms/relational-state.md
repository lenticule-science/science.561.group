---
name: "Relational State"
description: "The configuration a relational entity occupies at a given moment of inquiry — its settlement position within the framework's joint space of evidence. The dynamic, momentary face of an entity that is otherwise stable."
date-created: 2026-04-28
extends: State
params:
  history-monoid: relational-history
  fiber-family: relational-universe-morphism
  restriction-maps: relational-universe-morphism
output: relational-universe
ast:
  nuclear-presheaf:
    - history-monoid
    - fiber-family:
        - history-monoid
    - restriction-maps:
        - fiber-family
        - history-monoid
    - commuting-nucleus-pair:
        - fiber-family
id: relational-state
date-modified: 2026-03-19
see-also:
  - relating
  - relational-entity
  - relational-field
  - settlement
  - "true"
  - "false"
  - absurd
  - determination
---

A **relational state** is the configuration that a [relational entity](relational-entity.md) occupies at a given moment of inquiry. Where the entity is the stable pattern, the state is the specific position the pattern is at right now: the witnessings that have been performed, the [settlement](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/settlement.md) the entity has reached, the constraints the entity is under given current evidence.

The state is not a smaller version of the entity; it is the entity's position in the framework's evolving structure of relations. An entity has many states across the course of its life — it enters into new relations, has old ones dissolved, has its settlement shift as evidence accumulates. The entity persists across these states because its underlying configuration of relating persists, but each state is a distinct momentary configuration.

## State and settlement

A relational state corresponds, formally, to a position in the four-cornered [settlement](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/settlement.md) structure: a joint position on the truth axis ([true](true.md) ↔ [false](false.md)) and the knowledge axis ([absurd](absurd.md) ↔ [determination](determination.md)). The entity's state at a given moment is its settlement at that moment — the joint position the framework has reached for the relations that constitute the entity, given the witnessing that has so far been performed.

States change as [relating](../../../../../../content/text/glossary/terms/relating.md) continues. Each act of relating moves the settlement: adding evidence raises the knowledge-axis position; the direction of evidence tilts the truth-axis position; some acts dissolve evidence and lower the knowledge axis. The trajectory of states across moments is the entity's *history* — but the framework does not require time to be linear or states to accumulate in a fixed order. What it requires is that each state be a coherent settlement position.

## State as condition

The framework distinguishes *acts* (dynamic operations that initiate or modify relational coherence) from *conditions* (stabilized states resulting from acts). A relational state is the formal counterpart of a condition: it is what remains after an act of relating has reached settlement. The condition that an entity is *included* in another is the state where the inclusion relation has been settled and is currently witnessed; the condition is what the state *is*. Acts produce states; states are the residue of acts that have completed their work.

## State as the unit of inquiry

When inquiry asks *where is this now?* about an entity, the answer the framework gives is the entity's relational state. The question is local and momentary; the answer is local and momentary. Persistence across many states is the entity's continuity; the framework gives no privileged state that is the *true* one. Different inquiries reach different states; the same inquiry at different moments reaches different states; the framework treats all of these as equally legitimate readings of the same entity at the moments they capture.

## What this is

A **RelationalState** is the [State](../../../../../../content/text/glossary/terms/state.md) type of a [RelationalMachine](../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/lenticule-science-corpus/relational-machine.md).
It is a presheaf $H: M(\Sigma, I)^{op} \to \mathbf{HA}_\mathrm{nucl}$: a family of fiber Heyting algebras $H_t$ indexed by histories $t \in M(\Sigma, I)$, with restriction maps $\rho: H_{t'} \to H_t$ for $t \leq t'$.

A RelationalState is not a single fiber.
It is the entire indexed family — all fibers simultaneously present, connected by the restriction maps.

## Sections and fibers

A **section** of the RelationalState at history $t$ is $H_t$ — the fiber Heyting algebra at that history.
$H_t$ is what the RelationalMachine holds "in focus" at history $t$ — formally, a [Focus](../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/focus.md) $(H, t)$.

The **settled sub-state** at $t$ is $H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ — the image of the composite retraction $\pi_t = \sigma_t \circ \Delta_t$.
$H^*_t$ is the portion of $H_t$ with stable truth values under both nuclei.

## Mathematical grounding

The fiber Heyting algebra structure is established in the math entitys for the relational machine.
The presheaf axioms (identity and composition of restriction maps) are part of the accord condition — [accord](../../../../../../../social-science-services-section/content/text/glossary/terms/accord.md).
The two commuting nuclei $\sigma_t$ and $\Delta_t$ are established in [nucleus](../../../../services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/library/relational-hyperverse-repository/math/nucleus.md) and the fiber algebra math entitys.
A RelationalState MUST be a presheaf over $M(\Sigma, I)^{op}$ valued in Heyting algebras with nuclei.
Its restriction maps MUST be Heyting algebra homomorphisms — [accord](../../../../../../../social-science-services-section/content/text/glossary/terms/accord.md).
Each fiber MUST carry two commuting nuclei $\sigma_t$, $\Delta_t$ — [nucleus](../../../../services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/library/relational-hyperverse-repository/math/nucleus.md).
$\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ MUST hold — commutativity, proved in the math layer.

## Relation to flat State

A flat [State](../../../../../../content/text/glossary/terms/state.md) is a set element — structureless.
A RelationalState is algebraically rich: each fiber is a Heyting algebra, the fibers are connected by Heyting algebra homomorphisms (the restriction maps), and each fiber carries two commuting nuclei.
The flat-set projection of a RelationalState is just the carrier set of the current fiber $H_t$ — it loses the algebraic structure, the nuclei, and the restriction maps.

## Open questions

- Whether the RelationalState must be a sheaf (not just a presheaf) — the sheaf condition corresponds to the accord/gluing condition and is what makes global sections well-defined.
  Currently treated as a sheaf; the exact statement is in [accord](../../../../../../../social-science-services-section/content/text/glossary/terms/accord.md).

## See also

- [Relational entity](relational-entity.md) — the stable pattern whose configuration a state describes.
- [Relating](../../../../../../content/text/glossary/terms/relating.md) — the act that produces and transforms states.
- [Relational field](relational-field.md) — the totality of states across all moments and entities.
- [Settlement](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/settlement.md) — the joint structure within which a state is a position.
- [Predication fiber algebra](../../../../../../math/theories/voidmath/terms/predication-fiber-algebra.md) — the mathematical structure that holds settlement values across cells.
