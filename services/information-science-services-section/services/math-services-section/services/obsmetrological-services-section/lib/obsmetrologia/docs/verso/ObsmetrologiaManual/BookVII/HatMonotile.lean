import ObsmetrologiaManual.DocSetup
import Obsmetrologia.AperiodicOrder.Tiling.Witness.HatMetatile

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.AperiodicOrder.Tiling
open Obsmetrologia.AperiodicOrder.Tiling.StepN
open Obsmetrologia.AperiodicOrder.Tiling.Universality
open Obsmetrologia.AperiodicOrder.Tiling.Witness

/-!
A teaching chapter for the hat monotile's metatile substitution witness.
-/

#doc (Manual) "Hat monotile witness" =>

# Hat Monotile Witness

The preceding pages teach aperiodic persistence through hulls, towers, and
substitution matrices, and read the step-n substitutions as FOUR-valued Chu
incidences. This page carries the first witness from the 2023 aperiodic
monotile: the hat polykite of Smith, Myers, Kaplan, and Goodman-Strauss, whose
aperiodicity proof groups hats into four metatiles `H`, `T`, `P`, `F` and shows
that every metatile lies in a unique hierarchy of combinatorially equivalent
supertiles.

The claim-site carried here is:

* claim-site: the hat metatile substitution as an integer witness;
* phase: persistence after non-Scott settling, the same phase as the step-n
  algebraic page;
* generating sites: the metatile substitution, its abelianization, primitive
  matrix powers, the annihilating quartic, the golden fourth power;
* Lean carrier: `Obsmetrologia.AperiodicOrder.Tiling.Witness.HatMetatile`;
* familiar comparisons: Perron-Frobenius primitivity, Cayley-Hamilton, the
  golden ratio's Lucas trace `φ⁴ + φ⁻⁴ = 7`, Anderson-Putnam cohomology;
* danger: reading the integer witness as the aperiodicity theorem. The
  witness fixes what the substitution matrix carries; the hierarchy argument
  and the edge matching rules are not transcribed. The reflected-hat
  frequency `1 : φ⁴` is the next page's exact identity in the golden
  integers, not a real eigenvector.

The governing sentence is:

> The hat's area inflation is the fourth rung of the metallic tower.

## The Substitution

Each level-1 supertile is listed as the multiset of metatiles it contains,
on the alphabet `H = 0`, `T = 1`, `P = 2`, `F = 3`. The `H` row is the
monotile paper's own sentence: three `H` tiles and a `T` tile inside an `H`
supertile, with three `P` and three `F` around them.

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.hatMetatileSubst}

The abelianization is the same construction that produced the Fibonacci and
Padovan matrices, applied to a four-letter rule:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.hatMetatileMatrix}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.hatMetatileMatrix_is_paper}

## Primitivity

Every metatile appears inside every level-2 supertile, so the second power is
strictly positive and the integer Perron-Frobenius precondition holds:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.hatMetatileMatrix_primitive}

## The Annihilating Quartic and the Golden Link

The characteristic polynomial is `x⁴ − 7x³ + 7x − 1`. On the matrix it splits
as the Perron factor `x² − 7x + 1` times the unit factor `x² − 1`:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.charPolyHat}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.cayleyHamilton_hat}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.hat_charPoly_factors}

The Perron factor is not a new constant. The fourth power of the golden
substitution matrix satisfies it, which is the integer form of
`φ⁴ + φ⁻⁴ = 7`:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.golden_fourth_power_hat_factor}

## The Chu Reading

As on the step-n page, the matrix is the `pos`-incidence projection of a
FOUR-valued Chu relation. Here the counts exceed one, so the incidence is the
support of the matrix rather than the matrix itself:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.hatMetatileChu}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.hatMetatileMatrix_chu_incidence}

## The Witness, Bundled

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.hat_metatile_witness}

## What Stays Red

One blueprint node stays open beside this witness: the Čech cohomology of the
hat hull, `Ȟ¹ = ℤ⁴` by Baake, Gähler, and Sadun, needs a finite Anderson-Putnam
transcription on the pattern of the Jeandel-Rao witness. The reflected-hat
frequency `1 : φ⁴` is settled on the next page in the golden integers; what
stays red there is that its eigenvector is the Perron one.
