---
type: theorem
status: draft
depends-on: [workflow, task-cell-system, predication-settling-category]
title: "Typed workflow composition"
description: "A typed workflow-composition model with explicit categorical laws, effect obligations and proof frontier."
date-modified: 2026-10-15
---

# Typed workflow composition

The proposed categorical model studies general typed work composites. It has
boundary types as objects and composites W:A→B as candidate morphisms. The
house Workflow term uses the narrower external boundary X→X and excludes a
single unit. Its relation to this generalization must be explicit: it may
select certain endomorphisms, but that alone does not construct a category or
supply identities. General A→B followed by B→C composition is mathematically
well-typed without changing the authored house definition.

## Sequential composition

Composition joins W₁:A→B to W₂:B→C when the boundary contract matches. The
contract includes input/output meaning, preconditions, effects, resources,
failure/refusal and receiving conditions. Matching type names alone does not
establish all of these obligations.

To obtain a category, specify workflow equality, collision-free occurrence
identities, boundary gluing and the identity workflow; then prove associativity
and both unit laws under that equality. For graphs, isomorphism classes or
an explicit canonical representation may be needed. Set union without fresh
identities can merge two distinct executions and is not a sufficient proof.

The current [HoareProgram source](https://github.com/lenticule-science/computer-science-services-section/blob/main/lib/obsmetrologia-computing/ObsmetrologiaComputing/HoareProgram.lean)
provides typed Input/Output, precondition, total move, postcondition and a
preservation proof for its own structure. It supplies a precise model to
consume where applicable. It does not prove an arbitrary tool call, LLM run,
workflow graph or Mission satisfies that structure. The Rendanheyi design
recognition uses a shared intermediate assertion for composition; consumers
must establish that assertion and account for refusal outside the precondition.

## Parallel composition

A tensor candidate combines independent workflows with disjoint or explicitly
coordinated effects. It requires a defined product of boundary contracts,
resource/interference conditions and the interchange law. Ordinary tagged
disjoint union is associative up to canonical isomorphism, not automatically
literal equality. Strictness requires a chosen strict presentation or an
appropriate strictification; it cannot be concluded from set notation alone.

Branching requires a specified choice/guard semantics. Calling a guarded
branch a coproduct requires objects, injections and the universal property;
a graph with two outgoing edges does not supply those data automatically.

## Four-valued guards and their actual symmetries

The previous sketch’s operational guard table can be retained as a proposed
positive/negative activation policy: ⊥ activates neither branch, t only the
positive branch, f only the negative branch, and ⊤ supports both antecedents
and therefore needs an explicitly chosen conflict policy. This table does not
by itself make the branch a coproduct or authorize executing both effects.

The current [FOUR source](https://github.com/lenticule-science/obsmetrologia/blob/main/Obsmetrologia/Language/Positing/Four.lean)
(blob 8a25fa6ff830e79bf1e2296a4fbb8af6ce95df3a) defines values as (p,n):

| Operation | Coordinate action | Value action |
| --- | --- | --- |
| negate | (p,n) ↦ (n,p) | exchanges t/f; fixes ⊥/⊤ |
| conflate | (p,n) ↦ (¬n,¬p) | exchanges ⊥/⊤; fixes t/f |
| negConf | (p,n) ↦ (¬p,¬n) | exchanges both pairs |

Lines 71–102 define these operations and their orbits; lines 107–132 state
the order behavior and commuting involutions. Thus branch exchange under
this guard policy corresponds to negate; exchanging absence and conflict
corresponds to conflate. Neither coordinate symmetry alone establishes a
semantic equivalence of effectful workflows. The previous text gave the same permutation to two
different generators and then claimed a nontrivial composite, which cannot
hold: composing one involution with itself is identity. The four values are
not four orbits of the full Klein-four action; it has the two orbits {t,f} and {⊥,⊤}. These are source-declared formal results, not a fresh kernel-run receipt
or a proof that a live workflow implements the policy.

## Soundness and open obligations

Progress, deadlock freedom, target satisfaction, bounded resource use and
eventual receiving are different properties. A function mapping fixed inputs
to fixed outputs can still produce the wrong output; a graph can contain a
reachable but nonterminating loop. State fairness, termination and acceptance
assumptions for a claimed soundness theorem.

The unique research directions in the earlier sketch remain open:

- Construct the claimed embedding into the settling category and prove which
  completeness properties, if any, transfer through it.
- Define the settling internal Hom and prove a bridge from its global sections
  to the chosen operational soundness predicate; a nonzero H⁰ expression alone
  does not establish termination or receiving. Specify the cohomology and
  coefficient structure before interpreting H¹ as a work obstruction.
- Define workflow deformation, the preserved MLD invariant and topology before
  applying no-tunneling or monotonic-regime claims. Editing a graph is not
  automatically a first-order deformation in the cited theory.
- Construct the actual temporal pseudo-pullback square and relevant adjoints
  before invoking Beck–Chevalley for an intermediate-state query. General
  workflow monitoring does not obtain that theorem from its vocabulary.

The previous strict-monoidal-category sketch, claimed embedding and automatic
soundness equivalences remain historical source in Git. This active contract
states the construction and laws still owed. No new categorical proof or
Mission category is asserted. Engineering may implement a bounded model with
explicit verification cases while those broader equivalences remain open.
