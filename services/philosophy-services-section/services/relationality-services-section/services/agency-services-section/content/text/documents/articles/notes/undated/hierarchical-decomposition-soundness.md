---
type: theorem
class: structural-claim
status: proved
depends-on:
  - ../objects/abstraction-hierarchy.md
  - ../morphisms/plan-decomposition.md
  - teaching/explanations/hierarchical-planning.md
see-also:
  - classical-planning-complexity.md
references:
  - references/erol-hendler-nau1994.md
title: Hierarchical decomposition soundness
description: Theorem (Erol, Hendler, Nau 1994; UMCP soundness).
---

# Hierarchical decomposition soundness

**Theorem (Erol, Hendler, Nau 1994; UMCP soundness).** Let $\Pi^{\text{HTN}} = \langle \Pi^{\text{cls}}, \mathcal{T}_c, \mathcal{M}, w_0 \rangle$ be an HTN planning problem, where $\Pi^{\text{cls}}$ is the underlying classical planning problem (states, primitive actions), $\mathcal{T}_c$ is the set of compound tasks, $\mathcal{M}$ is the method library (decomposition rules), and $w_0$ is the initial task network.
Let UMCP (or any HTN planner satisfying the standard soundness specification) operate on $\Pi^{\text{HTN}}$ and return a plan $\pi$.

Then:

1. **Primitive soundness.** $\pi$ is a sequence of primitive actions from $\Pi^{\text{cls}}$, executable from the initial state, that satisfies *every method's preconditions at the moment of decomposition* and *every primitive action's preconditions at the moment of execution*.
2. **Decomposition trace.** $\pi$ corresponds to a derivation $w_0 \Rightarrow w_1 \Rightarrow \cdots \Rightarrow w_n$ where each $\Rightarrow$ is a method application, $w_n$ is a totally-ordered sequence of primitive actions, and that sequence is $\pi$.

UMCP is also **complete with respect to the method library**: if any plan derivable from $w_0$ via $\mathcal{M}$ exists, UMCP will find one.
UMCP is **not** complete with respect to the underlying classical problem: classical-plan-existence does not imply HTN-plan-existence.

## Proof sketch

**Soundness** is established by structural induction on the decomposition derivation.
Each method application replaces a compound task with a network whose preconditions UMCP has verified in the current state; hence the derivation maintains the invariant "every task in the current network is justified by the method that introduced it."
When the derivation reaches a primitive-only network, executing the primitives in their derived order respects all preconditions by the inductive invariant.

**Library-relative completeness** is established by showing UMCP explores every method-application path systematically (with backtracking) until either a primitive-only network is found or all paths are exhausted.
Standard fair-search arguments.

**Failure of classical completeness** is established by example: construct a classical planning problem with a solution and an HTN problem over the same primitives with a method library that does not include the necessary decomposition; UMCP returns failure.

$\square$

## The library-relativity statement

The non-completeness with respect to the underlying classical problem is the substantive content of the theorem for the practitioner.
Phrased positively:

**An HTN planner finds a plan iff one is expressible by the method library.**

The expressivity of the method library — what decompositions it admits — entirely determines what plans the planner can find.
If the optimal plan requires a sub-task ordering or a method combination not in the library, no HTN planner can find it.

## Consequences

**Engineering consequence.** Authoring a method library for an HTN planner is *prescribing* the space of plans the planner is willing to find.
This is intentional: the library encodes domain knowledge about *acceptable* plans, often excluding classical solutions that are technically valid but practically undesirable.
(E.g., a medical HTN may reject a "give random drug, see what happens" plan that is classically valid but clinically prohibited.)

**Theoretical consequence.** The complexity gap between classical and HTN planning is real but cuts both ways: HTN planners can rapidly find plans in domains where classical planners would flounder (the library prunes the search space dramatically), but HTN planners can fail to find plans that classical planners would trivially solve.

**Verification consequence.** Whether a method library is "sufficient" for a domain — captures all plans the user would accept — is itself a non-trivial verification question.
The theorem clarifies that the question must be answered library-by-library; there is no general-purpose HTN library.

## What this theorem does and does not say

**Does say.** HTN planners are sound (return only valid plans) and complete relative to their method libraries.

**Does not say.** That HTN libraries are easy to author.
The art of HTN planning is largely the art of writing comprehensive, maintainable libraries.
Many HTN deployments fail not because the planner is inadequate but because the library is.

**Does not say.** That HTN planning is fast.
The complexity results (EXPSPACE-complete for totally-ordered HTN; undecidable in general) remain.
The library prunes the search space but does not change the worst-case complexity.

**Does not say.** Anything about LLM-based hierarchical planning.
LLM-based decomposition does not satisfy the theorem's hypotheses (no explicit method library; no precondition verification).
LLM agents that "decompose" tasks have neither the soundness nor the completeness guarantees the theorem provides — they have a different, weaker, empirical correctness profile.

## Relationship to LLM planning

The contrast with LLM-based decomposition is sharp:

| Property | HTN | LLM decomposition |
|---|---|---|
| Decomposition rules | Explicit, authored | Implicit, learned |
| Precondition verification | Yes | No |
| Soundness | Proved | Empirical |
| Library-relative completeness | Proved | N/A |
| Classical completeness | No | No |
| Authoring cost | High | Low |
| Coverage | Library-bounded | Training-data-bounded |

The HTN theorem is one half of a dialectic with LLM planning: HTN gives you soundness at the cost of authoring; LLM gives you flexibility at the cost of soundness.
Whether and how the two can be combined — preserving HTN's verifiability with LLM's flexibility — is the content of the [can-classical-and-llm-planning-be-unified](can-classical-and-llm-planning-be-unified.md) question.
