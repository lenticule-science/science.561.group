import Obsmetrologia.Primitive.Mark

/-!
# Utterance — the carrier (no free data)

A **token** is a mark carried on the left hand: the subject position. A
**claim** is a mark carried on the right hand: the predicate position. An
**utterance** is the ordered pair of a token and a claim — it is the **sole
admission boundary of the theory**: the one place a mark is let in, and it is
let in on a hand.

The hands are **types**, not positions read off a bare pair of marks later:
`Token` and `Claim` are their own one-field structures, each carrying a
`Mark`, so "which hand a mark sits on" is carried by the mark's type, not
recovered after the fact from an index. `Utterance` is the ordered pair of
one `Token` and one `Claim` — the two hands, typed. It is the **domain** of
`Articulating`: the structured carrier the articulating act is applied to.
Token first, claim second; the ordering is load-bearing.

An utterance is *not* an act — it articulates nothing. It is the pair that
articulating takes as input. Its two-sidedness is exactly what gives articulating's
codomain its four-cell partition.

No free data is introduced here: a token and a claim are each built entirely
from one `Mark`, and an utterance is built entirely from one token and one
claim.
-/

namespace Obsmetrologia

/-- A mark carried on the left hand: the token side of an utterance, the
subject position. -/
structure Token where
  /-- The mark carried on this hand. -/
  mark : Mark
  deriving DecidableEq, Repr, Inhabited

/-- A mark carried on the right hand: the claim side of an utterance, the
predicate position. -/
structure Claim where
  /-- The mark carried on this hand. -/
  mark : Mark
  deriving DecidableEq, Repr, Inhabited

/-- The ordered pair of a token-side hand and a claim-side hand. Articulating's
domain. Token first, claim second — the order is load-bearing. -/
structure Utterance where
  /-- The identity-carrying side (which one). First position. -/
  token : Token
  /-- The content-carrying side (what is said). Second position. -/
  claim : Claim
  deriving DecidableEq, Repr, Inhabited

namespace Token

/-- Mark equality gives carrier equality: a token is nothing but its mark. -/
theorem ext {t1 t2 : Token} (h : t1.mark = t2.mark) : t1 = t2 := by
  obtain ⟨m1⟩ := t1
  obtain ⟨m2⟩ := t2
  cases h
  rfl

end Token

namespace Claim

/-- Mark equality gives carrier equality: a claim is nothing but its mark. -/
theorem ext {c1 c2 : Claim} (h : c1.mark = c2.mark) : c1 = c2 := by
  obtain ⟨m1⟩ := c1
  obtain ⟨m2⟩ := c2
  cases h
  rfl

end Claim

namespace Utterance

/-- Read off the mark sitting at a given kind/position of the utterance: the
token hand's mark, or the claim hand's mark. -/
def at_ : Utterance → Kind → Mark
  | u, .token => u.token.mark
  | u, .claim => u.claim.mark

@[simp] theorem at_token (u : Utterance) : u.at_ .token = u.token.mark := rfl
@[simp] theorem at_claim (u : Utterance) : u.at_ .claim = u.claim.mark := rfl

end Utterance

end Obsmetrologia
