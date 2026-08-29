---
title: "Which Obstructions Toughen?"
description: "An open mathematical question, stated but not answered: under what conditions does a failure-to-glue dissipate propagating failure rather than constitute it. States the question against the existing H1/cl-inv classification machinery and the rigidity-vs-graphic matroid gap already opened in this estate's own ossification note, with the mineralogical motivation summarized and cited. No proof is attempted."
date-created: 2026-08-21
type: notes
name: 2026-08-21-note-on-which-obstructions-toughen
authors:
  - claude-sonnet-5
keywords:
  - obsmetrologia
  - open-question
  - cohomology
  - rigidity-percolation
  - matroids
  - fracture
  - inquiry-program
---

# Which Obstructions Toughen?

## 1. The question, and why it is a real question rather than a metaphor

A same-day mineralogy reading of jade (cited in full above) reaches a
mechanistic conclusion about polycrystalline fracture toughness: nephrite's
felted amphibole microstructure resists crack propagation because a
propagating crack, meeting fibers at every orientation, must either cut
across a fiber or follow a grain boundary, and either way its energy is
spent deflecting, branching, or pulling fibers out of their matrix — this is
real, if only partially quantified, fracture mechanics (see the companion
materials-engineering note for the full mechanism catalogue: crack
deflection, transformation toughening, crack bridging/pull-out, each with its
own citation trail). A same-day biomimetic-semiotics reading of the same
mineral (cited above) then reaches for this estate's own cohomological
vocabulary — sections, gluing, H¹ obstruction — and asks, without answering:
**some non-gluings are load-bearing; under what conditions does an
obstruction dissipate propagating failure rather than constitute it?**

This is worth taking seriously as a mathematical question rather than
dismissing as loose talk, for one specific reason the materials-engineering
note supplies directly: **the answer is not always "yes."** The same note
documents a real, quantified, sourced disagreement between two close
biological analogues of jade's toughening — nacre (mother-of-pearl), whose
platelet-interlayer interfaces genuinely arrest cracks and produce a
roughly 40-fold fracture-toughness increase over the monolithic mineral, and
glass sponge spicules, whose superficially similar laminated silica
interfaces *do not* produce a comparable toughening effect, because the
specific interface mechanics there suppress rather than enable crack
arrestment. Two structures with "many interfaces, no single global
orientation" — the exact structural description the jade note gives for why
felting toughens — diverge sharply in whether that description actually
predicts toughness. **This is direct empirical evidence that "does this
obstruction toughen" is a real, nontrivial, sometimes-no question, not a
tautology that follows automatically from having interfaces at all** — which
is exactly what makes it worth a precise mathematical statement rather than
a design slogan.

## 2. Vocabulary check: what is actually load-bearing house machinery here, and what is informal

Before stating anything, an honest inventory of what the jade note's §4
actually cites, checked against this section's own active corpus this
session:

- **The H¹/cl-inv classification** is real, implemented, active house
  machinery, not a metaphor: `pymetrologic`'s `classification.py` module
  defines `H1Class` (a coordinate for the H¹ classifying invariant, `cl_inv`,
  with an `is_zero` property), `AperiodicSettling` (a settling paired with a
  closure regime and a classifying invariant, enforcing that strict and
  Scott-continuous regimes force `cl_inv = 0` while the aperiodic regime
  alone admits nonzero witnesses), and `CohomologicalSettling` (the full
  carrier of `(H⁰, cl-inv, regime)`). This gives the phrase "H¹ generators"
  in the jade note a real referent: nonzero `cl_inv` is precisely the
  aperiodic-regime failure to glue this section's own tooling already
  formalizes and computes.
- **The rigidity-vs-graphic-matroid gap** is likewise real, already stated
  in full with citations in this section's own ossification note (cited
  above): the tooling currently *implemented* counts the graphic matroid's
  cycle rank (b₁ = |E| − |V| + c, a **connectivity** invariant, independence
  testable locally by union–find), while the physical phenomenon that
  vocabulary like "floppy," "rigid," and "load-bearing" actually names —
  mechanical rigidity — is governed by the **generic rigidity matroid**
  (Laman's condition in the plane, of rank 2|V| − 3; no known combinatorial
  characterization in three dimensions, independence there requiring the
  nonlocal pebble-game test rather than any local count, per Jacobs &
  Hendrickson 1997). The ossification note states this precisely as
  "load-bearing₍₁₎" (what is implemented) versus "load-bearing₍₂₎ and above"
  (what the vocabulary and the physics actually mean), and insists — a
  discipline this note inherits directly — that any matroid-relative term
  must carry its subscript.
- **"Con-failure cells" and "holonomy sectors"**, by contrast, appear in the
  jade note's own informal listing of "the proved cohomology strand" but this
  note could not locate either phrase defined anywhere in the active
  `obsmetrologia` mathematics library or the `pymetrologic` executable
  shadow, searched directly this session. This is stated plainly rather than
  papered over: "con-failure" most plausibly refers, by context, to a cell
  carrying a contested/inconsistent charge assignment in the estate's
  paraconsistent bilattice substrate (the jade note's own §4 gestures at
  exactly this: "hold the contested charge; never average it to 6/10"), but
  this note did not find a citation making that identification precise, and
  treats the term as **informal, borrowed vocabulary awaiting a formal
  definition**, not as already-established machinery on the same footing as
  `H1Class` or the rigidity matroid. Anyone formalizing the question below
  should either supply that definition explicitly or drop the term.

**This matters for how the question below should be read**: it is stated
against one piece of genuinely established machinery (the H¹/cl-inv
classification) and one genuinely established open mathematical gap (the
rigidity-vs-graphic-matroid frontier), and it deliberately does not lean any
weight on "con-failure" or "holonomy sector" beyond flagging them as
terminology that would need independent grounding before use in a proof.

## 3. Stating the question precisely, without answering it

Take a finite cover of some base space or combinatorial complex, with local
data (sections, orientations, charge assignments — the specific content is
deliberately left open, since the question should apply uniformly to a
predication-cohomology setting and to a literal mechanical-rigidity setting)
assigned over each element of the cover, agreeing or disagreeing pairwise on
overlaps in the usual Čech sense. The obstruction to a single global section
is the nonvanishing of H¹ (equivalently, nonzero `cl_inv` in this section's
own executable model). Call an instance of this nonvanishing — a specific
generator, a specific non-agreeing overlap — an **obstruction cell**.

**The question**: is there a well-defined functional, computable from the
combinatorial/topological data of the cover and its obstruction cells alone
(not from an external physical measurement), that predicts whether a given
obstruction cell **dissipates** a locally-propagating "failure" (a crack, a
cascading inconsistency, an error propagating through a network) — by
absorbing or redirecting it, at the cost of the obstruction itself remaining
permanently unresolved — versus **constitutes** the failure directly — the
obstruction simply *is* the break, with nothing gained from its presence?

This is deliberately posed as a **dichotomy-detection problem**: given the
data of a specific non-gluing, classify it as toughening or as failure,
using only structure already available in the H¹/cl-inv picture plus
whatever additional structure (a rigidity matroid, a matching, a flow) turns
out to be the right thing to add.

**Why the rigidity-vs-graphic-matroid gap is the most plausible place to
look**, stated as precisely as this note can manage without proving
anything: the graphic matroid's invariant (cycle rank, b₁) detects a
non-gluing purely as a **connectivity** fact — an extra loop exists in the
covering nerve — and says nothing about whether that loop is under tension,
in compression, or slack; connectivity has no notion of load at all. The
rigidity matroid's invariant, by contrast, is defined precisely in terms of
**constraint counting against degrees of freedom** — an edge is
rigidity-independent exactly when it removes a genuine floppy mode, and
redundant (over-constraining, "load-bearing" in the strict engineering
sense) exactly when it does not. **A conjecture this note states but does
not prove**: an obstruction cell dissipates propagating failure specifically
when it corresponds to a rigidity-matroid-redundant element of the local
structure around it — i.e., when the failure-to-glue occurs at a point that
is already over-constrained in the rigidity sense, so that the "extra"
disagreement has nowhere further to propagate without first satisfying
constraints that are already oversubscribed — and constitutes failure
directly when it occurs at a rigidity-matroid-independent element, i.e., at
a point that was exactly load-bearing and whose failure therefore removes a
degree of freedom the rest of the structure was actually relying on.
**This conjecture is stated only to give the question a falsifiable shape;
it is not derived from anything in this note and should be treated with the
same suspicion as any unproven analogy.**

## 4. Why the empirical materials-science comparison (nacre vs. spicule) is a genuine stress-test for this conjecture, and why it might already fail it

The companion materials-engineering note's central finding — nacre's
platelet interfaces arrest cracks and toughen dramatically; glass sponge
spicule's laminated interfaces do not, despite a superficially similar
"many stiff layers, compliant interlayers" structure — is exactly the kind
of case that should discriminate the conjecture above, if the conjecture
has any content. A rigidity-matroid account would need to explain the
difference as: nacre's platelet-interlayer network is (in the relevant local
sense) over-constrained at the interfaces where cracking is arrested, while
the spicule's laminated interfaces are not, despite both being interfaces
between stiff and compliant material. This is stated here as an **open
empirical-and-formal question, not a claim**: it has not been checked, would
require someone to actually build a rigidity-matroid model of both
microstructures (treating platelets/lamellae as rigid bodies and their
interfaces as constraints, in the Phillips–Thorpe constraint-counting sense
the ossification note already develops for an entirely different material)
and test whether the rigidity-redundant/independent distinction actually
separates the two cases. **If it does not** — if both interfaces come out
looking rigidity-equivalent under any reasonable formalization, despite
their measured toughness differing by roughly an order of magnitude — the
conjecture in §3 is wrong as stated, and whatever *does* distinguish nacre
from the spicule (interfacial strength, specific geometry, something not
capturable by a rigidity matroid at all) would need to be found instead.
This note regards that as the single most informative test available, and
recommends it as the first thing anyone taking up this question should
attempt, precisely because it is cheap to state formally (no new physical
measurement required, only a combinatorial model of already-published
microstructures) and because a clean failure would be as valuable as a clean
success.

## 5. What this note is explicitly not doing

This note does not attempt to construct the functional described in §3, does
not attempt to prove the conjecture in §3, does not attempt to formalize
"con-failure cells" or "holonomy sectors," and does not attempt to connect
the rigidity matroid to the existing `pymetrologic` classification code in
any executable way. All of that is left as future work, explicitly, for
whoever next takes up this question — this note's only job was to state the
question precisely enough that "future work" is a well-defined target rather
than a vague gesture, and to record honestly which pieces of vocabulary
currently in circulation are load-bearing machinery and which are borrowed
terms awaiting definition.

## 6. Open questions

Two pieces of vocabulary used informally elsewhere in the estate are
explicitly not yet real machinery, and should stay flagged rather than
assumed: "con-failure cells" and "holonomy sectors" have no formal
definition in the active mathematics corpus that this note could locate,
and the §3 conjecture connecting rigidity-matroid redundancy to
obstruction-dissipation is stated only to give the question shape — it is
not derived, and it has not been tested. The H¹/`cl_inv` classification and
the rigidity-vs-graphic-matroid gap, by contrast, are checked against the
active corpus and the cited materials-science note and are real, executable
house machinery, as is the nacre-versus-spicule empirical disagreement as
sourced, quantified materials science.

The concrete next step, stated precisely rather than left abstract: build a
rigidity-matroid (constraint-counting) model of nacre's platelet-interlayer
microstructure and of the glass sponge spicule's laminated microstructure,
using the same formalization for both, and check whether
rigidity-redundant/independent classification of the crack-arresting
interfaces actually separates the two cases in line with their measured
~40-fold toughness difference. If it does not separate them, §3's
conjecture is wrong as stated and the question stays open with one
candidate answer eliminated; if it does, the conjecture gains its first
real support.

Left for whoever picks this up: whether the right object is a rigidity
matroid at all, or whether "which obstructions toughen" needs a genuinely
different invariant that this note, working only from the
materials-engineering and mineralogical motivation available today, has not
considered.
