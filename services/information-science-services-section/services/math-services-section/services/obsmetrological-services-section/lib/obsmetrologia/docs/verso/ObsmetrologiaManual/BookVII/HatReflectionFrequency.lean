import ObsmetrologiaManual.DocSetup
import Obsmetrologia.AperiodicOrder.Tiling.Witness.HatReflectionFrequency

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.AperiodicOrder.Tiling
open Obsmetrologia.AperiodicOrder.Tiling.StepN
open Obsmetrologia.AperiodicOrder.Tiling.Universality
open Obsmetrologia.AperiodicOrder.Tiling.Witness

/-!
A teaching chapter for the reflected-hat frequency as an integer eigen-relation.
-/

#doc (Manual) "Hat reflection frequency" =>

# Hat Reflection Frequency

The hat monotile page left one node red on purpose: the ratio of unreflected
to reflected hats in a hat tiling, `φ⁴ : 1`, is usually read off a real Perron
eigenvector, and the dependency-free core has no reals to read it off. This
page settles that node without them. The eigenvalue `φ⁴` and its eigenvector
both live in the golden integers `ℤ[φ]`, so the whole statement is an exact
identity between integer pairs, decided by the kernel.

The claim-site carried here is:

* claim-site: the reflected-hat frequency as an integer eigen-relation;
* phase: persistence after non-Scott settling, the same phase as the hat
  monotile page;
* generating sites: the golden integers as pairs, the left eigen-relation,
  the hat-count weights, the frequency identity;
* Lean carrier: `Obsmetrologia.AperiodicOrder.Tiling.Witness.HatReflectionFrequency`;
* familiar comparisons: quadratic integer rings, left Perron eigenvectors,
  tile frequencies of primitive substitutions;
* danger: reading the eigen-relation as the Perron–Frobenius theorem. The
  page proves that one golden vector is an eigenvector for `φ⁴` and what it
  weighs; that it is positive and the unique Perron vector up to scale stays
  red beside it.

The governing sentence is:

> The frequency of the reflected hat is an integer pair, not a real number.

## The Golden Integers

A pair `⟨a, b⟩` stands for `a + b·φ`. Addition is componentwise; the product
folds `φ² = φ + 1` back into a pair. The golden equation itself is then a
kernel computation, and so is `φ⁴ = 2 + 3φ`:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.GoldenInt}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.GoldenInt.mul}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.GoldenInt.phi_mul_phi}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.GoldenInt.phi_pow_four}

## The Left Eigen-Relation

The vector `(1, 5 − 3φ, 6φ − 9, 6 − 3φ)` on the alphabet `H, T, P, F` is a
left eigenvector of the hat metatile matrix for `φ⁴`. The row product is a
weighted sum in `ℤ[φ]`, and the relation holds entry by entry:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.goldenWeigh}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.goldenRowMul}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.hatLeftVector}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.hat_left_eigen}

## Counting Hats

The monotile paper's metatile composition gives two integer weight vectors:
hats per metatile, and reflected hats per metatile. The one reflected hat
sits at the centre of every `H` and nowhere else.

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.hatsPerMetatile}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.reflectedHatsPerMetatile}

Weighing the eigenvector by each gives `3 + 3φ = 3φ²` and `1`:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.hat_total_weight}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.hat_total_weight_is_three_phi_sq}

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.hat_reflected_weight}

## The Frequency Identity

Unreflected hats are the total minus the reflected, and that difference is
exactly `φ⁴` times the reflected weight:

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.hat_reflection_frequency}

## The Witness, Bundled

{docstring Obsmetrologia.AperiodicOrder.Tiling.Witness.hat_reflection_frequency_witness}

## What Stays Red

That `hatLeftVector` is positive, and the unique Perron eigenvector of the
primitive matrix up to scale, is the node seated beside this one. It needs
either an order on `ℤ[φ]` or the real `φ` of the golden field bridge, and a
Perron–Frobenius uniqueness statement for primitive integer matrices in core.
