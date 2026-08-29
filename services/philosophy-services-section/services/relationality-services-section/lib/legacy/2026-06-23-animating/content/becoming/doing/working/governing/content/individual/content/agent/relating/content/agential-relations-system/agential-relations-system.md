---

description: "An Agential Relations System is a Relations System where agents operate on it using skills, runbooks, and scripts, and those agents and their tools are represented as entities in the same system."
defines: AgentialRelationsSystem
implements: RelationsSystem
introduces: specification
---

# Agential Relations System

## What it is

An **AgentialRelationsSystem** is a [RelationsSystem](relations-system.md) with one additional property: agents — human and AI — operate on it using skills, runbooks, and scripts, and those agents, their tools, and the entities they produce are all represented in the same substrate.

The agential property is not separable from the relational structure.
It means the [U_G](../../../science/domains/math/closure-operator.md) closure conditions are not just structurally present — they are operationally active.
Agents navigate the graph, invoke named operations, are constrained by shapes, and drive the generative operations forward.

## Self-reference

For a system to be a genuine Agential Relations System, the operations agents use MUST themselves be representable as entities in the system.
Skill files are entities.
Runbook files are entities.
Shape files are entities.
Script files are entities.
Agents MUST be able to operate across all closure conditions.

This is the analog of $R = U_G(R)$ ([self-generation](../../../science/domains/math/self-generation.md)) at the agential level: the system is its own fixed point.
[Self-generation](../../../science/domains/math/self-generation.md) MUST hold: entities defining the system's structure are themselves entities in the system.
An agent that cannot represent the skills it uses cannot improve them.
A system that cannot describe its own generative operations cannot validate them.

The fixed-point property is approached asymptotically — as more skills are defined using skills, more shapes validate shapes, and more runbooks generate runbooks.

## Settling triad: the ARS development stages as the free-quotient-fixed progression

**Source:** [Relational Universe Triad Catalog Settling Adjoint Patterns](../../../science/domains/math/relational-universe-triad-catalog-settling-adjoint-patterns.md), [Relational Universe Triad Free Quotient Fixed Progression](../../../science/domains/math/relational-universe-triad-free-quotient-fixed-progression.md).

The settling triad is the three-stage progression from Free (syntax) to Quotient (semantics) to Fixed (stability).
It runs at every level of the construction.
The agential relations system passes through all three stages: the initial state (raw spec files, no agents operating), the active state (agents invoking skills on entities), and the self-generating fixed point (R = U_G(R) at the agential level).
Each stage is a genuine mathematical object, not a metaphor.

**The three stages of the ARS settling triad.**

| Stage | Name | ARS instantiation | Mathematical object |
|---|---|---|---|
| Free | Syntax | Spec files before any closure conditions are satisfied — entities with only id and description, no relations invoked | RelationalHistoryFiberDoctrineLanguage: the free nuclear Heyting algebra over the declared vocabulary; every entity has a syntactic representation but no semantic closure |
| Quotient | Semantics | The deployed ARS: agents invoking skills, entities at various depth-filtration levels, relations active, shapes governing operations | The relational universe R = Sh(T,J): a quotient of the free syntactic universe under the seven closure conditions; every entity is an element of R at some depth |
| Fixed | Stability | The self-generating ARS: skill files are entities, runbook files are entities, agents are entities — R = U_G(R) at the agential level | RelationalHistoryFixedFiber: the fixed point layer where both nuclei act trivially; at the agential level this is the fixed-point property approached asymptotically |

**The truncation at the history level.** The settling triad has a structurally notable gap: at the pure history level, the triad truncates.
The history monoid M(Σ,I) has no nuclear closure operators — there is no σ or Δ defined on histories themselves, only on fibers above histories.
Therefore there is no "stable sub-monoid" analogous to RelationalHistoryFixedFiber at the history level.
In ARS terms: the raw message stream (the history of invocations) has no "settled" sub-stream — every invocation is a new event that extends the history.
Settlement happens in the fibers above the history, not in the history itself.

**The modal triad and ARS access patterns.** Alongside the settling triad, the modal triad describes how the ARS is accessed.
The three positions — Directed Shape (colimit over all of T), Dynamics (one atom s at a time), Cosections (limit over all of T) — correspond to: - Directed Shape: the ARS viewed globally — all histories collapsed to a single directed picture (the "what has happened overall" view) - Dynamics: the ARS operating one step at a time — a single skill invocation, a single runbook step, one message processed - Cosections: the ARS viewed as a constraint satisfaction problem — all possible futures simultaneously, checking which global sections exist

The ARS's normal mode of operation is Dynamics: one step at a time.
The settling triad characterizes what that step does structurally (advances an entity from Free toward Fixed).
The modal triad characterizes how that step is initiated (single atom s, from the middle position).

**The hyperversal triad and ARS self-hosting.** The anticipated hyperversal triad — free hyperversal model H_syn through H to stable subtopos Phase_H — corresponds to the ARS reaching self-hosting: the system that not only describes its own structure but operates at the level of operators on operators.
The ARS approaches this through increasing self-description (the system's shapes are validated by the system's own shape-checking skills), but the full hyperversal fixed point H = U_H(H) requires that the operators themselves be subjects of the same nuclear closure.

**Proposition (ARS settling triad).** The agential relations system passes through the settling triad: (1) in the Free stage, spec files exist as syntactic entities — any entity is present (closure condition 1) but semantic closure conditions are not yet active; (2) in the Quotient stage, the deployed ARS has agents invoking the closure conditions — entities are being driven from shallow to deeper depth levels; (3) the Fixed stage is the self-generating fixed point R = U_G(R) where the ARS's own operational tools (skills, runbooks, shapes) are fully represented as entities in R and the system satisfies all seven closure conditions on itself.
The approach to the fixed point is asymptotic: each new skill-file-as-entity, each shape-that-validates-shapes, each runbook-that-generates-runbooks moves the ARS one step closer to Fixed.

*Source.* Settling triad table from [Relational Universe Triad Catalog Settling Adjoint Patterns §The Settling Triad](../../../science/domains/math/relational-universe-triad-catalog-settling-adjoint-patterns.md#triads-settling).
Modal triad from [§The Modal Triad](../../../science/domains/math/relational-universe-triad-catalog-settling-adjoint-patterns.md#triads-modal).
Hyperversal triad anticipation from [§Open: Hyperversal Triad](../../../science/domains/math/relational-universe-triad-catalog-settling-adjoint-patterns.md#triads-hyperversal).
History level truncation from the catalog's structural observation.
Status: the settling triad at the language and universe levels is established; the hyperversal triad is open pending second-turn content. $\square$

## Open questions
