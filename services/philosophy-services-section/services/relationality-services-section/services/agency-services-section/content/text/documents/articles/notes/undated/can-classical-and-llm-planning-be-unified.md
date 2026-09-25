---
type: question
class: open
status: open
depends-on:
  - teaching/explanations/classical-planning.md
  - teaching/explanations/inference-time-search.md
  - ../theorems/hierarchical-decomposition-soundness.md
see-also:
  - teaching/explanations/why-llm-cot-is-not-quite-search.md
  - teaching/explanations/from-strips-to-llm-planning.md
references:
  - references/silver-alphazero2018.md
  - references/yao-tot2023.md
title: Can classical and LLM planning be unified?
description: Question.
---

# Can classical and LLM planning be unified?

**Question.** Can the *correctness guarantees* of classical planning (soundness, completeness relative to a problem specification) be combined with the *flexibility and breadth* of LLM-based planning (no manual problem specification, broad domain coverage), in a system that has both?

Equivalently: can we build planning systems whose plans are *as verifiable* as STRIPS plans and *as broadly applicable* as LLM agentic plans?

## Why the question matters

The two paradigms have nearly disjoint strengths and weaknesses:

| Property | Classical | LLM-based |
|---|---|---|
| Soundness guarantee | Yes (proved) | No (empirical) |
| Completeness guarantee | Yes (relative to representation) | No |
| Broad domain coverage | No (per-domain modeling) | Yes |
| Authoring cost | High (per-domain) | Low (zero-shot) |
| Plan legibility | High (explicit operators) | Mixed |
| Failure debuggability | High (search trace) | Low (LLM internal) |
| Capability ceiling | Specification-bound | Model-capability-bound |

A unification that achieved both columns' strengths would substantially advance deployable planning.
The current state of the art typically picks one column or the other and accepts the corresponding weaknesses.

## Approaches under exploration

**LLM-as-modeler.** Use the LLM to generate a classical-planning specification (PDDL, STRIPS) from a natural-language task description; pass the specification to a classical planner.
Recovers classical's correctness guarantees on the generated specification, at the cost of the LLM's correctness in specification-generation.
Active research; current results show LLMs can generate PDDL for simple domains but struggle with complex ones.

**Classical-as-verifier.** Use the LLM to generate plans freely; use a classical planner / model checker to verify them post-hoc.
Catches some plan failures; cannot guarantee that an LLM-generated plan exists when one is needed (the LLM may simply fail to propose).

**Neuro-symbolic hybrid.** Decompose the planning problem: use LLMs for high-level task identification and decomposition; use classical planners for sub-problem solution.
Boundary management is the principal engineering challenge.

**LLM-guided HTN.** Provide an explicit HTN method library *and* allow the LLM to propose new methods on the fly.
Combines library- relative completeness with LLM flexibility.
Soundness depends on verifying the LLM's proposed methods against the underlying domain.

**LLM-augmented heuristic search.** Replace the heuristic in a classical search with a learned LLM-based heuristic.
Preserves the search structure (and its soundness properties) while gaining LLM- broad generalization.
Closely analogous to AlphaZero's value-network approach.

**Verifier-augmented LLM CoT.** Train the LLM to interleave its reasoning with verifier calls (formal proof checkers, code executors, theorem provers); reject reasoning steps the verifier disputes.
Recovers a form of soundness conditional on the verifier's reliability and the LLM's willingness to accept verifier feedback.

## Open sub-questions

**What is the right interface between LLM and classical components?** The LLM-as-modeler and verifier-augmented-CoT approaches put the LLM at the boundary; the classical-as-verifier and LLM-guided-HTN approaches put the classical planner at the boundary.
Each interface choice has different failure modes.

**What does "soundness" mean for a hybrid system?** A pure LLM system has no soundness; a pure classical system is sound relative to its hand-specified model.
A hybrid system is sound *relative to what*?
Soundness relative to the LLM's interpretation of the problem?
Relative to a domain-specific verifier?
Relative to the principal's intent (which is the [alignment](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/planning/content/alignment/_index.md) problem, not just a planning problem)?

**Where does the unification's cost go?** Classical planning's cost is in domain modeling; LLM planning's cost is in model training.
Hybrid systems incur both types of cost, often plus a new "interface engineering" cost.
Whether the resulting system is *economically* better than either pure approach depends on the domain.

**Can the unification be learned rather than designed?** Modern frontier models (o1-style) appear to be moving in a direction that implicitly unifies LLM-flexibility with search-like rigor through training rather than explicit hybrid architecture.
Whether this internalization of search obviates the need for explicit hybrid designs, or merely produces a different point on the same Pareto frontier, is unclear.

## Status

Active research with no consensus answer.
Multiple approaches are being pursued in parallel; none has yet decisively demonstrated both classical-style guarantees and LLM-style flexibility.

The honest meta-prediction: a *useful* unification is likely to emerge in the 2026–2028 window, but it is unlikely to fully combine the strengths of both columns.
More likely, the field will discover that the two paradigms address subtly different problems and that the right answer is a *family* of hybrids, each specialized for a different kind of planning task.

## Related questions

- [is-llm-cot-genuine-search](is-llm-cot-genuine-search.md) — the unification's possibility depends partly on whether LLM CoT is genuine search; if it is, the gap between LLM and classical approaches is smaller than the table above suggests.
- [what-is-the-effective-planning-horizon-of-current-models](what-is-the-effective-planning-horizon-of-current-models.md) — for assessing how much horizon LLM planning can cover without classical assistance.
