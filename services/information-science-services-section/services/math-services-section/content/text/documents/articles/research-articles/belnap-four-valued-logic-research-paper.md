---
title: "Belnap Four-Valued Logic: Information, Inconsistency, and the Shape of Useful Reasoning"
subtitle: "A graduate-to-research level genealogy, technical primer, and frontier survey"
description: "A primer and frontier survey of Belnap-Dunn four-valued logic (FDE), which reinterprets truth values as informational statuses — true only, false only, both, neither — so a reasoning system can handle incomplete and inconsistent information without explosion, tracing its development through relevance logic, Dunn semantics, and bilattices into current computer-science frontiers."
date: "2026-07-08"
abstract: |
  Belnap's four-valued logic, usually called Belnap-Dunn logic or the logic of First Degree Entailment (FDE), is one of the cleanest formal answers to a practical problem: how should a reasoning system behave when its information is incomplete, inconsistent, or both? Instead of treating contradiction as a catastrophe and ignorance as an absence outside the logic, Belnap assigns each proposition one of four informational statuses: true only, false only, both true and false, or neither true nor false. This paper explains the basic mathematics of the system, traces its development from many-valued logic, relevance logic, Dunn semantics, Scott approximation orders, and artificial-intelligence bilattices, and surveys current frontiers in proof theory, algebraic logic, modal and first-order extensions, knowledge representation, evidential/probabilistic reasoning, and connections to contemporary computer-science semantics such as d-frames, Chu/linear logic, blame calculi, and LVars.
keywords:
  - Belnap-Dunn logic
  - First Degree Entailment
  - FDE
  - four-valued logic
  - bilattices
  - paraconsistent logic
  - paracomplete logic
  - relevance logic
  - information order
  - logic programming
  - FOUR
  - charge
  - structure
  - closure
  - knowing
  - predication
  - computing
references:
  - id: belnap1975how
    type: chapter
    author:
      - family: Belnap
        given: Nuel D.
        suffix: Jr.
    issued:
      date-parts:
        - [1975]
    title: "How a Computer Should Think"
    container-title: "Contemporary Aspects of Philosophy"
    editor:
      - family: Ryle
        given: Gilbert
    publisher: "Oriel Press"
    publisher-place: "Stockfield"
    page: "30-56"
  - id: belnap1977useful
    type: chapter
    author:
      - family: Belnap
        given: Nuel D.
        suffix: Jr.
    issued:
      date-parts:
        - [1977]
    title: "A Useful Four-Valued Logic"
    container-title: "Modern Uses of Multiple-Valued Logic"
    editor:
      - family: Dunn
        given: J. Michael
      - family: Epstein
        given: George
    publisher: "D. Reidel"
    publisher-place: "Dordrecht"
    page: "5-37"
    DOI: "10.1007/978-94-010-1161-7_2"
  - id: dunn1976intuitive
    type: article-journal
    author:
      - family: Dunn
        given: J. Michael
    issued:
      date-parts:
        - [1976]
    title: "Intuitive Semantics for First-Degree Entailments and 'Coupled Trees'"
    container-title: "Philosophical Studies"
    volume: "29"
    page: "149-168"
    DOI: "10.1007/BF00373152"
  - id: andersonbelnap1975entailment
    type: book
    author:
      - family: Anderson
        given: Alan Ross
      - family: Belnap
        given: Nuel D.
        suffix: Jr.
    issued:
      date-parts:
        - [1975]
    title: "Entailment: The Logic of Relevance and Necessity, Volume I"
    publisher: "Princeton University Press"
    publisher-place: "Princeton"
  - id: routleymeyer1973semantics
    type: chapter
    author:
      - family: Routley
        given: Richard
      - family: Meyer
        given: Robert K.
    issued:
      date-parts:
        - [1973]
    title: "The Semantics of Entailment"
    container-title: "Truth, Syntax and Modality"
    editor:
      - family: Leblanc
        given: Hugues
    publisher: "North-Holland"
    publisher-place: "Amsterdam"
    page: "198-243"
  - id: kleene1952introduction
    type: book
    author:
      - family: Kleene
        given: Stephen Cole
    issued:
      date-parts:
        - [1952]
    title: "Introduction to Metamathematics"
    publisher: "D. Van Nostrand"
    publisher-place: "New York"
  - id: priest1979logic
    type: article-journal
    author:
      - family: Priest
        given: Graham
    issued:
      date-parts:
        - [1979]
    title: "The Logic of Paradox"
    container-title: "Journal of Philosophical Logic"
    volume: "8"
    issue: "1"
    page: "219-241"
    DOI: "10.1007/BF00258428"
  - id: ginsberg1988multivalued
    type: article-journal
    author:
      - family: Ginsberg
        given: Matthew L.
    issued:
      date-parts:
        - [1988]
    title: "Multivalued Logics: A Uniform Approach to Reasoning in Artificial Intelligence"
    container-title: "Computational Intelligence"
    volume: "4"
    issue: "3"
    page: "265-316"
    DOI: "10.1111/j.1467-8640.1988.tb00280.x"
  - id: fitting1991bilattices
    type: article-journal
    author:
      - family: Fitting
        given: Melvin
    issued:
      date-parts:
        - [1991]
    title: "Bilattices and the Semantics of Logic Programming"
    container-title: "Journal of Logic Programming"
    volume: "11"
    issue: "1-2"
    page: "91-116"
    DOI: "10.1016/0743-1066(91)90014-G"
  - id: arieliavron1996reasoning
    type: article-journal
    author:
      - family: Arieli
        given: Ofer
      - family: Avron
        given: Arnon
    issued:
      date-parts:
        - [1996]
    title: "Reasoning with Logical Bilattices"
    container-title: "Journal of Logic, Language and Information"
    volume: "5"
    issue: "1"
    page: "25-63"
    DOI: "10.1007/BF00159338"
  - id: arieliavron1998value
    type: article-journal
    author:
      - family: Arieli
        given: Ofer
      - family: Avron
        given: Arnon
    issued:
      date-parts:
        - [1998]
    title: "The Value of the Four Values"
    container-title: "Artificial Intelligence"
    volume: "102"
    issue: "1"
    page: "97-141"
    DOI: "10.1016/S0004-3702(98)00032-0"
  - id: arielliavron2000bilattices
    type: chapter
    author:
      - family: Arieli
        given: Ofer
      - family: Avron
        given: Arnon
    issued:
      date-parts:
        - [2000]
    title: "Bilattices and Paraconsistency"
    container-title: "Frontiers of Paraconsistent Logic"
    editor:
      - family: Batens
        given: Diderik
      - family: Mortensen
        given: Chris
      - family: Priest
        given: Graham
      - family: Bendegem
        given: Jean Paul
        non-dropping-particle: Van
    collection-title: "Studies in Logic and Computation"
    volume: "8"
    publisher: "Research Studies Press"
    publisher-place: "Baldock"
    page: "11-27"
  - id: bimboDunn2001four
    type: article-journal
    author:
      - family: Bimbó
        given: Katalin
      - family: Dunn
        given: J. Michael
    issued:
      date-parts:
        - [2001]
    title: "Four-Valued Logic"
    container-title: "Notre Dame Journal of Formal Logic"
    volume: "42"
    issue: "3"
    page: "171-192"
    DOI: "10.1305/ndjfl/1038949580"
  - id: omoriwansing2017forty
    type: article-journal
    author:
      - family: Omori
        given: Hitoshi
      - family: Wansing
        given: Heinrich
    issued:
      date-parts:
        - [2017]
    title: "40 Years of FDE: An Introductory Overview"
    container-title: "Studia Logica"
    volume: "105"
    page: "1021-1049"
    DOI: "10.1007/s11225-017-9748-6"
  - id: omoriwansing2019new
    type: book
    editor:
      - family: Omori
        given: Hitoshi
      - family: Wansing
        given: Heinrich
    issued:
      date-parts:
        - [2019]
    title: "New Essays on Belnap-Dunn Logic"
    collection-title: "Synthese Library"
    volume: "418"
    publisher: "Springer"
    publisher-place: "Cham"
    DOI: "10.1007/978-3-030-31136-0"
  - id: rivieccio2012infinity
    type: article-journal
    author:
      - family: Rivieccio
        given: Umberto
    issued:
      date-parts:
        - [2012]
    title: "An Infinity of Super-Belnap Logics"
    container-title: "Journal of Applied Non-Classical Logics"
    volume: "22"
    issue: "4"
    page: "319-335"
    DOI: "10.1080/11663081.2012.751497"
  - id: prenosil2020truth
    type: article-journal
    author:
      - family: Přenosil
        given: Adam
    issued:
      date-parts:
        - [2020]
    title: "Four-Valued Logics of Truth, Nonfalsity, Exact Truth, and Material Equivalence"
    container-title: "Notre Dame Journal of Formal Logic"
    volume: "61"
    issue: "4"
    page: "601-621"
    DOI: "10.1215/00294527-2020-0029"
  - id: prenosil2023lattice
    type: article-journal
    author:
      - family: Přenosil
        given: Adam
    issued:
      date-parts:
        - [2023]
    title: "The Lattice of Super-Belnap Logics"
    container-title: "The Review of Symbolic Logic"
    volume: "16"
    issue: "1"
    page: "114-163"
    DOI: "10.1017/S1755020321000156"
  - id: bilkova2022belief
    type: article
    author:
      - family: Bílková
        given: Marta
      - family: Frittella
        given: Sabine
      - family: Kozhemiachenko
        given: Daniil
      - family: Majer
        given: Ondrej
      - family: Nazari
        given: Sajad
    issued:
      date-parts:
        - [2022]
    title: "Reasoning with Belief Functions over Belnap-Dunn Logic"
    genre: "arXiv preprint"
    number: "arXiv:2203.01060"
    URL: "https://arxiv.org/abs/2203.01060"
  - id: coniglioRodrigues2022six
    type: article
    author:
      - family: Coniglio
        given: Marcelo E.
      - family: Rodrigues
        given: Abilio
    issued:
      date-parts:
        - [2022]
    title: "On Six-Valued Logics of Evidence and Truth Expanding Belnap-Dunn Four-Valued Logic"
    genre: "arXiv preprint"
    number: "arXiv:2209.12337"
    URL: "https://arxiv.org/abs/2209.12337"
  - id: kozhemiachenkoVashentseva2023knowledge
    type: article
    author:
      - family: Kozhemiachenko
        given: Daniil
      - family: Vashentseva
        given: Liubov
    issued:
      date-parts:
        - [2023]
    title: "Knowledge and Ignorance in Belnap-Dunn Logic"
    genre: "arXiv preprint"
    number: "arXiv:2309.01449"
    URL: "https://arxiv.org/abs/2309.01449"
  - id: roblesMendez2024lattice
    type: article-journal
    author:
      - family: Robles
        given: Gemma
      - family: Méndez
        given: José M.
    issued:
      date-parts:
        - [2024]
    title: "The Lattice of All 4-Valued Implicative Expansions of Belnap-Dunn Logic Containing Routley and Meyer’s Basic Logic Bᵈ"
    container-title: "Logic Journal of the IGPL"
    volume: "32"
    issue: "3"
    page: "493-516"
    DOI: "10.1093/jigpal/jzad005"
  - id: antunesRodrigues2025free
    type: article-journal
    author:
      - family: Antunes
        given: Henrique
      - family: Rodrigues
        given: Abilio
    issued:
      date-parts:
        - [2025]
    title: "On Universally Free First-Order Extensions of Belnap-Dunn’s Four-Valued Logic and Nelson’s Paraconsistent Logic N4"
    container-title: "Journal of Philosophical Logic"
    volume: "54"
    page: "169-195"
    DOI: "10.1007/s10992-025-09783-w"
  - id: jakl2026imprints
    type: article-journal
    author:
      - family: Jakl
        given: Tomáš
    issued:
      date-parts:
        - [2026]
    title: "Four Imprints of Belnap’s Useful Four-Valued Logic in Computer Science"
    container-title: "Studia Logica"
    DOI: "10.1007/s11225-026-10230-3"
type: research-article

---

# Belnap Four-Valued Logic

Belnap four-valued logic is a small formal machine for a large and ordinary disaster: information arrives from more than one place, not all of it is reliable, not all of it is complete, and yet the system still has to reason.

Classical logic is excellent when the database is clean. It has exactly two truth values, true and false, and it validates the explosive pattern

\[
A, \neg A \vdash B.
\]

This is not a mistake inside classical logic. In classical logic, once a theory contains both a sentence and its negation, there is no classical valuation in which all premises are true, so every conclusion is vacuously preserved. But for an information-processing system, vacuity is not useful. A medical chart can say that a patient is allergic to penicillin and also that they are not. A legal database can contain a revoked rule and a still-indexed copy of the old rule. A distributed system can receive two contradictory messages. A search index can have no entry for a proposition at all. In all such cases, the system must not infer that the moon is made of cheese simply because one record conflicts with another.

Nuel Belnap’s answer, first in “How a Computer Should Think” in 1975 and then in “A Useful Four-Valued Logic” in 1977, was not merely to add two more “truth values.” It was to reinterpret truth values as *informational statuses*. A proposition may be supported as true, supported as false, supported both ways, or not supported either way. The resulting logic is now usually called **Belnap-Dunn logic**, **Dunn-Belnap logic**, or **FDE**, the logic of **First Degree Entailment**.

The system is small enough to write on one page. Its conceptual importance is that it separates two questions that classical logic fuses:

1. Is the proposition supported as true?
2. Is the proposition supported as false?

Once those questions are independent, the four values are forced. Each proposition carries two bits of information: a positive bit and a negative bit. The four possible states are:

| value | set notation | bit notation | reading |
|---|---:|---:|---|
| \(\mathbf{n}\) | \(\varnothing\) | \((0,0)\) | neither true nor false; no information either way |
| \(\mathbf{t}\) | \(\{T\}\) | \((1,0)\) | true only; positive support without negative support |
| \(\mathbf{f}\) | \(\{F\}\) | \((0,1)\) | false only; negative support without positive support |
| \(\mathbf{b}\) | \(\{T,F\}\) | \((1,1)\) | both true and false; conflicting support |

The set notation is not decoration. It gives the most compact meaning of the system. A value is a subset of \(\{T,F\}\), saying which of the two classical polarities are present in the information state. The value \(\mathbf{b}\) is not “half true” and not “very true.” It is the state in which positive and negative information are both present. The value \(\mathbf{n}\) is not “unknown but secretly one of the two.” It is the state in which neither positive nor negative information is present in the system.

This is why Belnap logic is often more exact when described as a logic of **information** rather than as a logic of metaphysical truth. It does not require the world itself to contain true contradictions. It can be used by a dialetheist, but it does not require dialetheism. It says: even if the world is classical, our information about the world can be incomplete and inconsistent; a reasoning system needs a non-explosive calculus for that condition.

# The basic formal system

## The two orders

The four values carry two different partial orders. This is the entire secret of the system.

The first order is the **truth order**, written here as \(\leq_t\). It orders values by how true they are, with \(\mathbf{f}\) at the bottom and \(\mathbf{t}\) at the top:

\[
\mathbf{f} \leq_t \mathbf{n} \leq_t \mathbf{t},
\qquad
\mathbf{f} \leq_t \mathbf{b} \leq_t \mathbf{t},
\]

while \(\mathbf{n}\) and \(\mathbf{b}\) are incomparable in the truth order.

The Hasse picture is:

\[
\begin{array}{c}
\mathbf{t}\\
/ \ \backslash\\
\mathbf{n}\quad \mathbf{b}\\
\backslash \ /\\
\mathbf{f}
\end{array}
\]

Conjunction and disjunction are meet and join in this truth order:

\[
A\wedge B = \inf_{\leq_t}(A,B),
\qquad
A\vee B = \sup_{\leq_t}(A,B).
\]

The second order is the **information order**, often called the **knowledge order**, written \(\leq_k\). This order tracks how much information is present, regardless of whether that information is harmonious or conflicting:

\[
\mathbf{n} \leq_k \mathbf{t} \leq_k \mathbf{b},
\qquad
\mathbf{n} \leq_k \mathbf{f} \leq_k \mathbf{b},
\]

with \(\mathbf{t}\) and \(\mathbf{f}\) incomparable. Its Hasse picture is:

\[
\begin{array}{c}
\mathbf{b}\\
/ \ \backslash\\
\mathbf{t}\quad \mathbf{f}\\
\backslash \ /\\
\mathbf{n}
\end{array}
\]

In the set representation, this is just subset inclusion:

\[
\varnothing \subseteq \{T\}, \{F\} \subseteq \{T,F\}.
\]

The truth order says that \(\mathbf{t}\) is better than \(\mathbf{f}\) as truth. The information order says that \(\mathbf{b}\) contains more information than \(\mathbf{t}\) or \(\mathbf{f}\), because it contains both positive and negative reports. In this sense contradiction is not an absence of information. It is a surplus of incompatible information.

This distinction is the main conceptual upgrade. Classical logic has one dimension: truth. Belnap logic has at least two: truth-orientation and information-content.

## Negation

Negation swaps true-only and false-only, while leaving both and neither fixed:

\[
\neg\mathbf{t}=\mathbf{f},
\qquad
\neg\mathbf{f}=\mathbf{t},
\qquad
\neg\mathbf{b}=\mathbf{b},
\qquad
\neg\mathbf{n}=\mathbf{n}.
\]

This is the De Morgan negation. If a proposition has both positive and negative support, so does its negation. If a proposition has no support either way, neither does its negation. In bit notation, negation simply swaps the positive and negative coordinates:

\[
\neg(p^+,p^-)=(p^-,p^+).
\]

Negation reverses the truth order but preserves the information order. That is exactly what it should do. Swapping truth and falsity reverses truth orientation, but it does not add or remove information.

## Conjunction and disjunction

Using the order \(\mathbf{f} <_t \mathbf{n},\mathbf{b} <_t \mathbf{t}\), conjunction is meet and disjunction is join. The tables are:

\[
\begin{array}{c|cccc}
\wedge & \mathbf{f} & \mathbf{n} & \mathbf{b} & \mathbf{t} \\
\hline
\mathbf{f} & \mathbf{f} & \mathbf{f} & \mathbf{f} & \mathbf{f} \\
\mathbf{n} & \mathbf{f} & \mathbf{n} & \mathbf{f} & \mathbf{n} \\
\mathbf{b} & \mathbf{f} & \mathbf{f} & \mathbf{b} & \mathbf{b} \\
\mathbf{t} & \mathbf{f} & \mathbf{n} & \mathbf{b} & \mathbf{t}
\end{array}
\qquad
\begin{array}{c|cccc}
\vee & \mathbf{f} & \mathbf{n} & \mathbf{b} & \mathbf{t} \\
\hline
\mathbf{f} & \mathbf{f} & \mathbf{n} & \mathbf{b} & \mathbf{t} \\
\mathbf{n} & \mathbf{n} & \mathbf{n} & \mathbf{t} & \mathbf{t} \\
\mathbf{b} & \mathbf{b} & \mathbf{t} & \mathbf{b} & \mathbf{t} \\
\mathbf{t} & \mathbf{t} & \mathbf{t} & \mathbf{t} & \mathbf{t}
\end{array}
\]

The two striking entries are:

\[
\mathbf{n}\wedge \mathbf{b}=\mathbf{f},
\qquad
\mathbf{n}\vee \mathbf{b}=\mathbf{t}.
\]

These are not arbitrary. They follow from the truth lattice. The meet of the two incomparable middle values \(\mathbf{n}\) and \(\mathbf{b}\) is \(\mathbf{f}\); their join is \(\mathbf{t}\). This is often the point at which a newcomer sees that the truth order and the information order must not be confused. In the information order, \(\mathbf{n}\) and \(\mathbf{b}\) are bottom and top. In the truth order, they are incomparable middle values.

## Consequence

The usual FDE consequence relation is **designated-value preservation**. The designated values are those that include positive truth support:

\[
D=\{\mathbf{t},\mathbf{b}\}.
\]

A sequent \(\Gamma\vdash_{FDE} A\) is valid when every valuation that assigns a designated value to every member of \(\Gamma\) also assigns a designated value to \(A\).

This is the precise point where paraconsistency appears. Suppose \(p=\mathbf{b}\). Then both \(p\) and \(\neg p\) are designated. But if \(q=\mathbf{f}\), then \(q\) is not designated. So there is a valuation in which \(p\) and \(\neg p\) are both acceptable premises while \(q\) is not an acceptable conclusion. Therefore:

\[
p,\neg p\nvdash_{FDE} q.
\]

Explosion fails.

The same system is also **paracomplete**. Excluded middle fails because if \(p=\mathbf{n}\), then \(\neg p=\mathbf{n}\), and

\[
p\vee\neg p=\mathbf{n}\vee\mathbf{n}=\mathbf{n},
\]

which is not designated. So:

\[
\nvdash_{FDE} p\vee\neg p.
\]

FDE is therefore both paraconsistent and paracomplete: contradictions do not imply everything, and gaps do not automatically close themselves.

## What “first degree” means

FDE is historically tied to relevance logic. The “first-degree” fragment concerns entailments between formulas built from variables using conjunction, disjunction, and negation, without arbitrary nested implication as a primitive connective of the object language. This is why implication is delicate in Belnap-Dunn logic. The base system gives a consequence relation, not a unique internal material conditional. Many later systems add a conditional, but there is no single inevitable Belnap conditional that plays the role of classical \(A\rightarrow B\).

This is not a weakness. It is a structural honesty. In classical logic, material implication is already a compromised connective if one wants relevance. In Belnap-Dunn logic, where truth and falsity are independently tracked, implication becomes even less canonical. Should \(A\to B\) preserve truth? preserve non-falsity? express relevant entailment? internalize the meta-consequence relation? behave classically on the classical subalgebra? interact well with Routley-Meyer semantics? Different answers lead to different implicative expansions, and this remains an potential research frontier.

# Why this is not just “four truth values”

A common shallow description says: classical logic has two values, Belnap logic has four. That is true but misses the point. The four values are not arranged in a line:

\[
0 < \frac{1}{3} < \frac{2}{3} < 1.
\]

They form two crossed lattices. The structure is not a scale of degree. It is a square of polarity and evidence. The value \(\mathbf{b}\) is not “more true” than \(\mathbf{t}\). In the information order it contains more information, but in the truth order \(\mathbf{t}\) is above it. The value \(\mathbf{n}\) is not “less true” than \(\mathbf{f}\). It lacks negative support, so in the truth order it is above \(\mathbf{f}\), but in the information order it is below both \(\mathbf{t}\) and \(\mathbf{f}\).

This square structure is why Belnap’s logic is better thought of as a **logic of distributed evidence states**. Each proposition is a site where positive and negative evidence may arrive independently. The system tracks the result without forcing premature reconciliation.

This also distinguishes Belnap-Dunn logic from standard three-valued logics.

Stephen Kleene’s strong three-valued logic has a value for “undefined” or “unknown,” but it does not also have a value for “both.” Graham Priest’s Logic of Paradox has a value for “both,” but not a separate value for “neither” in the same way. Belnap-Dunn logic has both gaps and gluts at once. That is why it is often called **paradefinite**: it is simultaneously paraconsistent and paracomplete.

# The genealogy

## 1. Before Belnap: bivalence under pressure

The deepest ancestor is the collapse of the idea that every logical problem is naturally bivalent. Aristotle already treated future contingents as troubling for strict bivalence. In the early twentieth century, Jan Łukasiewicz introduced a three-valued logic partly motivated by future contingents; Emil Post generalized finite many-valued systems; and later work by Stephen Kleene connected partiality and undefinedness to formal semantics and computability.

Those systems matter because they made it mathematically respectable to replace the two-element Boolean algebra with a larger algebra of semantic values. But Belnap’s move is not merely “use four instead of two.” It is more specific: use two independent yes/no dimensions, positive and negative information.

This makes Belnap’s system closer to a powerset construction than to a many-valued scale. The four values are the four subsets of \(\{T,F\}\). The construction is almost embarrassingly simple once seen, but it changes what a truth value is allowed to mean.

## 2. Relevance logic and the rejection of irrelevant implication

The second ancestor is relevance logic, especially the work of Alan Ross Anderson and Nuel Belnap in *Entailment: The Logic of Relevance and Necessity* in 1975. Relevance logic rejects the classical habit of validating implications merely because the antecedent is impossible or the consequent is necessary. Classical logic validates patterns such as:

\[
A\wedge\neg A \to B,
\]

and

\[
A \to (B\vee\neg B).
\]

Relevance logicians regarded these as failures of implication understood as entailment. If \(A\) really entails \(B\), then \(A\) should be relevant to \(B\). This relevance-theoretic background is crucial because FDE is not just a paraconsistent logic invented for databases. It is also the first-degree fragment of a relevance-logical project.

Richard Routley and Robert Meyer’s relational semantics for entailment, Bas van Fraassen’s work on facts and tautological entailments, and J. Michael Dunn’s own semantics for first-degree entailments all helped create the setting in which Belnap’s four-valued matrix became natural rather than exotic.

## 3. Dunn’s semantics: the immediate mathematical ancestor

J. Michael Dunn’s 1976 “Intuitive Semantics for First-Degree Entailments and ‘Coupled Trees’” is the immediate ancestor of the Dunn-Belnap system. Dunn’s interpretation allows a formula to be supported positively, supported negatively, both, or neither. In modern notation, this is often described through two relations or two assignments: one for truth and one for falsity.

This is the key semantic decomposition:

\[
\text{value}(A) = (A^+, A^-),
\]

where \(A^+\) records whether \(A\) is supported as true and \(A^-\) records whether \(A\) is supported as false.

The connectives then receive bilateral clauses. For example, in a Dunn-style semantics:

- \(A\wedge B\) is true when both \(A\) and \(B\) are true.
- \(A\wedge B\) is false when at least one of \(A\) or \(B\) is false.
- \(A\vee B\) is true when at least one of \(A\) or \(B\) is true.
- \(A\vee B\) is false when both \(A\) and \(B\) are false.
- \(\neg A\) is true when \(A\) is false.
- \(\neg A\) is false when \(A\) is true.

Those clauses are classical-looking, but because truth and falsity are no longer exclusive or exhaustive, they generate the four-valued behavior. Classical logic is recovered only by imposing the extra constraints that every proposition has exactly one of the two polarities.

Dunn’s contribution is therefore not merely historical. It reveals that the four-valued matrix can be understood as a bilateral semantics: truth and falsity are two independent forms of evaluation.

## 4. Belnap’s computer: reasoning under database corruption

Belnap’s 1977 paper gives the logic its most famous pragmatic frame. He imagines a sophisticated question-answering machine that reasons from a database. The database can contain inconsistent entries because it is populated by fallible processes, multiple sources, or imperfect updates. The machine should not collapse into triviality whenever a minor inconsistency appears.

This motivation is very different from the usual philosophical motivation for many-valued logic. Belnap is not first asking whether reality contains contradictions or whether future contingents lack truth values. He is asking what a reasoning machine should do when its **data** are inconsistent or incomplete.

The question is still contemporary. Modern systems routinely reason over distributed data, scraped data, sensor networks, human annotations, knowledge graphs, legal corpora, medical records, and model-generated text. In such environments, inconsistency is not an exceptional philosophical puzzle. It is the default physical condition of information.

Belnap also draws on Dana Scott’s ideas about approximation lattices. This matters because it gives the information order a computational interpretation. A state with no information can be refined into true-only or false-only; further information can produce the inconsistent state both. Computation is then not merely truth-evaluation but movement through an order of approximation.

## 5. Bilattices: Ginsberg and Fitting

The next major development is the theory of **bilattices**. Matthew Ginsberg’s 1988 work on multivalued logics for artificial intelligence and Melvin Fitting’s 1991 work on bilattices and logic programming generalized Belnap’s four-element structure into a broad algebraic framework.

A bilattice is a set equipped with two lattice orders:

- a truth order, supporting truth-oriented conjunction and disjunction;
- a knowledge order, supporting information-oriented combination and comparison.

Belnap’s four-valued structure, often called **FOUR**, is the smallest nontrivial example. But once the bilattice pattern is abstracted, one can build richer systems: finite bilattices, product bilattices, bilattices with confidence degrees, probabilistic bilattices, default bilattices, and other structures that track truth and information simultaneously.

Fitting’s key insight was that bilattices provide a semantics for logic programming. Logic programs often require fixed points. In classical two-valued logic programming, the least fixed point construction already matters. In three-valued Kripke-Kleene semantics, undefinedness enters the picture. Bilattices allow fixed point semantics where missing and conflicting information are both first-class.

This is one reason Belnap’s logic migrated from philosophical logic into computer science. It supplies an algebraic grammar for partial, inconsistent, and distributed computation.

## 6. Arieli and Avron: the four values as a basis

Ofer Arieli and Arnon Avron’s work in the 1990s clarified the logical role of the four-valued bilattice. In “Reasoning with Logical Bilattices” and “The Value of the Four Values,” they argued that the four-valued structure plays for bilattice-valued reasoning a role analogous to the two-valued Boolean algebra in classical logic.

This is a strong claim. It says that FOUR is not merely one cute finite example. It is a fundamental test object. Many bilattice-valued logics can be characterized through four-valued inference relations. The four-element structure is therefore a kind of algebraic kernel for reasoning with incomplete and inconsistent information.

This matters for research strategy. If a proposed information logic cannot be understood on FOUR, it may be adding complexity before understanding the primitive case. Conversely, if a phenomenon already appears in FOUR, then it is probably structural, not an artifact of a large-valued semantics.

## 7. The FDE family and the algebraic turn

By the 2000s and 2010s, Belnap-Dunn logic had become a central object of non-classical logic. Katalin Bimbó and J. Michael Dunn’s “Four-Valued Logic” gave a compact treatment. Hitoshi Omori and Heinrich Wansing’s “40 Years of FDE” and the edited volume *New Essays on Belnap-Dunn Logic* organized the field around a family of related systems.

The algebraic counterpart of FDE is closely related to De Morgan lattices. This algebraic viewpoint allows researchers to classify extensions, compare consequence relations, prove completeness theorems, study functional completeness, investigate clones of operations, and map large lattices of logics above or around FDE.

The phrase **super-Belnap logics** names a broad family of extensions of Belnap-Dunn logic, analogously to the way superintuitionistic logics extend intuitionistic logic. Work by Umberto Rivieccio and Adam Přenosil shows that this landscape is not a small list of variants but a large algebraic geography.

# The conceptual core

## Belnap logic as controlled non-collapse

The central technical achievement of FDE is not that it tolerates contradiction in an informal way. It gives exact conditions under which contradiction is tolerated.

Let \(p=\mathbf{b}\). Then \(p\) is designated and \(\neg p\) is designated. But \(q\) can be \(\mathbf{f}\) or \(\mathbf{n}\). So \(p,\neg p\nvdash q\). The contradictory site does not infect all sites.

But FDE is not anarchic. Many classically valid patterns remain valid. For example:

\[
A\wedge B\vdash A,
\qquad
A\wedge B\vdash B,
\qquad
A\vdash A\vee B,
\qquad
B\vdash A\vee B.
\]

Double negation also behaves well:

\[
\neg\neg A \equiv A.
\]

The De Morgan laws hold:

\[
\neg(A\wedge B)\equiv \neg A\vee\neg B,
\qquad
\neg(A\vee B)\equiv \neg A\wedge\neg B.
\]

What fails are precisely patterns that depend on exhaustiveness, exclusivity, or irrelevant explosion. FDE therefore does not abandon logic. It removes specific structural assumptions: every sentence must be either true or false, no sentence can be both, and contradiction entails everything.

## Paraconsistency and paracompleteness together

A paraconsistent logic rejects explosion. A paracomplete logic rejects the unrestricted validity of excluded middle. Many systems do one or the other. Belnap-Dunn logic does both.

This paired behavior matters because inconsistent information and incomplete information are dual problems. A database can contain two incompatible records; a database can also contain no record. A theory of information should not privilege one failure mode over the other.

FDE’s four values can be read as the closure of this pair of failure modes:

- classical success as true-only;
- classical success as false-only;
- overdetermination as both;
- underdetermination as neither.

The logic does not force overdetermination to become triviality, and it does not force underdetermination to become bivalent ignorance.

## Bilateralism: assertion and denial

Another way to read Belnap-Dunn logic is through bilateralism. Classical logic often treats denial as assertion of negation. Belnap-Dunn semantics lets assertion and denial be independent statuses.

A proposition may be asserted, denied, both asserted and denied, or neither asserted nor denied. Negation swaps assertion and denial, but it does not require that exactly one of them hold. This makes FDE naturally suited to systems where positive and negative evidence are collected by different mechanisms.

For example, in a content moderation system, one classifier might support “harmful” and another might support “not harmful.” In a legal database, one authority may assert a rule and another may defeat it. In a sensor system, one sensor may indicate presence and another absence. FDE supplies the primitive algebra for representing that independent polarity.

## FDE and provenance

The basic four-valued system forgets source identity. It records only whether some positive source and/or some negative source exists. This makes it elegant but also limited. In real systems, one often needs provenance: which source said true, which source said false, with what authority, at what time, under what context?

Belnap’s logic can be seen as the quotient of a richer provenance semantics. Start with a set of positive witnesses and a set of negative witnesses for each proposition. Collapse each set to a bit recording whether it is empty or nonempty. The resulting pair of bits is the Belnap value.

This perspective is useful because it shows both the power and the boundary of the four-valued abstraction. It is powerful because it captures the first structural distinction: positive evidence and negative evidence are independent. It is limited because it loses multiplicity, authority, temporal order, and dependency structure. Much current and future work can be understood as enriching the Belnap square without losing its discipline.

# The truth tables as information operations

The set-of-polarities representation gives a compact derivation of the connectives.

Let a value \(x\subseteq\{T,F\}\). Define:

\[
T\in \neg x \quad\text{iff}\quad F\in x,
\]

\[
F\in \neg x \quad\text{iff}\quad T\in x.
\]

For conjunction:

\[
T\in (x\wedge y) \quad\text{iff}\quad T\in x \text{ and } T\in y,
\]

\[
F\in (x\wedge y) \quad\text{iff}\quad F\in x \text{ or } F\in y.
\]

For disjunction:

\[
T\in (x\vee y) \quad\text{iff}\quad T\in x \text{ or } T\in y,
\]

\[
F\in (x\vee y) \quad\text{iff}\quad F\in x \text{ and } F\in y.
\]

These clauses are just the classical truth and falsity conditions for conjunction, disjunction, and negation, applied independently. The nonclassical behavior arises because the two clauses are not constrained to be exclusive or exhaustive.

This is the simplest way to teach the system. Do not memorize the four-valued truth tables. Memorize the independent positive and negative clauses. The tables follow.

# The status of implication

The absence of a single canonical implication is one of the most important facts about Belnap-Dunn logic.

In classical logic, material implication is definable as:

\[
A\to B := \neg A\vee B.
\]

In FDE, this definition does not internalize the consequence relation in the classical way. Because negation and disjunction behave differently under gaps and gluts, the classical material conditional inherits strange features. Other implication candidates are possible, especially if one wants relevance-theoretic behavior.

This produces a family of research questions:

- Should implication be truth-functional?
- Should it be C-extending, meaning it agrees with classical implication on the classical values?
- Should it validate Routley-Meyer basic logic \(B\)?
- Should it preserve paraconsistency and paracompleteness?
- Should Boolean negation become definable in the expanded language?
- Should implication internalize the semantic consequence relation?
- Should it support a deduction theorem or some weakened/substructural analogue?

Robles and Méndez’s recent work on the lattice of 4-valued implicative expansions shows how technical and nontrivial this problem remains. They classify C-extending implicative expansions of FDE satisfying Routley-Meyer constraints and show that several distinct matrices collapse into fewer logics under functional equivalence. This is a frontier because implication is where the minimal elegance of FDE meets the expressive needs of richer reasoning.

# Algebraic anatomy: FOUR as a bilattice

The Belnap bilattice FOUR can be represented as \(\mathcal{P}(\{T,F\})\), the powerset of the two polarities. But the bilattice structure is richer than the set alone.

It has:

- truth meet \(\wedge\);
- truth join \(\vee\);
- knowledge meet \(\otimes\), often read as consensus;
- knowledge join \(\oplus\), often read as information combination;
- De Morgan negation \(\neg\), reversing truth order and preserving knowledge order.

In set terms:

\[
x\otimes y = x\cap y,
\qquad
x\oplus y = x\cup y.
\]

Thus:

\[
\mathbf{t}\oplus\mathbf{f}=\mathbf{b},
\qquad
\mathbf{t}\otimes\mathbf{f}=\mathbf{n}.
\]

Information combination of true-only and false-only yields both. Consensus between true-only and false-only yields neither. Those two operations are different because “pool everything we have” and “keep only what the sources agree on” are different policies.

This distinction is central for applications. A data-fusion system may want union-like accumulation when ingesting evidence, but intersection-like consensus when publishing a conservative answer. A belief revision system may want to preserve conflict internally while exposing only stable consensus externally. FOUR gives the minimal algebra in which those policies can be separated.

# Worked example: a tiny inconsistent database

Suppose a database contains:

- Source 1: “The server is reachable.”
- Source 2: “The server is not reachable.”
- No source says anything about whether the backup is current.

Let \(r\) mean “the server is reachable” and \(c\) mean “the backup is current.” Then:

\[
r=\mathbf{b},
\qquad
c=\mathbf{n}.
\]

Now evaluate:

\[
r\wedge c = \mathbf{b}\wedge\mathbf{n}=\mathbf{f}.
\]

The conjunction “the server is reachable and the backup is current” is false-supported because the first conjunct has negative support and the second lacks positive support. In the truth lattice, the meet of both and neither is false-only.

Evaluate:

\[
r\vee c = \mathbf{b}\vee\mathbf{n}=\mathbf{t}.
\]

The disjunction “the server is reachable or the backup is current” is true-supported because \(r\) has positive support. It is not false-supported because \(c\) lacks negative support. Again, this follows from the bilateral clauses.

Most importantly, from \(r\) and \(\neg r\), the system does not infer \(c\). The contradiction about reachability remains local.

This locality is why FDE is useful. It lets a system continue to reason in the presence of broken informational regions.

# Relationship to neighboring logics

## Classical logic

Classical logic is recovered by restricting valuations to \(\mathbf{t}\) and \(\mathbf{f}\). On that substructure, conjunction, disjunction, and negation behave classically. The nonclassical values \(\mathbf{b}\) and \(\mathbf{n}\) are precisely the values that violate classical exclusivity and exhaustiveness.

So FDE is not anti-classical. It contains the classical matrix as a disciplined special case.

## Kleene’s K3

Kleene’s strong three-valued logic has true, false, and neither/undefined. It handles gaps but not gluts. It is paracomplete but not paraconsistent in the same way FDE is. If one removes \(\mathbf{b}\) from FDE, one gets a structure related to Kleene-style partiality.

## Priest’s LP

Graham Priest’s Logic of Paradox has true, false, and both. It handles gluts but not gaps in the same way. If one removes \(\mathbf{n}\), one gets a structure related to LP. LP is paraconsistent but not paracomplete in the same symmetrical sense.

## FDE as the four-valued completion

Belnap-Dunn logic can be seen as the square that contains both K3-like gaps and LP-like gluts. It is the bilateral completion of the two independent deviations from bivalence:

- truth and falsity may fail to be exhaustive;
- truth and falsity may fail to be exclusive.

This makes FDE a natural hub in the landscape of three-valued and four-valued logics.

# Current frontiers

## 1. Implicative expansions and the search for conditionals

The most technically potential core frontier is the classification of expansions of FDE by new connectives, especially implication. Because base FDE has only \(\wedge,\vee,\neg\), it is expressively limited. Adding implication opens the system toward relevant logic, proof theory, and internalized consequence, but there are many possible conditionals.

Recent work such as Robles and Méndez’s lattice of 4-valued implicative expansions asks how many reasonable implication functions satisfy specified constraints, which logics they determine, how they relate by functional inclusion, and whether classical negation becomes definable. The striking point is that even on four values, implication is not a solved one-line table. It is a space of design choices.

For research, this frontier matters because implication is where FDE stops being merely a semantic diagnostic tool and becomes a full reasoning language. Applications to specification, law, policy, agency, and computation require conditional structure. But importing classical implication blindly destroys the very distinctions FDE was built to preserve.

## 2. Super-Belnap logics and algebraic geography

Another frontier is the lattice of extensions of FDE. Adam Přenosil’s work on super-Belnap logics shows that the space above FDE has rich structure, including surprising connections to graph theory through antiaxiomatic or explosive extensions.

This is analogous to the study of superintuitionistic logics above intuitionistic logic. Once one treats FDE as a base, one can ask: what happens when we add axioms? Which extensions are algebraizable? Which have cut elimination, interpolation, or decidability? Which correspond to varieties or quasivarieties of De Morgan algebras?

The lesson is that FDE is not one isolated non-classical curiosity. It is a base camp for a large mathematical terrain.

## 3. Exact truth, non-falsity, and multiple consequence relations

The usual FDE consequence relation preserves designated values \(\{\mathbf{t},\mathbf{b}\}\), i.e. truth-inclusion. But the four-valued semantics supports other natural preservation notions.

One may preserve:

- truth: designated \(\mathbf{t},\mathbf{b}\);
- non-falsity: values without negative support, \(\mathbf{t},\mathbf{n}\);
- exact truth: true-only, \(\mathbf{t}\);
- material equivalence: equality of four-valued semantic status.

Přenosil’s work on four-valued logics of truth, nonfalsity, exact truth, and material equivalence studies combinations of these consequence relations. This is conceptually important because a real reasoning system may need different consequence policies for different tasks. A diagnostic subsystem may preserve truth-support; a safety subsystem may preserve non-falsity; a publication subsystem may demand exact truth.

FDE therefore suggests not one consequence relation but a menu of consequence relations over the same informational square.

## 4. First-order, modal, and dynamic information states

Propositional FDE is only the beginning. Real databases contain objects, quantifiers, identity, modal operators, and changing domains. Recent work by Henrique Antunes and Abilio Rodrigues develops universally free first-order extensions of Belnap-Dunn logic and Nelson’s paraconsistent logic N4. Their motivation is explicitly informational: databases can be inconsistent and incomplete, and they can evolve over time as new individuals and names enter the system.

Free logic matters here because a database may contain empty names or may initially acknowledge no individuals in a domain. Standard first-order logic assumes too much existential stability. A dynamic information system needs to reason before all its objects are settled.

Modal expansions form another frontier. Work on knowledge and ignorance in Belnap-Dunn logic argues that ordinary modal necessity does not straightforwardly capture knowledge in a four-valued setting. If knowledge is modeled over incomplete and inconsistent information, “knowing that,” “not knowing whether,” “unknown truth,” and “factive ignorance” require more refined operators.

This is exactly where FDE becomes relevant to epistemic logic, agency, and distributed systems. A multi-agent system does not merely have true or false beliefs. It has conflicting evidence, absent evidence, evidence about evidence, and ignorance about ignorance.

## 5. Evidential and probabilistic extensions

Belnap’s four values are qualitative. They say whether positive and negative support are present, but not how strong the support is. Yet real information systems often need degrees of evidence.

Recent work on belief functions over Belnap-Dunn logic extends the framework toward inconsistent and incomplete probabilistic information. The problem is subtle: one cannot simply put a probability distribution over classical worlds if the underlying logic permits gaps and gluts. Evidence may support truth and falsity independently.

Six-valued logics of evidence and truth expand the Belnap square by adding values for reliable positive and reliable negative information. This suggests a broader research program: retain the four-valued core as the minimal polarity/evidence square, then refine it with reliability, probability, source authority, time, or modality.

The danger is uncontrolled proliferation of values. The opportunity is a disciplined hierarchy: FOUR as the base layer, enriched structures as typed refinements.

## 6. Proof theory and automated reasoning

For a logic to be computationally useful, semantic elegance is not enough. One needs proof systems: sequent calculi, tableaux, natural deduction, resolution methods, display calculi, and automated proof search.

FDE has been studied through many proof-theoretic presentations. Current work continues to refine calculi for the FDE family and its extensions. The research questions include cut elimination, interpolation, decidability, complexity, correspondence between semantic and syntactic systems, and efficient proof search.

This frontier is practically important. A database or agent system cannot use FDE only as a philosophical slogan. It needs algorithms for checking consequence, explaining derivations, isolating contradictions, and deciding which inferences survive under which consequence policy.

## 7. Computer-science imprints: d-frames, Chu/linear logic, blame, and LVars

Tomáš Jakl’s recent survey “Four Imprints of Belnap’s Useful Four-Valued Logic in Computer Science” identifies a striking frontier: Belnap-like structures appear, sometimes implicitly, in several areas of theoretical computer science. The connections run through twist-product representations of bilattices and reach d-frames, models of linear logic via Chu constructions, blame calculus, and LVars.

This is important because it suggests that Belnap’s square is not merely a logic for inconsistent databases. It is a recurring shape in computation wherever systems must track paired polarities, resource-sensitive structure, or monotone accumulation of information.

LVars, for example, are lattice-based variables for deterministic parallel programming. They grow monotonically through a lattice of information. While LVars are not simply “Belnap logic,” the resonance is clear: computation is organized as monotone movement through structured information states. Belnap’s knowledge order is one minimal version of that pattern.

The Chu/linear-logic connection is especially suggestive for researchers interested in duality, polarity, and interaction. The twist-product view makes the four-valued square appear as a generic construction from paired positive and negative components. This connects Belnap-Dunn logic to a much broader mathematics of dual systems.

## 8. Knowledge graphs, AI systems, and source-aware reasoning

Belnap’s original motivation now looks prophetic. Contemporary AI systems ingest contradictory web text, partial databases, noisy annotations, and generated outputs. Knowledge graphs often contain inconsistent triples. Retrieval systems surface mutually incompatible sources. LLM-based agents may need to act on information that is neither clean nor complete.

FDE gives a minimal formal layer for such systems, but by itself it is not enough. A modern source-aware system needs:

- proposition identity;
- source identity;
- time stamps;
- confidence or authority;
- dependency structure;
- revision policies;
- task-specific consequence relations;
- explanation of which contradictions matter.

Belnap logic supplies the first square: positive support and negative support. A mature system needs to fiber that square over sources, times, contexts, and tasks. The core idea survives: do not erase contradiction; do not hallucinate completeness; reason locally with explicit information states.

# A sheaf-like reading of FDE

Although Belnap-Dunn logic is not usually introduced in sheaf-theoretic terms, it invites a local-to-global reading.

Imagine each proposition as a site where reports arrive. Locally, a source may assign true, false, both, or neither. A global information state assigns such values across a language. Contradictions are not global disasters; they are local features of particular propositions or regions of a theory. The question becomes: which inferences can be glued across the information space without requiring every local patch to be classical?

In this reading, FDE is a minimal algebra of local informational obstruction. Classical logic demands global consistency and completeness as a precondition of ordinary inference. FDE allows reasoning over a space whose local patches may have holes and overlaps: gaps where no polarity is supported, gluts where both polarities are supported.

This is not a claim that standard FDE is already a sheaf logic. It is a conceptual bridge. The Belnap value at a proposition can be treated as a tiny fiber of polarity information. More refined systems could replace the four-element fiber with a provenance-rich bilattice, a temporal bilattice, or a source-indexed structure. The research problem is then to define gluing, restriction, and obstruction in a way that preserves the paraconsistent/paracomplete discipline of the base logic.

For information systems, this is often the right intuition. Inconsistency is rarely everywhere. It is local. The job is to reason over a nonclassical information terrain without pretending that every patch has already been reconciled.

# What Belnap logic buys you

Belnap-Dunn logic provides five durable advantages.

First, it distinguishes **no evidence** from **conflicting evidence**. Classical logic collapses both into trouble outside the formal system. FDE names them separately.

Second, it prevents **explosive collapse**. A contradiction about one proposition does not entail arbitrary conclusions about another.

Third, it is **truth-functional** for the basic connectives. The value of a compound is determined by the values of its parts. This makes it computationally tractable and algebraically transparent.

Fourth, it is **bilattice-ready**. The two-order structure generalizes naturally to richer systems for logic programming, AI, and knowledge representation.

Fifth, it is **conceptually honest about information**. It does not confuse the state of a database with the state of the world. It lets a system represent what it has been told without pretending that what it has been told is clean.

# What Belnap logic does not buy you automatically

FDE does not solve every problem of inconsistency.

It does not tell you which source to trust. It records that positive and negative support are both present, but not which support is better.

It does not provide a unique conditional. If your application needs “if...then,” you must choose or design an implicative expansion.

It does not by itself provide belief revision. It can preserve contradiction, but it does not decide how or whether to resolve it.

It does not encode degrees of confidence. The four values are qualitative. Quantitative and evidential extensions require additional structure.

It does not track provenance. The value \(\mathbf{b}\) says that both positive and negative support exist; it does not say where they came from.

It does not replace classical logic where classical assumptions are justified. If a domain is cleanly bivalent, classical logic is still the sharper tool.

The mature lesson is not “use FDE instead of classical logic everywhere.” It is: when information is incomplete and inconsistent, do not use a logic whose first response is triviality.

# Research problems and open directions

## Source-indexed Belnap semantics

The four values collapse all positive sources into one bit and all negative sources into one bit. A source-indexed semantics would assign each proposition a pair of source sets:

\[
(P_A,N_A),
\]

where \(P_A\) is the set of sources supporting \(A\), and \(N_A\) is the set of sources opposing \(A\). The Belnap value is recovered by checking whether these sets are empty. The research question is how to define consequence, revision, and aggregation before collapse.

## Temporal Belnap logic

Information changes. A proposition may be \(\mathbf{n}\) at time \(t_0\), \(\mathbf{t}\) at \(t_1\), \(\mathbf{b}\) at \(t_2\), and back to \(\mathbf{t}\) after conflict resolution. Temporal and dynamic extensions should distinguish monotone accumulation from nonmonotone correction.

This matters for databases, legal systems, scientific knowledge, and agent memory.

## Energetics of inconsistency

In a computational system, contradiction is not merely a semantic status. It has operational cost. Conflicting information demands storage, explanation, routing, quarantine, reconciliation, or policy decisions. A Belnap-valued system can be extended with cost models: how expensive is it to preserve gluts? how dangerous is it to collapse them? when is exact truth required, and when is truth-support enough?

This is a promising bridge between formal logic and the material operation of information systems.

## Typed consequence policies

Different tasks require different preservation standards. An exploratory search system may preserve truth-support. A safety-critical control system may require exact truth or non-falsity. A legal reasoning system may distinguish prima facie support from undefeated support. A typed FDE architecture would make the consequence relation explicit as part of the task type.

The research challenge is to prevent policy confusion: a conclusion valid under truth-preservation may not be valid under exact-truth preservation.

## Bilattice-valued agent architectures

Agent systems often combine perception, memory, planning, and communication. Each subsystem may produce positive and negative support. A bilattice-valued architecture could make conflict and ignorance explicit at the interface boundaries between subsystems.

The hard problem is not assigning four values. It is designing protocols so that contradictions remain localized, explanations remain traceable, and downstream action policies know which kind of uncertainty they are handling.

# A compact technical summary

Belnap-Dunn logic uses four semantic values:

\[
\mathbf{n}=\varnothing,
\quad
\mathbf{t}=\{T\},
\quad
\mathbf{f}=\{F\},
\quad
\mathbf{b}=\{T,F\}.
\]

The truth order is:

\[
\mathbf{f}\leq_t \mathbf{n}\leq_t \mathbf{t},
\qquad
\mathbf{f}\leq_t \mathbf{b}\leq_t \mathbf{t}.
\]

The knowledge order is:

\[
\mathbf{n}\leq_k\mathbf{t}\leq_k\mathbf{b},
\qquad
\mathbf{n}\leq_k\mathbf{f}\leq_k\mathbf{b}.
\]

Negation swaps true and false support:

\[
\neg\mathbf{t}=\mathbf{f},\quad
\neg\mathbf{f}=\mathbf{t},\quad
\neg\mathbf{b}=\mathbf{b},\quad
\neg\mathbf{n}=\mathbf{n}.
\]

Conjunction and disjunction are truth meet and truth join. Consequence preserves designated values:

\[
D=\{\mathbf{t},\mathbf{b}\}.
\]

Therefore explosion fails:

\[
A,\neg A\nvdash B.
\]

Excluded middle also fails:

\[
\nvdash A\vee\neg A.
\]

The base language contains \(\wedge,\vee,\neg\). Implication is not unique and must be supplied by an expansion.

# Conclusion

Belnap four-valued logic is one of the rare formal systems whose technical core and practical motivation are equally clear. Its core is the four-element square generated by independent positive and negative support. Its motivation is useful reasoning over bad information. Its mathematical life runs through relevance logic, Dunn semantics, Scott approximation, bilattices, logic programming, algebraic logic, proof theory, and modern computer-science semantics.

The enduring insight is simple: inconsistency and incompleteness are not the same defect, and neither should force reasoning to stop. A proposition can be true-only, false-only, both, or neither relative to the information at hand. Once that is admitted, logic becomes less like a brittle court of final truth and more like an instrument panel for information flow.

At the frontier, the main task is enrichment without collapse. Add implication without losing relevance. Add quantifiers without assuming settled domains. Add modalities without pretending knowledge is classical. Add probabilities without erasing gluts and gaps. Add provenance without drowning the four-valued core in metadata. Add computational machinery without turning contradiction back into exception handling.

Belnap’s square remains useful because it is minimal. It is the smallest formal place where truth and falsity can arrive separately, where silence differs from conflict, and where reasoning can continue without pretending the information world is cleaner than it is.
