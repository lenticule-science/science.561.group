---
type: question
class: foundational-research
status: partial
depends-on:
  - ../theorems/swarm-vs-orchestration-dichotomy.md
  - teaching/explanations/swarm-coordinated-system.md
see-also:
  - when-do-llm-agents-form-a-swarm.md
  - ../../agents/concepts/coordination-topology.md
references:
  - references/bonabeau-dorigo-theraulaz1999.md
---

# A formal distinguishing predicate for swarm-coordinated vs orchestrated systems

**Status:** partial.
The [swarm-coordinated-system](teaching/explanations/swarm-coordinated-system.md) concept gives a partial answer (the three conditions); a fully formal predicate suitable for static classification of agent architectures is not yet established.

**Question.** Construct a formal predicate $\text{Swarm}(\mathcal{A})$ on multi-agent-system specifications $\mathcal{A}$ that returns true iff $\mathcal{A}$ is swarm-coordinated in the sense of [swarm-coordinated-system](teaching/explanations/swarm-coordinated-system.md), and false iff $\mathcal{A}$ is orchestrated in the sense of the agents theory.
The predicate should be checkable from a system specification without requiring system execution.

## Why the question matters

The [swarm-vs-orchestration-dichotomy](../theorems/swarm-vs-orchestration-dichotomy.md) theorem states that the architectural choice is qualitative.
To apply the theorem, designers and reviewers must be able to determine whether a given system specification falls on the swarm-coordinated side or the orchestrated side.
The current state — three structural conditions stated informally in [swarm-coordinated-system](teaching/explanations/swarm-coordinated-system.md) — suffices for clear cases but leaves ambiguity at the boundary.

A formal predicate would resolve the ambiguity and would enable:

- **Static analysis** of multi-agent-system architectures: does the system specification satisfy the predicate?
- **Comparative classification** of frameworks: which existing frameworks (AutoGen, CrewAI, LangGraph, AG2, ChatDev) satisfy the predicate, and on which design choices?
- **Validation of "swarm" claims** in research papers and product documentation: when an architecture claims to be a swarm, does the claim survive checking against the predicate?

## What the partial answer looks like

The current partial answer (the three conditions in [swarm-coordinated-system](teaching/explanations/swarm-coordinated-system.md)) gives:

- **Scalability**: per-agent computational cost is bounded by a small constant independent of population size.
- **Homogeneity**: all agents run the same local rule with the same parameters; identity is a permutation symmetry.
- **Stigmergy**: inter-agent influence is mediated only by persistent modifications to a shared environment, not by direct messages.

The conditions are checkable in principle but require operational definitions of "small constant," "the same local rule," and "persistent modifications" that admit unambiguous application to a system specification.

## What a fully formal answer requires

A fully formal predicate would include:

1. **A formal model of multi-agent-system specifications.** What is the input to the predicate?
  A typed agent-rule signature?
  An abstract syntax for coordination protocols?
2. **A precise statement of each condition as a checkable property of the specification.** What syntactic and semantic features establish that the scalability premise holds?
3. **Decidability or complexity bounds for the checking algorithm.** Is the predicate decidable?
  In what time?
4. **A characterization of edge cases.** What does the predicate return on hybrid architectures, partial swarms, and degenerate cases (a population of one)?

## Why the question is hard

The conditions in the partial answer are *semantic* conditions: they refer to the behavior of the system in execution.
Translating them into syntactic conditions on the specification requires either:

- A specification language rich enough to capture the relevant behavioral properties (such a language may not exist);
- A static analysis that can soundly approximate the behavioral properties from the specification.

Both routes are substantial undertakings.

## What progress would look like

Incremental progress could look like:

- **Step 1**: a formal specification language for the subset of multi-agent systems whose agent rules are simple enough to admit static analysis (closed-form update rules, fixed action spaces).
- **Step 2**: a checker for the three conditions on this restricted language.
- **Step 3**: extensions to richer languages, possibly with weaker guarantees (decidable predicate with false-positive or false-negative bias).

A complete answer would encompass all three.

## Adjacent work

The [agents theory](../../agents/_index.md)'s [coordination-topology](../../agents/concepts/coordination-topology.md) catalog (orchestrator-workers, peer-to-peer, pipeline, debate) gives a partial classification on the orchestrated side: it enumerates the patterns rather than giving a formal predicate.
A complete formal predicate distinguishing the two regimes would also benefit the agents theory by making the topology classification rigorous.

The work-orchestration spec in the operations branch and the predicated-agentic-computing material in AOP also touch this question from different angles.
