---
type: concept
class: operation-family
depends-on: [predication-settling-category, predication-valuation, knowledge-order, truth-order]
see-also: [comparison-context, comparison-standard, comparison-witness, predicatory-commutation, predicatory-confluence, predicatory-equalization, predicatory-differentiation, cohomological-framework-comparison]
---

# Predicatory comparison

**Predicatory comparison** is the family of operations that compare predication-valued structures without first quotienting them to Boolean equality.
A predicatory comparison may ask whether two composites commute, whether two divergent settling paths can be joined, where two operators agree, how much evidence separates two valuations, or whether two frameworks compute the same invariant after translation.

The point is not to avoid equality.
Equality still appears, especially in commutative diagrams and equalizers.
The point is to keep the comparison typed by the structure being compared:

- $\leq_k$ comparisons ask whether one settling contains at least the evidence of another;
- $\leq_t$ comparisons ask whether one value is truth-stronger than another;
- $\vee_k$ comparisons merge evidence from divergent sources;
- equalizer-style comparisons isolate a locus of exact agreement;
- residual comparisons compute a missing-evidence profile rather than a Boolean same/different bit.

For calculator design, predicatory comparison is the umbrella for operations that answer "what agrees?", "what diverges?", "what would make these compatible?", and "what changed?" in the native value language of the theory.

The operation alone is not enough mathematically: the same inputs can determine different outputs under different [comparison contexts](../objects/comparison-context.md) and [comparison standards](comparison-standard.md).
The structured result is a [comparison witness](comparison-witness.md).
