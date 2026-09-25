import Obsmetrologia.CausalSets.Action.EinsteinHilbertAction
import Obsmetrologia.AperiodicOrder.Tiling.ChromaticLorentzian

/-!
# The chromatic Lorentzian's Einstein–Hilbert action — settling is the d'Alembertian's Green's function

Throwing the chromatic-Lorentzian carrier (`AperiodicOrder.Tiling.ChromaticLorentzian`: the causal chain `ℕ`,
`n ≺ n+1`, with mark-propagation settling) at the discrete **Einstein–Hilbert / Benincasa–Dowker
action** (`CausalSets.Action.EinsteinHilbertAction`: `S = ∑_x □1(x)`, `□φ(x) = ∑_{y ≼ x} μ(y,x)φ(y)` the retarded
Möbius d'Alembertian). On the chain the two halves are the same object seen from opposite ends.

The chain's incidence Möbius is `μ(n,n) = 1`, `μ(n-1,n) = -1`, `0` otherwise, so the causal
d'Alembertian collapses to the **retarded backward difference**

  `□φ(n) = φ(n) - φ(n-1)`   (`box`),

and the chromatic-Lorentzian **settling past-closure** is its **retarded Green's function** — the
cumulative causal past-sum

  `Gφ(n) = ∑_{m ≤ n} φ(m)`   (`pastSum`),

with `ChromaticLorentzian.settle` (the `Bool`-valued past-closure `∃ m ≤ n, f m`) the `(Bool, ∨)`
projection of this `(Int, +)` propagator. The two are **mutually inverse** (`box_pastSum`, `pastSum_box`)
— the discrete fundamental theorem of calculus on the causal chain. From the inverse law everything
falls out:

* the **Einstein–Hilbert curvature of the unit field** is `□1 = δ₀` (`box_unit`): the discrete
  curvature localizes entirely at the causal origin `n = 0` — the chain is flat off its initial
  boundary;
* the **discrete action telescopes to `1`** (`bdAction_chain`): `G(□1) = 1` recovers the constant unit
  field, so the total curvature is the single boundary value — the `S = 1` of the chain's lone causal
  origin, matching `CausalSets.Action.EinsteinHilbertAction.bdAction` on the finite chain (`chain_bdAction_four`);
* the **settling is the propagator** (`settle_iff_pastSum_pos`): the chromatic-Lorentzian `Bool`
  settling is positive exactly where the integer retarded propagator is — the settling origin is the
  d'Alembertian's source, and the curvature `□1` lives precisely there.

So the chromatic Lorentzian's settling *is* the Green's function of the Einstein–Hilbert d'Alembertian
on the causal chain, and its gravitational action counts the single causal-boundary (origin) event
where settling begins.

## Main definitions

* `box` — the chain causal d'Alembertian `□φ(n) = φ(n) - φ(n-1)`.
* `pastSum` — the retarded propagator (cumulative causal past-sum), `□`'s Green's function.

## Main results

* `box_pastSum` / `pastSum_box` — `□` and the propagator are mutually inverse (discrete FTC).
* `box_unit` — `□1 = δ₀`: the EH curvature localizes at the causal origin.
* `bdAction_chain` — the chain's discrete EH action telescopes to `1`.
* `settle_iff_pastSum_pos` — the chromatic-Lorentzian settling is the retarded propagator.
* `chain_bdAction_four` — agreement with `CausalSets.Action.EinsteinHilbertAction.bdAction` on the finite chain.
* `chromatic_lorentzian_action` — the bundled headline.

## References

`content/.../lorentzian-causal-settling/content/einstein-hilbert-action`,
`content/.../causal-dalembertian`. Built on `Obsmetrologia.CausalSets.Action.EinsteinHilbertAction` and
`Obsmetrologia.AperiodicOrder.Tiling.ChromaticLorentzian`.

## Tags

Einstein–Hilbert action, causal d'Alembertian, Green's function, retarded propagator, chromatic Lorentzian
-/

namespace Obsmetrologia
namespace CausalSets.Action.Chromatic

/-! ## (A) The chain d'Alembertian and its retarded Green's function -/

/-- The **chain causal d'Alembertian** `□φ(n) = ∑_{m ≼ n} μ(m,n) φ(m) = φ(n) - φ(n-1)` — the retarded
backward difference, the chain's incidence Möbius being `μ(n,n) = 1`, `μ(n-1,n) = -1`. -/
def box (φ : Nat → Int) : Nat → Int
  | 0 => φ 0
  | n + 1 => φ (n + 1) - φ n

/-- The **retarded propagator** `Gφ(n) = ∑_{m ≤ n} φ(m)` — the cumulative causal past-sum, the
Green's function of `box` on the chain; the `(Int, +)` form of the chromatic-Lorentzian past-closure. -/
def pastSum (φ : Nat → Int) : Nat → Int
  | 0 => φ 0
  | n + 1 => φ (n + 1) + pastSum φ n

/-- **`□ ∘ G = id`** — the d'Alembertian recovers a field from its propagator. -/
theorem box_pastSum (φ : Nat → Int) : box (pastSum φ) = φ := by
  funext n
  cases n with
  | zero => rfl
  | succ k =>
    show pastSum φ (k + 1) - pastSum φ k = φ (k + 1)
    show φ (k + 1) + pastSum φ k - pastSum φ k = φ (k + 1)
    omega

/-- **`G ∘ □ = id`** — the propagator integrates the d'Alembertian back (discrete FTC on the chain). -/
theorem pastSum_box (φ : Nat → Int) : pastSum (box φ) = φ := by
  funext n
  induction n with
  | zero => rfl
  | succ k ih =>
    show box φ (k + 1) + pastSum (box φ) k = φ (k + 1)
    rw [ih]
    show φ (k + 1) - φ k + φ k = φ (k + 1)
    omega

/-! ## (B) The Einstein–Hilbert curvature and action of the chain -/

/-- **`□1 = δ₀`** — the Einstein–Hilbert curvature of the unit field localizes entirely at the causal
origin `n = 0`. The chain is discretely flat off its initial boundary. -/
theorem box_unit (n : Nat) : box (fun _ => (1 : Int)) n = if n = 0 then 1 else 0 := by
  cases n with
  | zero => rfl
  | succ k => show (1 : Int) - 1 = if k + 1 = 0 then 1 else 0; simp

/-- **The chain's discrete Einstein–Hilbert action is `1`.** The propagator of the curvature `□1`
recovers the constant unit field (`pastSum_box`), so the total curvature telescopes to the single
causal-boundary value — `S = 1`, the chain's lone origin. -/
theorem bdAction_chain (n : Nat) : pastSum (box (fun _ => (1 : Int))) n = 1 := by
  rw [pastSum_box]

/-! ## (C) The settling is the retarded propagator -/

/-- The propagator of a nonnegative field is nonnegative. -/
theorem pastSum_nonneg (φ : Nat → Int) (h : ∀ m, 0 ≤ φ m) (n : Nat) : 0 ≤ pastSum φ n := by
  induction n with
  | zero => exact h 0
  | succ k ih => show 0 ≤ φ (k + 1) + pastSum φ k; have := h (k + 1); omega

/-- **The chromatic-Lorentzian settling is the retarded propagator.** The `Bool`-valued past-closure
`ChromaticLorentzian.settle f` (`∃ m ≤ n, f m`) is positive exactly where the integer retarded
propagator `pastSum` of the marking's indicator is — the `(Bool, ∨)` settling is the `(Int, +)`
Green's function. So the settling origin is the d'Alembertian's source. -/
theorem settle_iff_pastSum_pos (f : Nat → Bool) (n : Nat) :
    AperiodicOrder.Tiling.ChromaticLorentzian.settle f n = true
      ↔ 0 < pastSum (fun m => if f m then (1 : Int) else 0) n := by
  induction n with
  | zero =>
    show (f 0 = true) ↔ 0 < (if f 0 then (1 : Int) else 0)
    cases f 0 <;> simp
  | succ k ih =>
    show (f (k + 1) || AperiodicOrder.Tiling.ChromaticLorentzian.settle f k) = true
      ↔ 0 < (if f (k + 1) then (1 : Int) else 0)
          + pastSum (fun m => if f m then (1 : Int) else 0) k
    rw [Bool.or_eq_true, ih]
    have hnn : 0 ≤ pastSum (fun m => if f m then (1 : Int) else 0) k :=
      pastSum_nonneg _ (fun m => by cases f m <;> simp) k
    cases f (k + 1) <;> simp <;> omega

/-! ## (D) Agreement with the finite Benincasa–Dowker action -/

/-- **The chain's EH action matches `CausalSets.Action.EinsteinHilbertAction.bdAction`.** On the finite 4-chain the
Benincasa–Dowker action is `1` — the single minimal (origin) event — agreeing with the chain
d'Alembertian's telescoped action (`bdAction_chain`). -/
theorem chain_bdAction_four :
    CausalSets.Action.EinsteinHilbertAction.bdAction CausalSets.Dimension.OrderingFraction.fourEvents CausalSets.Dimension.OrderingFraction.chainPrec = 1 := by decide

/-! ## (E) The bundled headline -/

/-- **The chromatic Lorentzian's Einstein–Hilbert action.** On the causal chain the settling and the
gravitational action are inverse halves of one structure:

* `□` (the retarded Möbius d'Alembertian, `box`) and the chromatic-Lorentzian settling propagator
  (`pastSum`) are **mutually inverse** (`box_pastSum`, `pastSum_box`) — the discrete FTC;
* the **EH curvature** of the unit field is `□1 = δ₀` (`box_unit`), localized at the causal origin,
  and the **action telescopes to `1`** (`bdAction_chain`) — the chain's single causal boundary,
  matching `CausalSets.Action.EinsteinHilbertAction.bdAction` (`chain_bdAction_four`);
* the chromatic-Lorentzian `Bool` **settling is exactly this retarded propagator**
  (`settle_iff_pastSum_pos`): the settling origin is the d'Alembertian's source, where the curvature
  lives.

So the chromatic Lorentzian's settling is the Green's function of the Einstein–Hilbert d'Alembertian,
and its gravitational action counts the causal-boundary event where settling begins. -/
theorem chromatic_lorentzian_action :
    (∀ φ : Nat → Int, box (pastSum φ) = φ)
    ∧ (∀ φ : Nat → Int, pastSum (box φ) = φ)
    ∧ (∀ n, box (fun _ => (1 : Int)) n = if n = 0 then 1 else 0)
    ∧ (∀ n, pastSum (box (fun _ => (1 : Int))) n = 1)
    ∧ (∀ (f : Nat → Bool) (n : Nat),
        AperiodicOrder.Tiling.ChromaticLorentzian.settle f n = true
          ↔ 0 < pastSum (fun m => if f m then (1 : Int) else 0) n)
    ∧ CausalSets.Action.EinsteinHilbertAction.bdAction CausalSets.Dimension.OrderingFraction.fourEvents CausalSets.Dimension.OrderingFraction.chainPrec = 1 :=
  ⟨box_pastSum, pastSum_box, box_unit, bdAction_chain, settle_iff_pastSum_pos, chain_bdAction_four⟩

end CausalSets.Action.Chromatic
end Obsmetrologia
