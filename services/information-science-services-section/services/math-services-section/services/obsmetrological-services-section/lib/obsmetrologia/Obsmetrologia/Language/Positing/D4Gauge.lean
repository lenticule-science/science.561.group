import Obsmetrologia.Language.Positing.Gauge
import Obsmetrologia.Language.Positing.ChargeTactic
import Obsmetrologia.Language.Positing.OrderSwapDuality

/-!
# D4Gauge — D₄ = ⟨r, s ∣ r⁴ = s² = 1, srs = r⁻¹⟩ = Aut(FOUR; {≤ₖ, ≤ₜ})

`Positing.Gauge` packaged the Klein-four gauge `K₄ = {id, ∼, −, ∼∘−}` as a
first-class group object acting on `Charge`, and **explicitly deferred** the
dihedral extension. Its doc records:

> Adjoining the **order-swap involution** `σ` (swapping `≤ₖ ↔ ≤ₜ`) to the two
> commuting involutions `∼, −` lifts the Klein-four `K₄` to a **dihedral**
> symmetry `D₄` of the twist-product. This is **deferred**: it requires
> `OrderSwapDuality`'s `σ`, which is to be added in a later module.

`OrderSwapDuality` now exists, supplying `Charge.swap` (`σ⟨a,b⟩ = ⟨a, ¬b⟩`), the
involution `swap_swap`, and the cross-order isomorphism
`swap_kle_tle : KLE a b ↔ TLE (σ a)(σ b)` / `swap_tle_kle`. This module is the
**literal completion** of that deferred `D₄`.

## The eight elements

Number the charges `kBot = 1 = ⟨f,f⟩`, `tTop(=t) = 2 = ⟨t,f⟩`, `tBot(=f) = 3 = ⟨f,t⟩`,
`kTop = 4 = ⟨t,t⟩`. As permutations of `{1,2,3,4}` (the corners of the bilattice
square) the eight gauge symmetries are:

| element       | action                       | permutation   | type                 |
|---------------|------------------------------|---------------|----------------------|
| `id`          | `a`                          | `()`          | identity             |
| `neg`  (`∼`)  | `negate a`                   | `(2 3)`       | reflection (≤ₖ-axis) |
| `conf` (`−`)  | `conflate a`                 | `(1 4)`       | reflection (≤ₜ-axis) |
| `negConf`     | `Charge.negConf a`           | `(1 4)(2 3)`  | 180° rotation        |
| `swap` (`σ`)  | `Charge.swap a`              | `(1 3)(2 4)`  | diagonal reflection  |
| `negSwap`     | `negate (Charge.swap a)`     | `(1 2 4 3)`   | 90° rotation (ord 4) |
| `confSwap`    | `conflate (Charge.swap a)`   | `(1 3 4 2)`   | 270° rotation (ord 4)|
| `negConfSwap` | `Charge.negConf (Charge.swap a)` | `(1 2)(3 4)` | other diagonal       |

So `D₈ = K₄ ⊔ K₄·σ`: the four coset elements (those built with `σ`) are exactly
the **order-swapping** symmetries.

## The two headlines

* `d4_is_dihedral` — `D₈` is the dihedral group `D₄`: order 8, faithful action,
  group laws (assoc, two-sided `id`, inverses — the two rotations `negSwap`,
  `confSwap` mutually inverse, the rest self-inverse), the key dihedral relation
  `σ ∘ ∼ ∘ σ = −` (verified), the presentation `⟨r,s ∣ r⁴ = s² = 1, srs = r⁻¹⟩`
  with `r := negSwap`, and **non-abelian** (`negSwap ≠ confSwap`, so
  `neg·swap ≠ swap·neg`) — order 8 + an order-4 element + non-abelian pins the
  group to `D₄`.
* `d4_is_aut_four` — the semantic theorem `D₄ = Aut(FOUR; {≤ₖ, ≤ₜ})`: the `K₄`
  coset **preserves each order setwise** (`K4.neg_preserves_kle` etc.), the `σ`
  coset **exchanges `≤ₖ ↔ ≤ₜ`** (`Charge.swap_kle_tle`); hence `K₄` is the
  index-2 **normal** subgroup stabilizing the *ordered* pair `(≤ₖ, ≤ₜ)`, and the
  quotient `D₈/K₄ ≅ ℤ/2` is the bit "preserve vs swap the two orders." `D₄` is
  the stabilizer of the *unordered* pair `{≤ₖ, ≤ₜ}` — the full dihedral symmetry
  of the bilattice square.
-/

namespace Obsmetrologia
namespace D4

open Charge
open Positing.Gauge (K4)

/-! ## The carrier `D8` — the eight gauge symmetries of FOUR -/

/-- The dihedral gauge `D₄` as a first-class eight-element carrier:
`D₈ = K₄ ⊔ K₄·σ`. The first four (`id, neg, conf, negConf`) are the Klein-four
gauge `K₄`; the last four (`swap, negSwap, confSwap, negConfSwap`) are the
order-swapping coset `K₄·σ`. -/
inductive D8 where
  /-- The identity — `()`. -/
  | id
  /-- Negation `∼` — `negate`, reflection `(2 3)` across the `≤ₖ`-axis. -/
  | neg
  /-- Conflation `−` — `conflate`, reflection `(1 4)` across the `≤ₜ`-axis. -/
  | conf
  /-- `∼∘−` — `Charge.negConf`, the 180° rotation `(1 4)(2 3)`. -/
  | negConf
  /-- The order-swap `σ` — `Charge.swap`, diagonal reflection `(1 3)(2 4)`. -/
  | swap
  /-- `∼∘σ` — `negate ∘ swap`, the 90° rotation `(1 2 4 3)` (order 4). -/
  | negSwap
  /-- `−∘σ` — `conflate ∘ swap`, the 270° rotation `(1 3 4 2)` (order 4). -/
  | confSwap
  /-- `∼∘−∘σ` — `negConf ∘ swap`, the other diagonal reflection `(1 2)(3 4)`. -/
  | negConfSwap
  deriving DecidableEq, Repr, Inhabited

namespace D8

/-- The eight elements, enumerated. -/
def all : List D8 :=
  [id, neg, conf, negConf, swap, negSwap, confSwap, negConfSwap]

/-- Every element of `D₈` is in the enumeration. -/
theorem mem_all (g : D8) : g ∈ all := by
  charge
/-- `D₄` has exactly eight elements. -/
theorem card_eq_eight : all.length = 8 := rfl

/-! ## The action on `Charge`

Each symmetry acts by the corresponding `Four`/`OrderSwapDuality` map: the `K₄`
coset by `negate`/`conflate`/`negConf`, the `σ` coset by those post-composed with
`Charge.swap`. -/

/-- The action `D8 → Charge → Charge`. The `K₄` part reuses `Positing.Gauge.K4.act`'s
maps; the `σ` part post-composes with `Charge.swap`. -/
def act : D8 → Charge → Charge
  | D8.id,          a => a
  | D8.neg,         a => negate a
  | D8.conf,        a => conflate a
  | D8.negConf,     a => Charge.negConf a
  | D8.swap,        a => Charge.swap a
  | D8.negSwap,     a => negate (Charge.swap a)
  | D8.confSwap,    a => conflate (Charge.swap a)
  | D8.negConfSwap, a => Charge.negConf (Charge.swap a)

@[simp] theorem act_id (a : Charge) : act D8.id a = a := rfl
@[simp] theorem act_neg (a : Charge) : act D8.neg a = negate a := rfl
@[simp] theorem act_conf (a : Charge) : act D8.conf a = conflate a := rfl
@[simp] theorem act_negConf (a : Charge) : act D8.negConf a = Charge.negConf a := rfl
@[simp] theorem act_swap (a : Charge) : act D8.swap a = Charge.swap a := rfl
@[simp] theorem act_negSwap (a : Charge) :
    act D8.negSwap a = negate (Charge.swap a) := rfl
@[simp] theorem act_confSwap (a : Charge) :
    act D8.confSwap a = conflate (Charge.swap a) := rfl
@[simp] theorem act_negConfSwap (a : Charge) :
    act D8.negConfSwap a = Charge.negConf (Charge.swap a) := rfl

/-- The `K₄`-part of the `D₈` action agrees with `Positing.Gauge.K4.act` on the four
non-swap elements: `D₈` extends `K₄`, it does not redefine it. -/
theorem act_extends_K4 :
    (∀ a, act D8.id a = K4.act K4.id a)
      ∧ (∀ a, act D8.neg a = K4.act K4.neg a)
      ∧ (∀ a, act D8.conf a = K4.act K4.conf a)
      ∧ (∀ a, act D8.negConf a = K4.act K4.negConf a) :=
  ⟨fun _ => rfl, fun _ => rfl, fun _ => rfl, fun _ => rfl⟩

/-! ## Faithfulness — the eight actions are pairwise distinct

`D₈` acts **faithfully**: distinct group elements act as distinct permutations of
FOUR. It suffices to find, for each pair, a charge they disagree on; finite
exhaustion does this in one `decide`. -/

/-- **Faithful / order-8.** The eight `act`-images are pairwise distinct as
functions on `Charge`: any two distinct `D₈` elements disagree at some charge, so
`D₈` realizes eight distinct symmetries of FOUR. (Stated via a witness charge so
the disagreement is decidable.) -/
theorem faithful (g h : D8) (hgh : g ≠ h) : ∃ a : Charge, act g a ≠ act h a := by
  cases g <;> cases h <;>
    first
      | (exact absurd rfl hgh)
      | (exact ⟨kBot, by decide⟩)
      | (exact ⟨tTop, by decide⟩)
      | (exact ⟨tBot, by decide⟩)
      | (exact ⟨kTop, by decide⟩)

/-! ## The Cayley table (8×8)

`mul g h` is the element acting as `act g ∘ act h`. The table is read off the
permutation composition; `act_mul` below proves it realizes composition. -/

/-- The group multiplication — the 8×8 Cayley table of `D₄`. `mul g h` is the
element acting as `act g ∘ act h` ("do `h`, then `g`"). -/
def mul : D8 → D8 → D8
  | D8.id, D8.id => D8.id
  | D8.id, D8.neg => D8.neg
  | D8.id, D8.conf => D8.conf
  | D8.id, D8.negConf => D8.negConf
  | D8.id, D8.swap => D8.swap
  | D8.id, D8.negSwap => D8.negSwap
  | D8.id, D8.confSwap => D8.confSwap
  | D8.id, D8.negConfSwap => D8.negConfSwap
  | D8.neg, D8.id => D8.neg
  | D8.neg, D8.neg => D8.id
  | D8.neg, D8.conf => D8.negConf
  | D8.neg, D8.negConf => D8.conf
  | D8.neg, D8.swap => D8.negSwap
  | D8.neg, D8.negSwap => D8.swap
  | D8.neg, D8.confSwap => D8.negConfSwap
  | D8.neg, D8.negConfSwap => D8.confSwap
  | D8.conf, D8.id => D8.conf
  | D8.conf, D8.neg => D8.negConf
  | D8.conf, D8.conf => D8.id
  | D8.conf, D8.negConf => D8.neg
  | D8.conf, D8.swap => D8.confSwap
  | D8.conf, D8.negSwap => D8.negConfSwap
  | D8.conf, D8.confSwap => D8.swap
  | D8.conf, D8.negConfSwap => D8.negSwap
  | D8.negConf, D8.id => D8.negConf
  | D8.negConf, D8.neg => D8.conf
  | D8.negConf, D8.conf => D8.neg
  | D8.negConf, D8.negConf => D8.id
  | D8.negConf, D8.swap => D8.negConfSwap
  | D8.negConf, D8.negSwap => D8.confSwap
  | D8.negConf, D8.confSwap => D8.negSwap
  | D8.negConf, D8.negConfSwap => D8.swap
  | D8.swap, D8.id => D8.swap
  | D8.swap, D8.neg => D8.confSwap
  | D8.swap, D8.conf => D8.negSwap
  | D8.swap, D8.negConf => D8.negConfSwap
  | D8.swap, D8.swap => D8.id
  | D8.swap, D8.negSwap => D8.conf
  | D8.swap, D8.confSwap => D8.neg
  | D8.swap, D8.negConfSwap => D8.negConf
  | D8.negSwap, D8.id => D8.negSwap
  | D8.negSwap, D8.neg => D8.negConfSwap
  | D8.negSwap, D8.conf => D8.swap
  | D8.negSwap, D8.negConf => D8.confSwap
  | D8.negSwap, D8.swap => D8.neg
  | D8.negSwap, D8.negSwap => D8.negConf
  | D8.negSwap, D8.confSwap => D8.id
  | D8.negSwap, D8.negConfSwap => D8.conf
  | D8.confSwap, D8.id => D8.confSwap
  | D8.confSwap, D8.neg => D8.swap
  | D8.confSwap, D8.conf => D8.negConfSwap
  | D8.confSwap, D8.negConf => D8.negSwap
  | D8.confSwap, D8.swap => D8.conf
  | D8.confSwap, D8.negSwap => D8.id
  | D8.confSwap, D8.confSwap => D8.negConf
  | D8.confSwap, D8.negConfSwap => D8.neg
  | D8.negConfSwap, D8.id => D8.negConfSwap
  | D8.negConfSwap, D8.neg => D8.negSwap
  | D8.negConfSwap, D8.conf => D8.confSwap
  | D8.negConfSwap, D8.negConf => D8.swap
  | D8.negConfSwap, D8.swap => D8.negConf
  | D8.negConfSwap, D8.negSwap => D8.neg
  | D8.negConfSwap, D8.confSwap => D8.conf
  | D8.negConfSwap, D8.negConfSwap => D8.id

/-! ## The multiplication realizes composition

`act (g · h) = act g ∘ act h`, pointwise. This is the content making `D8` a
*group acting on FOUR*: each Cayley entry is forced to be composition of the
underlying `Charge` maps. -/

/-- **The action is a homomorphism.** `act (mul g h) a = act g (act h a)` — the
8×8 Cayley table is precisely composition of the `Charge` maps. Proven by
exhaustion over the 8·8·4 = 256 triples. -/
theorem act_mul (g h : D8) (a : Charge) : act (mul g h) a = act g (act h a) := by
  charge

/-! ## The group laws -/

/-- **Left identity.** -/
@[simp] theorem id_mul (g : D8) : mul D8.id g = g := by
  charge
/-- **Right identity.** -/
@[simp] theorem mul_id (g : D8) : mul g D8.id = g := by
  charge

/-- **Associativity** — by exhaustion over the 512 triples. -/
theorem mul_assoc (g h k : D8) : mul (mul g h) k = mul g (mul h k) := by
  charge

/-- The two-sided inverse of each element. The two order-4 rotations `negSwap` and
`confSwap` are **mutual** inverses; every other element is its own inverse. -/
def inv : D8 → D8
  | D8.id => D8.id
  | D8.neg => D8.neg
  | D8.conf => D8.conf
  | D8.negConf => D8.negConf
  | D8.swap => D8.swap
  | D8.negSwap => D8.confSwap
  | D8.confSwap => D8.negSwap
  | D8.negConfSwap => D8.negConfSwap

/-- **Left inverse.** `inv g · g = id`. -/
@[simp] theorem inv_mul (g : D8) : mul (inv g) g = D8.id := by
  charge
/-- **Right inverse.** `g · inv g = id`. -/
@[simp] theorem mul_inv (g : D8) : mul g (inv g) = D8.id := by
  charge

/-- **Closure.** Every product is again one of the eight — the table never leaves
`D8`. -/
theorem closure (g h : D8) : mul g h ∈ all := mem_all _

/-! ## The dihedral presentation ⟨r, s ∣ r⁴ = s² = 1, srs = r⁻¹⟩

Take the rotation `r := negSwap` (the 90°, order-4 element) and the reflection
`s := swap`. The Klein-four core is `K₄ = ⟨r², s·(…)⟩`; concretely `r² = negConf`.
-/

/-- The order-4 rotation generator `r := negSwap` (the 90° turn `(1 2 4 3)`). -/
def r : D8 := D8.negSwap
/-- The reflection generator `s := swap` (the diagonal `(1 3)(2 4)`). -/
def s : D8 := D8.swap

/-- `r² = negConf`, the 180° rotation — the central element shared with `K₄`. -/
theorem r_sq : mul r r = D8.negConf := rfl
/-- `r⁴ = id`: the rotation has order 4. -/
theorem r_pow_four : mul (mul r r) (mul r r) = D8.id := rfl
/-- `s² = id`: the reflection is an involution. -/
theorem s_sq : mul s s = D8.id := rfl
/-- **The dihedral relation** `s·r·s = r⁻¹`: conjugating the rotation by the
reflection inverts it (`= confSwap`, the 270° turn). This is the defining
non-abelian relation of `D₄`. -/
theorem s_r_s : mul (mul s r) s = inv r := rfl

/-- **The key check `σ ∘ ∼ ∘ σ = −`** (verified by hand, now by `Charge`):
`act swap (act neg (act swap a)) = act conf a`. The order-swap conjugate of
negation is conflation — the single non-trivial identity binding the `σ`-coset to
`K₄`, equivalently `s·neg·s = conf`. -/
theorem swap_neg_swap (a : Charge) :
    act D8.swap (act D8.neg (act D8.swap a)) = act D8.conf a := by
  charge

/-- The group-level form of the key check: `s · neg · s = conf` in `D₈`. -/
theorem s_neg_s : mul (mul s D8.neg) s = D8.conf := rfl

/-! ## Non-abelian — the group is `D₄`, not `ℤ/4 × ℤ/2` or `(ℤ/2)³`

`neg · swap = negSwap = (1 2 4 3)` but `swap · neg = confSwap = (1 3 4 2)`, and
these are distinct (mutually inverse) order-4 elements. So `D₈` is non-abelian.
Order 8 + an order-4 element (`r`) + non-abelian forces the group to be `D₄`. -/

/-- `neg · swap = negSwap` and `swap · neg = confSwap`, and these **differ** — the
two products do not commute. -/
theorem neg_swap_ne_swap_neg :
    mul D8.neg D8.swap = D8.negSwap ∧ mul D8.swap D8.neg = D8.confSwap
      ∧ D8.negSwap ≠ D8.confSwap :=
  ⟨rfl, rfl, by decide⟩

/-- **Non-abelian.** `D₈` is not commutative: `neg·swap ≠ swap·neg`. -/
theorem non_abelian : mul D8.neg D8.swap ≠ mul D8.swap D8.neg := by decide

/-! ## The order-effect dichotomy — preserve vs swap the two orders

The semantic heart of `D₄ = Aut(FOUR; {≤ₖ, ≤ₜ})`. The `K₄` coset keeps each order
in its own family (sending `≤ₖ`-relations to `≤ₖ`-relations and `≤ₜ` to `≤ₜ`, up
to each order's own direction); the `σ` coset **exchanges** the two. -/

/-- Membership in the `K₄` coset (the order-**preserving** elements): a `D₈`
element is `K₄`-type iff it is one of `id, neg, conf, negConf`. -/
def inK4 : D8 → Bool
  | D8.id | D8.neg | D8.conf | D8.negConf => true
  | _ => false

/-- The `σ`-coset complement (`K₄·σ`, the order-**swapping** elements): `swap,
negSwap, confSwap, negConfSwap`. -/
def inSwapCoset : D8 → Bool
  | D8.swap | D8.negSwap | D8.confSwap | D8.negConfSwap => true
  | _ => false

/-- Each element is in exactly one coset: `inK4 g` and `inSwapCoset g` partition
`D₈`. -/
theorem coset_partition (g : D8) : inK4 g = !inSwapCoset g := by
  charge

/-- **The `K₄` coset is a subgroup**: closed under `mul` (`K₄·K₄ = K₄`). -/
theorem inK4_closed (g h : D8) (hg : inK4 g = true) (hh : inK4 h = true) :
    inK4 (mul g h) = true := by
  charge

/-- **`K₄` is normal of index 2** — the coset-membership bit is a group
homomorphism `D₈ → ℤ/2`: `inSwapCoset (g·h) = inSwapCoset g XOR inSwapCoset h`.
A subgroup whose membership is the kernel of a homomorphism to `ℤ/2` is normal of
index 2. -/
theorem coset_hom (g h : D8) :
    inSwapCoset (mul g h) = (inSwapCoset g != inSwapCoset h) := by
  charge

/-! ### (a) The `K₄` coset preserves each order setwise

Reusing `Positing.Gauge.K4`'s order-effect lemmas: each preserves `≤ₖ` as a `≤ₖ`-fact
and `≤ₜ` as a `≤ₜ`-fact (never turning a knowledge-relation into a truth-relation).
-/

/-- `id` preserves **both** orders directly. -/
theorem id_preserves (a b : Charge) :
    (KLE (act D8.id a) (act D8.id b) ↔ KLE a b)
      ∧ (TLE (act D8.id a) (act D8.id b) ↔ TLE a b) :=
  ⟨Iff.rfl, Iff.rfl⟩

/-- `neg` keeps `≤ₖ` in the knowledge family and `≤ₜ` in the truth family
(preserving the former, reversing the latter) — restated from `K4`. -/
theorem neg_preserves_orders (a b : Charge) :
    (KLE (act D8.neg a) (act D8.neg b) ↔ KLE a b)
      ∧ (TLE (act D8.neg a) (act D8.neg b) ↔ TLE b a) :=
  ⟨K4.neg_preserves_kle a b, K4.neg_reverses_tle a b⟩

/-- `conf` keeps `≤ₖ` knowledge and `≤ₜ` truth (reversing the former, preserving
the latter). -/
theorem conf_preserves_orders (a b : Charge) :
    (KLE (act D8.conf a) (act D8.conf b) ↔ KLE b a)
      ∧ (TLE (act D8.conf a) (act D8.conf b) ↔ TLE a b) :=
  ⟨K4.conf_reverses_kle a b, K4.conf_preserves_tle a b⟩

/-- `negConf` reverses both orders but keeps each in its own family. -/
theorem negConf_preserves_orders (a b : Charge) :
    (KLE (act D8.negConf a) (act D8.negConf b) ↔ KLE b a)
      ∧ (TLE (act D8.negConf a) (act D8.negConf b) ↔ TLE b a) :=
  ⟨K4.negConf_reverses_kle a b, K4.negConf_reverses_tle a b⟩

/-! ### (b) The `σ` coset exchanges `≤ₖ ↔ ≤ₜ`

Reusing `Charge.swap_kle_tle`/`swap_tle_kle`: the four swap-elements turn
knowledge-relations into truth-relations. `negSwap`/`confSwap`/`negConfSwap`
chain a `K₄` map after `swap`, so each likewise exchanges the orders (composing
the swap with the `K₄` map's same-family effect). -/

/-- `swap` (`σ`) **exchanges** the two orders: a `≤ₖ`-relation becomes a
`≤ₜ`-relation on the images. The canonical order-swap. -/
theorem swap_exchanges (a b : Charge) :
    KLE (act D8.swap a) (act D8.swap b) ↔ TLE a b :=
  (swap_tle_kle a b).symm

/-- `negSwap` exchanges the orders: `≤ₖ` of its images is a `≤ₜ` fact of the
inputs (with the rotation's direction). -/
theorem negSwap_exchanges (a b : Charge) :
    KLE (act D8.negSwap a) (act D8.negSwap b) ↔ TLE a b := by
  charge

/-- `confSwap` exchanges the orders (with the reverse direction). -/
theorem confSwap_exchanges (a b : Charge) :
    KLE (act D8.confSwap a) (act D8.confSwap b) ↔ TLE b a := by
  charge

/-- `negConfSwap` exchanges the orders (with the reverse direction). -/
theorem negConfSwap_exchanges (a b : Charge) :
    KLE (act D8.negConfSwap a) (act D8.negConfSwap b) ↔ TLE b a := by
  charge

end D8

/-! ## `D₄` is the dihedral group of order 8 -/

open D8 (act mul inv r s all faithful card_eq_eight act_mul mul_assoc id_mul mul_id
  inv_mul mul_inv swap_neg_swap r_sq r_pow_four s_sq s_r_s non_abelian id_preserves
  neg_preserves_orders conf_preserves_orders negConf_preserves_orders swap_exchanges
  negSwap_exchanges confSwap_exchanges negConfSwap_exchanges inK4 inSwapCoset
  coset_partition inK4_closed coset_hom)

/-- **`Obsmetrologia.D4.d4_is_dihedral`** — `D₈` is the dihedral group `D₄`.

* **(a) faithful / order-8 + homomorphism**: the eight `act`-images are pairwise
  distinct (`faithful`), and `act` is a group homomorphism (`act_mul`);
* **(b) group laws**: associativity, two-sided identity `id`, two-sided inverses
  (`inv`, with `negSwap`/`confSwap` mutually inverse and the rest self-inverse);
* **(c) the dihedral relation / presentation**: the key check
  `σ ∘ ∼ ∘ σ = −` holds, and with `r := negSwap`, `s := swap` the standard
  presentation `r⁴ = s² = id`, `s·r·s = r⁻¹` holds (`K₄ = ⟨r², …⟩`);
* **(d) non-abelian**: `neg·swap = negSwap ≠ confSwap = swap·neg`, so the two
  order-4 elements are distinct mutual inverses — order 8 + an order-4 element +
  non-abelian pins the group to `D₄` (not `ℤ/4 × ℤ/2` or `(ℤ/2)³`). -/
theorem d4_is_dihedral :
    -- (a) faithful action by a homomorphism, on 8 distinct elements
    (∀ g h : D8, g ≠ h → ∃ a : Charge, act g a ≠ act h a)
      ∧ all.length = 8
      ∧ (∀ (g h : D8) (a : Charge), act (mul g h) a = act g (act h a))
    -- (b) group laws
      ∧ (∀ g h k : D8, mul (mul g h) k = mul g (mul h k))
      ∧ (∀ g : D8, mul D8.id g = g ∧ mul g D8.id = g)
      ∧ (∀ g : D8, mul (inv g) g = D8.id ∧ mul g (inv g) = D8.id)
    -- (c) the dihedral relation + presentation
      ∧ (∀ a : Charge, act D8.swap (act D8.neg (act D8.swap a)) = act D8.conf a)
      ∧ (mul r r = D8.negConf
          ∧ mul (mul r r) (mul r r) = D8.id
          ∧ mul s s = D8.id
          ∧ mul (mul s r) s = inv r)
    -- (d) non-abelian, via the two distinct mutually-inverse order-4 rotations
      ∧ (mul D8.neg D8.swap = D8.negSwap ∧ mul D8.swap D8.neg = D8.confSwap
          ∧ D8.negSwap ≠ D8.confSwap
          ∧ mul D8.neg D8.swap ≠ mul D8.swap D8.neg) :=
  ⟨faithful, card_eq_eight, act_mul,
   mul_assoc, fun g => ⟨id_mul g, mul_id g⟩, fun g => ⟨inv_mul g, mul_inv g⟩,
   swap_neg_swap,
   ⟨r_sq, r_pow_four, s_sq, s_r_s⟩,
   ⟨rfl, rfl, by decide, non_abelian⟩⟩

/-! ## `D₄ = Aut(FOUR; {≤ₖ, ≤ₜ})` -/

/-- **`Obsmetrologia.D4.d4_is_aut_four`** — the semantic theorem: `D₄` is the
automorphism group of FOUR equipped with the *unordered* pair of orders
`{≤ₖ, ≤ₜ}`.

* **(a)** every `K₄` element (`id, neg, conf, negConf`) **preserves each order
  setwise** — sending `≤ₖ`-relations to `≤ₖ`-relations and `≤ₜ` to `≤ₜ` (each up
  to its own direction), never exchanging the two; via `K4`'s order-effect lemmas;
* **(b)** every element of the `K₄·σ` coset (`swap, negSwap, confSwap,
  negConfSwap`) **exchanges `≤ₖ ↔ ≤ₜ`** — turning a knowledge-relation into a
  truth-relation; via `Charge.swap_kle_tle`;
* **(c)** hence the order-preserving elements form `K₄` as a **normal subgroup of
  index 2** (`inK4_closed`, and the coset bit `inSwapCoset` is a homomorphism
  `D₈ → ℤ/2` by `coset_hom`, so its kernel `K₄` is normal of index 2). `K₄` is the
  stabilizer of the **ordered** pair `(≤ₖ, ≤ₜ)`; `D₄` is the stabilizer of the
  **unordered** pair `{≤ₖ, ≤ₜ}`, and the quotient `D₈/K₄ ≅ ℤ/2` is exactly the
  bit "preserve the ordered pair vs swap it." -/
theorem d4_is_aut_four :
    -- (a) the K₄ coset preserves each order setwise (in its own family)
    (∀ a b : Charge,
        (KLE (act D8.id a) (act D8.id b) ↔ KLE a b)
          ∧ (TLE (act D8.id a) (act D8.id b) ↔ TLE a b))
      ∧ (∀ a b : Charge,
        (KLE (act D8.neg a) (act D8.neg b) ↔ KLE a b)
          ∧ (TLE (act D8.neg a) (act D8.neg b) ↔ TLE b a))
      ∧ (∀ a b : Charge,
        (KLE (act D8.conf a) (act D8.conf b) ↔ KLE b a)
          ∧ (TLE (act D8.conf a) (act D8.conf b) ↔ TLE a b))
      ∧ (∀ a b : Charge,
        (KLE (act D8.negConf a) (act D8.negConf b) ↔ KLE b a)
          ∧ (TLE (act D8.negConf a) (act D8.negConf b) ↔ TLE b a))
    -- (b) the σ coset exchanges ≤ₖ ↔ ≤ₜ
      ∧ (∀ a b : Charge, KLE (act D8.swap a) (act D8.swap b) ↔ TLE a b)
      ∧ (∀ a b : Charge, KLE (act D8.negSwap a) (act D8.negSwap b) ↔ TLE a b)
      ∧ (∀ a b : Charge, KLE (act D8.confSwap a) (act D8.confSwap b) ↔ TLE b a)
      ∧ (∀ a b : Charge, KLE (act D8.negConfSwap a) (act D8.negConfSwap b) ↔ TLE b a)
    -- (c) K₄ normal of index 2: cosets partition, K₄ closed, coset-bit is a hom to ℤ/2
      ∧ (∀ g : D8, inK4 g = !inSwapCoset g)
      ∧ (∀ g h : D8, inK4 g = true → inK4 h = true → inK4 (mul g h) = true)
      ∧ (∀ g h : D8, inSwapCoset (mul g h) = (inSwapCoset g != inSwapCoset h)) :=
  ⟨id_preserves, neg_preserves_orders, conf_preserves_orders, negConf_preserves_orders,
   swap_exchanges, negSwap_exchanges, confSwap_exchanges, negConfSwap_exchanges,
   coset_partition, inK4_closed, coset_hom⟩

end D4
end Obsmetrologia
