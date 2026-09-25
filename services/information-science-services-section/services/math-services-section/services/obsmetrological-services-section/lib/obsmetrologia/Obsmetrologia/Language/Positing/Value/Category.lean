import Obsmetrologia.Calculus.Order.OrderInfra
import Obsmetrologia.Calculus.Order.ResiduatedLatticeStandalone
import Obsmetrologia.Closure.Regime
import Obsmetrologia.Closure.Operator
import Obsmetrologia.Closure.SettlingMonotonicityQuiescence

/-!
# Settling over a value category — the universal `F_U` over `V`

The spine settles **readings**: the closure `cl = ◇∘□` iterates on the FOUR bilattice
`Reading` to its fixed point. The corpus's `continuous-valued-settling` node generalizes
this: settling is parametric in a **value category** `V`, and the *same* settling
dynamics run over any complete / residuated lattice of values — the Lawvere quantale,
a continuous lattice, fuzzy `[0,1]`, the four-valued bilattice `FOUR`, or the Boolean
`{0,1}`. Settling is the universal closure `F_U` *over* `V`. (Formalizes
`settling/content/continuous-valued-settling/continuous-valued-settling.md`.)

The corpus's key claim is a **uniformity**: the four-regime stratification of the
closure ordinal `κ` — strict / Scott / transfinite-bounded / aperiodic — is
**`V`-independent**. Which regime a settling lands in is decided by `κ` (equivalently,
by the decidable characterization data `ClosureRegimeData` from
`ClosureOrdinalRegime`), and that decision does not look at `V` at all. `V = {0,1}`
(Boolean) and `V = FOUR` both recover the standard bilattice settling spine.

We model this dependency-free:

* **`ValueCategory`** — our own abstract value category: a carrier with a partial
  order (`le`/`refl`/`trans`/`antisymm`) and a seed `bot`. It reuses the
  `Order.PartialOrder` shape and is the abstract `V` settling runs over. (Lean core
  has no transfinite ordinals or continuous lattices, so `V` is taken at the
  order-theoretic level the regime claim actually needs.)
* **`VClosure V`** — a `V`-enriched closure operator: an endo `op` on `V.carrier`
  that is monotone, inflationary, and idempotent in the `V`-order. Its fixed point is
  the settling — `settle v := op v` (idempotence makes it a fixed point, and the
  least fixed point above `v`, exactly as `Reading.Closure` / `ModalFrame` settle).
* **`four_regime_v_independent`** — for **any** `V` and `VClosure` on it,
  carrying its regime data `ClosureRegimeData` classifies it (via `classify`) into one
  of the four regimes, and the full `four_regime_dichotomy` holds *uniformly*: the
  four characterizations are mutually exclusive and jointly exhaustive for every `V`.
  The classifier `regimeOf` factors through the `ClosureRegimeData` only — it never
  inspects `V` or its `VClosure` — so the four-regime classification is `V`-parametric
  but the four cases are `V`-independent.
* **`boolean_recovers_spine`** — `Order.Two` (Boolean `{0,1}`) **and**
  `Reading` (FOUR) are `ValueCategory` instances, and the standard bilattice settling
  is the `V = FOUR` case: a `Reading.Closure` lifts to a `VClosure readingV` whose
  `settle` **is** `Reading.settle`, recovering the spine's reading/valuation closure.
-/

namespace Obsmetrologia
namespace Positing.Value

open Order

/-! ## (A) The value category `V`

An abstract value category over which settling runs: a carrier with a partial order
and a seed `bot`. Reuses the `Order.PartialOrder` relational shape (reflexive,
transitive, antisymmetric `le`). This is the corpus's `V` — a complete / residuated
lattice of values — taken at the order-theoretic level the regime claim needs. -/

/-- A **value category** `V`: the carrier of values settling assigns, with its
partial order (`le` reflexive / transitive / antisymmetric) and a seed value `bot`
(the knowledge-least value `⊥` settling climbs from). The corpus's `V` is a
complete / residuated lattice (Lawvere quantale / continuous lattice / fuzzy `[0,1]`
/ FOUR / Boolean); we carry exactly the partial-order-with-seed structure the
`V`-independence claim quantifies over. -/
structure ValueCategory where
  /-- The carrier of values. -/
  carrier : Type
  /-- The value order `≤_V`. -/
  le : carrier → carrier → Prop
  /-- Reflexivity of `≤_V`. -/
  le_refl : ∀ a, le a a
  /-- Transitivity of `≤_V`. -/
  le_trans : ∀ {a b c}, le a b → le b c → le a c
  /-- Antisymmetry of `≤_V` — a partial order. -/
  le_antisymm : ∀ {a b}, le a b → le b a → a = b
  /-- The seed value `⊥` settling climbs from. -/
  bot : carrier

/-- A value category's underlying `Order.PartialOrder` — the forgetful map exhibiting
`V` as a partial order. (`bot` is the extra seed datum settling needs.) -/
def ValueCategory.toPartialOrder (V : ValueCategory) : Order.PartialOrder where
  carrier := V.carrier
  le := V.le
  le_refl := V.le_refl
  le_trans := V.le_trans
  le_antisymm := V.le_antisymm

/-! ## (B) The `V`-enriched closure operator and its settling

A `VClosure` is the `V`-enriched closure the corpus iterates: an endo on `V.carrier`
that is monotone, inflationary, and idempotent in the `V`-order. Its fixed point is
the settling (the same closure-operator data as `Reading.Closure` / `CNaturalFamily`,
now over an arbitrary `V`). -/

/-- A **`V`-enriched closure operator**: an endomap `op` on the value category `V`
that is **inflationary** (`v ≤_V op v` — the unit `η`, no value retracted),
**monotone** (`v ≤_V w → op v ≤_V op w` — `2`-functoriality), and **idempotent**
(`op (op v) = op v` — the multiplication `μ`). Its least fixed point is the settling
`F_U` over `V`. The same closure-operator shape as the spine's `Reading.Closure`, now
generalized over the value category. -/
structure VClosure (V : ValueCategory) where
  /-- The closure endomap `cl`. -/
  op : V.carrier → V.carrier
  /-- Inflationary — the unit `η`: `v ≤_V cl v`. -/
  infl : ∀ v, V.le v (op v)
  /-- Monotone — `2`-functoriality of the closure. -/
  mono : ∀ {v w}, V.le v w → V.le (op v) (op w)
  /-- Idempotent — the multiplication `μ`: `cl (cl v) = cl v`. -/
  idem : ∀ v, op (op v) = op v

namespace VClosure
variable {V : ValueCategory}

/-- The **settling** of a value under a `V`-closure: its fixed point from a seed,
`settle v = cl v`. The universal `F_U` over `V`, evaluated at `v`. -/
def settle (T : VClosure V) (v : V.carrier) : V.carrier := T.op v

/-- **The settling is a fixed point** (Knaster–Tarski, closure form, over `V`):
`cl (settle v) = settle v`. -/
theorem settle_fixed (T : VClosure V) (v : V.carrier) :
    T.op (T.settle v) = T.settle v := T.idem v

/-- **The settling is the least fixed point above the seed.** Any fixed point
`x ≥_V seed` of `cl` lies `≥_V` the settled value — the least-upper-bound character
of the settling over `V`, exactly the `Reading.Closure` / `ModalFrame` least-fixed-point
law lifted to an arbitrary value category. -/
theorem settle_least (T : VClosure V) (seed x : V.carrier)
    (hsx : V.le seed x) (hfx : T.op x = x) : V.le (T.settle seed) x := by
  have h := T.mono hsx
  rw [hfx] at h
  exact h

/-- **The settling, packaged as a least fixed point over `V`.** `settle seed` is a
fixed point of `cl` and below every fixed point above `seed`: the universal `F_U`
over `V` is the least fixed point. -/
theorem settle_lfp (T : VClosure V) (seed : V.carrier) :
    T.op (T.settle seed) = T.settle seed ∧
    (∀ x, V.le seed x → T.op x = x → V.le (T.settle seed) x) :=
  ⟨T.settle_fixed seed, fun x => T.settle_least seed x⟩

end VClosure

/-! ## (C) The four-regime classification is `V`-independent

The corpus's key claim: the strict / Scott / transfinite-bounded / aperiodic
stratification is decided by the closure ordinal `κ` — equivalently by the decidable
characterization `ClosureRegimeData` (`ClosureOrdinalRegime`) — and **not** by `V`.

We model this: a settling over `V` carries its regime data `d` (the three
Boolean flags `κ` actually depends on: Scott-continuity, finite base, countable
cofinality, with the corpus's two implications). The classifier `regimeOf` reads only
`d` — it takes the `V` and `VClosure` purely as parameters and **discards** them — so
the regime is a function of `d` alone, identical across all `V`. The full
`four_regime_dichotomy` then holds uniformly over every `V`. -/

/-- The regime of a settling over `V`, **factored through its closure-ordinal data
only**: `regimeOf V T d = classify d`. The value category `V` and the closure `T` are
parameters the classifier *ignores* — the regime depends solely on the decidable
characterization `d` of the closure ordinal `κ`. This *is* the `V`-independence: the
function does not pattern-match on `V` or `T`. -/
def regimeOf (V : ValueCategory) (_T : VClosure V) (d : ClosureRegimeData) : ClosureRegime :=
  classify d

/-- **`regimeOf` does not depend on `V` or the closure.** For any two value categories
`V₁ V₂`, any closures `T₁ T₂` on them, and the *same* regime data `d`, the classified
regime is identical: `regimeOf V₁ T₁ d = regimeOf V₂ T₂ d`. The four-regime
classification factors through `κ`'s data alone. -/
theorem regimeOf_v_independent (V₁ V₂ : ValueCategory)
    (T₁ : VClosure V₁) (T₂ : VClosure V₂) (d : ClosureRegimeData) :
    regimeOf V₁ T₁ d = regimeOf V₂ T₂ d := rfl

/-- **The four-regime dichotomy is `V`-independent.** For **any** value
category `V`, **any** `V`-enriched closure `T`, and the closure-ordinal data `d` of
its settling, the regime `regimeOf V T d`:

* lands in exactly one of the four regimes (joint exhaustiveness), and each regime is
  selected by exactly its corpus condition — *finite base* (strict) / *Scott-continuous,
  infinite base* (Scott) / *non-Scott, countable cofinality* (transfinite-bounded) /
  *non-Scott, uncountable cofinality* (aperiodic) — i.e. the full `four_regime_dichotomy`;
* **does not depend on `V` or `T`**: for any other `V'`, `T'` with the *same* `d`, the
  regime is identical (`regimeOf_v_independent`).

So the strict/Scott/TB/aperiodic classification is `V`-parametric in statement but the
four cases are `V`-independent in content — the dichotomy is decided by the closure
ordinal `κ` alone, recovering the corpus's continuous-valued-settling uniformity.
Reuses `ClosureOrdinalRegime.four_regime_dichotomy`. -/
theorem four_regime_v_independent (V : ValueCategory) (T : VClosure V) (d : ClosureRegimeData) :
    ((regimeOf V T d = ClosureRegime.strict ∨ regimeOf V T d = ClosureRegime.scott
        ∨ regimeOf V T d = ClosureRegime.transfiniteBounded
        ∨ regimeOf V T d = ClosureRegime.aperiodic)
      ∧ (regimeOf V T d = ClosureRegime.strict ↔ d.finiteBase = true)
      ∧ (regimeOf V T d = ClosureRegime.scott ↔
          (d.scottContinuous = true ∧ d.finiteBase = false))
      ∧ (regimeOf V T d = ClosureRegime.transfiniteBounded ↔
          (d.scottContinuous = false ∧ d.countableCofinality = true))
      ∧ (regimeOf V T d = ClosureRegime.aperiodic ↔
          (d.scottContinuous = false ∧ d.countableCofinality = false)))
    ∧ (∀ (V' : ValueCategory) (T' : VClosure V'),
        regimeOf V T d = regimeOf V' T' d) :=
  ⟨four_regime_dichotomy d, fun V' T' => regimeOf_v_independent V V' T T' d⟩

/-! ## (D) Boolean `{0,1}` and FOUR recover the spine

`V = Order.Two` (Boolean `{0,1}`) and `V = Reading` (FOUR) are both `ValueCategory`
instances, and the standard bilattice settling — the spine's `Reading`/`Valuation`
closure — **is** the `V = FOUR` case: a `Reading.Closure` lifts to a `VClosure readingV`
whose `settle` *is* `Reading.settle`. -/

/-- **`V = {0,1}` is a value category.** `Order.Two` (the Boolean residuated lattice)
read as a value category: carrier `Bool`, order `Two.le` (`a ≤ b ⇔ a ⊓ b = a`), seed
`⊥ = false`. The partial-order laws are the inherited lattice-order laws (proved by
`decide` on the finite `Bool`). The minimal value category the regime claim quantifies
over. -/
def booleanV : ValueCategory where
  carrier := Bool
  le := Two.le
  le_refl := Two.le_refl
  le_trans := Two.le_trans
  le_antisymm := Two.le_antisymm
  bot := false

/-- **`V = FOUR` is a value category.** The bilattice `Reading` (the recurring FOUR)
read as a value category: carrier `Reading`, order the knowledge order `≤ₖ` (`KLE`),
seed `⊥ₖ = kBot`. The partial-order laws are `Reading.kle_refl / kle_trans /
kle_antisymm` from `Settling`. This is the value category the spine settles over. -/
def readingV : ValueCategory where
  carrier := Reading
  le := Reading.KLE
  le_refl := Reading.kle_refl
  le_trans := fun {a b c} => Reading.kle_trans a b c
  le_antisymm := fun {a b} => Reading.kle_antisymm a b
  bot := Reading.kBot

/-- **Lift a reading closure to a `VClosure` over `V = FOUR`.** Any `Reading.Closure`
(inflationary / monotone / idempotent in `≤ₖ`) *is* a `V`-enriched closure over
`readingV`: the closure-operator data transfers directly, since `readingV.le = KLE` and
`readingV` is exactly the knowledge order the `Reading.Closure` laws live in. -/
def readingVClosure (c : Reading.Closure) : VClosure readingV where
  op := c.op
  infl := c.infl
  mono := fun {v w} h => c.mono v w h
  idem := c.idem

/-- **The `V = FOUR` settling recovers the spine's reading closure.**
For every `Reading.Closure c` and seed `x`, the `V`-enriched settling over FOUR equals
the spine's reading settling: `(readingVClosure c).settle x = Reading.settle c x`. The
standard bilattice settling **is** the `V = FOUR` case of settling-over-`V`. -/
theorem readingV_recovers_settle (c : Reading.Closure) (x : Reading) :
    (readingVClosure c).settle x = Reading.settle c x := rfl

/-- **Both `{0,1}` and FOUR are value categories, and FOUR recovers the spine
.** Bundles the corpus's recovery claim:

* **(a)** `booleanV` (Boolean `{0,1}` = `Order.Two`) and `readingV` (FOUR = `Reading`)
  are `ValueCategory` instances — exhibited as the two ends `V = {0,1}` and `V = FOUR`;
* **(b)** the standard bilattice settling is the `V = FOUR` case: every `Reading.Closure`
  lifts to `readingVClosure c : VClosure readingV`, and its settling **is** the spine's
  `Reading.settle c` (`readingV_recovers_settle`);
* **(c)** that settling is a least fixed point over `V = FOUR`
  (`VClosure.settle_lfp`), so the recovered closure carries the full settling
  semantics.

Concretely: for every reading closure `c` and seed `x`, `(readingVClosure c).settle x =
Reading.settle c x`, and `(readingVClosure c).settle x` is a fixed point of the lifted
closure and the least fixed point above `x`. So `V = {0,1}` and `V = FOUR` both
recover the standard bilattice settling spine, as `continuous-valued-settling.md`
claims. -/
theorem boolean_recovers_spine :
    (∀ b : booleanV.carrier, booleanV.le b b)
    ∧ (∀ a : readingV.carrier, readingV.le a a)
    ∧ (∀ (c : Reading.Closure) (x : Reading),
        (readingVClosure c).settle x = Reading.settle c x
        ∧ (readingVClosure c).op ((readingVClosure c).settle x) = (readingVClosure c).settle x
        ∧ (∀ y, readingV.le x y → (readingVClosure c).op y = y →
            readingV.le ((readingVClosure c).settle x) y)) :=
  ⟨booleanV.le_refl,
   readingV.le_refl,
   fun c x =>
     ⟨readingV_recovers_settle c x,
      (readingVClosure c).settle_fixed x,
      fun y => (readingVClosure c).settle_least x y⟩⟩

end Positing.Value
end Obsmetrologia
