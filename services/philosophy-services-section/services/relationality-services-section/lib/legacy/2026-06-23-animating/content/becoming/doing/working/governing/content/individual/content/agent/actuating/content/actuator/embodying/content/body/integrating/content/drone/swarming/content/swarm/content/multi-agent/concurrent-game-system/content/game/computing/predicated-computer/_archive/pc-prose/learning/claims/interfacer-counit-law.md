---
type: theorem
class: engineering-claim
depends-on: [interfacer, canonical-form, closure-2-monad, predication-fiber-algebra, twist-product-fusion, twist-product-right-residual]
---

# Interfacer extract-apply pairs round-trip losslessly under canonical-form

**Claim.** Let $I$ be an [interfacer](teaching/explanations/interfacer.md) with extract operation $E$ and apply operation $A$. For any external content $c$ and any predication change-set $\Delta$,

$$E(A(\Delta, c)) = E(c) \oplus \Delta$$

where $\oplus$ is the substrate's predication-set join — the cellwise [knowledge-order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) join $\vee_k$ on the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md). Reading the result of applying $\Delta$ to $c$ produces the same predications as reading $c$ originally and then joining $\Delta$ with the result.

The law is the *counit* of the interfacer's extract-apply adjunction: structurally the [twist-product fusion](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) $\odot$ left-adjoint to the [twist-product right residual](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-right-residual.md) $\Rightarrow$ — the linear-logic adjunction at the interfacer's external surface.

## Why this holds

The argument is structural.

**Part 1: Apply is a substrate-side change.** Per [interfacer](teaching/explanations/interfacer.md), the apply operation $A(\Delta, c)$ produces a modified external representation by serializing $E(c) \oplus \Delta$ through the interfacer's canonical-form serializer. The new external content carries exactly the predications $E(c) \oplus \Delta$ in serialized form.

**Part 2: Extract reverses the canonical-form serialization.** Per [canonical-form](teaching/explanations/canonical-form.md), the interfacer's serializer is byte-deterministic and its parser is its inverse on canonical-form bytes: parsing the result of serializing predications produces those predications. The extract operation applied to $A(\Delta, c)$ produces the predications that $A$ serialized — namely, $E(c) \oplus \Delta$.

**Part 3: $\vee_k$ is associative and commutative.** The [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md)'s knowledge-order join $\vee_k$ is the structural join of the bilattice — commutative, associative, and idempotent, lifted pointwise from the underlying [twist product](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/twist-product.md). Reading and joining commute: $E(c) \oplus \Delta = \Delta \oplus E(c)$.

Combining the three: $E(A(\Delta, c))$ recovers the predications $A$ wrote, which are $E(c) \oplus \Delta$, satisfying the counit law.

## The unit-counit structure

The extract-apply pair forms a unit-counit adjunction in the substrate's algebra:

- **Unit** $\eta : c \to A(E(c), \emptyset)$ — read content, then apply the extracted predications to empty external content. Recovers the content (modulo non-predication artifacts the interfacer admits).
- **Counit** $\epsilon : E(A(\Delta, c)) \to E(c) \oplus \Delta$ — apply changes, then read. Recovers the joined predications.

The triangle identities follow from byte-deterministic canonical-form (units and counits round-trip correctly through serialization). Per the [closure 2-monad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md)'s lax-idempotence framework, this kind of structural unit-counit pair is property-like once the underlying serialization is fixed.

## Engineering consequence

A round-trip through an interfacer — write the substrate's predication-changes to external content; read the modified external content back into substrate predications — recovers the original predications plus the changes. Information is not silently lost in the round-trip. Per [interfacers-and-cost-settlement](teaching/explanations/interfacers-and-cost-settlement.md), this is the substrate's contract with the external world: the substrate's content has a stable algebraic relationship with its external representation.

Three corollaries follow:

- **Coassociativity of apply.** $A(\Delta_1, A(\Delta_2, c)) = A(\Delta_1 \oplus \Delta_2, c)$. Sequential applies compose to a single batched apply. This is what makes incremental edits and batched edits interchangeable.
- **Identity apply.** $A(\emptyset, c) = c$ (where $\emptyset$ is the empty change-set). Applying nothing changes nothing.
- **Read-write reversibility.** $A(E(c), \emptyset) = c$ (the unit, where the second argument is empty content). Reading a content's predications and applying them as a change-set to empty content reproduces the original content (modulo non-predication artifacts the interfacer admits — comments, whitespace conventions — which are interfacer-policy).

## What the theorem rules out

An interfacer whose serializer is *not* byte-deterministic (locale-sensitive number formatting, time-zone-sensitive timestamps without explicit zones, hash-set-ordered key emission) does not satisfy the counit law: writing predications produces non-canonical bytes, and reading those bytes may not recover the original predications.

An interfacer whose extract loses information that the apply could not reconstruct (parsing a markdown comment but not preserving it on apply, accepting a date string but discarding its precision) violates the counit law for content involving the lost information.

The substrate's response is to admit only interfacers that pass the counit test on the predications the substrate cares about. Per [validate-against-shape](../morphisms/validate-against-shape.md), the substrate may run extract-apply round-trip tests as part of interfacer admission, rejecting interfacers whose round-trips lose information.

## What the theorem requires

- The interfacer's serializer is byte-deterministic on the predications it admits.
- The interfacer's parser is the deterministic inverse of the serializer on canonical-form bytes.
- The substrate's value-domain is a [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) — the join $\vee_k$ is commutative, associative, idempotent.
- Non-predication artifacts the interfacer accepts (whitespace, comments) are either preserved or are explicitly out-of-scope per the interfacer's policy.

The interfacer's counit law is the engineering instance of the linear-logic counit at the substrate's external surface — the $\odot \dashv \Rightarrow$ adjunction (twist-product fusion left-adjoint to right residual) lifted to the interfacer's extract-apply pair.
