---
type: definition
class: substrate-entity
status: draft
symbol: "\\mathcal{N}"
depends-on: [normative-system, jural-relation, closure-rule]
realizes: [norm]
---

# Norm

The mathematical realization of a [norm](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/terms/norm.md): the unit of which a [normative system](normative-system.md) is composed.
A norm is a triple $\mathcal{N} = (\varphi, O, N)$ — a propositional content $\varphi$, a deontic operator $O \in \{\mathrm{Obl}, \mathrm{Per}, \mathrm{Proh}\}$, and a normative system $N$ within which the norm is operative.

## Data

A norm $\mathcal{N} \in E_{\mathrm{op}}$ is a substrate entity carrying:

- $\langle \mathcal{N}, \texttt{propositional-content}, \varphi\rangle = \mathbf{t}$ — references the cell-pattern $\varphi \subseteq \Phi_W$ that the norm prescribes.
- $\langle \mathcal{N}, \texttt{deontic-operator}, k\rangle = \mathbf{t}$ where $k \in \{\texttt{Obl}, \texttt{Per}, \texttt{Proh}\}$.
- $\langle \mathcal{N}, \texttt{operative-in}, N\rangle = \mathbf{t}$ — references the [normative system](normative-system.md) within which $\mathcal{N}$ has force.

Conditional norms ("if $\psi$ then $\mathrm{Obl}(\varphi)$") carry an additional cell $\langle \mathcal{N}, \texttt{antecedent}, \psi\rangle = \mathbf{t}$ — the condition under which the deontic operator applies.

## Realization as a closure rule

A norm $\mathcal{N} = (\varphi, O, N)$ corresponds to a [closure rule](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule.md) in $\mathcal{S}_N \subseteq \mathcal{S}_{\mathrm{op}}$:

| Deontic operator | Closure-rule shape |
|---|---|
| $\mathrm{Obl}(\varphi)$ | $\psi \Longrightarrow $ each cell in $\varphi$ at $\geq_k \mathbf{t}$. Failure to produce $\varphi$-witnesses leaves the cells at $\bot$, which the auditing closure rule detects as a duty-breach. |
| $\mathrm{Per}(\varphi)$ | No closure rule fires *against* $\varphi$. Permission is the absence of a prohibition; the substrate-algebraic witness is the *non-existence* of a $\mathrm{Proh}(\varphi)$ rule in $\mathcal{S}_N$. |
| $\mathrm{Proh}(\varphi)$ | $\psi \,\wedge\,$ (each cell in $\varphi$ at $\mathbf{t}$) $\Longrightarrow$ violation cell $\langle V, \texttt{prohibited-cell-asserted}, \varphi\rangle$ at $\mathbf{t}$. The prohibition is a closure rule that fires *on the assertion* of the prohibited content. |

This is exactly the input/output logic of Boella & van der Torre cited in the [normative-system](normative-system.md) text: a norm is a $(\psi, \varphi)$ pair encoded as a closure rule.

## The four invariants as substrate properties

Per the library's norm text, four invariants characterize a norm:

1. **Independence from compliance.** A norm's substrate cells (the closure rule's existence in $\mathcal{S}_N$, the deontic-operator cell, the operative-in cell) persist regardless of whether the norm's prescribed content is being asserted in the substrate.
  Violation does not retract the rule; it produces violation-witness cells while the rule persists.
  By [settling-monotonicity](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), once a norm's existence is settled at $\mathbf{t}$, it remains at $\mathbf{t}$ until explicitly retired (e.g., by repeal — see novation).

2. **Authority-derived force.** The norm's force derives from $N$'s authority grounding $\beta_N$.
  A norm with no operative-in cell, or one operative in a normative system whose $\beta_N$ is at $\bot$, lacks substrate-algebraic force: no closure rule fires from it.

3. **Deontic consistency** ($\mathrm{Obl}(\varphi) \Rightarrow \mathrm{Per}(\varphi)$).
  At the closure-rule level: a norm system $\mathcal{S}_N$ that contains both $\mathrm{Obl}(\varphi)$ and $\mathrm{Proh}(\varphi)$ rules drives any cell in $\varphi$ to $\top$ (both positive and negative evidence), an internal-conflict state.
  A consistent normative system avoids this; the [precedence-in-least-fixed-point question](questions/precedence-in-least-fixed-point.md) addresses how systems with apparent conflicts resolve.

4. **Hohfeldian-relations generation.** An operative obligation $\mathrm{Obl}(\varphi)$ produces a [jural-relation](jural-relation.md) of `kind: duty` for each agent subject to $N$, with correlative claim-rights via [correlate-of](../morphisms/correlate-of.md).
  The substrate-algebraic content: the closure rule fires *both* the $\varphi$-cell update *and* the duty/claim jural-relation cells.
  Norms don't merely describe the system; they actively constitute the deontic profile of agents within it.

## Conditional structure

A conditional norm "if $\psi$ then $\mathrm{Obl}(\varphi)$" is the closure rule $\psi \Longrightarrow $ each cell in $\varphi$ at $\geq_k \mathbf{t}$, with $\psi$ as the antecedent.
The closure-rule firing is gated by $\psi$'s settlement; if $\psi$ remains at $\bot$, the rule never fires and the obligation never activates.

## Operativity through joint settlement

Per [normative-system](normative-system.md), a norm is *operative at stage $\tau$* iff both required predicates have reached affirming settlement: the recognition predicate $\langle \varphi, \texttt{recognized-as-norm-in}, N\rangle = \mathbf{t}$ and the execution predicate $\langle \varphi, \texttt{forward-binding-in}, N\rangle = \mathbf{t}$.
The four-corner joint-settlement reading at the norm level matches the corresponding office-incumbency reading at the office level: same two-axis structure, different content.

## Validity vs. truth

Per Kelsen, a norm is *valid* (in force) or *invalid* (not in force); it is not true or false.
In substrate terms: validity is the joint-settlement state of the two required predicates.
Truth-or-falsity applies to facts (cells at $\mathbf{t}$/$\mathbf{f}$ in the substrate); validity applies to whether a norm's closure rule fires.
An unjust law is a valid norm — its closure rule is in $\mathcal{S}_N$ — even though its content cells, when settled, may be at values that the surrounding moral framework would call $\mathbf{f}$.
