import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Dynamics.Flow.LawvereLaplacianSpectralGap
import Obsmetrologia.Calculus.Probability.Stochastic
import Obsmetrologia.Calculus.Probability.Dequantization
import Obsmetrologia.Computing.FormatsFour

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.Valuation
open Obsmetrologia.Valuation.ModalFrame
open Obsmetrologia.LawvereLaplacian
open Obsmetrologia.Probability.Stochastic
open Obsmetrologia.Probability.Dequantization

/-!
A teaching chapter for calculus, dynamics, stochastic settling, and computing
formats as generated closure-phase invariants.
-/

#doc (Manual) "Flow calculus" =>

# Flow Calculus

The Calculus and Dynamics neighborhoods are large enough to mislead a reader.
Their size makes them look like subject areas imported into Obsmetrologia. They
are not. In the phase spine, they become lawful when closure and settling have
already generated fixed points, orbits, value categories, and regime data.

The claim-site carried here is:

* claim-site: flow calculus as generated closure motion;
* phase: closure, after valuation lift and before cohomological gluing;
* generating sites: charge closure, valuation closure, modal closure operator,
  closure regime, value category;
* downstream uses: Lawvere Laplacian, harmonic kernel, stochastic settling,
  Maslov dequantization, spectral-gap witnesses, format completion hierarchy;
* Lean carriers: `Obsmetrologia.Dynamics.Flow.LawvereLaplacianSpectralGap`,
  `Obsmetrologia.Calculus.Probability.Stochastic`,
  `Obsmetrologia.Calculus.Probability.Dequantization`,
  `Obsmetrologia.Computing.FormatsFour`;
* Blueprint/proof-tree nodes: Blueprint settling and dynamics chapters carry
  the claim graph; this page teaches the generated phase route;
* provenance: older calculus, probability, dynamics, and computing material is
  admitted here only when it is a closure-phase witness;
* familiar comparison: Laplacian, harmonic kernel, Markov stationary distribution,
  stochastic semiring, dequantization, serialization format hierarchy;
* reader closure: ask which closure operator is moving before reading any
  analytic word;
* frontier status: real analytic interpolation, Hilbert-space Hodge theory, and
  arbitrary computability claims are not promoted by these dependency-free
  witnesses.

The governing sentence is:

> A calculus page is lawful here only when it is the calculus of generated
> settling.

## The Laplacian Is Closure Motion

The Lawvere Laplacian page does not import analysis as a new foundation. It
identifies a Laplacian projection with the modal closure round trip already generated
by settling:

{docstring Obsmetrologia.LawvereLaplacian.lawvereLaplacian}

The three closure laws are:

{docstring Obsmetrologia.LawvereLaplacian.laplacian_infl}

{docstring Obsmetrologia.LawvereLaplacian.laplacian_mono}

{docstring Obsmetrologia.LawvereLaplacian.laplacian_idem}

and the bundled closure witness is:

{docstring Obsmetrologia.LawvereLaplacian.laplacian_is_closure}

Checked:

```lean
example (M : ModalFrame) (v : Valuation) :
    leK v (lawvereLaplacian M v) :=
  laplacian_infl M v

example (M : ModalFrame) (v : Valuation) :
    lawvereLaplacian M
        (lawvereLaplacian M v)
      = lawvereLaplacian M v :=
  laplacian_idem M v
```

The familiar comparison is a Laplacian. The lawful carrier is an idempotent,
inflationary, monotone closure operator on valuations.

## Harmonic Means Settled

The harmonic kernel is the fixed-point set of the generated closure:

{docstring Obsmetrologia.LawvereLaplacian.IsHarmonic}

{docstring Obsmetrologia.LawvereLaplacian.isHarmonic_iff_fixed}

{docstring Obsmetrologia.LawvereLaplacian.settle_isHarmonic}

Checked:

```lean
example (M : ModalFrame) (seed : Valuation) :
    IsHarmonic M (M.settle seed) :=
  settle_isHarmonic M seed
```

This is the reader closure: do not hear "harmonic" as analytic smoothness. In
this carrier, harmonic means fixed by the generated Lawvere-Laplacian closure.

## Diffusion Is Tarski Ascent

Dynamics appears as iteration toward a closure fixed point:

{docstring Obsmetrologia.LawvereLaplacian.diffusion}

{docstring Obsmetrologia.LawvereLaplacian.diffusion_monotone}

{docstring Obsmetrologia.LawvereLaplacian.diffusion_converges_to_harmonic}

Checked:

```lean
example (M : ModalFrame) (seed : Valuation)
    {m n : Nat} (h : m <= n) :
    leK (diffusion M seed m) (diffusion M seed n) :=
  diffusion_monotone M seed h
```

The spectral-gap language is therefore a projection of a finite settling bound in
the dependency-free carrier. It is not a Hilbert-space theorem unless that
carrier is later built.

## Stochastic Settling Is Value Settling

Stochastic language enters through a value category, not through measure theory
as an ambient primitive:

{docstring Obsmetrologia.Probability.Stochastic.StochSemiring}

{docstring Obsmetrologia.Probability.Stochastic.MarkovKernel}

{docstring Obsmetrologia.Probability.Stochastic.IsStationary}

The fixed-point theorem is:

{docstring Obsmetrologia.Probability.Stochastic.markov_stationary_is_closure_fixpoint}

and the concrete finite witness is:

{docstring Obsmetrologia.Probability.Stochastic.uniformWitnessStationary}

Checked:

```lean
example {S : Type} {V : StochSemiring}
    (K : MarkovKernel S V) (pi : S -> V.carrier) :
    IsStationary K pi <-> K.advance pi = pi :=
  markov_stationary_is_closure_fixpoint K pi

example :
    IsStationary witnessKernel uniformWitness :=
  uniformWitnessStationary
```

The frontier boundary is the real stochastic interval, Perron-Frobenius theory
at full analytic strength, and convergence-rate analysis beyond these finite
dependency-free witnesses.

## Dequantization Forgets Magnitude Into Support

The dequantization page is lawful because stochastic settling already supplied
the semiring carrier:

{docstring Obsmetrologia.Probability.Dequantization.boolStoch}

{docstring Obsmetrologia.Probability.Dequantization.Idempotent}

{docstring Obsmetrologia.Probability.Dequantization.countingDequantization}

Checked:

```lean
example :
    Idempotent boolStoch :=
  boolStoch_idempotent

example :
    ¬ Idempotent natStoch :=
  natStoch_not_idempotent
```

The familiar comparison is Maslov or tropical dequantization. The lawful claim here
is smaller and cleaner: the support map sends counting magnitude to Boolean
existence and preserves the semiring operations.

## Computing Formats Are Closure Regime Witnesses

Computing enters the book when a computational surface can be read as a closure
hierarchy. The format carrier is {name Obsmetrologia.Format}`Format`: an index
whose mathematical content is read through a content corner and completion
regime.

with content corner and completion regime:

{docstring Obsmetrologia.Format.corner}

{docstring Obsmetrologia.Format.regime}

The warning theorem is that completion cost is not monotone in the knowledge
order:

{docstring Obsmetrologia.Format.cost_nonmonotone_in_kle}

and the RMN-in-HTML witness is:

{docstring Obsmetrologia.Format.rmn_html_is_decidable}

Checked:

```lean
example :
    Obsmetrologia.Format.FormatsClosureHierarchy :=
  Obsmetrologia.Format.formats_closure_hierarchy
```

This page therefore files computing by generated phase. Formats are not a new
Book XII subject. They are a FOUR-by-regime witness that closure completion and
content commitment are orthogonal.

## Repair Path

If a later page invokes calculus, dynamics, probability, or computing as if
those names were primitive, repair it here:

1. Name the closure operator or value category.
2. Name the fixed point, orbit, regime, or support map.
3. State the dependency-free theorem actually proved.
4. Demote the familiar analytic or computational name to projection.
5. Mark the missing analytic, topological, or computability carrier as frontier.
