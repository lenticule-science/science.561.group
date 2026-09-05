---
type: reference
class: academic
status: cited
authors: [Moggi, Eugenio]
year: 1991
title: "Notions of computation and monads"
venue: "Information and Computation 93(1), pp. 55--92"
---

## Source

E. Moggi. "Notions of computation and monads." *Information and Computation*, 93(1): 55–92, July 1991. doi:10.1016/0890-5401(91)90052-4. (Earlier conference version: E. Moggi. "Computational lambda-calculus and monads." *Proceedings of the Fourth Annual Symposium on Logic in Computer Science (LICS '89)*, IEEE, pp. 14–23, 1989.)

## Form

Journal article (with earlier LICS conference version). The originating paper for the *computational lambda-calculus* and the use of *strong monads* to model side effects in functional programming. Moggi's framing was subsequently popularised in the programming-language community by Wadler (per [wadler1992](wadler1992.md)) and became the foundation of monadic effect typing in Haskell, F\#, Scala's effect libraries, and modern algebraic-effect systems.

## Content summary

The paper develops a uniform categorical framework for side effects:

1. **Separate values from computations.** A type $A$ is the type of values; a type $T(A)$ is the type of *computations producing values of type* $A$. The type constructor $T$ is the *notion of computation*; different notions of computation correspond to different functors $T$.
2. **Computations form a strong monad.** $T$ is equipped with $\mathrm{unit} : A \to T(A)$ (lifting a value to a trivial computation) and $\mathrm{bind} : T(A) \to (A \to T(B)) \to T(B)$ (sequencing two computations). The monad laws (left unit, right unit, associativity) are exactly the laws of sequential composition. *Strength* — a parametric pairing $T(A) \times B \to T(A \times B)$ — is required for the monad to interact correctly with the lambda-calculus's product-formation.
3. **Catalogue of notions of computation.** Each side-effect class corresponds to a monad: the *exception monad* $T(A) = A + E$, the *state monad* $T(A) = S \to (A \times S)$, the *non-determinism monad* $T(A) = \mathcal{P}(A)$, the *continuation monad* $T(A) = (A \to R) \to R$, the *partiality monad* $T(A) = A_\bot$, and (by composition) combined monads for combined effects.
4. **The computational lambda-calculus** $\lambda_c$ — an extension of the simply-typed lambda-calculus with explicit `let x = e in e'` for monadic sequencing and a typing rule that distinguishes value-positions from computation-positions. The calculus has a sound interpretation in any cartesian-closed category equipped with a strong monad.
5. **Adequacy and full abstraction** — the categorical-semantics framework gives adequate denotations for all notions of computation considered, with full abstraction following under reasonable conditions on the underlying category.

The methodological commitment: side effects are not type-system pollution; they are first-class structural objects whose algebraic identity is captured by the corresponding monad's unit-and-bind structure.

## Position in the corpus

Functional-runtime-platform's [effect](teaching/explanations/effect.md) concept inherits Moggi's monadic discipline as its presentation: an effectful function is one whose return type is $T(A)$ for some notion-of-computation $T$; effect composition follows the monad laws; effect-typing is structural rather than ad-hoc. The subtheory does not commit to *which* monadic presentation (single-monad-with-row-effects, monad-transformer stack, algebraic-effects-with-handlers) — see the [effect-system-granularity](questions/effect-system-granularity.md) open question.

The [structural-lineage-from-church-to-roc](teaching/explanations/structural-lineage-from-church-to-roc.md) narrative places Moggi's contribution as the *effect-typing* step on the line: prior to Moggi, side effects were either invisible to the type system (untyped) or presented in ad-hoc per-effect ways with no shared discipline. The monadic presentation gave the field a uniform algebraic vocabulary for side effects.

Wadler's 1990–1992 work (per [wadler1992](wadler1992.md)) translated Moggi's categorical presentation into a programmer-facing notation (do-notation, monadic combinators) and developed the *effect-row* discipline that most modern functional-runtime languages use; the two papers are typically cited together.

[capability-non-amplification](../theorems/capability-non-amplification.md) intersects Moggi's framework: a capability-typed function's effect annotation can be presented as the monad $T(A) = (\mathrm{Capabilities} \to A)$ — the *capability-reader monad* — under which authority transfer is exactly monadic bind. Whether the subtheory commits to this presentation or to the modal-restriction presentation (per [capability-non-amplification](../theorems/capability-non-amplification.md)'s current statement) is open.

## Where used

- [effect](teaching/explanations/effect.md)
- [function](teaching/explanations/function.md)
- [structural-lineage-from-church-to-roc](teaching/explanations/structural-lineage-from-church-to-roc.md)
- [what-functional-runtime-platform-inherits](teaching/explanations/what-functional-runtime-platform-inherits.md)
- [effect-system-granularity](questions/effect-system-granularity.md)
