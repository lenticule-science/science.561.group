---
description: "A bilattice is a set equipped with two independent lattice orderings over the same elements — typically a truth order (false to true) and a knowledge order (absurd to overdetermined) — so that an element's position can be read two ways at once without either reading collapsing into the other. Belnap and Dunn's four-valued logic FOUR is the paradigmatic bilattice: it is the twist product of the two-element lattice with itself, giving exactly four values and two genuinely different orders over them."
date-created: 2026-08-21

---

FOUR has four values — call them false, true, absurd (both true and false),
and undetermined (neither) — and two orderings over the same four points.
The truth order runs false ≤ₜ {absurd, undetermined} ≤ₜ true, tracking how
true something is. The knowledge order runs undetermined ≤ₖ {false, true}
≤ₖ absurd, tracking how much evidence has accumulated about it, from no
information at the bottom to contradictory (overdetermined) information at
the top. Meet and join exist for both orders (∧/∨ for truth, ⊗/⊕ for
knowledge), and the two orders are related by involutions — negation flips
the truth order while fixing the knowledge order, and a converse-style
operation can flip the roles the other way — giving FOUR's automorphism
group real structure rather than being an arbitrary four-element set with
two orders drawn on it by hand.

Belnap and Dunn introduced this independently as a logic for reasoning with
incomplete or contradictory information from multiple sources: a database
that has been told both "p" and "not p" by two different informants should
be able to represent that state (absurd, high on the knowledge order)
without either collapsing to a single classical truth value or refusing to
represent the input at all. Priestley duality gives FOUR a bitopological
structure on top of the algebra: a Scott topology tracking positive,
accumulating information, and a Lawson topology tracking what is actually
observable at any given stage, the same two-topology structure that shows
up wherever a system needs to track both what is true and how much is
currently known separately. A bilattice is the general pattern this
example instantiates: any set with two lattice orderings over it, related
by structure-preserving involutions, used wherever "how true" and "how
settled" need to be tracked as genuinely separate axes rather than
conflated into one.
