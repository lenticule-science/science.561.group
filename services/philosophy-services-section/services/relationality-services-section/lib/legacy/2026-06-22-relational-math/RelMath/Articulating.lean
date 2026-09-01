/-
# Articulating — the base morphism (free recursion)

Articulating is the **base morphism** of the whole library: the first arrow of the
generative unfolding, the one every other morphism is reached *from*. It takes an
`Utterance` and **brings a relation into being** — it asserts the related, with
positive evidence, where before there was only the unrelated.

Three properties make it the floor of the proof-path:

* **Inverse-less / one-way.** There is no arrow back to a pre-relational state:
  the cell *is* the articulation. This is the Curry–Howard directionality the whole
  filepath-as-proof discipline rests on — to descend is to derive, never un-derive.
* **Inductive base.** Articulating is recursively the pair `[utterance,
  articulating]`: first slot an utterance being articulated, second another
  articulating. The recursion has no schema-level terminator; concrete instances
  bottom out only when an innermost utterance is reached whose token and claim are
  the non-assembling primitive marks. That grounding is what gives the recursive
  type finite inhabitants.
* **It seeds every other morphism.** Everything downstream factors through cells in
  the closure of articulating's image.

This is the *second and last* place RelMath admits free data: the recursion itself.
Below `Articulating`, nothing is free.
-/
import RelMath.Utterance

namespace RelMath

/-- The base morphism as a type: recursively the pair `[utterance, articulating]`,
bottoming out at an innermost (primitive) utterance.

* `utter u`    — the innermost articulation: a bare utterance of primitive marks.
                 This terminator is what makes inhabitants finite.
* `pair u a`   — `[utterance, articulating]`: an utterance articulated *over* a
                 further articulating `a`.

The type is one-way (an `Articulating` never yields back a pre-articulated state)
and it has finite inhabitants precisely because `utter` grounds the recursion in a
primitive utterance. -/
inductive Articulating where
  /-- Innermost articulation — the recursion's primitive floor. -/
  | utter : Utterance → Articulating
  /-- `[utterance, articulating]` — an utterance articulated over a further one. -/
  | pair : Utterance → Articulating → Articulating
  deriving Repr, Inhabited

namespace Articulating

/-- The utterance articulated at the head of an articulating — articulating's
domain projection. Total, because every constructor carries an utterance. -/
def head : Articulating → Utterance
  | utter u => u
  | pair u _ => u

/-- The recursion depth: how many nested articulatings before the primitive floor.
A `utter` leaf has depth `0`. Every inhabitant is finite, so `depth` is total. -/
def depth : Articulating → Nat
  | utter _ => 0
  | pair _ a => a.depth + 1

/-- Every articulating bottoms out: by structural induction it reaches an `utter`
leaf. Witnessed here by totality of `floor`, which returns that innermost
utterance. This is the "grounded in primitive marks ⇒ finite inhabitant" property. -/
def floor : Articulating → Utterance
  | utter u => u
  | pair _ a => a.floor

/-- A leaf is its own floor — the base case of the recursion. -/
@[simp] theorem floor_utter (u : Utterance) : (utter u).floor = u := rfl

/-- Articulating is inverse-less in the strong sense that distinct shapes are
distinguishable: a primitive floor is never a nested pair. (No arrow collapses the
one-way structure.) -/
theorem utter_ne_pair (u : Utterance) (v : Utterance) (a : Articulating) :
    utter u ≠ pair v a := by intro h; cases h

end Articulating

end RelMath
