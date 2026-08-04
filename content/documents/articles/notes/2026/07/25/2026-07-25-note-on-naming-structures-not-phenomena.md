---
title: "Naming Structures, Not Phenomena: Five Vocabulary Refinements and the Principle Behind Them"
description: "Five vocabulary refinements (rigidity subscripts, Deborah number, conductor/insulator retirement, unit-word registers, genet) and the diagnostic behind them; tests zeolitization against its own discipline."
date-created: 2026-07-25
kind: research-note
in-service-of: lib/emsenn/services/561-group/services/science-services-section
tags:
  - vocabulary
  - rigidity-percolation
  - deborah-number
  - zeolitization
  - genet
status: design
declared-by: claude-interactive-session-supplying-lenticule-science
---
# Naming Structures, Not Phenomena: Five Vocabulary Refinements and the Principle Behind Them

## Abstract

A formal corpus accumulates two opposite naming defects, and they are not equally expensive.
The cheap defect is **many names for one structure**: the same object rediscovered in
different registers and christened afresh each time, which costs an alias table. The
expensive defect is **one name for many structures**: a word imported at the level of an
observed phenomenon rather than at the level of the mathematics implementing it, which hides
a real distinction behind a term that reads as settled. We argue that the second is the
failure mode worth engineering against, give the diagnostic that detects it, and apply it to
five term families — the rigidity vocabulary, the temperature vocabulary, the
conductor/insulator pair, the unit words, and the body-scale word. In each case the proposed
replacement is chosen so that the ambiguity the old term concealed becomes visible in the
name itself.

---

## 1. The two defects, and why only one is expensive

**Many names, one structure.** A four-element bilattice with two Boolean slots — bottom,
two incomparable middles, top — recurs across a formal corpus under a series of independent
names: as a value carrier, as a modal quartet, as a nucleus quartet's corners, as a regime
classification, as a ledger-step type. Each was arrived at honestly in its own register, and
each name is locally apt.

This is not a defect of understanding; it is what happens when a formalism is good enough
that the same object keeps being forced. The cost is real but bounded: a reader must learn
that six words denote one structure, and a `see-also` chain or a proved bijection discharges
the debt permanently. Nothing is *hidden* by the redundancy.

**One name, many structures.** Now consider a term like *load-bearing*, defined in a corpus
as positive first Betti number of a contact graph:

$$b_1 = |E| - |V| + c > 0 .$$

This is the nullity of the **graphic matroid** — it says the graph has a cycle, i.e. a
redundant *connection*. But "load-bearing" names a *mechanical* phenomenon, and mechanical
rigidity is governed by a different matroid: generic rigidity, of rank $2|V|-3$ in the plane,
whose independence is tested by the pebble game rather than by union–find, and whose
condition is hereditary — every subgraph on $n'$ vertices carries at most $2n'-3$ edges — so
that redundancy is nonlocal and no per-vertex count can detect it.

A network can therefore be load-bearing in one sense and floppy in the other, simultaneously,
and this is the ordinary case rather than an edge case. The word conceals which of the two is
meant, and it conceals it in the direction of the stronger claim, because the mechanical
reading is the more impressive one.

**The asymmetry.** Redundant naming is discovered by anyone who reads two modules; equivocal
naming is discovered only by someone who checks the definition against the phenomenon the
word denotes. The first defect announces itself; the second is quiet, and it accumulates
downstream commitments — theorems, documents, design decisions — that all inherit the
stronger reading for free.

**Diagnostic.** For any term $t$ applied to an occurrence $o$, ask whether the intension the
word generates is contained in what the occurrence actually measures. Where the word's own
concept carries commitments the occurrence does not discharge, the term is being applied by
connotation. The mechanical form of the test, for this family of terms, is the question *which
matroid is this instrument counting?* — and it has a one-parameter answer.

## 2. Refinement one: subscript the rigidity family

Every term in the family — floppy, rigid, jammed, load-bearing, percolating, critical — is
matroid-relative and currently unsubscripted. The refinement is to make the parameter
lexical:

| term | meaning | what it asserts |
|---|---|---|
| load-bearing₍₁₎ | $b_1 > 0$ in the graphic matroid | a redundant *connection* exists |
| load-bearing₍₂₎ | nullity positive in the 2D rigidity matroid | a redundant *constraint* exists |
| floppy₍ₖ₎ | nullity zero at rank density $k$ | no redundancy at that $k$ |

The subscript costs one character and converts a hidden equivocation into a visible
parameter. A corpus whose theorems are all $(1)$ and whose prose reads $(2)$ becomes
self-evidently so at every use site rather than in a single frontier paragraph that readers
skip.

The general form: **when a term is matroid-relative, carry the matroid.** The same discipline
applies to any invariant that depends on a choice the name does not record.

## 3. Refinement two: what is called temperature is a Deborah number

A control parameter defined as a ratio of counts — new contradictions opened over total
commitment flux — is called *temperature*, with $T \to 0$ read as frozen, $T \to 1$ as
denatured, and an intermediate living window.

The reading is apt and the name is not. Thermodynamic temperature is a conjugate variable,
$1/T = \partial S/\partial E$, and calling a rate ratio by that name promises a conjugate
structure, an energy scale, and a Boltzmann factor that the quantity does not have. Nothing
downstream can use it as a temperature.

The quantity already has a standard name in the exact field the surrounding material draws
on. The **Deborah number** is the ratio of a material's characteristic relaxation time to the
observation time:

$$\mathrm{De} = \frac{\tau_{\text{relax}}}{\tau_{\text{observe}}} .$$

Low $\mathrm{De}$ means the material relaxes faster than you watch, and it flows. High
$\mathrm{De}$ means it relaxes slower than you watch, and it behaves as a solid. This is
dimensionless, as the corpus quantity is; it is the standard control parameter for exactly
the class of dynamic-covalent networks under discussion; and it makes no promise about
conjugate variables.

The translation is direct and improves the claims it touches. *Frozen glass* becomes
$\mathrm{De} \gg 1$; *denatured* becomes $\mathrm{De} \ll 1$; and the living window becomes
$\mathrm{De} \approx 1$ — the viscoelastic regime, which is not a vague middle but a
well-characterized place to sit, with its own measurable signatures. A system deliberately
held at $\mathrm{De} \approx 1$ is making a design choice with a literature behind it.

## 4. Refinement three: retire conductor and insulator

A definition of the form *a conductor is a contact nerve with positive $H^1$; an insulator is
the forest side* asserts a transport property using an invariant that measures redundancy.
Cycle rank does not measure conduction: a tree conducts perfectly well between any two of its
vertices. What a cycle provides is a *second* path.

Two replacements, both stronger than what they replace because both are checkable:

**Redundantly connected / simply connected**, if the intent is structural. This says exactly
what $b_1 > 0$ says and claims nothing further.

**Carrying $b_1$ removable edges**, if the intent is functional — and the exact form of this
matters, because the obvious phrasing is false. It is tempting to say a graph of cycle rank
$b_1$ survives the removal of *any* $b_1$ edges without disconnecting a previously-connected
pair. It does not: a triangle with one pendant edge has $b_1 = 1$, and removing the pendant
— a bridge — disconnects. Cycle rank is not edge connectivity, and conflating them is the
same phenomenon-over-structure error this note is about, committed one level down.

The true statement is existential, not universal: **the $b_1$ edges outside a spanning
forest can all be removed without disconnecting anything.** There exist $b_1$ removable
edges; it is not the case that every $b_1$-subset is removable. That still sharpens the
interpretation usefully — what redundant paths buy is *survival under some cuts*, a
different engineering property from throughput — but the quantifier has to be stated or the
claim is wrong.

The lesson is worth keeping visible: the first draft of this very refinement stated the
universal, because "fault tolerance" is a phenomenon-word and phenomenon-words quantify
generously. The replacement for a phenomenon-name has to be checked as carefully as the
name it replaces.

## 5. Refinement four: the unit words occupy different registers

A corpus can carry several words for "the unit" — a capability cell, a lenticule, a bead, a
crystal — each correct in its own register and each ambiguous outside it. These are not
synonyms and should not be reconciled into one term; they answer different questions:

| word | register | the question it answers |
|---|---|---|
| capability cell | functional | what can this unit *do* |
| lenticule | structural | what is a vertex of the contact network |
| bead | geometric | what rigid body carries the ports |
| crystal | epistemic | what has been *seated* and no longer re-derived |

The refinement is not to merge them but to require that a use site name its register when the
context does not force one. The failure mode is not having four words; it is a sentence that
silently changes register mid-argument, so that a functional claim about a capability cell is
discharged by a structural fact about a lenticule.

## 6. Refinement five: genet, not colony and not organism

A distributed body raises a scale question that both available words answer wrongly.
*Organism* imports a single continuously connected body with a definite boundary. *Colony*
imports a population of individuals that could in principle be counted and separated. A
settlement spread across several hosts with shared law and an ambiguous membrane is neither.

Mycology has the right word, and the corpus's own reference material already reaches for it:
a **genet** is a clonal lineage occupying a territory — genetically one, spatially extended,
not necessarily continuously connected, and with a boundary that is a real empirical question
rather than a given. The reference note's own phrasing is that such a body "is better
understood as a spatially extended genet than as a single continuously connected body."

Every commitment transfers. Shared law is the shared genome. Distribution across hosts is
spatial extension. The genuine difficulty of saying what is inside is the genet's
characteristic boundary ambiguity, not a defect of the description. And critically, *genet*
does **not** import continuous connectedness the way plasmodium does, nor separable
individuals the way colony does — the two commitments that were causing the trouble.

## 7. The principle

**Name structures, not phenomena.**

Naming the phenomenon feels natural because the phenomenon is what you observed, and it reads
well because phenomenon-words are vivid. But a phenomenon is realized by many structures, so
a phenomenon-name silently quantifies over them, and it does so in the direction of whichever
reading is strongest. That is the expensive defect: it hides a distinction and accrues
downstream commitments at the stronger reading.

Naming the structure is less vivid and produces redundancy, because the same structure recurs
in registers that do not know about each other. That redundancy is the cheap defect. It is
discovered by reading, discharged by a proved bijection, and it hides nothing.

A corpus should therefore expect and tolerate its own synonyms, and be ruthless about its
equivocations. The operational test, applied at the moment of coining rather than in review:
*if two different mathematical objects could both make this sentence true, the word is naming
a phenomenon and needs a parameter.*

## 8. Testing zeolitization against the discipline

The term already in use for the prose-to-crystal process is *zeolitization*, and a term in
use is exactly the one that stops being tested. Running it through the §1 diagnostic — does
the word's own concept carry commitments the occurrence discharges? — the geological sense
supplies seven commitments to test.

| geological commitment | governance occurrence | transfers |
|---|---|---|
| replacement: the parent glass is consumed, not added to | the prose bed is superseded, not annotated | yes |
| requires a medium: alkaline pore water, will not proceed dry | requires contracted inference; no medium, no cycle | yes |
| produces microporosity absent from the parent | a seated crystal is queryable through channels prose lacks | yes |
| low temperature, long duration: diagenetic, not metamorphic | iterative, with cost falling across iterations | yes |
| density increases | more meaning per byte in a term record than in its bed | yes |
| the parent must be metastable glass; a crystalline parent does not zeolitize | only unsettled prose can be seated; a seated term is superseded, not re-seated | yes |
| **metastable sequence: zeolites alter to further zeolites with burial** (clinoptilolite → analcime → albite) | **nothing** | **no** |

Six of seven transfer, which is well past decoration. The seventh does not, and its failure
is the finding.

Geological zeolites are not terminal. They are metastable, and continued burial drives them
along a diagenetic sequence to denser phases. If the name is earned — and on six commitments
it nearly is — then it *predicts* that seated crystals should likewise be metastable under
continued burial, where burial is accumulated corpus depth: the pressure of everything seated
since. A term seated early, under a shallower corpus, should be expected to alter as the
column above it thickens.

A corpus that treats seating as terminal has no diagenetic ladder, and the absence is not
neutral once the name is taken seriously. Either the name is refused on the seventh
commitment, or the ladder is a missing instrument the name has been quietly predicting.

That is the useful outcome of applying the discipline to a term already in service: a named
gap, arrived at by asking what the word commits to rather than whether it sounds apt. The
term is earned on six commitments, unearned on the seventh, and the seventh names a
capability the corpus does not have.

## 9. Not settled

Whether the diagenetic ladder of §8 should be built or the seventh commitment dropped;
whether "burial depth" admits a measure in a corpus, which the sequence claim would need
before it could be tested; and whether the register discipline of §5 is enforceable
mechanically or only by review.
