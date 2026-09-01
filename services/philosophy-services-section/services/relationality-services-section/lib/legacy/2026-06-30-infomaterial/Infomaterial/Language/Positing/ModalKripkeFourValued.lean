import Infomaterial.Calculus.Order.OrderInfra
import Infomaterial.Language.Positing.NucleusAndCommutingNuclei
import Infomaterial.Closure.Modal

/-!
# ModalKripkeFourValued — the four-valued Kripke modal hierarchy K ⊇ T ⊇ S4 ⊇ S5

This module derives the **axiom hierarchy** of four-valued Kripke modal logic over the
bilattice, exactly as the corpus states it:

* `…/world-set/content/bilattice-accessibility-relation/bilattice-accessibility-relation.md`
  — the accessibility relation `R : W × W → 𝐋^⋈` is *bilattice-valued*; when `𝐋 = 𝟐` it
  takes values in `FOUR` (= `Charge`), and restricting to the consistent sub-algebra
  recovers a Boolean (classical) Kripke accessibility relation.
* `…/bilattice-accessibility-relation/content/twist-modal-translation/twist-modal-translation.md`
  — the twist translation `ν(□φ) = (□₊ν₁ ∧ □₋∼ν₂, ∼□₊∼ν₂)` splitting the bilattice box
  into its two classical modal components.

The carrier of accessibility is `Valuation.FiniteFibration`: each cell `φ` carries the
finite list `fiber φ` of cells *accessible from* `φ`, and a charge per cell is the
four-valued reading. The modal operators are the fiber quantifiers of `Quantifying`:

* **possibilize** `◇ = existsF` — the fiber knowledge-**join** (Charge.joinList);
* **necessitate** `□ = forallF` — the fiber knowledge-**meet** (Charge.meetList).

These are exactly `Valuation.ModalFrame.possibilize`/`necessitate` of `ModalPairAdjunction`,
which are defined on the underlying `FiniteFibration`, so they apply verbatim to every
frame in the hierarchy. We do **not** re-derive the quantifiers; the modal operators ARE
the fiber quantifiers, and the modal laws are proven *about* them.

## The axiom hierarchy K ⊇ T ⊇ S4 ⊇ S5

`ModalPairAdjunction.ModalFrame` already bundles the **S5** case (refl + symm + trans).
We add the weaker frame classes, each adding one axiom going down:

* `KFrame`  — a bare accessibility relation (a `FiniteFibration`, no axioms);
* `TFrame`  — add **refl** (the T axiom `□φ → φ`);
* `S4Frame` — add **trans** (refl + trans; the 4 axiom `□φ → □□φ`);
* `S5Frame` — add **symm**  (refl + symm + trans = the existing `ModalFrame`).

`Kripke.hierarchy` exhibits the four classes with their defining axioms and the forgetful
inclusions S5 → S4 → T → K (each stronger frame yields the weaker's data and axioms).

## S4 = closure algebra (the interior operator)

On an `S4Frame` (refl + trans, **no symm**) the box `□` is an **interior operator**:
deflationary (`□v ≤ₖ v`, from refl), monotone, and **idempotent** (`□□v = □v`). Its dual,
the diamond `◇`, is then a genuine **closure operator** — extensive, monotone, idempotent —
exactly an `Order.Nucleus`-shaped reflector (in the order sense). This is the
**S4 = closure-algebra** theorem, `Kripke.s4_box_is_interior`. The idempotence
`□□ = □` consumes **only transitivity** (and refl for the deflationary half); symmetry is
NOT used — see the "No free data / axioms consumed" notes below.
-/

namespace Infomaterial
namespace Kripke

open Infomaterial.Valuation
open Infomaterial.Charge

/-! ## The frame hierarchy K ⊇ T ⊇ S4 ⊇ S5

The accessibility carrier is `Valuation.FiniteFibration`: `fiber φ` is the finite list of
cells accessible from `φ`. Each class adds one axiom. The modal operators
`ModalFrame.possibilize`/`necessitate` are defined on this carrier, so they are reused for
every frame by handing them the underlying `FiniteFibration`. -/

/-- **K-frame**: a bare four-valued accessibility relation — a `FiniteFibration` with NO
modal axioms. The weakest frame; the base of the inclusion hierarchy. -/
structure KFrame where
  /-- The accessibility relation as a finite fibration `fiber φ = {ψ : φ ↝ ψ}`. -/
  toFibration : FiniteFibration

/-- **T-frame**: a K-frame whose accessibility is **reflexive** (the T axiom `□φ → φ`). -/
structure TFrame extends KFrame where
  /-- Reflexive: every cell accesses itself. -/
  refl : ∀ φ, φ ∈ toFibration.fiber φ

/-- **S4-frame**: a T-frame whose accessibility is also **transitive** (the 4 axiom
`□φ → □□φ`). Refl + trans — the closure-algebra regime. -/
structure S4Frame extends TFrame where
  /-- Transitive: accessibility composes. -/
  trans : ∀ φ ψ χ, ψ ∈ toFibration.fiber φ → χ ∈ toFibration.fiber ψ → χ ∈ toFibration.fiber φ

/-- **S5-frame**: an S4-frame whose accessibility is also **symmetric** — refl + symm +
trans, the equivalence-relation regime. This is *exactly* `ModalPairAdjunction.ModalFrame`;
`toModalFrame` exhibits the identification. -/
structure S5Frame extends S4Frame where
  /-- Symmetric: accessibility runs both ways. -/
  symm : ∀ φ ψ, ψ ∈ toFibration.fiber φ → φ ∈ toFibration.fiber ψ

/-! ### Forgetful inclusions S5 → S4 → T → K (each stronger frame yields the weaker) -/

/-- An S5-frame is the corpus's `ModalFrame` (S5 = refl + symm + trans). -/
def S5Frame.toModalFrame (M : S5Frame) : ModalFrame where
  toFiniteFibration := M.toFibration
  refl := M.refl
  symm := M.symm
  trans := M.trans

/-- The forgetful inclusion **T → K**: a T-frame is in particular a K-frame. -/
def TFrame.toKFrame' (M : TFrame) : KFrame := M.toKFrame

/-- The forgetful inclusion **S4 → T**. -/
def S4Frame.toTFrame' (M : S4Frame) : TFrame := M.toTFrame

/-- The forgetful inclusion **S5 → S4**. -/
def S5Frame.toS4Frame' (M : S5Frame) : S4Frame := M.toS4Frame

/-! ## The four-valued modal operators on any frame

`◇`/`□` are the fiber quantifiers, defined on the underlying `FiniteFibration`. We expose
them per frame class by routing through a frame's fibration. They are literally
`ModalFrame.possibilize`/`necessitate` of `ModalPairAdjunction` (which themselves are
`existsF`/`forallF`), so no re-derivation occurs. -/

/-- **Possibilize** `◇` on a K-frame: the fiber knowledge-join `existsF`. -/
def KFrame.possibilize (M : KFrame) (v : Valuation) : Valuation :=
  existsF M.toFibration v
/-- **Necessitate** `□` on a K-frame: the fiber knowledge-meet `forallF`. -/
def KFrame.necessitate (M : KFrame) (v : Valuation) : Valuation :=
  forallF M.toFibration v

theorem KFrame.possibilize_apply (M : KFrame) (v : Valuation) (φ : PredicationCell) :
    M.possibilize v φ = Charge.joinList ((M.toFibration.fiber φ).map v) := rfl

theorem KFrame.necessitate_apply (M : KFrame) (v : Valuation) (φ : PredicationCell) :
    M.necessitate v φ = Charge.meetList ((M.toFibration.fiber φ).map v) := rfl

/-! ### Monotonicity holds on the bare K-frame (no axioms needed) -/

/-- **◇ is monotone** on any K-frame. -/
theorem KFrame.possibilize_mono (M : KFrame) {v w : Valuation} (h : Valuation.leK v w) :
    Valuation.leK (M.possibilize v) (M.possibilize w) := by
  intro φ
  refine Charge.joinList_le _ _ ?_
  intro a ha
  rcases List.mem_map.1 ha with ⟨ψ, hψ, rfl⟩
  exact Charge.kle_trans _ _ _ (h ψ)
    (Charge.le_joinList (w ψ) _ (List.mem_map.2 ⟨ψ, hψ, rfl⟩))

/-- **□ is monotone** on any K-frame. -/
theorem KFrame.necessitate_mono (M : KFrame) {v w : Valuation} (h : Valuation.leK v w) :
    Valuation.leK (M.necessitate v) (M.necessitate w) := by
  intro φ
  refine Charge.le_meetList _ _ ?_
  intro a ha
  rcases List.mem_map.1 ha with ⟨ψ, hψ, rfl⟩
  exact Charge.kle_trans _ _ _
    (Charge.meetList_le (v ψ) _ (List.mem_map.2 ⟨ψ, hψ, rfl⟩)) (h ψ)

/-! ### On a T-frame: ◇ inflationary, □ deflationary (from reflexivity only) -/

/-- **◇ is inflationary** on a T-frame — `v ≤ₖ ◇v`. Reuses the corpus's `le_possibilize`,
which needs only reflexivity. -/
theorem TFrame.le_possibilize (M : TFrame) (v : Valuation) :
    Valuation.leK v (M.toKFrame.possibilize v) := by
  intro φ
  exact Charge.le_joinList (v φ) _ (List.mem_map.2 ⟨φ, M.refl φ, rfl⟩)

/-- **□ is deflationary** on a T-frame — `□v ≤ₖ v`. Reuses the corpus's `necessitate_le`,
which needs only reflexivity. -/
theorem TFrame.necessitate_le (M : TFrame) (v : Valuation) :
    Valuation.leK (M.toKFrame.necessitate v) v := by
  intro φ
  exact Charge.meetList_le (v φ) _ (List.mem_map.2 ⟨φ, M.refl φ, rfl⟩)

/-! ## S4 = closure algebra: the box is an interior operator

On an `S4Frame` (refl + trans) the box `□` is **deflationary**, **monotone**, and
**idempotent**. Idempotence is where the regime matters: it consumes *transitivity only*,
NOT symmetry. We prove `□□v = □v` directly: the `≤` half is `□`-monotonicity of the
deflationary `□v ≤ v`; the `≥` half is the transitivity argument
`χ ∈ Rψ, ψ ∈ Rφ ⟹ χ ∈ Rφ`, so each meetand `□v ψ` of `□□v φ` is bounded below by `□v φ`. -/

/-- **□ is deflationary on S4** — `□v ≤ₖ v` (refl). -/
theorem S4Frame.box_deflationary (M : S4Frame) (v : Valuation) :
    Valuation.leK (M.toKFrame.necessitate v) v :=
  M.toTFrame.necessitate_le v

/-- **□ is monotone on S4**. -/
theorem S4Frame.box_mono (M : S4Frame) {v w : Valuation} (h : Valuation.leK v w) :
    Valuation.leK (M.toKFrame.necessitate v) (M.toKFrame.necessitate w) :=
  M.toKFrame.necessitate_mono h

/-- **The 4-axiom, pointwise.** For `ψ ∈ Rφ`, transitivity makes every meetand `v χ`
(`χ ∈ Rψ`) of `□v ψ` also a meetand of `□v φ`, hence `□v φ ≤ₖ □v ψ`. (Uses **trans only**.) -/
theorem S4Frame.box_le_box_fiber (M : S4Frame) (v : Valuation)
    {φ ψ : PredicationCell} (h : ψ ∈ M.toFibration.fiber φ) :
    Charge.KLE (M.toKFrame.necessitate v φ) (M.toKFrame.necessitate v ψ) := by
  show Charge.KLE (Charge.meetList ((M.toFibration.fiber φ).map v))
      (Charge.meetList ((M.toFibration.fiber ψ).map v))
  refine Charge.le_meetList _ _ ?_
  intro a ha
  rcases List.mem_map.1 ha with ⟨χ, hχ, rfl⟩
  -- χ ∈ Rψ and ψ ∈ Rφ ⟹ χ ∈ Rφ, so v χ is a meetand of □v φ.
  have hχφ : χ ∈ M.toFibration.fiber φ := M.trans φ ψ χ h hχ
  exact Charge.meetList_le (v χ) _ (List.mem_map.2 ⟨χ, hχφ, rfl⟩)

/-- **□ is idempotent on S4** — `□□v = □v`. The `≤` half is monotonicity of `□v ≤ v`; the
`≥` half is `box_le_box_fiber` (transitivity). **Symmetry is not used.** -/
theorem S4Frame.box_idem (M : S4Frame) (v : Valuation) :
    M.toKFrame.necessitate (M.toKFrame.necessitate v) = M.toKFrame.necessitate v := by
  funext φ
  apply Charge.kle_antisymm
  · -- `□□v ≤ □v` : `□v ≤ v`, monotone `□`.
    exact M.box_mono (M.box_deflationary v) φ
  · -- `□v ≤ □□v φ = ⨅_{ψ∈Rφ} □v ψ`; each `□v φ ≤ □v ψ` by the 4-axiom.
    show Charge.KLE (M.toKFrame.necessitate v φ)
        (Charge.meetList ((M.toFibration.fiber φ).map (M.toKFrame.necessitate v)))
    refine Charge.le_meetList _ _ ?_
    intro a ha
    rcases List.mem_map.1 ha with ⟨ψ, hψ, rfl⟩
    exact M.box_le_box_fiber v hψ

/-- **◇ is extensive on S4** — `v ≤ₖ ◇v` (refl). -/
theorem S4Frame.diamond_extensive (M : S4Frame) (v : Valuation) :
    Valuation.leK v (M.toKFrame.possibilize v) :=
  M.toTFrame.le_possibilize v

/-- **◇ is monotone on S4**. -/
theorem S4Frame.diamond_mono (M : S4Frame) {v w : Valuation} (h : Valuation.leK v w) :
    Valuation.leK (M.toKFrame.possibilize v) (M.toKFrame.possibilize w) :=
  M.toKFrame.possibilize_mono h

/-- **The 4-axiom for the diamond.** Dual to `box_le_box_fiber`: for `ψ ∈ Rφ`, every joinand
`v χ` (`χ ∈ Rψ`) of `◇v ψ` is a joinand of `◇v φ`, so `◇v ψ ≤ₖ ◇v φ`. (Trans only.) -/
theorem S4Frame.diamond_fiber_le (M : S4Frame) (v : Valuation)
    {φ ψ : PredicationCell} (h : ψ ∈ M.toFibration.fiber φ) :
    Charge.KLE (M.toKFrame.possibilize v ψ) (M.toKFrame.possibilize v φ) := by
  show Charge.KLE (Charge.joinList ((M.toFibration.fiber ψ).map v))
      (Charge.joinList ((M.toFibration.fiber φ).map v))
  refine Charge.joinList_le _ _ ?_
  intro a ha
  rcases List.mem_map.1 ha with ⟨χ, hχ, rfl⟩
  have hχφ : χ ∈ M.toFibration.fiber φ := M.trans φ ψ χ h hχ
  exact Charge.le_joinList (v χ) _ (List.mem_map.2 ⟨χ, hχφ, rfl⟩)

/-- **◇ is idempotent on S4** — `◇◇v = ◇v`. Dual to `box_idem`; the `≥` half is extensivity,
the `≤` half is `diamond_fiber_le` (transitivity). -/
theorem S4Frame.diamond_idem (M : S4Frame) (v : Valuation) :
    M.toKFrame.possibilize (M.toKFrame.possibilize v) = M.toKFrame.possibilize v := by
  funext φ
  apply Charge.kle_antisymm
  · -- `◇◇v φ = ⨆_{ψ∈Rφ} ◇v ψ ≤ ◇v φ` since each `◇v ψ ≤ ◇v φ`.
    show Charge.KLE
        (Charge.joinList ((M.toFibration.fiber φ).map (M.toKFrame.possibilize v)))
        (M.toKFrame.possibilize v φ)
    refine Charge.joinList_le _ _ ?_
    intro a ha
    rcases List.mem_map.1 ha with ⟨ψ, hψ, rfl⟩
    exact M.diamond_fiber_le v hψ
  · -- `◇v ≤ ◇◇v` by extensivity of ◇.
    exact M.diamond_extensive (M.toKFrame.possibilize v) φ

/-! ### The headline: S4 box is an interior operator (and ◇ a closure)

The three interior-operator laws bundled, plus the dual three closure laws. The shape
"extensive + monotone + idempotent" is precisely that of an `Order.Nucleus` (read in the
valuation knowledge order); the diamond `◇` is the closure, the box `□` its interior dual —
the **S4 = closure-algebra** theorem. -/

/-- **S4 box is an interior operator (closure-algebra theorem).** On an
`S4Frame`, the box `□` is **deflationary** (`□v ≤ₖ v`), **monotone**, and **idempotent**
(`□□v = □v`); dually the diamond `◇` is **extensive** (`v ≤ₖ ◇v`), **monotone**, and
**idempotent** (`◇◇v = ◇v`). The `◇`-triple is exactly a closure operator (the `Order`
Nucleus shape, read in the valuation knowledge order); `□` is its interior dual. Idempotence
consumes **transitivity only** — symmetry is NOT used (see module notes). -/
theorem s4_box_is_interior (M : S4Frame) :
    -- box □ : interior operator
    ((∀ v, Valuation.leK (M.toKFrame.necessitate v) v) ∧
     (∀ v w, Valuation.leK v w →
        Valuation.leK (M.toKFrame.necessitate v) (M.toKFrame.necessitate w)) ∧
     (∀ v, M.toKFrame.necessitate (M.toKFrame.necessitate v) = M.toKFrame.necessitate v)) ∧
    -- diamond ◇ : closure operator
    ((∀ v, Valuation.leK v (M.toKFrame.possibilize v)) ∧
     (∀ v w, Valuation.leK v w →
        Valuation.leK (M.toKFrame.possibilize v) (M.toKFrame.possibilize w)) ∧
     (∀ v, M.toKFrame.possibilize (M.toKFrame.possibilize v) = M.toKFrame.possibilize v)) :=
  ⟨⟨fun v => M.box_deflationary v, fun _ _ h => M.box_mono h, fun v => M.box_idem v⟩,
   ⟨fun v => M.diamond_extensive v, fun _ _ h => M.diamond_mono h, fun v => M.diamond_idem v⟩⟩

/-! ## Tie to `Order.Nucleus` — ◇ extensive + monotone + idempotent ⟹ a closure

We record the abstract **closure-operator** signature the S4 diamond meets. `Order.Nucleus`
is the abstract home of "extensive + idempotent + meet-preserving" on a Heyting algebra; the
S4 diamond meets the *order* closure-operator shape (extensive + monotone + idempotent) in
the valuation knowledge order, the dual of an interior. We expose the closure-operator
predicate and prove the S4 diamond satisfies it — the order-theoretic statement of S4 =
closure-algebra. -/

/-- The abstract **closure-operator** signature on the valuation knowledge order:
extensive, monotone, idempotent (the `Order.Nucleus`-shape sans meet-preservation, in the
order sense). -/
structure IsClosureOp (cl : Valuation → Valuation) : Prop where
  extensive : ∀ v, Valuation.leK v (cl v)
  monotone : ∀ v w, Valuation.leK v w → Valuation.leK (cl v) (cl w)
  idempotent : ∀ v, cl (cl v) = cl v

/-- **S4 diamond is a closure operator** — the order-theoretic S4 = closure-algebra. -/
theorem S4Frame.diamond_is_closure (M : S4Frame) :
    IsClosureOp (M.toKFrame.possibilize) where
  extensive v := M.diamond_extensive v
  monotone _ _ h := M.diamond_mono h
  idempotent v := M.diamond_idem v

/-! ## The hierarchy headline -/

/-- **The four-valued Kripke frame hierarchy K ⊇ T ⊇ S4 ⊇ S5.** The four frame
classes are exhibited together with their defining accessibility axioms and the forgetful
inclusions: every S5-frame yields an S4-frame (forget symm), every S4-frame a T-frame
(forget trans), every T-frame a K-frame (forget refl) — each weaker class is recovered from
the stronger one's data, and each axiom is named (refl = T, trans = 4, symm = the S5
closure). The conjunction records, for the supplied frames, that the inclusions act on data
(`toKFrame`/`toTFrame`/`toS4Frame`) and that an S5-frame is precisely the corpus's
`ModalFrame`, so its accessibility is reflexive, symmetric, and transitive. -/
theorem hierarchy (_K : KFrame) (T : TFrame) (S4 : S4Frame) (S5 : S5Frame) :
    -- T ⊆ K, S4 ⊆ T, S5 ⊆ S4 as forgetful inclusions on the underlying fibration
    (T.toKFrame.toFibration = T.toFibration) ∧
    (S4.toTFrame.toFibration = S4.toFibration) ∧
    (S5.toS4Frame.toFibration = S5.toFibration) ∧
    -- T adds refl, S4 adds trans, S5 adds symm — the defining axioms
    (∀ φ, φ ∈ T.toFibration.fiber φ) ∧
    (∀ φ, φ ∈ S4.toFibration.fiber φ) ∧
    (∀ φ ψ χ, ψ ∈ S4.toFibration.fiber φ → χ ∈ S4.toFibration.fiber ψ →
        χ ∈ S4.toFibration.fiber φ) ∧
    -- an S5-frame is exactly ModalFrame: refl + symm + trans
    (∀ φ, φ ∈ S5.toFibration.fiber φ) ∧
    (∀ φ ψ, ψ ∈ S5.toFibration.fiber φ → φ ∈ S5.toFibration.fiber ψ) ∧
    (∀ φ ψ χ, ψ ∈ S5.toFibration.fiber φ → χ ∈ S5.toFibration.fiber ψ →
        χ ∈ S5.toFibration.fiber φ) ∧
    (S5.toModalFrame.toFiniteFibration = S5.toFibration) :=
  ⟨rfl, rfl, rfl, T.refl, S4.refl, S4.trans, S5.refl, S5.symm, S5.trans, rfl⟩

/-! ## The twist modal translation (the two classical modal components)

The corpus's `twist-modal-translation.md`: each bilattice modal formula `□φ` translates to a
pair `ν(□φ) = (ν₁, ν₂)` of classical bimodal formulas

    ν₁(□φ) = □₊ ν₁(φ)  ∧  □₋ ∼ ν₂(φ),
    ν₂(□φ) = ∼ □₊ ∼ ν₂(φ),

where `□₊`, `□₋` are the two classical modal operators for the positive / negative
components of the bilattice accessibility relation `R`. On `Charge`, the positive component
is `Charge.pos` and the negative `Charge.neg`; `∼` (truth negation) is `Charge.negate`, the
slot-swap, with `(negate a).pos = a.neg` and `(negate a).neg = a.pos`. We record the
*algebraic shape* of the negation half of the translation — `∼` swaps the two evidence
slots — the four-valued ground on which `ν₁/ν₂` split the box into `□₊/□₋`. -/

/-- The **twist split** of a charge: its positive- and negative-evidence components
`(ν₁, ν₂) = (pos, neg)` — the two classical-component readings of a bilattice value. -/
def twistSplit (a : Charge) : Bool × Bool := (a.pos, a.neg)

/-- The translation's negation law, at the value level: truth-negation `∼` swaps the two
classical components — `ν₁(∼a) = ν₂(a)` and `ν₂(∼a) = ν₁(a)`. This is the slot-swap that
makes `□₋ ∼ ν₂` and `∼ □₊ ∼ ν₂` the negative-component modal clauses of `ν(□φ)`. -/
theorem twistSplit_negate (a : Charge) :
    twistSplit (Charge.negate a) = ((twistSplit a).2, (twistSplit a).1) := by
  cases a <;> rfl

end Kripke
end Infomaterial
