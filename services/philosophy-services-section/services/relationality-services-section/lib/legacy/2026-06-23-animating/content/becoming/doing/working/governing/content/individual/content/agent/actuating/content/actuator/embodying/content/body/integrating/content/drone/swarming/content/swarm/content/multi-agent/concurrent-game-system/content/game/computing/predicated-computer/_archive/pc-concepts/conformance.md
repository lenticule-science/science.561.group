---
type: concept
class: verification-discipline
depends-on: [settlement-determinism, hash-discipline, witness, predication-fiber-algebra, predication-fibration, determinism-via-fiber-functoriality]
see-also: [property, conformance-test-suite, conformance-via-fiber-algebra-functor]
---

# Conformance

The substrate's *implementation-fitness criterion*: an implementation of the substrate is **conformant** when, for every operation in the substrate's specification, the implementation produces canonical-form-hash-identical outputs to the substrate's expected behavior on the same inputs. In the substrate's hyperdoctrine setting, conformance is *exactly faithful realization of the [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md)'s functors*: each substrate operator must implement its specified $f^* : A_{\sigma'} \to A_\sigma$ exactly, with no implementation freedom in the function's mapping. Per [conformance-via-fiber-algebra-functor](../theorems/conformance-via-fiber-algebra-functor.md), conformance is checkable as a functoriality test: present canonical inputs, compare canonical outputs, verify functorial laws (composition, identity preservation).

Conformance is checkable by exercising the implementation against a reference test set and comparing observed canonical-form hashes to expected values.

## Hyperdoctrinal grounding

The substrate's specification fixes the predication-fibration $E \to \mathcal{C}$ that the substrate must realize. Each substrate operator corresponds to:

- A particular morphism $f$ in the parameter-base category $\mathcal{C}$
- The substitution functor $f^*$ in the fibration
- Optionally, the existential / universal quantifier adjoints $\exists_f, \forall_f$
- Optionally, the closure operator $\mathrm{cl}$ on the fiber-algebra

Per [determinism-via-fiber-functoriality](../theorems/determinism-via-fiber-functoriality.md), the implementation's runtime presentation of $f^*$ is functorial — same input, same output, deterministic across hosts. Per [conformance-via-fiber-algebra-functor](../theorems/conformance-via-fiber-algebra-functor.md), conformance is the property that the implementation's claimed $f^*$ is *the* $f^*$ specified by the fibration (not some other functor that happens to agree on test inputs).

The substrate's specification — closure-rule axioms, value-domain operations, settlement determinism, federation convergence, snapshot-replay fidelity — defines a class of implementations. An implementation in this class is *conformant*; an implementation outside the class is *non-conformant*. Conformance is binary in principle (the substrate's specification is precise) but may be partial in practice (an implementation may be conformant on most operations and non-conformant on edge cases).

## Conformance-implies-substrate-properties

A conformant implementation has these structural properties:

- **Settlement-deterministic.** Per [settlement-determinism](../theorems/settlement-determinism.md), the implementation produces the same predication settling on the same `(event log, closure-rule system)`.
- **Hash-injective.** Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the implementation's canonical-form serialization is byte-deterministic; same content produces same hash.
- **Federation-convergent.** Per [federation-convergence](../theorems/federation-convergence.md), the implementation converges with other conformant implementations under bidirectional event exchange.
- **Snapshot-replay-fidelitous.** Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), the implementation's snapshots replay byte-identically.
- **Regime-classified.** Per [regime-classification-for-substrate](../theorems/regime-classification-for-substrate.md), the implementation declares its regime and behaves regime-consistently.
- **Functorially exact.** Per [conformance-via-fiber-algebra-functor](../theorems/conformance-via-fiber-algebra-functor.md), the implementation's operators realize their specified fibration functors exactly — composition, identity, and substitution laws hold without exception.

Per [conformance-implies-substrate-properties](../theorems/conformance-implies-substrate-properties.md), these properties are not just consequences of conformance but *conformance-checkable* — each can be verified by exercising specific test patterns against the implementation.

## Layered conformance

Conformance is *layered*. The substrate's full specification has many properties; an implementation may be conformant on the core (admit, settle, project) but non-conformant on extensions (federation, encryption, observability). A conformance test suite (per [conformance-test-suite](../objects/conformance-test-suite.md)) typically reports per-layer conformance, allowing implementations to be deployed for use cases where the conformant layers are sufficient even when other layers are not.

In hyperdoctrinal terms, layered conformance corresponds to *partial fibration realization*: the implementation's functors cover a sub-fibration of the full specification's fibration. Per the fibration's compositionality, sub-fibrations compose cleanly — an implementation that realizes the core fibration faithfully and adds federation as a sub-fibration extension is conformant on both layers independently.

## Federation depends on conformance

The substrate's federation discipline depends on conformance: per [federation-convergence](../theorems/federation-convergence.md), federating substrates must share their closure-rule system and value-domain. Two implementations that are both conformant on the federated layer can federate; non-conformance breaks federation-convergence and must be detected at handshake (per [federation-handshake](theories/agential-orchestration-platform/morphisms/federation-handshake.md)) before any messages are exchanged.

Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), the federation's accessibility relation $R$ records per-peer trust including conformance status. A peer that fails conformance checks moves to $\mathbf{f}$-trust; a peer with partial conformance moves to a $\bot$ or $\top$ value depending on which layers are conformant.

## Conformance is not feature-completeness

Conformance is about *exact realization of specified functors*, not about which functors are implemented. An implementation that exactly realizes a small subset of operators is conformant on those operators; one that approximately realizes all operators is non-conformant on every operator. Per [conformance-via-fiber-algebra-functor](../theorems/conformance-via-fiber-algebra-functor.md), the test is exactness, not completeness.
