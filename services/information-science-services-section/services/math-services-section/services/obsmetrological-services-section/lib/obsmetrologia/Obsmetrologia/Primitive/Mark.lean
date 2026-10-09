/-!
# Mark

Atomic marks and their two positional kinds.

This module is intentionally small. Longer explanations of why marks are this
thin belong in the Verso primitive-spine explanation. The Blueprint nodes record
the claim graph for `Mark`, `Kind`, and their elementary lemmas.
-/

namespace Obsmetrologia

/-- A mark: the arbitrary atomic primitive, presented as its finite surface
string. Built from nothing. The string is surface form, not categorical identity. -/
structure Mark where
  /-- The finite surface presentation. Not identity; identity is role, downstream. -/
  surface : String
  deriving DecidableEq, Repr, Inhabited

/-- The two kinds of mark, named for the role each position carries. They are
not two primitive types; they are the two sides of the utterance pair, and a
mark may stand in either. `token` is the identity-carrying side; `claim` is the
content-carrying side. -/
inductive Kind where
  /-- The identity-carrying side; the first position of the utterance pair. -/
  | token
  /-- The content-carrying side; the second position of the utterance pair. -/
  | claim
  deriving DecidableEq, Repr, Inhabited

namespace Kind

/-- There are exactly two kinds of mark. -/
theorem two_kinds : forall k : Kind, k = token \/ k = claim := by
  intro k
  cases k
  case token => exact Or.inl rfl
  case claim => exact Or.inr rfl

/-- Token and claim are distinct. -/
theorem token_ne_claim : token = claim -> False := by
  intro h
  cases h

end Kind

end Obsmetrologia

