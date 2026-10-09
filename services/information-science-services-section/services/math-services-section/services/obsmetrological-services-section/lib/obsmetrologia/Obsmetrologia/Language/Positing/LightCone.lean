import Obsmetrologia.Language.Positing.Four
import Obsmetrologia.Language.Positing.Gauge
import Obsmetrologia.Calculus.Logic.LinearLogicChu

/-!
# The light cone — FOUR as the 1+1 causal diamond in null coordinates

A reading is the pair of evidence bits `(pos, neg)`. Read the two bits as the two
**null coordinates** `(u, v)` of a two-dimensional Minkowski diamond. Then:

* the **knowledge order** `≤ₖ` is the product order on `(u, v)`, which is exactly
  the causal-future relation of 1+1 Minkowski space in null coordinates
  (`kle_iff_null`, `kle_iff_lightcone`: `|Δx| ≤ Δt`);
* the **truth order** `≤ₜ` raises `u` and lowers `v`: motion along the spacelike
  direction (`tle_iff_null`);
* **time** is `u + v`, the knowledge content `0, 1, 2`; **space** is `u − v`,
  in `{−1, 0, 1}` (`time`, `space`);
* `⊥` is the past tip and `⊤` the future tip (`kBot_past_tip`, `kTop_future_tip`);
  `t` and `f` are the two side vertices, at equal time, `≤ₖ`-incomparable and
  `≤ₜ`-comparable — **spacelike separated** (`tTop_tBot_spacelike`);
* **negation is parity** `P`: it fixes time and reverses space
  (`time_negate`, `space_negate`);
* **conflation is time reversal** `T`: it reflects time through the middle and
  fixes space (`time_conflate`, `space_conflate`);
* the Klein four group `K₄ = ⟨∼, −⟩` acts on the centred coordinates
  `(time − 1, space)` as the sign-change group `{1, P, T, PT}`, faithfully and
  multiplicatively (`act_centered`, `act_space`, `signs_injective`,
  `timeSign_mul`, `spaceSign_mul`);
* Chu duality on a FOUR-valued Chu space is the transpose composed with parity:
  it fixes every entry's time and reverses its space
  (`chu_dual_time`, `chu_dual_space`).

The monograph's "one diamond turned a quarter turn" is the change of coordinates
from null `(u, v)` to `(time, space)`. The external identification, stated here
and not formalized, is that `{1, P, T, PT}` is the component group of the
Lorentz group `O(1,1)`, and equally of `O(3,1)`: the gauge group of FOUR is the
discrete part of any Lorentzian symmetry group, compatible with `3+1` without
selecting the `3`.

Everything here is a finite statement about the four readings and the four gauge
elements; every declaration is axiom-free.
-/

namespace Obsmetrologia
namespace Reading

open Obsmetrologia.Positing.Gauge

/-! ## Null coordinates: time and space -/

/-- Time: the knowledge content `u + v`, how far along both null rays. -/
def time (a : Reading) : Nat := a.pos.toNat + a.neg.toNat

/-- Space: `u − v`, evidence for minus evidence against. -/
def space (a : Reading) : Int := (a.pos.toNat : Int) - (a.neg.toNat : Int)

@[simp] theorem time_kBot : time kBot = 0 := rfl
@[simp] theorem time_tTop : time tTop = 1 := rfl
@[simp] theorem time_tBot : time tBot = 1 := rfl
@[simp] theorem time_kTop : time kTop = 2 := rfl

@[simp] theorem space_kBot : space kBot = 0 := by decide
@[simp] theorem space_tTop : space tTop = 1 := by decide
@[simp] theorem space_tBot : space tBot = -1 := by decide
@[simp] theorem space_kTop : space kTop = 0 := by decide

/-- Time runs from the past tip to the future tip. -/
theorem time_le_two (a : Reading) : time a ≤ 2 := by cases a <;> decide

/-- A reading is its two coordinates. -/
theorem coords_injective (a b : Reading) (ht : time a = time b) (hx : space a = space b) :
    a = b := by
  revert ht hx; cases a <;> cases b <;> decide

/-! ## The knowledge order is the causal order in null coordinates -/

/-- **`≤ₖ` is the product order on the null coordinates**: each evidence bit may
only switch on. This is the causal-future relation of 1+1 Minkowski space
written in null coordinates. -/
theorem kle_iff_null (a b : Reading) :
    KLE a b ↔ ((a.pos = true → b.pos = true) ∧ (a.neg = true → b.neg = true)) := by
  cases a <;> cases b <;> decide

/-- **`≤ₜ` raises the for-ray and lowers the against-ray**: the spacelike order. -/
theorem tle_iff_null (a b : Reading) :
    TLE a b ↔ ((a.pos = true → b.pos = true) ∧ (b.neg = true → a.neg = true)) := by
  cases a <;> cases b <;> decide

/-- **The light cone.** `a ≤ₖ b` exactly when `b` lies in the future cone of `a`:
`|space b − space a| ≤ time b − time a`. -/
theorem kle_iff_lightcone (a b : Reading) :
    KLE a b ↔
      (space b - space a ≤ (time b : Int) - (time a : Int)
        ∧ space a - space b ≤ (time b : Int) - (time a : Int)) := by
  cases a <;> cases b <;> decide

/-- Time is monotone along the causal order. -/
theorem kle_time_mono (a b : Reading) (h : KLE a b) : time a ≤ time b := by
  revert h; cases a <;> cases b <;> decide

/-- `⊥` is the past tip: it precedes every reading. -/
theorem kBot_past_tip (a : Reading) : KLE kBot a := kBot_le a

/-- `⊤` is the future tip: every reading precedes it. -/
theorem kTop_future_tip (a : Reading) : KLE a kTop := le_kTop a

/-- The two null rays out of the past tip: `t` lies on the for-ray, `f` on the
against-ray. -/
theorem null_rays :
    (tTop.pos = true ∧ tTop.neg = false) ∧ (tBot.pos = false ∧ tBot.neg = true) := by
  decide

/-- **`t` and `f` are spacelike separated**: equal time, `≤ₖ`-incomparable in both
directions, and comparable in the spacelike order `≤ₜ`. -/
theorem tTop_tBot_spacelike :
    time tTop = time tBot ∧ ¬ KLE tTop tBot ∧ ¬ KLE tBot tTop ∧ TLE tBot tTop := by
  decide

/-! ## Parity and time reversal -/

/-- Negation fixes time. -/
@[simp] theorem time_negate (a : Reading) : time (negate a) = time a := by cases a <;> rfl

/-- **Negation is parity**: it reverses space. -/
@[simp] theorem space_negate (a : Reading) : space (negate a) = - space a := by
  cases a <;> decide

/-- **Conflation is time reversal**: it reflects time through the middle. -/
@[simp] theorem time_conflate (a : Reading) : time (conflate a) = 2 - time a := by
  cases a <;> rfl

/-- Conflation fixes space. -/
@[simp] theorem space_conflate (a : Reading) : space (conflate a) = space a := by
  cases a <;> decide

/-- `∼∘−` reverses time. -/
@[simp] theorem time_negConf (a : Reading) : time (negConf a) = 2 - time a := by
  cases a <;> rfl

/-- `∼∘−` reverses space. -/
@[simp] theorem space_negConf (a : Reading) : space (negConf a) = - space a := by
  cases a <;> decide

/-! ## `K₄` is the sign-change group `{1, P, T, PT}` -/

/-- Time centred at the middle of the diamond: `time − 1 ∈ {−1, 0, 1}`. -/
def centered (a : Reading) : Int := (time a : Int) - 1

/-- The sign each gauge element puts on centred time: `1` for `id` and `neg`
(parity), `−1` for `conf` and `negConf` (time reversal). -/
def timeSign : K4 → Int
  | K4.id => 1
  | K4.neg => 1
  | K4.conf => -1
  | K4.negConf => -1

/-- The sign each gauge element puts on space: `1` for `id` and `conf`, `−1` for
`neg` (parity) and `negConf`. -/
def spaceSign : K4 → Int
  | K4.id => 1
  | K4.neg => -1
  | K4.conf => 1
  | K4.negConf => -1

/-- The gauge acts on centred time by its time sign. -/
theorem act_centered (g : K4) (a : Reading) :
    centered (K4.act g a) = timeSign g * centered a := by
  cases g <;> cases a <;> decide

/-- The gauge acts on space by its space sign. -/
theorem act_space (g : K4) (a : Reading) :
    space (K4.act g a) = spaceSign g * space a := by
  cases g <;> cases a <;> decide

/-- The sign pattern of a gauge element. -/
def signs (g : K4) : Int × Int := (timeSign g, spaceSign g)

/-- **The action is faithful**: the four elements are the four sign patterns
`(1,1), (1,−1), (−1,1), (−1,−1)` — `1, P, T, PT`. -/
theorem signs_injective (g h : K4) (hgh : signs g = signs h) : g = h := by
  revert hgh; cases g <;> cases h <;> decide

/-- Group multiplication is multiplication of time signs. -/
theorem timeSign_mul (g h : K4) : timeSign (K4.mul g h) = timeSign g * timeSign h := by
  cases g <;> cases h <;> decide

/-- Group multiplication is multiplication of space signs. -/
theorem spaceSign_mul (g h : K4) : spaceSign (K4.mul g h) = spaceSign g * spaceSign h := by
  cases g <;> cases h <;> decide

/-- **The sign table of `K₄`.** Restates the four rows of `signs`, `timeSign` and `spaceSign`,
which are defined by cases above: the identity `(1, 1)`, negation `(1, -1)`, conflation
`(-1, 1)` and their composite `(-1, -1)`. It holds by definition (`decide` on the table). The
content that these signs are the action of `K₄` is `act_centered` and `act_space`; that the
action is faithful is `signs_injective`; that it is multiplicative is `timeSign_mul` and
`spaceSign_mul`. -/
theorem signs_table :
    signs K4.id = (1, 1) ∧ signs K4.neg = (1, -1)
      ∧ signs K4.conf = (-1, 1) ∧ signs K4.negConf = (-1, -1) := by
  decide

/-! ## Chu duality is the transpose composed with parity -/

/-- The dual Chu space reads every entry at the same time. -/
theorem chu_dual_time (C : ChuSpace) (x : C.sts) (a : C.pts) :
    time ((ChuSpace.dual C).r x a) = time (C.r a x) :=
  time_negate (C.r a x)

/-- The dual Chu space reads every entry with space reversed: Chu duality is the
space-for-time transpose composed with parity. -/
theorem chu_dual_space (C : ChuSpace) (x : C.sts) (a : C.pts) :
    space ((ChuSpace.dual C).r x a) = - space (C.r a x) :=
  space_negate (C.r a x)

end Reading
end Obsmetrologia
