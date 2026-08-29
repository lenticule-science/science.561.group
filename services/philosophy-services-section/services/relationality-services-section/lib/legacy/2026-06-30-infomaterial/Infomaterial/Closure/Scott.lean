import Infomaterial.Closure.Regime
import Infomaterial.Closure.Operator
import Infomaterial.Calculus.Order.OrderInfra

/-!
# Scott-continuous closure — the ω-regime as commutation with directed joins

`ClosureOrdinalRegime` stratified the closure ordinal `κ` into the FOUR regimes at the
boundaries `ω`, `ω₁`, carrying *Scott-continuity* as one decidable Boolean flag of a
`ClosureRegimeData`. This module makes that flag's **mathematical content** first-class,
faithful to the corpus node
`content/mark/.../predication-fiber-algebra/content/closure-operator/content/scott-continuous-closure/scott-continuous-closure.md`:

> A closure-operator component `cl_p : A_p → A_p` on a predication fiber algebra is
> **Scott-continuous** in the knowledge order if for every `≤ₖ`-directed subset
> `S ⊆ A_p`,  `cl_p(⋁ₖ S) = ⋁ₖ {cl_p(x) : x ∈ S}`.
> Scott-continuity arises when inference rules have **finite antecedents** (each rule
> fires on a join iff it fires on some finite sub-join). Fitting's logic-programming
> closure and description-logic TBox closures are Scott-continuous; infinitary-antecedent
> quantifier closures (`∀x∈E` over infinite `E`) are not.

As `ClosureOrdinal` already does for `κ` (and `Closure.Ordinal` builds the genuine ordinal),
we model the corpus's structure here over the **finite charge lattice**
`Charge` (the `≤ₖ` complete lattice of `Settling`/`OrderInfra`). A `≤ₖ`-directed subset is
modelled concretely as a **nonempty, pairwise-upper-bounded list** `DirectedFamily`; its
`⋁ₖ`-join is `sup = foldr joinK ⊥ₖ`. We prove:

* `DirectedFamily.sup_mem` — over the finite carrier, every directed family **attains** its
  join: `sup L ∈ L`. This is the honest finite-carrier content of directedness (a directed
  finite set has a greatest element), and the engine of everything below.
* `IsScottContinuous` (the corpus equation) — `c.op (sup S) = sup (S.map c.op)` for every
  directed `S`; and `finite_scott_continuous` proving **every** charge-closure satisfies it,
  because the join is attained (`sup_mem`) so both sides equal `c.op` of the family's
  maximum. Over a finite carrier Scott-continuity is automatic — recovering the strict
  regime (`κ ≤ 3`).
* `scott_continuous_iff_omega_regime` — ties the equation back to
  `ClosureOrdinalRegime`: a Scott-continuous closure's regime data classifies to `strict`
  or `scott` (the two regimes with `κ ≤ ω`, equivalently the cohomology-vanishing regimes),
  and never to the non-Scott `transfiniteBounded`/`aperiodic` strata; the finite charge
  closure lands in `strict`, witnessed by `Charge.settles_by_three`.
* `finite_antecedent_scott_continuous` — models a **finite-antecedent** firing
  operator (fire to `kTop` exactly when a fixed finite antecedent set is `≤ₖ`-covered by the
  input) and proves it commutes with directed joins, because the rule fires on `⋁ₖ S` iff it
  fires on some member of the directed `S` (the finite antecedent is covered by the attained
  maximum). This is the corpus's mechanism ("fires on a join iff on a finite sub-join").
-/

namespace Infomaterial.Closure.Scott

open Infomaterial
open Infomaterial.Charge

/-! ## (A) The `⋁ₖ`-join of a finite family

The join of a list of charges in the `≤ₖ` order — the directed-set supremum modelled over
the finite carrier. `sup [] = ⊥ₖ` (the seed), `sup (a :: L) = a ∨ₖ sup L`. -/

/-- The `≤ₖ`-supremum of a list of charges: `foldr` of the knowledge join `∨ₖ` over the
seed `⊥ₖ`. This is the `⋁ₖ S` of the corpus equation, with `S` enumerated as a list. -/
def sup : List Charge → Charge
  | [] => kBot
  | a :: L => joinK a (sup L)

@[simp] theorem sup_nil : sup [] = kBot := rfl
@[simp] theorem sup_cons (a : Charge) (L : List Charge) : sup (a :: L) = joinK a (sup L) := rfl

/-- Every member of a list is `≤ₖ` its `sup`: `sup L` is an **upper bound** of `L`. -/
theorem le_sup {a : Charge} : ∀ {L : List Charge}, a ∈ L → KLE a (sup L)
  | b :: L, h => by
    rcases List.mem_cons.mp h with h | h
    · subst h; exact le_joinK_left a (sup L)
    · exact kle_trans _ _ _ (le_sup h) (le_joinK_right b (sup L))

/-- `sup L` is the **least** upper bound: any `c` that bounds every member of `L` bounds
`sup L`. (`⊥ₖ ≤ c` seeds the empty case.) -/
theorem sup_le {c : Charge} : ∀ {L : List Charge}, (∀ a ∈ L, KLE a c) → KLE (sup L) c
  | [], _ => kBot_le c
  | a :: _, h =>
    joinK_le _ _ _ (h a (List.mem_cons_self ..))
      (sup_le (fun x hx => h x (List.mem_cons_of_mem a hx)))

/-- Mapping a **monotone** map over a list sends its `sup` below the map's value at the
`sup`: `sup (L.map f) ≤ₖ f (sup L)`. (One half of Scott-continuity, holding for any
monotone `f`; the other half needs the join to be *attained*.) -/
theorem sup_map_le {f : Charge → Charge} (hf : ∀ {x y}, KLE x y → KLE (f x) (f y))
    (L : List Charge) : KLE (sup (L.map f)) (f (sup L)) := by
  apply sup_le
  intro b hb
  rcases List.mem_map.mp hb with ⟨x, hx, rfl⟩
  exact hf (le_sup hx)

/-! ## (B) `≤ₖ`-directed families over the finite carrier

A directed subset, modelled concretely: a **nonempty** list whose every two members have a
common upper bound *inside the list*. Over the finite charge carrier this concrete
directedness is enough to prove the corpus equation, because a directed finite family
**attains** its join (`sup_mem`). -/

/-- A `≤ₖ`-**directed family**: a nonempty list of charges in which every two members have a
common upper bound that is itself a member. The finite-carrier model of a directed subset
`S ⊆ A_p` in the knowledge order. -/
structure DirectedFamily where
  /-- The enumerated members of the directed subset. -/
  elems : List Charge
  /-- Directed subsets are nonempty (so the join is of an inhabited set). -/
  nonempty : elems ≠ []
  /-- Directedness: any two members are `≤ₖ`-bounded above by a member of the family. -/
  directed : ∀ a ∈ elems, ∀ b ∈ elems, ∃ c ∈ elems, KLE a c ∧ KLE b c

namespace DirectedFamily

/-- The `⋁ₖ`-join of a directed family. -/
def sup (S : DirectedFamily) : Charge := Infomaterial.Closure.Scott.sup S.elems

/-- **The join of any finite enumerated sub-family is bounded by a member.** For a list `sub`
all of whose entries lie in the directed family `S`, the join `sup sub` is `≤ₖ` some member of
`S`. Proven by induction on `sub`: directedness folds the running join and the next entry into
a single bounding member (`a ≤ c`, `sup sub ≤ c'≤ c`). This is the corpus's "fires on a finite
sub-join iff on a single member" at the level of joins. -/
theorem sup_sub_le (S : DirectedFamily) :
    ∀ (sub : List Charge), sub ≠ [] → (∀ x ∈ sub, x ∈ S.elems) →
      ∃ c ∈ S.elems, KLE (Infomaterial.Closure.Scott.sup sub) c := by
  intro sub
  induction sub with
  | nil => intro h; exact absurd rfl h
  | cons a sub ih =>
    intro _ hsub
    have ha : a ∈ S.elems := hsub a (List.mem_cons_self ..)
    cases hsub2 : sub with
    | nil =>
      -- `sup [a] = joinK a ⊥ₖ`; `a` itself bounds it.
      refine ⟨a, ha, ?_⟩
      subst hsub2
      show KLE (joinK a (Infomaterial.Closure.Scott.sup [])) a
      exact joinK_le _ _ _ (kle_refl a) (kBot_le a)
    | cons b sub' =>
      subst hsub2
      obtain ⟨c₁, hc₁, hsubc₁⟩ := ih (by simp) (fun x hx => hsub x (List.mem_cons_of_mem a hx))
      obtain ⟨c, hc, hac, hc₁c⟩ := S.directed a ha c₁ hc₁
      exact ⟨c, hc, joinK_le _ _ _ hac (kle_trans _ _ _ hsubc₁ hc₁c)⟩

/-- **The join of a directed family is attained** — `sup S ∈ S`. Over the finite charge
carrier, a `≤ₖ`-directed family has a greatest member, and that member *is* the join: every
member is `≤ₖ sup S` (`le_sup`); and `sup_sub_le` (applied to the whole family) folds the
family into a single member `c` with `sup S ≤ₖ c`. `≤ₖ`-antisymmetry then identifies `c` with
`sup S`, so the join is a member. This attainment is the honest finite-carrier content of
directedness. -/
theorem sup_mem (S : DirectedFamily) : S.sup ∈ S.elems := by
  obtain ⟨c, hc, hsupc⟩ := S.sup_sub_le S.elems S.nonempty (fun _ h => h)
  show Infomaterial.Closure.Scott.sup S.elems ∈ S.elems
  have heq : Infomaterial.Closure.Scott.sup S.elems = c := kle_antisymm _ _ hsupc (le_sup hc)
  rw [heq]; exact hc

end DirectedFamily

/-! ## (C) Scott-continuity of a charge-closure

The corpus equation `cl(⋁ₖ S) = ⋁ₖ {cl(x) : x ∈ S}` for the finite-carrier directed `S`. -/

/-- **Scott-continuity** (the corpus equation). A charge-closure `c` is Scott-continuous iff,
for every `≤ₖ`-directed family `S`, applying `c.op` commutes with the directed join:
`c.op (⋁ₖ S) = ⋁ₖ {c.op x : x ∈ S}`. -/
def IsScottContinuous (c : Charge.Closure) : Prop :=
  ∀ S : DirectedFamily, c.op (sup S.elems) = sup (S.elems.map c.op)

/-- **Every charge-closure is Scott-continuous (finite carrier).** The directed join is
*attained* (`DirectedFamily.sup_mem`): `sup S = m` for a member `m`. Then `c.op (sup S) =
c.op m`, and `c.op m ∈ S.map c.op` with `c.op x ≤ₖ c.op m` for all members (monotone), so
the right-hand join also equals `c.op m`. Over a finite carrier Scott-continuity is automatic
— the strict regime. -/
theorem finite_scott_continuous (c : Charge.Closure) : IsScottContinuous c := by
  intro S
  have hmem : sup S.elems ∈ S.elems := S.sup_mem
  apply kle_antisymm
  · -- `c.op (sup S) = c.op m ≤ sup (map c.op)` since `c.op m` is a member of the mapped list.
    have : c.op (sup S.elems) ∈ S.elems.map c.op := List.mem_map.mpr ⟨_, hmem, rfl⟩
    exact le_sup this
  · -- `sup (map c.op) ≤ c.op (sup S)` since `c.op` is monotone (the general half).
    exact sup_map_le (fun {x y} h => c.mono x y h) S.elems

/-! ## (D) Scott-continuity ⟺ the ω-regime

Tie to `ClosureOrdinalRegime`: a Scott-continuous closure's regime data is classified to a
`κ ≤ ω` stratum (strict or scott), never to the non-Scott `transfiniteBounded`/`aperiodic`.
For the finite charge carrier this is the **strict** regime, whose `κ ≤ 3` is
`Charge.settles_by_three`. -/

/-- The regime data of a closure carrying a Scott-continuity verdict. We record the verdict
as the `scottContinuous` flag; the finite charge carrier additionally forces `finiteBase`,
discharging the corpus constraints. -/
def regimeData (scott finite cof : Bool)
    (hsf : finite = true → scott = true) (hcf : finite = true → cof = true) :
    ClosureRegimeData where
  scottContinuous := scott
  finiteBase := finite
  countableCofinality := cof
  fin_scott := hsf
  fin_cof := hcf

/-- A Scott-continuous regime datum (over an arbitrary base) **never** classifies to the
non-Scott strata: `classify d ≠ transfiniteBounded` and `≠ aperiodic`. Both non-Scott regimes
require `scottContinuous = false` (`classify_transfiniteBounded`/`classify_aperiodic`), so a
`scottContinuous = true` datum is excluded from them. -/
theorem scott_excludes_nonscott (d : ClosureRegimeData) (h : d.scottContinuous = true) :
    classify d ≠ ClosureRegime.transfiniteBounded ∧ classify d ≠ ClosureRegime.aperiodic := by
  constructor
  · intro hc
    have := (classify_transfiniteBounded d).mp hc
    rw [h] at this; exact Bool.noConfusion this.1
  · intro hc
    have := (classify_aperiodic d).mp hc
    rw [h] at this; exact Bool.noConfusion this.1

/-- **Scott-continuity ⟺ the ω-regime.** A regime datum lands in a `κ ≤ ω`
stratum — `strict` or `scott`, equivalently the cohomology-vanishing regimes
(`cohomologyVanishes (classify d) = true`) — **iff** it is Scott-continuous. Forward: a
`κ ≤ ω` classification is `strict` (forces `finiteBase`, hence `scottContinuous` by the corpus
constraint) or `scott` (carries `scottContinuous` directly). Backward: a Scott-continuous
datum is excluded from the two non-Scott strata (`scott_excludes_nonscott`), so by the
four-regime dichotomy it lands in `strict` or `scott`. This is the corpus dichotomy's
"Scott-continuity ⟹ stabilization at the ω-limit ⟹ κ = ω (or below)". -/
theorem scott_continuous_iff_omega_regime (d : ClosureRegimeData) :
    cohomologyVanishes (classify d) = true ↔ d.scottContinuous = true := by
  constructor
  · intro h
    rcases (cohomologyVanishes_iff (classify d)).mp h with hstrict | hscott
    · -- strict ⇒ finiteBase ⇒ scottContinuous (corpus constraint `fin_scott`).
      exact d.fin_scott ((classify_strict d).mp hstrict)
    · -- scott ⇒ scottContinuous directly.
      exact ((classify_scott d).mp hscott).1
  · intro h
    -- Scott ⇒ not in the non-Scott strata ⇒ strict or scott (dichotomy) ⇒ cohomology vanishes.
    obtain ⟨hnt, hna⟩ := scott_excludes_nonscott d h
    rcases classify_exhaustive d with hs | hsc | ht | ha
    · rw [hs]; rfl
    · rw [hsc]; rfl
    · exact absurd ht hnt
    · exact absurd ha hna

/-- **The finite charge closure sits in the strict regime, witnessed.** The finite carrier
forces `finiteBase = true`, so its regime datum classifies to `strict` (`spine_is_strict`);
its `κ ≤ 3` is `Charge.settles_by_three` for every inflationary endomap. Combined with
`finite_scott_continuous`, this is the corpus's "finite ⟹ Scott-continuous ⟹ stabilizes",
recovering the strict regime. -/
theorem finite_charge_strict (c : Charge.Closure) (x : Charge) :
    classify spineData = ClosureRegime.strict ∧
    Charge.SettlesBy c.op x 3 ∧ IsScottContinuous c :=
  ⟨spine_is_strict, Charge.strict_finite c.op c.infl x, finite_scott_continuous c⟩

/-! ## (E) Finite-antecedent rules are Scott-continuous

The corpus's mechanism: a closure generated by rules with **finite antecedents** is
Scott-continuous because each rule fires on a join iff it fires on some finite sub-join — and
over a directed family that finite sub-join is `≤ₖ` a single member. We model a single
finite-antecedent rule as a firing operator. -/

/-- A **finite-antecedent firing operator**: it raises its input toward a conclusion `concl`
exactly when the input `≤ₖ`-covers a fixed antecedent `ante` (a single charge standing for
the join of the rule's finitely many antecedents). `fire ante concl x = x ∨ₖ concl` if
`ante ≤ₖ x`, else `x`. The antecedent is *finite* (one charge), so coverage is monotone and
**join-reflecting**: `ante ≤ₖ ⋁ₖ S` for a directed `S` iff `ante ≤ₖ` some member. -/
def fire (ante concl x : Charge) : Charge :=
  if KLE ante x then joinK x concl else x

/-- Firing is **inflationary**: `x ≤ₖ fire ante concl x`. Proven by finite exhaustion over
the four-element charge carrier (`decide` resolves the decidable `if`). -/
theorem fire_infl (ante concl x : Charge) : KLE x (fire ante concl x) := by
  cases ante <;> cases concl <;> cases x <;> decide

/-- Firing is **monotone** in the input. (`x ≤ₖ y` ⇒ `fire … x ≤ₖ fire … y`; the antecedent
covers `y` whenever it covers `x`, and the conclusion is joined either way.) Proven by finite
exhaustion over the four-element charge carrier. -/
theorem fire_mono (ante concl : Charge) {x y : Charge} (h : KLE x y) :
    KLE (fire ante concl x) (fire ante concl y) := by
  revert h
  cases ante <;> cases concl <;> cases x <;> cases y <;> decide

/-- **Finite-antecedent coverage reflects directed joins.** For a directed family `S`, the
antecedent covers the join `⋁ₖ S` iff it covers some member: `ante ≤ₖ sup S ↔ ∃ m ∈ S, ante ≤ₖ m`.
This is the corpus's "fires on a `⋁ₖ`-join iff on some finite sub-join" — the join being
attained (`sup_mem`) supplies the witnessing member. -/
theorem fire_covers_directed (ante : Charge) (S : DirectedFamily) :
    KLE ante (sup S.elems) ↔ ∃ m ∈ S.elems, KLE ante m := by
  constructor
  · intro h
    exact ⟨sup S.elems, S.sup_mem, h⟩
  · rintro ⟨m, hm, h⟩
    exact kle_trans _ _ _ h (le_sup hm)

/-- **Finite-antecedent rules are Scott-continuous.** The closure step generated
by a finite-antecedent rule commutes with directed joins:
`fire ante concl (⋁ₖ S) = ⋁ₖ {fire ante concl x : x ∈ S}` for every directed family `S`.
The rule fires on `⋁ₖ S` iff it fires on the family's attained maximum `m = sup S`
(`fire_covers_directed`); in either case both sides agree on that maximum, and the mapped
join is pinned to it by monotonicity. This is exactly the corpus mechanism by which
finite-antecedent inference (Fitting's LP closure, DL TBox closures) is Scott-continuous,
whereas an infinitary `∀x∈E` antecedent — not coverable by any single member — would fail it. -/
theorem finite_antecedent_scott_continuous (ante concl : Charge) (S : DirectedFamily) :
    fire ante concl (sup S.elems) = sup (S.elems.map (fire ante concl)) := by
  have hmem : sup S.elems ∈ S.elems := S.sup_mem
  apply kle_antisymm
  · -- LHS = fire … (sup) = fire … m, a member of the mapped list, hence ≤ its sup.
    have : fire ante concl (sup S.elems) ∈ S.elems.map (fire ante concl) :=
      List.mem_map.mpr ⟨_, hmem, rfl⟩
    exact le_sup this
  · -- RHS ≤ LHS by monotonicity of `fire` (the general half).
    exact sup_map_le (fun {x y} h => fire_mono ante concl h) S.elems

end Infomaterial.Closure.Scott
