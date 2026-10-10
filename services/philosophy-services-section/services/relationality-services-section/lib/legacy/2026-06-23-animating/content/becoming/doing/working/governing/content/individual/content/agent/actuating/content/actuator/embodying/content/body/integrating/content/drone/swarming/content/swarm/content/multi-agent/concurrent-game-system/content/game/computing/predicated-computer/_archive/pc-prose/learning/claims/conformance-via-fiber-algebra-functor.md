---
type: theorem
class: engineering-claim
status: proved
depends-on: [conformance, predication-fibration, predication-fiber-algebra, parameter-base-category, determinism-via-fiber-functoriality, hash-injectivity-under-canonical-form, conformance-implies-substrate-properties]
see-also: [schema-evolution-via-base-admissibility, doctrine-fidelity-via-faithful-interfacer-functor]
---

# Conformance is exact realization of fibration functors, checkable via functoriality laws

**Claim.** For any candidate substrate implementation $\mathcal{I}$ purporting to realize the substrate's [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) specification, the implementation is *conformant* iff:

1. **Object-conformance.** For every parameter-base category object $\sigma \in \mathcal{C}$, the implementation's fiber $\mathcal{I}(A_\sigma)$ is a faithful realization of the specified [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) $A_\sigma$ — same value-domain operations producing same canonical-form hashes on same inputs.
2. **Morphism-conformance.** For every $\mathcal{C}$-morphism $f : \sigma \to \sigma'$, the implementation's substitution functor $\mathcal{I}(f^*) : \mathcal{I}(A_{\sigma'}) \to \mathcal{I}(A_\sigma)$ produces canonical-form-hash-identical outputs to the specified $f^*$ on canonical-form-hash-identical inputs.
3. **Composition law.** $\mathcal{I}((g \circ f)^*) = \mathcal{I}(f^*) \circ \mathcal{I}(g^*)$ for composable $f, g$ — the implementation respects functor composition.
4. **Identity law.** $\mathcal{I}(\mathrm{id}_\sigma^*) = \mathrm{id}_{\mathcal{I}(A_\sigma)}$ — the implementation preserves identities.

These four conditions are checkable via canonical-form-hash comparison on test vectors.

## Why this holds

Conformance is, structurally, the property that $\mathcal{I}$ is a faithful representation of the specified fibration. Per category theory, a functor $\mathcal{I}$ between two fibrations is determined by its action on objects (fibers) and morphisms (substitution functors), and is a *faithful representation* iff distinct specified entities produce distinct implementation entities and the functor laws hold.

Per [determinism-via-fiber-functoriality](determinism-via-fiber-functoriality.md), each substrate operator is the runtime presentation of a substitution functor; the operator's deterministic behavior is structurally what the functoriality requires. Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), the canonical-form hash uniquely identifies fiber-algebra values; comparing implementation outputs against specification outputs reduces to byte-equality of hashes.

The four conditions are then:

- **Object-conformance.** Test by exercising the implementation's fiber-algebra operations ($\vee_k$, $\wedge_t$, $\odot$, etc.) on canonical inputs and comparing canonical-output hashes.
- **Morphism-conformance.** Test by applying the implementation's $\mathcal{I}(f^*)$ to canonical inputs and comparing output hashes against $f^*$'s spec.
- **Composition law.** Test by computing $(g \circ f)^*$ via two paths (compose then apply, vs. apply then apply) and verifying hash-equality.
- **Identity law.** Test by applying $\mathcal{I}(\mathrm{id}^*)$ to canonical inputs and verifying the output equals the input.

Per [conformance-implies-substrate-properties](conformance-implies-substrate-properties.md), the conformance properties (settlement-determinism, federation-convergence, etc.) follow from these four functoriality conditions — they are the engineering surface of the structural property "$\mathcal{I}$ is a faithful fibration realization."

## Engineering consequence

- **Conformance test suites are functoriality test suites.** A conformance test suite is structurally a list of (input, expected-output) pairs that exercise the four conditions. Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), each test reduces to canonical-form-hash comparison.
- **Conformance is binary and structural.** An implementation either realizes the fibration faithfully or it doesn't; there's no "approximately conformant" — the functor laws hold or they don't. Per the theorem, an implementation that fails any of the four conditions on any test input is non-conformant.
- **Layered conformance corresponds to sub-fibration realization.** An implementation that conforms on a sub-fibration (e.g., the core operators but not federation) is a faithful realization of that sub-fibration. Per the fibration's compositionality, sub-fibration realization composes — an implementation conformant on layer 1 and layer 2 independently is conformant on layer 1 + layer 2.
- **Conformance implies cross-implementation determinism.** Per [determinism-via-fiber-functoriality](determinism-via-fiber-functoriality.md), two conformant implementations both realize the same fibration functors — and a functor's defining property leaves no implementation freedom in the function's mapping. Conformant implementations agree byte-for-byte on every input.
- **Conformance implies federation-compatibility.** Per [federation-convergence](federation-convergence.md), federating substrates must agree on closure-rule system and value-domain. Conformant implementations both realize the same fibration; they're trivially federation-compatible.

## What the theorem rules out

- **Approximate conformance via "close enough" outputs.** An implementation whose outputs differ by hash on canonical inputs is non-conformant, regardless of whether the difference is "small" by some external metric. Per the theorem, the test is hash-equality, not approximate equality.
- **Conformance via runtime self-correction.** An implementation that detects non-conformance at runtime and silently corrects via repair is not conformant; per the theorem, conformance is a property of the operators' specification-realization, not of the runtime's recovery behavior.
- **Conformance without composition-law verification.** An implementation that realizes individual operators correctly but fails the composition law (e.g., $\mathcal{I}((g \circ f)^*) \neq \mathcal{I}(f^*) \circ \mathcal{I}(g^*)$ for some $f, g$) is non-conformant; per the theorem, all four functoriality conditions must hold.
- **Implementation freedom in the function's mapping.** A "conformant" implementation that produces different outputs for the same inputs in different runs is not realizing a functor; per the theorem, it's not conformant regardless of how it explains the variation.

## What the theorem requires

- The specification fixes a [predication fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) (per the substrate's spec).
- The implementation's operators are deterministic per [determinism-via-fiber-functoriality](determinism-via-fiber-functoriality.md).
- Canonical-form discipline is in place per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md).
- The conformance test suite covers the relevant fibration entities (test vectors for fiber operations, substitution functors, composition, identity).

## Position

This theorem grounds the substrate's conformance discipline in the predication-fibration's category-theoretic foundation. Together with [schema-evolution-via-base-admissibility](schema-evolution-via-base-admissibility.md) (schema evolution as base-morphism in the same regime) and [doctrine-fidelity-via-faithful-interfacer-functor](doctrine-fidelity-via-faithful-interfacer-functor.md) (interfacers as faithful functors from external categories), it completes the substrate's specification-conformance-fidelity picture. The substrate's specification fixes a fibration; conformant implementations realize the fibration's functors faithfully; doctrine-fidel interfacers extend the fibration to external structures. The substrate's engineering reduces to the structural realization of these category-theoretic objects.
