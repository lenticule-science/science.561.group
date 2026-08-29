---
title: "Draft Cross-Reference"
kind: text
---
A consolidated reference table for how the same concepts appear across the major drafts of relationality (PRE, Foundations, Treatise, Drafts 1, 4, 7, 10, 11, 12).

## Naming convention

The framework's canonical convention is **-ing verb forms** ("Differentiating", "Including", "Flowing"). The relational field is constituted through ongoing activity, and the names should reflect that. PRE uses the verb-form Differentiate / Includes / Flow; the canonical fully-gerund forms differ only in spelling.

## Vocabulary across drafts

### Stable concepts (same or near-same name everywhere)

| Canonical | Draft 1 | PRE | Foundations | Treatise | Draft 4 | Draft 11 | Draft 12 |
|---|---|---|---|---|---|---|---|
| Differentiate | including/excluding | Differentiate | distinguish | Differentiate (product of Reflex) | Differentiate (product) | (derived from Relationlessness) | Differentiate |
| Negate | — | Negate | ¬ (involution) | Negate | Negate | Negate | ¬ |
| Iterate | reflexive sequence | Iterate | (implicit) | Iterate | (implicit) | (in closure $G$) | Iterate |
| Flow | relating | Flow | comonad $C = \Box\Diamond$ | Flow (+ Dynamic Residuation) | Flow ([RITM](../terms/ritm.md)) | Flow | Flow / directed dynamics |
| Balance | — | Balance | (implicit) | Balance | (implicit) | — | Balance |
| Top / Bottom | — | $\top$ / $\bot$ | $E$ / $\emptyset$ | Relation / Relationlessness | Relation / Relationlessness | — / Relationlessness | $\top$ / $\bot$ |

### Unstable concepts (same content, different names)

| Canonical | Draft 1 | PRE | Foundations | Treatise | Draft 4 | Draft 11 | Draft 12 |
|---|---|---|---|---|---|---|---|
| Includes | inclusion | Includes | $\subseteq$ on Fix$(c)$ | Includes | (implicit) | OrderRecognition | Include |
| Excludes | exclusion | Excludes | $\cap = \emptyset$ | Excludes | (implicit) | — | Exclude |
| Together | — | Together | $\land$ (meet) | Together | Together | MeetRecognition | $\land$ |
| Either | — | Either | $\lor$ (join) | Either | Either | JoinRecognition | $\lor$ |
| Induces | — | Induces | (residuated) | Induces (+ Flow-Indexed) | (implicit) | ImplyRecognition | Induce |
| Close | coherence | Close | closure operator $c$ | Close | (implicit) | Nucleate | Closure |
| Open | — | Open | (dual of $c$) | Open | (implicit) | — | Interior |
| Necessary | — | Necessary | $\Box$ | $\Box$ | $\Box_r$ (RITM) | BoxModality | Necessity / $\Box$ |
| Possible | — | Possible | $\Diamond$ | $\Diamond$ | $\Diamond_l$ (RITM) | DiamondModality | Possibility / $\Diamond$ |
| Shape | — | Shape | $\Pi^\to$ | (implicit) | $\Pi^\to$ (RITM) | — | Shape |
| Discrete (Flat) | — | Discrete | $\Box$ | (implicit) | $\Box_r$ (RITM) | — | Flat |
| Codiscrete (Sharp) | — | Codiscrete | $\Diamond$ | (implicit) | $\Diamond_l$ (RITM) | — | Sharp |
| Global (Crisp) | — | Global | $\nabla^\leftarrow$ | (implicit) | $\nabla^\leftarrow$ (RITM) | — | Crisp |

### Concepts only in specific drafts

**Treatise (draft 3) and draft 4 only:**

- [Reflex](../terms/reflex.md) (the primitive act, distinct from Differentiate which names its product).
- [Discipline / Regime / Filter / Profile](../terms/discipline-regime-filter-profile.md) (constraint hierarchy).
- [Dynamic Residuation](../terms/dynamic-residuation.md) / Flow-Indexed Implication.
- [Relational Language](../terms/relational-language.md) ($\lambda_R$) with soundness/preservation/progress/normalization.
- [Four-Part Framework](../terms/four-part-framework.md): RelationalStructure → RelationalLanguage → RelationalGeometry → RelationalPhysics.
- [RITM](../terms/ritm.md): $\Pi^\to \dashv \Box_r \dashv \Diamond_l \dashv \nabla^\leftarrow$ with self-stabilizing property.
- RD ($\Box$-stable endofunctors, *Relational Dynamics*) / RT ($\Diamond$-stable endofunctors, *Relational Topology*).
- Relational cell: PSh($\{0 \to 1\}$) as constructive model.
- RES (Relational Expressions Syntax): S-expression format for the formal language.
- [Articulation Theorem](../theorems/articulation-theorem.md) / Reflex Emergence Lemma.

**Draft 7 only:** [MinimalCohesion](../terms/minimal-cohesion.md) HIT (Cubical Agda formalization at higher dimensions).

**Draft 0 only:** the ternary structure $\{$relating, [unrelating](../terms/unrelating.md), relating(relating, unrelating)$\}$; [Predictive Determination Principle](../terms/predictive-determination.md); [Domain](../terms/domain-emergence.md) sequence (Relating → Propagation → Alignment → Cross-Dynamics).

## Philosophy → Mathematics correspondences

The mathematical structures are not the philosophical concepts themselves. They are established formalisms that *validate* the philosophical claims — saying "Togethering corresponds to the meet in a Heyting algebra" means the philosophical requirements of coherent combining (which the derivation earns from the requirements of existing) happen to satisfy the axioms mathematicians call a Heyting algebra's meet. The math confirms that the philosophical derivation produces consistent structure.

### Movement I: Logical Origination → Complete Heyting algebra

| Philosophical concept | Mathematical correspondence | What is validated |
|---|---|---|
| [Including](../terms/includes-excludes.md) | Partial order (reflexive, transitive, antisymmetric) | Inclusions compose coherently and do not cycle |
| [Excluding](../terms/includes-excludes.md) | Bottom element in a bounded lattice | A definite state of total exclusion exists |
| [Togethering](../terms/together-either.md) | Meet ($\land$) | Combined recognitions are the strongest thing weaker than both |
| [Eithering](../terms/together-either.md) | Join ($\lor$) | Chosen recognitions are the weakest thing stronger than both |
| [Inducing](../terms/induces.md) | Heyting implication (residual of meet) | The residuation $a \land b \leq c$ iff $a \leq b \Rightarrow c$ holds |
| [Negating](../terms/negate.md) | Pseudocomplement $\neg a = a \Rightarrow \bot$ | Negation is non-Boolean ($\neg\neg a \geq a$ but may strictly exceed) |
| [Iterating](../terms/iterate.md) | $T(a) = a \land (a \Rightarrow \top)$ | Self-application is monotone and inflationary |

### Movement II: Structural Stabilization → S4 modal logic

| Philosophical concept | Mathematical correspondence | What is validated |
|---|---|---|
| [Closing](../terms/close.md) | Closure operator (monotone, inflationary, idempotent) | Stabilization converges; doesn't overshoot |
| [Opening](../terms/open.md) | Interior operator (monotone, deflationary, idempotent) | The dual of closing satisfies dual properties |
| [Balancing](../terms/balance.md) | Frobenius law $O(a \land C(b)) = O(a) \land C(b)$ | Closed-inward coheres with opened-outward |
| [Necessitating](../terms/necessary-possible.md) | S4 necessity $\Box$ | $\Box\Box a = \Box a$, $a \leq \Box a$ |
| [Possibilizing](../terms/necessary-possible.md) | S4 possibility $\Diamond$ | $\Diamond\Diamond a = \Diamond a$, $\Diamond a \leq a$ |

### Movement III: Directed Dynamics → KZ-lax idempotent monads

| Philosophical concept | Mathematical correspondence | What is validated |
|---|---|---|
| [Flowing](../terms/flow.md) | KZ-lax idempotent monad (monotone, inflationary, self-limiting) | Motion contracts under iteration; no runaway escalation |
| [Dynamic Residuation](../terms/dynamic-residuation.md) | Galois connection $F(a \land b) \leq c$ iff $a \leq F(b \Rightarrow c)$ | Residuation extends from static to dynamic |
| PreservesCore | $C(F(a)) \leq F(C(a))$ | Closure after flowing is bounded by flowing after closure |

### Movement IV: Geometric Cohesion → Cohesive toposes

| Philosophical concept | Mathematical correspondence |
|---|---|
| [Cohesive Chain](../terms/cohesive-chain.md) | Lawvere's adjoint quadruple Shape ⊣ Discrete ⊣ Codiscrete ⊣ Global |
| [Stratifying](../terms/stratifying.md) | Reedy categories with degree, latching, matching |
| Constructibility | Homotopy-colimit condition on stratified diagrams |

### Movement V: Emergent Containment → Spectral physics / Noether

| Philosophical concept | Mathematical correspondence |
|---|---|
| [States, Observables](../terms/states-observables.md) | Objects of $\mathcal{C}$ / morphisms $\rho: a \to \Omega$ |
| [Conserving](../terms/conserving.md) | Categorical Noether: symmetries → invariants |
| [Stable Envelope](../terms/stable-envelope.md) | $\text{Env}_F(a) = \Box F(a) \land \Diamond F(a)$ |
| Self-containment | $R^{**} \cong R^*$; reflexion terminates in identity |

## Note on the table style

These tables are reference data, not primary content. The canonical treatments live in the per-concept term files; the tables exist so an agent looking up *e.g.* "what does PRE call Together?" can find the answer in one place.
