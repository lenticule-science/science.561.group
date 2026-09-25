import Obsmetrologia.CausalSets.Causal.ParaconsistentCone
import Obsmetrologia.CausalSets.Support.Causal

/-!
# Valued microsupport — the cone's influence valued in the FOUR

`CausalMicrosupport` propagates a two-valued section (`E → Prop`) along the causal cone;
`ParaconsistentCone` values the causal *relation* in the `Reading` bilattice. This module lifts the
**microsupport itself** to the FOUR: an influence carries a `Reading`, propagates along the cone, and
the bilattice structure makes the light-cone reading the survey points at literally true —

* **spacelike / acausal ⟹ ⊥** (told nothing): a source emits the under-determined reading `⊥ₖ` to
  every event outside its causal future, so spacelike-separated regions are knowledge-independent;
* **causal collision ⟹ ⊤** (conflict held): when two influences carrying *contradictory* readings
  `t` (affirm) and `f` (deny) meet in a **common future event** — the tip of a causal diamond — their
  knowledge-join is the over-determined `⊤ₖ`. The paraconsistent ⊤ arises *geometrically*, from
  causal convergence of contradiction, and is held without explosion;
* **agreement ⟹ reinforcement**: two influences carrying the same reading `t` merge to `t` — no
  spurious conflict;
* merging **climbs the knowledge order** (accumulates information).

This is the cross-faculty theorem the light-cone slate was built toward: the cone (`Lorentzian`) and
the FOUR (`Positing`) are one structure — spacelike incomparability is `⊥`, causal order is `t`/`f`,
and held contradiction is `⊤`. The causal relation is the settled Boolean indicator `le` (the value
of the Lorentzian causal settling); no free data — emission is a `cond` guard, the merges are
`Reading.joinK`.

## Main definitions

* `CSection` — a valued section (a `Reading` at each event).
* `emit` / `emit2` — a valued source's cone emission, and the merge of two sources.

## Main results

* `emit_outside_cone` / `spacelike_emit_bot` — a source emits `⊥` outside its cone (spacelike ⟹ ⊥).
* `collision_conflict` — contradictory influences meeting in a common future yield `⊤`.
* `consistent_merge` — agreeing influences reinforce (no spurious conflict).
* `valued_microsupport` — the bundled headline.

## References

`content/.../lorentzian-causal-settling`, `content/.../inconsistency-sheaf`. Built on
`Obsmetrologia.CausalSets.Causal.ParaconsistentConeField` and `Obsmetrologia.CausalSets.Support.Causal`.

## Tags

valued microsupport, bilattice, paraconsistent, light cone, conflict, spacelike, FOUR
-/

namespace Obsmetrologia
namespace CausalSets.Support.Valued

open Obsmetrologia.CausalSets.Causal.Order
open Obsmetrologia.CausalSets.Causal.Cone

variable {E : Type}

/-! ## (A) Valued sections and cone emission -/

/-- A **valued section**: a `Reading` (a value in the FOUR) at each event. -/
abbrev CSection (E : Type) := E → Reading

/-- **A valued source emits its reading into its causal future.** Given the settled Boolean causal
relation `le`, a source at `a` with reading `q` reports `q` at every event in its future cone and the
under-determined `⊥ₖ` elsewhere. -/
def emit (le : E → E → Bool) (a : E) (q : Reading) : CSection E :=
  fun z => bif le a z then q else Reading.kBot

/-- **The valued microsupport of two sources**: the knowledge-join (`∨ₖ`) of their emissions — the
cellwise merge of `ParaconsistentCone.mergeReports`, here as valued sections. -/
def emit2 (le : E → E → Bool) (a₁ : E) (q₁ : Reading) (a₂ : E) (q₂ : Reading) : CSection E :=
  fun z => Reading.joinK (emit le a₁ q₁ z) (emit le a₂ q₂ z)

/-! ## (B) Spacelike independence — outside the cone is `⊥` -/

/-- A source emits `⊥ₖ` to any event outside its causal future. -/
theorem emit_outside_cone (le : E → E → Bool) (a : E) (q : Reading) (z : E)
    (h : le a z = false) : emit le a q z = Reading.kBot := by
  unfold emit; rw [h]; rfl

/-- A source emits exactly its reading to events in its causal future. -/
theorem emit_inside_cone (le : E → E → Bool) (a : E) (q : Reading) (z : E)
    (h : le a z = true) : emit le a q z = q := by
  unfold emit; rw [h]; rfl

/-- **Spacelike ⟹ `⊥`.** For a faithful causal indicator `le` (`le x y = true → x ⤳ y`), a source at
`a` emits the under-determined `⊥ₖ` to any event `z` spacelike-separated from it: causal influence
tells the spacelike complement *nothing*. -/
theorem spacelike_emit_bot (C : CausalSet E) (le : E → E → Bool)
    (hf : ∀ x y, le x y = true → C.reaches x y) (q : Reading) {a z : E}
    (h : Spacelike C a z) : emit le a q z = Reading.kBot := by
  have hle : le a z = false := by
    cases hb : le a z
    · rfl
    · exact absurd (hf a z hb) h.1
  exact emit_outside_cone le a q z hle

/-! ## (C) Causal collision — contradiction in a common future is `⊤` -/

/-- **Collision ⟹ conflict.** When two influences carrying *contradictory* readings `t` (affirm) and
`f` (deny) both reach a common future event `z` — the tip of a causal diamond — their merge is the
over-determined `⊤ₖ`. The paraconsistent conflict arises geometrically, from causal convergence, and
is **held** (the bilattice carries `⊤` without explosion). -/
theorem collision_conflict (le : E → E → Bool) (a₁ a₂ z : E)
    (h₁ : le a₁ z = true) (h₂ : le a₂ z = true) :
    emit2 le a₁ Reading.tTop a₂ Reading.tBot z = Reading.kTop := by
  unfold emit2
  rw [emit_inside_cone le a₁ Reading.tTop z h₁, emit_inside_cone le a₂ Reading.tBot z h₂]
  decide

/-- **Agreement ⟹ reinforcement.** Two influences carrying the same reading `t`, meeting in a common
future, merge to `t` — no spurious conflict; only contradiction reaches `⊤`. -/
theorem consistent_merge (le : E → E → Bool) (a₁ a₂ z : E)
    (h₁ : le a₁ z = true) (h₂ : le a₂ z = true) :
    emit2 le a₁ Reading.tTop a₂ Reading.tTop z = Reading.tTop := by
  unfold emit2
  rw [emit_inside_cone le a₁ Reading.tTop z h₁, emit_inside_cone le a₂ Reading.tTop z h₂]
  decide

/-! ## (D) Knowledge monotonicity -/

/-- Merging climbs the knowledge order: the joined reading dominates each source's emission. -/
theorem emit2_infl_left (le : E → E → Bool) (a₁ : E) (q₁ : Reading) (a₂ : E) (q₂ : Reading) (z : E) :
    Reading.leK (emit le a₁ q₁ z) (emit2 le a₁ q₁ a₂ q₂ z) = true :=
  CausalSets.Causal.ParaconsistentCone.reading_leK_joinK_left
    (emit le a₁ q₁ z) (emit le a₂ q₂ z)

/-! ## (E) The bundled headline -/

/-- **Valued microsupport — the cone valued in the FOUR.** The light cone and the bilattice are one
structure: with the settled causal indicator `le`,

* **spacelike / acausal ⟹ `⊥`** (`emit_outside_cone`) — a source tells events outside its cone
  nothing;
* **causal collision of contradiction ⟹ `⊤`** (`collision_conflict`) — affirm (`t`) and deny (`f`)
  meeting in a common future hold conflict, without explosion;
* **agreement ⟹ reinforcement** (`consistent_merge`) — same-reading influences merge consistently;
* **merging climbs `≤ₖ`** (`emit2_infl_left`) — accumulating knowledge.

Spacelike incomparability is `⊥`, causal order is `t`/`f`, held contradiction is `⊤`: the cone is the
FOUR met as causal admissibility. -/
theorem valued_microsupport (le : E → E → Bool) :
    (∀ (a : E) (q : Reading) (z : E), le a z = false → emit le a q z = Reading.kBot)
    ∧ (∀ a₁ a₂ z, le a₁ z = true → le a₂ z = true →
        emit2 le a₁ Reading.tTop a₂ Reading.tBot z = Reading.kTop)
    ∧ (∀ a₁ a₂ z, le a₁ z = true → le a₂ z = true →
        emit2 le a₁ Reading.tTop a₂ Reading.tTop z = Reading.tTop)
    ∧ (∀ (a₁ : E) (q₁ : Reading) (a₂ : E) (q₂ : Reading) (z : E),
        Reading.leK (emit le a₁ q₁ z) (emit2 le a₁ q₁ a₂ q₂ z) = true) :=
  ⟨fun a q z h => emit_outside_cone le a q z h,
   fun a₁ a₂ z h₁ h₂ => collision_conflict le a₁ a₂ z h₁ h₂,
   fun a₁ a₂ z h₁ h₂ => consistent_merge le a₁ a₂ z h₁ h₂,
   fun a₁ q₁ a₂ q₂ z => emit2_infl_left le a₁ q₁ a₂ q₂ z⟩

end CausalSets.Support.Valued
end Obsmetrologia
