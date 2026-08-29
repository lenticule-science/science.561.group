import Infomaterial.Persistence.Aperiodic.SoficShift
import Infomaterial.Articulation.Articulating.FourCorner
import Infomaterial.Language.Positing.BigradedCohomology

/-!
# Weave drafts as bilattice-coloured sofic shifts

A **weave draft** is, at the strand level, an over/under chart: at each crossing a warp
end passes over or under a weft pick. The textile-mathematics literature pins the chart
down as exactly a *local-compatibility constraint system* — `x ∈ A^(ℤ²)` with every
finite neighbourhood in a finite allowed set — i.e. a **shift of finite type**, the
symbolic-dynamics object `SoficShift` already formalizes. Three independent surveys
(textile, beadwork, ethnomathematics) re-derive the same skeleton, which is the
Tiles substrate verbatim: *a bilattice-coloured sofic tiling*.

This module exhibits the plain weave as a carrier of that substrate, so the craft is an
**instance** of the existing theorems rather than a neighbouring field:

* **The draft is an SFT, hence sofic.** Plain weave is the strict over/under alternation
  rule `warpAlt`. It *is* the two-colour complete graph (`warpAlt_eq_completeGraph`):
  plain weave = a proper 2-colouring = the bipartite reading. Its one local rule is the
  no-float law (`warpAlt_forbids_float`); admissible warp words are sofic
  (`warp_sofic`, via `sft_is_sofic`).
* **The crossing datum is a Belnap charge.** The two bits `(warp-over?, weft-over?)` are
  a `Articulating.FourCorner`, hence a `Charge`. A hole (neither over) is `⊥ₖ` — told nothing; a
  *mis-crossing* (both claim over) is `⊤ₖ` — a **held contradiction**, the textile
  defect that is a feature, not a crash. Exchanging which strand is over is exactly
  Belnap negation `~` (`overUnder_swap_is_negate`): it fixes the two defects (`⊥`, `⊤`)
  and swaps the two definite readings (`t ↔ f`). A defect-free fabric lives entirely in
  the definite truth pair (`defectFree_definite`).
* **The charge-coloured draft is a sofic shift over FOUR** (`charge_coloured_sofic`) —
  the Tiles "bilattice-coloured sofic tiling," here on a plain weave.

The frontier (red) is the *two-dimensional* coherence: `plainWeave_entropy_collapse`
states that a both-directions plain-weave swatch carries only two distinct row-states —
its configurational entropy is one bit, not extensive — the rigidity that makes plain
weave maximally coherent. It is stated at full strength and left unproven.

## References
Corpus aperiodic-settling line; `dev/.../2026-06-26-survey-of-textile-mathematics.md`
§V.6 (chart as subshift of finite type), §V.10 (defect as charge); the Tiles
bilattice-sofic-tiling paper.
-/

namespace Infomaterial
namespace Persistence.Aperiodic

open Infomaterial.Discrete (Graph)

/-! ## A weave draft is a shift of finite type -/

/-- The **plain-weave warp rule** on the over/under alphabet `Bool` (`true` = warp-over,
`false` = weft-over): a crossing may be followed only by its opposite — strict
alternation. The 1-step transition graph whose directed walks are the admissible plain
weaves. -/
def warpAlt : Graph Bool := fun a b => a != b

/-- **Plain weave is the two-colour complete graph.** Strict over/under alternation is
exactly `completeGraph Bool` (distinct colours adjacent): a plain-weave warp sequence is
a proper 2-colouring of the path — plain weave = the bipartite reading. -/
theorem warpAlt_eq_completeGraph : warpAlt = Combinatorics.completeGraph Bool := by
  funext a b; cases a <;> cases b <;> rfl

/-- **The no-float law.** No admissible plain weave has two consecutive equal crossings —
no float longer than one. The single local constraint that defines plain weave as an SFT
(the textile analogue of `golden_forbids_bb`). -/
theorem warpAlt_forbids_float (a : Bool) (r : List Bool) :
    ¬ Path warpAlt (a :: a :: r) := by
  rintro ⟨h1, -⟩
  cases a <;> simp [warpAlt] at h1

/-- **A weave draft is sofic.** Every admissible plain-weave warp word is its own 1-block
image — drafts are sofic shifts (the easy `sft_is_sofic` direction), the entry point to
reading textiles as the Tiles substrate. -/
theorem warp_sofic (p : List Bool) (hp : Path warpAlt p) :
    SoficImage warpAlt (fun a => a) p :=
  sft_is_sofic warpAlt p hp

/-! ## The crossing datum is a Belnap charge -/

/-- The over/under datum of one crossing as a four-corner charge: the two slot-presences
`(warp-over?, weft-over?)`. Through `Articulating.FourCorner.toCorner` this lands in `Charge`, so a
crossing *is* a bilattice value. -/
def crossingCharge (warpOver weftOver : Bool) : Charge :=
  Articulating.FourCorner.toCorner (warpOver, weftOver)

/-- A **hole** (neither strand over the other) is `⊥ₖ`: the crossing told nothing. -/
theorem hole_is_kBot : crossingCharge false false = Charge.kBot := rfl

/-- A **mis-crossing** (both strands claim to pass over) is `⊤ₖ`: a held contradiction —
the textile defect carried *as a value*, not an error that explodes. -/
theorem miscrossing_is_kTop : crossingCharge true true = Charge.kTop := rfl

/-- **Exchanging which strand is "over" is Belnap negation `~`.** Swapping the warp/weft
roles of a crossing is the coordinate-swap `Charge.negate`: it fixes the hole (`⊥`) and
the mis-crossing (`⊤`) and swaps the two definite over/under readings (`t ↔ f`). The
truth-order involution of the fabric is the over/under flip. -/
theorem overUnder_swap_is_negate (w v : Bool) :
    Charge.negate (crossingCharge w v) = crossingCharge v w := by
  cases w <;> cases v <;> rfl

/-- **A defect-free crossing is a definite truth value.** When exactly one strand is over
(`weftOver = ¬warpOver`), the charge is one of the two definite middles `{t, f}` — never
a knowledge-extreme. The two defect classes are exactly the two knowledge-extremes: a
hole is the underinformed `⊥`, a mis-crossing the overinformed `⊤`. -/
theorem defectFree_definite (b : Bool) :
    crossingCharge b (!b) = Charge.tTop ∨ crossingCharge b (!b) = Charge.tBot := by
  cases b
  · right; rfl
  · left; rfl

/-- **A mis-crossing carries a held contradiction.** Its charge `⊤ₖ` is inconsistent in the
bilattice sense (`isInconsistency`): a mis-crossing is a *monochromatic edge* of the crossing
graph — the knowledge-join `∨ₖ` of the two clashing over-demands lands on `⊤` — and so a
section of the inconsistency sheaf, the conflict the FOUR holds without explosion. -/
theorem miscrossing_isInconsistency :
    (crossingCharge true true).isInconsistency = true := rfl

/-- **A defect-free crossing carries no contradiction.** Exactly one strand over gives a
definite truth value, consistent (`isInconsistency = false`): a sound fabric is the
consistent regime — a *proper* FOUR-colouring of the crossing graph, its inconsistency sheaf
zero (`section_zero_of_consistent`). -/
theorem defectFree_consistent (b : Bool) :
    (crossingCharge b (!b)).isInconsistency = false := by cases b <;> rfl

/-- **The over/under mirror is the bilattice gauge.** Exchanging warp/weft (Belnap negation
`~`) leaves the contradiction content fixed (`Charge.isInconsistency_negate`), so the defect
locus is gauge-invariant — the mirror's fixed `⊤`-seam. The textile face of
`gauge_fixes_inconsistency`: the mirror swaps `t ↔ f` but never creates or erases a `⊤`. -/
theorem overUnder_swap_fixes_defect (w v : Bool) :
    (Charge.negate (crossingCharge w v)).isInconsistency
      = (crossingCharge w v).isInconsistency :=
  Charge.isInconsistency_negate _

/-- The **charge-colouring** of a defect-free draft: read each crossing as its Belnap
charge. -/
def chargeColour (b : Bool) : Charge := crossingCharge b (!b)

/-- **The charge-coloured draft is a sofic shift over FOUR.** Relabelling each crossing of
an admissible plain weave by its Belnap charge is a 1-block factor of the draft SFT, so
the bilattice-coloured fabric is sofic — the Tiles substrate ("a bilattice-coloured
sofic tiling") realized on a plain weave. -/
theorem charge_coloured_sofic (p : List Bool) (hp : Path warpAlt p) :
    SoficImage warpAlt chargeColour (p.map chargeColour) :=
  ⟨p, hp, rfl⟩

/-! ## Frontier: two-dimensional coherence (red)

The results above read a draft *one strand at a time*. The genuine textile object is
two-dimensional: a swatch alternating in **both** warp and weft. Column-alternation says
each row is the over/under complement of the row above it, so the whole fabric is its
first row propagated down — only two distinct row-states ever occur. This rigidity is
the Tiles statement that plain weave is *maximally coherent*: its configurational
entropy is one bit, not extensive in the area. It is stated here at full strength and
left unproven — the frontier this module opens. -/

/-- **Column alternation**: consecutive rows are over/under complements — each row is the
previous row with every crossing flipped. The weft-direction analogue of `Path warpAlt`,
hand-rolled core-only (no Mathlib `List.Chain'`). -/
def ColumnsComplement : List (List Bool) → Prop
  | [] => True
  | [_] => True
  | r1 :: r2 :: rest => r2 = r1.map (!·) ∧ ColumnsComplement (r2 :: rest)

/-- A **plain-weave swatch**: rows alternate (each row is an admissible warp word) and
columns alternate (each row is the over/under complement of the previous). -/
def PlainWeaveSwatch (s : List (List Bool)) : Prop :=
  (∀ r ∈ s, Path warpAlt r) ∧ ColumnsComplement s

/-- Over/under flip is an involution: flipping every crossing twice is the identity. -/
theorem map_not_invol (l : List Bool) : (l.map (!·)).map (!·) = l := by
  induction l with
  | nil => rfl
  | cons b t ih => simp [ih]

/-- **Two-valued rows.** Under column-complementation every row of `a :: s` is either the
head row `a` or its over/under complement `a.map (!·)` — the whole fabric is the first
row propagated down, so only two row-states occur. -/
theorem mem_columns : ∀ (s : List (List Bool)) (a : List Bool),
    ColumnsComplement (a :: s) → ∀ r ∈ a :: s, r = a ∨ r = a.map (!·)
  | [], a, _, r, hr => Or.inl (List.mem_singleton.1 hr)
  | b :: s', a, h, r, hr => by
      obtain ⟨hb, hrest⟩ := h
      rcases List.mem_cons.1 hr with rfl | hr'
      · exact Or.inl rfl
      · rcases mem_columns s' b hrest r hr' with e | e
        · exact Or.inr (e.trans hb)
        · refine Or.inl (e.trans ?_)
          rw [hb, map_not_invol]

/-- **Entropy collapse.** In a both-directions plain-weave swatch every row is either equal
to or the over/under complement of every other row: the fabric realizes only two distinct
row-states, so its configurational entropy is one bit rather than extensive in the area.
The maximal-coherence rigidity of plain weave — the two-dimensional projection of `warpAlt`'s
single local rule, now proved. -/
theorem plainWeave_entropy_collapse (s : List (List Bool)) (h : PlainWeaveSwatch s) :
    ∀ r1 ∈ s, ∀ r2 ∈ s, r1 = r2 ∨ r1 = r2.map (!·) := by
  obtain ⟨_, hcol⟩ := h
  cases s with
  | nil => intro r1 hr1; cases hr1
  | cons a s' =>
    intro r1 hr1 r2 hr2
    rcases mem_columns s' a hcol r1 hr1 with e1 | e1 <;>
      rcases mem_columns s' a hcol r2 hr2 with e2 | e2
    · exact Or.inl (e1.trans e2.symm)
    · exact Or.inr (by rw [e1, e2, map_not_invol])
    · exact Or.inr (by rw [e1, e2])
    · exact Or.inl (e1.trans e2.symm)

end Persistence.Aperiodic
end Infomaterial
