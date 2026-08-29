/-
# PairwiseStoneClopen — the Priestley/pairwise-Stone dual of FOUR

This module formalizes the **spatial side** of the Jung–Rivieccio duality for the
smallest non-trivial interlaced bilattice `FOUR`, as recorded in the corpus nodes

* `…/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/paired-priestley-space.md`
* `…/predication-fiber-algebra/content/pairwise-stone-space/pairwise-stone-space.md`
* `…/predication-fiber-algebra/content/predication-priestley-dual/predication-priestley-dual.md`

The corpus says:

> A **paired Priestley space** is a Priestley space `X` equipped with an
> order-reversing involution `σ : X → X` — the *swap*. … the swap encodes the
> bilattice negation, and the underlying Priestley order encodes one of the two
> bilattice orders, with the other recovered by post-composing with `σ`.
> **Distinguished example.** For `L = 2`, `Spec(L)` is a point, so the dual of
> `FOUR` is the two-point space `{+, −}` with `σ : + ↔ −`.

and

> A **pairwise Stone space** is a bitopological space `(X, τ₊, τ₋)`. …
> `PStone ≅ Spec ≅ Pries`. … `τ₊` from "positive evidence" and `τ₋` from
> "negative evidence".

and (Priestley duality, sending a space to its lattice of clopen up-sets):

> Priestley duality gives `DLat^op ≃ PriSp`, … a Priestley space to its lattice of
> clopen up-sets. The Jung–Rivieccio duality lifts this to `DBiLat^op ≃ PairedPriSp`.

We build the **finite** instance authoritatively:

* `PairedPriestley` — our own finite paired-Priestley bundle: a poset
  (`le`, reflexive/transitive/antisymmetric) with an order-reversing involution
  `sigma` (`sigma_invol`, `sigma_order_reversing`). Laws are fields; instances prove
  them. Models a finite Priestley space (the topology on a finite poset is discrete,
  so "compact + totally order-disconnected" is automatic and the only content is the
  poset + swap).
* `FourDual` — the two-point dual `{+, −}` of `FOUR`, with the **antichain** order
  (`le a b := a = b`, the discrete order on a one-coordinate `Spec(2) = point`
  doubled by the swap) and `sigma = swap`. All `PairedPriestley` laws proven.
* `ClopenUp` — the clopen up-sets of a `FourDual`-shaped space. On the two-point
  antichain every subset is an up-set, so a clopen up-set is a pair
  `(plus ∈ ?, minus ∈ ?) ∈ Bool × Bool = FourCorner`. Lattice ops `∩` (meet) and
  `∪` (join) recorded.
* **`four_priestley_dual`** — the bijection `ClopenUp FourDual ≃ Charge`:
  finite Priestley duality for FOUR. The four charges ARE the four clopen up-sets:
  `∅ ↔ ⊥ₖ`, `{+} ↔ t (= tTop)`, `{−} ↔ f (= tBot)`, `{+,−} ↔ ⊤ₖ`. Built through
  `FourCornerCell.cornerBij` to land in `Charge`, proven by exhaustion.
* **`swap_is_z2_negation`** — the swap `σ` is an involution (the `ℤ/2`
  gauge, `KleinFour.K4.neg`) and, transported across `four_priestley_dual`, the
  `σ`-action on clopen up-sets is exactly `Charge.negate` (the bilattice negation /
  slot swap). `σ` swaps `+, −`, hence swaps the `(plus∈?, minus∈?)` slots = `negate`.

The bitopological `(τ₊, τ₋)` pair (pairwise-Stone reading) is recorded as the
up-set / down-set families, with the order recovered from them (`PStone ≅ Pries`).
-/
import RelMath.TwistProductResiduation
import RelMath.KleinFourGauge
import RelMath.FourCornerCell

namespace RelMath
namespace Stone

/-! ## The finite paired-Priestley bundle

A finite Priestley space is just a finite poset (its topology is discrete, so the
"compact, totally order-disconnected" conditions hold automatically and carry no
extra data). A **paired** Priestley space adds the order-reversing involution `σ`
(the *swap* = bilattice negation). We bundle exactly that: a decidable poset plus a
`σ` with the two swap laws. -/

/-- A finite **paired Priestley space**: a poset (`le`, reflexive, transitive,
antisymmetric) equipped with an order-reversing involution `sigma` — the *swap* of
the corpus, encoding the bilattice negation. Laws are fields; each instance proves
them. (No topology field: on a finite carrier the Priestley topology is discrete and
adds no content beyond the order.) -/
structure PairedPriestley where
  /-- The point set of the space (finite, in our instances). -/
  carrier : Type
  /-- The underlying Priestley order — encodes one of the two bilattice orders. -/
  le : carrier → carrier → Prop
  /-- The order is reflexive. -/
  le_refl : ∀ a, le a a
  /-- The order is transitive. -/
  le_trans : ∀ {a b c}, le a b → le b c → le a c
  /-- The order is antisymmetric (a genuine partial order). -/
  le_antisymm : ∀ {a b}, le a b → le b a → a = b
  /-- The swap involution `σ` — encodes the bilattice negation. -/
  sigma : carrier → carrier
  /-- `σ` is involutive: `σ ∘ σ = id`. -/
  sigma_invol : ∀ a, sigma (sigma a) = a
  /-- `σ` is **order-reversing**: `le a b → le (σ b) (σ a)`. -/
  sigma_order_reversing : ∀ {a b}, le a b → le (sigma b) (sigma a)

namespace PairedPriestley

variable (X : PairedPriestley)

/-- The *other* bilattice order, recovered from the Priestley order by post-composing
with `σ` (corpus: "the other recovered by post-composing with `σ`"). -/
def leSwapped (a b : X.carrier) : Prop := X.le a (X.sigma b)

end PairedPriestley

/-! ## The distinguished dual `FourDual = {+, −}`

For `L = 2`, `Spec(2)` is a point; the dual of `FOUR` is the **two-point** space
`{+, −}` with `σ : + ↔ −`. Its Priestley order is the **antichain** (`le a b := a = b`):
`Spec(2)` is a single point, and doubling it by the swap gives two incomparable
points (`+` and `−` carry the two independent evidence coordinates). -/

/-- The two points of `Spec(FOUR)`: `+` (positive-evidence point) and `−`
(negative-evidence point). -/
inductive FourDual
  /-- The positive-evidence point `+`. -/
  | plus
  /-- The negative-evidence point `−`. -/
  | minus
  deriving DecidableEq, Repr

namespace FourDual

/-- The two points, enumerated. -/
def all : List FourDual := [plus, minus]

theorem mem_all (x : FourDual) : x ∈ all := by cases x <;> decide
/-- `Spec(FOUR)` has exactly two points. -/
theorem card_eq_two : all.length = 2 := rfl

/-- The Priestley order on `{+, −}`: the **antichain** `a ≤ b ⟺ a = b`. The two
evidence coordinates are independent, so the dual poset is discrete. -/
def le (a b : FourDual) : Prop := a = b

instance : DecidablePred (fun p : FourDual × FourDual => le p.1 p.2) :=
  fun p => decEq p.1 p.2

/-- The swap `σ : + ↔ −` — the bilattice negation on the dual side. -/
def sigma : FourDual → FourDual
  | plus => minus
  | minus => plus

@[simp] theorem sigma_plus : sigma plus = minus := rfl
@[simp] theorem sigma_minus : sigma minus = plus := rfl

theorem le_refl (a : FourDual) : le a a := rfl
theorem le_trans {a b c : FourDual} (h1 : le a b) (h2 : le b c) : le a c := by
  cases h1; exact h2
theorem le_antisymm {a b : FourDual} (h1 : le a b) (_ : le b a) : a = b := h1

/-- `σ` is involutive. -/
@[simp] theorem sigma_invol (a : FourDual) : sigma (sigma a) = a := by cases a <;> rfl
/-- `σ` is order-reversing — trivially, since the order is the antichain. -/
theorem sigma_order_reversing {a b : FourDual} (h : le a b) : le (sigma b) (sigma a) := by
  cases h; exact rfl

end FourDual

/-- **`FourDual` as a paired Priestley space.** The two-point antichain `{+, −}` with
swap `σ : + ↔ −` — the distinguished dual of `FOUR`, all `PairedPriestley` laws
proven by exhaustion. -/
def fourDualSpace : PairedPriestley where
  carrier := FourDual
  le := FourDual.le
  le_refl := FourDual.le_refl
  le_trans := FourDual.le_trans
  le_antisymm := FourDual.le_antisymm
  sigma := FourDual.sigma
  sigma_invol := FourDual.sigma_invol
  sigma_order_reversing := FourDual.sigma_order_reversing

/-! ## Clopen up-sets of `FourDual`

A clopen up-set of a finite Priestley space is just an up-set (everything is clopen
on a finite discrete space). On the **antichain** `{+, −}` every subset is upward
closed, so a clopen up-set is freely a membership pair `(plus ∈ ?, minus ∈ ?)`. We
model `ClopenUp FourDual := Bool × Bool = FourCorner`. The clopen-upset lattice is
the powerset Boolean algebra: meet `= ∩` (slotwise `&&`), join `= ∪` (slotwise `||`),
with `∅ = (false,false)` the bottom and `{+,−} = (true,true)` the top. -/

/-- A **clopen up-set** of `FourDual`, as its membership pair `(plus ∈ ?, minus ∈ ?)`.
On the two-point antichain this is the full powerset, so `ClopenUp = Bool × Bool`. -/
abbrev ClopenUp : Type := Bool × Bool

namespace ClopenUp

/-- Membership of a point in a clopen up-set. -/
def mem (U : ClopenUp) : FourDual → Bool
  | FourDual.plus => U.1
  | FourDual.minus => U.2

/-- Build a clopen up-set from a decidable membership predicate (read off the two
points). On the antichain every such predicate is upward closed, so this is total. -/
def ofMem (f : FourDual → Bool) : ClopenUp := (f FourDual.plus, f FourDual.minus)

@[simp] theorem mem_ofMem (f : FourDual → Bool) (x : FourDual) : mem (ofMem f) x = f x := by
  cases x <;> rfl
@[simp] theorem ofMem_mem (U : ClopenUp) : ofMem (mem U) = U := by
  obtain ⟨a, b⟩ := U; rfl

/-- The empty up-set `∅` — bottom of the clopen-upset lattice. -/
def bot : ClopenUp := (false, false)
/-- The full up-set `{+, −}` — top of the clopen-upset lattice. -/
def top : ClopenUp := (true, true)
/-- Meet `= ∩` of clopen up-sets (slotwise conjunction). -/
def meet (U V : ClopenUp) : ClopenUp := (U.1 && V.1, U.2 && V.2)
/-- Join `= ∪` of clopen up-sets (slotwise disjunction). -/
def join (U V : ClopenUp) : ClopenUp := (U.1 || V.1, U.2 || V.2)

/-- The `σ`-action on clopen up-sets: pull back along the swap, `(σ·U)(x) = U(σ x)`.
Since `σ : + ↔ −`, this **swaps the two slots**. -/
def sigmaAct (U : ClopenUp) : ClopenUp := ofMem (fun x => mem U (FourDual.sigma x))

/-- `σ`-action computed: it swaps the `plus`/`minus` membership slots. -/
@[simp] theorem sigmaAct_swap (U : ClopenUp) : sigmaAct U = (U.2, U.1) := by
  obtain ⟨a, b⟩ := U; rfl

/-- The clopen-upset lattice is a bounded distributive lattice (Boolean, in fact):
meet/join are commutative, associative, absorptive, with bounds `∅`/`{+,−}` — the
finite Priestley-dual lattice. (Recorded; proven by exhaustion.) -/
theorem lattice_laws :
    (∀ U V : ClopenUp, meet U V = meet V U)
      ∧ (∀ U V : ClopenUp, join U V = join V U)
      ∧ (∀ U : ClopenUp, meet bot U = bot)
      ∧ (∀ U : ClopenUp, join top U = top)
      ∧ (∀ U V : ClopenUp, meet U (join U V) = U)
      ∧ (∀ U V : ClopenUp, join U (meet U V) = U) := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩ <;>
    intro U <;> first
      | (intro V; obtain ⟨a, b⟩ := U; obtain ⟨c, d⟩ := V; cases a <;> cases b <;> cases c <;> cases d <;> rfl)
      | (obtain ⟨a, b⟩ := U; cases a <;> cases b <;> rfl)

end ClopenUp

/-! ## Finite Priestley duality for FOUR

`ClopenUp FourDual ≃ Charge`. The four clopen up-sets of the two-point dual are
exactly the four charges of `FOUR`:

| up-set `(plus∈?, minus∈?)` | charge       |
|----------------------------|--------------|
| `∅      = (false,false)`    | `⊥ₖ = kBot`  |
| `{+}    = (true, false)`    | `t  = tTop`  |
| `{−}    = (false,true )`    | `f  = tBot`  |
| `{+,−}  = (true, true )`    | `⊤ₖ = kTop`  |

We land in `Charge` through `FourCornerCell.cornerBij` (recall `FourCorner = Bool ×
Bool = ClopenUp`, and `cornerBij : Bij FourCorner Charge`). -/

/-- The forward map `ClopenUp FourDual → Charge`: read the membership pair as a
`(positive, negative)` slot pair (`plus ↦ positive`, `minus ↦ negative`). -/
def toCharge (U : ClopenUp) : Charge := FourCorner.toCorner U

/-- The inverse `Charge → ClopenUp FourDual`: read the charge's slot pair as
`(plus∈?, minus∈?)`. -/
def ofCharge (c : Charge) : ClopenUp := FourCorner.ofCorner c

/-- **Finite Priestley/Stone duality for FOUR.** `ClopenUp FourDual ≃ Charge`: the
four clopen up-sets of the two-point dual `{+, −}` ARE the four bilattice charges.
The bijection is `FourCornerCell.cornerBij` read on `ClopenUp = FourCorner`. -/
def four_priestley_dual : Bij ClopenUp Charge where
  to := toCharge
  inv := ofCharge
  left := fun U => FourCorner.ofCorner_toCorner U
  right := fun c => FourCorner.toCorner_ofCorner c

/-- The duality's table: the four clopen up-sets map to the four named charges. -/
theorem four_priestley_dual_table :
    four_priestley_dual.to ClopenUp.bot = Charge.kBot
      ∧ four_priestley_dual.to (true, false) = Charge.tTop
      ∧ four_priestley_dual.to (false, true) = Charge.tBot
      ∧ four_priestley_dual.to ClopenUp.top = Charge.kTop :=
  ⟨rfl, rfl, rfl, rfl⟩

/-! ## The swap σ is the ℤ/2 bilattice negation

`σ : + ↔ −` is an involution (the `ℤ/2` gauge generator `KleinFour.K4.neg`). Its
action on clopen up-sets swaps the two slots, which is exactly `Charge.negate`
transported across `four_priestley_dual`. Concretely:

>  `toCharge (σ · U) = Charge.negate (toCharge U)`     (`swap_induces_negate`)

`σ` swaps `(plus∈?, minus∈?)`; `negate` swaps `(pos, neg)`; under
`plus ↦ pos, minus ↦ neg` these coincide. -/

/-- **`swap_induces_negate`.** Transporting the `σ`-action on clopen up-sets across
the duality `four_priestley_dual` yields exactly `Charge.negate` — the swap on the
spatial side **is** the bilattice negation on the lattice side. -/
theorem swap_induces_negate (U : ClopenUp) :
    toCharge (ClopenUp.sigmaAct U) = Charge.negate (toCharge U) := by
  rw [ClopenUp.sigmaAct_swap]; obtain ⟨a, b⟩ := U; cases a <;> cases b <;> rfl

/-- `σ` on the dual side is the `ℤ/2` gauge generator `KleinFour.K4.neg`: its induced
lattice action equals that generator's action on `Charge`. -/
theorem swap_is_gauge_neg (U : ClopenUp) :
    toCharge (ClopenUp.sigmaAct U) = KleinFour.K4.act KleinFour.K4.neg (toCharge U) := by
  rw [ClopenUp.sigmaAct_swap]; obtain ⟨a, b⟩ := U; cases a <;> cases b <;> rfl

/-- **`swap_is_z2_negation`.** The swap `σ` is a `ℤ/2` involution AND induces the
bilattice negation `Charge.negate` on the Priestley dual lattice (transported across
`four_priestley_dual`):

* `σ ∘ σ = id` on `FourDual` (the `ℤ/2`), and its lattice action is self-inverse;
* `toCharge (σ · U) = Charge.negate (toCharge U)` (`swap_induces_negate`);
* `σ`'s action realizes the gauge generator `K4.neg`, whose square is `id`
  (`KleinFour.K4.mul_self K4.neg`).

This is the spatial-side witness of `Charge.negate_negate`: the bilattice negation
is the `ℤ/2` gauge of FOUR met on the dual `{+, −}`. -/
theorem swap_is_z2_negation :
    (∀ x : FourDual, FourDual.sigma (FourDual.sigma x) = x)
      ∧ (∀ U : ClopenUp, ClopenUp.sigmaAct (ClopenUp.sigmaAct U) = U)
      ∧ (∀ U : ClopenUp, toCharge (ClopenUp.sigmaAct U) = Charge.negate (toCharge U))
      ∧ (∀ U : ClopenUp,
          toCharge (ClopenUp.sigmaAct U) = KleinFour.K4.act KleinFour.K4.neg (toCharge U))
      ∧ KleinFour.K4.mul KleinFour.K4.neg KleinFour.K4.neg = KleinFour.K4.id := by
  refine ⟨FourDual.sigma_invol, ?_, swap_induces_negate, swap_is_gauge_neg,
    KleinFour.K4.mul_self KleinFour.K4.neg⟩
  intro U; rw [ClopenUp.sigmaAct_swap, ClopenUp.sigmaAct_swap]

/-! ## The pairwise-Stone reading: the bitopological `(τ₊, τ₋)` pair

`PStone ≅ Pries`: a pairwise Stone space is `(X, τ₊, τ₋)` and the order is recovered
from the two topologies. On the finite dual `{+, −}` the topology is discrete, so we
expose `τ₊` (the **up-set** family — opens generated by positive evidence) and `τ₋`
(the **down-set** family = `σ`-images of up-sets / complements — negative evidence).
On the antichain every subset is both an up-set and a down-set, so both families are
the full powerset `ClopenUp`, and the order is recovered as their common refinement
(`a ≤ b ⟺ every up-set containing a contains b`). We record this recovery. -/

/-- `τ₊` — the positive topology: the up-set (clopen-up) family. On the antichain,
the full powerset of `{+, −}`. -/
def tauPlus : List ClopenUp := [(false,false), (true,false), (false,true), (true,true)]

/-- `τ₋` — the negative topology: the down-set family, the `σ`-images of `τ₊`. On the
antichain it equals `τ₊` (every subset is both an up-set and a down-set). -/
def tauMinus : List ClopenUp := tauPlus.map ClopenUp.sigmaAct

/-- **Order recovery (`PStone ≅ Pries`).** The Priestley order on `{+, −}` is
recovered from `τ₊`: `a ≤ b ⟺ every clopen up-set containing `a` contains `b``. On
the two-point antichain both sides say `a = b`. -/
theorem order_recovered_from_tauPlus (a b : FourDual) :
    FourDual.le a b ↔ (∀ U : ClopenUp, ClopenUp.mem U a = true → ClopenUp.mem U b = true) := by
  constructor
  · intro h U hU; cases h; exact hU
  · intro h
    cases a <;> cases b
    · rfl
    · -- plus ≤ minus would need {+}=(true,false) to force minus ∈, contradiction
      have := h (true, false) rfl
      exact absurd this (by decide)
    · have := h (false, true) rfl
      exact absurd this (by decide)
    · rfl

end Stone
end RelMath
