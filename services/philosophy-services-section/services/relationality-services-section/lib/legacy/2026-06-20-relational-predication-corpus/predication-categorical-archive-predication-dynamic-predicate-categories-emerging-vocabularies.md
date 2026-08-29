---
type: question
class: bridge
status: open
explores:
  - predicate-category
  - predicate-set
  - parameter-base-category
  - predication-settling
  - multi-observer-system
  - predication-settling-base-morphism
---

# Dynamic predicate categories for emerging swarm vocabularies

The corpus's [predicate category](../objects/predicate-category.md) $\mathcal{C}$ is fixed at base-instantiation time and does not evolve. Predicates are defined upfront; the four-generator structure operates on a fixed predicate set $\Pi = \mathrm{Ob}(\mathcal{C})$.

Most realistic agent populations *evolve their vocabulary*. Swarms of LLM agents introduce new concepts mid-task; learning agents discover new predicates from data; multi-agent communication protocols amend their message-types over time. Inductive-logic-programming, ontology-learning, and emerging-language literatures all treat predicate-creation as a first-class event.

The corpus has no machinery for time-varying predicate categories. The [predication-settling base-morphism](../morphisms/predication-settling-base-morphism.md) supports cross-base predicate-category functors $\pi : \mathcal{C} \to \mathcal{C}'$, but as cross-base data, not as within-settling evolution. This question sets up the work to extend the corpus with dynamic predicate categories for emerging-vocabulary swarm modeling.

## What the corpus has

- The [predicate category](../objects/predicate-category.md) $\mathcal{C}$, fixed.
- The [predicate set](../objects/predicate-set.md) $\Pi$, fixed.
- The [parameter base category](../objects/parameter-base-category.md) $\mathbf{B}$ — already a category of bases; its predicate-category factor admits functors but at the cross-base level.
- The [predication-settling base-morphism](../morphisms/predication-settling-base-morphism.md) — has predicate-category-functor data.
- No object representing time-varying $\mathcal{C}_\tau$ within a single settling.
- No closure-rule for predicate creation.

## What the public literature has that this question needs to read

- **Inductive logic programming** — Muggleton, De Raedt, Cropper. Foundational ILP literature on automated predicate-discovery from data.
- **Ontology learning** — Maedche, Staab; the AI / Semantic Web literature on automated ontology construction.
- **Predicate invention in ILP** — Cropper et al, *Inductive logic programming at 30*. Specifically on the algorithmic creation of new predicates.
- **Emerging communication protocols in MARL** — recent line on agents learning to communicate, where messages have learned semantics.
- **Conceptual spaces** — Gärdenfors; cognitive-science framework for emerging concept-formation.
- **Type theories with universe polymorphism** — for the foundational side of evolving "what predicates exist."
- **Categorical type theories** — the natural framework for type families that evolve.
- **Functor categories and dynamic logical theories** — Lawvere's algebraic theories presented categorically; the natural foundation for predicate-category-evolution.
- **Recent agentic-AI work on emergent conceptual structure** — LLM agents that develop shared task-vocabularies during collaboration.

## The question

How does the corpus's predication-settling apparatus extend to a setting where the predicate category $\mathcal{C}_\tau$ varies with the settling step $\tau$, and what does the resulting machinery say about emerging-vocabulary swarm populations — agents that learn new predicates, develop new communication protocols, evolve their conceptual structure?

## Sub-questions

### (11a) Time-varying predicate-category framings

Three candidate framings:

- **Filtration of predicate categories** — $\mathcal{C}_\tau \subseteq \mathcal{C}_{\tau+1}$ as a filtration of small categories, with new predicates added monotonically.
- **Pseudo-functor on $\lambda$** — $\mathcal{C}_{(-)} : \lambda \to \mathbf{Cat}$ as a pseudo-functor; transitions $\mathcal{C}_\tau \to \mathcal{C}_{\tau+1}$ are predicate-category morphisms.
- **Indexed predicate category** — a single ambient category indexed over the settling axis, with each fiber being the predicate-category at that step.

The filtration framing is the simplest extension; it preserves $\leq_k$-monotonicity trivially because no predicate is removed. The pseudo-functor framing accommodates predicate *removal* and *renaming*. The indexed framing is structurally cleanest but requires more foundational rework.

### (11b) Predicate-creation events as closure-rule firings

In the filtration framing, each new predicate $p \in \mathcal{C}_{\tau+1} \setminus \mathcal{C}_\tau$ is *created* at step $\tau+1$. This creation can be encoded as a meta-level closure-rule firing: a rule whose consequent is "introduce a new predicate with [specified arity, generators, fiber-algebra structure]."

Sub-question 11b asks: extend the [closure-rule language](teaching/explanations/closure-rule-language.md) to support predicate-creation rules. The technical question is whether predicate-creation can be uniformly described in the rule-language or whether it requires a meta-rule level (a *2-level* closure system: rules that fire on cell-values + meta-rules that fire on predicate-category structure).

### (11c) Cohomological invariants under vocabulary evolution

The bitopological settling site is built from the predicate category. With $\mathcal{C}_\tau$ varying, the site itself becomes time-varying, and the cohomology must accommodate vocabulary evolution.

Sub-question 11c asks: define the bitopological settling site for time-varying $\mathcal{C}_\tau$, and identify whether the [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) has a well-defined limit form. The expected pattern: filtration-style vocabulary evolution gives a direct system of bitopological sites; the cohomology is the colimit. (This structurally parallels [dynamic-entity-set question](dynamic-entity-set-open-world-swarms.md) sub-question 9c.)

### (11d) Inductive-logic-programming as a corpus closure system

Inductive logic programming is, structurally, *closure-rule generation*: given a partial set of facts and a set of "background" predicates, ILP discovers new closure rules and (sometimes) new predicates. The corpus's closure-rule-system framework is structurally compatible.

Sub-question 11d asks: identify ILP as a specific class of closure systems with predicate-creation. Concrete deliverable: take a worked ILP example (Muggleton's chess-endgame predicate, or a recent neuro-symbolic predicate-invention example) and translate it into the corpus's framework with dynamic predicates.

### (11e) Emerging communication protocols as predicate-evolution

In multi-agent communication-learning literature, agents develop a shared message-vocabulary over training. Each "message-type" is a predicate; learning a new message-type is predicate-creation.

Sub-question 11e asks: state and (sketch) prove a *convergence theorem for emerging-vocabulary swarms*: under specified conditions, an agent population's predicate-category $\mathcal{C}_\tau$ stabilizes (reaches a vocabulary fixed-point), and the corresponding multi-observer system converges to consensus on the stabilized vocabulary.

This is the most directly application-relevant sub-question for LLM-agent / MARL-with-communication-learning settings.

## What would settle the question

Five deliverables:

1. **Time-varying predicate-category object** (11a).
2. **Predicate-creation rule semantics** (11b).
3. **Time-varying bitopological site cohomology** (11c).
4. **ILP-as-corpus-closure-system theorem** (11d).
5. **Emerging-vocabulary convergence theorem** (11e).

Deliverables 1–2 are session-to-cluster scale. Deliverables 3–4 are cluster-scale. Deliverable 5 is research-program-scale.

## Why this question

The corpus's static predicate-category is a structural assumption that limits engagement with: ILP, ontology learning, emerging-communication MARL, and most LLM-agent collaborative settings (where agents introduce new concepts mid-task). Lifting it gives the corpus's bilattice / cohomological apparatus access to:

- *Inductive predicate-discovery* with cohomological convergence guarantees.
- *Emerging-communication-protocol* swarms with paraconsistent vocabulary-disagreement (different agents propose different predicate-meanings; bilattice values record the disagreement).
- *Vocabulary-evolution invariants* — colimit-of-cohomologies-style invariants of predicate-category dynamics.

What the corpus's machinery would yield:

- *Bilattice-valued ILP* — paraconsistent ILP that handles inconsistent training data without trivializing.
- *Cohomological convergence guarantees* for emerging-communication MARL — currently an empirical-only field.
- *Refined moduli classification* of evolving-vocabulary swarms via predicate-category-extension morphisms.

## Position in the program

This question is **not in the existing [agentic-swarm-theory study plan](prose/teaching/explanations/toward-agentic-swarm-theory.md)**. It is a foundational extension addressing emerging-vocabulary settings the plan does not currently consider.

It interlocks with:

- [Dynamic-entity-set question](dynamic-entity-set-open-world-swarms.md) — both add time-variation to the parameter base.
- [Bilattice K-axiom question](bilattice-k-axiom-multi-agent-epistemic.md) — vocabulary evolution in epistemic settings.
- [Higher-arity hyperedge question](higher-arity-hyperedge-swarm-predication.md) — emerging predicates may have higher arity than existing ones.

This question stays `open` until 11a settles a working time-varying predicate-category framing.
