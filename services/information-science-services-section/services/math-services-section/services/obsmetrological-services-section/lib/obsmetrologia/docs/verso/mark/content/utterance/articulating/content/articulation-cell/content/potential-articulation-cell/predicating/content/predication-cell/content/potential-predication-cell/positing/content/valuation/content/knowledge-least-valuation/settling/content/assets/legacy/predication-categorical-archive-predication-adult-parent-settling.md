---
type: example
depends-on: [predication-settling, predicate-specialization, closure-operator, predicate-category-naturality, settling-quiescence, closure-drivenness, four-bilattice]
instantiates: [predication-settling, predicate-specialization, closure-drivenness, predicate-category-naturality]
---

# Adult-parent specialization settling

**Data.** [Entity set](../objects/entity-set.md) $E = \{p_1, p_2, a\}$. [Predicate set](../objects/predicate-set.md) $\Pi = \{\text{parent}, \text{adultParent}\}$. [Settling bound](../objects/settling-bound.md) $\lambda = \omega$. The [predicate category](../objects/predicate-category.md) $\mathcal{C}$ has a [specialization](../morphisms/predicate-specialization.md) morphism $\text{adultParent} \to \text{parent}$ — adult-parents are a sub-class of parents.

**Closure.** The axiom "adultParent$(x, y)$ implies parent$(x, y)$" is encoded by the [closure operator](../morphisms/closure-operator.md):

$$v_\tau(\text{adultParent})(x, y) = \mathbf{t} \implies v_{\tau+1}(\text{parent})(x, y) \geq_k \mathbf{t}.$$

No cross-predicate negative propagation: $\mathbf{f}$-values are not forced through specialization.

**Settling.**
- $\tau = 0$: $v_0(\text{adultParent})(p_1, a) = \mathbf{t}$; all other cells $\bot$. The predication settling is *not* [$\mathcal{C}$-closed](teaching/explanations/predicate-category-naturality.md) at $\tau = 0$: the specialization morphism requires $v_0(\text{parent})(p_1, a) \geq_k \mathbf{t}$, which fails.
- $\tau = 1$ (closure fires): $v_1(\text{parent})(p_1, a) = \mathbf{t}$ (derived from the axiom). The predication settling is now $\mathcal{C}$-closed.
- $\tau \geq 1$: [quiescent](teaching/explanations/settling-quiescence.md).

**$\mathcal{C}$-closure check.** At $\tau = 1$, applying the specialization $f : \text{adultParent} \to \text{parent}$ gives

$$f^*(v_1(\text{parent}))(p_1, a) = v_1(\text{parent})(p_1, a) = \mathbf{t},$$

which equals $v_1(\text{adultParent})(p_1, a) = \mathbf{t}$. So $\mathcal{C}$-closure (predicate-category naturality) holds at $\tau = 1$. The pre-closure settling state at $\tau = 0$ is a general predication settling but not yet a presheaf; closure restores the presheaf structure.

**Role.** End-to-end demonstration of the predication settling formalism: spatial base, predicate category with non-trivial morphism, fiber algebras, settling-with-closure, quiescence. More complex applications — knowledge graphs, description logics, multi-agent systems — compose these primitives at larger scale.
