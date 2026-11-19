---
title: "Belnap Four-Valued Logic: Reasoning with Gaps and Gluts"
summary: "Belnap-Dunn logic gives each claim one of four statuses: true only, false only, both, or neither. It lets a machine reason on conflicting data."
date-created: 2026-07-08
type: paper
status: active
visibility: public
tags: [belnap-dunn-logic, four-valued-logic, paraconsistent-logic, bilattices, first-degree-entailment]
abstract: "Belnap-Dunn logic, also called first-degree entailment (FDE), assigns every proposition one of four informational statuses: supported as true only, supported as false only, supported both ways, or supported neither way. This paper is a primer and survey. It explains the two partial orders on the four values (a truth order and an information order), derives the connectives from independent positive and negative support, and shows exactly how the logic is paraconsistent (explosion fails) and paracomplete (excluded middle fails) at once. It follows the lineage through relevance logic, Dunn's semantics, Scott-style approximation and bilattices, works one small inconsistent-database example, and states what the logic does not provide: a canonical conditional, source trust, provenance, belief revision, or degrees of confidence. It closes with open problems about source-indexed, temporal and typed-consequence extensions. The paper is a synthesis of established literature plus clearly marked research directions; it claims no new theorem."
keywords: [Belnap-Dunn logic, first-degree entailment, FDE, four-valued logic, paraconsistent logic, paracomplete logic, bilattice, information order, truth order]
math: true
references:
  belnap1977how: { type: chapter, title: "How a computer should think", author: [{family: Belnap, given: Nuel D.}], editor: [{family: Ryle, given: Gilbert}], issued: {date-parts: [[1977]]}, container-title: "Contemporary Aspects of Philosophy", publisher: "Oriel Press", page: "30-56" }
  belnap1977useful: { type: chapter, title: "A useful four-valued logic", author: [{family: Belnap, given: Nuel D.}], editor: [{family: Dunn, given: J. Michael}, {family: Epstein, given: George}], issued: {date-parts: [[1977]]}, container-title: "Modern Uses of Multiple-Valued Logic", publisher: "D. Reidel", publisher-place: Dordrecht, page: "5-37", DOI: "10.1007/978-94-010-1161-7_2" }
  dunn1976: { type: article-journal, title: "Intuitive semantics for first-degree entailments and 'coupled trees'", author: [{family: Dunn, given: J. Michael}], issued: {date-parts: [[1976]]}, container-title: "Philosophical Studies", volume: "29", page: "149-168", DOI: "10.1007/BF00373152" }
  andersonbelnap1975: { type: book, title: "Entailment: The Logic of Relevance and Necessity, Volume I", author: [{family: Anderson, given: Alan Ross}, {family: Belnap, given: Nuel D.}], issued: {date-parts: [[1975]]}, publisher: "Princeton University Press" }
  priest1979: { type: article-journal, title: "The logic of paradox", author: [{family: Priest, given: Graham}], issued: {date-parts: [[1979]]}, container-title: "Journal of Philosophical Logic", volume: "8", issue: "1", page: "219-241", DOI: "10.1007/BF00258428" }
  kleene1952: { type: book, title: "Introduction to Metamathematics", author: [{family: Kleene, given: Stephen Cole}], issued: {date-parts: [[1952]]}, publisher: "D. Van Nostrand" }
  ginsberg1988: { type: article-journal, title: "Multivalued logics: a uniform approach to reasoning in artificial intelligence", author: [{family: Ginsberg, given: Matthew L.}], issued: {date-parts: [[1988]]}, container-title: "Computational Intelligence", volume: "4", issue: "3", page: "265-316", DOI: "10.1111/j.1467-8640.1988.tb00280.x" }
  fitting1991: { type: article-journal, title: "Bilattices and the semantics of logic programming", author: [{family: Fitting, given: Melvin}], issued: {date-parts: [[1991]]}, container-title: "Journal of Logic Programming", volume: "11", issue: "1-2", page: "91-116", DOI: "10.1016/0743-1066(91)90014-G" }
  arieliavron1996: { type: article-journal, title: "Reasoning with logical bilattices", author: [{family: Arieli, given: Ofer}, {family: Avron, given: Arnon}], issued: {date-parts: [[1996]]}, container-title: "Journal of Logic, Language and Information", volume: "5", issue: "1", page: "25-63", DOI: "10.1007/BF00159338" }
  arieliavron1998: { type: article-journal, title: "The value of the four values", author: [{family: Arieli, given: Ofer}, {family: Avron, given: Arnon}], issued: {date-parts: [[1998]]}, container-title: "Artificial Intelligence", volume: "102", issue: "1", page: "97-141", DOI: "10.1016/S0004-3702(98)00032-0" }
  bimbodunn2001: { type: article-journal, title: "Four-valued logic", author: [{family: Bimbó, given: Katalin}, {family: Dunn, given: J. Michael}], issued: {date-parts: [[2001]]}, container-title: "Notre Dame Journal of Formal Logic", volume: "42", issue: "3", page: "171-192", DOI: "10.1305/ndjfl/1038949580" }
  omoriwansing2017: { type: article-journal, title: "40 years of FDE: an introductory overview", author: [{family: Omori, given: Hitoshi}, {family: Wansing, given: Heinrich}], issued: {date-parts: [[2017]]}, container-title: "Studia Logica", volume: "105", page: "1021-1049", DOI: "10.1007/s11225-017-9748-6" }
  prenosil2023: { type: article-journal, title: "The lattice of super-Belnap logics", author: [{family: Přenosil, given: Adam}], issued: {date-parts: [[2023]]}, container-title: "The Review of Symbolic Logic", volume: "16", issue: "1", page: "114-163", DOI: "10.1017/S1755020321000156" }
  jakl2025: { type: article, title: "Four imprints of Belnap's useful four-valued logic in computer science", author: [{family: Jakl, given: Tomáš}], issued: {date-parts: [[2025]]}, container-title: "arXiv", number: "2503.20679" }
---

# Belnap Four-Valued Logic: Reasoning with Gaps and Gluts

Belnap four-valued logic assigns every statement one of four informational statuses: supported as true only, supported as false only, supported both ways, or supported neither way. It exists so that a machine fed by several imperfect sources can keep reasoning when its data are incomplete or contradictory, instead of either stopping or concluding everything. The system, usually called Belnap-Dunn logic or first-degree entailment (FDE), fits on one page, and its central idea is that the fourth and third values are different problems with different remedies.

## What problem does Belnap's logic solve?

Classical logic validates *explosion*: from a statement $A$ and its negation $\neg A$, any conclusion $B$ follows. Inside classical logic this is not a bug, because no classical valuation makes both premises true, so the inference is vacuously safe. For an information-processing system it is a trap. A medical chart can say a patient is allergic to penicillin and also that they are not. A legal database can hold a revoked rule and a still-indexed copy of the old rule. A distributed system can receive two contradictory messages. A search index can hold no entry at all about some proposition. A system that concludes arbitrary things from one conflicting pair of records is useless, and a system that halts is little better.

Belnap's response, in two papers published in 1977 [@belnap1977how; @belnap1977useful], was not to add two "more true" values to a scale. He reinterpreted truth values as *what the system has been told*. The logic separates two questions that classical logic fuses:

1. Is the proposition supported as true?
2. Is the proposition supported as false?

Each question gets an independent yes or no. Four combinations result, and each is a legitimate state of a database.

## What are the four values?

Write $T$ for "told true" and $F$ for "told false". A value is a subset of $\{T, F\}$:

| Symbol | Set | Reading | Typical cause |
|---|---|---|---|
| $\mathbf{t}$ | $\{T\}$ | true only | one or more sources say yes, none say no |
| $\mathbf{f}$ | $\{F\}$ | false only | one or more sources say no, none say yes |
| $\mathbf{b}$ | $\{T,F\}$ | both (a glut) | sources disagree |
| $\mathbf{n}$ | $\varnothing$ | neither (a gap) | no source has spoken |

The value $\mathbf{b}$ is an *epistemic* state: the database holds both a positive and a negative report. In Dunn's own presentation of the semantics [@dunn1976], the point is that agents may suppose, assert, believe or receive contradictory claims, and the logic should say what follows without trivializing; it is not a claim that reality contains true contradictions. The same restraint applies here.

Many presentations call the fourth value $\bot$ and the third $\top$. This paper uses $\mathbf{n}$ and $\mathbf{b}$ to avoid suggesting that $\top$ is "most true". It is not, as the next section shows.

## What are the two orders on the four values?

This is the entire secret of the system: the four values are not on a line. They carry two different partial orders.

**The truth order** $\leq_t$ ranks by how true. Falsehood is at the bottom, truth at the top, and the two middle values are incomparable:

$$\mathbf{f} \leq_t \mathbf{n} \leq_t \mathbf{t}, \qquad \mathbf{f} \leq_t \mathbf{b} \leq_t \mathbf{t}.$$

**The information order** $\leq_k$ (also called the knowledge order) ranks by how much has been said. In the set representation it is inclusion of subsets of $\{T,F\}$:

$$\mathbf{n} \leq_k \mathbf{t} \leq_k \mathbf{b}, \qquad \mathbf{n} \leq_k \mathbf{f} \leq_k \mathbf{b}.$$

Here $\mathbf{n}$ is the bottom (nothing said), $\mathbf{b}$ is the top (everything said, in both directions), and $\mathbf{t}$ and $\mathbf{f}$ are incomparable middles.

The two diamonds are the same shape with extremes and middles exchanged. A glut is not "more true" than a plain truth: in the truth order $\mathbf{t}$ sits above $\mathbf{b}$. But a glut contains more information than a plain truth, because it contains a positive report and a negative one. Contradiction is thus not an absence of information; it is a surplus of incompatible information. A gap is not "less true" than falsehood (in the truth order $\mathbf{n}$ is above $\mathbf{f}$ because it lacks negative support) but it is the least informed state.

Classical logic has one dimension, truth. Belnap's logic has at least two, and most of its confusions come from mixing them.

## How are the connectives defined?

### Derivation from independent clauses

The easiest way to learn the connectives is not to memorize tables but to apply the classical truth and falsity clauses separately, with no assumption that exactly one of them holds. For a value $x \subseteq \{T,F\}$:

- $T \in \neg x$ iff $F \in x$; $F \in \neg x$ iff $T \in x$.
- $T \in (x \wedge y)$ iff $T \in x$ and $T \in y$; $F \in (x \wedge y)$ iff $F \in x$ or $F \in y$.
- $T \in (x \vee y)$ iff $T \in x$ or $T \in y$; $F \in (x \vee y)$ iff $F \in x$ and $F \in y$.

These are the classical clauses, applied to the "told true" and "told false" components independently. The non-classical behaviour arises only because the two components are no longer constrained to be exclusive or exhaustive. Classical logic is the special case where every value is $\mathbf{t}$ or $\mathbf{f}$.

### Negation

Negation swaps true-only and false-only and fixes the two middle-of-truth values: $\neg\mathbf{t}=\mathbf{f}$, $\neg\mathbf{f}=\mathbf{t}$, $\neg\mathbf{b}=\mathbf{b}$, $\neg\mathbf{n}=\mathbf{n}$. In pair notation it swaps the positive and negative coordinates, $\neg(p^+,p^-)=(p^-,p^+)$. It reverses the truth order and preserves the information order, as it should: swapping truth for falsity changes orientation but neither adds nor removes information.

### Conjunction and disjunction

Conjunction is the meet and disjunction the join in the truth order. The tables (row value first):

| $\wedge$ | $\mathbf{f}$ | $\mathbf{n}$ | $\mathbf{b}$ | $\mathbf{t}$ |
|---|---|---|---|---|
| $\mathbf{f}$ | f | f | f | f |
| $\mathbf{n}$ | f | n | f | n |
| $\mathbf{b}$ | f | f | b | b |
| $\mathbf{t}$ | f | n | b | t |

| $\vee$ | $\mathbf{f}$ | $\mathbf{n}$ | $\mathbf{b}$ | $\mathbf{t}$ |
|---|---|---|---|---|
| $\mathbf{f}$ | f | n | b | t |
| $\mathbf{n}$ | n | n | t | t |
| $\mathbf{b}$ | b | t | b | t |
| $\mathbf{t}$ | t | t | t | t |

The two surprising entries are $\mathbf{n}\wedge\mathbf{b}=\mathbf{f}$ and $\mathbf{n}\vee\mathbf{b}=\mathbf{t}$. They follow from the truth lattice: the two incomparable middles meet at the bottom and join at the top. They are also where newcomers most often confuse the two orders, because in the information order $\mathbf{n}$ and $\mathbf{b}$ are bottom and top.

### Two more operations on the information order

The same four-element set carries meet and join for $\leq_k$, written $\otimes$ and $\oplus$. In set terms $x \otimes y = x \cap y$ and $x \oplus y = x \cup y$. So $\mathbf{t}\oplus\mathbf{f}=\mathbf{b}$ and $\mathbf{t}\otimes\mathbf{f}=\mathbf{n}$. These are two different policies for combining reports: $\oplus$ means "pool everything we were told", and $\otimes$ means "keep only what the sources agree on". A data-fusion system might accumulate with $\oplus$ when ingesting and publish with $\otimes$ when it wants a conservative answer. The structure with both pairs of operations is a *bilattice*; see [What is a bilattice?](/bilattices-and-belnap-dunn-logic/).

## How does the logic stay useful under contradiction?

### Consequence as designated-value preservation

The standard consequence relation preserves *designated values*, those that include positive support: $D=\{\mathbf{t},\mathbf{b}\}$. A sequent $\Gamma \vdash A$ is valid when every valuation designating all members of $\Gamma$ also designates $A$.

### Explosion fails

Let $p=\mathbf{b}$ and $q=\mathbf{f}$. Then $p$ and $\neg p$ are both designated while $q$ is not, so

$$p,\ \neg p \nvdash q.$$

A contradiction about $p$ does not infect $q$. This is paraconsistency, and it is controlled: the failure is located exactly where a proposition carries $\mathbf{b}$.

### Excluded middle fails too

Let $p=\mathbf{n}$. Then $\neg p=\mathbf{n}$ and $p\vee\neg p=\mathbf{n}$, which is not designated, so

$$\nvdash p \vee \neg p.$$

This is paracompleteness: a gap does not automatically close itself. FDE is therefore both paraconsistent and paracomplete, which is sometimes called *paradefinite*.

### What still holds

FDE is not anarchic. Conjunction elimination ($A\wedge B\vdash A$), disjunction introduction ($A\vdash A\vee B$), double negation ($\neg\neg A\equiv A$) and the negation-duality laws ($\neg(A\wedge B)\equiv\neg A\vee\neg B$, $\neg(A\vee B)\equiv\neg A\wedge\neg B$) all remain valid. What fails are the patterns that depend on exhaustiveness, exclusivity or irrelevant explosion. The logic removes three structural assumptions: that every sentence is true or false, that none is both, and that contradiction entails everything.

## Why would a machine need four values instead of two or three?

Two three-valued neighbours each repair half the problem. Kleene's strong three-valued logic [@kleene1952] has an "undefined" value but no "both", so it handles gaps but not gluts. Priest's Logic of Paradox [@priest1979] has "both" but no separate "neither", so it handles gluts but not gaps. Belnap-Dunn logic is the square containing both: the closure of the two independent ways to deviate from bivalence, namely that truth and falsity may fail to be exhaustive (gaps) and may fail to be exclusive (gluts). Delete $\mathbf{b}$ and the structure is related to Kleene-style partiality; delete $\mathbf{n}$ and it is related to Priest's LP.

The practical argument is that "nobody said anything" and "people said opposite things" demand different responses. A silent record may call for retrieval or a question to a user; a conflicted one may call for arbitration, quarantine or a policy decision. A system built on two values has to either guess at the silence or treat the conflict as an exception outside the logic.

### Worked example: a tiny inconsistent database

Source 1 reports "the server is reachable", Source 2 reports "the server is not reachable", and no source says anything about whether the backup is current. Let $r$ be the first statement and $c$ the second. Then $r=\mathbf{b}$ and $c=\mathbf{n}$.

- $r\wedge c=\mathbf{b}\wedge\mathbf{n}=\mathbf{f}$. The conjunction has negative support from the first conjunct and no positive support from the second.
- $r\vee c=\mathbf{b}\vee\mathbf{n}=\mathbf{t}$. The disjunction has positive support from $r$ and no negative support from $c$.
- From $r$ and $\neg r$ the system does not infer $c$. The conflict about reachability stays local.

This locality is the point. Inconsistency in real data is rarely everywhere; it sits in specific records. FDE lets the rest of the reasoning proceed.

## Where does the logic come from?

The lineage matters because it explains why implication is awkward and why the logic keeps reappearing.

1. **Many-valued logic.** Łukasiewicz, Post and Kleene made it respectable to replace the two-element Boolean algebra with a larger algebra of semantic values. Belnap's move is more specific than "use four": use two independent yes/no dimensions.
2. **Relevance logic.** Anderson and Belnap's work on entailment [@andersonbelnap1975] rejects implications that hold merely because the antecedent is impossible, such as $(A\wedge\neg A)\to B$. FDE is the first-degree fragment of that project: entailments between formulas built from variables with conjunction, disjunction and negation, without nested implication.
3. **Dunn's semantics.** Dunn's 1976 paper [@dunn1976] gives the immediate mathematical ancestor: each formula is related to the markers $T$ and $F$ by a relation rather than a function, which yields exactly the four combinations.
4. **Belnap's computer.** Belnap's papers [@belnap1977how; @belnap1977useful] frame a question-answering machine reasoning from a database populated by fallible sources. Unlike the usual philosophical case for many-valued logic, the question is not whether reality contains contradictions but what a machine should do when its *data* do. Belnap also draws on Scott's approximation lattices, which is what gives the information order a computational reading: a state with no information can be refined to true-only or false-only, and further information can produce "both".
5. **Bilattices.** Ginsberg [@ginsberg1988] and Fitting [@fitting1991] generalized the four-element structure into bilattices, sets with a truth lattice and an information lattice. Fitting showed they give a semantics for logic programs in which missing and conflicting information are both first-class.
6. **FOUR as a basis.** Arieli and Avron [@arieliavron1996; @arieliavron1998] argued that the four-element bilattice plays for bilattice-valued reasoning a role analogous to the two-element Boolean algebra for classical logic: many bilattice-valued consequence relations can be characterized through four-valued ones.
7. **The algebraic turn.** Overviews by Bimbó and Dunn [@bimbodunn2001] and by Omori and Wansing [@omoriwansing2017] organize the field. FDE's algebraic counterpart is the class of distributive lattices with an involutive negation, and work on *super-Belnap logics* such as [@prenosil2023] maps the lattice of extensions of FDE, analogously to superintuitionistic logics above intuitionistic logic.

## What does the logic not give you?

The source analysis is explicit that FDE is a minimal base, not a complete solution.

- **No unique conditional.** The base language has only $\wedge$, $\vee$, $\neg$. Classical material implication defined as $\neg A\vee B$ inherits odd behaviour under gaps and gluts. There is no single inevitable "Belnap conditional": one can ask whether implication should be truth-functional, preserve non-falsity, express relevant entailment, internalize the consequence relation, or support a deduction theorem. Different answers give different implicative expansions. On four values, implication is a space of design choices rather than a one-line table.
- **No source trust.** It records that positive and negative support coexist, not which is better.
- **No belief revision.** It preserves contradiction; it does not decide how or whether to resolve it.
- **No degrees.** The four values are qualitative. Strength of evidence needs additional structure.
- **No provenance.** The value $\mathbf{b}$ does not say where the conflicting reports came from.
- **Not a replacement for classical logic** where classical assumptions are justified. In a cleanly bivalent domain, classical logic is the sharper tool.

The summary lesson: not "use FDE instead of classical logic everywhere", but "when information is incomplete and inconsistent, do not use a logic whose first response is triviality."

## What can be added on top of the four values?

Several research directions enrich the four-valued core. The paper's survey, which should be read as a map of active directions and not as results proved here, includes:

- **Implicative expansions**, including the classification of which implications satisfy Routley-Meyer-style constraints.
- **Multiple consequence relations** over the same square. One may preserve truth ($\mathbf{t},\mathbf{b}$), non-falsity ($\mathbf{t},\mathbf{n}$), or exact truth ($\mathbf{t}$ alone). A diagnostic subsystem, a safety subsystem and a publication subsystem might each want a different one.
- **First-order, free and modal extensions**, motivated by databases that evolve as new individuals and names enter, and by the observation that "knowing that" and "not knowing whether" need finer operators when information is partial and conflicting.
- **Evidential and probabilistic extensions**, such as belief functions over Belnap-Dunn logic and logics that add reliable-information values to the Belnap square. The risk noted is uncontrolled proliferation of values; the proposal is to keep FOUR as the base layer and add typed refinements.
- **Proof theory**: sequent calculi, tableaux and automated reasoning for FDE and its extensions, since a system needs algorithms for checking consequence and isolating contradictions, not only semantics.
- **Computer-science imprints.** Jakl's survey [@jakl2025] identifies Belnap-like structure, via twist-product representations of bilattices, in d-frames, Chu-space models of linear logic, blame calculi and LVars (lattice-based variables for deterministic parallel programming). The recurring shape is paired polarities and monotone accumulation of information.

### A sheaf-like reading

Belnap-Dunn logic is not usually presented in sheaf-theoretic terms, and standard FDE is not claimed to be a sheaf logic. But it invites a local-to-global reading: each proposition is a site where reports arrive, a global information state assigns four-valued statuses across a language, and contradictions are local features of particular propositions rather than global disasters. The conceptual proposal is to replace the four-element fiber with a richer bilattice (provenance-rich, temporal, source-indexed) and define gluing and obstruction without losing the paraconsistent and paracomplete discipline. Developments of that idea are described in [Paraconsistent settling and comprehension](/paraconsistent-settling-and-comprehension/) and [The adjoint structure of predication on bilattice fibers](/adjoint-structure-of-predication-on-bilattice-fibers/).

## Limits and open problems

**Source-indexed semantics.** The four values collapse all positive sources into one bit and all negative sources into one bit. A source-indexed semantics would assign each proposition a pair of source sets $(P_A, N_A)$, with the Belnap value recovered by testing emptiness. How to define consequence, revision and aggregation *before* the collapse is open. In this view Belnap's logic is a quotient of a richer provenance semantics, powerful because it captures the first structural distinction, limited because it loses multiplicity, authority, time and dependency.

**Temporal Belnap logic.** A proposition may be $\mathbf{n}$ at one time, $\mathbf{t}$ later, $\mathbf{b}$ later still, and $\mathbf{t}$ again after a conflict is resolved. Extensions should distinguish monotone accumulation from non-monotone correction.

**The cost of inconsistency.** In a running system a glut has operational cost: storage, explanation, routing, quarantine, reconciliation. A cost model for preserving versus collapsing gluts is proposed but undeveloped.

**Typed consequence policies.** A conclusion valid under truth-preservation may fail under exact-truth preservation. Making the policy part of a task's type would avoid policy confusion; the design of such a discipline is open.

**Bilattice-valued agent architectures.** The hard problem is not assigning four values but designing protocols so contradictions stay localized, explanations stay traceable, and downstream action policies know which kind of uncertainty they face. For one proposed treatment of agents integrating conflicting evidence, see [Paraconsistent transfinite linear agent integration](/paraconsistent-transfinite-linear-agent-integration/).

Scope caution: this page synthesizes established literature with the 561 Group's research framing. The truth tables and the failures of explosion and excluded middle are routine finite checks; frontier statements describe the cited literature; agent architectures are research directions, not verified results.

## Related

- [What is a bilattice? Belnap-Dunn logic in the algebra of two orders](/bilattices-and-belnap-dunn-logic/)
- [Paraconsistent settling and comprehension](/paraconsistent-settling-and-comprehension/)
- [The adjoint structure of predication on bilattice fibers](/adjoint-structure-of-predication-on-bilattice-fibers/)
- [The Nelson identity on four-valued truth](/nelson-identity-on-four-valued-truth/)
- [Paraconsistent transfinite linear agent integration](/paraconsistent-transfinite-linear-agent-integration/)
- [The MAPE-K autonomic computing loop](/mape-k-autonomic-computing-loop/)
- Sibling sites: [561.group](https://561.group/), [engineering.561.group](https://engineering.561.group/), [operations.561.group](https://operations.561.group/), [services.561.group](https://services.561.group/), [market.561.group](https://market.561.group/)
