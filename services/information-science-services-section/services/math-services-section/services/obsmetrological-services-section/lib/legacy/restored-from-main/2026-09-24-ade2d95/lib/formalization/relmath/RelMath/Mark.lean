/-
# Mark — the inductive base (free data)

A **mark** is the arbitrary atomic primitive of the system: it has no internal
structure and is assembled from nothing. It is where decomposition stops.

This is one of the only two places in RelMath where *free data* is admitted (the
other is `Articulating`). Everything downstream of `Articulating` is **derived**;
nothing below introduces new primitives.

A mark's on-disk **surface form is a string**, because strings are the system's
chosen finite presentation for primitives. The string is presentation, **not
identity**: two marks with the same surface may carry different roles, and what
makes two marks the same is sameness of role in the articulating recursion, not
matching bytes. We therefore model the surface explicitly and keep "identity is
role" as a downstream concern (it lives below `Articulating`, never at this base).

A mark is a **genus** with two **kinds** — token and claim — which are *dual* and
*distinguished by position*: in an utterance the token is first, the claim second.
The cardinality **two** is forced: one kind would collapse articulating's
four-cell codomain to two statuses; three kinds would oversaturate to eight cells,
for which the system has no derivation. So the two kinds are exactly the two
*positions* of the utterance pair, not two separate primitive types.
-/

namespace RelMath

/-- A mark: the arbitrary atomic primitive, presented as its finite surface
string. Built from nothing. The string is surface form, not categorical identity. -/
structure Mark where
  /-- The finite surface presentation. Not identity — identity is role, downstream. -/
  surface : String
  deriving DecidableEq, Repr, Inhabited

/-- The two kinds of mark, named for the *role* each position carries. They are
not two primitive types — they are the two sides of the utterance pair, and a
mark may stand in either. `token` is the identity-carrying side (which one);
`claim` is the content-carrying side (what is said). -/
inductive Kind where
  /-- The identity-carrying side — the first position of the utterance pair. -/
  | token
  /-- The content-carrying side — the second position of the utterance pair. -/
  | claim
  deriving DecidableEq, Repr, Inhabited

namespace Kind

/-- There are exactly two kinds of mark — the cardinality the four-cell
codomain of articulating is forced from. Derived, not postulated. -/
theorem two_kinds : ∀ k : Kind, k = token ∨ k = claim := by
  intro k; cases k
  · exact Or.inl rfl
  · exact Or.inr rfl

/-- Token and claim are distinct — the duality is real, not nominal. -/
theorem token_ne_claim : token ≠ claim := by intro h; cases h

end Kind

end RelMath
