---

name: conditional-skill-invocation
date-created: 2026-03-08T00:00:00
keywords:
  - semiotic-endeavor
  - progressive-automation
  - skills
  - method
description: "How skills invoke skills conditionally, and how this mechanism realizes progressive automation."
part-of: technology/specifications/agential-semioverse-repository
---

## The pattern

A skill's procedure can include a **conditional invocation** of another
skill: check a condition, and if the condition is met, trigger the
other skill before continuing. This creates skill chains — sequences
of skills that execute based on the state of the repository.

Example: interpret-first-message (step 2) checks whether the latest
situational assessment predates the most recent commit. If it does,
the skill invokes situational-assessment before proceeding. The
decision is proceduralized: the condition is explicit, the branch is
documented, and a less capable agent can follow it.

## What kind of thing is this

This pattern is the **practice-level mechanism** by which policy 001
(progressive automation) is realized. Policy 001 prescribes the
direction: "make actions accomplishable by less capable agents over
time." Conditional skill invocation is the *how*: raw interpretation
gets replaced by documented chains of condition-checked skill calls.

In semiotic-endeavor terms: policy 001 is method (nucleus, *j*
operator — stable commitment). Skill chaining is practice (flow, *G*
operator — what actually happens). The flow-nucleus compatibility
theorem predicts they converge: method says "proceduralize";
practice discovers the mechanism (conditional invocation); the
mechanism gets formalized back into method (as specifications for how
skills chain); which enables even more automation. The fixed point is
a system where most work is proceduralized and the remaining
interpretation handles genuinely novel situations.

This is not a goal (goals are closure conditions to achieve). It is
not a new policy (policy 001 already covers the commitment). It is
the **emergent practice consequence** of policy 001 applied to the
skill system — method-practice convergence in action.

## Decision protocol structure

A conditional invocation has three parts:

1. **Condition**: a checkable state (e.g., "is the assessment older
   than the latest commit?")
2. **Branch**: what skill to invoke if the condition is met
3. **Continuation**: how to use the invoked skill's output in the
   invoking skill's procedure

Over time, more decision points get encoded this way. Each one
replaces a piece of "the agent figures it out" with "the procedure
says what to check." The aggregate effect is that the system becomes
progressively more operable by less capable agents — which is exactly
what policy 001 asks for.

## Implications for plan 0039

Plan 0039 (work procedure with decision protocols) is about
documenting the general work flow with decision forks. Each fork is
a candidate for conditional skill invocation. The work procedure
plan should identify which forks can be proceduralized now vs. which
require judgment for the time being.
