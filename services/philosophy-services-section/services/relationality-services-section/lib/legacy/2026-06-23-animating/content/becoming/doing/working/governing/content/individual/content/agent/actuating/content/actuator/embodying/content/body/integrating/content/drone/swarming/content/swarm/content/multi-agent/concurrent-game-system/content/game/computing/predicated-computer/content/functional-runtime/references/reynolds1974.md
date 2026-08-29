---
type: reference
class: academic
status: cited
authors: [Reynolds, John C.]
year: 1974
title: "Towards a theory of type structure"
venue: "Programming Symposium, Lecture Notes in Computer Science 19, Springer, pp. 408--425"
---

## Source

J. C. Reynolds. "Towards a theory of type structure." In *Programming Symposium: Proceedings, Colloque sur la Programmation, Paris, April 9–11, 1974*, ed.\ B. Robinet, Lecture Notes in Computer Science volume 19, pages 408–425, Springer-Verlag, 1974. doi:10.1007/3-540-06859-7\_148. (Companion: J. C. Reynolds. "Types, abstraction and parametric polymorphism." *Information Processing 83 (Proceedings of the IFIP 9th World Computer Congress)*, ed.\ R. E. A. Mason, pp. 513–523, North-Holland, 1983.)

## Form

Conference paper (Programming Symposium, Paris 1974). The originating presentation of *parametric polymorphism* with the explicit type-quantifier $\forall$, independently introduced (in the same year and in subsequent papers) under the name *System F* by Girard in the proof-theory community. Reynolds's 1983 *Types, abstraction and parametric polymorphism* gives the *parametricity theorem* and its proof via logical relations; the 1974 paper is the foundational presentation.

## Content summary

The paper develops:

1. **Polymorphic typing with explicit type quantification.** A polymorphic type $\forall \alpha. \tau$ classifies values that work uniformly across every choice of $\alpha$. The type-formation rule is structural: for any type-context that does not bind $\alpha$, deriving $e : \tau$ in the extended context yields $\Lambda \alpha. e : \forall \alpha. \tau$ in the original context.
2. **Type abstraction and existentials.** Existential types $\exists \alpha. \tau$ classify values whose internal type is hidden — the structural primitive for *abstract data types*. The dual quantifier discipline (universal for genericity, existential for abstraction) is what gives the type system its expressive power for data abstraction.
3. **The relational interpretation.** Each type $\tau$ is interpreted as a *relation* on its set of values; type variables become relation variables; quantification becomes universal quantification over admissible relations. The interpretation is sound: every closed term of type $\tau$ inhabits the relation $[\![\tau]\!]$.
4. **Parametricity (per the 1983 companion).** The *parametricity theorem*: every closed term of polymorphic type satisfies the relational interpretation of its type. The corollary is the *free theorems* — the type signature alone determines a non-trivial relational identity. For example, every term of type $\forall \alpha. \alpha \to \alpha$ is the identity function (parametric uniformity rules out the type-tag-inspecting alternatives).

The methodological commitment: polymorphism is not "code that happens to type-check at multiple types"; polymorphism is *uniform* code whose behaviour is determined by its type signature. The relational interpretation makes the uniformity formal.

## Position in the corpus

Functional-runtime-platform's [type-soundness](../theorems/type-soundness.md) inherits Reynolds's parametricity discipline for the polymorphic fragment of the subtheory's type system: a polymorphic [function-record](../objects/function-record.md) whose signature is $\forall \alpha. \tau$ exhibits the relational identity $[\![\forall \alpha. \tau]\!]$ at every instantiation. The substrate's witness chain inherits the parametric identity: replaying a polymorphic function at two different type instantiations produces witness chains that satisfy the parametric relational identity.

The subtheory's [type](teaching/explanations/type.md) and [type-record](../objects/type-record.md) inherit Reynolds's distinction between *types* (syntactic) and their *relational interpretations* (semantic). The substrate is open over the polymorphism strength (let-polymorphism per [milner1978](milner1978.md), full System F per Reynolds, higher-order polymorphism per System F-omega), but parametricity as the uniformity discipline is structural across all of them.

The [structural-lineage-from-church-to-roc](teaching/explanations/structural-lineage-from-church-to-roc.md) narrative places Reynolds's contribution as the *parametric-uniformity* step on the line: Hindley-Milner gave principal types (per [milner1978](milner1978.md)), but the *uniformity* of polymorphic functions across instantiations was Reynolds's contribution. Without it, polymorphism guarantees nothing about the function's behaviour at any particular instantiation.

The relational-interpretation discipline informs the [composability narrative](teaching/explanations/composability-with-predicated-knowledge-systems.md)'s Bridge 1: a function's polymorphic type ↔ closure-rule schema's parametric-rule reading is a parametric instance of the bridge; the parametricity theorem on the function side is the schema-uniformity theorem on the substrate side.

## Where used

- [type-soundness](../theorems/type-soundness.md)
- [type](teaching/explanations/type.md)
- [type-record](../objects/type-record.md)
- [function](teaching/explanations/function.md)
- [structural-lineage-from-church-to-roc](teaching/explanations/structural-lineage-from-church-to-roc.md)
- [what-functional-runtime-platform-inherits](teaching/explanations/what-functional-runtime-platform-inherits.md)
