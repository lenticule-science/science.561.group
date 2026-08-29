---
type: theorem
status: sketch
depends-on: [predication-settling-category, predication-settling, predication-valuation, closure-operator, knowledge-order, predication-cell, predication-fiber-algebra]
---

# Operationally-realizable PS-morphisms factor as atomic positing followed by closure

A [predication settling category](../objects/predication-settling-category.md) morphism $v_0 \to v_1$ is **operationally realizable** if there exists a positing collection $W$ — a [predication valuation](../objects/predication-valuation.md) supported on finitely many [predication cells](teaching/explanations/predication-cell.md) — such that $v_1 = \mathrm{cl}(v_0 \vee_k W)$. Every operationally-realizable morphism factors as a composite of atomic positing steps followed by exactly one closure step, and this factorization is unique up to commutativity of independent positing steps.

## Statement

**Existence.** If $v_0 \to v_1$ is operationally realizable via $W$, then:

$$v_0 \xrightarrow{\mathrm{posit}_{(\phi_1, q_1)}} \cdots \xrightarrow{\mathrm{posit}_{(\phi_n, q_n)}} v_0 \vee_k W \xrightarrow{\mathrm{cl}} \mathrm{cl}(v_0 \vee_k W) = v_1$$

for any enumeration $W = \bigsqcup_{i=1}^n \delta_{\phi_i, q_i}$ of $W$ as a finite join of atomic positing steps.

**Commutativity.** Atomic positing steps at distinct cells commute: $\mathrm{posit}_{(\phi_i, q_i)} \circ \mathrm{posit}_{(\phi_j, q_j)} = \mathrm{posit}_{(\phi_j, q_j)} \circ \mathrm{posit}_{(\phi_i, q_i)}$ when $\phi_i \neq \phi_j$, since each step changes exactly one cell and the changes at distinct cells do not interfere.

**Minimality.** Among all positing collections $W'$ with $\mathrm{cl}(v_0 \vee_k W') = v_1$, the **minimal** positing collection $W_{\min}$ exists in finite $\mathbf{L}$, $E$, $\mathcal{C}$: it is the meet of all valid $W'$'s in the $\leq_k$-order on valuations. Concretely, $W_{\min}(p)(s, o) = v_1(p)(s, o)$ when $\mathrm{cl}(v_0)(p)(s, o) <_k v_1(p)(s, o)$ (a cell whose value rises above the closure of $v_0$ alone) and $\bot$ otherwise (a cell whose value in $v_1$ is already derivable from $v_0$ by closure). The minimal positing collection adds only evidence not already derivable from $v_0$.

## Proof sketch

The existence claim is immediate: any enumeration of $W$'s support cells gives the required sequence, since $v_0 \vee_k \bigsqcup_{i=1}^n \delta_{\phi_i, q_i} = v_0 \vee_k W$ by commutativity-associativity of $\vee_k$, and one closure step gives $v_1$.

For commutativity: $\mathrm{posit}_{(\phi_i, q_i)}(u)$ changes $u(p_i)(s_i, o_i)$ to $u(p_i)(s_i, o_i) \vee_k q_i$ and leaves all other cells fixed. If $\phi_i \neq \phi_j$, the two changes are at distinct cells and therefore do not interact; commutativity follows.

For minimality on finite $\mathbf{L}$, $E$, $\mathcal{C}$: the lattice of positing collections (ordered by $\leq_k$) is finite, so the meet of all valid $W'$'s exists. The characterization of $W_{\min}$ follows from: $\mathrm{cl}(v_0 \vee_k W_{\min}) = v_1$ iff $W_{\min}$ contains exactly the cells not already derivable from $v_0$ alone. $\square$

## Why not all PS-morphisms are operationally realizable

A general $\mathbf{PS}$-morphism $v_0 \leq_k v_1$ need not be operationally realizable: $v_1$ may be a settling that is not the closure of $v_0$ joined with any finite positing collection. For example, if $v_1$ is an intermediate state between $v_0$ and $\mathrm{cl}(v_0)$ — a settling that is above $v_0$ but not yet closure-saturated — then no single positing collection and one closure step reaches $v_1$.

The operationally-realizable morphisms are those that correspond to actual settling steps: inject evidence (positing), then derive (closure). The general $\mathbf{PS}$-morphisms include formal $\leq_k$-increases that are not operationally grounded.

## Factorization system structure

The pair $(\mathcal{L}, \mathcal{R})$ where:
- $\mathcal{L}$: finite composites of atomic positing steps
- $\mathcal{R}$: single closure morphisms $v \mapsto \mathrm{cl}(v)$

forms a factorization system on the **subcategory** of operationally-realizable morphisms. The factorization is not orthogonal in the classical sense (the lifting property fails because $\mathbf{PS}$ is only a preorder, not a category with enough structure for diagonal fillers), but it is **unique up to $\mathcal{L}$-commutativity**: any two factorizations of the same operationally-realizable morphism $v_0 \to v_1$ have the same set of atomic positing steps (namely $W_{\min}$), differing only in the order in which independent steps are applied.

## Connection to the positing-morphism suite

This theorem grounds the definition of [positing-morphism](../morphisms/positing-morphism.md) as a proper morphism class: positing morphisms are exactly the $\mathcal{L}$-factor in the factorization of operationally-realizable $\mathbf{PS}$-morphisms. The speech-act classes (assertive, denial, contestation) are sub-classes of $\mathcal{L}$ distinguished by the truth-order class of their datum. Closure morphisms are the $\mathcal{R}$-factor, corresponding to the perlocutionary effect of a speech act.
