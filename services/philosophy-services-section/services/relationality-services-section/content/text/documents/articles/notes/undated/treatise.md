---

title: Treatise on Relationality
verison: 0.1.0
description: "This document presents a canonical, frame-agnostic foundation of relational mathematics in four parts:"
---

# Treatise of Relationality

This document presents a canonical, frame-agnostic foundation of relational mathematics in four parts:

- Relational Structure
- Relational Language
- Relational Geometry
- Relational Physics

All concepts are defined internally in a purely relational vocabulary, starting from Relationlessness and a primitive act of Reflex.

Naming Convention. Formal concepts are named in CamelCase without spaces (e.g., RelationalStructure, RelationalLanguage, RelationalGeometry, RelationalPhysics) and are introduced by explicit Definitions before use. Section headings may use natural language. Cross-references use explicit names (e.g., “Residuation Law Lemma”, “Flow–Nucleus Compatibility Proposition”) rather than numeric labels.

## Relational Structure

The goal of this section is to derive the core algebraic data of relationality from Relationlessness and Reflex and obtain a Heyting algebra of recognitions.

### Origination

#### Definition — Relationlessness

Relationlessness is the void of relation — the absence of any distinction, recognition, or structure. It carries no data.

#### Definition — Reflex

Reflex is the first act that brings forth a recognition from Relationlessness by drawing a distinction. Reflex may iterate; each act produces or refines recognitions.

#### Theorem — Articulation

Effective articulation (including denial) manifests as a recognition.
Proof. To describe the state “without relation” is to effect an exclusion between “relation” and “this field.” Exclusion is relational in form, hence it constitutes a recognition. Therefore, from the very definability of relationlessness, at least one recognition is induced.

### Derivation of Reflex from Relationlessness

#### Definition — Exclusion Recognition

An Exclusion Recognition is a recognition whose content is “not-with”: it marks off what is excluded from what it is excluded by. Exclusion is relational in form (it relates an interior to an exterior by denying overlap).

#### Lemma — Reflex Emergence

Assume Relationlessness. Then there exists at least one recognition; consequently there exists an act that brings a recognition forth from Relationlessness. We call this act Reflex.
Proof. By the Articulation Theorem, articulating relationlessness induces a recognition (an Exclusion Recognition). Therefore, the field is not empty of recognitions. Let Reflex be the minimal act witnessing this genesis: the act that, from Relationlessness, yields that first recognition. ∎

#### Corollary — First Recognition Exists

Under the hypotheses of the Reflex Emergence Lemma, the collection R of recognitions is nonempty.

#### Proposition — Iterability of Reflex

Under the Reflex Emergence Lemma, describing the outcome of Reflex is itself a description; by the Articulation Theorem, it too constitutes a recognition. Hence the same genesis‑by‑articulation applies to the newly available content. It follows that Reflex can iterate on its own outputs, though idempotence is not implied.

### Reflex Iteration and Derived Behaviors

#### Definition — Reflex Step Endomap

Fix a RelationalStructure RStruct. A Reflex step is a designated endomap S : R → R that models one reflexive articulation on recognitions. When stated, results about S will assume monotonicity (x ≤ y ⇒ S(x) ≤ S(y)).

#### Definition — Iterates of S

Define S^0(x) := x and S^{n+1}(x) := S(S^n(x)).

#### Theorem — Iteration

For any recognition x and any n ∈ ℕ, S^n(x) is a recognition (i.e., S^n(x) ∈ R).
Proof. By induction on n. Base n=0: S^0(x)=x ∈ R. Step: if S^n(x) ∈ R, then by the Articulation Theorem, applying S yields a recognition; hence S^{n+1}(x) ∈ R.

#### Definition — Stabilization Depth and Persistence

A recognition x stabilizes (persists) under S if there exists N ∈ ℕ such that for all n ≥ N, S^{n+1}(x) = S^n(x). Write Persist_S(x) for this property. Any y := S^n(x) with n ≥ N is then a fixed point of S.

#### Definition — Baseline Convergence (Relative to ⊥)

Say x collapses (relative to ⊥) under S if there exists N ∈ ℕ such that for all n ≥ N, S^n(x) = S^n(⊥).

#### Definition — Iterative Persistence, Baseline Limit, Eventual Equivalence

- Iterative Persistence: Persist_S(x) holds.
- Baseline Limit: the eventual limit of the S-sequence when x converges to the ⊥-baseline; notation x↘ (defined only when baseline convergence holds). This limit is distinct from the Heyting pseudocomplement ¬x := (x ⇒ ⊥).
- Eventual Equivalence: x ≡_S y if there exists N such that for all n ≥ N, S^n(x) = S^n(y).

#### Proposition — Eventual Equivalence is an Equivalence Relation

Eventual Equivalence is reflexive, symmetric, and transitive.
Proof. Reflexive: take N=0. Symmetric: equality is symmetric. Transitive: if S^n(x)=S^n(y) for all n≥N and S^n(y)=S^n(z) for all n≥M, then for all n≥max(N,M), S^n(x)=S^n(z).

#### Existence Schemas for S-Persistent Recognitions

- If S is idempotent, every x persists with N=0.
- If S is inflationary (x ≤ S(x)) and R is ω‑complete, then each x has a least fixed point l = ⋁_{n} S^n(x) with S(l)=l (Fixed‑Point Existence Theorem in Relational Geometry).
- If S is deflationary (S(x) ≤ x) and R is ω‑op‑complete, then each x has a greatest post‑fixed point r = ⋀_{n} S^n(x) with S(r)=r.

These behaviors capture stabilization and baseline‑convergence as rigorous, internal constructions parameterized by the chosen endomap S.

### Recognitions and Order

#### Definition — Recognition

A Recognition is any pattern made available by Reflex. Let R denote the class of recognitions.

#### Definition — Order

For x, y ∈ R, write x ≤ y and read “x is at least as recognizing as y” iff any context recognized by x is also recognized by y. Intuitively, x is included in y as a region of recognition.

#### Definition — Extremes

Define ⊥ ∈ R to be the recognition of nothing (the null pattern), and ⊤ ∈ R to be the total recognition (the trivially satisfied pattern).

#### Lemma — Preorder

The relation ≤ is reflexive and transitive.
Proof. Reflexivity: any context recognized by x is recognized by x, so x ≤ x by definition. Transitivity: if x ≤ y and y ≤ z, then any context recognized by x is recognized by y and hence by z, so x ≤ z.

#### Definition — Finite Meets/Joins

For x, y ∈ R, a meet x ∧ y is a greatest z with z ≤ x and z ≤ y; a join x ∨ y is a least z with x ≤ z and y ≤ z. We assume finite meets and joins exist; ⊥, ⊤ serve as nullary meet/join.

#### Proposition — Bounded Distributive Lattice

With finite meets/joins, (R, ≤, ∧, ∨, ⊥, ⊤) is a bounded lattice; ∧, ∨ are commutative, associative, and satisfy absorption. If distributivity holds (assumed or proved from construction), then it is a distributive lattice.
Proof. Standard order-theoretic arguments using universal properties of meets and joins.

#### Definition — Inclusion and Exclusion

Define Inclusion by x ≤ y (“x is included in y”). Define Exclusion (orthogonality) by x ⟂ y iff x ∧ y = ⊥.

#### Lemma — Exclusion Symmetry

For recognitions x,y, x ⟂ y iff y ⟂ x.
Proof. x ⟂ y means x ∧ y = ⊥; by commutativity of ∧, y ∧ x = ⊥, hence y ⟂ x.

### Implication and Heyting Structure

#### Definition — Implication by Residuation

For x, y ∈ R, define x ⇒ y to be the greatest z ∈ R such that z ∧ x ≤ y (if it exists). Read: “when x holds, z suffices for y”.

#### Lemma — Residuation Law

For all a, b, c ∈ R, c ≤ (a ⇒ b) iff (c ∧ a ≤ b).
Proof. Immediate from the definition of ⇒ as the greatest such c; the two inequalities are equivalent by construction.

#### Theorem — Heyting Algebra

If R admits finite meets/joins and residuation for all pairs, then (R, ≤, ∧, ∨, ⇒, ⊥, ⊤) is a Heyting algebra. In particular, for all a, b, c ∈ R:
(i) a ∧ (a ⇒ b) ≤ b; (ii) c ≤ (a ⇒ b) iff (c ∧ a ≤ b); (iii) a ⇒ a = ⊤; (iv) ⊥ ⇒ a = ⊤; (v) a ⇒ ⊥ is the relative negation of a.
Proof. (i) Take c := (a ⇒ b) and apply the Residuation Law Lemma. (ii) This is the Residuation Law Lemma. (iii) From the Residuation Law with b := a, c := ⊤, since ⊤ ∧ a = a ≤ a. (iv) Since ⊤ ∧ ⊥ = ⊥ ≤ a. (v) Definition.

#### Definition — Relational Pseudocomplement

Define ¬a ≔ (a ⇒ ⊥). No classical principles are assumed; double negation need not collapse.

### Fixed Points and Stabilization

#### Definition — Monotone Endomap

An endomap T : R → R is monotone if x ≤ y ⇒ T(x) ≤ T(y).

#### Definition — Fixed Point

x is T-fixed if T(x) = x; a pre-fixpoint if T(x) ≤ x; a post-fixpoint if x ≤ T(x).

#### Lemma — Idempotence at Fixed Points

If T is monotone and T(x) ≤ x, then T(T(x)) ≤ T(x). If also x ≤ T(x), then T(x) = x.
Proof. Apply monotonicity to T(x) ≤ x to get T(T(x)) ≤ T(x). If also x ≤ T(x), then x, T(x) are both pre- and post-fixpoints, so equal by antisymmetry (when ≤ is a partial order; otherwise equality is equality in R’s extensional sense).

### Morphisms and Substructures

#### Definition — RelationalMorphism

Given RelationalStructures RStruct = (R, ≤, ∧, ∨, ⇒, ⊥, ⊤, …) and RStruct' = (R', ≤', ∧', ∨', ⇒', ⊥', ⊤', …), a RelationalMorphism is a map f : R → R' such that for all x,y ∈ R:
- Monotone: x ≤ y ⇒ f(x) ≤' f(y),
- Bounds: f(⊥) = ⊥' and f(⊤) = ⊤',
- Meets/Joins: f(x ∧ y) = f(x) ∧' f(y) and f(x ∨ y) = f(x) ∨' f(y),
- Implication: f(x ⇒ y) ≤' (f(x) ⇒' f(y)).

#### Proposition — Identity and Composition

Identity maps are RelationalMorphisms. The composite of RelationalMorphisms is a RelationalMorphism.
Proof. For id: clearly id(⊥)=⊥, id(⊤)=⊤, id(x ∧ y)=x ∧ y, id(x ∨ y)=x ∨ y, and id(x ⇒ y)=x ⇒ y, with monotonicity trivial. For composition, let f,g be RelationalMorphisms. Then (g ∘ f)(⊥)=g(f(⊥))=g(⊥)=⊥ and similarly for ⊤. Monotonicity: x ≤ y ⇒ f(x) ≤ f(y) ⇒ g(f(x)) ≤ g(f(y)). Meets/joins: (g ∘ f)(x ∧ y)=g(f(x) ∧ f(y))=g(f(x)) ∧ g(f(y)); similarly for ∨. Implication: f(x ⇒ y) ≤ f(x) ⇒ f(y), then applying g’s implication inequality yields g(f(x ⇒ y)) ≤ g(f(x) ⇒ f(y)) ≤ g(f(x)) ⇒ g(f(y)). Thus g ∘ f is a RelationalMorphism.

#### Definition — Substructure

A Substructure of a RelationalStructure is a subset S ⊆ R that is closed under ∧, ∨, ⇒ and contains ⊥, ⊤, equipped with the inherited order. The inclusion i : S ↪ R is a RelationalMorphism.
Proof. Closure assumptions ensure i preserves ⊥, ⊤, ∧, ∨, and satisfies i(x ⇒_S y) = x ⇒ y since ⇒ is computed in R and S is closed under it; monotonicity is immediate.

### RelationalStructure

#### Definition — RelationalStructure

A RelationalStructure is a tuple
  RStruct = (R, ≤, ∧, ∨, ⇒, ⊥, ⊤, Reflex)
such that: (a) R, ≤, ∧, ∨, ⊥, ⊤ form a bounded distributive lattice; (b) ⇒ satisfies the Residuation Law making R a Heyting algebra; (c) a designated Reflex endomap (when provided) is monotone and interprets the ρ‑operator.


## Relational Language

The goal of this section is to present an internal λ-like language λ_R that expresses and manipulates recognitions and their operations, and to prove soundness into RelationalStructure.

Present an internal λ-like language λ_R that expresses and manipulates recognitions and their operations; prove soundness into RelationalStructure.

### Syntax and Judgements

#### Definition — Types

Types are generated from base recognition types by ∧, ∨, ⇒, together with ⊥, ⊤. We write A, B, C for types.

#### Definition — Contexts

A context Γ is a finite list x₁:A₁, …, xₙ:Aₙ. Its denotation is the meet of its components.

#### Definition — Terms

Terms are generated by:
- variables x,
- Reflex operator ρ acting on recognition terms,
- logical constructors: pair ⟨t,u⟩ for ∧; injections inl t / inr u for ∨; abstraction λx.t and application t u for ⇒,
- constants ⋆:⊤ and abort:⊥→C.

Judgements. Typing: Γ ⊢ t : A. Equality/conversion: Γ ⊢ t ≡ u : A.

### Inference Rules (core)

Structural: weakening, exchange, substitution (admissible).

#### Rules — Conjunction
- Intro: Γ ⊢ t : A, Γ ⊢ u : B ⟹ Γ ⊢ ⟨t,u⟩ : A ∧ B.
- Elim: Γ ⊢ p : A ∧ B ⟹ Γ ⊢ π₁ p : A and Γ ⊢ π₂ p : B.

#### Rules — Disjunction
- Intro: Γ ⊢ t : A ⟹ Γ ⊢ inl t : A ∨ B; Γ ⊢ u : B ⟹ Γ ⊢ inr u : A ∨ B.
- Elim: Γ ⊢ s : A ∨ B, Γ,x:A ⊢ u : C, Γ,y:B ⊢ v : C ⟹ Γ ⊢ case s of inl x↦u | inr y↦v : C.

#### Rules — Implication
- Intro: Γ,x:A ⊢ t : B ⟹ Γ ⊢ λx.t : A ⇒ B.
- Elim: Γ ⊢ f : A ⇒ B, Γ ⊢ a : A ⟹ Γ ⊢ f a : B.

#### Rules — Bottom/Top
- ⊥-elim: Γ ⊢ t : ⊥ ⟹ Γ ⊢ abort t : C.
- ⊤-intro: Γ ⊢ ⋆ : ⊤.

#### Rules — Reflex Operator
- ρ-intro: Γ ⊢ t : A ⟹ Γ ⊢ ρ(t) : A.
- ρ-monotone: if A is a recognition type and Γ ⊢ t ≤ u then Γ ⊢ ρ(t) ≤ ρ(u).
- ρ-stability: Γ ⊢ ρ(t) ≤ t ⟹ Γ ⊢ ρ(t) ≡ t : A.

### Semantics into RelationalStructure

#### Definition — Standard Model

Given a RelationalStructure RStruct, interpret:
- types as recognitions (elements of R) with ∧, ∨, ⇒ as defined in Relational Structure,
- contexts as finite meets of their types,
- terms as monotone operations respecting constructors,
- ρ as the Reflex action (monotone endo-operation).

#### Theorem — Soundness

If Γ ⊢ t : A in λ_R, then in every RStruct, ⟦Γ⟧ ≤ ⟦A⟧ via ⟦t⟧; equalities are respected, and rules interpret to valid order laws.
Proof. By induction on derivations. ∧/∨/⇒ rules correspond to universal properties and the Residuation Law Lemma. ρ-monotonicity follows from Reflex monotonicity. ⊥-elim and ⊤-intro are validated by ⊥, ⊤.

#### Definition — RelationalLanguage

The RelationalLanguage λ_R is the λ-like calculus with syntax, judgements, and rules above; its standard models are RelationalStructures as defined in the RelationalStructure Definition.

### Operational Semantics and Metatheory

#### Definition — Reduction Rules

The one-step reduction → is the least relation closed under evaluation contexts generated by:
- β: (λx.t) u → t[u/x]
- Projections: π₁⟨t,u⟩ → t; π₂⟨t,u⟩ → u
- Case: case (inl t) of inl x↦u | inr y↦v → u[t/x]; case (inr u) of inl x↦t | inr y↦v → v[u/y]
- Reflex stability: ρ(t) → ρ(t′) whenever t → t′ (ρ does not reduce by itself)
- Congruence: standard for λ, application, pairs, sums, and elimination constructs

The multi-step reduction →* is the reflexive transitive closure of →. A term is in normal form when no rule applies.

#### Theorem — Preservation

If Γ ⊢ t : A and t → t′, then Γ ⊢ t′ : A.
Proof. By induction on the typing derivation of t; each reduction case corresponds to the matching introduction/elimination typing rule. ρ preserves typing by definition.

#### Theorem — Progress

If ⊢ t : A in the empty context, then either t is in normal form or there exists t′ with t → t′.
Proof. By induction on typing and canonical forms for ∧, ∨, ⇒, ⊥, ⊤. Closed values are either λ-abstractions, pairs of values, injections of values, ⋆, or an elimination redex exists; ρ does not block progress.

#### Theorem — Normalization

Every well-typed λ_R term reduces to a normal form.

Proof (full, via reducibility candidates). We work with closed terms; the open-term case is handled by environments mapping variables to reducible terms.

#### Definition — Strong Normalization (SN)

A term t is strongly normalizing if there is no infinite →-reduction sequence starting at t. Write SN(t).

#### Lemma — Context Closure of SN

If SN(t) then SN(C[t]) for any evaluation context C built from application, pairing, injections, case, projections, and ρ(·).
Proof. Any infinite reduction in C[t] would project to an infinite reduction in t or yield a contradiction with finiteness of context-driven steps; standard by structural induction on C and the fact that all redexes are within subterms except the finite top-level eliminations.

#### Definition — Reducibility Candidates

For each type A, define a set ⟦A⟧ of closed terms as follows:
• ⟦⊤⟧ = { t | ⊢ t : ⊤ and SN(t) } (all strongly normalizing ⊤-terms); ⟦⊥⟧ = { t | ⊢ t : ⊥ and SN(t) }.
• ⟦A ∧ B⟧ = { t | ⊢ t : A ∧ B, SN(t), and π₁ t ∈ ⟦A⟧ and π₂ t ∈ ⟦B⟧ }.
• ⟦A ∨ B⟧ = { t | ⊢ t : A ∨ B, SN(t), and for every closed u with x:A ⊢ u : C and u[x:=v] ∈ ⟦C⟧ whenever v ∈ ⟦A⟧, and for every closed w with y:B ⊢ w : C and w[y:=v] ∈ ⟦C⟧ whenever v ∈ ⟦B⟧, we have case t of inl x↦u | inr y↦w ∈ ⟦C⟧ }.
  (Equivalently, quantify over all closed eliminations to any target C; this is the standard candidate for sums.)
• ⟦A ⇒ B⟧ = { t | ⊢ t : A ⇒ B, SN(t), and for all u ∈ ⟦A⟧ we have (t u) ∈ ⟦B⟧ }.
• ρ-closure: if t ∈ ⟦A⟧ then ρ(t) ∈ ⟦A⟧.

#### Lemma — Basic Properties of Candidates
For any type A:
1) If t ∈ ⟦A⟧ and t → t′ then t′ ∈ ⟦A⟧ (closure under reduction).
2) If t ∈ ⟦A⟧ then SN(t).
3) If ⟦A⟧ contains all closed values of type A and is closed under the corresponding eliminations as above, then introduction forms built from reducible subterms are in ⟦A⟧.
Proof. By simultaneous induction on type structure and reduction length; standard proofs for simply-typed λ-calculus with products and sums apply. For ρ, use the Context Closure of SN and that ρ only reduces through its subterm; closure follows since premises quantify over all eliminations and applications, which are preserved under a single internal reduction step.

#### Definition — Reducible Environment

An environment E mapping each variable x:A in Γ to a closed term E(x) with E(x) ∈ ⟦A⟧.

#### Lemma — Substitution Lemma for Reducibility

If Γ ⊢ t : A and E is a reducible environment for Γ, then t[E] ∈ ⟦A⟧.
Proof. By induction on the typing derivation of t. Representative cases:
• Variable: t ≡ x and t[E] = E(x) ∈ ⟦A⟧ by definition of E.
• Pair/Projections and Injections/Case: use IH on subderivations and the corresponding clauses in candidates; sums quantify over all closed eliminations, which includes the specific case term.
• Abstraction: suppose Γ,x:B ⊢ t : C, and let v ∈ ⟦B⟧; by IH on t with environment E extended by x↦v we get t[E,x↦v] ∈ ⟦C⟧; thus λx.t[E] ∈ ⟦B ⇒ C⟧.
• Application: IH gives f[E] ∈ ⟦B ⇒ C⟧ and a[E] ∈ ⟦B⟧; hence f[E] a[E] ∈ ⟦C⟧.
• ⊥-elim and ⊤-intro: immediate from definitions and SN closure.
• ρ: if Γ ⊢ t : A then by IH t[E] ∈ ⟦A⟧, and by ρ-closure ρ(t[E]) ∈ ⟦A⟧.

#### Theorem — Fundamental Theorem of Logical Relations

If Γ ⊢ t : A and E is a reducible environment for Γ, then t[E] ∈ ⟦A⟧.
Proof. This is the Substitution Lemma for Reducibility.

Conclusion. For closed ⊢ t : A, take the empty environment; by the Fundamental Theorem, t ∈ ⟦A⟧, hence SN(t). Therefore every well-typed closed term is strongly normalizing. Progress ensures any reduction leads to a normal form. This completes the normalization proof.

#### Theorem — Confluence (Church–Rosser, Sketch)

If t →* u and t →* v, then there exists w with u →* w and v →* w.
Sketch. Define a standard parallel reduction ⇒ that contracts all disjoint redexes in one step (including β, projections, case) and propagates through ρ by reducing its subterm. Show: (i) → ⊆ ⇒ and ⇒ ⊆ →*, (ii) ⇒ has the diamond property by standard critical‑pair analysis for simply‑typed λ with products/sums; ρ is a context former and introduces no overlaps, (iii) hence ⇒ is confluent. Since normalization holds, Newman’s Lemma yields Church–Rosser for →.


## Relational Geometry

The goal of this section is to equip RelationalStructure with nucleus-like operators and a flow, stated purely relationally, and to develop fixed-point substructures and their interaction.

Equip RelationalStructure with nucleus-like operators and a flow, stated purely relationally; develop fixed-point substructures and their interaction.

### Relational Nuclei

#### Definition — Relational Nucleus

A Relational Nucleus on a RelationalStructure is an endomap ν : R → R such that for all x,y ∈ R:
 • Monotone: x ≤ y ⇒ ν(x) ≤ ν(y);
 • Idempotent: ν(ν(x)) = ν(x);
 • Either (closure-like) x ≤ ν(x) or (interior-like) ν(x) ≤ x;
 • Algebraic compatibility:
   – closure-like: x ∧ ν(y) ≤ ν(x ∧ y) and ν(x) ∨ ν(y) = ν(x ∨ y);
   – interior-like: ν(x ∧ y) = ν(x) ∧ ν(y) and ν(x ∨ y) ≤ ν(x) ∨ ν(y).

#### Proposition — Fixed-Point Substructures

For closure-like ν, the ν-closed recognitions {x | ν(x) = x} form a Heyting subalgebra closed under ∧, ∨, ⇒. Dually, ν-open recognitions for interior-like ν form a Heyting subalgebra closed under ∧, ⇒ and are upward-closed under ∨ via ν.
Proof. For closure-like ν: ∧-closure from algebraic compatibility; ∨-closure from the stated equality; ⇒-closure follows since if a,b are closed then ν(a⇒b) ≥ a⇒b and also ≤ by monotonicity with a∧(a⇒b) ≤ b and idempotence, yielding equality. Dual statements for interior-like ν.

#### Definition — RelationalGeometry

A RelationalGeometry is a RelationalStructure equipped with a specified family of nuclei {ν_i}_i satisfying declared interactions (e.g., commuting ν_i ∘ ν_j = ν_j ∘ ν_i when required).

### Relational Flow

#### Definition — Relational Flow

A Relational Flow is an endomap F : R → R such that for all x,y ∈ R:
 • Monotone: x ≤ y ⇒ F(x) ≤ F(y);
 • Lax-idempotent: F(F(x)) ≤ F(x) (optionally equality);
 • Directionality: either (inflationary) x ≤ F(x) or (deflationary) F(x) ≤ x;
 • Nucleus interaction: declared laws, e.g., F ∘ ν ≤ ν ∘ F (closure-like) or ν ∘ F ≤ F ∘ ν (interior-like).

#### Lemma — Fixed Sets

Under monotonicity and lax-idempotence, Fix(F) = {x | F(x)=x} is closed under ∧; if F is idempotent and R distributes, also under ∨ and ⇒.
Proof. If F is idempotent: F(x∧y) ≤ F(x)∧F(y) = x∧y and x∧y ≤ F(x∧y), hence equality. Similarly for ∨ using monotonicity and distributivity. For ⇒, use residuation with F(x∧(x⇒y)) ≤ F(y).

#### Proposition — Flow–Nucleus Compatibility

If F ∘ ν ≤ ν ∘ F for closure-like ν, then ν-closed recognitions are forward-invariant: ν(x)=x ⇒ ν(F(x))=F(x). The dual statement holds for interior-like ν with ν ∘ F ≤ F ∘ ν.
Proof. ν(F(x)) ≥ F(ν(x)) = F(x), but also ν(F(x)) ≤ F(x) since x is ν-closed and ν is extensive; hence equality.

#### Theorem — Fixed-Point Existence

Assume R is ω-complete (every ascending ω-chain has a least upper bound). If F is inflationary and monotone, then for any x, the chain x ≤ F(x) ≤ F²(x) ≤ … has a least upper bound l with F(l) = l. Dually for deflationary F in ω-op-complete R.
Proof. Let l := ⋁_{n∈ℕ} Fⁿ(x). Monotonicity gives F(l) = F(⋁ Fⁿ(x)) ≥ ⋁ F^{n+1}(x) = l and also l ≥ F(l), so equality.

#### Proposition — Transport of Fixed Points

Let f : R → R' be a RelationalMorphism between RelationalStructures, and let F : R → R and F' : R' → R' be flows such that f ∘ F = F' ∘ f. If x is F-fixed (F(x)=x), then f(x) is F'-fixed (F'(f(x))=f(x)).
Proof. F'(f(x)) = f(F(x)) = f(x).

#### Proposition — Transport of Nucleus Fixed Points

Let f : R → R' be a RelationalMorphism, and let ν, ν' be nuclei on R and R' with f ∘ ν = ν' ∘ f. If x is ν-closed (ν(x)=x), then f(x) is ν'-closed (ν'(f(x))=f(x)).
Proof. ν'(f(x)) = f(ν(x)) = f(x).

#### Definition — RelationalGeometry (Final)

A RelationalGeometry is a RelationalStructure with chosen nuclei and a flow F satisfying the Relational Flow Definition and any stated completeness assumptions when fixed-point existence is required.

### Dynamic Residuation Along Flow

#### Definition — Flow‑Indexed Implication

For a monotone flow F and recognitions a,b, define the flow‑indexed implication a ⇒_F b to be the greatest z (when it exists) such that F(z ∧ a) ≤ b (inflationary case) or z ∧ F(a) ≤ b (deflationary case).

#### Lemma — Dynamic Residuation Law

For all c, a, b, c ≤ (a ⇒_F b) iff F(c ∧ a) ≤ b (inflationary) or c ∧ F(a) ≤ b (deflationary).
Proof. Immediate from the definition as the greatest such c, using monotonicity of F and meet.

#### Proposition — Dynamic Residuation

With Flow‑Indexed Implication and the Dynamic Residuation Law Lemma, the usual Heyting reasoning internalizes along F: a ∧ (a ⇒_F b) evolves under F to be ≤ b, and c ≤ (a ⇒_F b) iff the corresponding inequality with F holds as above.
Proof. Unfold the definition and apply the Dynamic Residuation Law Lemma.

### General Unary Structures

Relational Geometry introduces several unary endomaps on recognitions (e.g., nuclei and flow) that share a common internal behavior: each induces a stable region of recognitions and an inherited RelationalStructure. This section abstracts that pattern into general concepts that unify these constructions and prepare the ground for later developments (e.g., specializations, multi-map composites, and higher-level operational structures).

#### Definition — Discipline
A Discipline on a RelationalGeometry is a unary endomap  
  D : R → R  
such that for all recognitions x, y:
- Monotone: x ≤ y ⇒ D(x) ≤ D(y).
- Stability: D(D(x)) = D(x), or D(D(x)) ≤ D(x) when a directionality is declared.
- Algebraic Compatibility:  
  D(x ∧ y) = D(x) ∧ D(y),  
  D(x ∨ y) = D(x) ∨ D(y),  
  D(x ⇒ y) ≤ D(x) ⇒ D(y).
- Nucleus/Flow Compatibility: For every nucleus ν, D(ν(x)) = ν(D(x)); and for flow F, D(F(x)) = F(D(x)).

#### Definition — Regime
For a Discipline D, the Regime of D is the class of recognitions stable under D:  
  Regime(D) := { x ∈ R | D(x) = x }.  
These are the D-stable recognitions.

#### Proposition — Regime(D) Forms a RelationalStructure
Regime(D) is closed under ∧, ∨, ⇒, contains ⊥ and ⊤, inherits the Heyting structure, and all nuclei/flow restrict to Regime(D).

#### Definition — Composite Discipline
Two Disciplines D₁, D₂ commute when D₁(D₂(x)) = D₂(D₁(x)) for all x.  
When they commute, their Composite Discipline is  
  D₁₂ := D₁ ∘ D₂ = D₂ ∘ D₁.

#### Definition — Composite Regime
For a commuting family {Dᵢ}, their Composite Regime is  
  Regime({Dᵢ}) := ⋂ᵢ Regime(Dᵢ),  
the recognitions stable under every Discipline in the family.

#### Proposition — Composite Regime is a RelationalStructure
Regime({Dᵢ}) is a Heyting-closed substructure with inherited nuclei and flow, and equals the Regime of the composite Discipline.

## Relational Physics

The goal of this section is to provide a frame-agnostic physical interpretation: systems as geometries, states as recognitions, observables as distinguished recognitions/operations, and flow as dynamics.

Provide a frame-agnostic physical interpretation: systems as geometries, states as recognitions, observables as distinguished recognitions/operations, and flow as dynamics.

#### Definition — Observable

An Observable is a designated recognition or operation on recognitions whose evaluation on a state yields an outcome term of λ_R.

#### Definition — RelationalPhysicalSystem

A RelationalPhysicalSystem is a tuple
  RPhys = (Geom, Obs)
where Geom is a RelationalGeometry with flow F and nuclei {ν_i}, and Obs is a specified family of observables.

#### Definition — States, Evolution, Measurement

States are recognitions (or structured configurations thereof). Evolution is given by F. Measurement/idealisation corresponds to applying nuclei ν_i.

#### Proposition — Invariants

F-fixed recognitions are dynamical invariants. If ν is compatible with F (the Flow–Nucleus Compatibility Proposition), then ν-fixed recognitions define conserved or idealised quantities preserved along evolution.
Proof. If F(x)=x, invariance is immediate. If ν(F(x))=F(ν(x)) and ν(x)=x then ν(F(x))=F(x), hence preserved.

#### Proposition — Reachability

For inflationary F, the least F-closed y with x ≤ y equals ⋁_{n} Fⁿ(x); this is the forward-reachable closure. For deflationary F, ⋀_{n} Fⁿ(x) gives the backward-stable core.
Proof. Direct from the Fixed-Point Existence Theorem by least/greatest fixed-point characterisations in ω-(op-)complete settings.

#### Theorem — Soundness of Physical Semantics

Interpreting λ_R in RPhys via the Relational Language semantics and reading F as dynamics and ν as measurement/idealisation yields: if Γ ⊢ t : A then along any evolution under F and nucleus applications declared in RPhys, denotations respect ≤ and invariants are maintained as per the Invariants Proposition.
Proof. Combine the Soundness Theorem with the Fixed Sets Lemma and the Flow–Nucleus Compatibility Proposition to show interpretations are preserved under F and ν.

#### Definition — RelationalPhysics

The canonical physical semantics of RelationalGeometry: states are recognitions, dynamics is Relational Flow, and measurement/idealisation is captured by nuclei — all defined without external cohesive specializations.


This appendix expands the treatise with internal constructions and proofs without importing external specializations or terminology. All results are named explicitly and referenced by name.

## Canonical Syntactic Structure Construction

#### Definition — Provability Preorder

For types A,B under context Γ in λ_R, write A ≤_Γ B when Γ ⊢ λx:A. t : A ⇒ B for some t (equivalently, Γ,x:A ⊢ u : B). Write A ≡_Γ B when A ≤_Γ B and B ≤_Γ A.

#### Definition — Syntactic Recognitions

Let R_Γ be equivalence classes [A] under ≡_Γ. Define operations on classes by [A] ∧ [B] := [A ∧ B], [A] ∨ [B] := [A ∨ B], [A] ⇒ [B] := [A ⇒ B], ⊥ := [⊥], ⊤ := [⊤]. Define order [A] ≤ [B] iff A ≤_Γ B.

#### Lemma — Well‑Defined Operations

The operations ∧, ∨, ⇒ on R_Γ are well‑defined w.r.t. ≡_Γ and are monotone in each argument.
Proof. By congruence of λ_R typing under substitution and introduction/elimination rules; mutual derivability preserves and is preserved by forming ∧, ∨, ⇒ terms.

#### Theorem — Syntactic Structure

(R_Γ, ≤, ∧, ∨, ⇒, ⊥, ⊤) is a RelationalStructure; the Residuation Law Lemma holds for ⇒; hence R_Γ is a Heyting algebra.
Proof. Use the Well‑Defined Operations Lemma and interpret ≤_Γ as entailment. ∧/∨ satisfy the bounded distributive lattice laws by the λ_R rules. The Residuation Law mirrors ⇒‑intro/elim. Reflex acts as the identity on types (ρ preserves types) and is monotone on recognition types when interpreted by a monotone Reflex endomap.

## Completeness via the Canonical Model

#### Definition — Semantic Entailment

Γ entails A, written Γ ⊨ A, when for every RelationalStructure RStruct and interpretation of Γ into R, the denotation of Γ is ≤ the denotation of A.

#### Theorem — Syntactic Completeness

If Γ ⊨ A then Γ ⊢ t : A for some t in λ_R.
Proof. Suppose not. Then A ∉ the upward closure of Γ in the preorder ≤_Γ. In the Syntactic Recognitions structure R_Γ, interpret each type by its class [·]. By construction, the denotation of Γ is not ≤ the denotation of A (since that would witness a derivation). This contradicts Γ ⊨ A. Hence Γ ⊢ A.

#### Corollary — Adequacy

λ_R is both sound (Soundness Theorem) and complete (Syntactic Completeness Theorem) for RelationalStructures in the sense defined in this treatise.


## Derived Nucleus and Flow Laws

#### Proposition — Closure Absorption

For a closure‑like ν and recognitions x,y, x ∧ ν(y) ≤ ν(x ∧ y) and ν(x) ∨ y ≤ ν(x ∨ y). Moreover, if y is ν‑closed, then x ∧ y ≤ ν(x ∧ y) = x ∧ y and ν(x) ∨ y = ν(x ∨ y) ≥ y.
Proof. From algebraic compatibility and idempotence.

#### Proposition — Interior Distribution

For an interior‑like ν and recognitions x,y, ν(x ∧ y) = ν(x) ∧ ν(y) and ν(x ∨ y) ≤ ν(x) ∨ ν(y). If x,y are ν‑open, then ν(x ∨ y) = x ∨ y.
Proof. By the interior compatibility axioms and idempotence.

#### Proposition — Nucleus Distributive Equalities

For a closure‑like ν and recognitions x,y, ν(x ∧ ν(y)) = ν(x ∧ y) and ν(ν(x) ∨ y) = ν(x ∨ y). Dual equalities hold for an interior‑like ν.
Proof. Use monotonicity, idempotence, and the algebraic compatibility axioms; both directions follow from ν(y) ≥ y (closure‑like) and ν(ν(y))=ν(y).

#### Proposition — Flow Distributes over Meets

If F is a monotone flow, then: if F is inflationary, F(x ∧ y) ≤ F(x) ∧ F(y); if F is deflationary, F(x) ∧ F(y) ≤ F(x ∧ y).
Proof. Use monotonicity and directionality: inflationary gives x ≤ F(x), y ≤ F(y), hence x ∧ y ≤ F(x) ∧ F(y) and by monotonicity F(x ∧ y) ≤ F(x) ∧ F(y). The deflationary case dualises.

#### Proposition — Temporal Closure

If F is an inflationary, idempotent flow, define □x := Fix(F) ∧ x and ◇x := ⋁_{n} Fⁿ(x) when the join exists. Then □ is interior‑like on Fix(F) and ◇ is closure‑like; both commute with any ν that is compatible with F (Flow–Nucleus Compatibility Proposition).
Proof. Immediate from Fixed Sets Lemma, Fixed‑Point Existence Theorem, and Flow–Nucleus Compatibility.

#### Proposition — Principal Closure

For any recognition k, the assignment ν_k(x) := x ∨ k is a closure‑like nucleus: it is monotone, extensive, and idempotent; its fixed points are precisely the recognitions y with k ≤ y.
Proof. Monotone and extensive are immediate from ∨. Idempotence: ν_k(ν_k(x)) = (x ∨ k) ∨ k = x ∨ k. Fixed points equal {y | y = y ∨ k} which is equivalent to k ≤ y.

#### Proposition — Dual Interior from Closure

Suppose negation ¬(·) is an antitone operation satisfying De Morgan‑style laws with ∧, ∨ (as in a Heyting setting with relative negation). For any closure‑like ν, define δ(x) := ¬ν(¬x). Then δ is interior‑like and satisfies the interior compatibility laws.
Proof. Standard nucleus dualization: antitonicity of ¬ and De Morgan laws transfer closure properties to interior properties under double application of ¬.

## Filters and Profiles

This section abstracts a particular class of Disciplines whose compatibility conditions hold with all nuclei and the flow. Such Disciplines induce stable recognitional regions (Profiles) that inherit RelationalStructure, RelationalLanguage, RelationalGeometry, and RelationalPhysics internally. This yields a reflexive reconstruction of the Treatise’s four-part chain inside each Profile.

### Definition — Filter

Let Geom = (R, ≤, ∧, ∨, ⇒, ⊥, ⊤; {νᵢ}, F) be a RelationalGeometry.  
A Filter on Geom is a Discipline

  Filter : R → R

such that, for all recognitions x, y ∈ R:

1. (Monotonicity)  
  x ≤ y ⇒ Filter(x) ≤ Filter(y).

2. (Stability)  
  Filter(Filter(x)) = Filter(x).

3. (Algebraic Preservation)  
  Filter(x ∧ y) = Filter(x) ∧ Filter(y),  
  Filter(x ∨ y) = Filter(x) ∨ Filter(y),  
  Filter(x ⇒ y) ≤ Filter(x) ⇒ Filter(y).

4. (Nucleus Compatibility)  
  For each nucleus νᵢ,  
  Filter(νᵢ(x)) = νᵢ(Filter(x)).

5. (Flow Compatibility)  
  Filter(F(x)) = F(Filter(x)).

### Definition — Profile

Given a Filter, define the Profile of that Filter as

  Profile(Filter) := { x ∈ R ∣ Filter(x) = x }.

Elements of Profile(Filter) are called Filter-active recognitions.

### Proposition — Profile as RelationalStructure

Profile(Filter), with the inherited operations

  (≤, ∧, ∨, ⇒, ⊥, ⊤),

forms a RelationalStructure.

Proof.  
Since Filter is a Discipline, this follows from the “Regime(D) Forms a RelationalStructure” Proposition applied to D := Filter.

### Definition — Reflex Restriction on Profiles

Assume R carries the designated Reflex endomap ρ : R → R.  
If Filter commutes with ρ, i.e.,

  Filter(ρ(x)) = ρ(Filter(x))

for all x ∈ R, define

  ρ_Profile(x) := ρ(x)

for x ∈ Profile(Filter).

### Lemma — Reflex Stability

If x ∈ Profile(Filter), then ρ(x) ∈ Profile(Filter).

Proof.  
Filter(x) = x and Filter(ρ(x)) = ρ(Filter(x)) = ρ(x); hence ρ(x) is Filter-active.

### Corollary — ProfileStructure with Reflex

Under the hypotheses above, the tuple

  ProfileRStruct(Filter) :=  
  (Profile(Filter), ≤, ∧, ∨, ⇒, ⊥, ⊤, ρ_Profile)

is a RelationalStructure with designated Reflex.

### Definition — ProfileLanguage

Let ProfileRStruct(Filter) be as above.  
The ProfileLanguage λ_Profile is the λ-like calculus obtained by interpreting λ_R in ProfileRStruct(Filter):

- types denote Profile recognitions,  
- contexts denote finite meets of these types,  
- terms denote monotone operations respecting inherited constructors.

### Proposition — ProfileLanguage Soundness

If Γ ⊢ t : A in λ_Profile, then in ProfileRStruct(Filter),

  ⟦Γ⟧ ≤ ⟦A⟧,

and equalities are preserved.

Proof.  
This is an instance of the Soundness Theorem for λ_R, since ProfileRStruct(Filter) is a RelationalStructure.

### Definition — ProfileGeometry

Define the ProfileGeometry of Filter as

  ProfileGeom(Filter) :=  
  (Profile(Filter), ≤, ∧, ∨, ⇒, ⊥, ⊤; {νᵢ|_Profile}, F|_Profile),

where νᵢ|_Profile and F|_Profile are the restrictions of νᵢ and F to Profile(Filter).  
These are well-defined because Filter commutes with all νᵢ and with F.

### Proposition — ProfileGeometry is a RelationalGeometry

ProfileGeom(Filter) satisfies the axioms of a RelationalGeometry.

Proof.  
Closure of Profile(Filter) under the restricted nuclei and flow follows from the Nucleus Compatibility and Flow Compatibility clauses in the Filter definition. The remaining axioms are inherited from Geom.

### Definition — ProfilePhysics

Let RPhys := (Geom, Obs) be a RelationalPhysicalSystem.  
Given a Filter on Geom, define the ProfilePhysics of that Filter as

  ProfilePhys(Filter) :=  
  (ProfileGeom(Filter), Obs_Profile),

where Obs_Profile is any chosen family of observables restricted to Profile(Filter)
(or newly declared observables internal to ProfileGeom(Filter)).

States are recognitions in Profile(Filter);  
evolution is given by F|_Profile;  
measurement/idealisation is given by the restricted nuclei {νᵢ|_Profile}.

### Theorem — ProfilePhysics Soundness

Interpreting λ_Profile in ProfilePhys(Filter) yields:

If Γ ⊢ t : A in λ_Profile, then under any evolution by F|_Profile and any nucleus νᵢ|_Profile, denotations respect ≤ and all invariants declared by ProfileGeom(Filter) are maintained.

Proof.  
This is an instance of the Soundness of Physical Semantics Theorem, applied to ProfileGeom(Filter). All required compatibility properties hold by restriction from Geom.

### Theorem — Filter-Induced Reflexive Reconstruction

Let Geom be a RelationalGeometry with RelationalLanguage λ_R and RelationalPhysics as defined in this Treatise.  
Let Filter be a Filter that commutes with Reflex.

Then Profile(Filter) supports:

1. a RelationalStructure (ProfileStructure),  
2. an internal λ-like language λ_Profile (ProfileLanguage),  
3. a RelationalGeometry (ProfileGeometry),  
4. a RelationalPhysicalSystem (ProfilePhysics),

such that the entire chain

  Relational Structure →  
  Relational Language →  
  Relational Geometry →  
  Relational Physics

is reconstructed internally on Profile(Filter), with the induced Reflex replacing the global Reflex.

Proof.  
Combine the ProfileStructure Proposition, Reflex Stability Corollary, ProfileLanguage Soundness Proposition, ProfileGeometry Proposition, and ProfilePhysics Soundness Theorem. Each step of the Treatise lifts to Profile(Filter) because Filter is a Discipline commuting with all nuclei, with the flow, and with Reflex.

### Composite Filters and Multi-Profile Domains

Filters admit simultaneous action when they commute. The constructions below describe the joint stable domains (“Composite Profiles”) induced by multiple Filters and show that these domains again support the full four-part chain of this Treatise.

#### Definition — Composite Filter

Let Filter₁, Filter₂ : R → R be Filters on Geom.  
They **commute** when

  Filter₁(Filter₂(x)) = Filter₂(Filter₁(x))

for all x ∈ R.

In this case define the **Composite Filter**

  Filter₁₂ := Filter₁ ∘ Filter₂ = Filter₂ ∘ Filter₁.

The same definition applies to any finite family {Filterᵢ} that commute pairwise.

#### Definition — Composite Profile

For commuting Filters {Filterᵢ}, define the **Composite Profile**

  Profile({Filterᵢ}) := ⋂ᵢ Profile(Filterᵢ).

Equivalently,

  Profile({Filterᵢ}) = Profile(Filter₁ ∘ Filter₂ ∘ ⋯ ∘ Filterₙ).

#### Proposition — Composite Profile as RelationalStructure

Profile({Filterᵢ}), with the inherited operations

  (≤, ∧, ∨, ⇒, ⊥, ⊤),

is a RelationalStructure.

*Proof.*  
Each Profile(Filterᵢ) is a Heyting-closed substructure.  
Finite intersections of Heyting-closed subsets remain Heyting-closed.

#### Proposition — Composite ProfileGeometry

Let each Filterᵢ commute with all nuclei {νⱼ} and the flow F.  
Then the restricted nuclei

  νⱼ|_{Profile({Filterᵢ})}

and restricted flow

  F|_{Profile({Filterᵢ})}

are well-defined and satisfy the nucleus and flow axioms.  
Thus

  ProfileGeom({Filterᵢ}) :=  
  (Profile({Filterᵢ}), ≤, ∧, ∨, ⇒, ⊥, ⊤; {νⱼ|}, F|)

is a RelationalGeometry.

#### Corollary — Composite ProfilePhysics

The Composite Profile supports an internal RelationalPhysicalSystem whose dynamics and measurements are the inherited restrictions of F and {νⱼ}.

#### Definition — Nested Profile

Let Filter be a Filter on Geom and let GFilter be a Filter on ProfileGeom(Filter).  
Then GFilter is a Filter on ProfileGeom(Filter), and

  Profile(GFilter)

is called a **Nested Profile** within Profile(Filter).

#### Theorem — Profile Tower

Given Filters acting on Profiles of Filters, the iterated construction

  Profile → ProfileStructure → ProfileLanguage → ProfileGeometry → ProfilePhysics

reconstructs at every level.  
Nested Profiles and Composite Profiles both inherit the full Treatise chain.

*Proof.*  
Immediate from the Profile and Composite Profile propositions and from the fact that restrictions of nuclei, flow, Reflex, and the Heyting operations satisfy all axioms on each stable domain.

### Remark — Recursive Profiles

Filters on ProfileGeom(Filter) yield further Profiles.  
Thus Filters induce a recursive hierarchy of internal relational universes, each carrying its own Structure, Language, Geometry, and Physics, all defined purely in the relational vocabulary of this Treatise.