---
type: concept
class: settling-section
symbol: "v^R_{T,\\infty}"
depends-on: [predication-settling, closure-2-monad, predication-settling-base-morphism, knowledge-order]
see-also: [predication-settling-category, resource-deficit, idealization-morphism, invisible-automorphism-subgroup]
---

# Theory-relative ideal

Let $T$ be a host theory: a [predication settling](../objects/predication-settling.md) $(v^T_\tau)_{\tau < \lambda}$ over $(\mathbf{L}, \mathcal{C}^T, E, \lambda)$ with [closure operator](../morphisms/closure-operator.md) $\mathrm{Cl}^T$, whose fully-settled state $v^T_\infty$ is the $\mathrm{Cl}^T$-fixed-point. Let $R$ be a resource settling over $(\mathbf{L}, \mathcal{C}^R, E, \lambda_R)$ with a type embedding $\iota : \mathcal{C}^R \hookrightarrow \mathcal{C}^T$ — a functor that is faithful and preserves generator classes, placing the resource's predicate scope inside the theory's.

The **theory-relative ideal** of $R$ within $T$ is the restriction of the theory's settled state to the resource's scope:

$$v^R_{T,\infty} \;:=\; \iota^*(v^T_\infty)$$

where $\iota^*$ is the [predication-settling base-morphism](../morphisms/predication-settling-base-morphism.md) that reindexes the theory's fibers along $\iota$: $(\iota^*(v^T_\infty))(p) := v^T_\infty(\iota(p))$ for every predicate $p \in \mathcal{C}^R$. The result is a settling over $\mathcal{C}^R$ — the same predicate scope as $R$.

## What it captures

The theory $T$ has arrived at a settled understanding of every predicate in $\mathcal{C}^T$. Restricting to the predicates that $R$ cares about (those in $\mathcal{C}^R$, as embedded via $\iota$) tells you what the theory says a resource at this scope should know. That is the standard against which any particular current state $v^R$ is measured.

Three conditions characterize a resource's standing relative to the ideal:

**Theory-complete**: $v^R_{T,\infty} \leq_k v^R$ — the resource knows at least as much as the theory's ideal says it should. No cell is deficient.

**Theory-grounded**: $v^R \leq_k v^R_{T,\infty}$ — every claim in the resource is at most as informed as what the theory's ideal supports. No cell is excessive.

**Theory-ideal**: $v^R = v^R_{T,\infty}$ — both conditions hold. The resource exactly matches the theory's settled expectation.

A resource can be theory-complete without being theory-grounded (it makes claims beyond the ideal), theory-grounded without being theory-complete (it is missing content), or neither (some claims are deficient, others excessive).

## The role of $v^T_\infty$

$v^T_\infty$ is the $\mathrm{Cl}^T$-fixed-point of the theory's own settling — the state the theory reaches when no further closure step changes anything. In the strict and Scott-continuous [regimes](../../../../../../../references/four-regime-dichotomy.md), this fixed point is reached at a finite or $\omega$ ordinal and is fully computable. In transfinite-bounded and aperiodic regimes, $v^T_\infty$ is approached as a limit.

The theory-relative ideal inherits the regime of the host theory. For practical purposes — this repository's predication theory, which is a finite corpus with computable closure rules — $v^T_\infty$ is in the strict regime and $v^R_{T,\infty}$ is well-defined with no transfinite complications.

## What this is NOT

The theory-relative ideal $v^R_{T,\infty}$ is not the output of applying the resource's own closure operator $\mathrm{Cl}^R$ to $v^R$. The resource's own closure determines what the resource can derive from itself. The theory-relative ideal is what the HOST THEORY says the resource should contain — it may strictly exceed what the resource's own closure produces, because $\mathrm{Cl}^T$ reaches predicates and inference patterns outside $\mathcal{C}^R$'s own closure system.

This is the "complex influence of existing within a theory": the theory derives things about the resource that the resource cannot derive about itself.
