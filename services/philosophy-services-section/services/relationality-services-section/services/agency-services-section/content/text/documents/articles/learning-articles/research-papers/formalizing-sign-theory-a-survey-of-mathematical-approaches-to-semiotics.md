---
title: "Formalizing Sign Theory: A Survey of Mathematical Approaches to Semiotics"
type: "text"
date-created: 2026-03-06
description: A survey of mathematical formalizations of semiotics — algebraic, functorial, topos-theoretic, and relational — assessing what each approach captures and where it falls short.
---

Abstract

A survey of mathematical formalizations of semiotics — algebraic, functorial, topos-theoretic, and relational — assessing what each approach captures and where it falls short.

Table of contents

- [1. Peirce&rsquo;s Reduction Thesis: the mathematical ground](#1-peirces-reduction-thesis-the-mathematical-ground)

- [2. Goguen&rsquo;s algebraic semiotics](#2-goguens-algebraic-semiotics)

[The framework](#the-framework)

- [Connections](#connections)

- [What it captures](#what-it-captures)

- [What it misses](#what-it-misses)

- [3. Mazzola&rsquo;s functorial semiotics](#3-mazzolas-functorial-semiotics)

[The framework](#the-framework-1)

- [What it captures](#what-it-captures-1)

- [What it misses](#what-it-misses-1)

- [4. Category theory and the semiotics of machine learning](#4-category-theory-and-the-semiotics-of-machine-learning)

[The approach](#the-approach)

- [Related work](#related-work)

- [Assessment](#assessment)

- [5. Rogers&rsquo; relational formal ontology](#5-rogers-relational-formal-ontology)

[The argument](#the-argument)

- [Assessment](#assessment-1)

- [6. Zalamea and Peircean mathematics](#6-zalamea-and-peircean-mathematics)

[Key contributions](#key-contributions)

- [Assessment](#assessment-2)

- [Additional recent work by Gangle, Caterina, and Tohme](#additional-recent-work-by-gangle-caterina-and-tohme)

- [7. Comparison and lessons](#7-comparison-and-lessons)

- [References](#references)

This survey examines how researchers have used mathematical structures — particularly category theory, algebra, and topos theory — to formalize aspects of [semiotics](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/communicating/content/language/index.md). The goal is not historical completeness but assessment: for each approach, what does the formalization capture about [sign](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/communicating/content/language/terms/sign.md) processes, and what does it miss?

The survey serves a specific purpose within this vault. The [semiotic universe](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/mathematics/objects/universes/semiotic-universe/index.md) specification constructs a formal system whose components — a Heyting algebra, modal closure, trace comonad, typed lambda calculus, closure operators — correspond to aspects of [Peircean](../../../../../../../../../../../information-science-services-section/services/semiotics-science-services-section/content/text/documents/articles/notes/peircean-semiotics.md) [semiosis](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/communicating/content/language/terms/semiosis.md). Understanding how other formalizations have approached the same material clarifies what the semiotic universe construction does that these approaches do not, and where it might learn from them.

## 1. Peirce&rsquo;s Reduction Thesis: the mathematical ground

Before examining formalizations of semiotics, the Reduction Thesis establishes a mathematical fact that any such formalization must respect: triadic relations are irreducible.

[Peirce](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/domains/general/domains/people/charles-sanders-peirce.md) claimed that (a) some triadic relations cannot be decomposed into combinations of monadic and dyadic relations, and (b) all relations of adicity four or higher can be constructed from triadic and lower relations. The [sign](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/communicating/content/language/terms/sign.md) relation — &ldquo;a represents b to c&rdquo; — is the paradigmatic irreducible triad. The teridentity relation (x = y = z) is the simplest.

Robert Burch gave the first algebraic proof in *A Peircean Reduction Thesis* (1991), constructing Peircean Algebraic Logic (PAL) and proving within it that all relations are constructible from ternary ones but not from binary and unary ones alone. Burch&rsquo;s proof relied on a restriction on graph construction that later work had to address.

Joachim Hereth Correia and Reinhard Pöschel refined and strengthened the result across several papers (2004, 2006, 2011). They removed Burch&rsquo;s restriction, introduced a proof via the teridentity, and in their 2011 *Semiotica* paper unified Peirce&rsquo;s bond algebra with natural joins from database theory and clone theory from universal algebra, giving the thesis its most comprehensive algebraic treatment.

Recent work by Sergiy Koshkin (2022, 2024) has pushed further. Koshkin introduced &ldquo;ternarity&rdquo; as a metric measuring the complexity of relating in a relation, showed that n-ary relations on infinite domains require exactly n−2 ternary relations in complete bond reductions, and developed an invariant formulation of the thesis that tracks Thirdness numerically across all relational operations — addressing the objection that traditional formulations are tied to privileged operations.

**Assessment.** The Reduction Thesis is a constraint, not a formalization of semiotics. But it constrains what a formalization can do: any framework that decomposes sign relations into pairs of dyadic relations (sign-to-object plus sign-to-interpretant) has already lost what makes the sign relation semiotic. The triadic structure must be primitive.

## 2. Goguen&rsquo;s algebraic semiotics

[Joseph Goguen](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/joseph-goguen.md) (1941–2006) developed algebraic semiotics at UC San Diego in the late 1990s and 2000s, applying the tools of algebraic specification and category theory to sign systems.

### The framework

A **sign system** in Goguen&rsquo;s formulation has five components: a signature (sorts that classify signs, operations that construct signs), a data subsignature (attribute values), axioms (equational constraints), a level ordering (part-whole hierarchy), and a priority ordering (relative saliency of constructors and arguments). The first four components constitute an algebraic theory; the level and priority orderings add semiotic-specific structure.

A **semiotic morphism** is a map between sign systems that preserves structure along five orthogonal dimensions: constructors, functions, axioms, levels, and priorities. Each dimension admits degrees of preservation, and the degree to which a morphism preserves structure serves as a quality metric for representations. Goguen&rsquo;s key insight: metaphors are semiotic morphisms, and the quality of a metaphor is measurable by how much structure the morphism preserves.

Sign systems and semiotic morphisms form an order-enriched category (a &ldquo;3/2-category&rdquo; in Goguen&rsquo;s terminology, because the hom-sets are partially ordered by the priority ordering). Within this category, **conceptual blending** — combining two sign systems that share common structure — is formalized as a **pushout** (or more generally, a colimit). The blend is the minimal sign system containing both inputs with shared structure identified.

Goguen introduced the framework in &ldquo;An Introduction to Algebraic Semiotics, with Applications to User Interface Design&rdquo; (1999) and developed it through a series of papers on semiotic morphisms (2003), information visualization (2004), theorem prover interfaces (1999), and a programmatic essay on unified concept theory (&ldquo;What is a Concept?&rdquo;, 2005).

### Connections

Goguen&rsquo;s broader mathematical work provides the framework&rsquo;s underpinning. His theory of **institutions** (with Rod Burstall, *JACM* 1992) — a category-theoretic abstraction of logical systems — supplies the mechanism for relating sign systems formalized in different logics. His **hidden algebra** (extending algebraic specification with coalgebraic behavioral semantics) handles dynamic sign systems with hidden state.

D. Fox Harrell, Goguen&rsquo;s doctoral student, continued the program as &ldquo;morphic semiotics&rdquo; in *Phantasmal Media* (MIT Press, 2013) and through the GRIOT system for computational narrative generation. The conceptual-blending-as-colimit program has been pursued by Schorlemmer and Plaza, who proved in 2021 that their amalgam-based model of computational blending is equivalent to Goguen&rsquo;s pushout model.

### What it captures

Algebraic semiotics excels at **structural comparison**: given two sign systems, it provides precise tools for measuring how well one represents the other. It handles compositionality (algebraic operations), the distinction between structure and content (levels vs. priorities), and the relationship between different sign systems (morphisms). The blending-as-colimit construction gives a principled account of how new sign systems emerge from existing ones.

### What it misses

Algebraic semiotics has no account of **semiosis as process**. Sign systems are static algebraic theories; morphisms compare them but do not model the iterative generation of [interpretants](../../../../../../../../../../../information-science-services-section/services/communication-science-services-section/services/linguistics-services-section/services/semiotics-services-section/content/text/glossary/terms/interpretant.md) from [signs](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/communicating/content/language/terms/sign.md). There are no closure operators, no fixed points, no account of how a sign process stabilizes or fails to stabilize. The framework is structural, not processual.

It also does not represent the **irreducibility of the triadic sign relation** in its mathematical structure. Signs are elements of algebras — objects in a set with operations. The three-place relation among [representamen](../../../../../../../../../../../information-science-services-section/services/communication-science-services-section/services/linguistics-services-section/services/semiotics-services-section/content/text/glossary/terms/representamen.md), object, and [interpretant](../../../../../../../../../../../information-science-services-section/services/communication-science-services-section/services/linguistics-services-section/services/semiotics-services-section/content/text/glossary/terms/interpretant.md) is described in Goguen&rsquo;s prose but is not a primitive of the mathematical framework. Semiotic morphisms are maps between sign systems, not between sign relations.

The framework was demonstrated primarily through small examples (the &ldquo;houseboat&rdquo; blend, desktop metaphors, theorem prover interfaces). Large-scale applications remain limited, and Goguen himself noted that algebraic semiotics is better at critique (analyzing existing representations) than at generation (producing new ones).

## 3. Mazzola&rsquo;s functorial semiotics

Guerino Mazzola, a mathematician and musicologist at the University of Minnesota, developed functorial semiotics as a topos-theoretic framework for sign theory, first articulated in a 2020 *Journal of Mathematics and Music* paper and expanded in *Functorial Semiotics for Creativity in Music and Mathematics* (Springer, 2022, with Dey, Chen, and Pang).

### The framework

Signs are modeled as **presheaves** — functors from an indexing category to the category of sets. This captures the idea that a sign is not a bare object but a system of relationships: the Yoneda lemma guarantees that a presheaf (and hence a sign) is determined up to isomorphism by the totality of morphisms into it. Mazzola reads this as a formalization of Peirce&rsquo;s insight that a sign is constituted by its relations.

Semiosis is modeled as **functorial transformation** — structure-preserving maps between categories of signs. The mathematical apparatus includes linearized categories derived from path categories of digraphs, the Gabriel-Zisman calculus of fractions (enabling inversion of certain morphisms to handle reversibility in semiotic processes), and the Yoneda embedding in Lawvere&rsquo;s bidual of the category of categories.

A distinctive feature is the use of **Čech cohomology** to study manifolds of semiotic entities — measuring how local semiotic structures glue together into global ones. This brings techniques from algebraic topology into sign theory.

The framework&rsquo;s primary application is **creativity**. Mazzola classifies creativity into three types and models the creative process as seven steps corresponding to categorical constructions: identifying the semiotic context, finding the critical sign, identifying conceptual &ldquo;walls,&rdquo; opening walls via a creative subcategory, and computing extended perspectives as colimits.

### What it captures

Functorial semiotics takes [Peirce&rsquo;s categories](../../../../../../../../../../../information-science-services-section/services/communication-science-services-section/services/linguistics-services-section/services/semiotics-services-section/content/text/glossary/terms/peirces-categories.md) seriously at the mathematical level. Signs are relational structures (presheaves), not bare elements. The presheaf categories are toposes, which gives access to internal Heyting algebras, subobject classifiers, and geometric logic — the same structures that appear in the semiotic universe specification. The Yoneda lemma provides a precise sense in which a sign is determined by its interpretive relationships.

The cohomological apparatus is novel: it offers tools for studying how local sign processes compose into global structures, which is relevant to understanding how [semiosis](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/communicating/content/language/terms/semiosis.md) at small scales (individual sign-interpretant chains) relates to semiosis at large scales (cultural or institutional sign systems).

### What it misses

The framework does not model **semiosis as iterative closure**. There are no closure operators, no fixed-point constructions, no account of how a sign process converges to a stable configuration. The mathematical machinery (presheaves, Čech cohomology, Yoneda embedding) is imported from algebraic geometry and topology; its correspondence to specific semiotic phenomena — beyond the general claim that signs are relational — is often asserted rather than derived. The applications remain primarily in mathematical music theory, and the framework has not been widely adopted outside Mazzola&rsquo;s research group.

The 2022 book is the most comprehensive treatment. Mazzola&rsquo;s more recent publications (2023, 2025) concern Chinese music modulation and classification of musical objects — still category-theoretic but not explicitly extending the functorial semiotics program.

## 4. Category theory and the semiotics of machine learning

Fernando Tohme, Rocco Gangle, and Gianluca Caterina published &ldquo;A category theory approach to the semiotics of machine learning&rdquo; in *Annals of Mathematics and Artificial Intelligence* (2024). This paper connects formal semiotics to contemporary machine learning.

### The approach

The paper builds on Fong, Spivak, and Tuyeras&rsquo; &ldquo;Backprop as Functor&rdquo; framework (2019) and Spivak&rsquo;s &ldquo;Learners&rsquo; Languages&rdquo; (2021), which model learners as morphisms in a category. Through the language of **coalgebras of polynomials**, the space of learners between two objects forms a **topos**. This means that logical propositions can be stated in the topos&rsquo;s internal language, enabling formal specification of what a learner knows.

The key result: there exists an **ideal universal learner** that can interpret knowledge gained about any possible function as well as about itself, and this ideal learner can be monotonically approximated by networks of increasing size. The topos structure ensures the logical expressivity needed to state and prove such results.

The semiotic analysis follows: a learner&rsquo;s knowledge is a sign (in the Peircean sense) whose interpretant is the learner&rsquo;s updated state after processing training data. Learning is semiosis — the iterative production of new interpretants (updated models) from signs (training examples). The topos structure ensures that this process has the logical properties needed for coherent reasoning about what has been learned.

### Related work

Gangle, Caterina, and Tohme have a broader program connecting Peirce to category theory. Gangle&rsquo;s *Diagrammatic Immanence: Category Theory and Philosophy* (Edinburgh University Press, 2016) develops a Peircean-Spinozist-Deleuzian philosophy using category theory. Their 2020 *Erkenntnis* paper constructs a presheaf category of cuts-only Existential Graphs and proves the resulting structure is a topos — connecting Peirce&rsquo;s diagrammatic logic to topos theory.

### Assessment

This work is significant because it connects formal semiotics to a domain (machine learning) where sign processes are computationally realized. The topos-theoretic framework provides the same algebraic structures (internal Heyting algebras, subobject classifiers) that appear in the semiotic universe specification, arrived at from a different direction. The identification of learning as semiosis is not metaphorical but structural: the same categorical constructions describe both.

The limitation is that the paper treats semiosis at the level of individual learners. It does not address how multiple learners compose, how learning processes interact, or how stable knowledge emerges from iterated semiosis — questions that would require the closure and fixed-point machinery of the semiotic universe construction.

## 5. Rogers&rsquo; relational formal ontology

Timothy Rogers (University of Toronto) has produced a series of papers (2024–2025) asking a question directly relevant to this vault&rsquo;s project: how is a relational ontology formally relational?

### The argument

Rogers distinguishes two kinds of formal ontology. A **classical formal ontology** is based on mathematical objects and classes — entities that exist independently and are then placed in relations. A **relational formal ontology** is based on mathematical signs and categories — where relating is prior to the things related.

In a relational formal ontology, the basic structures are **nodal networks**: systems of constrained iterative processes (dynamical nodes) that have individual semiotic agency within a matrix of determinate possibilities. These networks are hierarchically ordered, and their components grow through sign exchange. Rogers calls this matrix a &ldquo;semiotic scaffolding.&rdquo;

Two principles are central: (1) complex pattern [abduction](../../../../../../../../../../../information-science-services-section/services/communication-science-services-section/services/linguistics-services-section/services/semiotics-services-section/content/text/glossary/terms/abduction.md) involving hierarchies of [categories](../../../../../../../../../../../information-science-services-section/services/communication-science-services-section/services/linguistics-services-section/services/semiotics-services-section/content/text/glossary/terms/peirces-categories.md), and (2) progressive determination through **placeholder signs** — signs that initially stand in as indeterminate markers and become progressively specified through interaction.

Rogers&rsquo; published paper in *Sign Systems Studies* (2024) applies this framework to cellular digestion, showing how Peircean semiotic principles operate in biological systems — a formal model of how a cell&rsquo;s interaction with its environment constitutes a semiotic process with the logical structure of embodied generalization.

### Assessment

Rogers&rsquo; work is the most philosophically aligned with this vault&rsquo;s project. His question — how can a formal ontology be genuinely relational rather than smuggling in substance ontology through its mathematical apparatus? — is the same question the semiotic universe construction must answer. His emphasis on placeholder signs and progressive determination resonates with the semiotic universe&rsquo;s use of closure operators to model how indeterminate signs become determinate through iterated semiosis.

The limitation is that Rogers&rsquo; framework is primarily philosophical rather than constructive. He does not build a specific mathematical structure (as Goguen, Mazzola, and the semiotic universe specification do) but rather analyzes what it would mean for such a structure to be genuinely relational. His work sets criteria that a formalization should meet; it does not provide the formalization itself.

## 6. Zalamea and Peircean mathematics

Fernando Zalamea (Universidad Nacional de Colombia) has led the most sustained program of developing Peirce&rsquo;s mathematical ideas with modern tools. His edited volume *Advances in Peircean Mathematics: The Colombian School* (De Gruyter, 2023) collects work that extends Peirce&rsquo;s thought using sheaf theory, category theory, HoTT, and modal logics.

### Key contributions

Three results are directly relevant to formal semiotics:

- **Peirce&rsquo;s continuum via iterated sheaves.** Zalamea formalizes Peirce&rsquo;s non-Cantorian continuum — which Peirce demanded be generic, supermultitudinous, reflexive, and modal — as an inverse limit of ordinally iterated sheaves of real lines. This captures all four of Peirce&rsquo;s original demands in a single construction. The sheaf-theoretic approach is significant because it treats continuity as a *local-to-global* phenomenon, the same perspective that sheaf semantics brings to the interactive semioverse.

- **Existential graphs extended to intuitionistic logics.** The Colombian school introduces a new geometric symbol for intuitionistic implication within Peirce&rsquo;s existential graphs system, extending their scope beyond classical logic. Since the semiotic universe is built on Heyting (intuitionistic) algebras rather than Boolean ones, this extension is directly relevant: it means Peirce&rsquo;s own diagrammatic logic can express the non-classical reasoning that the semiotic universe requires.

- **Proofs of the pragmaticist maxim.** Several papers in the collection subformalizeand prove versions of Peirce&rsquo;s pragmaticist maxim using category theory and HoTT techniques. The pragmaticist maxim — that the meaning of a concept is the totality of its conceivable practical effects — is the philosophical antecedent of the semiotic universe&rsquo;s fusion condition: a structure is fusion-saturated when every available meaning has a syntactic name and every syntactic identification is semantically grounded.

### Assessment

Zalamea&rsquo;s program is the most mathematically ambitious engagement with Peirce&rsquo;s own mathematical ideas. Where Goguen and Mazzola apply category theory *to* semiotics, Zalamea develops the mathematics that Peirce himself was reaching toward. The sheaf-theoretic and HoTT apparatus is more advanced than the order-theoretic tools the semiotic universe specification uses, and future work might profitably connect the semiotic universe&rsquo;s Heyting algebra to the sheaf-theoretic continuum.

The limitation: the Colombian school&rsquo;s papers are primarily foundational mathematics (continuum theory, graph theory, modal logic) rather than constructions aimed at capturing semiotic processes. They develop Peirce&rsquo;s mathematical legacy without always closing the loop back to sign theory.

### Additional recent work by Gangle, Caterina, and Tohme

Beyond the machine learning paper (Section 4), this group published &ldquo;Combinators as Presheaves&rdquo; (2024), formalizing the syntax of combinators using presheaves over a category of generic figures. This extends their program of connecting Peirce&rsquo;s diagrammatic philosophy to presheaf categories and provides tools for formalizing syntax in a categorically native way — relevant to the semiotic universe&rsquo;s typed lambda calculus.

## 7. Comparison and lessons

Approach
Mathematical tools
Models semiosis as process?
Handles triadic irreducibility?
Fixed-point / closure?

Goguen
Algebraic specification, 3/2-categories, colimits
No
Described, not formalized
No

Mazzola
Presheaves, toposes, Čech cohomology
Partially (functorial transformation)
Yes (presheaf = relational structure)
No

Tohme/Gangle/Caterina
Coalgebras of polynomials, toposes
Partially (learning as semiosis)
Yes (topos internal logic)
No

Zalamea
Sheaves, HoTT, modal logics, existential graphs
Partially (pragmaticist maxim)
Develops Peirce&rsquo;s own apparatus
Not directly

Rogers
Philosophical analysis, nodal networks
Described (progressive determination)
Yes (central concern)
Described, not constructed

Semiotic universe
Heyting algebra, closure operators, typed λ-calculus
Yes (three closure operators, least fixed point)
Yes (category of sign relations)
Yes

The comparison reveals a pattern. Category-theoretic approaches (Goguen, Mazzola, Tohme et al.) provide structural tools — they can describe sign systems, relate them, and reason about their logical properties. But none of them models semiosis as an iterative process that converges to a stable structure. The semiotic universe specification does this through its three closure operators (semantic, syntactic, fusion) and their least fixed point. This is its distinctive contribution.

The semiotic universe specification now motivates each mathematical component in Peircean terms: the category of sign relations as a domain of meanings ordered by containment, the Heyting algebra as constructive logic (meaning is not classically decidable), the modal closure jj as [habit](../../../../../../../../../../../information-science-services-section/services/communication-science-services-section/services/linguistics-services-section/services/semiotics-services-section/content/text/glossary/terms/habit.md)-formation (the ultimate logical [interpretant](../../../../../../../../../../../information-science-services-section/services/communication-science-services-section/services/linguistics-services-section/services/semiotics-services-section/content/text/glossary/terms/interpretant.md)), the trace comonad GG as the sign chain (unlimited [semiosis](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/communicating/content/language/terms/semiosis.md) — each interpretant carries the history of the signs that produced it), and the three closure operators as semantic growth, syntactic growth, and fusion (the reconciliation of what can be said with what can be meant). The [from-signs-to-formal-structure](../../../../../../../../../../../information-science-services-section/services/semiotics-science-services-section/content/text/documents/articles/notes/from-signs-to-formal-structure.md) curriculum provides the pedagogical bridge.

Remaining gaps: the semiotic universe does not engage with Zalamea&rsquo;s sheaf-theoretic continuum, which might provide a richer account of the continuity of [semiosis](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/communicating/content/language/terms/semiosis.md) than the order-theoretic framework currently allows. It also does not incorporate the presheaf-based formalization of syntax that Gangle, Caterina, and Tohme have developed. These connections are directions for future work, not deficiencies of the current construction.

## References

- Burch, Robert. *A Peircean Reduction Thesis: The Foundations of Topological Logic*. Lubbock: Texas Tech University Press, 1991.

- Hereth Correia, Joachim, and Reinhard Pöschel. &ldquo;The Teridentity and Peircean Algebraic Logic.&rdquo; In *Contributions to General Algebra 17*, pp. 230–247, 2006.

- Hereth Correia, Joachim, and Reinhard Pöschel. &ldquo;Peircean Algebraic Logic and Peirce&rsquo;s Reduction Thesis.&rdquo; *Semiotica* 186 (2011): 141–167.

- Koshkin, Sergiy. &ldquo;Is Peirce&rsquo;s Reduction Thesis Gerrymandered?&rdquo; *Transactions of the Charles S. Peirce Society* 58, no. 4 (2022).

- Koshkin, Sergiy. &ldquo;Logical Reduction of Relations: From Relational Databases to Peirce&rsquo;s Reduction Thesis.&rdquo; *Logic Journal of the IGPL* 32, no. 5 (2024): 779–809.

- Goguen, Joseph. &ldquo;An Introduction to Algebraic Semiotics, with Applications to User Interface Design.&rdquo; In *Computation for Metaphor, Analogy and Agents*, Springer LNAI 1562, pp. 242–291, 1999.

- Goguen, Joseph. &ldquo;What is a Concept?&rdquo; In Dau, Mugnier, and Stumme, eds., *Conceptual Structures: Common Semantics for Sharing Knowledge*, Springer, pp. 52–77, 2005.

- Goguen, Joseph, and Rod Burstall. &ldquo;Institutions: Abstract Model Theory for Specification and Programming.&rdquo; *Journal of the ACM* 39, no. 1 (1992): 95–146.

- Schorlemmer, Marco, and Enric Plaza. &ldquo;A Uniform Model of Computational Conceptual Blending.&rdquo; *Cognitive Systems Research* 65 (2021): 118–137.

- Harrell, D. Fox. *Phantasmal Media: An Approach to Imagination, Computation, and Expression*. Cambridge, MA: MIT Press, 2013.

- Mazzola, Guerino. &ldquo;Functorial Semiotics for Creativity.&rdquo; *Journal of Mathematics and Music* 14, no. 1 (2020): 66–105.

- Mazzola, Guerino, Sangeeta Dey, Zilu Chen, and Yan Pang. *Functorial Semiotics for Creativity in Music and Mathematics*. Springer, 2022.

- Tohme, Fernando, Rocco Gangle, and Gianluca Caterina. &ldquo;A Category Theory Approach to the Semiotics of Machine Learning.&rdquo; *Annals of Mathematics and Artificial Intelligence* (2024).

- Gangle, Rocco. *Diagrammatic Immanence: Category Theory and Philosophy*. Edinburgh: Edinburgh University Press, 2016.

- Gangle, Rocco, Gianluca Caterina, and Fernando Tohme. &ldquo;A Generic Figures Reconstruction of Peirce&rsquo;s Existential Graphs (Alpha).&rdquo; *Erkenntnis* (2020).

- Rogers, Timothy. &ldquo;A Formal Model of Primitive Aspects of Cognition and Learning in Cell Biology as a Generalizable Case Study of the Threefold Logic of Peircean Semiotics in Natural Systems.&rdquo; *Sign Systems Studies* 52, no. 1/2 (2024): 8–48.

- Zalamea, Fernando, ed. *Advances in Peircean Mathematics: The Colombian School*. Peirceana 7. Berlin: De Gruyter, 2023.

- Gangle, Rocco, Gianluca Caterina, and Fernando Tohme. &ldquo;Combinators as Presheaves.&rdquo; Preprint, 2024.

- Nöth, Winfried. &ldquo;Habits, Habit Change, and the Habit of Habit Change According to Peirce.&rdquo; In *Consensus on Peirce&rsquo;s Concept of Habit*, edited by Donna West and Myrdene Anderson. Springer, 2016.

- Haydon, Nathan. &ldquo;Modernizing Peirce&rsquo;s Existential Graphs.&rdquo; *Transactions of the Charles S. Peirce Society* 60, no. 4 (2025): 357–388.
