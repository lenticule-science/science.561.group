---
type: theorem
status: sketch
depends-on: [predication-settling-category, predication-settling, closure-operator, closure-2-monad, predication-cell, knowledge-order, predication-valuation]
see-also: [positing-realizable-factorization, ps-morphism-em-factorization, positing-naturality, positing-morphism]
title: Positing is the initial morphism at a cell; the closure unit is the join of all cell-level positings
description: "The positing morphism $\\mathrm{posit}{(\\phi, q)} : v \\mapsto v \\veek \\delta{\\phi, q}$ has a universal property in $\\mathbf{PS}$: it is the initial $\\mathbf{PS}$-morphism from $v$ to any settling with value $\\geqk q$ at cell $\\phi$ and…"
---

# Positing is the initial morphism at a cell; the closure unit is the join of all cell-level positings

The [positing morphism](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/positing-morphism/positing-morphism.md) $\mathrm{posit}_{(\phi, q)} : v \mapsto v \vee_k \delta_{\phi, q}$ has a universal property in $\mathbf{PS}$: it is the **initial** $\mathbf{PS}$-morphism from $v$ to any settling with value $\geq_k q$ at cell $\phi$ and equal to $v$ everywhere else. The unit $\eta_v : v \to \mathrm{cl}(v)$ of the closure 2-monad $\mathbb{T}$ decomposes as a **batch positing morphism**: a simultaneous positing of all content that closure adds, followed by the trivial closure step (identity on the result).

## Statement

**Universal property of positing.** For a settling $v$, a cell $\phi$, and a datum $q$, the positing morphism $\mathrm{posit}_{(\phi, q)}$ is the initial object in the slice category:

$$\mathbf{PS}_{v}^{\phi, q} := \{w \in \mathbf{PS} : v \leq_k w,\; w(\phi) \geq_k q,\; w(\phi') = v(\phi') \text{ for all } \phi' \neq \phi\}$$

ordered by $\leq_k$. That is, $v \vee_k \delta_{\phi, q}$ is the least settling above $v$ with value $\geq_k q$ at $\phi$ and unchanged at all other cells. Every other element of $\mathbf{PS}_{v}^{\phi, q}$ is $\geq_k v \vee_k \delta_{\phi, q}$.

**Closure unit as batch positing.** For any settling $v$, the closure unit $\eta_v : v \to \mathrm{cl}(v)$ equals the batch positing morphism $\mathrm{posit}_{W}$ followed by the identity:

$$\eta_v = \mathrm{posit}_{W_{\eta}}(v), \quad W_{\eta} := \mathrm{cl}(v)$$

where $\mathrm{posit}_{W_\eta}(v) = v \vee_k \mathrm{cl}(v) = \mathrm{cl}(v)$ (since $\mathrm{cl}(v) \geq_k v$). Decomposing $W_\eta$ cell by cell:

$$\eta_v = \bigvee_{\phi:\, \mathrm{cl}(v)(\phi) >_k v(\phi)} \mathrm{posit}_{(\phi,\, \mathrm{cl}(v)(\phi))},$$

the join (in the $\leq_k$-order on $\mathbf{PS}$) of all individual cell-level positing morphisms at the new content added by closure. Each individual positing morphism in this join is an assertive, denial, or contestation positing morphism depending on the truth-class of $\mathrm{cl}(v)(\phi)$.

## Proof

**Universal property.** $v \vee_k \delta_{\phi, q}$ is in $\mathbf{PS}_{v}^{\phi, q}$ by construction: it equals $q$ at $\phi$ (since $v(\phi) \vee_k q = q \vee_k v(\phi) \geq_k q$, not necessarily equal; take $\delta_{\phi,q}(\phi) = q$ so $v(\phi) \vee_k q$ at cell $\phi$, which equals $q$ when $v(\phi) \leq_k q$) and equals $v(\phi')$ at all other cells. For any other $w \in \mathbf{PS}_{v}^{\phi, q}$: $w(\phi) \geq_k q$ and $w(\phi') = v(\phi')$ for $\phi' \neq \phi$, so $w \geq_k v \vee_k \delta_{\phi, q}$ pointwise (at $\phi$: $w(\phi) \geq_k q = \delta_{\phi,q}(\phi) \geq_k v(\phi) \vee_k q$... hmm, more carefully: $(v \vee_k \delta_{\phi,q})(\phi) = v(\phi) \vee_k q$, and $w(\phi) \geq_k q \geq_k v(\phi) \vee_k q$ iff $w(\phi) \geq_k v(\phi) \vee_k q$, which holds iff $w(\phi) \geq_k v(\phi)$ AND $w(\phi) \geq_k q$, which are both given). So $w \geq_k v \vee_k \delta_{\phi, q}$. Initiality proved. $\square$

**Batch positing.** $\eta_v : v \to \mathrm{cl}(v)$ is a $\mathbf{PS}$-morphism since $v \leq_k \mathrm{cl}(v)$ by the inflationary axiom. Writing $\mathrm{cl}(v) = v \vee_k (\mathrm{cl}(v) - v)$ where $\mathrm{cl}(v) - v$ denotes the valuation $\phi \mapsto \mathrm{cl}(v)(\phi)$ (the full closed valuation, not a difference operation), the batch positing $v \mapsto v \vee_k \mathrm{cl}(v) = \mathrm{cl}(v)$ is correct. The cell-by-cell decomposition: $\mathrm{cl}(v) = v \vee_k \bigsqcup_\phi \delta_{\phi, \mathrm{cl}(v)(\phi)}$ expresses the batch as a join of individual positing morphisms over all cells (where $\delta_{\phi, \mathrm{cl}(v)(\phi)}$ contributes only at $\phi$ with the value $\mathrm{cl}(v)(\phi)$). Only cells where $\mathrm{cl}(v)(\phi) >_k v(\phi)$ contribute non-trivially. $\square$

## The distinction between positing and the closure unit

Positing $\mathrm{posit}_{(\phi, q)}$ is the **least step** adding prescribed new content at one cell. The unit $\eta_v$ is the **least step** reaching the closure-fixpoint above $v$ — by adding ALL new content that closure derives. These are related but distinct:

- Positing is a **cell-local** operation: it specifies exactly which cell to increment and by what.
- $\eta_v$ is **global**: it adds everything derivable by closure from $v$, potentially affecting every cell simultaneously.

The unit $\eta_v$ is initial in the slice of $\mathbf{PS}$-morphisms from $v$ to any closure-fixpoint above $v$. Positing $\mathrm{posit}_{(\phi, q)}$ is initial in the smaller slice of morphisms that change only cell $\phi$ and raise it to $\geq_k q$.

The batch-positing decomposition makes the relationship precise: $\eta_v = \bigvee_\phi \mathrm{posit}_{(\phi, \mathrm{cl}(v)(\phi))}$ — the unit is the $\leq_k$-join of all individual-cell positings needed to reach the closure. This join is in $\mathbf{PS}$ (since $\mathbf{PS}$ is a preorder with $\leq_k$-joins, given that $\mathbf{L}^\bowtie$ is a complete lattice).

## Cell-local monads

For a closure operator $\mathrm{cl}$ that has no cross-cell rules at $\phi$ — all rules that affect cell $\phi$ depend only on $\phi$'s own value — the restriction $\mathrm{cl}_\phi : \mathbf{L}^\bowtie \to \mathbf{L}^\bowtie$ defined by $\mathrm{cl}_\phi(q) := \mathrm{cl}(v_{\phi = q})(\phi)$ (the closure of the all-$\bot$ settling with $q$ at $\phi$, evaluated at $\phi$) is itself a closure operator (inflationary, idempotent, monotone on $\mathbf{L}^\bowtie$). The assignment $T_\phi(v)(\phi) = \mathrm{cl}_\phi(v(\phi))$, $T_\phi(v)(\phi') = v(\phi')$ for $\phi' \neq \phi$ defines a **cell-local monad** on $\mathbf{PS}$. In this case, $\mathrm{posit}_{(\phi, q)}$ is the **unit** of $T_\phi$ at datum $q$: the minimal step that allows $T_\phi$ to do its work at $\phi$.

For cross-cell closure operators, the cell-local decomposition fails in general: $\mathrm{cl}$ is not the composite of independent $T_\phi$'s. But the batch-positing decomposition of $\eta_v$ still holds, since it only requires that $\mathrm{cl}(v) \geq_k v$ (inflationary).

## The closure unit as sincere full assertion

The closure unit $\eta_v$ corresponds to the **sincere full assertion** of everything one believes: it asserts, at every cell, the full content of the closed epistemic state. Individual positing morphisms are the atomic speech acts; $\eta_v$ is their conjunction. The formal statement is: the unit of the closure 2-monad is the $\leq_k$-join in $\mathbf{PS}$ of all individual cell-level positing morphisms $\mathrm{posit}_{(\phi, \mathrm{cl}(v)(\phi))}$ over cells $\phi$ where $\mathrm{cl}(v)$ exceeds $v$.
