---
type: reference
class: academic
status: cited
authors: [Milner, Robin]
year: 1978
title: "A theory of type polymorphism in programming"
venue: "Journal of Computer and System Sciences 17(3), pp. 348--375"
---

## Source

R. Milner. "A theory of type polymorphism in programming." *Journal of Computer and System Sciences*, 17(3): 348–375, December 1978. doi:10.1016/0022-0000(78)90014-4. (Companion: L. Damas and R. Milner. "Principal type-schemes for functional programs." *Proceedings of the 9th ACM Symposium on Principles of Programming Languages (POPL '82)*, pp. 207–212, 1982.)

## Form

Journal article. The originating paper for the *Hindley-Milner* type system: a let-polymorphic typing discipline with a sound and complete inference algorithm (the *W algorithm*). Milner builds on Hindley's 1969 *The Principal Type-Scheme of an Object in Combinatory Logic* (Trans.\ AMS 146: 29–60) by adapting Hindley's principal-type result to the lambda-calculus with let-bindings, giving the algorithm that now bears Milner's name in most language-implementation literature. Damas's 1982 thesis with Milner provides the soundness-and-completeness proof.

## Content summary

The paper introduces a small typed lambda-calculus with `let` and shows that:

1. **Every typeable expression has a *principal* type** — a most general type-scheme such that every other type the expression admits is a substitution-instance of the principal scheme.
2. **The W algorithm computes the principal type** by structural recursion on the expression, using *unification* to enforce typing constraints. The algorithm is deterministic (modulo fresh variable choice) and terminates on every well-formed input.
3. **The type system supports *let-polymorphism***: a variable bound by `let` may be used at multiple types, with each use-site getting a fresh instantiation of the binding's principal scheme. Lambda-bound variables are *not* polymorphic (the well-known monomorphism restriction at the lambda).
4. **The let-polymorphic discipline is decidable in nearly-linear time in practice**, though the worst-case complexity (later shown by Mairson 1990 to be DEXPTIME-complete) is exponential in the nesting depth of `let`.

The paper does not prove soundness directly; the joint result with Damas (1982) gives soundness ("well-typed programs do not go wrong") and completeness ("every typeable expression is found typeable by W") jointly.

The W algorithm's structural pieces:

- **Type-schemes** $\sigma = \forall \vec\alpha. \tau$ — the polymorphic types.
- **Generalisation** at let-binding sites — quantifying over type variables not free in the surrounding type environment.
- **Instantiation** at use-sites — fresh substitution of the quantified variables.
- **Unification** — the most-general-unifier discipline that enforces type equality constraints.

## Position in the corpus

Functional-runtime-platform's [check-type](../morphisms/check-type.md) inherits the W-algorithm discipline as its inference-register: check-type on a function-record uses the let-polymorphism discipline and unification to produce a principal type-scheme, recorded in the [type-record](../objects/type-record.md). The discipline applies wherever the subtheory's type system is at most the let-polymorphic Hindley-Milner fragment; for richer disciplines (System F polymorphism, dependent types, refinement types per [refined-type](teaching/explanations/refined-type.md)), the inference problem becomes undecidable or requires explicit annotation, and the [refinement-type-decidability-boundary](questions/refinement-type-decidability-boundary.md) open question records the substrate's commitment.

The [structural-lineage-from-church-to-roc](teaching/explanations/structural-lineage-from-church-to-roc.md) narrative places Milner's contribution as the *type-inference* step on the line: Church gave first-class functions, Milner gave their principal types, Reynolds (per [reynolds1974](reynolds1974.md)) gave their parametricity discipline, Plotkin (per [plotkin1981](plotkin1981.md)) gave their evaluation specification, Moggi (per [moggi1991](moggi1991.md)) and Wadler (per [wadler1992](wadler1992.md)) gave their effect-typing, Miller (per [miller2006](miller2006.md)) gave their authority discipline.

The ML-family languages (Standard ML, OCaml, Haskell, F#, Roc per [the roc example](../examples/roc.md)) all inherit Hindley-Milner with various extensions; the subtheory's commitment to let-polymorphism as the type-inference quantum is what makes those languages first-class instances rather than special cases.

## Where used

- [check-type](../morphisms/check-type.md)
- [type-record](../objects/type-record.md)
- [type](teaching/explanations/type.md)
- [structural-lineage-from-church-to-roc](teaching/explanations/structural-lineage-from-church-to-roc.md)
- [what-functional-runtime-platform-inherits](teaching/explanations/what-functional-runtime-platform-inherits.md)
- [refinement-type-decidability-boundary](questions/refinement-type-decidability-boundary.md)
