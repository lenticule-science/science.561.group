---
title: "Theory of Work"
date-created: 2026-10-15
description: "Work is a costed, counterfactual state transition: a multisorted Lawvere theory of state, cost and capability, with intentions as a fibration, endeavors as a monad, failures classified by three computable axes, organizational forms as models, and every work record a cell system whose lifecycle is a derived reading, never a stored field."
type: theory
name: theory-of-work
reading-order: 6
depends-on: [theory-of-obsmetrologia, theory-of-relationality, theory-of-predication-categories, theory-of-locution, theory-of-agency]
used-by: [theory-of-governing, theory-of-concurrent-game-systems, theory-of-market-systems]
keywords: [work, work-act, natural-history, cost-quantale, capability, intention, endeavor, failure, work-type, process, procedure, derivation, inquiry, task-cell-system, assignment, completion-as-quiescence, wit, ack]
provenance:
  authors: [emsenn, claude-opus-5-5]
  derived-from:
    - "science-services-section/services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/learning-articles/questions/what-is-the-theory-of-work.md (the Lawvere theory T_Work, 96 KB)"
    - "content/text/documents/articles/notes/algebraic-structure-of-work.md and work-type-as-closure-structure.md (this section)"
    - "services/predicated-work-services-section/ and science-services-section/services/social-science-services-section/services/social-theory-science-services-section/content/text/glossary/terms/{task-cell-system,assignment-1,execution-event}.md"
    - "561-group-services-section/content/text/documents/articles/notes/2026/09/30/2026-09-30-note-on-micro-enterprises-holding-their-own-work.md and 2026/10/01/2026-10-01-note-on-work-between-micro-enterprises-as-a-concurrent-game.md"
---

# Theory of Work

Work is something someone does that costs them something and leaves the world different than it would have been. Both halves carry weight. If it costs nothing it is play or rest. If the world would have arrived there anyway it is weather. The theory states this as a formal object: a multisorted Lawvere theory T_Work whose models are the empirical forms of work.

In the descent of existence, working is the third moment: an act made shared and ongoing on a common field. Its agentic face is the contributor, "an actor whose moves carry definite values others can read off the common field, and whose own moves are answers to what the field already holds". Work is coordinated through the shared medium, not point to point.

## The theory T_Work

**Sorts.** S state, Q cost, C capability.

**Operations.** Zero cost, cost composition and cost order; the empty state and state composition ⊗_S; natural history τ : S → S, the world's autonomous successor of a state; the generic work-act w : S → S; parallel composition of work-acts ⊗_w; braiding σ; cost-of κ; capability update u; capability-aware cost κ̃.

**Equations.**

- Q is a commutative quantale. S is symmetric monoidal. Parallel composition is bifunctorial.
- Composition law: κ(g ∘ f) ≤ κ(g) ⊗ κ(f). Parallel cost law: κ(f ⊗_w g) ≤ κ(f) ⊗ κ(g); parallel work is subadditive.
- Natural history is monoidal and free: κ(τ) = 0. Braiding is free: reordering disjoint bundles is not work.
- Capability-cost monotonicity: more capability never makes the same act cost more.
- Capability update is functorial: u(C, g ∘ f) = u(u(C, f), g). For parallel acts the order a worker logs them in is immaterial. The worker sequentializes; the world does not.

**Invariants.** W1 (counterfactual): every work-act f : A → B has B ≠ τ(A). W2 (cost): every work-act has κ(f) > 0.

**Work Thesis.** A process is a work process if and only if it is a morphism in the capability-aware category of work of some model of T_Work. This is the theory's analog of the Church–Turing thesis.

## Derived constructions

These are defined in every model without further axioms.

- **Category of work.** The positive-cost morphisms, enriched in the cost quantale. It is a Lawvere generalized metric: the distance from A to B is the cheapest work that takes A to B.
- **Work-Lambek correspondence (proved).** Four presentations give equivalent categories of models: situation calculus, Petri nets (markings are states, firings are work-acts, spontaneous transitions are natural history), Lawvere-quantale categories, and Coecke–Fritz–Spekkens resource theories.
- **Intention fibration.** Objects are pairs (source state, intended target). The fibre over a pair is its intention tokens: succeeding, failing (intended B, realized B′), or aborted (realized τ(A)).
- **Endeavor monad.** A strong monad, the free monad on the operations `try_f` and `aim_B`. An endeavor is a Kleisli morphism: a commitment to a path that holds through failed attempts. Intended and realized outcomes are the two sides of the Kleisli adjunction.
- **Work 2-category.** 0-cells are states, 1-cells are work-acts, 2-cells are intention tokens. A 2-cell f ⇒ g records "tried g, did f".
- **Failure classification.** Three computable predicates partition the failure fibre: triviality (was any work done), reachability (could the intended target be reached within budget), suboptimality (was the realized act a geodesic). The cells are lapse, mistake, slip and violation, with four canonical handlers.
- **Learning.** A learning-rate functor reads cost before and after an act. Under sustained practice capability converges to a mastery fixed point. Capability grows through failure-bearing endeavor too.
- **Derived vocabulary.** A work-unit is a ground morphism. A workflow is a composable chain. A skill is a capability component that cheapens a class of acts. A bottleneck is a state where no available act fits the budget. A settlement path refines free variables toward ground.

## The work-type quartet

A task's type is read off its closure-rule subsystem. It is never declared. Two binary predicates fix it: meaning-settled (every goal cell is determined at dispatch) and execution-settled (no branching antecedents).

| | execution settled | execution open |
|---|---|---|
| meaning settled | process | procedure |
| meaning open | derivation | inquiry |

The quartet is exhaustive (the nuclear-quartet theorem). Work moves along the settlement path inquiry → {derivation, procedure} → process as free variables are bound. Only the open sides need a language model, and only they need a hull at the boundary where grey input meets the closed program. This is the same classification as agency's nucleus-status table and the Hoare-program quartet in the theory of markets: three derivations agree.

## Work records as cell systems

Work is recorded on the predication substrate, not in status fields.

- **Task.** A cell system T = (G_T, S_T, v₀): goal cells whose settled value determines done-ness, a task-local closure subsystem, and an initial valuation in which every goal cell is ⊥.
- **Assignment and execution event.** Each is its own entity that references the task. The task never grows an `assigned-to` cell. Who is doing T is found by walking from T along reverse edges.
- **Derived state via walks.** Lifecycle (open, active, completed, failed, abandoned, cancelled, suspended) is a reading folded from the growing set of referencing entities and the goal cells' valuation. Nothing in a task's own record claims its state. This is what makes non-monotone lifecycles compatible with a record that only grows.
- **Completion as quiescence.** A task is completed when its goal cells reach the target valuation and stay there under closure.
- **Done needs two parties.** A delivered result is a WIT by the promiser: one 0→1 cover of FOUR's knowledge order on the result cell. Acceptance is an ACK by the asker: a different party, at the border, with an uptake record. A claim is settled only when both nuclei are fixed (Fix σ ∩ Fix Δ), and self-certification is not an ACK.

## Organizational form is a parameter

T_Work is silent about who may perform which act. That lives in the capability fibration M(C) → R over social positions R and a position-permission cost ρ* (Theorem 10). Free-individual, authority-dispatched, market-mediated and kin-obligation-derived organization are all models of one theory, and none is privileged. Rendanheyi is a choice of R and ρ*. The lakotaean form, kin-obligation without a surplus-extracting rule, is a model with no extension of the theory.

## Work between micro-enterprises

The Group's architecture decisions of 2026-09-30 and 2026-10-01 apply the theory:

- A micro-enterprise is a root, and only its own loop writes its work.
- Unaddressed demand is a signal. Signals are taken, not allocated. The signal board holds only monotone facts (posted, taken, result, accepted), so taking needs no coordination.
- Work between micro-enterprises is a concurrent game. The arena is the work board; a position is the threads opened so far with their moves; a move's legality depends only on its thread and its player; moves on different threads commute; the play is the journal, and "standing is replayed from it and never written".
- Openings are request, propose, report and ask. A request names what is wanted and who judges it, never who does it or with what (the prescription law). Staffing is the promiser's strategy: start on the cheapest qualified rung and raise a rung after each rejected attempt, minimizing cost per accepted outcome.

## Consequences for the Group's systems

Required:

1. **No status field on work.** Work records hold cells and referencing entities. Every lifecycle state is a computed reading.
2. **Every work record names its cost and its counterfactual.** A record without cost is play; a record whose target would have happened anyway is weather.
3. **Work type is derived.** Whether a model call is needed is read off the closure structure. Choosing a model is the promiser's strategy, never the asker's field.
4. **Failures are classified.** A failed attempt is recorded as an intention token, and its class (lapse, mistake, slip, violation) is computed, not narrated.
5. **Acceptance is an ACK by another party.** A worker never accepts its own delivery.

## Open

- Open: compose T_Work with the theory of governing through a governance fibration, in which work-acts on collective states are also governance acts.
- Open: an internal-logic presentation of T_Work (conjecture: the cartesian fragment of linear type theory with a cost modality).

## Sources

- The theory T_Work, its theorems and proofs (misfiled as a question under agency): `science-services-section/services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/learning-articles/questions/what-is-the-theory-of-work.md`.
- Signature and work-type quartet: `content/text/documents/articles/notes/algebraic-structure-of-work.md` and `work-type-as-closure-structure.md` (this section); executable form `emsenn/work-algebra@main:src/work-type.mts`.
- Task, assignment and execution cell systems: `science-services-section/services/social-science-services-section/services/social-theory-science-services-section/content/text/glossary/terms/{task-cell-system,assignment-1,execution-event}.md`; the full predicated-work program (46 files, deleted): `git show 7422a224b376^:lib/emsenn/services/561-group/services/public-services-section/services/personal-services-section/services/emsenn-services-section/lib/legacy/2026-08-19-personal-glossary-source-residue/2026-08-18-archive-emsenn-org/gibwodgit/archive/flowif/library/theories/humanities/theories/sociology/theories/work/theories/predicated-work/`.
- Derived state via walks: `science-services-section/services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/derived-state-via-walks/derived-state-via-walks.md`.
- The record schemas that refuse status fields: `561-group-services-section/schemas/{work,work-item,deontic-work,duty,office,incumbency}.schema.json`.
- The architecture decisions: `561-group-services-section/content/text/documents/articles/notes/2026/09/30/2026-09-30-note-on-micro-enterprises-holding-their-own-work.md`, `.../2026/10/01/2026-10-01-note-on-work-between-micro-enterprises-as-a-concurrent-game.md`.
