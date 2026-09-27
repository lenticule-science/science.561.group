import Obsmetrologia.Language.Predicating.Oriented
import Obsmetrologia.Language.Positing.Evidence
import Obsmetrologia.Language.Positing.Valuation
import Obsmetrologia.Language.Settling.Cones

/-!
# Measuring a trace

Where `Evidence.lean` gave the *carrier* for a value plus its witnesses, this
module gives the actual **measurement**: read a cell's reading off a trace of
articulatings, by collecting which articulatings' oriented cell
(`Articulating.orientedCell`, see `Predicating/Oriented.lean`) landed on the
cell asked about, and which landed on its **contradictory**.

**Contradiction** (`Contradictory`) is the codec's involution on predicate
marks: each claim `p` is paired with the mark of its denial, "not-p", told as
a mark in its own right, never as a negation operator on readings. Evidence
against `φ` is then evidence for `contradictory k φ` at the same subject and
object, which is Belnap's four-valued reading (Belnap 1977; Dunn 1976): a
source tells an atomic claim true or false, and denial is a telling against
the same atom. Because the pairing is an involution it is contradiction, not
Aristotelian contrariety: a genuine contrary (`dislikes` beside `likes`) can
be false together with its partner (Horn 1989), so it is a separate predicate
whose bearing on `likes` is a rule settling applies (`dislikes ⊢ not-likes`),
never measurement's pairing. There is **no denial primitive**: `no_denial`
shows the only way a cell's reading carries a negative pole is that some
articulating in the trace landed on the contradictory cell. And negation is
derived, not assumed: `measure_contradictory_negate` proves that measuring
the contradictory cell is Belnap negation (`Reading.negate`, the exchange of
the two evidence sides) of measuring the cell.

`witnesses` is built by explicit structural recursion on the trace (never
`List.filter`/`List.map`), so every lemma about it is a structural
induction with `if_pos`/`if_neg`/`split` — axiom-free by construction, per
the ban on `List.mem_append`-style `Iff` lemmas. `measure` is always
`Measured` by *definition* (`measure_measured`): it is built from exactly
its own witness lists, nothing more. `measure_cons_le` is evidence's arrow of
time: extending the trace by one more articulating can only add witnesses,
never remove them, so the measured value only ever climbs `≤ₖ`.
-/

namespace Obsmetrologia

/-- Contradiction: the codec's involution on predicate marks, pairing each claim
with the mark of its denial. There is no denial primitive: a denial is the
articulation of the contradictory mark. -/
structure Contradictory where
  /-- The involution on claims: "not-p", told as a mark of its own. -/
  c : Claim → Claim
  /-- Contradiction is its own inverse. -/
  invol : ∀ p, c (c p) = p

namespace PredicationCell

/-- The contradictory cell: same subject and object, the contradictory predicate. -/
def contradictory (k : Contradictory) (φ : PredicationCell) : PredicationCell :=
  ⟨φ.subject, k.c φ.predicate, φ.object⟩

/-- Contradiction on cells is its own inverse, inherited from `Contradictory.invol`. -/
theorem contradictory_contradictory (k : Contradictory) (φ : PredicationCell) :
    contradictory k (contradictory k φ) = φ := by
  show (⟨φ.subject, k.c (k.c φ.predicate), φ.object⟩ : PredicationCell) = φ
  rw [k.invol φ.predicate]

end PredicationCell

/-! ## Witnesses: explicit structural recursion, never `filter`/`map` -/

/-- The for-witnesses of a cell `ψ` in a trace: the head tokens of the
articulatings whose oriented cell is `ψ`, in trace order. Structural
recursion, not `List.filter`, so every fact about it is proved by structural
induction. -/
def witnesses (ψ : PredicationCell) : List Articulating → Slot
  | [] => []
  | a :: t => if a.orientedCell = ψ then a.head.token :: witnesses ψ t else witnesses ψ t

/-- A witness of `ψ` in a trace comes from some articulating in the trace
whose oriented cell is `ψ` and whose head token is that witness. Structural
induction on the trace, with `if_pos`/`if_neg` on the recursive step. -/
theorem mem_witnesses (ψ : PredicationCell) (trace : List Articulating) (t : Token)
    (h : t ∈ witnesses ψ trace) :
    ∃ a ∈ trace, a.orientedCell = ψ ∧ a.head.token = t := by
  induction trace with
  | nil => cases h
  | cons a t' ih =>
    change t ∈ (if a.orientedCell = ψ then a.head.token :: witnesses ψ t' else witnesses ψ t') at h
    by_cases hc : a.orientedCell = ψ
    · rw [if_pos hc] at h
      cases h with
      | head _ => exact ⟨a, List.Mem.head _, hc, rfl⟩
      | tail _ hmem =>
        obtain ⟨b, hb, hbo, hbt⟩ := ih hmem
        exact ⟨b, List.Mem.tail _ hb, hbo, hbt⟩
    · rw [if_neg hc] at h
      obtain ⟨b, hb, hbo, hbt⟩ := ih h
      exact ⟨b, List.Mem.tail _ hb, hbo, hbt⟩

/-- Prepending an articulating to the trace can only add for-witnesses of
`ψ`, never remove them: if the tail already has one, so does the whole
trace. -/
theorem witnesses_cons_isEmpty_le (ψ : PredicationCell) (a : Articulating)
    (trace : List Articulating) :
    (!(witnesses ψ trace).isEmpty) = true → (!(witnesses ψ (a :: trace)).isEmpty) = true := by
  intro h
  show (!(if a.orientedCell = ψ then a.head.token :: witnesses ψ trace else witnesses ψ trace).isEmpty)
      = true
  by_cases hc : a.orientedCell = ψ
  · rw [if_pos hc]; rfl
  · rw [if_neg hc]
    exact h

/-! ## Measuring: the reading and evidence a trace actually shows -/

/-- Measure a cell from a trace of articulatings: for-witnesses are the head
tokens of the articulatings whose oriented cell is `φ`; against-witnesses
those whose oriented cell is the contradictory of `φ`. Always `Measured`, by
construction. -/
def measure (k : Contradictory) (trace : List Articulating) (φ : PredicationCell) : Valued :=
  ⟨Reading.ofSlots (!(witnesses φ trace).isEmpty) (!(witnesses (φ.contradictory k) trace).isEmpty),
    (witnesses φ trace, witnesses (φ.contradictory k) trace)⟩

/-- Measuring is always `Measured`: the value is built from exactly the
witness lists it carries as evidence, by definition. -/
theorem measure_measured (k : Contradictory) (trace : List Articulating) (φ : PredicationCell) :
    Valued.Measured (measure k trace φ) := rfl

/-- **Told nothing.** An empty trace measures ⊥ₖ everywhere. -/
@[simp] theorem measure_nil (k : Contradictory) (φ : PredicationCell) :
    (measure k [] φ).value = Reading.kBot := rfl

/-- The value-component of `ofSlots` built from two witness-presence Bools
combines via a knowledge-order comparison exactly when each coordinate does. -/
private theorem or_not_of_impl {p q : Bool} (h : p = true → q = true) : (!p || q) = true := by
  cases p with
  | false => rfl
  | true => exact h rfl

private theorem leK_ofSlots_of_impl {p1 n1 p2 n2 : Bool}
    (hp : p1 = true → p2 = true) (hn : n1 = true → n2 = true) :
    Reading.leK (Reading.ofSlots p1 n1) (Reading.ofSlots p2 n2) = true := by
  show ((!(Reading.ofSlots p1 n1).pos || (Reading.ofSlots p2 n2).pos)
      && (!(Reading.ofSlots p1 n1).neg || (Reading.ofSlots p2 n2).neg)) = true
  rw [Reading.pos_ofSlots, Reading.pos_ofSlots, Reading.neg_ofSlots, Reading.neg_ofSlots,
      or_not_of_impl hp, or_not_of_impl hn]
  rfl

/-- **Evidence's arrow of time.** Extending the trace by one more articulating
can only add witnesses — for `φ` or for its contradictory — never remove them, so
the measured value only ever climbs the knowledge order. -/
theorem measure_cons_le (k : Contradictory) (a : Articulating) (trace : List Articulating)
    (φ : PredicationCell) :
    Reading.KLE (measure k trace φ).value (measure k (a :: trace) φ).value :=
  leK_ofSlots_of_impl (witnesses_cons_isEmpty_le φ a trace)
    (witnesses_cons_isEmpty_le (φ.contradictory k) a trace)

/-- An articulating is a for-witness of its own cell in any trace it heads. -/
theorem measure_cons_self_pos (k : Contradictory) (a : Articulating) (trace : List Articulating) :
    ((measure k (a :: trace) a.orientedCell).value).pos = true := by
  have hw : witnesses a.orientedCell (a :: trace) = a.head.token :: witnesses a.orientedCell trace := by
    show (if a.orientedCell = a.orientedCell then a.head.token :: witnesses a.orientedCell trace
        else witnesses a.orientedCell trace) = a.head.token :: witnesses a.orientedCell trace
    rw [if_pos rfl]
  show (Reading.ofSlots (!(witnesses a.orientedCell (a :: trace)).isEmpty)
      (!(witnesses (a.orientedCell.contradictory k) (a :: trace)).isEmpty)).pos = true
  rw [hw, Reading.pos_ofSlots]
  rfl

/-- **Articulating tells its own cell true.** A one-step trace `[a]` measures
`a`'s own oriented cell as positive: `a` is its own for-witness. -/
theorem measure_self_pos (k : Contradictory) (a : Articulating) :
    ((measure k [a] a.orientedCell).value).pos = true :=
  measure_cons_self_pos k a []

/-- **No denial.** The only way a measured reading ever carries a negative
pole at `φ` is that some articulating in the trace actually landed on `φ`'s
contradictory — denial is never seeded, only measured. -/
theorem no_denial (k : Contradictory) (trace : List Articulating) (φ : PredicationCell)
    (h : (measure k trace φ).value.neg = true) :
    ∃ a ∈ trace, a.orientedCell = φ.contradictory k := by
  have h0 : (Reading.ofSlots (!(witnesses φ trace).isEmpty)
      (!(witnesses (φ.contradictory k) trace).isEmpty)).neg = true := h
  rw [Reading.neg_ofSlots] at h0
  cases hm : witnesses (φ.contradictory k) trace with
  | nil => rw [hm] at h0; exact absurd h0 (by decide)
  | cons t ts =>
    have hmem : t ∈ witnesses (φ.contradictory k) trace := by rw [hm]; exact List.Mem.head _
    obtain ⟨a, ha, hao, _⟩ := mem_witnesses (φ.contradictory k) trace t hmem
    exact ⟨a, ha, hao⟩

/-- **Negation is measured, not assumed.** Measuring the contradictory cell is
Belnap negation of measuring the cell: the two evidence sides exchange,
because the contradictory of the contradictory is the cell itself. -/
theorem measure_contradictory_negate (k : Contradictory) (trace : List Articulating)
    (φ : PredicationCell) :
    (measure k trace (φ.contradictory k)).value = Reading.negate (measure k trace φ).value := by
  show Reading.ofSlots (!(witnesses (φ.contradictory k) trace).isEmpty)
      (!(witnesses ((φ.contradictory k).contradictory k) trace).isEmpty)
    = Reading.negate (Reading.ofSlots (!(witnesses φ trace).isEmpty)
      (!(witnesses (φ.contradictory k) trace).isEmpty))
  rw [PredicationCell.contradictory_contradictory]
  show _ = Reading.ofSlots (Reading.ofSlots _ _).neg (Reading.ofSlots _ _).pos
  rw [Reading.neg_ofSlots, Reading.pos_ofSlots]

/-- The measured valued valuation: the whole trace, read pointwise as a
`CValuation` (value plus evidence at every cell). -/
def measured (k : Contradictory) (trace : List Articulating) : CValuation := measure k trace

end Obsmetrologia
