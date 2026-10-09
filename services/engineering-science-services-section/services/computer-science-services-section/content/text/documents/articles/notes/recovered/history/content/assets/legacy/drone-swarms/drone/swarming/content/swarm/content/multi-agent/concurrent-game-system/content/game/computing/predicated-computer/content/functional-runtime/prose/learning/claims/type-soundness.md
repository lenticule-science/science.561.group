---
type: theorem
class: engineering-claim
status: proved
depends-on: [type, type-record, function-record, check-type, settlement-determinism, conformance-implies-substrate-properties, predication-fibration, fibered-coinduction, classical-equality]
see-also: [invoke-function]
---

# Well-typed programs evaluate without type errors

**Claim.** Let $f$ be a [function-record](../objects/function-record.md) whose body has been type-checked against its signature via [check-type](../morphisms/check-type.md) returning `valid`. For any input arguments matching $f$'s parameter types and any capability set including $f$'s required capabilities, [invoke-function](../morphisms/invoke-function.md) on $f$ produces a result of $f$'s declared return type — never a "type error" at runtime.

## Proof

The argument is the standard *progress + preservation* result for typed substrate programs, instantiated as the fibered-induction principle on the substrate's [predication fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md). Types are coordinates in the fibration's base; well-typedness is membership in the corresponding fiber; evaluation is movement along the fibration's settling structure. Per [fibered-coinduction](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/fibered-coinduction.md) (Hermida–Jacobs), the fibration's admission of comprehension lets the standard induction principle for initial $T$-algebras lift to the predicate fibration over the carrier fibration — which is exactly progress and preservation as a single statement.

**Part 1 (Preservation): well-typed expressions remain well-typed under reduction.** Per [check-type](../morphisms/check-type.md)'s discipline, every sub-expression in $f$'s body has a declared type — equivalently, lives in a known fiber of the predication fibration. Per the substrate's evaluation rules (substitution, function application, primitive operations), each evaluation step is a fibration morphism that preserves the fiber: substituting a value of type $T$ for a variable of type $T$ is the cartesian lift of the identity along $T$, which by definition stays in the same fiber. The fibration's [classical equality](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/classical-equality.md) section is what makes "value of type $T$" an equational claim rather than a soft predicate — substitution is sound because equality is the Lawvere image of the diagonal.

**Part 2 (Progress): well-typed non-value expressions can take a step.** Per the runtime's evaluation strategy (per [runtime-record](../objects/runtime-record.md)), every well-typed non-value expression has an applicable evaluation rule. Equivalently: the fibration's admission of structural induction guarantees that any well-typed non-value term is in the image of the type system's introduction rules, and each introduction rule's elimination is a defined evaluation step. Type-checked programs don't get stuck at runtime because there are no fiber elements without inhabitants of the corresponding elimination rule.

**Part 3 (Refinement preservation).** Per [refined-type](teaching/explanations/refined-type.md), refinement predicates may be undecidable; for those, the substrate's discipline is to either type-check at admission (refusing values that don't satisfy the predicate) or to attach proof obligations checked at runtime. Either way, well-typed values satisfy their declared refinements. The fibered-induction framing is what makes refinement and base-type preservation provable by the same argument: refinements live in higher fibers, and the cartesian lift along type-checking preserves them. Per [refinements-as-paraconsistent-comprehension](refinements-as-paraconsistent-comprehension.md), this lift is concretely the predicate-specialization morphism out of the comprehension object at the refinement's declared designation.

$\square$

## Scope and pending uplift

This theorem is stated against the current binary `valid`/`invalid` signature of [check-type](../morphisms/check-type.md). Per the "Soundness-layer alignment" section of [refinements-as-paraconsistent-comprehension](refinements-as-paraconsistent-comprehension.md), the structural verdict on a refined type is naturally bilattice-valued ($\mathbf{t}/\mathbf{f}/\bot/\top$) and the substrate's regime classification ([four-regime-dichotomy](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md)) determines which cells are reachable. A regime-parametric form of this soundness theorem — preservation and progress against the bilattice verdict, with the recorded regime parameterizing what counts as an admissible $\bot$ outcome — is recorded as the `draft` theorem [type-soundness-regime-parametric](type-soundness-regime-parametric.md). The present theorem is the truth-projection of that draft and remains valid as such.

## Engineering consequence

- **Predictable program behavior.** A well-typed function's output type is determined; the substrate's audit can rely on it.
- **Conformance-checkable.** Per [conformance-implies-substrate-properties](../../../theorems/conformance-implies-substrate-properties.md), a runtime that fails type-soundness is non-conformant.
- **Federation-safe.** Two substrates running the same well-typed program produce same-typed outputs.

## What the theorem rules out

- A runtime that admits ill-typed function bodies and silently coerces at runtime is non-conformant.
- A type system whose check-type returns false negatives (declares programs ill-typed when they're actually well-typed) restricts admissible programs unnecessarily; an audit can detect this.
- A type system whose check-type returns false positives (declares programs well-typed when they're actually ill-typed) breaks the theorem; runtime errors become possible despite type-checking.

## What the theorem requires

- The substrate's [check-type](../morphisms/check-type.md) is sound (no false positives).
- The runtime's evaluation rules respect the type system's preservation property.
- Per [function-record](../objects/function-record.md), function bodies satisfy their declared types.
- Per [conformance-implies-substrate-properties](../../../theorems/conformance-implies-substrate-properties.md), the runtime passes its type-soundness conformance suite.
