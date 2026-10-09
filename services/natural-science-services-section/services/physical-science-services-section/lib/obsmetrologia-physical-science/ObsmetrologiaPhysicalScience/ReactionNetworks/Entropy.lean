import ObsmetrologiaPhysicalScience.ReactionNetworks.Network
import ObsmetrologiaPhysicalScience.Thermodynamics.BoltzmannEntropy

/-! # Reaction entropy — the real H-theorem on the count regime

The discrete Lyapunov descent of `FreeEnergyDescent` is count-only. Here the
thermodynamics is **real-valued**: the Boltzmann `H = Σ log(nₓ!)` of the occupation
multiset of a reaction state, reusing `Thermodynamics.configH` / `Thermodynamics.cellH` (built on the
Bishop-real `logNat`). The entropy is `S = log N! − H`, so a firing that lowers `H` does
not lower `S`.

The corpus already proved the H-theorem for equilibrating exchanges
(`Thermodynamics.htheorem`, `Thermodynamics.htheorem_evolution`). This module *lifts that proved theorem
to reaction firing*: a reaction whose effect on the occupation multiset is an
equilibrating exchange does not decrease entropy (`entropyH_le_of_relaxes`), and a
concrete isomerization `A → B` realizes one such exchange (`iso_entropy_le`), so the
statement is not vacuous. This discharges the survey's "thermodynamic cost / what did the
soup compute" line in the real-valued regime, by reuse rather than re-proof.

## Main definitions

* `occupation` — the occupation multiset `univ.map s` of a state.
* `entropyH` — the Boltzmann `H` of a reaction state (`= Thermodynamics.configH ∘ occupation`).
* `RelaxesVia` — a firing whose occupation multiset relaxes (a chain of exchanges).

## Main results

* `occupation_sum` — the occupation multiset carries the same mass `total` counts.
* `entropyH_perm` — entropy is invariant under roster reordering.
* `entropyH_le_of_relaxes` — `H` is non-increasing (entropy non-decreasing) along a
  relaxing firing trajectory — the reaction H-theorem.
* `iso_entropy_le` — a concrete `A → B` isomerization realizes it (non-vacuity).

## Tags

reaction network, Boltzmann entropy, H-theorem, occupation multiset, settling
-/

namespace Obsmetrologia
namespace ReactionNetworks

open Obsmetrologia.Real.Internal

variable {Species : Type}

/-- The **occupation multiset** of a state over a roster: the list of per-species counts.
This is what Boltzmann's `H` is a function of. -/
def occupation (univ : List Species) (s : State Species) : List Nat := univ.map s

/-- The occupation multiset carries the same total mass that `total` counts — entropy and
conservation speak about the same particles. -/
theorem occupation_sum (univ : List Species) (s : State Species) :
    (occupation univ s).sum = total univ s := rfl

/-- The **Boltzmann `H`** of a reaction state: `Σₓ log(sₓ!)` over the roster, via the
real-valued `Thermodynamics.configH`. The entropy is `S = log N! − H`. -/
def entropyH (univ : List Species) (s : State Species) : RReal :=
  Thermodynamics.configH (occupation univ s)

/-- Entropy is invariant under reordering the species roster. -/
theorem entropyH_perm {univ univ' : List Species} (s : State Species)
    (h : List.Perm univ univ') : entropyH univ s = entropyH univ' s :=
  Thermodynamics.configH_perm (h.map s)

/-! ## The H-theorem, lifted to firing -/

/-- A firing **relaxes** when its effect on the occupation multiset is a chain of
equilibrating exchanges in the sense of `Thermodynamics.Relaxes`. -/
def RelaxesVia (univ : List Species) (s s' : State Species) : Prop :=
  Thermodynamics.Relaxes (occupation univ s) (occupation univ s')

/-- **The reaction H-theorem.** Along a relaxing firing trajectory, Boltzmann's `H` does
not increase — so the entropy `S = log N! − H` does not decrease. This is
`Thermodynamics.htheorem_evolution` transported to the reaction regime through the occupation
multiset; the corpus's proved real-valued H-theorem, reused. -/
theorem entropyH_le_of_relaxes {univ : List Species} {s s' : State Species}
    (h : RelaxesVia univ s s') : entropyH univ s' ≤ entropyH univ s :=
  Thermodynamics.htheorem_evolution h

/-! ## A concrete isomerization realizes an exchange (non-vacuity) -/

/-- The two-species roster (`true = A`, `false = B`). -/
def isoUniv : List Bool := [true, false]

/-- The state with `a+1` copies of `A` and `b` copies of `B`. -/
def isoState (a b : Nat) : State Bool := fun x => if x then a + 1 else b

/-- The isomerization reaction `A → B`: consume one `A`, produce one `B`. -/
def isoRxn : Reaction Bool := ⟨fun x => if x then 1 else 0, fun x => if x then 0 else 1⟩

/-- The isomerization is enabled (there is an `A` to consume). -/
theorem iso_enabled (a b : Nat) : enabled isoRxn (isoState a b) := by
  intro x; cases x <;> simp [isoRxn, isoState]

/-- Firing `A → B` turns `(a+1, b)` into `(a, b+1)` — its occupation multiset is exactly
the equilibrating exchange of `Thermodynamics.Exchange`, provided `b ≤ a`. -/
theorem iso_occupation_exchange (a b : Nat) (h : b ≤ a) :
    Thermodynamics.Exchange (occupation isoUniv (isoState a b))
      (occupation isoUniv (fire isoRxn (isoState a b))) := by
  refine ⟨a, b, [], h, ?_, ?_⟩
  · show List.Perm [a + 1, b] ((a + 1) :: b :: [])
    exact List.Perm.refl _
  · show List.Perm [a, b + 1] (a :: (b + 1) :: [])
    exact List.Perm.refl _

/-- **Non-vacuity of the reaction H-theorem.** A concrete `A → B` isomerization (with the
sink no fuller than the source) does not decrease entropy: `H` drops. -/
theorem iso_entropy_le (a b : Nat) (h : b ≤ a) :
    entropyH isoUniv (fire isoRxn (isoState a b)) ≤ entropyH isoUniv (isoState a b) :=
  Thermodynamics.htheorem (iso_occupation_exchange a b h)

end ReactionNetworks
end Obsmetrologia
