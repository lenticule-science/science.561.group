---
type: theorem
status: sketch
depends-on: [delegation, jural-relation, residuated-restriction-as-authority-gate, right-residuation-operator, predicate-specialization, authority-gate]
realizes: [delegation, authority]
---

# Delegation is authority residuation

The [delegation morphism](../morphisms/delegation.md) is exactly the [right-residuation operator](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/right-residuation-operator.md) $\mathrm{R}_a$ applied per-cell to a candidate beneficiary-grant payload, with the principal's power-cell value over the parent scope as the authority element $a$.
The four delegation invariants — derivativity, accountability non-transfer, boundedness, and revocability — are *consequences* of the residuation table in [residuated-restriction-as-authority-gate](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/residuated-restriction-as-authority-gate.md), not separate axioms.

## Statement

Let $R^P$ be a power jural relation held by principal $Q$ over scope-action $X$, with the cell $a := \langle R^P, \texttt{kind-active}, X\rangle \in \mathbf{FOUR}$ recording the principal's authority value.
Let $g \in \mathbf{FOUR}$ be the candidate beneficiary-grant payload value at a sub-scope cell $\langle R^B, \texttt{kind-active}, G\rangle$ for $G \subseteq X$.

**Theorem.** *The delegation closure rule that admits the candidate-grant cell at value* $$\text{landed}(g) \;:=\; a \Rightarrow g$$ *— with $\Rightarrow$ the [twist-product right residual](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-right-residual.md) on $\mathbf{FOUR}$ — produces, on each $(a, g)$ row of the residuation table, exactly the engineering behavior the four delegation invariants prescribe.*

In particular:

(a) *(Derivativity / nemo dat.)* When $a = \bot$ (silent authority — principal lacks the power), $\mathrm{R}_a(g) = \mathbf{t}$ for $g \in \{\bot, \mathbf{t}, \top\}$ but $\mathrm{R}_a(\mathbf{f}) = \bot$ — vacuously permissive on positive grants, collapsing explicit-denial grants to silence. *Nemo dat quod non habet* is the substrate-algebraic refusal of silent authority to *generate* a $\mathbf{t}$-valued derived grant via any mechanism other than direct payload assertion: silent authority cannot manufacture content.
The closure rule must additionally check $a \geq_k \mathbf{t}$ before admitting the derived cell, which the residuation table makes a first-class condition.

(b) *(Accountability non-transfer.)* The residuation acts only on the candidate-grant cell $\langle R^B, \texttt{kind-active}, G\rangle$.
The companion cell $\langle R^B, \texttt{accountability-resides-in}, Q\rangle$ is asserted *outside* the residuation, by a separate closure-rule clause that fires unconditionally on any successful delegation increment.
The residuation cannot transfer accountability because it acts pointwise on grant-cells, not on accountability-cells; the structural separation is what guarantees accountability stays with $Q$.

(c) *(Boundedness.)* The closure rule's antecedent enforces $G \subsetneq X$ via [predicate-specialization](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-specialization.md).
When $G = X$, the substrate identifies the increment as an *abdication-witness* rather than a delegation, because the residuation $a \Rightarrow g$ on the *whole* scope is the identity on $\mathbf{t}$-valued payloads (row 2 of the table), producing a derived cell *equal to* the principal's authority — which is structurally indistinguishable from the principal *being replaced*, not delegating.
Boundedness is the structural obstruction to confusing delegation with abdication.

(d) *(Revocability.)* Revocation is implemented as a $\top$-asserting increment driving $\langle R^B, \texttt{kind-active}, G\rangle$ from $\mathbf{t}$ to $\top$, then resolved by repair to $\mathbf{f}$.
Per row 4 of the residuation table, $\top \Rightarrow x$ is *not* the identity on $\mathbf{t}$ (it returns $\bot$), so a paraconsistent-authority profile cannot maintain a transparent grant.
This is the substrate-algebraic source of revocability's asymmetry with grant: revocation does not need to be re-residuated by the principal; it succeeds the moment the principal's revocation power asserts $\top$ on the derived cell.

## Proof

Direct combination of two facts:

**Fact 1.** The residuation table for $\mathrm{R}_a$ on $\mathbf{FOUR}$ is exactly the table in [residuated-restriction-as-authority-gate](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/residuated-restriction-as-authority-gate.md):

| $a \backslash g$ | $\bot$ | $\mathbf{t}$ | $\mathbf{f}$ | $\top$ |
|---|---|---|---|---|
| $\bot$ | $\mathbf{t}$ | $\mathbf{t}$ | $\bot$ | $\mathbf{t}$ |
| $\mathbf{t}$ | $\bot$ | $\mathbf{t}$ | $\mathbf{f}$ | $\top$ |
| $\mathbf{f}$ | $\mathbf{t}$ | $\mathbf{t}$ | $\mathbf{t}$ | $\mathbf{t}$ |
| $\top$ | $\bot$ | $\bot$ | $\mathbf{f}$ | $\top$ |

**Fact 2.** The delegation-admission closure rule (per the [delegation morphism](../morphisms/delegation.md)) generates the derived cell at $\mathbf{t}$ only when (i) the principal's authority value $a$ satisfies $a \geq_k \mathbf{t}$ (i.e., $a \in \{\mathbf{t}, \top\}$), and (ii) the sub-scope condition $G \subsetneq X$ holds.

Combining: the closure rule's behavior on $(a, g)$ is exactly $\mathrm{R}_a(g)$ when restricted to $a \in \{\mathbf{t}, \top\}$ on the row 2 and row 4 entries.
The other two rows ($a = \bot$, $a = \mathbf{f}$) are explicitly *blocked* by Fact 2(i), not silently produced — but the residuation values they would produce are exactly the diagnostic the substrate uses to *report* the failure: row 1 returns $\bot$ on $\mathbf{f}$-payloads (silent on contested grants, the failure-witness signature); row 3 returns $\mathbf{t}$ uniformly (the ex-falso pattern, which the closure rule explicitly refuses to admit precisely because it would over-affirm).

Each delegation invariant then follows from the corresponding row's calculation.
Derivativity (a): row 1 is the principal-lacks-authority profile, where the rule blocks.
Accountability non-transfer (b): the residuation operates only on grant-cells, so the accompanying accountability-cell can only be set by a separate clause.
Boundedness (c): row 2 with $G = X$ collapses delegation into abdication.
Revocability (d): row 4 with the $\top$-payload represents the revocation-as-contradiction increment that the substrate's repair machinery resolves to $\mathbf{f}$. $\square$

## What the theorem buys

Two structural consequences:

1. **The four delegation invariants are not independent axioms.** They are the four observable behaviors of *one* operator on its four authority profiles.
  A specification that lists them as separate commitments is reading the substrate wrong; they are *one* commitment (the residuation gate) under four observation conditions.

2. **The "no delegation without authority" rule has a precise failure mode per authority profile.** Silent-authority delegation produces $\bot$-valued derived cells (no derivation occurs).
  Denying-authority delegation would produce a uniform $\mathbf{t}$ — the *ex-falso* pattern — and this is exactly why the closure rule must explicitly block $a = \mathbf{f}$ rather than letting the residuation table run: an actor with $\mathbf{f}$-valued authority has structurally too much algebraic permission, not too little.
  The substrate's authority discipline is *not* "permissive on $\bot$, restrictive on $\mathbf{f}$"; it is the inverse, and the closure rule must compensate.

This second consequence is the load-bearing engineering content: substrate implementations that conflate "authority unknown" with "authority denied" leave the system exposed to row-3 over-affirmation.
The two states must be distinguished and admitted separately into the closure rule.

## Status

`sketch` because:

- The closure-rule statement of delegation in [delegation.md](../morphisms/delegation.md) is informal; promotion requires writing the closure rule in the [closure-rule-language](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-language.md) and verifying its firing pattern matches the residuation table on each row.
- The "abdication vs delegation" distinction in (c) depends on a precise predicate-specialization condition for $G = X$ vs $G \subsetneq X$; the substrate currently treats both as syntactic conditions on the cells.
  A purely-substrate-algebraic distinguishing criterion is open.
  A *proposed sketch* criterion appears in [delegation-transport-via-beck-chevalley](delegation-transport-via-beck-chevalley.md): re-read the existing $G \subsetneq X$ check as the strict-specialization condition on the grant inclusion $\pi : G \hookrightarrow X$, distinguished from the identity by the adjunction-counit's image behavior on $X \setminus G$ (not by any iso/non-iso dichotomy, since the predication fibers are thin).
  Formal resolution awaits this theorem's own promotion past `sketch` and an explicit closure-rule-language statement of the delegation rule.

The structural content — that delegation *is* authority residuation, with the four invariants as residuation-table consequences — is settled.

The companion theorem [delegation-transport-via-beck-chevalley](delegation-transport-via-beck-chevalley.md) extends the present theorem to *transport* of the delegation under base-change: how the residuation gate behaves when the underlying scope is re-based by jurisdiction restriction/extension, succession of the principal incumbent, novation of the source claim, or scope amendment.

## Position

This theorem closes a gap noted by [authority-gate](teaching/explanations/authority-gate.md) (the concept naming the pattern) and connects [delegation](../morphisms/delegation.md) (the operational morphism) to [residuated-restriction-as-authority-gate](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/residuated-restriction-as-authority-gate.md) (the proved math).
Before this theorem, delegation's invariants were stated descriptively; after, they are derived from a single $\mathbf{FOUR}$-valued operator's structure.
