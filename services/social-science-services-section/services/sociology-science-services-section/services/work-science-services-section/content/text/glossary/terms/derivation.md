---
aliases:
  - derivations
description: Work whose execution is settled but whose meaning is not — follows fixed rules to produce a judgment whose content cannot be predicted from the input alone.
identity: derivation
name: Derivation
date-created: 2026-03-29
date-modified: 2026-09-27
relations:
  instance-of: work
  contrasts-with:
    - process
    - procedure
    - inquiry
  requires: flatfile-agent-resource-system-skill-result
  properties:
    - meaning-settled=false
    - execution-settled=true
meaning-settled: false
execution-settled: true
resolves-to: process
contrasts-with: process, procedure, inquiry
instance-of: work
output: judgment
---
A derivation is work whose execution path is settled but whose meaning is not. You know exactly what steps to follow. You do not know what the steps will produce until you follow them. The output is a judgment — a named, typed result whose content could not have been predicted from the input alone.

A derivation follows fixed inference rules. The rules are explicit and fully determined — there are no branches, no conditions to evaluate, no decisions to make about which rule to apply next. The rules are applied in order. But the result depends on the input in a way that cannot be shortcut: you must actually run the derivation to see what comes out.

A mathematical proof is a derivation. The inference rules (axioms, previously proved theorems, logical rules) are fixed. The steps follow deterministically. But the content of what is proved — the theorem — could not have been predicted without doing the proof. A code review is a derivation: the reviewer follows a checklist (rules), but the findings (judgment) depend on what the code actually does. A medical differential diagnosis following a diagnostic algorithm is a derivation: fixed rules, unpredictable judgment.

A derivation contrasts with a [procedure](./procedure.md): a procedure knows what it is producing (meaning settled) but branches on how to produce it (execution open). A derivation knows how to proceed (execution settled) but not what it will produce (meaning open). They are complements in the four-type lattice.

Once the judgment is interpreted and its meaning settled, the derivation collapses to a [process](./process.md) — the same input will now be known to produce the same output. The derivation was the work of discovering what the output is; the process is the work of reproducing it.

The four types of work:

| | Execution settled | Execution open |
|---|---|---|
| **Meaning settled** | [Process](./process.md) | [Procedure](./procedure.md) |
| **Meaning open** | **Derivation** | [Inquiry](./inquiry.md) |

A derivation sits in the meaning-open, execution-settled quadrant. Resolving the meaning question (what does this judgment mean?) collapses it to a process.

## Formal definition

A derivation is a work element $W \in \mathrm{Fix}(\Delta) \setminus H^*$: fixed by
execution-closure, not by meaning-closure,

$$\Delta(W) = W \quad\text{and}\quad \sigma(W) \neq W,$$

one position of the four-way split the [process](process.md) entry sets out
([nuclear quartet subalgebra](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/library/relational-hyperverse-repository/math/nuclear-quartet-subalgebra.md)). Applying $\sigma$ settles the meaning of
the judgment and lands the work in $H^*$, a process. Because the closures
commute, closing execution then meaning reaches the same place as closing
meaning then execution, which is why a derivation cannot branch: a branch on
the inference path would make it a procedure.

## As a skill

A skill declared `closure-kind: derivation` produces new content of a fixed
shape. Its content is open, so it needs a model to reach it; its shape is
fixed, so the model works to a typed result contract rather than exploring.
The house skill schema requires a derivation skill to carry models and
refuses a fuel cap: the model either reaches a conclusion of the declared
shape or reports that it reached none. A derivation skill:

- states its inference rules in its body; unstated rules mean execution is
  not settled and the skill is an inquiry;
- produces a judgment (a critique, a list of claims, a canonical name) whose
  type is known and whose content is not;
- applies its rules without branching, and may call processes to gather
  material;
- does not output an executable action sequence as its main result, since
  that needs no interpretation and is a process.

A model used to choose a route rather than to produce typed content has
confused derivation with procedure. Keep the model producing a conclusion, and
let a later step consume the conclusion to route.
