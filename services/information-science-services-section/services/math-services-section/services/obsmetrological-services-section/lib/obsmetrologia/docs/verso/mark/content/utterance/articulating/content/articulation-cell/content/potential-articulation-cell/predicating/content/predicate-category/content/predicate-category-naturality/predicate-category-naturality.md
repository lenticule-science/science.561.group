---
type: concept
class: condition
depends-on: [predication-settling, predicate-category, predication-fiber-functor]
---

# Predicate-category naturality

A [predication settling](../objects/predication-settling.md) $v = (v_\tau)_{\tau < \lambda}$ is **$\mathcal{C}$-closed at step $\tau$** if for every morphism $f : q \to p$ in the [predicate category](../objects/predicate-category.md) $\mathcal{C}$,

$$f^*(v_\tau(p)) = v_\tau(q),$$

where $f^*$ is the action of $f$ under the [predication fiber functor](../theorems/predication-fiber-functor.md).
It is **fully $\mathcal{C}$-closed** if it is $\mathcal{C}$-closed at every $\tau < \lambda$.

The $\mathcal{C}$-naturality condition is not required of arbitrary predication settlings.
A pre-closure settling state may assert evidence at a specialized predicate $q$ without the corresponding evidence having been derived at its super-predicate $p$; the [closure operator](../morphisms/closure-operator.md) fires to restore naturality.
At quiescence, a [closure-driven](closure-drivenness.md) predication settling is fully $\mathcal{C}$-closed.

A fully $\mathcal{C}$-closed predication settling is equivalently a functor $\mathbf{M} : \mathcal{C}^{\mathrm{op}} \times \lambda \to \mathbf{DBiLat}_\ast(\mathbf{L})$ into the category of pointed distributive bilattices, sending $(p, \tau)$ to the pointed algebra $(A_p, v_\tau(p))$ — predicate-functoriality is the $\mathcal{C}$-naturality condition, and settling-functoriality is [knowledge-order](knowledge-order.md) monotonicity of the distinguished point.
A general predication settling is a pre-functorial object that *becomes* a presheaf under closure — the name reflects this limit.
