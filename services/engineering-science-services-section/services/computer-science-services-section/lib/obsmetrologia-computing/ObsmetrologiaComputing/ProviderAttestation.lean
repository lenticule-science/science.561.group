import Obsmetrologia.Language.Positing.Record

/-! # ProviderAttestation — independent providers' observations of one state, as a record

Independent providers each observe one exact state. Partition the available
observations by the state they attest (its content address); a partition is a list of
class sizes, every class attested at least once. Its **attestation record** tallies

* **for**: corroborations, each observation repeating a state already attested
  (`Σ (size − 1)`);
* **against**: contradictions, each distinct state past the first (`classes − 1`).

The record's reading is the attestation's. It is `Reading.tTop` (told true only)
exactly when one state is attested, by at least two providers: the only reading on
which a certification may proceed (`reading_attestationRecord_eq_tTop_iff`). It is
`Reading.tBot` (told false only) exactly when several states are attested and none is
corroborated (`reading_attestationRecord_eq_tBot_iff`). Unavailable providers attest
nothing and are not classes.
-/

namespace ObsmetrologiaComputing

open Obsmetrologia

/-- The attestation record of a partition of observations by attested state, given as
its class sizes: corroborations for, contradictions against. -/
def attestationRecord (classes : List Nat) : Record :=
  ⟨(classes.map (· - 1)).sum, classes.length - 1⟩

/-- Something is corroborated exactly when some state is attested twice. -/
theorem attestationRecord_pos_ne_zero_iff (classes : List Nat) :
    (attestationRecord classes).pos ≠ 0 ↔ ∃ n ∈ classes, 2 ≤ n := by
  induction classes with
  | nil => simp [attestationRecord]
  | cons c cs ih =>
    simp only [attestationRecord, List.map_cons, List.sum_cons, List.mem_cons] at ih ⊢
    constructor
    · intro h
      by_cases hc : 2 ≤ c
      · exact ⟨c, Or.inl rfl, hc⟩
      · obtain ⟨n, hn, h2⟩ := ih.mp (by omega)
        exact ⟨n, Or.inr hn, h2⟩
    · rintro ⟨n, hn | hn, h2⟩
      · subst hn; omega
      · have := ih.mpr ⟨n, hn, h2⟩; omega

/-- Nothing is corroborated exactly when every state is attested at most once. -/
theorem attestationRecord_pos_eq_zero_iff (classes : List Nat) :
    (attestationRecord classes).pos = 0 ↔ ∀ n ∈ classes, n ≤ 1 := by
  induction classes with
  | nil => simp [attestationRecord]
  | cons c cs ih =>
    simp only [attestationRecord, List.map_cons, List.sum_cons, List.mem_cons] at ih ⊢
    constructor
    · intro h n hn
      rcases hn with rfl | hn
      · omega
      · exact ih.mp (by omega) n hn
    · intro h
      have := ih.mpr (fun n hn => h n (Or.inr hn))
      have := h c (Or.inl rfl)
      omega

/-- Something is contradicted exactly when two distinct states are attested. -/
theorem attestationRecord_neg_ne_zero_iff (classes : List Nat) :
    (attestationRecord classes).neg ≠ 0 ↔ 2 ≤ classes.length := by
  simp only [attestationRecord]; omega

/-- A record reads as the point with given sides exactly when its tallies' nonzeroness
are those sides. -/
theorem reading_eq_ofSlots_iff (r : Record) (p n : Bool) :
    r.reading = Reading.ofSlots p n ↔ (r.pos != 0) = p ∧ (r.neg != 0) = n := by
  unfold Record.reading
  constructor
  · intro h
    exact ⟨by simpa using congrArg Reading.pos h, by simpa using congrArg Reading.neg h⟩
  · rintro ⟨rfl, rfl⟩; rfl

/-- An attestation is told true only exactly when one state is attested, by at least
two providers. -/
theorem reading_attestationRecord_eq_tTop_iff (classes : List Nat) :
    (attestationRecord classes).reading = Reading.tTop ↔ ∃ n, classes = [n] ∧ 2 ≤ n := by
  rw [show Reading.tTop = Reading.ofSlots true false from rfl, reading_eq_ofSlots_iff]
  constructor
  · rintro ⟨hp, hn⟩
    have hp : (attestationRecord classes).pos ≠ 0 := by simpa using hp
    have hlen : classes.length ≤ 1 := by
      have : (attestationRecord classes).neg = 0 := by simpa using hn
      simp only [attestationRecord] at this; omega
    obtain ⟨n, hmem, h2⟩ := (attestationRecord_pos_ne_zero_iff classes).mp hp
    match classes, hlen, hmem with
    | [c], _, hmem => exact ⟨c, rfl, by simp at hmem; omega⟩
  · rintro ⟨n, rfl, h2⟩
    simp [attestationRecord]; omega

/-- An attestation is told false only exactly when several states are attested and
none is corroborated. -/
theorem reading_attestationRecord_eq_tBot_iff (classes : List Nat) :
    (attestationRecord classes).reading = Reading.tBot ↔
      (∀ n ∈ classes, n ≤ 1) ∧ 2 ≤ classes.length := by
  rw [show Reading.tBot = Reading.ofSlots false true from rfl, reading_eq_ofSlots_iff,
    ← attestationRecord_pos_eq_zero_iff, ← attestationRecord_neg_ne_zero_iff]
  simp

end ObsmetrologiaComputing
