---
title: "The Rule Space of Weiqi"
type: research-article
status: proposal
author: claude-fable-5.1
date-created: 2026-09-04
keywords: ["weiqi", "rule-space", "ruliology", "multiway", "closure-rule-language", "regime", "ko", "curry-howard-lambek", "cone"]
what-is-proved:
  - "WeiqiObsmetrologia.Ko: the three ko regimes as trace predicates; positional implies simple and situational; the 3^n bound"
  - "WeiqiObsmetrologia.Admission: legality as a HoareProgram precondition, invariant transported along composition, for one fixed point of the rule space (positional superko, suicide illegal)"
  - "Obsmetrologia/CausalSets/Causal/Cone.lean and Order.lean: future and past cones over a finite causal order, a proved partial order; finite causal sets settle in the strict regime"
  - "Obsmetrologia/Language/Predicating/CurryHowardLambek.lean: the simply-typed correspondence and chl_quartet_is_nuclear"
  - "the closure-rule language (obsmetrological section, closure-rule/): a rule's fragment determines its regime"
  - "Outside the house: multiway systems with rule inclusions are n-fold categories (Arsiwalla, Gorard, Elshatlawy 2022); global confluence is necessary and not sufficient for causal invariance (Gorard 2020)"
description: Swept 2026-09-04, one reader per lineage, one refuter per claim, 35 claims verified.
---

## 0. What was in the corpus, what was only thought

Swept 2026-09-04, one reader per lineage, one refuter per claim, 35
claims verified. The owner asked which of this is in the tree, which is
in legacy, and which was only ever thought. The answer by lineage:

- **Ruliology.** The word, in either spelling, is nowhere in the corpus:
  a cold spot. The *thing* is: the obsmetrological section's
  closure-rule language fixes what a rule is ("first-order, positive in the
  cell values, single ∀-block over entities") and proves that the fragment
  a rule is written in determines the regime of the closure it generates,
  strict, Scott, transfinite, or aperiodic. That is a theory of what rules
  do, executable, and it predates the word.
- **Rules as data.** In the tree and running: the weiqi kernel's rulesets
  (four dimensions plus komi, stable identifiers, "never as code forks")
  and the solitaire fleet's eight variants over one engine.
- **Rules as strategies.** Only in a triage idea document
  (`emsenn-services-section/content/text/triage/predication-world-sim.md`,
  agent-authored): house rules as local predicate enrichments of a game
  fiber. Thought, written once, never seated.
- **Cones.** Proved: `Cone.lean` gives future and past cones over the
  finite causal order as a partial order, `Order.lean` proves finite causal
  sets settle strictly, and Hole, Shroud, Deshrouding, Manifoldlikeness
  stand on them. Coinage: "language cone" is house vocabulary from
  2026-05, with no code declaration as of 2026-07-09 and its commutation
  theorem stated as unproved.
- **Curry–Howard–Lambek.** Proved: the simply-typed correspondence and
  `chl_quartet_is_nuclear`, the four type formers matched to FOUR's
  corners. Conjecture: the identification of the four columns with
  (H, Fix σ, Fix Δ, H*) is in a triage carrier as a conjecture with its
  limit stated: the fiber language is nuclear modal, not simply typed, so
  the classical correspondence "holds in spirit but requires adaptation."
- **Arena of arenas.** Absent under every phrasing. The gaming app keeps
  Arena and Strategy as distinct kinds; Girard's internal completeness is
  running code; no carrier says the space of strategies is itself an
  arena.
- **Ruleset as a move.** Absent. Every carrier treats the ruleset as a
  setup parameter (an SGF root property, a constructor argument).

So the sentence the owner reached for, rules as strategies in the rule
space, was thought and not written, and the objects it needs are written
and not joined. This article joins them.

## 1. The rule space, as it already exists

The kernel's rule space is a finite product: ko regime (three values),
suicide (two), scoring (three), handicap placement (two), komi (a
number). A ruleset is a point in it; the five named rulesets are five
points. `Ko.lean` proves the ko axis is ordered: positional superko
implies both simple ko and situational superko, and the converse fails.
`Admission.lean` proves legality is a Hoare precondition and transports
the regime invariant along composition, for one point of the space
(positional superko, suicide illegal). That is the honest scope: the
proof is of one ruleset, not of the space, and parameterizing it over the
axes is the next Lean lot, small and definite.

## 2. The rule space as a multiway system

Wolfram's rulial multiway system follows every rule as well as every
update, and a slice of it is rulial space, "different rules for history"
([wolfram2021ruliad](../bibliographies/wolfram2021ruliad.md)). The
kernel's rule space is a finite rulial space, and a game under a ruleset
is one branch of it. Two facts already proved make this exact rather than
evocative:

- A multiway system's histories branch on conflict and commute on
  independence, which is a prime event structure, which is the arena.
  Its causal graph is a causal set
  ([gorard2020causalsets](../bibliographies/gorard2020causalsets.md)), the
  object `Manifoldlikeness.lean` reads cohomologically.
- Adding a rule induces a homotopy between plays; a multiway system with
  rule inclusions is an n-fold category
  ([arsiwalla2022homotopies](../bibliographies/arsiwalla2022homotopies.md)).
  So a rule is a 2-cell between strategies: two plays a rule identifies
  are one play up to that rule.

That second fact is what "rules as strategies" means without analogy. A
strategy is a 1-cell in the arena of moves; a rule is a 2-cell in the
arena of strategies; the rule space is the 2-dimensional part of the same
object, not a separate game. Changing the ko regime does not add a
player; it adds an identification between plays. The house's closure-rule
language grades those 2-cells by regime, which is what ruliology, done
as proof rather than enumeration, has to offer.

## 3. The engine's implicit ruleset, and the rule game

An engine does not read the kernel's ruleset; it enforces a learned
approximation of it. Where the two disagree there is a region of the rule
space in which the engine and the scorer are playing different games, and
the cyclic attack
([Strategy Spaces the Engines Cannot See](strategy-spaces-the-engines-cannot-see.md))
is a play into that region: the network's liberty-reading fails on groups
that enclose a region, so the engine's implicit rule for capture differs
from the true rule exactly there. The adversary wins the rule game, not
the move game.

That is the general form of a class of incidents the org already knows:
a checker enforcing a rule the law does not state, a session enforcing
instructions it was not given. Every enforcer carries an implicit ruleset;
the disagreement between declared and enforced rules is a computable
region; and playing into it is the attack, on a board or on a control
plane. The whole-board reader's duty to read before anyone moves is the
defense: read the enforced ruleset, not the declared one.

## 4. The Lorentzian reading of ko

The org-layering law commits to the four CHL columns as the four causal
positions of an utterance, σ the past cone and Δ the future cone, and
marks the identification's proof open. The cones themselves are proved
(`Cone.lean`). On the board the ko theorem now reads in that language:
**a lawful future cone may not contain a copy of a past cone.** Simple ko
forbids the copy at distance two; positional superko forbids it at any
distance on the board projection; situational superko on the (board,
actor) projection. The 3^n bound is the statement that a trace obeying
that law is finite. This is the first place in the corpus where the cone
language yields a game-theoretic law with a proof behind it rather than a
manifold picture, and it is a candidate worked example for the
conjecture the triage carrier leaves open.

## 5. Choosing a rule as a move

No carrier treats it so, and there is one place it is literal: the rule
of gluing. A house rule, in the triage idea document's words, is a local
predicate enrichment of the game fiber, a variant the community plays
without changing the canonical game. On the honeycomb that is a
disclination: a local change of coordination the crystal's relaxation
detects and, if it is a border rather than damage, preserves. Choosing to
play under a house rule is therefore a move in the arena of strategies
(§2), and the market's classifier decides whether it is repairable damage
or a protected border. Lakota weiqi, if it becomes a lineage, is such a
move: not a different game, an enrichment of the fiber that the
canonical game admits as a border.

## 6. What refutes this

- If parameterizing `Admission.lean` over the ko and suicide axes fails
  to transport the invariant for some point of the rule space, §1's "small
  and definite" is wrong and the rule space is not a product.
- If the n-fold-category reading does not survive the house's nuclei (if
  σ and Δ are not homotopies induced by any rule inclusion), §2's "rules
  are 2-cells" is a correspondence, not an identity.
- If engine blunders are not concentrated where the enforced and declared
  rulesets differ, §3 is wrong about what the adversary exploits.
- If the ko law cannot be stated in `Cone.lean`'s own terms (a future cone
  containing a copy of a past cone), §4 is a picture.

## 7. Filed

- The Ko.lean docstring cited a wrong path and value vocabulary for the
  kernel's ko regimes; replaced 2026-09-04.
- The ruliology cold spot is recorded in this section's bibliography under
  the right spelling.
- Ludeme was rejected as house coinage on 2026-08-29 because it collides
  with the Ludii project; this article uses "rule" and "rule space" only.
