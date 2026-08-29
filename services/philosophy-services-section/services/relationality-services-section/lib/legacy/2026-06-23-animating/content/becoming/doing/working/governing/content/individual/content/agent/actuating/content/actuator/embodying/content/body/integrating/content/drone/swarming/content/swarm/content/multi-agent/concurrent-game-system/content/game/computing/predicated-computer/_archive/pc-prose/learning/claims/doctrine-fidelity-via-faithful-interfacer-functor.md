---
type: theorem
class: engineering-claim
status: proved
depends-on: [doctrine-fidelity, interfacer, interfacer-counit-law, predication-fibration, predication-fiber-algebra, parameter-base-category, hash-injectivity-under-canonical-form]
see-also: [conformance-via-fiber-algebra-functor, schema-evolution-via-base-admissibility]
---

# Doctrine fidelity is the faithfulness of the interfacer functor

**Claim.** For any [interfacer](teaching/explanations/interfacer.md) $I : \mathcal{S} \to \mathrm{Pred}(\mathcal{C})$ admitting external content from a source's representation category $\mathcal{S}$ into the substrate's [predication fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) over $\mathcal{C}$, the substrate's [doctrine fidelity](teaching/explanations/doctrine-fidelity.md) discipline is *equivalent to the categorical faithfulness* of $I$:

- **Faithful on objects.** Distinct source objects $s_1 \neq s_2 \in \mathcal{S}$ map to distinct substrate predications $I(s_1) \neq I(s_2)$ (modulo $I$'s declared kernel — what the substrate explicitly chooses to discard).
- **Faithful on morphisms.** Distinct source structural relations $f, g : s_1 \to s_2$ in $\mathcal{S}$ map to distinct substrate fiber-algebra morphisms $I(f) \neq I(g)$.

Per the [interfacer-counit-law](interfacer-counit-law.md), the substrate-level test of faithfulness is `extract(apply(Δ, c)) = extract(c) ⊕ Δ` — read after write recovers the original predications joined with the change set. Per this theorem, the counit law is *exactly* the categorical condition for $I$ to have a right adjoint extract $E$ with $E \circ I \cong 1_\mathcal{S}$ — which is the engineering form of "$I$ is faithful with extractable inverse."

## Why this holds

A categorical functor $I : \mathcal{S} \to \mathcal{T}$ is *faithful* iff it is injective on hom-sets: distinct morphisms in $\mathcal{S}$ map to distinct morphisms in $\mathcal{T}$. For the interfacer:

- An object of $\mathcal{S}$ is a source content unit (a markdown file, a JSON object, a sensor reading).
- A morphism of $\mathcal{S}$ is a structural relation in the source (parent-child for nested elements, sequence ordering, type compatibility).
- $I$ maps each source object to a substrate predication-set $I(s) \subseteq A_\sigma$ at some scope $\sigma$ in the parameter-base category.
- $I$ maps each source morphism to a fiber-algebra morphism in the predication fibration.

Faithfulness of $I$ is exactly:

1. **No object collapse.** If $s_1 \neq s_2$, the substrate's predications $I(s_1)$ and $I(s_2)$ have distinct canonical-form hashes (per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md)) — the substrate distinguishes them.
2. **No morphism collapse.** If $f \neq g$ as morphisms in $\mathcal{S}$, the substrate's fiber-algebra morphisms $I(f)$ and $I(g)$ act differently on $I(s_1)$ — they produce distinct outputs on at least one input.

The substrate's [interfacer-counit-law](interfacer-counit-law.md) is the operational test: applying a change set $\Delta$ to substrate content $c$ via the interfacer's `apply`, then extracting back via `extract`, must recover the substrate's view of "$c$ joined with $\Delta$." If this round-trip drops information ($\mathrm{extract}(\mathrm{apply}(\Delta, c)) \neq \mathrm{extract}(c) \oplus \Delta$), the interfacer has a non-trivial structural collapse — it is not faithful.

In categorical terms: the counit law is the equation $\epsilon \circ I = 1_\mathcal{S}$ (composing the unit-counit pair of the $I \dashv E$ adjunction). The adjunction with this counit law is a *coreflective embedding* — the categorical form of "$I$ is faithful and has an extractable inverse."

## Engineering consequence

- **Doctrine fidelity is decidable per interfacer.** Given an interfacer's `apply` and `extract` operations, the substrate can run the counit-law test on canonical inputs and verify hash-equality. Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), the test reduces to byte comparison.
- **Faithful interfacer composition is faithful.** Two faithful interfacers $I_1 : \mathcal{S}_1 \to \mathrm{Pred}(\mathcal{C})$ and $I_2 : \mathcal{S}_2 \to \mathrm{Pred}(\mathcal{C})$ admitting different sources compose as a faithful functor $I : \mathcal{S}_1 \times \mathcal{S}_2 \to \mathrm{Pred}(\mathcal{C})$ on the product. The substrate's discipline of layered interfacers preserves doctrine fidelity through composition.
- **Declared kernels are explicit.** A faithful $I$ may have a declared kernel $K \subseteq \mathcal{S}$ — content the substrate explicitly chooses to discard (e.g., markdown formatting that the substrate doesn't reason about). The kernel is recorded as substrate content; the substrate distinguishes "discarded by declared kernel" from "lost due to interfacer non-faithfulness."
- **Federation interfacers must be faithful.** When two substrates federate, each substrate's interfacer for the other's content must be faithful — otherwise the substrate cannot reason about what the peer asserted. Per [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md), an interfacer's faithfulness is part of the trust-grade between peers.
- **Doctrine fidelity is testable, not enforced.** The substrate's runtime cannot enforce doctrine fidelity at construction time — it can only test it via the counit law and refuse non-faithful interfacers. Per the theorem, the test is byte-equality on test vectors.

## What the theorem rules out

- **Implicit kernels.** An interfacer that silently discards parts of the source without recording the kernel is a hidden non-faithfulness. The substrate refuses; per [self-representation](teaching/explanations/self-representation.md), the kernel must be explicit.
- **Stateful interfacers.** An interfacer whose `apply` depends on runtime state outside the source content is not a functor — its action varies between calls. The substrate refuses; per [determinism-via-fiber-functoriality](determinism-via-fiber-functoriality.md), interfacers are deterministic functors.
- **Interfacers without extract.** An interfacer that admits content without an extract operation has no way to verify the counit law — it cannot be tested for faithfulness. The substrate's discipline requires the extract operation as part of every interfacer specification.
- **Non-categorical extracts.** An extract that doesn't satisfy the counit law (`extract(apply(Δ, c)) ≠ extract(c) ⊕ Δ`) reveals a non-faithful interfacer. The substrate refuses; per the theorem, the counit law is the operational test.

## What the theorem requires

- The interfacer is presented as a functor $I : \mathcal{S} \to \mathrm{Pred}(\mathcal{C})$ with explicit `apply` and `extract` operations.
- The source's representation category $\mathcal{S}$ has a well-defined notion of object and morphism.
- The substrate's predication fibration and canonical-form discipline are in place (per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md)).
- The interfacer's kernel (if any) is declared as substrate content.

## Position

This theorem grounds the substrate's doctrine-fidelity discipline in the category theory of faithful functors. Together with [conformance-via-fiber-algebra-functor](conformance-via-fiber-algebra-functor.md) (conformance as functor exactness) and [schema-evolution-via-base-admissibility](schema-evolution-via-base-admissibility.md) (schema evolution as base-morphism), it places the substrate's specification-conformance-fidelity-evolution quadrilateral in the predication-fibration's structural foundation. Doctrine fidelity is functor faithfulness; conformance is functor exactness; schema evolution is base-morphism; settlement is closure 2-monad iteration. Each engineering surface corresponds to a particular categorical structure on the substrate's fibration.
