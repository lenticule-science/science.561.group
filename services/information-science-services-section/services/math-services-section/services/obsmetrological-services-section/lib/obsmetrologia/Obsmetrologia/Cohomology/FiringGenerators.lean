import Obsmetrologia.AperiodicOrder.Tiling.Witness.JeandelRao
import Obsmetrologia.AperiodicOrder.Tiling.Classification
import Obsmetrologia.Dynamics.Flow.NSCFiring
import Obsmetrologia.Closure.Ordinal
import Obsmetrologia.Closure.Scott
import Obsmetrologia.Language.Positing.Reading

/-!
# `H¹`-generators at non-Scott-continuous firing ordinals — the transfinite-bounded witness

Ports the never-formalized corpus sketch
`…/settling/content/sheaf/content/settling-cohomology/references/transfinite-bounded-regime-h1-generators.md`:

> For a knowledge presheaf in the transfinite-bounded regime with closure ordinal
> `ω < κ < ω₁`: `H¹(T*_{≤κ}, F_U) ≅ ⊕_{μ ∈ L_ns(κ)} ℤ`, one copy of `ℤ` per
> non-Scott-continuous firing ordinal below `κ`. At each firing `μ`, the settling's
> failure to commute with filtered colimits produces a cokernel in the chain map
> `colim_σ F_U|_σ → F_U|_μ` — this cokernel contributes exactly one new generator
> `e_μ`, a cocycle (nothing later eliminates it) that is not a coboundary (nothing
> earlier reaches it). The `{e_μ}` are `ℤ`-linearly independent: a vanishing
> combination `Σ a_μ e_μ = 0` would put the least-indexed nonzero term in the image
> of an earlier stage, contradicting its newly-addedness.

This is the **first witness** making `cohomologyVanishes transfiniteBounded = false`
(`Closure.Regime.cohomologyVanishes`) true **by construction** rather than by table
stipulation — the transfinite-bounded analogue of
`AperiodicOrder.Tiling.Classification.aperiodicWitness`.

## The model

Following the **Jeandel–Rao pattern**
(`AperiodicOrder.Tiling.Witness.JeandelRao.OneVertexComplex`): a finite **one-vertex**
Anderson–Putnam cochain complex has `δ⁰ = 0` for free (one vertex), so a nonzero cocycle
already represents a nonzero `H¹` class (`NonzeroH1Class`).

* **Edges = firing stages.** `FiringEdge` is a finite stand-in for a finite subset
  `{μ₀, μ₁, μ₂} ⊆ L_ns(κ)` of non-Scott-continuous firing ordinals (the corpus's `κ`
  is realized concretely as `Ord.omega = Ord.limit Ord.ofNat`, a genuine limit stage —
  `Closure.Ordinal`; at each such stage the responsible mechanism is an instance of the
  `∀`-antecedent firing operator `Flow.NSCFiring.forallAnteOp`, which fires on every
  sub-top stage but *retracts* the assembled join `⊤ₖ ↦ ⊥ₖ`, so it fails to commute with
  the stage-prefix join — `Flow.NSCFiring.forallAnteOp_isNSC` is the concrete NSC-firing
  witness this module builds on).
* **No faces — the jump degree.** `firingComplex` has `Face := Empty`: nothing in the
  complex acts on a firing edge from a later stage (no later firing eliminates the
  jump cochain — the kernel condition of the corpus proof is vacuous, the degenerate
  case of a cokernel against the zero map) and nothing reaches it from an earlier one
  (the edges are the *newly-added* cells, disjoint by support). So `δ¹ = 0` identically:
  the jump-degree cokernel is realized as the whole of `C¹`.
* **The jump value is derived, not posited.** `readingLevel : Reading → Int` reads a
  bilattice charge's level (`⊤ₖ ↦ 1`, else `0`); `jumpValue := readingLevel ⊤ₖ −
  readingLevel (forallAnteOp ⊤ₖ)` is the integer size of `forallAnteOp`'s genuine
  retraction at the assembled top (`forallAnteOp ⊤ₖ = ⊥ₖ`,
  `Flow.NSCFiring.forallAnteOp_kTop`). We prove `jumpValue = 1 ≠ 0`
  (`jumpValue_eq_one`/`jumpValue_ne_zero`) — the nonzero-ness of every generator below
  is this fact, not a bare integer literal.
* **Generators.** `firingGen i : FiringEdge → Int` is the Kronecker-delta cochain at `i`,
  scaled by `jumpValue`: `firingGen i i = jumpValue`, `firingGen i j = 0` for `j ≠ i` —
  exactly the corpus's `e_μ`, supported only at its own firing stage.

## Main results

* `firingGen_nonzero_h1_class` — **(1)** every `e_μ = firingGen i` is a `NonzeroH1Class`
  of `firingComplex`.
* `firingLinComb_eq_zero_iff` — **(2)** for `k = 3` concrete firing stages, the
  generators `{firingGen e0, firingGen e1, firingGen e2}` are `ℤ`-linearly independent:
  a combination `Σᵢ aᵢ · firingGen i` is the zero cochain iff every `aᵢ = 0`. The general
  pattern for `k` firing stages is the same Kronecker-delta argument, evaluated pointwise
  at each `μᵢ` — the corpus's "the least-indexed nonzero term would be in the image of an
  earlier stage" is here simply "evaluate at that edge, everything else vanishes by
  support-disjointness".
* `tbWitness` / `tbWitness_clinv_nonzero` / `tbWitness_classifies` /
  `tbWitness_regime_via_ord` — **(3)** the transfinite-bounded analogue of
  `AperiodicOrder.Tiling.Classification.aperiodicWitness`: a concrete `Settling` whose
  regime data classifies to `ClosureRegime.transfiniteBounded` via **both** routes named
  in the corpus — the Boolean-flag `classify` (reusing `Flow.NSCFiring.nscRegimeData`,
  whose `scottContinuous = false` records the `forallAnteOp` witness) and the real-ordinal
  `Ord.regimeOfOrdHonest` at the genuine limit stage `Ord.omega` — and which carries a
  *proven* nonzero `H¹` class (`clInv = [firingGen e0] ≠ 0`).
* `scott_no_nonzero_h1_class` / `scott_flow_has_no_firing_edges` — the **vanishing
  contrast**: the same construction run over a Scott-continuous (no-firing) flow has
  `L_ns(κ) = ∅` — over the finite reading carrier *every* closure has no NSC firing
  (`Flow.NSCFiring.no_nsc_firing_of_closure`) — so the firing-edge set collapses to
  `Empty` and `scottComplex` admits no nonzero `H¹` class at all (not even the trivial
  one, since there is no edge to be nonzero at).
* `transfiniteBounded_h1_generators` — the headline, bundling all four.

## Scope

This is a **finite witness**, exactly in the sense of the Jeandel–Rao module: it does not
build the full transfinite `⊕_{μ ∈ L_ns(κ)} ℤ` for an actual uncountable/countable-limit
`κ`, nor the chain map `colim_σ F_U|_σ → F_U|_μ` whose cokernel the corpus computes — it
exhibits `k = 3` concrete non-Scott-continuous-firing generators, proves they are nonzero
and linearly independent, and packages the result as a regime witness exactly parallel to
`aperiodicWitness`. Promoting this to the literal countable direct sum over `L_ns(κ)` for
a genuine `Ord.limit`-indexed firing set is the open frontier (mirrors the Jeandel–Rao
module's own `thm:jeandel-rao-persistence` frontier note).
-/

namespace Obsmetrologia
namespace Cohomology.FiringGenerators

open Obsmetrologia.AperiodicOrder.Tiling
open Obsmetrologia.AperiodicOrder.Tiling.Witness

/-! ## (A) The finite firing-stage index

`FiringEdge` is the finite stand-in for `{μ₀, μ₁, μ₂} ⊆ L_ns(κ)`, three concrete
non-Scott-continuous firing stages below a transfinite-bounded closure ordinal. -/

/-- Three concrete firing stages `μ₀ < μ₁ < μ₂ ∈ L_ns(κ)`. -/
inductive FiringEdge | e0 | e1 | e2
  deriving DecidableEq, Repr

/-! ## (B) The jump value, derived from the concrete `forallAnteOp` NSC firing

`readingLevel` reads a bilattice reading as an integer level; `jumpValue` is the size of
`forallAnteOp`'s genuine retraction `⊤ₖ ↦ ⊥ₖ` at the assembled join — the finite-carrier
witness (`Flow.NSCFiring.forallAnteOp_isNSC`) that the firing really jumps. -/

/-- The reading level: `⊤ₖ ↦ 1`, every other reading `↦ 0`. Just enough to detect
`forallAnteOp`'s retraction `⊤ₖ ↦ ⊥ₖ` as a nonzero integer difference. -/
def readingLevel : Reading → Int
  | Articulating.Corner.stable => 1
  | _ => 0

/-- **The jump value** — the integer size of `forallAnteOp`'s retraction at the
assembled top: `readingLevel ⊤ₖ − readingLevel (forallAnteOp ⊤ₖ)`. This is the quantity
every firing generator below is built from; it is *derived* from the concrete NSC
firing witness, not posited. -/
def jumpValue : Int := readingLevel Reading.kTop - readingLevel (Flow.NSCFiring.forallAnteOp Reading.kTop)

/-- **The jump is exactly `1`.** `forallAnteOp ⊤ₖ = ⊥ₖ` (`forallAnteOp_kTop`), so
`readingLevel ⊤ₖ − readingLevel ⊥ₖ = 1 − 0 = 1`. The firing genuinely jumps: the retracted
value differs from the assembled join by a full unit. -/
theorem jumpValue_eq_one : jumpValue = 1 := by
  unfold jumpValue
  rw [Flow.NSCFiring.forallAnteOp_kTop]
  decide

/-- **The jump is nonzero.** Immediate from `jumpValue_eq_one`. -/
theorem jumpValue_ne_zero : jumpValue ≠ 0 := by rw [jumpValue_eq_one]; decide

/-! ## (C) The generators `e_μ` — Kronecker-delta cochains scaled by the jump

`firingGen i` is the corpus's `e_μ` at firing stage `i`: nonzero (`= jumpValue`) exactly
at its own edge, zero at every other — the "newly-added cell not in the image of any
earlier stage" read as disjoint support. -/

/-- The generator cochain at firing stage `i`: `firingGen i i = jumpValue`,
`firingGen i j = 0` for `j ≠ i`. -/
def firingGen (i e : FiringEdge) : Int := if e = i then jumpValue else 0

@[simp] theorem firingGen_self (i : FiringEdge) : firingGen i i = jumpValue := by
  unfold firingGen; exact if_pos rfl

/-- The generator at `i` is `1` there (the jump, evaluated). -/
theorem firingGen_self_eq_one (i : FiringEdge) : firingGen i i = 1 := by
  rw [firingGen_self, jumpValue_eq_one]

/-- The generator at `i` vanishes at every other edge — disjoint support. -/
theorem firingGen_off {i e : FiringEdge} (h : e ≠ i) : firingGen i e = 0 := by
  unfold firingGen; exact if_neg h

/-- The generator at its own edge is nonzero. -/
theorem firingGen_diag_ne_zero (i : FiringEdge) : firingGen i i ≠ 0 := by
  rw [firingGen_self]; exact jumpValue_ne_zero

/-! ## (D) The one-vertex firing complex — `δ¹ = 0`, the jump-degree cokernel

`Face := Empty`: no later firing eliminates a jump cochain (the kernel condition of the
corpus proof — "in the kernel of the next differential because no later firing eliminates
it" — is vacuous here, the degenerate cokernel-against-the-zero-map case), and no earlier
stage reaches a firing edge (disjoint support, built into `firingGen`). So every cochain
on `firingComplex` is automatically a cocycle. -/

/-- The one-vertex Anderson–Putnam complex whose edges are the three firing stages and
whose face set is empty (no differential — the jump-degree cokernel realized as all of
`C¹`). -/
def firingComplex : OneVertexComplex where
  Edge := FiringEdge
  Face := Empty
  edges := [FiringEdge.e0, FiringEdge.e1, FiringEdge.e2]
  d2 := fun f _ => f.elim

/-- Every cochain on `firingComplex` is a cocycle — `Face` is empty, so `δ¹` is
identically zero. -/
theorem firingGen_closed (i : FiringEdge) : firingComplex.IsCocycle (firingGen i) :=
  fun f => f.elim

/-- **(1) Every firing generator is a nonzero `H¹` class.** `firingGen i` is a cocycle
(vacuously, `firingGen_closed`) and nonzero at its own edge (`firingGen_diag_ne_zero`) —
exactly the corpus's "`[e_μ] ∈ H¹` is non-zero" at each non-Scott-continuous firing `μ`.
Since `firingComplex` is one-vertex, `δ⁰ = 0`, so this cocycle already represents a
nonzero class (no coboundary to quotient by). -/
theorem firingGen_nonzero_h1_class (i : FiringEdge) :
    firingComplex.NonzeroH1Class (firingGen i) :=
  ⟨firingGen_closed i, ⟨i, firingGen_diag_ne_zero i⟩⟩

/-! ## (E) `ℤ`-linear independence of the three firing generators

The corpus argument: a vanishing combination `Σ aᵢ eᵢ = 0` forces the least-indexed
nonzero coefficient's term into the image of an earlier stage, contradicting
newly-addedness. Here, with disjoint support built in, this is simply: evaluate the
combination pointwise at each `μᵢ`; every other term vanishes by disjointness, leaving
`aᵢ = 0` directly. -/

/-- The `ℤ`-linear combination `a₀ · e₀ + a₁ · e₁ + a₂ · e₂` as a cochain on
`firingComplex`. -/
def firingLinComb (a : FiringEdge → Int) : FiringEdge → Int :=
  fun e => a FiringEdge.e0 * firingGen FiringEdge.e0 e
          + a FiringEdge.e1 * firingGen FiringEdge.e1 e
          + a FiringEdge.e2 * firingGen FiringEdge.e2 e

theorem firingLinComb_e0 (a : FiringEdge → Int) :
    firingLinComb a FiringEdge.e0 = a FiringEdge.e0 := by
  show a FiringEdge.e0 * firingGen FiringEdge.e0 FiringEdge.e0
      + a FiringEdge.e1 * firingGen FiringEdge.e1 FiringEdge.e0
      + a FiringEdge.e2 * firingGen FiringEdge.e2 FiringEdge.e0 = a FiringEdge.e0
  rw [firingGen_self_eq_one FiringEdge.e0,
      firingGen_off (show FiringEdge.e0 ≠ FiringEdge.e1 by decide),
      firingGen_off (show FiringEdge.e0 ≠ FiringEdge.e2 by decide)]
  simp

theorem firingLinComb_e1 (a : FiringEdge → Int) :
    firingLinComb a FiringEdge.e1 = a FiringEdge.e1 := by
  show a FiringEdge.e0 * firingGen FiringEdge.e0 FiringEdge.e1
      + a FiringEdge.e1 * firingGen FiringEdge.e1 FiringEdge.e1
      + a FiringEdge.e2 * firingGen FiringEdge.e2 FiringEdge.e1 = a FiringEdge.e1
  rw [firingGen_self_eq_one FiringEdge.e1,
      firingGen_off (show FiringEdge.e1 ≠ FiringEdge.e0 by decide),
      firingGen_off (show FiringEdge.e1 ≠ FiringEdge.e2 by decide)]
  simp

theorem firingLinComb_e2 (a : FiringEdge → Int) :
    firingLinComb a FiringEdge.e2 = a FiringEdge.e2 := by
  show a FiringEdge.e0 * firingGen FiringEdge.e0 FiringEdge.e2
      + a FiringEdge.e1 * firingGen FiringEdge.e1 FiringEdge.e2
      + a FiringEdge.e2 * firingGen FiringEdge.e2 FiringEdge.e2 = a FiringEdge.e2
  rw [firingGen_self_eq_one FiringEdge.e2,
      firingGen_off (show FiringEdge.e2 ≠ FiringEdge.e0 by decide),
      firingGen_off (show FiringEdge.e2 ≠ FiringEdge.e1 by decide)]
  simp

/-- **(2) The three firing generators are `ℤ`-linearly independent.** A combination
`Σᵢ aᵢ · firingGen i` is the zero cochain iff every coefficient is zero — pointwise
evaluation at each `μᵢ` isolates `aᵢ` exactly, by the generators' disjoint support. This
is the general pattern for any finite `{μ₁, …, μₖ} ⊆ L_ns(κ)`: the Kronecker-delta
generators of a rank-`k` free abelian group, made concrete here at `k = 3`. -/
theorem firingLinComb_eq_zero_iff (a : FiringEdge → Int) :
    firingLinComb a = (fun _ => 0) ↔
      (a FiringEdge.e0 = 0 ∧ a FiringEdge.e1 = 0 ∧ a FiringEdge.e2 = 0) := by
  constructor
  · intro h
    refine ⟨?_, ?_, ?_⟩
    · have h0 := congrFun h FiringEdge.e0; rwa [firingLinComb_e0] at h0
    · have h1 := congrFun h FiringEdge.e1; rwa [firingLinComb_e1] at h1
    · have h2 := congrFun h FiringEdge.e2; rwa [firingLinComb_e2] at h2
  · rintro ⟨h0, h1, h2⟩
    funext e
    cases e
    · rw [firingLinComb_e0, h0]
    · rw [firingLinComb_e1, h1]
    · rw [firingLinComb_e2, h2]

/-! ## (F) The transfinite-bounded witness — the `aperiodicWitness` analogue

Packages `firingGen FiringEdge.e0` as a `Settling` (`AperiodicOrder.Tiling.Classification`)
in the `transfiniteBounded` regime with a proven nonzero `cl-inv`, exactly parallel to
`aperiodicWitness`. The regime is pinned down via **both** routes the corpus names:
the decidable-flag `classify` (reusing `Flow.NSCFiring.nscRegimeData`) and the real-ordinal
`Ord.regimeOfOrdHonest` at the genuine limit stage `Ord.omega`. -/

/-- The `H¹`-carrier: the firing complex, the generator at `μ₀`, its (vacuous) closedness. -/
def tbCarrier : H1Carrier where
  K := firingComplex
  cochain := firingGen FiringEdge.e0
  gen := FiringEdge.e0
  closed := firingGen_closed FiringEdge.e0

/-- **The transfinite-bounded witness.** A concrete `Settling` in the
`transfiniteBounded` regime whose `cl-inv` is derived from `firingGen FiringEdge.e0` — the
first non-Scott-continuous firing generator. Its `vanishing` constraint is *vacuously*
satisfied since `cohomologyVanishes transfiniteBounded = false`. -/
def tbWitness : Settling where
  regime := ClosureRegime.transfiniteBounded
  carrier := tbCarrier
  vanishing := fun h => by simp [cohomologyVanishes] at h

/-- **The witness classifies to `transfiniteBounded` via the decidable-flag route.**
Reuses `Flow.NSCFiring.nscRegimeData` (`scottContinuous = false`, recording the
`forallAnteOp` witness, `countableCofinality = true`) and
`Flow.NSCFiring.nscRegimeData_transfiniteBounded`. -/
theorem tbWitness_classifies : tbWitness.regime = classify Flow.NSCFiring.nscRegimeData :=
  Flow.NSCFiring.nscRegimeData_transfiniteBounded.symm

/-- **The witness classifies to `transfiniteBounded` via the real-ordinal route.**
`Ord.regimeOfOrdHonest` at the genuine limit ordinal `Ord.omega = Ord.limit Ord.ofNat`
(non-Scott-continuous, `scottContinuous := false`) computes to `transfiniteBounded`
directly — `isFinite Ord.omega = false` (a limit ordinal), so the classifier falls past
`strict`, and `scottContinuous = false` sends it past `scott` to `transfiniteBounded`. -/
theorem tbWitness_regime_via_ord :
    tbWitness.regime = Obsmetrologia.Ord.regimeOfOrdHonest Obsmetrologia.Ord.omega false := rfl

/-- **The witness has nonzero `cl-inv`.** `cl-inv(tbWitness) = [firingGen e0] ≠ 0`: its
value at the generator edge is `firingGen e0 e0 = jumpValue ≠ 0`
(`firingGen_diag_ne_zero`) — the firing genuinely jumps, so the class is nonzero. This is
the **first witness** making `cohomologyVanishes transfiniteBounded = false` true by a
constructed nonzero class, not by table stipulation. -/
theorem tbWitness_clinv_nonzero : tbWitness.clInv ≠ H1Class.zero :=
  fun h => firingGen_diag_ne_zero FiringEdge.e0 (congrArg H1Class.coord h)

/-! ## (G) The vanishing contrast — a Scott-continuous (no-firing) flow

Over the finite reading carrier **every** closure has no NSC firing
(`Flow.NSCFiring.no_nsc_firing_of_closure`): `L_ns(κ) = ∅`. Read off through the same
construction, the firing-edge set collapses to `Empty`, and the resulting complex admits
no nonzero `H¹` class at all — not even a trivial one, since there is no edge left to be
nonzero at. -/

/-- The same one-vertex construction run on a Scott-continuous (no-firing) flow: the
firing-edge set is `Empty` (no `μ ∈ L_ns(κ)`), so there is no differential and no edge. -/
def scottComplex : OneVertexComplex where
  Edge := Empty
  Face := Empty
  edges := []
  d2 := fun f _ => f.elim

/-- The unique cochain on `scottComplex` is the zero cochain — vacuously, since there is
no edge to differ at. -/
theorem scottComplex_cochain_eq_zero (phi : scottComplex.Edge → Int) :
    phi = (fun _ => (0 : Int)) := funext (fun e => e.elim)

/-- **The vanishing contrast.** A Scott-continuous (no-firing) flow's complex has **no**
nonzero `H¹` class: `NonzeroH1Class` demands a witnessing edge, and `scottComplex.Edge`
is empty. This is the corpus's "in a Scott-continuous closure `L_ns(κ)` is empty" read at
the level of the cohomology witness itself — the sharpest possible form of "only zero
cocycles". -/
theorem scott_no_nonzero_h1_class :
    ¬ ∃ phi : scottComplex.Edge → Int, scottComplex.NonzeroH1Class phi := by
  rintro ⟨_, _, e, _⟩
  exact e.elim

/-- The structural reason `scottComplex` has no firing edges: every reading-closure over
the finite carrier has no NSC firing (`Flow.NSCFiring.no_nsc_firing_of_closure`, from
`Closure.Scott.finite_scott_continuous` — directed joins are attained, so closures commute
with them). -/
theorem scott_flow_has_no_firing_edges :
    ∀ (cl : Obsmetrologia.Reading.Closure) (S : Obsmetrologia.Closure.Scott.DirectedFamily),
      ¬ Flow.NSCFiring.IsNSC cl.op S :=
  Flow.NSCFiring.no_nsc_firing_of_closure

/-! ## (H) Headline -/

/-- **`H¹`-generators at non-Scott-continuous firing ordinals — the transfinite-bounded
witness.** Bundles the four pieces of the ported corpus sketch:

* **(1)** every firing generator `firingGen i` is a nonzero `H¹` class of `firingComplex`
  (`firingGen_nonzero_h1_class`);
* **(2)** the `k = 3` concrete firing generators are `ℤ`-linearly independent
  (`firingLinComb_eq_zero_iff`);
* **(3)** the transfinite-bounded witness `tbWitness` classifies to
  `ClosureRegime.transfiniteBounded` via both the decidable-flag route (`classify
  nscRegimeData`) and the real-ordinal route (`Ord.regimeOfOrdHonest Ord.omega false`),
  and carries a *proven* nonzero `cl-inv` — the first witness making
  `cohomologyVanishes transfiniteBounded = false` true by construction;
* **(vanishing contrast)** the same construction over a Scott-continuous (no-firing) flow
  has no nonzero `H¹` class at all — `L_ns(κ) = ∅` collapses the firing-edge set to
  `Empty`.

Depends only on `propext`/`Quot.sound` (`decide`/`omega`-free arithmetic reasoning beyond
the finite `decide` calls; no `sorry`/`axiom`/`opaque`/`native_decide`). -/
theorem transfiniteBounded_h1_generators :
    (∀ i : FiringEdge, firingComplex.NonzeroH1Class (firingGen i))
    ∧ (∀ a : FiringEdge → Int, firingLinComb a = (fun _ => 0) ↔
        (a FiringEdge.e0 = 0 ∧ a FiringEdge.e1 = 0 ∧ a FiringEdge.e2 = 0))
    ∧ (tbWitness.regime = classify Flow.NSCFiring.nscRegimeData
        ∧ tbWitness.regime = Obsmetrologia.Ord.regimeOfOrdHonest Obsmetrologia.Ord.omega false
        ∧ tbWitness.clInv ≠ H1Class.zero)
    ∧ ¬ ∃ phi : scottComplex.Edge → Int, scottComplex.NonzeroH1Class phi :=
  ⟨firingGen_nonzero_h1_class, firingLinComb_eq_zero_iff,
   ⟨tbWitness_classifies, tbWitness_regime_via_ord, tbWitness_clinv_nonzero⟩,
   scott_no_nonzero_h1_class⟩

end Cohomology.FiringGenerators
end Obsmetrologia
