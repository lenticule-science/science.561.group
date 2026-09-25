import Obsmetrologia.Language.Predicating.Oriented
import Obsmetrologia.Language.Positing.Evidence
import Obsmetrologia.Language.Positing.Valuation
import Obsmetrologia.Language.Settling.Cones

/-!
# Measuring a trace

**Owner ruling 2026-09-21.** Where `Evidence.lean` gave the *carrier* for a
value plus its witnesses, this module gives the actual **measurement**: read
a cell's charge off a trace of articulatings, by collecting which
articulatings' oriented cell (`Articulating.orientedCell`, ruled the reading
`measure` uses — see `Predicating/Oriented.lean`) landed on the cell asked
about, and which landed on its **contrary**.

**Contrariety** (`Contrary`) is the codec's involution on predicate marks —
"not-p" as a *different* predicate `k.c p`, not a negation operator on
charges. A contrary *fact* is the articulation of the contrary predicate: an
against-witness for `φ` is a for-witness of `contrary k φ`. There is **no
denial** primitive: `no_denial` shows the only way a cell's charge ever
carries a negative pole is that some articulating in the trace actually
landed on the contrary cell.

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

/-- Contrariety: the codec's involution on predicate marks. A contrary fact is
the articulation of the contrary predicate; there is no denial primitive. -/
structure Contrary where
  /-- The involution on claims: "not-p", as a different predicate. -/
  c : Claim → Claim
  /-- Contrariety is its own inverse. -/
  invol : ∀ p, c (c p) = p

namespace PredicationCell

/-- The contrary cell: same subject and object, the contrary predicate. -/
def contrary (k : Contrary) (φ : PredicationCell) : PredicationCell :=
  ⟨φ.subject, k.c φ.predicate, φ.object⟩

/-- Contrariety on cells is its own inverse, inherited from `Contrary.invol`. -/
theorem contrary_contrary (k : Contrary) (φ : PredicationCell) :
    contrary k (contrary k φ) = φ := by
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

/-! ## Measuring: the charge and evidence a trace actually shows -/

/-- Measure a cell from a trace of articulatings: for-witnesses are the head
tokens of the articulatings whose oriented cell is `φ`; against-witnesses
those whose oriented cell is the contrary of `φ`. Always `Measured`, by
construction. -/
def measure (k : Contrary) (trace : List Articulating) (φ : PredicationCell) : Charged :=
  ⟨Charge.ofSlots (!(witnesses φ trace).isEmpty) (!(witnesses (φ.contrary k) trace).isEmpty),
    (witnesses φ trace, witnesses (φ.contrary k) trace)⟩

/-- Measuring is always `Measured`: the value is built from exactly the
witness lists it carries as evidence, by definition. -/
theorem measure_measured (k : Contrary) (trace : List Articulating) (φ : PredicationCell) :
    Charged.Measured (measure k trace φ) := rfl

/-- **Told nothing.** An empty trace measures ⊥ₖ everywhere. -/
@[simp] theorem measure_nil (k : Contrary) (φ : PredicationCell) :
    (measure k [] φ).value = Charge.kBot := rfl

/-- The value-component of `ofSlots` built from two witness-presence Bools
combines via a knowledge-order comparison exactly when each coordinate does. -/
private theorem or_not_of_impl {p q : Bool} (h : p = true → q = true) : (!p || q) = true := by
  cases p with
  | false => rfl
  | true => exact h rfl

private theorem leK_ofSlots_of_impl {p1 n1 p2 n2 : Bool}
    (hp : p1 = true → p2 = true) (hn : n1 = true → n2 = true) :
    Charge.leK (Charge.ofSlots p1 n1) (Charge.ofSlots p2 n2) = true := by
  show ((!(Charge.ofSlots p1 n1).pos || (Charge.ofSlots p2 n2).pos)
      && (!(Charge.ofSlots p1 n1).neg || (Charge.ofSlots p2 n2).neg)) = true
  rw [Charge.pos_ofSlots, Charge.pos_ofSlots, Charge.neg_ofSlots, Charge.neg_ofSlots,
      or_not_of_impl hp, or_not_of_impl hn]
  rfl

/-- **Evidence's arrow of time.** Extending the trace by one more articulating
can only add witnesses — for `φ` or for its contrary — never remove them, so
the measured value only ever climbs the knowledge order. -/
theorem measure_cons_le (k : Contrary) (a : Articulating) (trace : List Articulating)
    (φ : PredicationCell) :
    Charge.KLE (measure k trace φ).value (measure k (a :: trace) φ).value :=
  leK_ofSlots_of_impl (witnesses_cons_isEmpty_le φ a trace)
    (witnesses_cons_isEmpty_le (φ.contrary k) a trace)

/-- **Articulating tells its own cell true.** A one-step trace `[a]` measures
`a`'s own oriented cell as positive: `a` is its own for-witness. -/
theorem measure_self_pos (k : Contrary) (a : Articulating) :
    ((measure k [a] a.orientedCell).value).pos = true := by
  have hw : witnesses a.orientedCell [a] = a.head.token :: witnesses a.orientedCell [] := by
    show (if a.orientedCell = a.orientedCell then a.head.token :: witnesses a.orientedCell []
        else witnesses a.orientedCell []) = a.head.token :: witnesses a.orientedCell []
    rw [if_pos rfl]
  show (Charge.ofSlots (!(witnesses a.orientedCell [a]).isEmpty)
      (!(witnesses (a.orientedCell.contrary k) [a]).isEmpty)).pos = true
  rw [hw, Charge.pos_ofSlots]
  rfl

/-- **No denial.** The only way a measured charge ever carries a negative
pole at `φ` is that some articulating in the trace actually landed on `φ`'s
contrary — negation is never seeded, only measured. -/
theorem no_denial (k : Contrary) (trace : List Articulating) (φ : PredicationCell)
    (h : (measure k trace φ).value.neg = true) :
    ∃ a ∈ trace, a.orientedCell = φ.contrary k := by
  have h0 : (Charge.ofSlots (!(witnesses φ trace).isEmpty)
      (!(witnesses (φ.contrary k) trace).isEmpty)).neg = true := h
  rw [Charge.neg_ofSlots] at h0
  cases hm : witnesses (φ.contrary k) trace with
  | nil => rw [hm] at h0; exact absurd h0 (by decide)
  | cons t ts =>
    have hmem : t ∈ witnesses (φ.contrary k) trace := by rw [hm]; exact List.Mem.head _
    obtain ⟨a, ha, hao, _⟩ := mem_witnesses (φ.contrary k) trace t hmem
    exact ⟨a, ha, hao⟩

/-- The measured charged valuation: the whole trace, read pointwise as a
`CValuation` (value plus evidence at every cell). -/
def measured (k : Contrary) (trace : List Articulating) : CValuation := measure k trace

end Obsmetrologia
