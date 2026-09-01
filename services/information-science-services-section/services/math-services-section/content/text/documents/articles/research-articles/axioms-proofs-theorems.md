---
title: "Theorem, Axiom, Proof: A Genealogy of Mathematical Consequence"
author:
  - literal: "ChatGPT for emsenn"
date: "2026-07-06"
lang: en
abstract: |
  This paper develops a research-level account of the difference between theorem, axiom, and proof. At the elementary level, an axiom is an assumed starting point, a proof is a valid derivation, and a theorem is a proved result. At the research level, however, the distinction becomes historical, technical, and institutional: an axiom is a rule-setting commitment inside a mathematical language or foundation; a proof is a finite, checkable, and often explanatory transformation licensed by rules of inference; and a theorem is a statement stabilized as a consequence of such commitments. The paper traces this triad from Greek demonstration and Euclidean postulation through the nineteenth-century transformation of axioms into structural hypotheses, Hilbert's formalist program, Gödelian incompleteness, Gentzen's proof theory, Tarskian semantics, type theory, category-theoretic foundations, and current frontiers in formalized mathematics, univalent foundations, proof assistants, and AI-assisted theorem proving.
references:
  - id: aristotle-prior-analytics
    type: chapter
    author:
      - literal: "Aristotle"
    editor:
      - family: Barnes
        given: Jonathan
    title: "Prior Analytics"
    container-title: "The Complete Works of Aristotle"
    publisher: "Princeton University Press"
    publisher-place: "Princeton"
    issued:
      date-parts:
        - [1984]
  - id: euclid-elements-heath
    type: book
    author:
      - literal: "Euclid"
    translator:
      - family: Heath
        given: Thomas L.
    title: "The Thirteen Books of Euclid's Elements"
    publisher: "Cambridge University Press"
    publisher-place: "Cambridge"
    issued:
      date-parts:
        - [1908]
  - id: bolyai-1832-scientiam
    type: book
    author:
      - family: Bolyai
        given: János
    title: "Appendix Scientiam Spatii Absolute Veram Exhibens"
    publisher: "Maros-Vásárhely"
    issued:
      date-parts:
        - [1832]
  - id: lobachevsky-1840-geometrische
    type: book
    author:
      - family: Lobachevsky
        given: Nikolai I.
    title: "Geometrische Untersuchungen zur Theorie der Parallellinien"
    publisher: "G. Fincke"
    publisher-place: "Berlin"
    issued:
      date-parts:
        - [1840]
  - id: dedekind-1888-numbers
    type: book
    author:
      - family: Dedekind
        given: Richard
    title: "Was sind und was sollen die Zahlen?"
    publisher: "Vieweg"
    publisher-place: "Braunschweig"
    issued:
      date-parts:
        - [1888]
  - id: peano-1889-arithmetices
    type: book
    author:
      - family: Peano
        given: Giuseppe
    title: "Arithmetices principia, nova methodo exposita"
    publisher: "Fratres Bocca"
    publisher-place: "Turin"
    issued:
      date-parts:
        - [1889]
  - id: frege-1879-begriffsschrift
    type: book
    author:
      - family: Frege
        given: Gottlob
    title: "Begriffsschrift: Eine der arithmetischen nachgebildete Formelsprache des reinen Denkens"
    publisher: "Louis Nebert"
    publisher-place: "Halle"
    issued:
      date-parts:
        - [1879]
  - id: frege-1884-grundlagen
    type: book
    author:
      - family: Frege
        given: Gottlob
    title: "Die Grundlagen der Arithmetik"
    publisher: "Wilhelm Koebner"
    publisher-place: "Breslau"
    issued:
      date-parts:
        - [1884]
  - id: hilbert-1899-grundlagen
    type: book
    author:
      - family: Hilbert
        given: David
    title: "Grundlagen der Geometrie"
    publisher: "Teubner"
    publisher-place: "Leipzig"
    issued:
      date-parts:
        - [1899]
  - id: hilbert-1900-problems
    type: article-journal
    author:
      - family: Hilbert
        given: David
    title: "Mathematical Problems"
    container-title: "Bulletin of the American Mathematical Society"
    volume: 8
    issue: 10
    page: "437-479"
    issued:
      date-parts:
        - [1902]
  - id: hilbert-1926-infinite
    type: article-journal
    author:
      - family: Hilbert
        given: David
    title: "Über das Unendliche"
    container-title: "Mathematische Annalen"
    volume: 95
    page: "161-190"
    issued:
      date-parts:
        - [1926]
  - id: zermelo-1908-set-theory
    type: article-journal
    author:
      - family: Zermelo
        given: Ernst
    title: "Untersuchungen über die Grundlagen der Mengenlehre I"
    container-title: "Mathematische Annalen"
    volume: 65
    page: "261-281"
    issued:
      date-parts:
        - [1908]
  - id: russell-whitehead-1910-principia
    type: book
    author:
      - family: Whitehead
        given: Alfred North
      - family: Russell
        given: Bertrand
    title: "Principia Mathematica"
    publisher: "Cambridge University Press"
    publisher-place: "Cambridge"
    issued:
      date-parts:
        - [1910]
  - id: godel-1931-incompleteness
    type: article-journal
    author:
      - family: Gödel
        given: Kurt
    title: "Über formal unentscheidbare Sätze der Principia Mathematica und verwandter Systeme I"
    container-title: "Monatshefte für Mathematik und Physik"
    volume: 38
    page: "173-198"
    issued:
      date-parts:
        - [1931]
  - id: tarski-1936-consequence
    type: chapter
    author:
      - family: Tarski
        given: Alfred
    title: "On the Concept of Logical Consequence"
    container-title: "Logic, Semantics, Metamathematics"
    publisher: "Oxford University Press"
    publisher-place: "Oxford"
    issued:
      date-parts:
        - [1956]
    original-date:
      date-parts:
        - [1936]
  - id: gentzen-1935-deduction
    type: article-journal
    author:
      - family: Gentzen
        given: Gerhard
    title: "Untersuchungen über das logische Schließen"
    container-title: "Mathematische Zeitschrift"
    volume: 39
    page: "176-210, 405-431"
    issued:
      date-parts:
        - [1935]
  - id: church-1936-unsolvable
    type: article-journal
    author:
      - family: Church
        given: Alonzo
    title: "An Unsolvable Problem of Elementary Number Theory"
    container-title: "American Journal of Mathematics"
    volume: 58
    issue: 2
    page: "345-363"
    issued:
      date-parts:
        - [1936]
  - id: turing-1936-computable
    type: article-journal
    author:
      - family: Turing
        given: Alan M.
    title: "On Computable Numbers, with an Application to the Entscheidungsproblem"
    container-title: "Proceedings of the London Mathematical Society"
    volume: 42
    issue: 2
    page: "230-265"
    issued:
      date-parts:
        - [1936]
  - id: howard-1980-formulae
    type: chapter
    author:
      - family: Howard
        given: William A.
    title: "The Formulae-as-Types Notion of Construction"
    container-title: "To H. B. Curry: Essays on Combinatory Logic, Lambda Calculus and Formalism"
    publisher: "Academic Press"
    publisher-place: "London"
    page: "479-490"
    issued:
      date-parts:
        - [1980]
  - id: martin-lof-1984-intuitionistic
    type: book
    author:
      - family: Martin-Löf
        given: Per
    title: "Intuitionistic Type Theory"
    publisher: "Bibliopolis"
    publisher-place: "Naples"
    issued:
      date-parts:
        - [1984]
  - id: lawvere-1964-etcs
    type: report
    author:
      - family: Lawvere
        given: F. William
    title: "An Elementary Theory of the Category of Sets"
    publisher: "National Academy of Sciences"
    publisher-place: "Washington, DC"
    issued:
      date-parts:
        - [1964]
  - id: lakatos-1976-proofs
    type: book
    author:
      - family: Lakatos
        given: Imre
    title: "Proofs and Refutations: The Logic of Mathematical Discovery"
    publisher: "Cambridge University Press"
    publisher-place: "Cambridge"
    issued:
      date-parts:
        - [1976]
  - id: maddy-2011-defending
    type: book
    author:
      - family: Maddy
        given: Penelope
    title: "Defending the Axioms: On the Philosophical Foundations of Set Theory"
    publisher: "Oxford University Press"
    publisher-place: "Oxford"
    issued:
      date-parts:
        - [2011]
  - id: zach-2003-hilbert
    type: webpage
    author:
      - family: Zach
        given: Richard
    title: "Hilbert's Program"
    container-title: "The Stanford Encyclopedia of Philosophy"
    URL: "https://plato.stanford.edu/entries/hilbert-program/"
    issued:
      date-parts:
        - [2003]
    accessed:
      date-parts:
        - [2026, 7, 6]
  - id: rathjen-2018-proof-theory
    type: webpage
    author:
      - family: Rathjen
        given: Michael
    title: "Proof Theory"
    container-title: "The Stanford Encyclopedia of Philosophy"
    URL: "https://plato.stanford.edu/entries/proof-theory/"
    issued:
      date-parts:
        - [2018]
    accessed:
      date-parts:
        - [2026, 7, 6]
  - id: von-plato-2008-development
    type: webpage
    author:
      - family: von Plato
        given: Jan
    title: "The Development of Proof Theory"
    container-title: "The Stanford Encyclopedia of Philosophy"
    URL: "https://plato.stanford.edu/entries/proof-theory-development/"
    issued:
      date-parts:
        - [2008]
    accessed:
      date-parts:
        - [2026, 7, 6]
  - id: raatikainen-2013-godel
    type: webpage
    author:
      - family: Raatikainen
        given: Panu
    title: "Gödel's Incompleteness Theorems"
    container-title: "The Stanford Encyclopedia of Philosophy"
    URL: "https://plato.stanford.edu/entries/goedel-incompleteness/"
    issued:
      date-parts:
        - [2013]
    accessed:
      date-parts:
        - [2026, 7, 6]
  - id: shapiro-2000-classical-logic
    type: webpage
    author:
      - family: Shapiro
        given: Stewart
    title: "Classical Logic"
    container-title: "The Stanford Encyclopedia of Philosophy"
    URL: "https://plato.stanford.edu/entries/logic-classical/"
    issued:
      date-parts:
        - [2000]
    accessed:
      date-parts:
        - [2026, 7, 6]
  - id: scholz-2012-proof-theoretic-semantics
    type: webpage
    author:
      - family: Schroeder-Heister
        given: Peter
    title: "Proof-Theoretic Semantics"
    container-title: "The Stanford Encyclopedia of Philosophy"
    URL: "https://plato.stanford.edu/entries/proof-theoretic-semantics/"
    issued:
      date-parts:
        - [2012]
    accessed:
      date-parts:
        - [2026, 7, 6]
  - id: canti-2022-axiomatics
    type: article-journal
    author:
      - family: Cantù
        given: Paola
    title: "What Is Axiomatics?"
    container-title: "Synthese"
    volume: 200
    issue: 6
    issued:
      date-parts:
        - [2022]
    URL: "https://hal.science/hal-03893466/document"
    accessed:
      date-parts:
        - [2026, 7, 6]
  - id: univalent-foundations-2013-hott
    type: book
    author:
      - literal: "The Univalent Foundations Program"
    title: "Homotopy Type Theory: Univalent Foundations of Mathematics"
    publisher: "Institute for Advanced Study"
    publisher-place: "Princeton"
    issued:
      date-parts:
        - [2013]
    URL: "https://homotopytypetheory.org/book/"
    accessed:
      date-parts:
        - [2026, 7, 6]
  - id: pelayo-warren-2012-hott
    type: article-journal
    author:
      - family: Pelayo
        given: Álvaro
      - family: Warren
        given: Michael A.
    title: "Homotopy Type Theory and Voevodsky's Univalent Foundations"
    container-title: "Bulletin of the American Mathematical Society"
    volume: 51
    issue: 4
    page: "597-648"
    issued:
      date-parts:
        - [2014]
    URL: "https://arxiv.org/abs/1210.5658"
    accessed:
      date-parts:
        - [2026, 7, 6]
  - id: bauer-2017-hott-library
    type: article-journal
    author:
      - family: Bauer
        given: Andrej
      - family: Gross
        given: Jason
      - family: Lumsdaine
        given: Peter LeFanu
      - family: Shulman
        given: Michael
      - family: Sozeau
        given: Matthieu
      - family: Spitters
        given: Bas
    title: "The HoTT Library: A Formalization of Homotopy Type Theory in Coq"
    container-title: "Proceedings of the 6th ACM SIGPLAN Conference on Certified Programs and Proofs"
    page: "164-172"
    issued:
      date-parts:
        - [2017]
    URL: "https://arxiv.org/abs/1610.04591"
    accessed:
      date-parts:
        - [2026, 7, 6]
  - id: mathlib-community-2020
    type: paper-conference
    author:
      - literal: "The mathlib Community"
    title: "The Lean Mathematical Library"
    container-title: "Proceedings of the 9th ACM SIGPLAN International Conference on Certified Programs and Proofs"
    publisher: "Association for Computing Machinery"
    publisher-place: "New York"
    page: "367-381"
    DOI: "10.1145/3372885.3373824"
    issued:
      date-parts:
        - [2020]
    URL: "https://arxiv.org/abs/1910.09336"
    accessed:
      date-parts:
        - [2026, 7, 6]
  - id: avigad-2024-formal-turn
    type: article-journal
    author:
      - family: Avigad
        given: Jeremy
    title: "Mathematics and the Formal Turn"
    container-title: "Bulletin of the American Mathematical Society"
    volume: 61
    issue: 2
    page: "225-240"
    issued:
      date-parts:
        - [2024]
    URL: "https://www.ams.org/bull/2024-61-02/S0273-0979-2024-01832-1/"
    accessed:
      date-parts:
        - [2026, 7, 6]
  - id: hales-2017-kepler
    type: article-journal
    author:
      - family: Hales
        given: Thomas
      - family: Adams
        given: Mark
      - family: Bauer
        given: Gertrud
      - family: Dang
        given: Tat Dat
      - family: Harrison
        given: John
      - family: Hoang
        given: Truong Le
      - family: Kaliszyk
        given: Cezary
      - family: Magron
        given: Victor
      - family: McLaughlin
        given: Sean
      - family: Nguyen
        given: Tat Thang
      - family: Nguyen
        given: Quang Truong
      - family: Nipkow
        given: Tobias
      - family: Obua
        given: Steven
      - family: Pleso
        given: Joseph
      - family: Rute
        given: Jason
      - family: Solovyev
        given: Alexey
      - family: Ta
        given: Thi Hoai An
      - family: Tran
        given: Nam Trung
      - family: Trieu
        given: Thi Diep
      - family: Urban
        given: Josef
      - family: Vu
        given: Ky
      - family: Zumkeller
        given: Roland
    title: "A Formal Proof of the Kepler Conjecture"
    container-title: "Forum of Mathematics, Pi"
    volume: 5
    page: "e2"
    DOI: "10.1017/fmp.2017.1"
    issued:
      date-parts:
        - [2017]
  - id: gonthier-2008-four-color
    type: article-journal
    author:
      - family: Gonthier
        given: Georges
    title: "Formal Proof: The Four-Color Theorem"
    container-title: "Notices of the American Mathematical Society"
    volume: 55
    issue: 11
    page: "1382-1393"
    issued:
      date-parts:
        - [2008]
  - id: hubert-2025-alphaproof
    type: article-journal
    author:
      - family: Hubert
        given: Thomas
      - family: Odendahl
        given: Emilio
      - family: Gelly
        given: Sylvain
      - family: Lample
        given: Guillaume
      - family: Lachaux
        given: Marie-Anne
      - family: Lavril
        given: Thibaut
      - family: Hayat
        given: Gregory
      - family: Orseau
        given: Laurent
      - family: Ebner
        given: Gabriel
      - family: Fawzi
        given: Alhussein
      - family: Balog
        given: Matej
      - family: Kohli
        given: Pushmeet
    title: "Olympiad-Level Formal Mathematical Reasoning with AlphaProof"
    container-title: "Nature"
    issued:
      date-parts:
        - [2025]
    DOI: "10.1038/s41586-025-09833-y"
    URL: "https://www.nature.com/articles/s41586-025-09833-y"
    accessed:
      date-parts:
        - [2026, 7, 6]
  - id: ravi-2026-formalproofbench
    type: article
    author:
      - family: Ravi
        given: Nikil
      - family: Ying
        given: Kexing
      - family: Nesterov
        given: Vasilii
      - family: Krishnan
        given: Rayan
      - family: Uskuplu
        given: Elif
      - family: Xia
        given: Bingyu
      - family: Aswedige
        given: Janitha
      - family: Nashold
        given: Langston
    title: "FormalProofBench: Can Models Write Graduate Level Math Proofs That Are Formally Verified?"
    container-title: "arXiv"
    issued:
      date-parts:
        - [2026]
    URL: "https://arxiv.org/abs/2603.26996"
    accessed:
      date-parts:
        - [2026, 7, 6]
  - id: barrett-2026-cslib
    type: article
    author:
      - family: Barrett
        given: Clark
      - family: Chaudhuri
        given: Swarat
      - family: Montesi
        given: Fabrizio
      - family: Grundy
        given: Jim
      - family: Kohli
        given: Pushmeet
      - family: de Moura
        given: Leonardo
      - family: Rademaker
        given: Alexandre
      - family: Yingchareonthawornchai
        given: Sorrachai
    title: "CSLib: The Lean Computer Science Library"
    container-title: "arXiv"
    issued:
      date-parts:
        - [2026]
    URL: "https://arxiv.org/abs/2602.04846"
    accessed:
      date-parts:
        - [2026, 7, 6]
type: research-article

---


## Abstract

At school-level precision, the difference is clean: an **axiom** is assumed, a **proof** derives, and a **theorem** is what has been derived. That answer is correct, but it hides the intellectual drama. The modern words name three positions in a whole ecology of mathematical legitimacy. An axiom is not merely a sentence one happens to believe. It is a commitment that fixes a space of possible reasoning. A proof is not merely a persuasive explanation. It is an organized passage from accepted commitments to a new claim, constrained by explicit or implicit rules. A theorem is not merely a true sentence. It is a claim that has been made stable under the proof-practices of a community, a formal system, or both.

The historical movement from Euclid to Lean is a movement from **evident starting truths** to **formal rule systems**, from **diagram-backed demonstration** to **syntactic derivation and semantic consequence**, and now from **human-checkable prose** to **machine-checkable proof objects**. The frontier is no longer just the discovery of new theorems. It is the reorganization of theoremhood itself: theorem as dependency graph, proof as certificate/program/explanation, and axiom as an interface between possible mathematical worlds.

## 1. The elementary distinction, made precise

A useful first pass is this:

- An **axiom** is a starting commitment.
- A **proof** is a licensed derivation.
- A **theorem** is a derived consequence.

In modern logical notation, if $A$ is a collection of axioms, $R$ is a collection of inference rules, and $\varphi$ is a sentence in the relevant language, then

$$A \vdash_R \varphi$$

means that $\varphi$ is provable from $A$ by rules $R$. In that case, relative to $A$ and $R$, $\varphi$ is a theorem. The symbol $\vdash$ is syntactic: it concerns derivability by formal rules. A related but distinct symbol is

$$A \models \varphi,$$

which says that every model satisfying $A$ also satisfies $\varphi$. The symbol $\models$ is semantic: it concerns truth across interpretations. One of the great achievements of mathematical logic was to clarify the relation between these notions. **Soundness** says, roughly, that whatever is provable is semantically valid. **Completeness**, when available, says that whatever is semantically valid is provable. The fact that these notions can coincide for first-order logic but fail or fracture in stronger settings is one reason the distinction between theorem, axiom, and proof becomes a research topic rather than a glossary entry [@shapiro-2000-classical-logic; @tarski-1936-consequence; @godel-1931-incompleteness].

The simplest technical definition is therefore relative:

> A theorem is a formula $\varphi$ for which there exists a proof from a specified background of axioms and inference rules.

This relativity matters. A statement may be a theorem of Euclidean geometry but not of neutral geometry. It may be a theorem of ZFC plus large-cardinal axioms but not of ZFC alone. It may be constructively valid only when its proof gives computational content, or classically valid because the law of excluded middle is admitted. The word “theorem” never floats free of a regime of proof.

This also means that “axiom” does not mean “obviously true.” That was once part of the story, especially in ancient and early modern presentations. But in modern mathematics, axioms often serve as **implicit definitions**, **structural constraints**, **existence principles**, **closure principles**, or **rules of world-building**. The axiom of choice, the parallel postulate, replacement in set theory, univalence in homotopy type theory, and large-cardinal axioms in set theory are not all the same kind of commitment. They all function axiomatically because they fix what counts as a permitted move in a domain of reasoning.

Nor does “proof” mean merely “explanation.” Many proofs explain; some do not. Some proofs are beautiful; some are brute-force enumerations, computer-assisted certificates, or thousand-page collaborations. A proof can be a derivation in a formal calculus, a term in a type theory, a construction, a normalization argument, a diagram chase, a homological computation, or a mechanically checked artifact. The proof is the mediating object between axiom and theorem, but its nature has changed dramatically over time.

## 2. The formal anatomy of the triad

A formal mathematical theory normally contains at least five ingredients.

First, it has a **language**: symbols, terms, variables, formulas, formation rules. Second, it has **axioms**: formulas or axiom schemata accepted without proof in that theory. Third, it has **rules of inference**: forms of transition from old formulas to new formulas. Fourth, it has **proofs**: finite sequences, trees, graphs, terms, or other checkable objects whose steps follow from axioms and rules. Fifth, it has **theorems**: formulas that occur as the conclusion of some proof.

This formal anatomy gives the familiar school-level distinction a sharper shape:

| Role | Formal position | Informal function |
|---|---|---|
| Axiom | Member of the initial theory, or instance of an axiom schema | Fixes the admissible world of reasoning |
| Rule | Transformation licensed by the logic | Fixes what counts as valid movement |
| Proof | Finite object built from axioms and rules | Certifies a claim as derivable |
| Theorem | Formula at the end of a proof | Stabilized consequence |

This table omits a subtle point: sometimes what one system treats as an axiom, another treats as a rule. For instance, induction can be presented as an axiom schema in first-order Peano arithmetic or as a rule in other proof-theoretic systems. Likewise, equality can be governed by axioms, rules, rewriting mechanisms, identity types, or path constructors. The boundary between axiom and rule is therefore partly a design decision about the presentation of a theory.

The difference between **axiom** and **definition** is similarly delicate. A definition introduces an abbreviation or a new piece of vocabulary in a way that is supposed to be conservative: it should not create genuinely new theorems in the old language. An axiom, by contrast, can strengthen the theory. But this distinction can blur. Structural axioms may function as implicit definitions of mathematical objects. Hilbert's axioms for geometry do not define points, lines, and planes by reducing them to prior substances; they define them by their permitted relations. In this sense, an axiomatic theory can specify a structure without saying what its objects “really are” [@hilbert-1899-grundlagen; @canti-2022-axiomatics].

The difference between **theorem** and **truth** is also central. A theorem is provable in a system. Truth is semantic, relative to a model or intended interpretation. In a sound system, theoremhood implies truth in all intended models. But Gödel's incompleteness theorems showed that for any consistent, effectively axiomatized formal system strong enough for elementary arithmetic, there are arithmetical statements not decided by the system [@godel-1931-incompleteness; @raatikainen-2013-godel]. The result does not say that proof is useless. It says that theoremhood cannot exhaust mathematical truth under those constraints.

Finally, the difference between **proof** and **derivation** is not always identical. A formal derivation is a rigorously specified object in a calculus. A human mathematical proof is often a compressed, socially legible argument that indicates how a derivation could in principle be reconstructed. The twentieth and twenty-first centuries have increasingly turned that “in principle” into an object of technology: formal proof assistants ask us to make enough of the proof explicit that a small kernel can check it.

## 3. Greek demonstration: axioms as evident beginnings

The classical ancestry of the triad lies in Greek mathematics and logic. Aristotle's *Prior Analytics* gave a systematic account of valid syllogistic inference, while the *Posterior Analytics* connected scientific knowledge with demonstration from first principles [@aristotle-prior-analytics]. In this picture, genuine knowledge proceeds from premises that are prior, better known, and explanatory. The proof does not merely force assent; it shows why the conclusion must be so.

Euclid's *Elements* became the canonical mathematical image of this structure [@euclid-elements-heath]. It begins with definitions, postulates, and common notions, then develops propositions through demonstrations. The opening apparatus is heterogeneous. Definitions introduce objects such as point, line, circle, and angle. Postulates authorize constructions: drawing a straight line from any point to any point, extending a finite straight line, drawing a circle with given center and radius. Common notions express general principles: things equal to the same thing are equal to one another; the whole is greater than the part.

In the Euclidean model, an axiom or postulate looks like an evident beginning. It is not yet the modern formal axiom as arbitrary stipulation. It is supposed to be a rationally acceptable starting point. A proof is a demonstration that compels agreement by moving from these beginnings through diagrammatic and logical steps. A theorem is a proposition whose necessity has been displayed.

Yet even here the later trouble is already latent. The fifth postulate, the parallel postulate, was more complex and less self-evident than the others. For centuries, mathematicians tried to prove it from Euclid's remaining assumptions. Those failures eventually transformed the meaning of axiom itself. The parallel postulate did not merely need a better proof; it revealed that different geometries could be generated by different axiom choices.

That transformation is one of the decisive events in the genealogy of theorem, axiom, and proof.

## 4. Non-Euclidean geometry and the fall of self-evidence

The nineteenth-century discovery of non-Euclidean geometries changed the status of axioms. Work by Nikolai Lobachevsky, János Bolyai, Carl Friedrich Gauss, and later Bernhard Riemann showed that coherent geometries could be built by denying or modifying Euclid's parallel postulate [@bolyai-1832-scientiam; @lobachevsky-1840-geometrische].

This did not simply add new theorems. It changed what an axiom is. If multiple incompatible geometries are internally coherent, then axioms cannot be only self-evident descriptions of a single obvious space. They become **conditions defining a structure**. A theorem is then not “true about space” in a naive singular sense; it is true in a geometry, relative to a system of assumptions.

This is why non-Euclidean geometry is philosophically deeper than the slogan “Euclid was wrong.” Euclidean geometry remains a perfectly good mathematical theory. What changed was the relation between mathematical theory and intuitive reality. Axioms became less like unquestionable truths and more like structural commitments. The theorem became conditional: if this system, then that result.

The same transformation occurred in arithmetic and analysis. Nineteenth-century mathematics had to respond to infinitesimals, divergent series, pathological functions, set-theoretic paradoxes, and the need to put calculus on a rigorous foundation. Richard Dedekind and Giuseppe Peano provided axiomatic treatments of the natural numbers [@dedekind-1888-numbers; @peano-1889-arithmetices]. Gottlob Frege tried to ground arithmetic in logic, introducing a formal language of unprecedented expressive precision in *Begriffsschrift* and developing a logicist account of number in *The Foundations of Arithmetic* [@frege-1879-begriffsschrift; @frege-1884-grundlagen].

The movement here is from **content-first mathematics** to **structure-first mathematics**. An axiom no longer needs to describe an independently obvious object. It can specify what it is to be a natural-number structure, a group, a field, a topological space, a set-theoretic universe, a category, or a type-theoretic universe. Proof then becomes a method for extracting invariant consequences from that specification.

## 5. Hilbert: axioms as implicit definitions, proof as formal object

David Hilbert's *Foundations of Geometry* crystallized the modern axiomatic method [@hilbert-1899-grundlagen]. Hilbert organized geometry around primitive terms and relations constrained by axioms. The often-quoted spirit of Hilbert's method is that one could replace “points, lines, and planes” by “tables, chairs, and beer mugs” provided the axioms are satisfied. Whether or not one quotes the anecdote exactly, the philosophical point is clear: the primitive terms do not receive meaning by direct intuition alone; they receive mathematical role through the network of axioms.

This is a major mutation of “axiom.” An axiom becomes a clause in an implicit definition of a structure. The object of study is no longer the imagined concrete point or line; it is the class of systems satisfying the axioms. To prove a theorem is to show that a claim holds in every such system, or that it is derivable from the axioms governing such systems.

Hilbert's broader foundational program then raised the stakes. In the early twentieth century, Hilbert sought to formalize mathematics and prove the consistency of the resulting formal systems by finitary means [@hilbert-1900-problems; @hilbert-1926-infinite; @zach-2003-hilbert]. The goal was not merely to use axioms but to study axiomatic systems mathematically. Mathematics began to turn back upon its own methods. Proof itself became an object of mathematical investigation.

This metamathematical turn is crucial. Once proofs are formal objects, one can ask new questions:

- Is every theorem of a system mechanically enumerable?
- Is the system consistent?
- Is it complete?
- Are its axioms independent?
- Can proof search be automated?
- Can one transform proofs into normal forms?
- Can one extract algorithms from constructive proofs?

Theorem, axiom, and proof are no longer just working vocabulary. They become the subject matter of proof theory, model theory, computability theory, and formal semantics.

## 6. The early twentieth-century crisis: logicism, set theory, and paradox

The same period saw an intense attempt to reduce mathematics to logic and set theory. Frege's logicist project was disrupted by Russell's paradox, which showed that unrestricted comprehension—roughly, the assumption that every condition determines a set—leads to contradiction. Bertrand Russell and Alfred North Whitehead's *Principia Mathematica* responded with a ramified theory of types and an immense formal reconstruction of mathematics [@russell-whitehead-1910-principia]. Ernst Zermelo's axiomatization of set theory, later developed into Zermelo-Fraenkel set theory, restricted set formation to avoid paradox [@zermelo-1908-set-theory].

Here the role of axioms becomes defensive and architectural. Axioms are not only beginnings; they are safeguards against inconsistency. They decide which collections exist, which operations are legitimate, and how much infinity the theory permits. They are the load-bearing beams of a mathematical universe.

Set theory also clarified the distinction between a theory and its models. Axioms can be satisfied by structures. Theorems are then the sentences forced across all models of the axioms. But model theory soon revealed that even very strong axiom systems may have multiple non-isomorphic models. The notion that axioms simply pin down a unique intended universe became difficult to maintain without qualification.

This period also intensified the distinction between **object language** and **metalanguage**. A theorem inside a theory is expressed in the object language. A statement about the theory—such as “this theory is consistent” or “this formula is provable”—belongs to a metatheory. Much foundational confusion comes from crossing those levels too casually. Gödel's genius was partly to show how arithmetic can encode enough syntax that a theory can, in a controlled way, speak about its own proofs.

## 7. Gödel: theoremhood has limits

Kurt Gödel's incompleteness theorems mark a permanent boundary in the modern understanding of the triad [@godel-1931-incompleteness]. The first incompleteness theorem says that any consistent, effectively axiomatized formal system strong enough to represent elementary arithmetic is incomplete: there are sentences in its language that it neither proves nor refutes. The second incompleteness theorem says that such a system cannot, under the relevant conditions, prove its own consistency.

These results are often over-mythologized, but their precise consequence for theorem, axiom, and proof is profound. They separate truth from theoremhood. They show that no sufficiently strong computable axiom system can capture all arithmetical truth while remaining consistent. They also show that the dream of a final finitary proof of consistency for all mathematics cannot proceed in the simple Hilbertian form.

Gödel did not destroy formal mathematics. On the contrary, he demonstrated the power of formalization by using it to prove limits on formalization. The incompleteness theorems require that proofs be arithmetized as finite syntactic objects. They depend on the very possibility of treating proof mathematically.

After Gödel, adding axioms becomes an unavoidable and philosophically charged practice. When a statement is independent of a background theory, one can ask whether new axioms should be adopted. Set theorists debate large-cardinal axioms, forcing axioms, determinacy principles, and multiverse views. A theorem is no longer merely what follows from “the axioms”; the phrase “the axioms” is itself a site of mathematical judgment.

## 8. Tarski and the semantic turn: consequence across models

Alfred Tarski's account of logical consequence gave another axis of precision [@tarski-1936-consequence]. A sentence follows logically from a set of premises if every interpretation or model satisfying the premises also satisfies the sentence. This model-theoretic idea complements the proof-theoretic notion of derivability.

The distinction is one of the most important technical refinements in modern logic:

- $A \vdash \varphi$: $\varphi$ is derivable from $A$ by a specified proof system.
- $A \models \varphi$: $\varphi$ is true in every model of $A$.

When a proof system is sound and complete for a semantics, these notions coincide extensionally. But they remain conceptually different. A proof is a syntactic witness. A semantic consequence is an invariance across models. The theorem, depending on context, may be understood proof-theoretically as derivable or semantically as valid.

This matters because modern mathematics constantly moves between these modes. Algebraists prove results about all groups satisfying group axioms. Logicians study whether proof systems capture semantic consequence. Set theorists distinguish truth in a universe from provability in ZFC. Type theorists may interpret propositions as types and proofs as terms, shifting the semantic landscape again.

The theorem therefore has at least two faces: it is the end of a proof, and it is a truth preserved across a class of structures. Much twentieth-century logic consists in studying when those faces align and when they do not.

## 9. Gentzen and proof theory: proofs have internal structure

Gerhard Gentzen transformed proof from a mere certificate of theoremhood into an object with its own geometry [@gentzen-1935-deduction; @von-plato-2008-development; @rathjen-2018-proof-theory]. His natural deduction and sequent calculus were designed to analyze the structure of logical inference as it occurs in mathematical reasoning. Instead of treating proof as an undifferentiated sequence of formulas, Gentzen studied introduction and elimination rules, cut elimination, normalization, and the architecture of derivations.

This changed the meaning of proof in three ways.

First, proofs became transformable objects. A proof with detours can be normalized into a more direct form. Cut elimination shows, in appropriate systems, that proofs using intermediate lemmas can be transformed into proofs with a subformula discipline. This is not merely bookkeeping. It reveals conservation results, consistency results, and computational content.

Second, logical constants became definable by their inferential roles. In proof-theoretic semantics, the meaning of a connective is tied to how it is introduced and eliminated rather than only to truth conditions [@scholz-2012-proof-theoretic-semantics]. “And,” “or,” “implies,” and “not” receive meaning from proof behavior. This shifts emphasis from theorem as truth to theorem as assertability under rules.

Third, proof theory exposed the difference between classical and constructive mathematics. A classical proof may establish that an object exists by showing that nonexistence leads to contradiction. A constructive proof, by contrast, is expected to provide a construction of the object. The same theorem-shaped sentence can therefore demand different kinds of proof under different logics.

## 10. Computability: proof search and the mechanical boundary

Alonzo Church and Alan Turing gave precise mathematical accounts of effective procedure [@church-1936-unsolvable; @turing-1936-computable]. This matters directly for theoremhood. If a formal system has an effective set of axioms and rules, then its theorems can often be recursively enumerated: a machine can search through possible proofs and list the formulas eventually proved. But it does not follow that there is a decision procedure determining, for every formula, whether it is a theorem.

The Entscheidungsproblem asked whether there is a general mechanical procedure for deciding validity. Church and Turing showed that no such procedure exists for first-order logic in the general case. Thus proof is mechanically checkable in a way it is not always mechanically findable. This asymmetry remains central today. A proof assistant can verify a proof object, but finding the proof may require human insight, automation, search, machine learning, or all of them.

The theorem therefore has a computational profile. It is not only a sentence with a proof; it is a sentence for which a proof may be searchable, compressible, extractable, normalizable, checkable, or computationally expensive. Proof complexity studies how hard proofs must be in various systems. Automated theorem proving studies how to find them. Interactive theorem proving studies how humans and machines cooperate in their construction.

## 11. The Curry-Howard turn: propositions as types, proofs as programs

The Curry-Howard correspondence gives the triad another interpretation: propositions correspond to types, proofs correspond to terms or programs, and proving corresponds to constructing an inhabitant of a type [@howard-1980-formulae]. In this setting, the theorem “$P$” is not merely a sentence at the end of a derivation. It is a type with an inhabitant. A proof of $P$ is a term of type $P$.

Per Martin-Löf's intuitionistic type theory made this interpretation foundational [@martin-lof-1984-intuitionistic]. Axioms may be introduced as constants inhabiting certain types, but constructive type theory encourages a stricter discipline: to assert existence is to provide data. Proofs can compute. The distinction between theorem and program becomes porous.

This does not mean all mathematics has become programming. It means that one major foundational lineage treats proof as carrying computational content. A theorem is not merely accepted; it is inhabited. A proof is not merely persuasive; it is executable or normalizable in a precise sense. The axiom, when added, can affect computation: some classical axioms erase or complicate computational meaning, while constructive principles preserve it.

This is one of the clearest ways modern foundations pluralize the original triad. In set-theoretic foundations, proofs certify propositions about sets. In type-theoretic foundations, proofs may themselves be mathematical objects with computational behavior. In proof-irrelevant settings, any two proofs of a proposition may be identified. In proof-relevant settings, different proofs can matter.

## 12. Category-theoretic and structural foundations

Category theory introduced yet another shift. Rather than founding mathematics primarily on membership, category-theoretic foundations emphasize objects, morphisms, universal properties, and structure-preserving maps. William Lawvere's elementary theory of the category of sets is a landmark in treating the category of sets itself axiomatically [@lawvere-1964-etcs].

This changes the axiom's role again. An axiom can describe not a universe of elements but a pattern of transformations. Universal properties often define objects up to unique isomorphism, making invariance more central than internal constitution. A theorem becomes a statement preserved by structural form; a proof often becomes a construction of maps satisfying diagrams.

Category theory also affects the concept of proof. Diagram chases, adjunctions, representability arguments, and universal properties are not merely stylistic conveniences. They organize proof around compositional invariance. This is one reason category theory became central in algebraic geometry, topology, logic, theoretical computer science, and mathematical physics. It lets mathematics reason at the level of structure and transformation rather than only elementwise calculation.

From the point of view of theorem, axiom, and proof, category theory makes explicit a deep modern tendency: axioms define a world of transformations; proofs are navigations through that world; theorems identify invariants of that navigation.

## 13. Proof as social object: Lakatos and mathematical practice

Formal accounts are indispensable, but they do not exhaust proof as practiced mathematics. Imre Lakatos's *Proofs and Refutations* dramatized the way definitions, conjectures, counterexamples, and proofs co-evolve [@lakatos-1976-proofs]. In actual mathematical discovery, a proposed theorem may be revised after counterexamples; definitions may be sharpened; lemmas may become explicit; hidden assumptions may be promoted to axioms.

This social-dialectical dimension is not an embarrassment. It is how formal objects are often born. A theorem in published mathematics is typically not a raw formal derivation. It is a compressed communicative artifact embedded in a discipline. It relies on conventions about what may be omitted, what counts as routine, which background results are available, and which readers can fill gaps.

A proof therefore has at least three layers:

1. **Formal layer:** a derivation or proof object checkable by rules.
2. **Explanatory layer:** an account of why the theorem holds.
3. **Institutional layer:** a community's acceptance that the argument meets the standards of the field.

These layers can come apart. A computer-generated proof may be formally correct but explanatorily opaque. A beautiful informal proof may be explanatory but not yet fully formalized. A long collaborative proof may be institutionally accepted before any one person has checked every detail. The current formalization movement is partly an attempt to reconnect these layers under new technological conditions.

## 14. Axioms as instruments: independence and new commitments

Once theorems are relative to axioms, independence results become moments of philosophical pressure. If neither $\varphi$ nor $\neg\varphi$ follows from a theory $T$, then $\varphi$ is independent of $T$, assuming the relevant consistency conditions. Independence does not mean “meaningless.” It means the current axioms do not decide the question.

Set theory is the central modern field in which this issue becomes unavoidable. The continuum hypothesis, the axiom of choice in weaker systems, large-cardinal hypotheses, forcing axioms, determinacy principles, and inner-model programs all concern the search for axioms that extend or clarify the set-theoretic universe. Penelope Maddy's *Defending the Axioms* is a major philosophical account of how set theorists justify axioms not by bare self-evidence but by mathematical fruitfulness, coherence, maximization, and practice-internal criteria [@maddy-2011-defending].

This gives a more mature view:

> An axiom is not merely something unproved. It is a selected primitive commitment whose adoption is justified by the role it plays in organizing, extending, stabilizing, or explaining a mathematical domain.

Some axioms are conservative and structural. Some are powerful existence principles. Some are computationally meaningful. Some are adopted because they unify scattered results. Some are controversial because they decide questions that other mathematicians prefer to leave open. Thus axioms are instruments as much as premises.

The theorem, in turn, is a consequence inside an instrumented world. The proof is the trace showing how the instrument was used.

## 15. Homotopy type theory and univalence: equality becomes structural

Homotopy type theory and univalent foundations are among the most important recent changes in foundational thinking [@univalent-foundations-2013-hott; @pelayo-warren-2012-hott]. They combine intensional type theory with ideas from homotopy theory. In this setting, types behave like spaces, terms behave like points, and identity proofs behave like paths. Equality is no longer a flat yes/no relation; it can carry higher-dimensional structure.

Vladimir Voevodsky's univalence axiom says, roughly, that equivalent structures can be identified. More carefully, in a univalent universe, identity between types corresponds to equivalence between them. This is a powerful reorientation of foundations because mathematical practice often treats isomorphic or equivalent structures as “the same for all structural purposes.” Univalence internalizes that practice.

The impact on the triad is direct.

An axiom such as univalence is not a self-evident Euclidean postulate. It is a structural principle designed to align foundations with invariant mathematical practice. A proof in homotopy type theory may manipulate paths, equivalences, higher inductive types, and dependent types. A theorem may express not merely that objects are equal but that they are connected by structured equivalences.

The HoTT Book describes homotopy type theory as a new branch of mathematics based on a connection between homotopy theory and type theory, and highlights the way univalence and higher inductive types permit forms of reasoning not directly captured in classical set-theoretic foundations [@univalent-foundations-2013-hott]. The HoTT Library and related formalizations show that these ideas are not merely philosophical: they can be developed inside proof assistants such as Coq [@bauer-2017-hott-library].

This is a frontier because it changes the meaning of “the same,” which changes the meaning of theoremhood. If theoremhood is consequence under identity, and identity itself becomes homotopical, then the logical substrate of proof has been enriched.

## 16. The formal turn: proof assistants and theoremhood as checked artifact

The rise of proof assistants is perhaps the most visible contemporary transformation of proof. Systems such as Coq, Lean, Isabelle/HOL, HOL Light, Agda, and others allow mathematicians and computer scientists to state definitions and theorems in formal languages and construct proof objects checked by a small trusted kernel.

The four-color theorem and the Kepler conjecture are landmarks in this trajectory. Georges Gonthier's formal proof of the four-color theorem demonstrated that a historically controversial computer-assisted proof could be fully formalized [@gonthier-2008-four-color]. Thomas Hales and collaborators' Flyspeck project produced a formal proof of the Kepler conjecture, showing that even a deep, computationally heavy, geometrically intricate result could be certified [@hales-2017-kepler].

Lean's mathematical library, mathlib, represents another kind of frontier: not a single theorem, but a growing ecosystem of formalized definitions, theorems, tactics, hierarchy design, and community governance [@mathlib-community-2020]. Jeremy Avigad calls this broader shift “the formal turn,” arguing that computational proof assistants may become part of the ordinary infrastructure of mathematical rigor [@avigad-2024-formal-turn].

In this setting, theorem, axiom, and proof acquire a software-like anatomy:

- An **axiom** is a constant or primitive principle trusted by the kernel or imported from the environment.
- A **proof** is a term, script, certificate, or construction that elaborates to a kernel-checkable object.
- A **theorem** is a named declaration whose type has been inhabited and accepted by the checker.

This does not eliminate human mathematics. It changes its interface. Definitions must be engineered. Libraries must be organized. Notation must be managed. Automation must be trusted only insofar as it produces checkable proof objects. The old question “is the proof correct?” becomes partly “does the kernel accept it?” but also “are the definitions the intended ones?” and “does the formal theorem correspond to the informal theorem we care about?”

Formalization therefore sharpens rather than erases philosophical issues. It makes hidden assumptions visible. It turns dependency into data. It exposes the distance between mathematical prose and formal core.

## 17. AI-assisted theorem proving: generation meets verification

The newest frontier is the coupling of machine learning with formal proof systems. Large models can suggest proof strategies, fill gaps, search tactic states, translate informal mathematics into formal statements, or generate candidate proof terms. But informal AI-generated mathematics is unreliable when it is not checked. The important frontier is not “AI says a proof”; it is “AI proposes a proof object that a trusted checker accepts.”

AlphaProof combined reinforcement learning with formal systems inside the Lean environment and achieved strong performance on International Mathematical Olympiad-style problems, including proving several problems from the 2024 IMO set [@hubert-2025-alphaproof]. FormalProofBench, introduced in 2026, evaluates whether models can produce Lean 4 proofs for advanced undergraduate and graduate-level mathematics; the benchmark is explicitly built around formal verification rather than merely natural-language plausibility [@ravi-2026-formalproofbench]. CSLib, also introduced in 2026, aims to build a Lean library for computer-science-related theorems and verified code, analogous in ambition to mathlib's role for mathematics [@barrett-2026-cslib].

These developments refine the triad again. Axiom selection and library design become part of the training environment. Proof becomes a target object in a search space. Theoremhood becomes mechanically checkable, but theorem discovery may involve probabilistic generation. The distinction between proof and persuasion becomes urgent: a plausible proof-like text is not a proof unless it can be checked by the relevant standards.

AI-assisted proof also amplifies the importance of proof explanation. A machine may generate a correct formal proof that humans find opaque. If the theorem matters mathematically, mathematicians often still want a conceptual account: why does it work, what structure does it expose, what methods does it generalize? Thus the frontier is not only automation. It is the integration of formal certification, human explanation, and machine search.

## 18. Current research frontiers organized by the triad

The frontiers can be organized by asking what is changing about each term.

### 18.1 Frontiers of the axiom

Axioms are increasingly treated as design choices for mathematical worlds. In set theory, the question is which additional axioms best extend ZFC. In type theory, the question is which primitives preserve computational meaning while supporting ordinary and higher mathematics. In category-theoretic foundations, the question is which structural universes best support practice. In formal proof assistants, the question is which axioms are trusted by the kernel and which are imported as optional assumptions.

The frontier axiom is therefore **modular**. It can be tracked as a dependency. A formal theorem can record whether it uses choice, classical logic, quotient principles, propositional extensionality, univalence, function extensionality, or large-cardinal assumptions. The old phrase “assume the axioms” becomes a dependency profile.

### 18.2 Frontiers of the proof

Proof is splitting into several technical species:

- **Human proof:** compressed, explanatory, socially checked prose.
- **Formal proof:** machine-checkable object in a proof assistant.
- **Certificate:** compact data checked by a verifier.
- **Constructive proof:** proof with computational content.
- **Classical proof:** proof licensed by classical principles such as excluded middle.
- **Interactive proof:** proof developed through human-machine dialogue.
- **AI-assisted proof:** proof found or completed by search/generation but checked by formal rules.

The research question is how these species relate. Can a formal proof be made explanatory? Can AI-generated proof terms be translated into human concepts? Can proof assistants support the actual working habits of mathematicians? Can proof search scale to research mathematics? Can libraries be organized so that theorem proving becomes cumulative rather than brittle?

### 18.3 Frontiers of the theorem

The theorem is no longer only a line in a paper. It is increasingly a node in a dependency graph. It has imports, assumptions, universe levels, typeclass constraints, proof terms, computational behavior, and sometimes executable consequences. In a proof assistant, a theorem is a named object with a precise statement and a checked proof. In a library, it also has metadata: which definitions it uses, which earlier results it depends on, which axioms it imports.

This changes mathematical publication. A future theorem may have several layers: an informal exposition, a formal statement, a checked proof, a dependency graph, an explanatory proof sketch, and machine-readable links to prior results. The theorem becomes part of an infrastructure.

## 19. The deepest distinction: position in a consequence relation

At the highest level, theorem, axiom, and proof are not three kinds of isolated things. They are three positions in a consequence relation.

An axiom is a source-position. It is where a theory begins, not psychologically but formally. A proof is a path-position. It is the structured movement licensed by rules. A theorem is a target-position. It is the stabilized endpoint.

But any statement can move positions when the frame changes. A theorem in one theory can become an axiom in another. A proof technique can become an inference rule. A metatheorem about a proof system can become an object-level theorem in a stronger theory. A definition can conceal an axiom-like commitment. A theorem can be reproved constructively, changing the kind of proof it has. A proof can be formalized, changing its evidential status.

This positional view explains why the elementary answer is true but incomplete. “Axiom = assumed, theorem = proved, proof = derivation” is correct inside a fixed system. Research mathematics constantly changes, compares, strengthens, weakens, formalizes, interprets, and transports systems. The triad is dynamic.

## 20. Conclusion: from evident truth to engineered consequence

The historical arc can be summarized as follows.

In Greek demonstration, axioms were evident beginnings, proofs were demonstrations, and theorems were rationally secured propositions. In nineteenth-century structural mathematics, axioms became hypotheses defining possible structures, proofs became derivations of invariant consequences, and theorems became relative to systems. In Hilbertian formalism, proofs themselves became finite formal objects. In Gödelian metamathematics, theoremhood was shown not to exhaust truth. In Tarskian semantics, consequence was analyzed across models. In Gentzenian proof theory, proofs acquired internal structure. In type theory, proofs became terms and propositions became types. In category theory and homotopy type theory, equality and structure were reconfigured. In proof assistants, theoremhood is increasingly recorded as a checked artifact. In AI-assisted mathematics, proof generation and proof verification are being separated and recombined.

So the difference is simple only at the first level:

> An axiom is a starting commitment. A proof is a licensed transformation. A theorem is a stabilized consequence.

At the research level, each term names a role in the material organization of mathematical necessity. Axioms choose a world. Proofs move within it. Theorems are what become unavoidable once the movement has been made.

