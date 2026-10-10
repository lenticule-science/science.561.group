---
type: concept
class: framing
depends-on: [wavefront, closure-rule]
see-also: [witness]
---

# Settling as computation

The framing under which iterated closure-rule application — *settling* — is treated as the primitive computational act of a [predicated computer](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predicated-computer.md), not as a procedure layered on top of computation. On the predication substrate, computation is what closure-rule application *is*; there is no separate compute step that turns instructions into effects.

In the math reformulation, the substrate's settling is realized as a [predication settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) — a [settling-bound](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-bound.md)-indexed family of [predication valuations](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predication-valuation.md) satisfying [settling monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md) and driven by [closure-drivenness](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-drivenness.md) under the substrate's [closure-rule system](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md). The engineering content of "computation = settling" is the math content of "the substrate's runtime trajectory is a predication settling on its [predication fiber algebras](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md)."

Three correspondences make the framing precise:

- **Entity-as-actor.** An entity in the predication graph is the subject of computation: a message or new predication arriving at an entity drives an application of the substrate's closure machinery at that entity. What the entity *does* in response is determined by which closure rules apply at its current predications. There is no externally directed control flow; the rule that fires is whichever rule's premise matches.
- **Predications-as-program.** An entity's predications are the entity's program. Adding predications is editing the program; removing them is editing the program; the substrate has no separate "code" and "data" division. This is the [self-representation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md) commitment applied to the fact that programs are themselves data.
- **Quiescence-as-normalization.** The settling reaching quiescence is the analog of a program's normal form. An entity is *settled* when its predications satisfy all applicable closure rules — when no rule's premise matches against an unrecorded conclusion (the [settling quiescence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-quiescence.md) condition). The system as a whole is settled when every entity is settled. Settled state is the well-defined output of computation; un-settled state is a still-running computation.

## Curry-Howard at the predication substrate

The framing is the engineering analog of Curry-Howard at the predication substrate: programs are predications, types are predicates, normalization is settling, the substrate's value-domain plays the role of "more information" that ordinary programming languages express through reduction.

The correspondence is precise enough to identify each Curry-Howard element with a substrate construct:

| Curry-Howard | Predicated substrate |
|---|---|
| Term constructor (variable, abstraction, application, fixpoint) | Predication-cell admission, with the cell's structure determined by the predicate's shape |
| Type constructor | [Predicate](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predicate.md) (an object of the [predicate category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md)) |
| Type judgment $\Gamma \vdash t : A$ | A predication carrying a value in the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) at predicate $A$ |
| β-reduction | A [closure-rule application](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/closure-rule-application.md) that fires when a redex predication is matched |
| Substitution | The [extend-restrict adjoint](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/extend-restrict-adjoint.md): substituting a term into a context is the [twist-product fusion](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) of the term's value with the context's value |
| Normal form | A predication that has reached [settling quiescence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-quiescence.md) — no further closure-rule application changes its value |
| Strong normalization | The substrate's settlement reaches quiescence in finite (or settling-bound-bounded) layers under the substrate's value-domain monotonicity |
| Confluence | The substrate's closure operator is well-defined: independent rule applications produce the same fixed-point regardless of order |
| Soundness | The substrate's [doctrine fidelity](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/doctrine-fidelity.md): admitted predications are truthful representations of what they assert |
| Progress | The substrate's [wavefront-termination](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/wavefront-termination.md) bound: a non-quiescent state has at least one applicable closure rule |

The differences from a typical typed λ-calculus implementation are structural: there is no separate type-checker (predicates' shapes are themselves substrate entities, classified by [shapes](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/scope/shape/shape.md) per [self-representation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md)); there is no separate compiler (the substrate's operators read the rules as data); there is no separate runtime that owns the computation (the substrate is the runtime); typing judgment, evaluation, and normalization all live in one substrate-traversal layer.

The Curry-Howard correspondence is not metaphorical: any well-formed STLC term has a substrate realization as a predication-graph fragment, and any settled substrate fragment whose predicates are STLC-shaped has a corresponding STLC term. Substantive substrate operations — closure-rule firing, coherence-glue, [merge](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/merge.md) — correspond to substantive logical operations — proof-step application, lemma combination, hypothetical reasoning. The substrate's audit chain is then the *proof object* of the substrate's current state: replaying the chain is replaying the proof.

## Position in the substrate

The framing is what makes the engineering theory of predicated computing distinct from the engineering theory of computers running on a separate substrate that happens to use a graph-shaped store. The former *is* predicated computation; the latter is a graph database with computation layered on it.
