import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Calculus.Order.FormalConceptAnalysis
import Obsmetrologia.Calculus.Probability.Stochastic
import Obsmetrologia.Calculus.Probability.Measure
import Obsmetrologia.Calculus.LinearAlgebra.Basic
import Obsmetrologia.Calculus.Real.IVT

open Verso.Genre Manual InlineLean
open Obsmetrologia

/-!
A teaching chapter for generated calculus witnesses that were too large for the
first calculus phase map.
-/

#doc (Manual) "Generated calculus witnesses" =>

# Generated Calculus Witnesses

The first calculus page says why calculus is not an ambient substrate. This page
does the next job: it names several large calculus carriers and shows exactly
what each one witnesses. Order, probability, linear algebra, and square-root
analysis are admitted only after closure, value, finite support, and constructive
completion have made their claim-sites lawful.

The claim-site carried here is:

* claim-site: calculus witnesses as generated order, value, finite support, and
  constructive completion;
* phase: closure phase, with value and completion interfaces;
* generating sites: closure operators, Galois derivation, finite powersets,
  stochastic value semirings, linear action over a field, and Bishop-real
  completion;
* downstream uses: classification lattices, finite probability and conditioning,
  Markov settling, physical phase diagnostics, spacetime operators, reaction
  rates, dense-matter bounds, and frontier analytic claims;
* Lean declarations: `Obsmetrologia.FCA.derivation_galois_connection`,
  `Obsmetrologia.Probability.Measure.SampleSpace.measure`,
  `Obsmetrologia.Probability.Stochastic.MarkovKernel`,
  `Obsmetrologia.LinearAlgebra.rank_nullity`,
  `Obsmetrologia.Real.Internal.sq_sqrtNat`;
* Blueprint/proof-tree nodes: no separate proof-tree node generates this page;
  Blueprint physics and persistence nodes use these carriers downstream;
* provenance: older order, probability, linear-algebra, and real-analysis notes
  are refit only where a Lean declaration carries the law;
* familiar mathematical comparison: formal concept analysis, finite measure,
  Markov chains, finite-dimensional linear algebra, and square-root analysis;
* reader closure: when a later page says "probability", "rank", "stationary",
  or "real root", return to the carrier named here;
* frontier status: sigma-algebras, measure integration, spectral theory,
  Hilbert spaces, differentiability, and PDE analysis are missing carriers.

The governing sentence is:

> Calculus words are lawful only where a generated carrier has already borne the
> law they invoke.

## Formal Contexts Generate Closure

Formal concept analysis belongs to Book IV because derivation creates a closure
operator. It is not a new foundation for objects and attributes.

The generated carrier is:

{docstring Obsmetrologia.FCA.derivation_galois_connection}

The idempotence law is:

{docstring Obsmetrologia.FCA.closeA_idem}

Checked:

```lean
example {G M : Type} (I : G -> M -> Prop)
    (A : FCA.ExtSet G) :
    FCA.closeA I (FCA.closeA I A)
      = FCA.closeA I A :=
  FCA.closeA_idem I A
```

The familiar comparison is a concept lattice. The lawful claim-site is earlier:
derivation and closure over generated predicates.

## Finite Probability Is Valuation

Probability first enters as finite counting valuation over events, not as
measure theory imported whole.

The finite event carrier is:

{docstring Obsmetrologia.Probability.Measure.SampleSpace.measure}

The empty and total events carry the two boundary values:

{docstring Obsmetrologia.Probability.Measure.SampleSpace.measure_empty}

{docstring Obsmetrologia.Probability.Measure.SampleSpace.measure_univ}

Conditioning is a restricted fiber count:

{docstring Obsmetrologia.Probability.Measure.SampleSpace.condMeasure_le}

Checked:

```lean
example {Ω : Type}
    (S : Probability.Measure.SampleSpace Ω) :
    S.measure Discrete.Set.empty = 0 :=
  Probability.Measure.SampleSpace.measure_empty S
```

This is enough to teach probability as positing made quantitative. It is not
enough to claim integration, sigma-additivity, martingales, or stochastic PDEs.

## Markov Stationary Means Settling

Stochastic vocabulary is lawful where a value semiring and finite kernel have
been built. Stationarity is then exactly a fixed point.

The kernel carrier is:

{docstring Obsmetrologia.Probability.Stochastic.MarkovKernel}

The stationary/fixed-point identification is:

{docstring Obsmetrologia.Probability.Stochastic.markov_stationary_is_closure_fixpoint}

The finite witness is:

{docstring Obsmetrologia.Probability.Stochastic.uniformWitnessStationary}

Checked:

```lean
example :
    Probability.Stochastic.IsStationary
      Probability.Stochastic.witnessKernel
      Probability.Stochastic.uniformWitness :=
  Probability.Stochastic.uniformWitnessStationary
```

The reader closure is to read a Markov chain here as value-settling. The
Perron-Frobenius, ergodic-theory, and analytic probability projections remain
frontier unless stronger carriers are supplied.

## Linear Algebra Is A Finite Projection

Linear algebra enters after a field carrier and finite coordinate action have
already been generated.

The vector-space carrier is
{name Obsmetrologia.LinearAlgebra.VectorSpace}`VectorSpace`: a field action on a
finite coordinate carrier with the laws required for linear combination.

The standard finite basis is witnessed by
{name Obsmetrologia.LinearAlgebra.Vec.stdBasis_length}`stdBasis_length`.

The rank-nullity witness is:

{docstring Obsmetrologia.LinearAlgebra.rank_nullity}

Checked:

```lean
example (F : Algebra.Field) (n : Nat) :
    (LinearAlgebra.Vec.stdBasis F n).length = n :=
  LinearAlgebra.Vec.stdBasis_length F n

example :
    LinearAlgebra.BoolWorked.kerBasis.length
      + LinearAlgebra.BoolWorked.imBasis.length = 2 :=
  LinearAlgebra.rank_nullity.1
```

This page may say kernel, image, dimension, and rank because the finite carrier
has the required laws. It may not infer spectral analysis, Hilbert spaces, or
functional analysis by resemblance.

## Constructive Reals Carry Roots

Real analysis appears only where constructive completion has been carried. The
square-root theorem is a small but important analytic witness.

The square-root carrier and theorem are:

{docstring Obsmetrologia.Real.Internal.sqrtNat}

{docstring Obsmetrologia.Real.Internal.sq_sqrtNat}

Checked:

```lean
example {c : Nat} (hc : 1 <= c) :
    Real.Internal.sqrtNat c * Real.Internal.sqrtNat c
      = Real.Internal.RReal.ofRat
          (Real.Internal.Rat.ofNat c) :=
  Real.Internal.sq_sqrtNat hc
```

This licenses constructive square roots for later Salem, metallic, and physical
numeric projections. It does not license classical smooth analysis, differentiable
manifolds, or continuum field equations.

## Reader Closure

Every ordinary calculus phrase must now be read through its generated witness.
If a later page needs a stronger analytic statement, it must name the missing
carrier and the proof that promotes it. Resemblance to received calculus is not
promotion.
