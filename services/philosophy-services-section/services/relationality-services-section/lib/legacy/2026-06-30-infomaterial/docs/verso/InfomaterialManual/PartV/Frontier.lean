import InfomaterialManual.DocSetup

open Verso.Genre Manual InlineLean

#doc (Manual) "Frontier and method" =>

# Part V: Frontier as Method

The frontier of Infomaterial is not a pile of guesses. It is the set of claims whose
generating path is understood well enough to state, but whose proof has not yet
been discharged in the dependency-free Lean library.

The right prose posture for frontier material is:

* state the intended theorem plainly;
* say which earlier constructions generate its terms;
* identify the missing bridge;
* avoid replacing the missing bridge with a weaker theorem while keeping the strong
  language.

This is the house discipline in one sentence: frontier claims may be ambitious, but
they must be honest about where the proof currently stops.

## What foundation prose must do

Good Infomaterial prose should do four things.

First, it should name the generated object. A reader should know whether they are
looking at a mark, cell, valuation, fibration, closure, sheaf, or invariant.

Second, it should name the generating act. The same familiar mathematical word can
mean different things depending on whether it appears under predicating, positing,
or settling.

Third, it should say what familiar theory is recovered. For example, classical
equality should be presented as a derived equality in one adjoint system, not as an
ambient primitive.

Fourth, it should state the scope. A finite model, a strict Boolean case, or a
core-only projection may be valuable, but it should not be described as the full
unbounded theorem.

## The next chapters the book must grow

The next foundation chapters should be written in this order because this is the
order in which the reader's closures become licensed.

1. *The generator/generated discipline.* Explain paths as proofs, morphism/object
   alternation, and why resemblance classification is mathematically wrong here.
2. *The two-sided admission boundary.* Explain marks, token/claim, utterance, and
   why Fregean concept/object structure is recovered downstream rather than built
   into the primitives.
3. *The first four-corner cell.* Explain articulation status, potential/active/
   stable/absurd, and why the recurring four is derived from two-sidedness.
4. *Predication without truth.* Explain the predication cell as position, the four
   generator classes, and the first recovery of category-theoretic structure.
5. *Value as independent evidence.* Explain the bilattice, the knowledge/truth
   orders, negation/conflation, and why Boolean logic is a collapse.
6. *Settling as closure.* Explain monotone accumulation, fixed points, closure
   ordinal, and the regime stratification.
7. *Recovered foundations.* One chapter each for order, equality, hyperdoctrine,
   sheaf/cohomology, linear logic, modal logic, dynamics, and geometry.
8. *How to read the frontier.* Explain the blueprint, red nodes, scope language,
   and the difference between a model, a projection, and the intended theorem.

Each chapter should contain plain prose, a small worked example, Lean repair
locators, and a frontier status when the theorem has not settled. That is how the
book becomes a laboratory notebook for foundations rather than a decorative front
end for code.

## Promotion rule

A frontier claim enters the main body only when it has a generated site, a stated
reader gutter, and a repair locator. Settlement in Lean promotes the claim from
frontier to derived prose. A strong conceptual route without settlement may still
be taught, but only as frontier and only with the missing bridge visible.
