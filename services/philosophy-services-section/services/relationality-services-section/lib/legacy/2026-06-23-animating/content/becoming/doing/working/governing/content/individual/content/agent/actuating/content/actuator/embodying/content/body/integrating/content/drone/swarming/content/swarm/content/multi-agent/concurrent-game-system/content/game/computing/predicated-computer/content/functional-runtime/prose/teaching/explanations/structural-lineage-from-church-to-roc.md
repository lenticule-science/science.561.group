---
type: narrative
recaps:
  - ../references/pierce2002.md
  - ../references/milner1978.md
  - ../references/plotkin1981.md
  - ../references/moggi1991.md
  - ../references/wadler1992.md
  - ../references/miller2006.md
  - ../references/reynolds1974.md
introduces:
  - ../objects/function-record.md
discusses:
  - ../teaching/explanations/function.md
  - ../teaching/explanations/type.md
  - ../teaching/explanations/effect.md
  - ../teaching/explanations/capability.md
  - ../teaching/explanations/runtime.md
  - ../examples/roc.md
see-also:
  - what-functional-runtime-platform-inherits.md
  - composability-with-predicated-knowledge-systems.md
---

# From Church to Roc — and what each step bought

The line from Church's lambda-calculus (1930s) through Hindley-Milner-Damas type inference (1969–1982), Plotkin's structural operational semantics (1981), Moggi-Wadler effect monads (1989–1992), Reynolds parametricity (1974), Miller's object-capability discipline (2006), and the modern functional-runtime synthesis exemplified by Roc (2020s) is not a coincidence and not a parade of competing schools. Each step on the line was taken in service of a real *structural problem* in the discipline of typed function evaluation; every step that survived did so because the next problem in the line could not be solved without it; the discipline as it stands is what the accumulated commitments look like when read structurally.

This narrative traces the line in the spirit of [from-frege-to-fars](../../../../../../../../../science/theories/information/theories/knowledge-systems/theories/predicated-knowledge-systems/narratives/from-frege-to-fars.md) and [structural-lineage-peirce-to-lotman](../../../../../../../../../science/theories/linguistics/theories/semiotics/narratives/structural-lineage-peirce-to-lotman.md): each step named, the problem it solved spelled out, what its successor would have lacked without it.

## Church solves the *function-as-first-class-value* problem

Pre-Church mathematics had functions as graphs (the set of input-output pairs) and as named correspondences in informal notation. The structural problem: a graph-theoretic function cannot be passed as input to *another* function without first naming it; the formal system has no syntactic place for higher-order operation. Lambda-free formalisations of arithmetic (Peano, Hilbert) consequently did not have function-as-value as a primitive.

Church's move (1932–1936) was the *lambda-calculus*: a syntactic discipline in which $\lambda x. M$ is a first-class value, applicable to any other value (including itself), with substitution as the sole reduction rule. The structural argument is the *Church-Rosser theorem*: reduction is confluent, so functions have a well-defined value-of-application independent of evaluation order. This gave functional computation its first formally-tractable foundation.

The discipline's [function](../teaching/explanations/function.md) concept and the [closure](../teaching/explanations/closure.md) concept are Church's lambda-abstraction made substrate-resident. The substrate-side closure-rule application is the structural cousin: the rule's body is a lambda-abstraction over its premise variables, applied to the asserted-cell witnesses. Church's solution to function-as-first-class-value is what makes the substrate's higher-order closure-rules *expressible* rather than restricted to first-order Horn clauses.

## Hindley, Milner, and Damas solve the *type-inference* problem

Once functions are first-class values, the question becomes: how does the system know what type to assign each function-application? The naïve answer is to require each function and variable to be type-annotated; the structural problem is that annotation is verbose, error-prone, and conflates the *typing relation* with the *typing presentation*. The deeper problem: not every typeable program admits a *unique* most-general type if the type-inference algorithm is unconstrained, and ambiguous typings break compositional reasoning.

Hindley's move (1969) and Milner's move (1978; per [Milner 1978](../references/milner1978.md)) was the *let-polymorphic typing discipline* with the *W algorithm*: type variables are introduced fresh at let-bindings, generalised at the binding site, and instantiated at use-sites; unification computes the most-general type. The structural argument is the *principal-type theorem*: every typeable expression has a unique principal type, and the algorithm computes it. Damas's 1982 thesis (with Milner) gave the full soundness-and-completeness proof.

The discipline inherits Hindley-Milner's commitment to *principal types as the inference target* and to *let-polymorphism as the polymorphism quantum*. Without it, the discipline could not name [check-type](../morphisms/check-type.md) as a deterministic substrate operation; the inference would be either ambiguous or refuse to terminate.

## Reynolds solves the *parametric-uniformity* problem

Hindley-Milner gave principal types, but the *uniformity* of polymorphic functions across their type instantiations was not yet articulated. The structural problem: a polymorphic function $f : \forall \alpha. \alpha \to \alpha$ might in principle do *different things* at different instantiations (inspect the runtime type tag, dispatch on it, return inconsistent results); without a discipline that rules this out, polymorphism guarantees nothing.

Reynolds's move (1974; per [Reynolds 1974](../references/reynolds1974.md)) was the *parametricity theorem*: every well-typed polymorphic function preserves *every* logical relation on its parameter types. The structural argument is the construction of the per-type logical relation and the syntactic-induction proof that every closed term preserves it. The corollary is the *free theorems*: the type signature alone determines a non-trivial relational identity for the function.

The discipline inherits Reynolds's parametricity as the *uniformity discipline* of polymorphic functions. The substrate's [function-record](../objects/function-record.md) inherits the parametric identity; a function declared $\forall \alpha. \alpha \to \alpha$ on the substrate is *the* identity function, not "an identity-shaped function whose behaviour depends on the type tag".

## Plotkin solves the *evaluation-specification* problem

Once types and functions are settled, the question becomes: how is *evaluation* itself specified? Pre-Plotkin operational semantics used denotational semantics (which loses the step-structure) or ad-hoc reduction-relation presentations (which were not induction-friendly and not machine-checkable). The structural problem: an evaluation specification that does not have a clean induction principle cannot be the basis for soundness proofs that scale.

Plotkin's move (1981; per [Plotkin 1981](../references/plotkin1981.md)) was *structural operational semantics* (SOS): evaluation is a relation $\langle e, s\rangle \Rightarrow \langle e', s'\rangle$ specified by inference rules whose conclusions are evaluation steps and whose premises are sub-evaluations. The structural argument is the *induction-on-derivation* discipline: every property of evaluation provable by induction on the SOS derivation is preserved by every SOS rule's premises. SOS rules have a canonical reading and admit machine-checked soundness proofs.

The discipline inherits Plotkin's SOS as the *specification register* for [evaluate](../morphisms/evaluate.md). The substrate's evaluation operation is specified by SOS-style rules whose premises are sub-evaluation cells; the witness chain records the SOS derivation directly.

## Moggi and Wadler solve the *effect-typing* problem

By the late 1980s the discipline had pure functional computation and operational semantics, but *effects* (state, IO, exceptions, non-determinism) were untyped — the type system saw `Int -> Int` whether the function was pure or printed to stderr. The structural problem: untyped effects break parametricity, break referential transparency, and prevent the type system from supporting any reasoning about effect-discipline.

Moggi's move (1989/1991; per [Moggi 1991](../references/moggi1991.md)) was the *computational lambda-calculus*: separate the type $A$ (of values) from the type $T(A)$ (of computations producing values), with $T$ a *strong monad* whose unit-and-bind structure carries the effect's algebraic identity. Different effects correspond to different monads (state monad, exception monad, IO monad, list monad for non-determinism). Wadler's move (1990–1992; per [Wadler 1992](../references/wadler1992.md)) was to translate Moggi's categorical presentation into a programmer-facing notation (do-notation, Haskell-style monads) and to develop *effect rows* and the *effect calculus* in which effect annotations on function arrows compose by row-union.

The discipline inherits Moggi-Wadler's effect-typing as the *discipline by which effects are typed*. The subtheory's [effect](../teaching/explanations/effect.md) concept is presented as a typed annotation on the function arrow; the [effect-system-granularity](../learning/questions/effect-system-granularity.md) open question records which presentation (per-effect rows, per-region, per-capability) the discipline commits to.

## Miller solves the *authority-discipline* problem

By the 2000s the discipline had typed effects but no structural account of *authority*: a function with an `IO` effect could read any file, write any directory, open any socket — the effect type carried *that the function does IO*, not *which IO it is permitted to do*. The structural problem: authority unconstrained by the type system collapses to ambient authority, and ambient-authority systems cannot be reasoned about modularly (a deeply-nested function can exfiltrate any state the ambient authority makes accessible).

Miller's move (2006; per [Miller 2006](../references/miller2006.md)) was the *object-capability* discipline, formalised in the lambda-calculus-with-only-references model: a function's authority is *exactly* the closure of references it holds; no ambient environment, no global namespace. The structural argument is the *capability non-amplification theorem*: a function called with reference set $\{r_1, \ldots, r_n\}$ can authorise only the operations these references admit (or operations on references properly delegated from them). Miller's E language and the subsequent capability-secure systems (Joe-E, Caja, Spritely Goblins) are the operational realisations.

The discipline inherits Miller's object-capability as the *authority discipline* of the substrate. The subtheory's [capability-non-amplification](../theorems/capability-non-amplification.md) theorem is Miller's theorem restated in the substrate's modal vocabulary: capability-passing reads as the modal-necessity operator along the call-graph accessibility relation, and modal-necessity is monotone in its argument's bilattice height.

## Pierce synthesises the *type-systems-for-programmers* discipline

The line through Reynolds-Plotkin-Moggi-Wadler-Miller is a research-mathematics line; the synthesis into a *programmer-facing discipline* with a teachable proof methodology was Pierce's 2002 textbook *Types and Programming Languages* (per [Pierce 2002](../references/pierce2002.md)). The structural problem the synthesis solved: the field had many type systems with many soundness proofs, each proved on its own terms, with no shared template.

Pierce's move was the *progress-and-preservation* template, applied uniformly across simple types, subtyping, recursive types, polymorphism, type operators, and (in the companion volume) dependent types. Every soundness proof in the textbook is the same shape: progress (well-typed non-value steps) and preservation (steps preserve well-typedness) jointly imply soundness (well-typed programs do not get stuck).

The discipline inherits Pierce's progress-and-preservation as the *proof template* for [type-soundness](../theorems/type-soundness.md). Any change to the substrate's type system requires re-proving the soundness theorem in the new system, following the same pattern.

## The current synthesis (per the Roc example)

Modern functional-runtime languages (Roc, Elm, Koka, Unison, Effekt) accumulate every step in the line: Church's lambda-calculus, Hindley-Milner inference (Roc, Elm), parametric polymorphism (all), Plotkin-style operational semantics (the implementation language), Moggi-Wadler-style effect typing (Koka's effect rows, Roc's platform abilities, Effekt's algebraic effects), Miller-style capability discipline (Roc's platform-passing model, Unison's abilities, Pony's object capabilities), and Pierce-template type-soundness proofs.

The [roc example](../examples/roc.md) instantiates the subtheory's commitments concretely: Hindley-Milner inference, structural typing with tag unions and records, ML-family pattern matching, an effect-discipline via *platforms* (capability-style), purity-by-default with explicit effects, replay-determinism for pure functions. The example is the corpus's working witness that the accumulated structural commitments do constitute a single coherent discipline.

## What the line accumulates

Reading from Church to Roc, the discipline accumulates seven structural commitments:

| Step | Problem | Commitment | What the successor would lack |
|---|---|---|---|
| Church | function-as-first-class-value absent in graph-theoretic functions | lambda-abstraction with confluent reduction | no formal ground for higher-order operation |
| Hindley-Milner | unique most-general type not guaranteed | let-polymorphism with W algorithm | no deterministic type-inference |
| Reynolds | polymorphism without uniformity | parametricity as logical relation | no relational identity from type alone |
| Plotkin | evaluation specifications not induction-friendly | structural operational semantics | no scalable soundness-proof template |
| Moggi-Wadler | effects untyped under arrow types | monadic effect typing with rows | no compositional reasoning about effects |
| Miller | authority unconstrained by types collapses to ambient | object-capability discipline | no modular authority reasoning |
| Pierce | many soundness proofs without shared template | progress-and-preservation as template | no teachable, transferable soundness methodology |

Each step is required for what comes after. The accumulated commitment is what the discipline *is*; each commitment becomes a substrate-level operation under the predicated-knowledge-systems substrate (per the [composability narrative](composability-with-predicated-knowledge-systems.md)).

The discipline as it stands is not a parade of competing languages; it is the line of accumulated commitments that, taken together, constitutes structural functional-runtime on a working substrate.
