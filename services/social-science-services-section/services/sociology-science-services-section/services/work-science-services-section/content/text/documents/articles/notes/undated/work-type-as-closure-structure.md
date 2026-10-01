---
type: theorem
status: sketch
depends-on: [task-cell-system, closure-rule-system, closure-rule, operations-settling, completion-as-quiescence]
see-also: [work-stream-count-as-four-regime-classification, function-as-aperiodic-settling]
title: Work type is a property of the task's closure-rule subsystem
description: "The work vocabulary's four-way taxonomy — process, procedure, derivation, inquiry — classifies work by two binary properties: whether the meaning of the output is settled at dispatch time, and whether the execution path to produce it is…"
---

# Work type is a property of the task's closure-rule subsystem

The [work vocabulary's four-way taxonomy](../../../../../../../../../../../../../humanities/theories/sociology/theories/work/terms/work.md) — process, procedure, derivation, inquiry — classifies work by two binary properties: whether the *meaning* of the output is settled at dispatch time, and whether the *execution path* to produce it is settled at dispatch time. This theorem shows that both properties are structural conditions on the task-cell-system's closure-rule subsystem $\mathcal{S}_T$.

## Correspondence table

| Work type | Meaning settled | Execution settled | Closure-rule characterization |
|-----------|----------------|-------------------|-------------------------------|
| Process | yes | yes | $\mathcal{S}_T$ is ground and deterministic: all goal cells are determined from $v^T_0$ in one firing step; no disjunctive rules. |
| Procedure | yes | no | Goal cells are determined (meaning fixed), but $\mathcal{S}_T$ contains branching rules — rules with disjunctive or conditional antecedents that route execution along different paths depending on which increment arrives first. |
| Derivation | no | yes | The execution path (which closure rules fire in which order) is determined by $\mathcal{S}_T$, but the target valuation $v^*_T$ is not fixed at dispatch time — it is resolved during settling as the meaning-cells themselves settle. |
| Inquiry | no | no | Both $v^*_T$ and the execution path are open. $\mathcal{S}_T$ starts nearly empty and acquires rules incrementally via [witness-as-increment](../../../../../../services/predicated-work-services-section/content/text/glossary/terms/witness-as-increment.md) as evidence arrives. |

## Formal statement

Let $T = (G_T, \mathcal{S}_T, v^T_0)$ be a task cell system. Define:

- **Meaning-settled($T$):** the target valuation $v^*_T$ is fully determined from $v^T_0$ and $\mathcal{S}_T$ without additional witness increments — formally, $v^*_T$ is the unique fixed point of the closure operator $\mathrm{Cl}_{\mathcal{S}_T}$ applied to $v^T_0$.
- **Execution-settled($T$):** $\mathcal{S}_T$ contains no rules with disjunctive antecedents of the form $(\phi_1 \vee \phi_2) \Rightarrow \psi$ — every firing is deterministic given the current valuation.

Then:
- $T$ is a **process** iff Meaning-settled($T$) and Execution-settled($T$).
- $T$ is a **procedure** iff Meaning-settled($T$) and ¬Execution-settled($T$).
- $T$ is a **derivation** iff ¬Meaning-settled($T$) and Execution-settled($T$).
- $T$ is an **inquiry** iff ¬Meaning-settled($T$) and ¬Execution-settled($T$).

## Sketch

*Process.* If $\mathcal{S}_T$ is ground and deterministic, then applying $\mathrm{Cl}_{\mathcal{S}_T}$ to $v^T_0$ produces the unique fixed point in a finite number of steps (by the strict-regime case of [completion-as-quiescence](../../../../../../services/predicated-work-services-section/content/glossary/concepts/completion-as-quiescence.md)). The fixed point is $v^*_T$; it is determined entirely by the rule structure and the initial valuation, requiring no external witness increments. Execution is deterministic because there are no branching rules.

*Procedure.* The target $v^*_T$ exists and is determined by $\mathcal{S}_T$ (meaning is settled), but the presence of branching rules means that different orderings or contents of incoming increments can cause different intermediate paths through $G_T$'s closure orbit. The final $v^*_T$ is shared across all paths (meaning is settled), but which rules fire and in which order depends on which increment's antecedent condition is met first. This is the formal analog of the procedural step that "branches on conditions evaluated as you go."

*Derivation.* $\mathcal{S}_T$ is deterministic (no branching), so execution order is fixed. But $v^*_T$ is not determined from $v^T_0$ alone — some goal cells in $G_T$ have their target values determined by witness increments arriving during settling (increments that carry the meaning of the output as evidence). The derivation's output meaning "follows from" the execution, but what it follows to was not fixed at dispatch time.

*Inquiry.* Both axes are open. The inquiry's $\mathcal{S}_T$ at creation contains minimal rules; the task acquires both its target valuation and its rule structure from incoming witness increments. The inquiry is the settling whose shape is most determined by its history.

## Deskilling as work-type regression

A *deskilling* operation — in the work vocabulary's critical-theory sense — is a morphism $d: T \to T'$ that replaces a procedure-type task with a process-type task by eliminating the branching rules:

$$d: \mathcal{S}_T \;\text{(branching)} \;\to\; \mathcal{S}_{T'} \;\text{(deterministic)}$$

Formally: $d$ maps each disjunctive rule $(\phi_1 \vee \phi_2) \Rightarrow \psi$ in $\mathcal{S}_T$ to a family of unconditional rules with pre-committed antecedents, collapsing the agent's decision node into a fixed execution path. By Execution-settled$(T')$ = true, the resulting task is a process.

The cost: the agent's judgment capacity — the ability to evaluate which branch's antecedent applies — is replaced by a pre-committed rule. The agent becomes a process-executor. Deskilling is structurally a rule-substitution morphism that lowers the closure-rule-language fragment expressiveness. See [rule-language-fragment-realizability-refinement](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/rule-language-fragment-realizability-refinement.md) for the fragment hierarchy.

## Connection to the algebraic structure of work

The [algebraic-structure-of-work text](../algebraic-structure-of-work.md) frames the work taxonomy in terms of free algebras: inquiry = open term with maximal free variables; process = ground term with no free variables. The present theorem gives the substrate version: free variables in the algebraic sense correspond to meaning-openness in the settling sense (the target valuation is not determined from the initial state), and branching in the algebraic sense corresponds to execution-openness (disjunctive rules in $\mathcal{S}_T$). A substitution closing a free variable corresponds to a witness increment that settles a meaning-cell from $\bot$ to a determinate value.
