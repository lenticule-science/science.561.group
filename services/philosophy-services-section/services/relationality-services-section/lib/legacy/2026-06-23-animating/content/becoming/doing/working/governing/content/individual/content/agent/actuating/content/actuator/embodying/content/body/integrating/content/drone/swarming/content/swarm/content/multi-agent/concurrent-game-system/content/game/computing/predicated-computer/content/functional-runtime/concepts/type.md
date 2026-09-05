---
type: concept
class: program-structure
depends-on: [shape-record, predication-fiber-algebra]
see-also: [refined-type, function]
---

# Type

A *substrate-recorded constraint on values* — a type is the substrate's classification of what kind of thing a value is, what operations apply to it, what other values it composes with. Types extend [shape-record](../../../objects/shape-record.md) (which constrains substrate-content structure) with the additional discipline a programming language needs: function signatures, polymorphism, value compatibility, well-formedness checks for programs.

The relationship between types and shapes:

- **Shape** (per [shape-record](../../../objects/shape-record.md)) constrains substrate predications: "an entity of shape $S$ must have these predicates with values in these ranges." Shapes are about *substrate content correctness*.
- **Type** constrains program values: "a function of type $A \to B$ takes a value of type $A$ and returns a value of type $B$." Types are about *program correctness*.

Types are substrate-resident per [self-representation](../../teaching/explanations/self-representation.md). A type is a substrate entity declaring its kind (`primitive`, `record`, `union`, `function`, `polymorphic`, `refined`), its components, and (for polymorphic types) its type variables. Per [check-type](../morphisms/check-type.md), the substrate's type-checker validates programs against their declared types.

Type kinds:

- **Primitive types** — `boolean`, `integer`, `string`, `bytes`, `bilattice-value`. The base types from which others are constructed.
- **Record types** — products of named fields, each with its own type.
- **Union types** — sums of variants, each with its own constructor.
- **Function types** — `A → B`, taking $A$ and returning $B$. May carry effect annotations (per [effect](effect.md)).
- **Polymorphic types** — types with type variables, e.g., `forall T. List T → List T`.
- **Refined types** — types with predicates restricting which values are admissible, e.g., `{ x: Integer | x > 0 }`. Per [refined-type](refined-type.md), refinement is the substrate's way of expressing fine-grained constraints.

Per [conformance-implies-substrate-properties](../../../theorems/conformance-implies-substrate-properties.md), type-soundness is a conformance property: an implementation that satisfies type-checking guarantees substrate-determinism on typed inputs.
