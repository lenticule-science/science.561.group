import Obsmetrologia.Calculus.Probability.Measure
import Obsmetrologia.Articulation.Articulating.FourCorner

/-! # Finite measurement scenarios and sheaf-theoretic contextuality

This is the first **quantum** module: the Abramsky–Brandenburger sheaf-theoretic
reading of contextuality, derived in-chain over finite measurement scenarios. Quantum
empirical structure is *not* approached through Hilbert spaces here — the corpus's
nearest socket is the **gluing obstruction** already formalized in
`Cohomology.SettlingCohomologyH1` (covers, local sections, a global section, the failure
of local data to extend). Contextuality is exactly that failure
(`content/.../sheaf` is the abstract source; the physics is Abramsky–Brandenburger 2011).

## The baseline: single-valued sheaves are never contextual

`Cohomology.h1_vanishes` proves that an *agreeing family of single sections* always glues
to a unique global section — the settling sheaf is flasque in the strict/Scott regime. That
is the **opposite** of a contextuality witness: a single-valued outcome assignment per
context can never be contextual. Here the same fact reappears as
`deterministic_not_stronglyContextual`: a model whose every context support is "agrees with
one fixed assignment" always has a global section.

contextuality therefore cannot live among single sections. It lives one level up,
in the **support** (the *set* of allowed local outcomes per context): a possibilistic
empirical model can have a nonempty support over every context yet admit no single global
assignment lying in all of them at once. That is **strong contextuality**.

## Main definitions

* `Scenario`, `Model` — a measurement cover (a list of co-measurable contexts) and a
  support predicate per context (which assignments are *allowed* locally).
* `HasGlobalSection`, `AllContextsInhabited`, `Noncontextual`, `StronglyContextual` — the
  Abramsky–Brandenburger contextuality vocabulary at the possibilistic level.
* `CompatibleFamily`, `restrictFamily` — the agreeing-family socket for single sections.
* `prBox` — the Popescu–Rohrlich box as a concrete finite model over `Fin 4`/`Bool`.

## Main results

* `globalSection_restricts_compatible` — the restrictions of one global section form a
  compatible family (the structural half of the sheaf condition).
* `deterministic_not_stronglyContextual` — a single-valued (deterministic) model is never
  contextual: the flasque baseline, the analogue of `Cohomology.h1_vanishes`.
* `prBox_strongly_contextual` — the strong-contextuality predicate is **inhabited**: the PR
  box has a nonempty support over each of its four contexts yet no global assignment lies in
  all four. Contextuality is not a vacuous socket but a realized object.

## Implementation notes

The witness is **possibilistic** (support-level): the PR box's "no global section" is the
parity obstruction `s(a)⊕s(b)=s(a)⊕s(b')=s(a')⊕s(b)=0` together with `s(a')⊕s(b')=1`,
proven by Boolean exhaustion. The *probabilistic* layer (no-signaling distributions,
CHSH/Bell numerics) builds on Obsmetrologia's internal reals
(`Probability.RealStochasticInterval`); see the sibling `Quantum` modules.

## References

`content/.../sheaf`; Abramsky & Brandenburger, *The sheaf-theoretic structure of
non-locality and contextuality* (2011). Sibling: `Cohomology.SettlingCohomologyH1`.

## Tags

contextuality, measurement scenario, empirical model, global section, PR box, sheaf
-/

namespace Obsmetrologia
namespace QuantumContextuality

/-! ## (A) Scenarios and empirical models -/

/-- A finite **measurement scenario**: the measurement cover, a list of *contexts* (each a
co-measurable set of measurements, listed). This is the cover of the Abramsky–Brandenburger
event sheaf. -/
structure Scenario (M : Type) where
  /-- The measurement cover: each context is a list of jointly-measurable measurements. -/
  contexts : List (List M)

/-- A possibilistic **empirical model** over a scenario: for each context, a *support* — the
predicate picking out which (global-shaped) outcome assignments are allowed when read on that
context. A single-valued sheaf is the degenerate case where each support is a singleton; the quantum content lives where supports are larger. -/
structure Model (M O : Type) where
  /-- The scenario the model lives over. -/
  scenario : Scenario M
  /-- The support: `support C g` holds when `g` (read on `C`) is an allowed local outcome. -/
  support : List M → (M → O) → Prop

variable {M O : Type}

/-- The model has a **global section**: one assignment `g` lying in the support of *every*
context. This is classical (noncontextual) realizability. -/
def HasGlobalSection (E : Model M O) : Prop :=
  ∃ g : M → O, ∀ C, C ∈ E.scenario.contexts → E.support C g

/-- Every context's support is **nonempty**: there is some allowed local assignment per
context. (Without this, "no global section" would be vacuously true and uninteresting.) -/
def AllContextsInhabited (E : Model M O) : Prop :=
  ∀ C, C ∈ E.scenario.contexts → ∃ g : M → O, E.support C g

/-- A model is **noncontextual** when it has a global section — the local supports extend to
a single global assignment. -/
def Noncontextual (E : Model M O) : Prop := HasGlobalSection E

/-- A model is **strongly contextual** when every context has a nonempty support yet there is
no global section: compatible local data with no global realization. This is the
Abramsky–Brandenburger failure of gluing — contextuality proper. -/
def StronglyContextual (E : Model M O) : Prop :=
  AllContextsInhabited E ∧ ¬ HasGlobalSection E

/-- **Strong contextuality unfolds to its definition** — the named Abramsky–Brandenburger
characterization: nonempty supports with no global section. -/
theorem stronglyContextual_iff (E : Model M O) :
    StronglyContextual E ↔ (AllContextsInhabited E ∧ ¬ HasGlobalSection E) :=
  Iff.rfl

/-- A global section makes every context's support nonempty (it witnesses each one). -/
theorem globalSection_inhabits (E : Model M O) (h : HasGlobalSection E) :
    AllContextsInhabited E := by
  obtain ⟨g, hg⟩ := h
  intro C hC; exact ⟨g, hg C hC⟩

/-- **Noncontextual excludes strongly contextual.** A model with a global section cannot be
strongly contextual — the two are the two sides of the gluing question. -/
theorem noncontextual_not_stronglyContextual (E : Model M O) :
    ¬ (Noncontextual E ∧ StronglyContextual E) := by
  rintro ⟨hnc, _, hns⟩; exact hns hnc

/-! ## (B) The compatible-family socket (single sections)

A *family* assigns one single section to each context. It is **compatible** when those
sections agree on shared measurements — the Čech 1-cocycle condition, mirroring
`Cohomology.Cocycle`. The structural half of the sheaf condition: restricting one global
section to the cover always yields a compatible family. -/

/-- A **family** of single local sections: one assignment per context. -/
abbrev Family (M O : Type) : Type := List M → (M → O)

/-- A family is **compatible** when its sections agree on every shared measurement: wherever
a measurement `m` lies in two contexts `C`, `C'` of the cover, the two local sections assign
`m` the same outcome. (The agreeing-family / no-signaling condition for single sections.) -/
def CompatibleFamily (S : Scenario M) (F : Family M O) : Prop :=
  ∀ C, C ∈ S.contexts → ∀ C', C' ∈ S.contexts →
    ∀ m, m ∈ C → m ∈ C' → F C m = F C' m

/-- The family obtained by **restricting one global section** `g` to every context. -/
def restrictFamily (g : M → O) : Family M O := fun _ => g

/-- **A global section restricts to a compatible family.** The restrictions of a single
global assignment agree everywhere, so they agree on overlaps — the structural half of the
sheaf condition (`global_section_restricts_compatible`). -/
theorem globalSection_restricts_compatible (S : Scenario M) (g : M → O) :
    CompatibleFamily S (restrictFamily g) := by
  intro C _ C' _ m _ _; rfl

/-- **A family that reads one global section is compatible.** If every local section of `F`
agrees, on its context, with one common assignment `g`, then `F` is compatible. (The
converse-flavored socket: a coboundary is a cocycle.) -/
theorem compatible_of_restricts_global (S : Scenario M) (F : Family M O) (g : M → O)
    (h : ∀ C, C ∈ S.contexts → ∀ m, m ∈ C → F C m = g m) :
    CompatibleFamily S F := by
  intro C hC C' hC' m hm hm'
  rw [h C hC m hm, h C' hC' m hm']

/-! ## (C) The flasque baseline — deterministic models are never contextual

The analogue of `Cohomology.h1_vanishes`: a *single-valued* (deterministic) empirical model,
whose every context support is "agrees with one fixed assignment `d`", always has `d` itself
as a global section, hence is never strongly contextual. Contextuality cannot live among
single sections. -/

/-- The **deterministic model** with hidden assignment `d`: a context allows exactly the
assignments agreeing with `d` on that context. The single-valued (sheaf) case. -/
def deterministicModel (S : Scenario M) (d : M → O) : Model M O where
  scenario := S
  support := fun C g => ∀ m, m ∈ C → g m = d m

/-- A deterministic model always has a global section: `d` itself. -/
theorem deterministic_hasGlobalSection (S : Scenario M) (d : M → O) :
    HasGlobalSection (deterministicModel S d) :=
  ⟨d, fun _ _ _ _ => rfl⟩

/-- **Deterministic models are never strongly contextual** — the flasque baseline. A
single-valued outcome assignment over the cover always extends to a global section (here `d`),
so it can carry no contextual obstruction. This is the contextuality face of
`Cohomology.h1_vanishes`: agreeing single sections always glue. -/
theorem deterministic_not_stronglyContextual (S : Scenario M) (d : M → O) :
    ¬ StronglyContextual (deterministicModel S d) := by
  rintro ⟨_, hns⟩
  exact hns (deterministic_hasGlobalSection S d)

/-! ## (D) The PR-box witness — strong contextuality is inhabited

The Popescu–Rohrlich box: two parties, two binary measurements each, two outcomes. The four
measurements are two binary axes — party × setting — so the measurement carrier **is** the
four-corner cell `Articulating.FourCorner = Bool × Bool` (`a = (false, false)`,
`a' = (false, true)`, `b = (true, false)`, `b' = (true, true)`); outcomes are `Bool`. The
four contexts are the Alice×Bob measurement pairs. The PR support requires
`s(x)⊕s(y) = (x is primed) ∧ (y is primed)`:

  `{a,b}: ⊕ = 0`, `{a,b'}: ⊕ = 0`, `{a',b}: ⊕ = 0`, `{a',b'}: ⊕ = 1`.

Each context has a nonempty support, but a global `s : Fin 4 → Bool` would need
`s a ⊕ s b = s a ⊕ s b' = s a' ⊕ s b = 0`, forcing `s a' ⊕ s b' = 0 ≠ 1` — no global
section. So the PR box is strongly contextual. -/

/-- The PR measurement carrier: the four-corner cell, read as party × setting. -/
abbrev PRM : Type := Articulating.FourCorner

/-- The measurement is **primed** (`a'` or `b'`): the setting axis of the four-corner. -/
def primed (i : PRM) : Bool := i.2

/-- The four PR contexts, the Alice×Bob measurement pairs `{a,b}, {a,b'}, {a',b}, {a',b'}`. -/
def prContexts : List (List PRM) :=
  [[(false, false), (true, false)], [(false, false), (true, true)],
   [(false, true), (true, false)], [(false, true), (true, true)]]

/-- The PR scenario. -/
def prScenario : Scenario PRM := ⟨prContexts⟩

/-- The PR support indicator on a two-measurement context `[i, j]`: the outcomes are allowed
iff `g i ⊕ g j` equals `(primed i) ∧ (primed j)` — the PR correlations. -/
def prAllowedB (C : List PRM) (g : PRM → Bool) : Bool :=
  C.casesOn (motive := fun _ => Bool) false
    (fun i t => t.casesOn (motive := fun _ => Bool) false
      (fun j t' => t'.casesOn (motive := fun _ => Bool)
        ((g i != g j) == (primed i && primed j)) (fun _ _ => false)))

/-- The **PR-box empirical model**. -/
def prBox : Model PRM Bool where
  scenario := prScenario
  support := fun C g => prAllowedB C g = true

/-- **Every PR context has a nonempty support.** Each of the four contexts admits an allowed
local assignment (three are satisfied by the constant `false`; `{a',b'}` by an assignment
with `s a' ≠ s b'`). -/
theorem prBox_inhabited : AllContextsInhabited prBox := by
  intro C hC
  have hC' : C ∈ prContexts := hC
  unfold prContexts at hC'
  cases hC' with
  | head => exact ⟨fun _ => false, by show prAllowedB _ _ = true; decide⟩
  | tail _ hC2 => cases hC2 with
    | head => exact ⟨fun _ => false, by show prAllowedB _ _ = true; decide⟩
    | tail _ hC3 => cases hC3 with
      | head => exact ⟨fun _ => false, by show prAllowedB _ _ = true; decide⟩
      | tail _ hC4 => cases hC4 with
        | head => exact ⟨fun m => m.1 && m.2, by show prAllowedB _ _ = true; decide⟩
        | tail _ hC5 => exact absurd hC5 List.not_mem_nil

/-- **The PR box has no global section.** A global `g : Fin 4 → Bool` lying in all four
supports forces `g 0 ⊕ g 2 = g 0 ⊕ g 3 = g 1 ⊕ g 2 = 0` and `g 1 ⊕ g 3 = 1`, an
impossibility — the PR parity obstruction, by Boolean exhaustion. -/
theorem prBox_no_global : ¬ HasGlobalSection prBox := by
  rintro ⟨g, hg⟩
  have h0 : ((g (false, false) != g (true, false))
      == (primed (false, false) && primed (true, false))) = true :=
    hg [(false, false), (true, false)] (List.Mem.head _)
  have h1 : ((g (false, false) != g (true, true))
      == (primed (false, false) && primed (true, true))) = true :=
    hg [(false, false), (true, true)] (List.Mem.tail _ (List.Mem.head _))
  have h2 : ((g (false, true) != g (true, false))
      == (primed (false, true) && primed (true, false))) = true :=
    hg [(false, true), (true, false)] (List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _)))
  have h3 : ((g (false, true) != g (true, true))
      == (primed (false, true) && primed (true, true))) = true :=
    hg [(false, true), (true, true)]
      (List.Mem.tail _ (List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _))))
  unfold primed at h0 h1 h2 h3
  revert h0 h1 h2 h3
  cases g (false, false) <;> cases g (false, true) <;>
    cases g (true, false) <;> cases g (true, true) <;> decide

/-- **The PR box is strongly contextual — contextuality is inhabited.** The strong
contextuality predicate is not a vacuous socket: the PR box realizes it, with a nonempty
support over each of its four contexts (`prBox_inhabited`) and no global assignment lying in
all four (`prBox_no_global`). This is the Abramsky–Brandenburger gluing obstruction made
concrete — the quantum face of the failure of local outcome data to extend globally,
exactly where `Cohomology.h1_vanishes` does *not* reach (it is single-valued; this is
support-level). -/
theorem prBox_strongly_contextual : StronglyContextual prBox :=
  ⟨prBox_inhabited, prBox_no_global⟩

end QuantumContextuality
end Obsmetrologia
