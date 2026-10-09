---
type: concept
class: operator
symbol: "\\pi^*(\\mathrm{Cl})"
depends-on: [closure-operator, predicate-category, predication-theory]
see-also: [theory-relative-ideal, subtheory, closure-restriction-is-closure]
---

# Closure restriction

Let $\pi : \mathcal{C}^S \hookrightarrow \mathcal{C}^T$ be a type embedding — a functor that is faithful and preserves generator classes.
A closure operator $\mathrm{Cl}^S$ on the predication fiber functor over $(\mathbf{L}, \mathcal{C}^S, E)$ is the **$\pi$-restriction** of a closure operator $\mathrm{Cl}^T$ over $(\mathbf{L}, \mathcal{C}^T, E)$, written $\mathrm{Cl}^S = \pi^*(\mathrm{Cl}^T)$, iff

$$\mathrm{Cl}^S_p \;=\; \mathrm{Cl}^T_{\pi(p)} \qquad \text{for every } p \in \mathcal{C}^S.$$

Since $\mathbf{L}$ and $E$ are common, the fiber algebra at any $p \in \mathcal{C}^S$ equals the fiber algebra at $\pi(p) \in \mathcal{C}^T$:

$$A^S_p \;=\; \mathbf{L}^{\bowtie\, E \times E} \;=\; A^T_{\pi(p)}.$$

Closure restriction is therefore literal equality of operators on the same algebra: the closure rule that the host theory $T$ applies at predicate $\pi(p)$ is exactly the closure rule that the subscope $S$ applies at predicate $p$.
No translation, projection, or approximation is involved.

## What this concept captures

The [theory-relative ideal](../../../../../../../../../valuation/content/knowledge-least-valuation/settling/content/closure-2-monad/content/theory-relative-ideal/theory-relative-ideal.md) $v^R_{T,\infty} = \pi^*(v^T_\infty)$ captures the restriction of a host theory's **settled state** to a resource's predicate scope.
Closure restriction captures the restriction of the host theory's **inference structure**.
The two are parallel operations on different layers of the theory:

| Restriction | Layer | Definition |
|---|---|---|
| $\pi^*(v^T_\infty)$ | Settled state | $(\pi^*(v^T_\infty))(p) := v^T_\infty(\pi(p))$ |
| $\pi^*(\mathrm{Cl}^T)$ | Closure operator | $(\pi^*(\mathrm{Cl}^T))_p := \mathrm{Cl}^T_{\pi(p)}$ |

A settling can match a host theory's settled values while arriving there by entirely different inference rules.
Closure restriction is what rules this out: it demands that the subscope's inference rules BE the host theory's rules, restricted to the smaller predicate scope.

## "Sub-" in predication categories

In ordinary category theory, "sub-" is predicate restriction: a subcategory restricts objects and morphisms.
In predication hyperdoctrinal categories, "sub-" additionally restricts the fiber structure: a subfibration restricts to fiber algebras forming a subfibration of the larger one.
In predication category theory — where theories carry a [closure operator](../morphisms/closure-operator.md) as an explicit component — "sub-" requires a third layer: closure restriction.

This requirement is not an arbitrary addition.
A [predication theory](../objects/predication-theory.md) is $(\mathbf{L}, \mathcal{C}, E, \mathrm{Cl})$: the inference structure $\mathrm{Cl}$ is part of what the theory IS.
A sub-THEORY must therefore inherit the inference structure, not merely the settled values.
Closure restriction $\pi^*(\mathrm{Cl}^T)$ is the pullback operation that witnesses this inheritance.
See [closure restriction is a closure](../theorems/closure-restriction-is-closure.md) for the proof that $\pi^*(\mathrm{Cl}^T)$ is always a well-formed closure operator on $\mathcal{C}^S$.
