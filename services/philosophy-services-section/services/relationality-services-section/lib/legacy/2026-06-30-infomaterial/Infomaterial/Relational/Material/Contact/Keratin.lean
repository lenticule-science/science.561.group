import Infomaterial.Calculus.Order.TarskiSheafClosure

/-!
# KeratinSheaf — the first richly material thickening of the tile (DERIVED)

Where the Infomaterial tile first grows hair: the cell stops being a bare relation and becomes a
**directed material stalk** whose obstruction has texture. The local-to-global engine — a directed
cell complex, a Tarski/Lawvere Laplacian, settling to the least global section, `ker L = H⁰` — is the
neutral `Order.TarskiSheafClosure` (shared with the liquid regime). This module supplies the
keratin-specific decoration and the **lock/history** material tier on top of it.

After the corpus keratin survey (`…/keratin_mathematical_material_object_survey.md`, §10, Problems
H/I) and §10.5's "what is new":

* **Combinatorial keratin sheaf.** A hair-shaft contact complex is a `Tarski.Complex`; a `Contact` is
  a `Tarski.Edge` — a directed `src ↦ tgt` frictional restriction. A keratin state is a `Tarski.Assign`;
  a global section is `Tarski.IsCompatible` (directed, one-sided compatibility).
* **Tarski keratin Laplacian.** Inherited: `Tarski.settle` (inner-product-free settling),
  `Tarski.harmonic_imp_compatible`, `Tarski.mem_h0_iff_harmonic` (`ker L = H⁰`).
* **Lock / history extension.** Felting, pilling, damage, fracture are **monotone irreversible**
  transitions (`Lock`, inflationary); a processing `History` is their fold and preserves
  monotonicity/inflation; settling a locked seed reaches the **least locked compatible** state
  (`settle_lock_is_least_compatible`). Grounded by the constructive `Tarski.Powerset` event lattice
  where a lock-state *is* the growing set of fired events (`addEvent`).

## Main definitions
* `Contact`, `KeratinComplex` — keratin names for `Tarski.Edge` / `Tarski.Complex`.
* `Lock`, `History`, `runHistory`, `lockSeed` — irreversible material transitions.
* `LockEvent`, `addEvent` — the constructive event-lattice grounding.

## Main results
* `runHistory_infl`, `runHistory_mono` — history is inflationary and preserves monotonicity.
* `settle_lock_is_least_compatible` — settling a locked seed reaches the least locked compatible state.

## References
`content/.../keratin_mathematical_material_object_survey.md` §§4–10. Built on
`Infomaterial.Order.TarskiSheafClosure`; the lock tier mirrors `Glass.KCM`.

## Tags
keratin, cellular sheaf, Tarski Laplacian, directed contact, irreversible locking
-/

namespace Infomaterial
namespace Relational.Material

open Order
open Infomaterial.Tarski

variable {S : Order.CompleteLattice}

/-! ## The directed contact complex (keratin names for the shared closure) -/

/-- A directed keratin **contact** between two shaft segments: a `Tarski.Edge`, i.e. an ordered
`src ↦ tgt` with a monotone frictional restriction. Reversing it imposes the opposite (hysteretic)
constraint — direction is real. -/
abbrev Contact (S : Order.CompleteLattice) (V : Type) : Type := Tarski.Edge S V

/-- A **keratin complex**: a `Tarski.Complex` of directed contacts over a stalk lattice `S`. -/
abbrev KeratinComplex (S : Order.CompleteLattice) := Tarski.Complex S

/-! ## Tier 3 — lock / history: irreversible material transitions -/

/-- An **irreversible lock transition** on a stalk: felting, pilling, damage, fracture. Monotone and
**inflationary** — material state only climbs, never relaxes. -/
structure Lock (S : Order.CompleteLattice) where
  step : S.carrier → S.carrier
  step_mono : ∀ {a b}, S.le a b → S.le (step a) (step b)
  step_infl : ∀ a, S.le a (step a)

/-- **Lock states are inflationary** (irreversibility, exposed). -/
theorem lock_infl (L : Lock S) (a : S.carrier) : S.le a (L.step a) := L.step_infl a

/-- A **processing history** is a sequence of lock transitions. -/
abbrev History (S : Order.CompleteLattice) : Type := List (Lock S)

/-- Apply a history to a stalk state, latest transition outermost. -/
def runHistory : History S → S.carrier → S.carrier
  | [], a => a
  | (L :: rest), a => L.step (runHistory rest a)

/-- **History is inflationary**: the result dominates the start — a processed fiber never recovers
its initial state. -/
theorem runHistory_infl (hist : History S) (a : S.carrier) :
    S.le a (runHistory hist a) := by
  induction hist with
  | nil => exact S.le_refl a
  | cons L rest ih => exact S.le_trans ih (L.step_infl _)

/-- **History extension preserves monotonicity**: applying the same history to ordered inputs keeps
them ordered. -/
theorem runHistory_mono (hist : History S) {a b : S.carrier} (h : S.le a b) :
    S.le (runHistory hist a) (runHistory hist b) := by
  induction hist with
  | nil => exact h
  | cons L rest ih => exact L.step_mono ih

/-- **Lock a seed** vertex-wise by a per-vertex processing history. -/
def lockSeed (K : KeratinComplex S) (hist : K.Vertex → History S)
    (seed : Assign K) : Assign K :=
  fun v => runHistory (hist v) (seed v)

/-- The locked seed dominates the original seed (vertex-wise irreversibility). -/
theorem seed_le_lockSeed (K : KeratinComplex S) (hist : K.Vertex → History S)
    (seed : Assign K) : ∀ v, S.le (seed v) (lockSeed K hist seed v) :=
  fun v => runHistory_infl (hist v) (seed v)

/-- **Settling reaches a least locked compatible state.** After irreversibly locking the seed, the
settled section is the least global section dominating the locked seed: any compatible state above
the locked seed already dominates it. -/
theorem settle_lock_is_least_compatible (K : KeratinComplex S)
    (hist : K.Vertex → History S) (seed x : Assign K)
    (hcomp : IsCompatible K x)
    (hx : ∀ v, S.le (lockSeed K hist seed v) (x v)) :
    (AssignCL S K.Vertex).le (settle K (lockSeed K hist seed)) x :=
  settle_le_of_compatible K (lockSeed K hist seed) x hx hcomp

/-! ## A constructive grounding: the event lattice -/

/-- The keratin irreversible **lock events**. -/
inductive LockEvent
  | feltLock
  | pill
  | damage
  | fracture

/-- **Firing an event** is a lock transition on the powerset event lattice: it adds the event and
never removes one (monotone, inflationary set-growth = irreversibility). -/
def addEvent {E : Type} (ev : E) : Lock (Tarski.Powerset E) where
  step s := fun e => s e ∨ e = ev
  step_mono := fun {_ _} hab e h => h.elim (fun ha => Or.inl (hab e ha)) Or.inr
  step_infl := fun _ _ h => Or.inl h

/-- After firing, the event is present — the lock has taken. -/
theorem addEvent_fires {E : Type} (ev : E) (s : E → Prop) :
    (addEvent ev).step s ev := Or.inr rfl

/-- Firing only grows the event set — the prior state is never lost. -/
theorem addEvent_infl {E : Type} (ev : E) (s : E → Prop) :
    (Tarski.Powerset E).le s ((addEvent ev).step s) := (addEvent ev).step_infl s

end Relational.Material
end Infomaterial
