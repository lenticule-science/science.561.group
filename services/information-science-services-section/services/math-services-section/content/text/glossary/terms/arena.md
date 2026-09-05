---
description: "An arena is a finite causal event structure whose events carry polarity and four-valued evidence, organized as a Grothendieck site whose local sections glue by the sheaf condition and closed by a settlement operator into one coherent object over which strategies are defined. It generalizes the classical Hyland–Ong game-semantics arena, which is recovered exactly when every finite configuration collapses to a single linearly ordered sequence of justified moves."
date-created: 2026-08-21

---

An arena is built from five pieces, each independently standard, fused into
one object. A finite set of events `E`, each occurring only after its causal
predecessors under a directed, acyclic dependency relation `<` (irreflexive
and transitive, hence a strict partial order): a *position* is a finite
configuration, a down-closed, conflict-free subset of `E` — an occurred
history, not a single point. A polarity function `λ : E → {−,+}` marking
each event Opponent-facing or Player-facing. A four-valued evidence
assignment over the [Belnap–Dunn bilattice](./bilattice.md), `{⊥, t, f, ⊤}`
under a knowledge order, giving every event a truth-and-evidence reading
rather than a bare boolean. A [site](./site.md): a Grothendieck site of
observable supports with fiber-local covers satisfying pullback-stability,
so that local observation patches combine into one arena rather than a bare
set of states — the [sheaf](./sheaf.md) condition (local sections agreeing
on overlaps glue to a unique global section) is what licenses treating
locally-observed evidence as globally coherent. A settlement closure
operator — inflationary, monotone, idempotent — carrying every valuation to
a least fixed point, the arena's "settled" reading, which on finite supports
always terminates.

The arena theorem states that these five ingredients, taken together —
finite acyclic causal graph, pairwise conflict, polarity, finite site,
four-valued valuation, closure operator — jointly determine one finite,
settled, polarized site-arena; no further data is needed to fix the object.
A strategy over an arena is a family of positions satisfying four
conditions: it contains the empty position; it is prefix-closed; it is
receptive to every lawful Opponent (negative) extension; and it is
deterministic on Player (positive) one-step extensions up to symmetry, with
maximal positions always settled.

This construction is a genuine generalization of the Hyland–Ong arena from
game semantics, not merely a reuse of the name. An HO/AJM arena generates
moves with ownership and polarity, plus a justification (enabling)
relation; a play is a sequence of justified moves; a strategy is a set of
plays obeying behavioral constraints. The event-structure arena recovers
this exactly as the special case where every finite configuration collapses
to a linear chain — a two-event question/answer arena, negative question
causally before positive answer, is the smallest worked instance — while
keeping causally-independent events genuinely incomparable in general,
rather than forcing an arbitrary linear order on events that do not actually
depend on each other.
