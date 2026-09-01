---
name: parametricity-instance
role: Instance of parametric uniformity for the indexed monad/comonad data.
inputs: []
outputs:
- id: parametricity-instance
  name: instance
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---

Instantiation of the math-level parametric uniformity theorem, showing that the
parametricity operator over the indexed monad/comonad data realises the math
theorem.

## Statement
- Given the effect/coeffect structures and reindexing operators listed above,
  the [Parametricity](../../operator/parametricity.md) operator satisfies the
  math-level parametric uniformity properties (naturality under reindexing,
  uniformity across contexts).

## Proof
- Derived from: [Math Parametric Uniformity](../../math/theorem/internal/parametric-uniformity.md).
- Uses: modal structures/operators (effect/coeffect monads, fibres, reindexing,
  modules, natural transformations) to show the instance meets the hypotheses
  of the math theorem.
- Shows that: the parametricity operator is an instance of the math parametric
  uniformity, so abstraction inherits the uniformity and contextual equivalence
  refinement.
