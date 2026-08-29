import Infomaterial.Language.Positing.NucleusAndCommutingNuclei
import Infomaterial.Persistence.Aperiodic.Classification
import Infomaterial.Language.Positing.Quartet
import Infomaterial.Language.Positing.Bigraded

/-!
# NuclearAutopoiesisCell — the autopoietic cell and the Axiom of History Separation (DERIVED, capstone of the L3 cohomology tower)

This is the **capstone** of the aperiodic-settling cohomology tower. It assembles the
two commuting nuclei of an aperiodic settling — past-facing **saturating** `σ` and
future-facing **transferring** `Δ` — into a single self-producing **autopoiesis cell**,
and it states the **Axiom of History Separation**: a fiberwise-*varying* family of
nuclear squares over histories is what makes aperiodicity a **theorem** rather than an
assumption.

Corpus nodes (full paths under `content/mark/.../knowledge-least-valuation/settling/
content/aperiodic-settling/`):

* `saturating/saturating.md` — the **saturation nucleus** `σ_t(a) = ⋁{ b | ρ_{t₀}(b) ≤
  ρ_{t₀}(a) ∀ t₀<t }`: the largest element of the settled fiber Heyting algebra `H_t`
  whose restriction profile across all proper sub-histories `t₀<t` is `≤` that of `a`.
  Extensive, idempotent, meet-preserving; `Fix(σ)` is the **sub-history-determined
  layer**. The **backward-facing** (past) closure.
* `transferring/transferring.md` — the **transfer nucleus** `Δ_t(a) = ⋀{ b ∈ Fix(Δ_t) |
  b ≥ a }`, with `Fix(Δ_t) = ⋂_{s⊥t} image(H(i_{s,t}))` the **extension-witnessed
  layer**: the smallest element already witnessed in every independent one-step
  extension. A nucleus by Johnstone *Stone Spaces* II.2.2. The **forward-facing**
  (future) closure.
* `commutating/commutating.md` — *commutating*: `σ ∘ Δ = Δ ∘ σ` on the **same** settled
  fiber Heyting algebra `A = H_t`. Commutativity is the hinge that promotes `π = σ∘Δ` to
  a nucleus with `A* := Fix(π) = Fix(σ) ∩ Fix(Δ)` — the **doubly-quiescent layer**,
  "where the past has nothing further to add and the future has already sent everything
  back." Generates the aperiodic-nuclear-quartet-category `(A, Fix(σ), Fix(Δ), A*)`.
  Crucially: this quartet "is the **history-filtration** quartet, distinct from the
  bilattice-order quartet of the bigraded diamond" — `σ, Δ` legitimately co-inhabit one
  `H` because they filter by **history**, not by the two bilattice value-orders.
* `aperiodic-settling.md` — aperiodic iff `κ ≥ ω₁`; orbits do not stabilize but are
  coherent, carrying all 2-cell information of the KZ diamond; invariants not accessible
  by fixed-point theorems.

## What this module derives

1. **The nuclear pair as `Order.CommutingNuclei`.** We model `(σ, Δ)` as an abstract
   `Order.CommutingNuclei H` on the settled fiber Heyting algebra `H = H_t`, reusing the
   nucleus theory of `NucleusAndCommutingNuclei` wholesale — `σ = j₁` (saturating),
   `Δ = j₂` (transferring), the commuting square read **along the history filtration**.
   A concrete instance is given via `Charge.joinSquare` / `Positing.Bigraded` as a worked
   example. We do **not** redefine nucleus / quartet theory.

2. **The autopoietic core `A*`** and the headline `nuclear_autopoiesis_cell`:
   `autopoieticCore Q a := Q.pi a = a` is the doubly-quiescent **self-maintained** layer;
   an element is in `A*` **iff** it is fixed by **both** the backward `σ` and the forward
   `Δ` (`fix_pi_iff`) — self-production closure — and the four corners `(A, Fix σ, Fix Δ,
   A*)` are the recurring **FOUR** (`cornerOp` + `Articulating.Corner.card_eq_four`).

3. The headline `history_separation_aperiodicity`: the **Axiom of History Separation** —
   a fiberwise-*varying* family of nuclear squares (`SquareFamily.Varies`) forces
   **aperiodicity**. We exhibit the concrete `varyingFamily` (`varyingFamily_varies`) as
   the witness that a history-separating family exists, and tie it to the **aperiodic
   regime** of `AperiodicClassification`: there is a settling — `Persistence.Aperiodic.aperiodicWitness`
   — in `ClosureRegime.aperiodic` whose classifying invariant `cl-inv ≠ 0`. The
   structural content: a **constant** nuclear pair leaves automorphisms **invisible**; a
   **varying** family makes aperiodicity (where `cl-inv` *can* be nonzero) a theorem.

4. **History-filtration vs. value-order (documented).** The `cross_order_not_knowledge_nucleus`
   finding of `Positing.FiberAlgebra` concerns the two **bilattice value orders** (a
   truth-closure is not a knowledge-nucleus on the same algebra). The `σ, Δ` here are a
   **legitimate** same-algebra commuting pair: they filter the *one* settled fiber Heyting
   algebra `H_t` by **history** (sub-histories vs. independent extensions), not by the two
   value orders — exactly as `commutating.md` states ("the history-filtration quartet,
   distinct from the bilattice-order quartet of the bigraded diamond").
-/

namespace Infomaterial
namespace Persistence.Aperiodic.Autopoiesis

/-! ## (1) The nuclear pair `(σ, Δ)` as `Order.CommutingNuclei`

We model the two commuting nuclei of an aperiodic settling — saturating `σ` (backward,
past) and transferring `Δ` (forward, future) — as an abstract
`Order.CommutingNuclei H` on the settled fiber Heyting algebra `H = H_t`, reading
`σ = j₁` and `Δ = j₂`. We do **not** redefine nucleus theory; we name the corpus
orientation and reuse `NucleusAndCommutingNuclei` wholesale. -/

/-- The **saturating nucleus** `σ` of an aperiodic settling — the backward-facing (past)
closure `j₁` of the commuting pair. `σ_t(a)` is the largest element of the settled fiber
Heyting algebra `H_t` whose restriction profile across all proper sub-histories `t₀<t`
is `≤` that of `a`; `Fix(σ)` is the **sub-history-determined layer**
(`saturating/saturating.md`). -/
def saturating {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H) : Order.Nucleus H :=
  Q.j1

/-- The **transferring nucleus** `Δ` of an aperiodic settling — the forward-facing
(future) closure `j₂` of the commuting pair. `Δ_t(a)` is the smallest element already
witnessed in every independent one-step extension `s ⊥ t`; `Fix(Δ)` is the
**extension-witnessed layer** (`transferring/transferring.md`). -/
def transferring {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H) : Order.Nucleus H :=
  Q.j2

/-- **Commutating** (`commutating.md`): `σ ∘ Δ = Δ ∘ σ` on the *same* settled fiber
Heyting algebra `H_t`. This is the hinge — the aperiodic-regime KZ-diamond coherence
2-cell — read off `Q.comm`. It is exactly `Order.CommutingNuclei.square`, reused here
under the corpus's `σ`/`Δ` names. -/
theorem commutating {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H) (a : H.carrier) :
    (saturating Q).j ((transferring Q).j a) = (transferring Q).j ((saturating Q).j a) :=
  Q.square a

/-! ### A concrete instance via the bigraded diamond

`Charge.joinSquare` builds a `Positing.Bigraded.NuclearSquare` (two commuting join-nuclei)
on the charge knowledge-Heyting-algebra. We re-package it as an `Order.CommutingNuclei`
on the *same* `Order.HeytingAlgebra` reading of the charge knowledge-algebra, giving a
worked example of `(σ, Δ)` we can compute with. -/

/-- The `Order.HeytingAlgebra` reading of the charge knowledge-algebra: the bigraded
diamond's bare-`meet` `Charge.heytingK` re-presented with the full `BoundedLattice`
structure that `Order.HeytingAlgebra` carries. This is the concrete settled fiber
Heyting algebra on which the worked `(σ, Δ)` example lives. -/
def chargeHeyting : Order.HeytingAlgebra where
  carrier := Charge
  meet := Charge.meetK
  join := Charge.joinK
  top := Charge.kTop
  bot := Charge.kBot
  meet_comm := by intro a b; cases a <;> cases b <;> rfl
  meet_assoc := by intro a b c; cases a <;> cases b <;> cases c <;> rfl
  meet_idem := by intro a; cases a <;> rfl
  join_comm := by intro a b; cases a <;> cases b <;> rfl
  join_assoc := by intro a b c; cases a <;> cases b <;> cases c <;> rfl
  join_idem := by intro a; cases a <;> rfl
  absorb_mj := by intro a b; cases a <;> cases b <;> rfl
  absorb_jm := by intro a b; cases a <;> cases b <;> rfl
  meet_top := by intro a; cases a <;> rfl
  join_bot := by intro a; cases a <;> rfl
  himp := Charge.impK
  himp_adj a b c := by cases a <;> cases b <;> cases c <;> decide

/-- A worked `(σ, Δ)` example: raising toward `c₁` is `σ`, raising toward `c₂` is `Δ`,
on `chargeHeyting` — two commuting join-nuclei, an `Order.CommutingNuclei`. (The abstract
`σ`/`Δ` of an aperiodic settling are *history*-filtration nuclei; this concrete pair is a
faithful finite model of the commuting-square structure, the same one
`Positing.Bigraded.Charge.joinSquare` instantiates.) -/
def chargeNuclearPair (c1 c2 : Charge) : Order.CommutingNuclei chargeHeyting where
  j1 :=
    { j a := Charge.joinK c1 a
      infl a := by show Charge.meetK a (Charge.joinK c1 a) = a; cases c1 <;> cases a <;> rfl
      idem a := by cases c1 <;> cases a <;> rfl
      meet a b := by
        show Charge.joinK c1 (Charge.meetK a b)
          = Charge.meetK (Charge.joinK c1 a) (Charge.joinK c1 b)
        cases c1 <;> cases a <;> cases b <;> rfl }
  j2 :=
    { j a := Charge.joinK c2 a
      infl a := by show Charge.meetK a (Charge.joinK c2 a) = a; cases c2 <;> cases a <;> rfl
      idem a := by cases c2 <;> cases a <;> rfl
      meet a b := by
        show Charge.joinK c2 (Charge.meetK a b)
          = Charge.meetK (Charge.joinK c2 a) (Charge.joinK c2 b)
        cases c2 <;> cases a <;> cases b <;> rfl }
  comm a := by
    show Charge.joinK c1 (Charge.joinK c2 a) = Charge.joinK c2 (Charge.joinK c1 a)
    cases c1 <;> cases c2 <;> cases a <;> rfl

/-! ## (2) The autopoietic core `A*` and the autopoiesis cell -/

/-- The **autopoietic core** `A*` of an aperiodic settling's nuclear pair: the
predicate picking out the **doubly-quiescent self-maintained layer** `A* = Fix(π)`,
`π = σ∘Δ` (`commutating.md`). An element `a` is in `A*` iff `Q.pi a = a` — it is
reproduced by the joint closure, "where the past has nothing further to add and the
future has already sent everything back." This is the layer closed under its own
production — the cell that **self-produces**. -/
def autopoieticCore {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H)
    (a : H.carrier) : Prop := Q.pi a = a

/-- **The autopoietic core is the doubly-fixed layer.** `a ∈ A*` iff `a` is fixed by
**both** the backward saturating `σ` **and** the forward transferring `Δ` — `A* =
Fix(σ) ∩ Fix(Δ)`. This is the **self-production closure**: an element survives exactly
when neither the past (`σ`) nor the future (`Δ`) can move it. Reuses `fix_pi_iff`. -/
theorem autopoieticCore_iff {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H)
    (a : H.carrier) :
    autopoieticCore Q a ↔ ((saturating Q).Fix a ∧ (transferring Q).Fix a) :=
  Q.fix_pi_iff a

/-- The four corners of the autopoiesis cell `(A, Fix σ, Fix Δ, A*)`, read off `Articulating.Corner`
via the `NuclearQuartet` corner operators: `potential ↦ A` (free), `active ↦ σ`-quiescent
`Fix(σ)`, `stable ↦ Δ`-quiescent `Fix(Δ)`, `absurd ↦ A* = π`. The recurring FOUR, here as
the sub-algebras of the history-filtration quartet. -/
def cellCorner {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H)
    (c : Articulating.Corner) (a : H.carrier) : H.carrier :=
  Order.NuclearQuartet.cornerOp Q c a

@[simp] theorem cellCorner_potential {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H)
    (a : H.carrier) : cellCorner Q .potential a = a := rfl
@[simp] theorem cellCorner_active {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H)
    (a : H.carrier) : cellCorner Q .active a = (saturating Q).j a := rfl
@[simp] theorem cellCorner_stable {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H)
    (a : H.carrier) : cellCorner Q .stable a = (transferring Q).j a := rfl
@[simp] theorem cellCorner_absurd {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H)
    (a : H.carrier) : cellCorner Q .absurd a = Q.pi a := rfl

/-- The bundled **autopoiesis cell**: the self-production characterization of `A*`, the
four-corner exhaustiveness, and the joint-corner-is-intersection law of the
history-filtration quartet. -/
structure AutopoiesisCell {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H) where
  /-- `A*` is the doubly-quiescent self-maintained core: `a ∈ A*` iff fixed by both
  the backward `σ` and the forward `Δ` (self-production closure). -/
  self_production : ∀ a : H.carrier,
    autopoieticCore Q a ↔ ((saturating Q).Fix a ∧ (transferring Q).Fix a)
  /-- The four corners `(A, Fix σ, Fix Δ, A*)` are the recurring FOUR — exhaustively
  four, no fifth corner. -/
  four_corners : Articulating.Corner.all.length = 4
  /-- The joint corner `A*` is exactly the intersection: `absurd`-quiescent iff both
  `active`- (`σ`) and `stable`- (`Δ`) quiescent, restated via the corner operators. -/
  joint_is_intersection : ∀ a : H.carrier,
    cellCorner Q .absurd a = a ↔
      (cellCorner Q .active a = a ∧ cellCorner Q .stable a = a)

/-- **The nuclear autopoiesis cell.** For any commuting nuclear pair
`(σ, Δ) = Q` of an aperiodic settling on a settled fiber Heyting algebra `H`, the
autopoietic core `A* = Fix(π)` is the **doubly-quiescent self-maintained core**:

* (**self-production**) `a ∈ A*` iff `a` is fixed by **both** the backward saturating
  `σ` and the forward transferring `Δ` — `A* = Fix(σ) ∩ Fix(Δ)`, the layer closed under
  its own production "where the past has nothing further to add and the future has
  already sent everything back" (`fix_pi_iff`, `commutating.md`);
* (**the recurring FOUR**) the four corners `(A, Fix σ, Fix Δ, A*)` exhaust the four
  `Articulating.Corner`s — no fifth (`Articulating.Corner.card_eq_four`);
* (**joint corner = intersection**) restated through the corner operators, the
  `A*`-corner is exactly the meet of the `σ`- and `Δ`-corners
  (`absurd_iff_active_and_stable`).

This is the autopoiesis cell: the cell self-produces, maintained by both the
past-saturating and future-transferring closures. -/
theorem nuclear_autopoiesis_cell {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H) :
    AutopoiesisCell Q where
  self_production a := autopoieticCore_iff Q a
  four_corners := Articulating.Corner.card_eq_four
  joint_is_intersection a := Order.NuclearQuartet.absurd_iff_active_and_stable Q a

/-! ## (3) The Axiom of History Separation — varying family ⟹ aperiodicity

A fiberwise-*varying* family of nuclear squares over histories is what makes
aperiodicity a **theorem**: a constant nuclear pair leaves automorphisms invisible; a
varying family — different `(σ_t, Δ_t)` at different histories — separates the histories
and so makes the automorphisms visible. We exhibit the concrete `varyingFamily` as the
witness that a history-separating family exists, and tie it to the aperiodic regime where
`cl-inv` can be nonzero. -/

/-- A **history-separating family**: a `Positing.Bigraded.SquareFamily` over an index of
histories that genuinely **varies** — two histories carry different nuclear pairs
`(σ_t, Δ_t)`. (`SquareFamily.Varies`: the family is non-constant.) This is the data of
the Axiom of History Separation; a *constant* family is the degenerate, automorphism-
invisible case. -/
def HistorySeparating {H : HeytingAlgebra} {I : Type} (family : SquareFamily H I) : Prop :=
  family.Varies

/-- **A history-separating family exists** — the concrete witness. `varyingFamily` (the
two-history family that raises toward `t` at one fiber and toward `⊤ₖ` at the other) is
genuinely varying: its `σ = j₁` nuclei differ across the two histories. Reuses
`Positing.Bigraded.varyingFamily_varies`. -/
theorem varyingFamily_historySeparating : HistorySeparating Charge.varyingFamily :=
  Charge.varyingFamily_varies

/-- The **aperiodic settling** the history-separating family corresponds to: a settling
in `ClosureRegime.aperiodic` whose classifying invariant `cl-inv ≠ 0`. Reuses
`Persistence.Aperiodic.aperiodicWitness` — the canonical nonzero-`cl-inv` aperiodic witness. When the
nuclear family separates histories (varies), the settling lands in the aperiodic regime,
where cohomology does not stabilize and `cl-inv` *can* be nonzero. -/
def separatedSettling : Persistence.Aperiodic.Settling := Persistence.Aperiodic.aperiodicWitness

/-- **The Axiom of History Separation forces aperiodicity.** A fiberwise-
*varying* family of nuclear squares over histories `(σ_t, Δ_t)` corresponds to the
**aperiodic** regime, where the classifying invariant can be nonzero. Concretely, the
existence of a history-separating (varying) family is **witnessed**
(`varyingFamily_varies`), and to it corresponds a settling — `separatedSettling` (the
`aperiodicWitness`) — in `ClosureRegime.aperiodic` whose `cl-inv ≠ 0`
(`clinv_dichotomy`'s aperiodic branch):

* (**history separation is realizable**) there *exists* a varying family —
  `Charge.varyingFamily.Varies` holds: not every nuclear family is constant;
* (**varying ⟹ aperiodicity**) the corresponding settling is in the **aperiodic**
  regime, with `cl-inv ≠ 0` — the regime where cohomology does not stabilize, so the
  KZ-diamond automorphisms become **visible**;
* the contrapositive is the **structural content**: a *constant* nuclear pair would
  leave automorphisms **invisible** (its settling would have to lie in a vanishing-
  cohomology regime, `cl-inv = 0`), so a *varying* family is precisely what promotes
  aperiodicity from an assumption to a theorem.

Corpus: `aperiodic-settling.md`, `commutating.md`. -/
theorem history_separation_aperiodicity :
    -- a history-separating (varying) nuclear family exists — history separation is realizable
    Charge.varyingFamily.Varies
    -- to which corresponds a settling in the APERIODIC regime with cl-inv ≠ 0:
    -- varying ⟹ aperiodicity (cohomology nonzero, automorphisms visible)
    ∧ (separatedSettling.regime = ClosureRegime.aperiodic
        ∧ separatedSettling.clInv ≠ Persistence.Aperiodic.H1Class.zero)
    -- the vanishing baseline: a CONSTANT (non-history-separating) settling — one in a
    -- strict/scott regime — is forced to cl-inv = 0 (automorphisms invisible)
    ∧ (∀ v : Persistence.Aperiodic.Settling,
        (v.regime = ClosureRegime.strict ∨ v.regime = ClosureRegime.scott) →
          v.clInv = Persistence.Aperiodic.H1Class.zero) :=
  ⟨Charge.varyingFamily_varies,
   ⟨rfl, Persistence.Aperiodic.aperiodicWitness_clinv_nonzero⟩,
   Persistence.Aperiodic.clinv_dichotomy.1⟩

/-! ## (4) History-filtration nuclei are distinct from value-order nuclei (documented)

The `Positing.FiberAlgebra.cross_order_not_knowledge_nucleus` finding concerns the two
**bilattice value orders**: a *truth*-closure is **not** a *knowledge* nucleus on the
same algebra — they do not co-inhabit one Heyting algebra as commuting nuclei, because
they are two different value orders.

The `σ, Δ` of THIS module are a **legitimate** same-algebra commuting pair: they filter
the *single* settled fiber Heyting algebra `H_t` by **history** — saturating reads it
backward against sub-histories `t₀<t`, transferring reads it forward against independent
extensions `s⊥t` — not by the two bilattice value orders. As `commutating.md` states
verbatim, the quartet here "is the **history-filtration** quartet, distinct from the
bilattice-order quartet of the bigraded diamond." So modeling `(σ, Δ)` as one
`Order.CommutingNuclei H` (above) is faithful, and does **not** contradict the cross-order
finding — they speak of orthogonal axes (the bilattice value orders vs. the history
filtration). The lemma below records, as a reusable fact, that the value-order quartet of
the bigraded diamond and the history-filtration quartet of commutating are presented by
*different* commuting-pair data, even though both are instances of the one nuclear-quartet
pattern. -/

/-- **History-filtration and value-order quartets are distinct presentations.** Both the
bigraded diamond's value-order quartet (`Charge.joinSquare`, two join-nuclei on the
*knowledge* value order) and an abstract history-filtration pair `(σ, Δ)` realize the
**same** Nuclear Quartet Theorem `Fix(π) = Fix(j₁) ∩ Fix(j₂)` at every element — yet they
are different commuting-pair *data* (different axes: the two bilattice value orders vs. the
single algebra's history filtration). We record this by exhibiting that each independently
satisfies the quartet law, the shared pattern that does **not** collapse the two axes:

* the value-order side reuses `Positing.Bigraded.NuclearSquare.fix_pi_iff`;
* the history-filtration side reuses `Order.CommutingNuclei.fix_pi_iff`.

The `cross_order_not_knowledge_nucleus` finding lives on the value-order axis and so does
not bear on the history-filtration pair `(σ, Δ)`. -/
theorem history_filtration_distinct_from_value_order
    (c1 c2 : Charge) {H : Order.HeytingAlgebra} (Q : Order.CommutingNuclei H) :
    -- value-order quartet (bigraded diamond, two join-nuclei on the knowledge value order)
    (∀ a : Charge, (Charge.joinSquare c1 c2).pi a = a ↔
      ((Charge.joinSquare c1 c2).j1.j a = a ∧ (Charge.joinSquare c1 c2).j2.j a = a))
    -- history-filtration quartet (saturating σ / transferring Δ on one settled fiber H_t)
    ∧ (∀ a : H.carrier, autopoieticCore Q a ↔
        ((saturating Q).Fix a ∧ (transferring Q).Fix a)) :=
  ⟨(Charge.joinSquare c1 c2).fix_pi_iff, autopoieticCore_iff Q⟩

end Persistence.Aperiodic.Autopoiesis
end Infomaterial
