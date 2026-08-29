---
type: concept
class: condition
depends-on: [settling-bound, kz-coherent-sheaf, bitopological-settling-site]
---

# Local constancy in the predicate and settling directions

Two parallel local-constancy conditions on a sheaf $F$ on the [bitopological settling site](../objects/bitopological-settling-site.md) — one for each axis — that, when satisfied, force vanishing or stabilization of [settling cohomology](../objects/settling-cohomology.md).

## Predicate-local-constancy

A sheaf $F$ is **predicate-locally-constant** if for every $\mathcal{C}$-generator morphism $f : q' \to q$ and every ordinal $\tau$, the restriction

$$F(f^* \times \mathrm{id}_\tau) \,:\, F(q, \tau, U) \to F(q', \tau, f^*(U))$$

is an isomorphism for every pairwise-Stone clopen $U$.
Equivalently, $F$ depends on $q$ only through the underlying [paired Priestley space](../objects/paired-priestley-space.md) structure, not through the predicate's identity.

The constant sheaf $\underline{A}$ is predicate-locally-constant for any $A$.
The [settling-associated sheaf](../objects/settling-associated-sheaf.md) $\mathcal{F}_U$ is predicate-locally-constant iff settling stabilization is predicate-uniform — typically false in real settlings, but a reasonable hypothesis for the simplest examples.

## Settling-local-constancy

A sheaf $F$ is **settling-locally-constant beyond $\tau_0$** if for every $\tau \geq \tau_0$ and every temporal-advance morphism $h : \tau \to \tau'$ in $\lambda^{\mathrm{op}}$, the restriction

$$F(\mathrm{id} \times h^*) \,:\, F(q, \tau', U) \to F(q, \tau, U)$$

is an isomorphism.
The settling has stopped contributing new content beyond $\tau_0$.

## Regime correspondence

[Strict-regime](../theorems/four-regime-dichotomy.md) settlings have settling-locally-constant $\mathcal{F}_U$ beyond $\tau^* = \kappa$ — finite closure ordinal forces stabilization and the cohomology becomes a finite computation by [settling-locally-constant cohomology](../theorems/settling-locally-constant-cohomology.md).
Aperiodic-regime settlings fail settling-local-constancy at *every* countable $\tau_0$, forcing the full direct-limit construction.
