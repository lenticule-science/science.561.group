---
type: concept
class: verification-claim
depends-on: [conformance, witness, hash-discipline]
see-also: [conformance-test-suite]
---

# Property

A *checkable assertion* about the substrate's behavior, expressed in a form that a [conformance test](../morphisms/run-conformance-test.md) can verify. Properties are the units of conformance: a substrate's specification consists of a set of properties, and conformance means every property holds for the implementation.

A property has the structure:

- **An assertion.** A statement about substrate behavior expressed as a relation on substrate operations and their outputs. Common shapes: equality of canonical-form hashes ("admit-then-settle produces hash $H$"), invariant preservation ("after merge, the result satisfies CRDT-convergence"), monotonicity ("after admit, the predication's $\leq_k$-value does not decrease").
- **A test generator.** A method for producing test inputs against which the assertion is checked. Common shapes: enumeration over a finite test set, randomized generation per a distribution, exhaustive over a bounded type.
- **A satisfaction predicate.** A computable check on whether the assertion holds for a given test input.
- **A failure-mode profile.** A characterization of how the assertion can fail and what each failure means (genuine non-conformance, edge-case the spec doesn't cover, test-generator bug, environmental issue).

The substrate's properties cluster into structural families:

- **Determinism properties.** Per [settlement-determinism](../theorems/settlement-determinism.md): two runs with the same input produce the same output.
- **Convergence properties.** Per [federation-convergence](../theorems/federation-convergence.md): two replicas converge to the same state.
- **Monotonicity properties.** Per [settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md): substrate state advances monotonically in $\leq_k$.
- **Fidelity properties.** Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), [backup-restore-fidelity](../theorems/backup-restore-fidelity.md): operations are reversible / replayable / restorable.
- **Cost properties.** Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md): reads do not advance state.

Each substrate theorem in the corpus typically corresponds to one or more properties. The properties are how an implementation is *checked* against the theorem; the theorems are how the substrate's behavior is *characterized*.

Property-based testing (Hughes-Claessen QuickCheck-style) is the substrate's typical conformance-checking technique: properties are expressed as functions from arbitrary inputs to a satisfaction value, the test framework generates random inputs, satisfaction is checked, failures are minimized via shrinking. Per [hash-discipline](hash-discipline.md), the substrate's canonical-form provides natural canonical inputs and outputs for property checking.
