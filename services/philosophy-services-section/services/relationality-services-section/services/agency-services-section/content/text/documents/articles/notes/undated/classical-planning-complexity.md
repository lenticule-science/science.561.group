---
type: theorem
class: complexity-result
status: proved
depends-on:
  - teaching/explanations/classical-planning.md
  - ../objects/planning-problem.md
see-also:
  - teaching/explanations/heuristic-search.md
  - teaching/explanations/hierarchical-planning.md
references:
  - references/ghallab-nau-traverso2016.md
title: Classical planning complexity
description: Theorem (Bylander 1994; Erol-Hendler-Nau 1995 for HTN).
---

# Classical planning complexity

**Theorem (Bylander 1994; Erol-Hendler-Nau 1995 for HTN).** Let $\Pi$ be a classical planning problem in propositional STRIPS, with input size measured by the description length (number of atoms, operators, initial state size, goal size).
Then:

1. **PLAN-EXISTENCE** — *does any plan exist?* — is **PSPACE-complete**.
2. **BOUNDED-PLAN-EXISTENCE** — *does a plan of length $\leq k$ exist?*, with $k$ given in unary — is **NP-complete**.
3. **PLAN-LENGTH** — *what is the length of the shortest plan?* — is **PSPACE-complete** to compute.

For HTN planning (Erol, Hendler, Nau 1995):

4. **HTN-PLAN-EXISTENCE** with arbitrary method libraries is **undecidable**.
5. **HTN-PLAN-EXISTENCE** with totally-ordered methods is **EXPSPACE-complete**.
6. **HTN-PLAN-EXISTENCE** with totally-ordered methods and primitive subtasks (no recursion) reduces to classical and is **PSPACE-complete**.

## Proof sketches

**PSPACE-membership of PLAN-EXISTENCE.** A plan-search procedure can be implemented in polynomial space: maintain only the current state (polynomial in the number of atoms) and the current path, using nondeterministic guessing of the next action.
By Savitch's theorem NPSPACE = PSPACE, so deterministic PSPACE suffices.

**PSPACE-hardness of PLAN-EXISTENCE.** Reduce from the canonical PSPACE-complete problem: acceptance of a polynomial-space-bounded Turing machine on a given input.
Encode the TM's tape as planning atoms (one atom per (cell, symbol) pair plus head-position atoms plus state atoms).
Encode the TM's transition table as planning operators: each TM transition becomes an operator with appropriate preconditions and effects.
The initial state encodes the input; the goal asserts the accept state.
A plan exists iff the TM accepts; plan length is bounded polynomially in the TM's runtime, which is itself bounded exponentially in the space (so plans can be exponentially long but the search procedure is polynomial-space).

**NP-membership of BOUNDED-PLAN-EXISTENCE.** With $k$ given in unary, guess a plan of length $\leq k$ and verify it (each verification step is polynomial).
The guess is polynomial in $k$.

**NP-hardness of BOUNDED-PLAN-EXISTENCE.** Reduce from 3-SAT: encode each variable as an atom, each clause as a goal atom, choices among literal-assignment actions, etc. A short plan exists iff the formula is satisfiable.

**Undecidability of HTN-PLAN-EXISTENCE.** Encode the halting problem for two-counter machines: counters become HTN compound tasks; the recursive method library encodes the counter-machine transitions; a plan exists iff the machine halts.

$\square$

## What this theorem does and does not say

**Does say.** Classical planning is computationally hard in the worst case.
PSPACE-completeness places plan-existence in the same complexity class as quantified Boolean formulas and many other canonically-hard problems.
NP-completeness for bounded planning places short-plan-finding in the same class as SAT.

**Does not say.** That classical planning is hard *in practice*.
Real-world planning problems often have rich structure (locality, hierarchy, near-decomposability) that heuristic search can exploit to dramatically prune the search space.
Modern STRIPS planners solve thousand-action plans on industrial problems in minutes.
The PSPACE-completeness is a worst-case statement, not an average-case one.

**Does not say.** That HTN planning is unusable.
The undecidability of HTN-PLAN-EXISTENCE in the general case is a statement about the *expressive power* of recursive HTN libraries.
Restricted HTN fragments (totally-ordered, non-recursive, regular) are tractable and widely used.

**Does not say.** Anything about MDP/POMDP planning, which has its own complexity profile (P-time for finite MDPs with explicit representation; exponential for factored MDPs; PSPACE-hard for finite-horizon POMDPs; undecidable for infinite-horizon POMDPs).

## Relationship to other results

The complexity result motivates the entire body of work on heuristic search (cf. [heuristic-search](../../../../glossary/concepts/heuristic-search.md)) and hierarchical decomposition (cf. [hierarchical-planning](../../../../glossary/concepts/hierarchical-planning.md)): without these techniques, the worst-case bound translates into practical infeasibility.

It also motivates sample-based methods like [monte-carlo-tree-search](../../../../glossary/concepts/monte-carlo-tree-search.md): when systematic search is infeasible due to state-space size, sampling provides anytime answers without committing to enumerate.

The theorem situates the planning theory's tractability work in its proper context: planning is hard, and every practical planning system is a method of *avoiding* the worst case for the structured subset of problems that arise in practice.
None of these techniques *reduce* the worst-case complexity; they exploit problem-specific structure to escape it on relevant instances.
