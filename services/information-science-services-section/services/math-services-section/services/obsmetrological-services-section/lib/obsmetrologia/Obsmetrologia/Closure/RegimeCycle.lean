import Obsmetrologia.Closure.RegimeGate

/-!
# The regime cycle — the spine closes through its residue

`Closure.Regime` lays the four regimes along the spine, one stage each:
articulating (aperiodic) → predicating (transfinite-bounded) → positing (Scott) →
settling (strict). Read as a passage, the spine descends the tower (a reading over
declared tables: `spine_rank_table_descends`). This module closes it: settling hands its residue back to articulating, and the tower turns.

The turn is a spiral, not a circle. Every lap passes through the same four stages
(the whirl, period four), and every lap adds the same residue to the carried record
(the spiral, which never returns). Each lap is a translate of the seed by one fixed
residue (the tiling). Which of the two the turn is — a circle that settles or a
spiral that never returns — depends on one datum, the residue:

* residue `kBot`: the bump is the identity, and the orbit is settled at stage zero;
* any other residue: the orbit is one germ class and never repeats as data. That is
  the aperiodic signature, and `Record.topBump` (residue `⟨1, 1⟩`) is its balanced
  case.

The module then says what it means for a proof to run **ahead** of iteration. At a
gap rung (`RegimeGate.HasGap`), the completion is reached by no finite stage, and a
certificate delivers it whole. Its fields trace the passage *impossible → necessary →
determined*:

* *impossible* at every finite stage: no stage equals the completion;
* *necessary*: every stage lies below the completion, and every bound of the orbit
  lies above it;
* *determined*: the step fixes it.

`AheadCertificate` is the data-valued form, inhabited at the transfinite-bounded rung
by `ORecord.omegaPos`. `GermCertificate` is the class-valued form, inhabited at the
aperiodic rung by every nonzero residue. `gap_flags_split` proves that a gap is exactly one
of the two shapes, read from the gate's own flags.

## Main definitions

* `Stage.next`, `ClosureRegime.rank` — the spine as a cycle; the tower as a height.
* `Turn`, `Turn.advance` — positions on the spiral; one spine step, or the return.
* `residueBump` — add one residue to every term of a record sequence.
* `AheadCertificate`, `GermCertificate` — the two shapes of a limit proof.

## Main results

* `Stage.next_four`, `spine_rank_table_descends`, `return_rank_table_ascends` — three steps down the tower,
  one jump back to its top.
* `iterSeq_residueBump` — `k` laps add `k` copies of the residue (the tiling).
* `residue_dichotomy` — a zero residue settles at once; any other residue never
  repeats, has no fixed point, and stays in one germ class.
* `balanced_residue_holds_bias` — a residue told equally both ways keeps every term's
  truth bias fixed while the contradiction mass grows.
* `dervish` — on the spiral, the stage returns every four steps and the carried record
  never does.
* `omega_ahead`, `residue_germ_ahead`, `gap_flags_split`, `gap_flags_beside_certificates` — the
  certificates, and where in the tower they live.
-/

namespace Obsmetrologia

/-! ## (A) The spine as a cycle -/

/-- The next stage: down the spine, and from settling back to articulating. -/
def Stage.next : Stage → Stage
  | Stage.articulating => Stage.predicating
  | Stage.predicating => Stage.positing
  | Stage.positing => Stage.settling
  | Stage.settling => Stage.articulating

/-- The cycle has period four. -/
theorem Stage.next_four (s : Stage) : s.next.next.next.next = s := by
  cases s <;> rfl

/-- No stage is its own successor. -/
theorem Stage.next_ne (s : Stage) : s.next ≠ s := by
  cases s <;> decide

/-- A regime's height in the tower: strict 0, Scott 1, transfinite-bounded 2,
aperiodic 3. -/
def ClosureRegime.rank : ClosureRegime → Nat
  | ClosureRegime.strict => 0
  | ClosureRegime.scott => 1
  | ClosureRegime.transfiniteBounded => 2
  | ClosureRegime.aperiodic => 3

/-- Each spine step descends the rank table by one rung. By definition: `Stage.regime` and
`ClosureRegime.rank` are tables, and this is a lookup (`rfl`) in them.

-- OPEN: that the spine's passage descends a tower of closure ordinals. Needs regimes derived
-- from closures in place of the declared `Stage.regime` table. -/
theorem spine_rank_table_descends (s : Stage) (h : s ≠ Stage.settling) :
    s.next.regime.rank + 1 = s.regime.rank := by
  cases s
  · rfl
  · rfl
  · rfl
  · exact absurd rfl h

/-- The return from settling climbs from rank 0 to rank 3 in the tables. By definition
(`rfl` on `Stage.regime`, `Stage.next` and `ClosureRegime.rank`). -/
theorem return_rank_table_ascends :
    Stage.settling.regime = ClosureRegime.strict
    ∧ Stage.settling.next.regime = ClosureRegime.aperiodic
    ∧ ClosureRegime.strict.rank = 0
    ∧ ClosureRegime.aperiodic.rank = 3 :=
  ⟨rfl, rfl, rfl, rfl⟩

/-- The gate's flags and the rank table agree: `HasGap r` (read from three Boolean flags in
`RegimeGate`) holds exactly when the rank table gives `2 ≤ r.rank`. A finite check of two
tables, not a theorem about closures. -/
theorem gap_flags_iff_upper_rank (r : ClosureRegime) : RegimeGate.HasGap r ↔ 2 ≤ r.rank := by
  cases r
  · exact ⟨fun h => absurd h RegimeGate.strict_no_gap, fun h => absurd h (by decide)⟩
  · exact ⟨fun h => absurd h RegimeGate.scott_no_gap, fun h => absurd h (by decide)⟩
  · exact ⟨fun _ => by decide, fun _ => RegimeGate.transfiniteBounded_has_gap⟩
  · exact ⟨fun _ => by decide, fun _ => RegimeGate.aperiodic_has_gap⟩

/-! ## (B) The residue -/

namespace Record

/-- Add one residue to every term of a record sequence. -/
def residueBump (c : Record) (s : Nat → Record) : Nat → Record :=
  fun n => add (s n) c

/-- `topBump` is the residue bump at the balanced unit residue `⟨1, 1⟩`. -/
theorem topBump_eq_residueBump : topBump = residueBump ⟨1, 1⟩ := rfl

/-- **The tiling.** `k` laps add `k` copies of the residue to every term. -/
theorem iterSeq_residueBump (c : Record) (k : Nat) (s : Nat → Record) (n : Nat) :
    iterSeq (residueBump c) k s n = ⟨(s n).pos + c.pos * k, (s n).neg + c.neg * k⟩ := by
  induction k with
  | zero => rfl
  | succ k ih =>
    show add (iterSeq (residueBump c) k s n) c = _
    rw [ih]
    simp only [add, Nat.mul_add, Nat.mul_one, Nat.add_assoc]

/-- The zero residue bumps nothing. -/
theorem residueBump_kBot (s : Nat → Record) : residueBump kBot s = s := rfl

/-- A bump that fixes any sequence has the zero residue. -/
theorem residue_eq_kBot_of_fixed {c : Record} {s : Nat → Record}
    (h : residueBump c s = s) : c = kBot := by
  have h0 := congrFun h 0
  have hp : (s 0).pos + c.pos = (s 0).pos := congrArg Record.pos h0
  have hn : (s 0).neg + c.neg = (s 0).neg := congrArg Record.neg h0
  exact ext (by show c.pos = 0; omega) (by show c.neg = 0; omega)

/-- The `k`-fold residue: the record that `k` laps add. -/
def scale (c : Record) (k : Nat) : Record := ⟨c.pos * k, c.neg * k⟩

/-- **The residue dichotomy.** A zero residue settles the orbit at stage zero. Any
other residue fixes no sequence and never repeats from one stage to the next, yet
every stage dominates the seed and is dominated by it: the whole orbit is one germ
class. -/
theorem residue_dichotomy (c : Record) :
    (c = kBot → ∀ s k, iterSeq (residueBump c) k s = s)
    ∧ (c ≠ kBot →
        (∀ s, residueBump c s ≠ s)
        ∧ (∀ s k, iterSeq (residueBump c) (k + 1) s ≠ iterSeq (residueBump c) k s)
        ∧ (∀ s k, DomBy (iterSeq (residueBump c) k s) s
            ∧ DomBy s (iterSeq (residueBump c) k s))) := by
  refine ⟨fun hc s k => ?_, fun hc => ⟨fun s h => hc (residue_eq_kBot_of_fixed h),
    fun s k h => ?_, fun s k => ⟨⟨scale c k, fun n => ?_⟩, ⟨kBot, fun n => ?_⟩⟩⟩⟩
  · subst hc
    induction k with
    | zero => rfl
    | succ k ih => show residueBump kBot (iterSeq (residueBump kBot) k s) = s; rw [ih]; rfl
  · apply hc
    have h0 := congrFun h 0
    rw [iterSeq_residueBump, iterSeq_residueBump] at h0
    have hp := congrArg Record.pos h0
    have hn := congrArg Record.neg h0
    simp only [Nat.mul_add, Nat.mul_one] at hp hn
    exact ext (by show c.pos = 0; omega) (by show c.neg = 0; omega)
  · rw [iterSeq_residueBump]
    exact kle_refl _
  · show KLE (s n) (add (iterSeq (residueBump c) k s n) kBot)
    rw [iterSeq_residueBump]
    exact ⟨Nat.le_add_right _ _, Nat.le_add_right _ _⟩

/-- The contradiction mass the residue lays down: after `k` laps every term carries at
least `k` copies of the residue's own contradiction mass. -/
theorem residue_topMass (c : Record) (s : Nat → Record) (k n : Nat) :
    topMass c * k ≤ topMass (iterSeq (residueBump c) k s n) := by
  rw [iterSeq_residueBump]
  show min c.pos c.neg * k ≤ min ((s n).pos + c.pos * k) ((s n).neg + c.neg * k)
  have hp : min c.pos c.neg * k ≤ c.pos * k := Nat.mul_le_mul_right k (Nat.min_le_left _ _)
  have hn : min c.pos c.neg * k ≤ c.neg * k := Nat.mul_le_mul_right k (Nat.min_le_right _ _)
  exact Nat.le_min.mpr ⟨Nat.le_trans hp (Nat.le_add_left _ _),
    Nat.le_trans hn (Nat.le_add_left _ _)⟩

/-- A residue told equally both ways. -/
def Balanced (c : Record) : Prop := c.pos = c.neg

/-- **A balanced residue holds the bias.** Along a balanced residue's orbit every term
keeps its truth bias (told-true against told-false, cross-added to stay in `ℕ`), while
its contradiction mass grows by one residue per lap. -/
theorem balanced_residue_holds_bias (c : Record) (hc : Balanced c) (s : Nat → Record)
    (k n : Nat) :
    (iterSeq (residueBump c) k s n).pos + (s n).neg
      = (iterSeq (residueBump c) k s n).neg + (s n).pos
    ∧ topMass c * k ≤ topMass (iterSeq (residueBump c) k s n) := by
  refine ⟨?_, residue_topMass c s k n⟩
  rw [iterSeq_residueBump]
  show (s n).pos + c.pos * k + (s n).neg = (s n).neg + c.neg * k + (s n).pos
  rw [hc]
  omega

/-- An unbalanced residue drifts the bias: one lap moves told-true against told-false
by the residue's own imbalance, so no two laps share a bias. -/
theorem unbalanced_residue_drifts (c : Record) (hc : ¬ Balanced c) (s : Nat → Record)
    (k n : Nat) :
    (iterSeq (residueBump c) (k + 1) s n).pos + (iterSeq (residueBump c) k s n).neg
      ≠ (iterSeq (residueBump c) (k + 1) s n).neg + (iterSeq (residueBump c) k s n).pos := by
  rw [iterSeq_residueBump, iterSeq_residueBump]
  show (s n).pos + c.pos * (k + 1) + ((s n).neg + c.neg * k)
    ≠ (s n).neg + c.neg * (k + 1) + ((s n).pos + c.pos * k)
  simp only [Nat.mul_add, Nat.mul_one]
  intro h
  exact hc (by show c.pos = c.neg; omega)

end Record

/-! ## (C) The spiral -/

/-- A position on the spiral: the lap, and the stage within it. -/
structure Turn where
  /-- How many returns have been made. -/
  lap : Nat
  /-- The stage within the lap. -/
  stage : Stage
  deriving DecidableEq, Repr

namespace Turn

/-- One step along the spiral: a spine step within the lap, or the return from
settling, which opens the next lap. -/
def advance : Turn → Turn
  | ⟨l, Stage.articulating⟩ => ⟨l, Stage.predicating⟩
  | ⟨l, Stage.predicating⟩ => ⟨l, Stage.positing⟩
  | ⟨l, Stage.positing⟩ => ⟨l, Stage.settling⟩
  | ⟨l, Stage.settling⟩ => ⟨l + 1, Stage.articulating⟩

/-- The stage of an advanced position is the next stage. -/
theorem advance_stage (t : Turn) : t.advance.stage = t.stage.next := by
  cases t with
  | mk l s => cases s <;> rfl

/-- Four steps make one lap: the same stage, one lap further on. -/
theorem advance_four (t : Turn) :
    t.advance.advance.advance.advance = ⟨t.lap + 1, t.stage⟩ := by
  cases t with
  | mk l s => cases s <;> rfl

/-- The record a position carries, from seed `s` under residue `c`: one residue per
completed lap. -/
def carried (c : Record) (s : Nat → Record) (t : Turn) : Nat → Record :=
  Record.iterSeq (Record.residueBump c) t.lap s

end Turn

/-- **The dervish.** Under a nonzero residue the spiral whirls and never returns: four
steps bring every position back to its stage, but never to its record, and every
record it carries stays in the seed's germ class. Under the zero residue the spiral is
a circle: every position carries the seed. -/
theorem dervish (c : Record) (s : Nat → Record) :
    (∀ t : Turn, t.advance.advance.advance.advance.stage = t.stage)
    ∧ (c ≠ Record.kBot → ∀ t : Turn,
        Turn.carried c s t.advance.advance.advance.advance ≠ Turn.carried c s t
        ∧ Record.DomBy (Turn.carried c s t) s ∧ Record.DomBy s (Turn.carried c s t))
    ∧ (c = Record.kBot → ∀ t : Turn, Turn.carried c s t = s) := by
  refine ⟨fun t => by rw [Turn.advance_four], fun hc t => ?_, fun hc t =>
    (Record.residue_dichotomy c).1 hc s t.lap⟩
  have hd := (Record.residue_dichotomy c).2 hc
  refine ⟨?_, (hd.2.2 s t.lap).1, (hd.2.2 s t.lap).2⟩
  rw [Turn.advance_four]
  exact hd.2.1 s t.lap

/-! ## (D) Running ahead -/

/-- **An ahead certificate.** A completion of an orbit, delivered whole: no finite stage
equals it (*impossible* by iteration), every stage lies below it and every bound of the
orbit above it (*necessary*), and the step fixes it (*determined*). -/
structure AheadCertificate {α : Type} (le : α → α → Prop) (step : α → α)
    (orbit : Nat → α) where
  /-- The completion. -/
  limit : α
  /-- No finite stage reaches it. -/
  unreached : ∀ k, orbit k ≠ limit
  /-- Every stage lies below it. -/
  below : ∀ k, le (orbit k) limit
  /-- It lies below every bound of the orbit. -/
  least : ∀ b, (∀ k, le (orbit k) b) → le limit b
  /-- The step fixes it. -/
  fixed : step limit = limit

/-- A germ certificate: a completion that is a class rather than a point. The orbit
moves at every stage and the step fixes nothing, yet every stage is mutually dominated
by one representative. -/
structure GermCertificate {α : Type} (le : α → α → Prop) (step : α → α)
    (orbit : Nat → α) where
  /-- A representative of the class. -/
  representative : α
  /-- Every stage dominates the representative and is dominated by it. -/
  collapse : ∀ k, le (orbit k) representative ∧ le representative (orbit k)
  /-- No stage equals the next. -/
  moving : ∀ k, orbit (k + 1) ≠ orbit k
  /-- The step fixes nothing. -/
  unfixed : ∀ x, step x ≠ x

/-- What a limit proof delivers: the completion exists, and iteration never meets it. -/
theorem AheadCertificate.jump {α : Type} {le : α → α → Prop} {step : α → α}
    {orbit : Nat → α} (A : AheadCertificate le step orbit) :
    ∃ x, step x = x ∧ ∀ k, orbit k ≠ x :=
  ⟨A.limit, A.fixed, A.unreached⟩

/-- Two ahead certificates over an antisymmetric order deliver the same completion. -/
theorem AheadCertificate.limit_unique {α : Type} {le : α → α → Prop} {step : α → α}
    {orbit : Nat → α} (antisymm : ∀ a b, le a b → le b a → a = b)
    (A B : AheadCertificate le step orbit) : A.limit = B.limit :=
  antisymm _ _ (A.least _ B.below) (B.least _ A.below)

/-- The orbit of the completed tally increment from the empty record. -/
def omegaOrbit (k : Nat) : ORecord := ORecord.iter ORecord.osuccPos k ORecord.kBot

/-- **Ahead at the transfinite-bounded rung.** The completed record's stage-ω value is
an ahead certificate for the increment orbit. -/
def omega_ahead : AheadCertificate ORecord.OKLE ORecord.osuccPos omegaOrbit where
  limit := ORecord.omegaPos
  unreached := ORecord.iter_ne_omegaPos
  below := ORecord.iter_le_omegaPos
  least := ORecord.omegaPos_least
  fixed := ORecord.osuccPos_omegaPos

/-- **Ahead at the aperiodic rung.** Every nonzero residue gives a germ certificate for
its orbit from any seed, with the seed as representative. -/
def residue_germ_ahead (c : Record) (hc : c ≠ Record.kBot) (s : Nat → Record) :
    GermCertificate Record.DomBy (Record.residueBump c)
      (fun k => Record.iterSeq (Record.residueBump c) k s) where
  representative := s
  collapse := (Record.residue_dichotomy c).2 hc |>.2.2 s
  moving := (Record.residue_dichotomy c).2 hc |>.2.1 s
  unfixed := (Record.residue_dichotomy c).2 hc |>.1

/-- **The gate's flags split a gap into two shapes**: a fixed point that no finite stage
reaches (the ahead shape), or no fixed point under a weak collapse (the germ shape). A
finite check of the declared flag tables in `RegimeGate`; the flags are not read off any
closure. -/
theorem gap_flags_split (r : ClosureRegime) :
    RegimeGate.HasGap r ↔
      (RegimeGate.hasFixedPoint r = true ∧ RegimeGate.attainedAtFiniteStage r = false)
      ∨ (RegimeGate.hasFixedPoint r = false ∧ RegimeGate.weaklyQuiescent r = true) := by
  cases r <;>
    simp [RegimeGate.HasGap, RegimeGate.hasFixedPoint, RegimeGate.attainedAtFiniteStage,
      RegimeGate.weaklyQuiescent]

/-- **The gate's gap flags, beside the certificates.** By the declared flags, strict and Scott
have no gap and the transfinite-bounded and aperiodic rungs do; the completed record
(`omega_ahead`) and every nonzero residue (`residue_germ_ahead`) are real certificates, proved
on their carriers. The carriers are not derived from the rungs: the pairing of a certificate
with a regime is the house's reading.

-- OPEN: that a closure attains its fixed point only at a gap rung, derived from the closure
-- and not from flags (whether a closure attains its fixed point at a finite stage is
-- undecidable in general). -/
theorem gap_flags_beside_certificates :
    (¬ RegimeGate.HasGap ClosureRegime.strict ∧ ¬ RegimeGate.HasGap ClosureRegime.scott)
    ∧ (RegimeGate.HasGap ClosureRegime.transfiniteBounded
        ∧ RegimeGate.hasFixedPoint ClosureRegime.transfiniteBounded = true
        ∧ Nonempty (AheadCertificate ORecord.OKLE ORecord.osuccPos omegaOrbit))
    ∧ (RegimeGate.HasGap ClosureRegime.aperiodic
        ∧ RegimeGate.hasFixedPoint ClosureRegime.aperiodic = false
        ∧ ∀ c, c ≠ Record.kBot → ∀ s : Nat → Record,
            Nonempty (GermCertificate Record.DomBy (Record.residueBump c)
              (fun k => Record.iterSeq (Record.residueBump c) k s))) :=
  ⟨⟨RegimeGate.strict_no_gap, RegimeGate.scott_no_gap⟩,
   ⟨RegimeGate.transfiniteBounded_has_gap, rfl, ⟨omega_ahead⟩⟩,
   ⟨RegimeGate.aperiodic_has_gap, rfl, fun c hc s => ⟨residue_germ_ahead c hc s⟩⟩⟩

end Obsmetrologia
