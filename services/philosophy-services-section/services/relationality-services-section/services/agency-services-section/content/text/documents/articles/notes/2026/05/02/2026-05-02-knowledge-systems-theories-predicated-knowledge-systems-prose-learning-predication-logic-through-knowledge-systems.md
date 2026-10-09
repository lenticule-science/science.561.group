---
title: "Predication logic through the knowledge-systems lens — Frege to Maruyama, what each step gives the substrate"
date-created: 2026-05-02
description: "An extension of predication-as-residuation and the-adjoint-structure-of-predication-on-bilattice-valued-fibers, re-read through the knowledge-systems lens. Walks the line Frege → Lambek → Lawvere → Belnap → Fitting → Busaniche-Cignoli → Jakl → Maruyama, naming what each step contributes to the substrate and what a knowledge system gains by adopting the predication-cell over the alternatives."
extends:
  - predication-as-residuation
  - the-adjoint-structure-of-predication-on-bilattice-valued-fibers
  - the-bilattice-valued-allegory-of-relational-composition
references:
  - id: frege1879
    type: document
    title: Frege, Begriffsschrift (1879)
  - id: lambek1958
    type: document
    title: Lambek, The Mathematics of Sentence Structure (1958)
  - id: lawvere1969
    type: document
    title: Lawvere, Adjointness in Foundations (1969)
  - id: lawvere1970
    type: document
    title: Lawvere, Equality in Hyperdoctrines (1970)
  - id: belnap1977
    type: document
    title: Belnap, A Useful Four-Valued Logic (1977)
  - id: fitting1991
    type: document
    title: Fitting, Bilattices and the Semantics of Logic Programming (1991)
  - id: busaniche-cignoli2014
    type: document
    title: Busaniche & Cignoli, Twist-Products of Commutative Residuated Lattices (2014)
  - id: jakl2025
    type: document
    title: Jakl, Four Imprints of Belnap's Useful Four-Valued Logic in Computer Science (2025)
  - id: maruyama2021
    type: document
    title: Maruyama, Fibred Algebraic Semantics for Non-Classical First-Order Logics (2021)
see-also:
  - knowledge-organization-survey
  - knowledge-representation-survey
---

The predication-categories program already contains two synthesis essays on the algebraic side: [predication-as-residuation](../../../../../../../../../../content/text/documents/articles/teaching-articles/explanations/predication-as-residuation.md) walks Frege → Lambek → Lawvere → Busaniche-Cignoli; [the-adjoint-structure-of-predication-on-bilattice-valued-fibers](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/documents/articles/research-articles/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md) proves the load-bearing theorems. This essay does not duplicate them. It picks up where they leave off and reads the line through the **knowledge-systems lens**: at each step, what does a knowledge system *gain* by adopting that step's contribution as a substrate commitment, and what does it forfeit by stopping short?

## 1. Frege (1879): the unsaturated function

Frege's *Begriffsschrift* introduced the modern notion of a **predicate**: a function with an argument-place that, once filled, yields a saturated proposition. "Socrates is mortal" is not a subject-predicate-style noun-phrase plus copula plus noun-phrase; it is the application of the unsaturated function $\mathrm{mortal}(\cdot)$ to the argument $\mathrm{Socrates}$.

What a knowledge system gains by adopting this: **the storage unit becomes function-application, not name-pair**. A cell $(s, p, o)$ is not "two names with a string between them"; it is the application of the binary predicate $p$ to subject $s$ and object $o$. The cell carries the *value* of that application. This is the structural commitment that lets the substrate's value-domain be richer than $\mathbf{2}$ — the value of $p(s, o)$ can be any element of any algebra the predicate's range admits.

What is forfeited by stopping at Frege: nothing structural; this is the foundational step. Forfeit comes from stopping later.

## 2. Lambek (1958): predicate-argument combination is residuation

Lambek's *The Mathematics of Sentence Structure* proved that combination of predicate with arguments in categorial grammar is a **residuation**: the predicate's combination operation $\cdot$ admits exactly two residuals $\backslash$ (left) and $/$ (right), satisfying $a \cdot b \leq c \iff b \leq a \backslash c \iff a \leq c / b$. Galatos et al. (2007) proved that the Lambek calculus is the logic of residuated lattices.

What a knowledge system gains: **the algebra of combining cells is determined**. The substrate need not invent a separate "rule of how predication combines with arguments"; the residuation-with-implication structure is a theorem about predicate-argument interaction in any non-trivial setting where combination has order. This is the bridge from "we have a substrate of cells" to "we have an inferential calculus on the substrate" — the inferential calculus is forced by the residuation.

What is forfeited if a knowledge system stops at $\mathbf{2}$ (not adopting Belnap's bilattice): the substrate has the residuation but cannot represent multi-source disagreement. The cell's value is in $\{\mathrm{true}, \mathrm{false}\}$ and there is no place to record "asserted by source A and denied by source B." RDF and Datalog stop at this level.

## 3. Lawvere (1969, 1970): quantifiers are adjoints, predicates are fibered

Lawvere's *Adjointness in Foundations* (1969) and *Equality in Hyperdoctrines* (1970) showed that quantification is an adjunction and that the family of predicates over a context forms a **hyperdoctrine** — a contravariant functor $\mathcal{C}^{\mathrm{op}} \to \mathbf{Cat}$ whose substitution functors $f^*$ have left and right adjoints $\exists_f \dashv f^* \dashv \forall_f$.

What a knowledge system gains: **predicates are not flat; they have a category and the category indexes a fibration**. The predicate $\mathrm{cites}$ is related to the predicate $\mathrm{cites\text{-}positively}$ by a specialisation morphism in the predicate category, and the substrate's substitution along that morphism is a functor on fiber algebras. This is the structural commitment that lets the substrate represent *predicate vocabularies as content* — the predicate vocabulary is the predicate category, and the substrate operates on the vocabulary using the same machinery it operates on cells with.

What is forfeited if a knowledge system stops at *flat* predicate sets (no predicate category): predicate-level reasoning becomes an out-of-band concern. RDF Schema and OWL recover some of this with `rdfs:subPropertyOf` and `owl:inverseOf`, but the recovery is partial and not a fibration in Lawvere's sense — the substrate stays at the cell level and the predicate vocabulary lives in a separate axiom layer.

## 4. Belnap (1977): four values for multi-source knowledge

Belnap's *A Useful Four-Valued Logic* introduced the four epistemic states $\bot, t, f, \top$ as the right value-domain for a knowledge system receiving information from multiple sources that can disagree. The four values carry two independent binary channels — positive evidence (present/absent) and negative evidence (present/absent) — and the substrate inherits two natural orderings: truth ($\leq_t$, with $f$ at bottom and $t$ at top, $\bot$ and $\top$ in the middle) and knowledge ($\leq_k$, with $\bot$ at bottom and $\top$ at top).

What a knowledge system gains: **multi-source disagreement is representable, not destructive**. The cell carrying the predication "patient is allergic to penicillin" can be valued $\top$ when source A says yes and source B says no, recording the contestation as substrate content. Closure rules can propagate the contestation to dependent assertions (all derivations from $\top$-valued premises are themselves $\top$-valued unless a higher-priority source-discipline collapses the contestation).

What is forfeited if a knowledge system stops at $\mathbf{2}$: contradiction is destructive. RDF/OWL has no place to record "asserted both ways"; the contradiction either silently becomes $t$ (last-write-wins), silently becomes $\mathrm{undefined}$ (ignore-on-conflict), or trips a global inconsistency that propagates to every conclusion (ex falso quodlibet under classical entailment). The bilattice is the well-defined algebraic alternative to all three failure modes.

The decisive paper-trail for knowledge systems: Belnap's four values are *exactly the requirements* of a system that must federate with other systems whose source disciplines may conflict. A non-federating knowledge system can stop at $\mathbf{2}$; a federating one cannot.

## 5. Fitting (1991): bilattices and logic-programming semantics

Fitting's *Bilattices and the Semantics of Logic Programming* gave the **fixpoint semantics** for logic programs over bilattices. The least fixpoint of the program's immediate-consequence operator over $\mathbf{2} \otimes \mathbf{2}$ is the program's intended model; the closure machinery is monotone in $\leq_k$ (knowledge order); the construction is a direct generalisation of the Apt-Van Emden-Kowalski $\mathbf{2}$-valued semantics.

What a knowledge system gains: **closure under inference rules is well-defined on the bilattice substrate**. The substrate's [closure-driven settling](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) is *exactly* Fitting's bilattice fixpoint. Every closure-rule application is monotone in the knowledge order; the substrate's settlement runs the immediate-consequence operator to fixpoint; the result is the substrate's intended model under the chosen rule-system. The rich engineering machinery of [predicated-computing](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/engineering/theories/tech/theories/computing/theories/predicated-computing/_index.md) — the predication-graph store, the closure-rule application operator, the witness chain — is the engineering surface of Fitting's mathematical fixpoint semantics.

What is forfeited if a knowledge system stops at Datalog: the value-domain remains $\mathbf{2}$ and the contestation is not propagated. Stratified Datalog with negation-as-failure recovers some of the four-value structure, but not in a way that supports federation with other systems whose source disciplines differ.

## 6. Busaniche & Cignoli (2014): the bilattice has a residuation

Busaniche & Cignoli proved that the twist product $L \otimes L$ of any commutative residuated lattice $L$ inherits a residuated pair $\odot$ (extending) and $\Rightarrow$ (restricting) satisfying $a \odot p \leq_t q \iff p \leq_t (a \Rightarrow q)$. Instantiated on $L = \mathbf{2}$, this gives explicit operations on $\{\bot, t, f, \top\}$ — the operations that predicated-knowledge-systems uses for cell-level extension and restriction.

What a knowledge system gains: **the Lambek residuation lifts to the bilattice**. The substrate is not just $\mathbf{2}$-valued with a side-channel for negative evidence; it is a residuated structure in its own right, with $\odot$ for extending a cell's evidence by combining sources and $\Rightarrow$ for testing whether one cell's evidence implies another's under the substrate's truth ordering. The bilattice-valued allegory of relational composition (treated in [the-bilattice-valued-allegory-of-relational-composition](../../../../teaching-articles/explanations/the-bilattice-valued-allegory-of-relational-composition.md)) is the substrate's algebra of relation composition; classical relational composition embeds as a proper sub-allegory.

What is forfeited if a knowledge system stops short of Busaniche-Cignoli (e.g., uses Belnap's four values without a residuation): the substrate has the values but not the algebra. It can record contestation but cannot reason about which contestations imply which others. The bilattice without residuation is a value-domain; the bilattice with residuation is an inferential substrate.

## 7. Jakl (2025): Belnap's bilattice as a Chu space

Jakl's *Four Imprints of Belnap's Useful Four-Valued Logic in Computer Science* identified the twist construction with the **Chu construction**: $\mathbf{2} \otimes \mathbf{2} \cong \mathrm{Chu}(\mathbf{2}, 0)$. Under this isomorphism, the residuated pair $\odot \dashv \Rightarrow$ corresponds to the linear-logic multiplicative tensor $\otimes$ and linear implication $\multimap$.

What a knowledge system gains: **the substrate is a model of multiplicative linear logic**. Resource-sensitivity and contraction-failure — the central distinguishing feature of linear logic relative to classical and intuitionistic logic — are present in the substrate at the algebraic level. A predication can be *consumed* in derivation rather than copied; closure rules can have linear (use-once) and exponential (use-freely) variants; the substrate distinguishes assertion-as-resource from assertion-as-fact at the cell level. This matters when the substrate carries assertions about resources (capabilities, capacities, budgets) that must not be duplicated by inference.

The narrative [predication-fibers-as-linear-logic-models](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/prose/teaching/explanations/predication-fibers-as-linear-logic-models.md) develops this in the math program; here it suffices to note that the knowledge-systems gain is *resource-sensitive inference as a substrate primitive*, not a layer on top.

What is forfeited if a knowledge system stops short of Jakl's identification: the substrate has the residuation but not the linear-logic interpretation. Resource-sensitive reasoning becomes a discipline imposed externally rather than an algebraic feature of the substrate.

## 8. Maruyama (2021): fibered algebraic semantics

Maruyama's *Fibred Algebraic Semantics for Non-Classical First-Order Logics* gave the unifying fibered framework for non-classical first-order logics: the substrate of any non-classical first-order theory is a fiber functor from a syntactic category to a category of algebras. Specialised to the bilattice case, Maruyama's framework gives the **bilattice-valued hyperdoctrine** — the predication-categories program's central structural object.

What a knowledge system gains: **the predicate vocabulary, the predicate-category morphisms, and the bilattice value-domain combine into a single fibered algebraic structure**. This is the moment where the line stops adding individual contributions and starts being a single integrated theory. The substrate's [predication-fibration](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) is Maruyama's fibered algebraic semantics instantiated on the bilattice value-domain over the predicate category.

What is forfeited if a knowledge system stops short of Maruyama: the substrate has all the pieces but not the unification. Fitting gave the closure semantics, Busaniche-Cignoli gave the residuation, Jakl gave the linear-logic interpretation, Lawvere gave the hyperdoctrine pattern, but until Maruyama there was no single statement of "what kind of mathematical object an arbitrary bilattice-valued knowledge system is." Maruyama's framework is what lets predicated-knowledge-systems be a *theory*, not a list of features.

## 9. What knowledge systems gain by adopting the predication-cell over alternatives

The line ends — for the purposes of this synthesis — at Maruyama. A knowledge system that adopts the predication-cell substrate inherits, simultaneously:

| Step | Substrate commitment | What it forecloses |
|---|---|---|
| Frege | Cell as predicate-application, value-domain rich | None structural |
| Lambek | Combination is residuation; inferential calculus forced | Substrate-internal alternatives to residuation |
| Lawvere | Predicates are fibered; predicate vocabulary is content | Flat predicate sets, out-of-band schema |
| Belnap | Multi-source disagreement is representable | Destructive contradiction; ex falso quodlibet |
| Fitting | Closure under rules is well-defined | Ad-hoc inference engines |
| Busaniche-Cignoli | Bilattice has a residuation; substrate is inferential | Value-only bilattice without algebra |
| Jakl | Substrate is a linear-logic model | Resource-blind contraction-by-default inference |
| Maruyama | Substrate is a single fibered algebraic structure | Feature-list-without-theory framings |

The contrast with the four candidate alternatives — RDF triple, OWL axiom, FCA formal context, property-graph node-edge — is sharpest at Belnap and at Maruyama:

- **Vs. RDF triple**: RDF stops at Frege+Lambek (cell, residuation implicit) but never reaches Belnap. The triple is $\mathbf{2}$-valued; multi-source disagreement is destructive; federation requires out-of-band conflict resolution.
- **Vs. OWL axiom**: OWL stops at Lawvere (fibered predicates via subClassOf and inverseOf) but never reaches Belnap. The axiom-set is $\mathbf{2}$-valued; the closure language is fixed at design time; the four-regime classification cannot be applied because the regime is hidden inside the chosen DL fragment.
- **Vs. FCA formal context**: FCA stops at Frege (cell as $\mathbf{2}$-valued application) and recovers the Galois closure but never reaches Lawvere. The predicate vocabulary is flat (the attribute set has no internal structure); the closure operator is one specific (Galois) operator rather than an admissible family. Belohlavek's many-valued FCA recovers the value-domain richness but the predicate vocabulary remains flat.
- **Vs. property-graph node-edge**: Property graphs stop *before* Frege (the edge label is not a function-application; it is a string). They have ergonomic schema flexibility and lose all of the structure named above. Recovering even Lambek-level reasoning requires re-introducing the predicate-as-first-class commitment that property graphs traded away.

The predicated-knowledge-systems substrate is the only one of the alternatives that simultaneously honours all eight steps. The synthesis here — what each step contributes — is the audit trail for why the substrate is what it is.
