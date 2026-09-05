---
type: example
depends-on: [predication-settling, predicate-specialization, closure-operator, settling-quiescence, four-bilattice]
instantiates: [predication-settling, predicate-specialization, closure-drivenness]
---

# Knowledge-graph predication settling with specialization

**Data.** [Entity set](../objects/entity-set.md) $E = \{\text{Spot}, \text{Dog}, \text{Mammal}\}$. [Predicate set](../objects/predicate-set.md) $\Pi = \{\text{isA}, \text{isMammal}\}$. [Settling bound](../objects/settling-bound.md) $\lambda = \omega$. The [predicate category](../objects/predicate-category.md) $\mathcal{C}$ has a [specialization](../morphisms/predicate-specialization.md) morphism $\text{isMammal} \to \text{isA}$ with $\mathrm{dom}(\text{isMammal}) \subseteq \mathrm{dom}(\text{isA})$ — every isMammal-assertion is an isA-assertion restricted to the "mammal" class.

**Closure.** The TBox axiom "Dog isA Mammal" is encoded by the [closure operator](../morphisms/closure-operator.md):

$$v_\tau(\text{isA})(x, \text{Dog}) = \mathbf{t} \implies v_{\tau+1}(\text{isA})(x, \text{Mammal}) \geq_k \mathbf{t}.$$

**Settling.**
- $\tau = 0$: $v_0(\text{isA})(\text{Spot}, \text{Dog}) = \mathbf{t}$; all other cells $\bot$.
- $\tau = 1$ (closure fires): $v_1(\text{isA})(\text{Spot}, \text{Mammal}) = \mathbf{t}$ (derived). Existing cells unchanged.
- $\tau \geq 1$: [quiescent](../concepts/settling-quiescence.md).

**Quiescent state.** $v_\tau(\text{isA})(\text{Spot}, \text{Dog}) = v_\tau(\text{isA})(\text{Spot}, \text{Mammal}) = \mathbf{t}$ for all $\tau \geq 1$; all else $\bot$.

**Role.** Smallest example exhibiting a non-trivial closure operator. Shows how a settling step can populate $\bot$-cells with derived evidence. Analogous to RDFS inference over a small class hierarchy.
