---
id: satisfies
description: "Satisfaction is a relation M ⊨ φ — structure M satisfies formula φ — asserting that φ is true in M under the given interpretation. Satisfaction is the fundamental semantic relation of model theory: it connects the syntactic level (formulas, specifications, types) to the semantic level (structures, models, implementations). Satisfaction is not derivability (M ⊨ φ is a semantic fact about M; ⊢ φ is a syntactic fact about proofs) and not refinement (refinement relates two specifications at the same level; satisfaction relates a concrete structure to an abstract specification)."
defines: Satisfies
related: Refines, Extends, Derivation, ModelTheory, TarskiTruth, Kripke
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  structure: relational-universe
  formula: relational-universe
output: relational-universe
ast:
  truth-in-model:
    - structure
    - formula:
        - interpretation:
            - structure
---

# Satisfies

## Formal definition

**Satisfaction** is a binary relation $\mathcal{M} \models \varphi$ between a **structure** $\mathcal{M}$ and a **formula** $\varphi$:

$$\mathcal{M} \models \varphi \quad \text{(read: } \mathcal{M} \text{ satisfies } \varphi \text{, or } \varphi \text{ is true in } \mathcal{M}\text{)}$$

where:
- $\mathcal{M}$ is a **structure** (or **model**) — a mathematical object that interprets a formal language: a set $M$ (the domain, or universe) together with interpretations $f^\mathcal{M}$ for each function symbol $f$, relations $R^\mathcal{M}$ for each predicate $R$, and constants $c^\mathcal{M}$ for each constant symbol $c$
- $\varphi$ is a **formula** — a syntactic expression in a formal language, built from atomic propositions by logical connectives and quantifiers
- $\mathcal{M} \models \varphi$ holds iff $\varphi$ is **true** in $\mathcal{M}$ — the formula's claim is realized by the structure's actual interpretation

Satisfaction crosses the **syntax-semantics boundary**: formulas live in the syntactic realm of proofs and derivations; structures live in the semantic realm of mathematical objects. Satisfaction is the relation that bridges them.

**Tarski's recursive definition** (see below) defines $\mathcal{M} \models \varphi$ by structural induction on $\varphi$. The definition is **compositional**: the truth of a complex formula in $\mathcal{M}$ is determined by the truth of its subformulas.

**Satisfiability vs validity**: $\varphi$ is **satisfiable** iff $\exists \mathcal{M} : \mathcal{M} \models \varphi$ — some model makes $\varphi$ true. $\varphi$ is **valid** (or a tautology) iff $\forall \mathcal{M} : \mathcal{M} \models \varphi$ — every model makes $\varphi$ true. Gödel's completeness theorem: $\varphi$ is valid iff $\varphi$ is provable from the axioms of first-order logic.

## Tarski's formal definition of truth

Alfred Tarski (*The Concept of Truth in Formalized Languages*, 1936) gave the first rigorous formal definition of truth (satisfaction) for a first-order language $\mathcal{L}$. The definition is inductive on the structure of formulas:

Let $\mathcal{M} = (M, \ldots)$ be a structure and $s : \mathrm{Var} \to M$ a **variable assignment**. Satisfaction with respect to $\mathcal{M}$ and $s$:

- **Atomic**: $\mathcal{M} \models_s R(t_1, \ldots, t_n)$ iff $(t_1^{\mathcal{M},s}, \ldots, t_n^{\mathcal{M},s}) \in R^\mathcal{M}$, where $t^{\mathcal{M},s}$ is the value of term $t$ under $\mathcal{M}$ and $s$
- **Negation**: $\mathcal{M} \models_s \neg\varphi$ iff $\mathcal{M} \not\models_s \varphi$
- **Conjunction**: $\mathcal{M} \models_s \varphi \wedge \psi$ iff $\mathcal{M} \models_s \varphi$ and $\mathcal{M} \models_s \psi$
- **Universal quantifier**: $\mathcal{M} \models_s \forall x. \varphi$ iff for every $m \in M$: $\mathcal{M} \models_{s[x \mapsto m]} \varphi$

Tarski's definition is **eliminativist** about truth: "snow is white" is true iff snow is white. Truth is not a property added to propositions; it is determined recursively by the structure's actual contents. The T-schema $\ulcorner\varphi\urcorner$ is true iff $\varphi$ is the formal embodiment of this eliminativism.

**The liar paradox**: Tarski showed that a language containing its own truth predicate must be inconsistent (Liar: "This sentence is false"). Tarski's solution: object language (formulas about the world) must be separated from metalanguage (formulas about truth in the object language). The satisfaction predicate $\mathcal{M} \models \varphi$ is a metalanguage relation.

## Gödel completeness and model existence

Kurt Gödel (*The Completeness of the Axioms of the Functional Calculus of Logic*, 1930) proved:

**Completeness theorem**: for first-order logic, if $\varphi$ is true in every model ($\models \varphi$), then $\varphi$ is provable from the axioms ($\vdash \varphi$). Equivalently: if $\Gamma$ is satisfiable (has a model), then $\Gamma$ is consistent (no contradiction derivable).

**Compactness theorem** (consequence of completeness): if every finite subset of $\Gamma$ is satisfiable, then $\Gamma$ itself is satisfiable. Compactness is the key tool for constructing non-standard models: the non-standard integers (models of Peano arithmetic with infinite elements) and non-standard analysis (models with infinitesimals) are constructed using compactness.

**Löwenheim-Skolem theorem** (Löwenheim 1915, Skolem 1920): if a first-order theory has an infinite model, it has models of every infinite cardinality. Satisfaction is not categorical — a theory does not uniquely determine its models up to isomorphism (for infinite structures). The only complete first-order theories are those with a unique (up to isomorphism) countable model in the $\omega$-categorical case (Ryll-Nardzewski theorem).

## Kripke semantics: satisfaction in possible worlds

Saul Kripke (*A Completeness Theorem in Modal Logic*, 1959; *Semantical Considerations on Modal Logic*, 1963) extended Tarski's truth definition to modal logics using **Kripke models**:

A **Kripke model** $\mathcal{K} = (W, R, V)$ satisfies a modal formula $\Box\varphi$ at world $w$:

$$\mathcal{K}, w \models \Box\varphi \quad\text{iff}\quad \forall v : wRv \Rightarrow \mathcal{K}, v \models \varphi$$

Satisfaction in Kripke semantics is **world-relative**: the same formula $\varphi$ may be satisfied at some worlds and not others. The satisfaction relation $\mathcal{K}, w \models \varphi$ is a relation between a pointed model $(K, w)$ and a formula, not just between a model and a formula.

**Global satisfaction**: $\mathcal{K} \models \varphi$ iff $\mathcal{K}, w \models \varphi$ for all $w \in W$ — the formula is satisfied everywhere. **Local satisfaction**: $\varphi$ is satisfiable at $w$ iff $\mathcal{K}, w \models \varphi$ for some model $\mathcal{K}$.

Kripke's semantics extends to: **temporal logics** (worlds are time points; $R$ is temporal precedence), **intuitionistic logic** (worlds are information states; $R$ is information extension; truth is monotone along $R$), and **provability logic** (worlds are formal theories; $R$ is stronger theory).

## Cohen's forcing: satisfaction under construction

Paul Cohen (*The Independence of the Continuum Hypothesis*, 1963) invented **forcing** as a method for constructing new models of set theory by extending existing ones:

A **forcing condition** $p \in \mathbb{P}$ (a partial order) **forces** a formula $\varphi$ ($p \Vdash \varphi$) if in any generic extension $M[G]$ of the ground model $M$ (where $G$ is an $M$-generic filter), $M[G] \models \varphi$.

Forcing can be understood as a world-relative satisfaction relation where the worlds are forcing conditions and the accessibility relation is the partial order: $p \Vdash \varphi$ means $\varphi$ is "true" (satisfied) at all possible completions of the partial information in $p$. This is the constructive reading: $p$ forces $\varphi$ if any completion of $p$ to a fully determinate model satisfies $\varphi$.

The forcing lemma (the fundamental theorem of forcing): $M[G] \models \varphi(\tau_1, \ldots, \tau_n)$ iff some $p \in G$ forces $\varphi(\tau_1, \ldots, \tau_n)$ (in terms of the names $\tau_i$ for the relevant elements). Forcing reduces satisfaction in the generic extension to a condition on the forcing poset — making model construction syntactically tractable.

## Open questions

- Whether the model-theoretic satisfaction relation $\mathcal{M} \models \varphi$ has a direct formalization within the sheaf topos $\mathbf{Sh}(T, J)$ — whether structures $\mathcal{M}$ correspond to global sections of the relevant presheaf and satisfaction $\mathcal{M} \models \varphi$ corresponds to the global section belonging to the subobject of the sheaf classified by $\varphi$.
- Whether Cohen's forcing relation ($p \Vdash \varphi$) corresponds to a form of local satisfaction in the history fiber — whether a forcing condition $p$ corresponds to a partial history, and forcing a formula at $p$ means the formula is satisfied by the history fiber at all histories extending $p$.
- Whether the Löwenheim-Skolem theorem (satisfaction is not categorical) has a sheaf-theoretic analogue — whether the sheaf $\mathbf{Sh}(T, J)$ can have multiple non-isomorphic global sections satisfying the same sheaf-theoretic specification, and whether this corresponds to non-categoricity.
- Whether the hyperintensional content of satisfaction (Stalnaker, Fine) — where two logically equivalent formulas $\varphi$ and $\psi$ may be "satisfied by" a structure in different senses (the structure may contain evidence for $\varphi$ without containing evidence for $\psi$) — requires extending Tarski's definition to a non-extensional satisfaction relation.
