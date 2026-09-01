# On Relationality

## Introduction

This text presents a mathematical development of ***Relationality*** (`Relationality`) beginning with *Relationlessness* and exploring the mathematical space that unfolds. These mathematics are separated into:



- Algebra of Relational Structure
- Calculus of Relational Language
- Dynamics of Relational Geometry
- Mechanics of Relational Physics

### Expressing Relationality

In this text, Relationality is represented with a "domain-specific language," fully documented in the appendix "Relational Expressions Syntax," but in plain terms, `()` hold symbols that refer to different things we'll explore in this text, with the first symbol daying what happens, and any that might follow being what it happens to, i.e. `(meet cloud sun)`.

## Algebra of Relational Structure

In this section, we'll explore the ***Algebra of Relational Structures*** (`AlgebraOfRelationalStructures`). But before we can do that, we have to find what *Relational Structure* in the first place.



### Relationlessness

***Relationlessness*** (`Relationlessness`) is the void of relation — the absence of any distinction, recognition, or structure. Nothing is yet separated from anything else, so no data is recorded.

```
(fn Relationlessness ()
  (bottom))
```



### Reflex

***Reflex*** (`Reflex`) is the first act that brings forth a recognition from Relationlessness by drawing a distinction. Performing Reflex once yields one crude recognition; repeating Reflex refines or adds recognitions.

```
(fn Reflex (recognition)
  (reflex recognition))
```



### Articulation

***Articulation*** (`Articulation`) claims that every effective articulation (including denial) manifests as a recognition.

```
(fn Articulation (recognition)
  (Reflex recognition))
```


Proof. To describe the state “without relation” is to effect an exclusion between “relation” and “this field.” Exclusion is relational in form, hence it constitutes a recognition. Therefore, from the very definability of relationlessness, at least one recognition is induced.

### Exclusion Recognition

***Exclusion Recognition*** (`ExclusionRecognition`) names recognitions whose content is “not-with”: the act takes an interior region, names what lies outside it, and records that the two do not overlap. Using Exclusion necessarily relates an interior to an exterior.

```
(fn ExclusionRecognition (interior exterior)
  (neg (meet interior exterior)))
```



### Reflex Emergence

***Reflex Emergence*** (`ReflexEmergence`) claims that as soon as Relationlessness is described, at least one recognition must appear, so there exists an act that brings a recognition forth from Relationlessness; that act is Reflex.

```
(fn ReflexEmergence ()
  (Reflex (Relationlessness)))
```


Proof. By the Articulation Theorem, articulating relationlessness induces a recognition (an Exclusion Recognition). Therefore, the field is not empty of recognitions. Let Reflex be the minimal act witnessing this genesis: the act that, from Relationlessness, yields that first recognition. ∎

### First Recognition Exists

***First Recognition Exists*** (`FirstRecognitionExists`) notes that under Reflex Emergence, the collection R of recognitions is nonempty because the inaugural recognition already lives in R.



### Iterability of Reflex

***Iterability of Reflex*** (`IterabilityOfReflex`) observes that once Reflex acts, narrating its outcome also counts as a recognition. Consequently Reflex can feed its own output into itself, although nothing forces repeated articulations to stabilize immediately.



### Reflex Step Endomap

***Reflex Step Endomap*** (`ReflexStepEndomap`) fixes a RelationalStructure RStruct and designates an endomap S : R → R that models one more articulation on recognitions. Whenever recognition α is below recognition β, the monotonicity assumption forces S(α) to remain below S(β), so Reflex respects inclusions.



### Iterates of S

***Iterates of S*** (`IteratesOfS`) describe repeated articulations by setting S^0(x) := x for the untouched recognition and S^{n+1}(x) := S(S^n(x)) for one more reflexive pass.



### Iteration

***Iteration*** (`Iteration`) asserts that every finite sequence of Reflex steps keeps landing on recognitions: start with any recognition x, apply S repeatedly n times, and the resulting S^n(x) is still a valid recognition for each natural number n.


Proof. By induction on n. Base n=0: S^0(x)=x ∈ R. Step: if S^n(x) ∈ R, then by the Articulation Theorem, applying S yields a recognition; hence S^{n+1}(x) ∈ R.

### Stabilization Depth and Persistence

***Stabilization Depth and Persistence*** (`StabilizationDepthAndPersistence`) say that a recognition x stabilizes under S when there exists a natural number N after which additional Reflex steps leave the recognition unchanged: S^{n+1}(x) = S^n(x) for all n ≥ N. Any recognition appearing at or beyond that stage is a fixed point of S, and the predicate Persist_S(x) records the phenomenon.



### Baseline Convergence

***Baseline Convergence*** (`BaselineConvergence`)(relative to ⊥) says that a recognition x collapses under S when repeated Reflex steps eventually produce exactly the same sequence as starting from the ⊥-baseline: beyond some stage N, S^n(x) = S^n(⊥) for every remaining n.



### Iterative Persistence, Baseline Limit, Eventual Equivalence

***Iterative Persistence, Baseline Limit, Eventual Equivalence*** (`IterativePersistenceBaselineLimitEventualEquivalence`) introduce three relational behaviors:



- Iterative Persistence states that Persist_S(x) holds, so x eventually becomes S-stable.
- Baseline Limit names the eventual result of the S-sequence when x converges to the ⊥-baseline; notation x↘ (defined only when baseline convergence holds). This limit is distinct from Relational Negation (Definition — Relational Negation) because ¬x := (x ⇒ ⊥) describes a relative implication rather than a limit along S.
- Eventual Equivalence writes x ≡_S y when there exists an N such that beyond that stage the S-iterates of x and y are identical, capturing shared long-term behavior even if their early dynamics differ.

### Eventual Equivalence is an Equivalence Relation

***Eventual Equivalence is an Equivalence Relation*** (`EventualEquivalenceIsAnEquivalenceRelation`): the relation is reflexive, symmetric, and transitive.


Proof. Reflexive: take N=0. Symmetric: equality is symmetric. Transitive: if S^n(x)=S^n(y) for all n≥N and S^n(y)=S^n(z) for all n≥M, then for all n≥max(N,M), S^n(x)=S^n(z).

### Existence Schemas for S-Persistent Recognitions

***Existence Schemas for S-Persistent Recognitions*** (`ExistenceSchemasForSPersistentRecognitions`) summarize useful sufficient conditions:



- If S is idempotent, every recognition persists immediately with N=0.
- If S is inflationary (each recognition is included in its S-image) and the recognition space admits least upper bounds for ascending ω-chains, then each recognition x admits a least fixed point l obtained as the join ⋁_{n} S^n(x); that l satisfies S(l)=l (see Fixed‑Point Existence in the geometry section).
- If S is deflationary (S(x) ≤ x) and the recognition space admits greatest lower bounds for descending ω-chains, then each recognition x has a greatest post-fixpoint r given by the meet ⋀_{n} S^n(x), and S(r)=r.

These behaviors capture stabilization and baseline convergence as internal constructions driven entirely by the chosen Reflex endomap S.

### Recognition

***Recognition*** (`Recognition`) refers to any pattern brought forth by Reflex; gather all such patterns into the collection R so every subsequent construction draws from the same relational domain.



### Order

***Order*** (`Order`) declares that when every context discerned by recognition α is also discerned by recognition β, we write α ≤ β. The symbol merely tracks that α’s informational region sits wholly inside β’s region.



### Extremes

***Extremes*** (`Extremes`) set two boundary recognitions: ⊥ recognizes nothing at all (the null pattern), while ⊤ recognizes everything without condition (the trivial pattern). They anchor the order as its least and greatest elements.



### Preorder

***Preorder*** (`Preorder`) observes that the inclusion relation ≤ is reflexive (each recognition includes itself) and transitive (if α includes β and β includes γ, then α includes γ). These facts follow because recognition inclusion is defined via context containment, which naturally respects reflection and chaining.


Proof. Reflexivity: any context recognized by x is recognized by x, so x ≤ x by definition. Transitivity: if x ≤ y and y ≤ z, then any context recognized by x is recognized by y and hence by z, so x ≤ z.

### Finite Meets and Joins

***Finite Meets and Joins*** (`FiniteMeetsAndJoins`) specify that given recognitions α and β we can form their greatest shared refinement α ∧ β (the most informative recognition lying below both) and their least shared extension α ∨ β (the least informative recognition lying above both). The baseline recognitions ⊥ and ⊤ act as the empty meet and join, respectively.



### Bounded Distributive Lattice

***Bounded Distributive Lattice*** (`BoundedDistributiveLattice`) states that once finite meets and joins exist, the recognition space automatically forms a bounded lattice where ∧ and ∨ commute, associate, and absorb in the usual lattice-theoretic sense. When propagation of meets across joins (and vice versa) is witnessed, the lattice is distributive, which is the standing assumption for the algebraic development.


Proof. Standard order-theoretic arguments using universal properties of meets and joins.

### Inclusion and Exclusion

***Inclusion and Exclusion*** (`InclusionAndExclusion`) record two fundamental oppositions. Inclusion is just the relation ≤, capturing when one recognition nests inside another. Exclusion (also called orthogonality) says that recognitions α and β are orthogonal, written α ⟂ β, precisely when their meet α ∧ β equals ⊥, i.e., they share no recognized context at all.



### Exclusion Symmetry

***Exclusion Symmetry*** (`ExclusionSymmetry`) says that orthogonality is symmetric: if α excludes β, then β excludes α because swapping the arguments of the meet α ∧ β leaves it unchanged.


Proof. x ⟂ y means x ∧ y = ⊥; by commutativity of ∧, y ∧ x = ⊥, hence y ⟂ x.

### Implication

***Implication*** (`Implication`) assigns to x, y ∈ R the element x ⇒ y defined as the greatest z ∈ R such that z ∧ x ≤ y (when it exists); read “when x holds, z suffices for y”.



### Recognition Structure

***Recognition Structure*** (`RecognitionStructure`) is the algebraic package


  RStruct = (R, ≤, ∧, ∨, ⇒, ⊥, ⊤)
in which R lists all recognitions available in the current analysis, ≤ records when one recognition includes another, the lattice operations ∧ and ∨ combine recognitions by shared refinement or shared extension, and the bounds ⊥ and ⊤ mark the empty and total recognitions. The implication ⇒ is the relational residuation: given recognitions α, β, γ ∈ R, the condition γ ≤ (α ⇒ β) precisely matches the inequality (γ ∧ α) ≤ β. When the tuple satisfies these interactions we say it forms a Recognition Structure. Additional structure—such as the Reflex endomap—may be attached explicitly when needed.

### Residuation Law

***Residuation Law*** (`ResiduationLaw`) explains that whenever recognitions α, β, and γ are taken from R, γ sits below the implication α ⇒ β exactly when the combined recognition γ ∧ α already fits inside β. Thus implication is determined entirely by how meets interact with the target recognition.


Proof. Immediate from the definition of ⇒ as the greatest such c; the two inequalities are equivalent by construction.

### Recognition Structure Laws

***Recognition Structure Laws*** (`RecognitionStructureLaws`) affirm that once finite meets, joins, and residuation exist for every pair of recognitions, the tuple (R, ≤, ∧, ∨, ⇒, ⊥, ⊤) automatically behaves as a *Recognition Structure*. These laws unpack into familiar inequalities: a recognition α combined with its own implication toward β always lies inside β; any recognition γ lies below α ⇒ β precisely when the meet γ ∧ α fits inside β; every recognition implies itself, so α ⇒ α coincides with ⊤; implying from ⊥ produces ⊤ because the null recognition never obstructs β; and the implication α ⇒ ⊥ serves as the relational negation of α. Each statement follows directly from residuation and the lattice properties.



### Relational Negation

***Relational Negation*** (`RelationalNegation`) takes any recognition α and forms the implication from α to ⊥. The resulting recognition, written ¬α, captures “anything whose coexistence with α forces contradiction.” Because this construction lives entirely inside the Recognition Structure, it does not assume classical double-negation collapse.



### Monotone Endomap

***Monotone Endomap*** (`MonotoneEndomap`) requires an endomap T : R → R to respect the recognition order: whenever recognition α is included in recognition β, their images obey T(α) ≤ T(β). This guarantees that applying T never reverses information.



### Fixed Point

***Fixed Point*** (`FixedPoint`) classifies recognitions relative to a process T: a recognition α is fixed when T(α) returns α itself; α is a pre-fixpoint when the process loses no information (T(α) ≤ α); and α is a post-fixpoint when the process can only add information (α ≤ T(α)).



### Idempotence at Fixed Points

***Idempotence at Fixed Points*** (`IdempotenceAtFixedPoints`) states that whenever the process T is monotone and never enlarges recognition α (so T(α) ≤ α), running T twice cannot produce more than a single pass, i.e., T(T(α)) ≤ T(α). If in addition α never sits below its T-image, then the inequalities force equality and T(α) itself is a fixed recognition.


Proof. Apply monotonicity to T(x) ≤ x to get T(T(x)) ≤ T(x). If also x ≤ T(x), then x, T(x) are both pre- and post-fixpoints, so equal by antisymmetry (when ≤ is a partial order; otherwise equality is equality in R’s extensional sense).

### Relational Morphism

***Relational Morphism*** (`RelationalMorphism`) refers to a map f : R → R' that faithfully transports recognitions from one Recognition Structure to another. It preserves the inclusion order, sends ⊥ to ⊥' and ⊤ to ⊤', carries meets to meets and joins to joins, and never overstates implication—whatever suffices for β after assuming α continues to suffice after applying f.



### Identity and Composition

***Identity and Composition*** (`IdentityAndComposition`) assert that every structure can map recognitions to themselves without losing information (the identity map satisfies all morphism requirements) and that chaining two faithful transports f and g yields another faithful transport g ∘ f.


Proof. For id: clearly id(⊥)=⊥, id(⊤)=⊤, id(x ∧ y)=x ∧ y, id(x ∨ y)=x ∨ y, and id(x ⇒ y)=x ⇒ y, with monotonicity trivial. For composition, let f,g be RelationalMorphisms. Then (g ∘ f)(⊥)=g(f(⊥))=g(⊥)=⊥ and similarly for ⊤. Monotonicity: x ≤ y ⇒ f(x) ≤ f(y) ⇒ g(f(x)) ≤ g(f(y)). Meets/joins: (g ∘ f)(x ∧ y)=g(f(x) ∧ f(y))=g(f(x)) ∧ g(f(y)); similarly for ∨. Implication: f(x ⇒ y) ≤ f(x) ⇒ f(y), then applying g’s implication inequality yields g(f(x ⇒ y)) ≤ g(f(x) ⇒ f(y)) ≤ g(f(x)) ⇒ g(f(y)). Thus g ∘ f is a RelationalMorphism.

### Substructure

***Substructure*** (`Substructure`) is a *Relational Structure* whose recognitions live inside a larger Recognition Structure. Concretely, a subset S ⊆ R qualifies when it contains ⊥ and ⊤, closes under meets, joins, and implication computed in the ambient structure, and inherits the same ≤ relation. The inclusion S ↪ R is automatically a Relational Morphism.


Proof. Closure assumptions ensure i preserves ⊥, ⊤, ∧, ∨, and satisfies i(x ⇒_S y) = x ⇒ y since ⇒ is computed in R and S is closed under it; monotonicity is immediate.

### Relational Structure

***Relational Structure*** (`RelationalStructure`) is the tuple


  RStruct = (R, ≤, ∧, ∨, ⇒, ⊥, ⊤, Reflex)
such that: (a) R, ≤, ∧, ∨, ⊥, ⊤ form a bounded distributive lattice; (b) ⇒ satisfies the Residuation Law making (R, ≤, ∧, ∨, ⇒, ⊥, ⊤) a *Recognition Structure*; (c) a designated Reflex endomap (when provided) is monotone and interprets the ρ‑operator.


## Calculus of Relational Language

The goal of this section is to present an internal λ-like language λ_R that expresses and manipulates recognitions and their operations, and to prove soundness into RelationalStructure.

Present an internal λ-like language λ_R that expresses and manipulates recognitions and their operations; prove soundness into RelationalStructure.

### Syntax and Judgements

### Types

***Types*** (`Types`) describe the shapes of recognitions manipulable inside the language. Start from primitive recognition types and freely form conjunction types A ∧ B, disjunction types A ∨ B, implication types A ⇒ B, and the distinguished units ⊥ and ⊤. Letters such as A, B, C range over these constructed shapes.



### Contexts

***Contexts*** (`Contexts`) list the recognitions currently assumed. A context Γ is a finite sequence x₁:A₁, …, xₙ:Aₙ; semantically, the entire context recognizes exactly the meet A₁ ∧ ⋯ ∧ Aₙ.



### Terms

***Terms*** (`Terms`) name concrete derivations within these contexts. They include variables referencing assumptions, the Reflex operator ρ applied to existing recognition terms, and the usual logical constructors: pairs ⟨t,u⟩ witnessing conjunction, injections inl t / inr u witnessing disjunction, abstractions λx.t and applications f t for implication, plus constants representing ⊤ (⋆) and the ability to explode ⊥ (abort : ⊥ → C).



Judgements. Typing: Γ ⊢ t : A. Equality/conversion: Γ ⊢ t ≡ u : A.

### Inference Rules (core)

Structural: weakening, exchange, substitution (admissible).

### Conjunction Rules

***Conjunction Rules*** (`ConjunctionRules`) state that whenever the context Γ proves recognition term t : A and recognition term u : B, their pairing ⟨t,u⟩ witnesses A ∧ B; conversely, projecting a term of type A ∧ B recovers its two components.



### Disjunction Rules

***Disjunction Rules*** (`DisjunctionRules`) assert that Γ may inject any term of type A (respectively B) into the left (respectively right) side of A ∨ B, and that any analysis of a disjunction proceeds by examining both labeled cases within Γ and reassembling the result.



### Implication Rules

***Implication Rules*** (`ImplicationRules`) capture the λ-calculus discipline: extending Γ with an assumption x:A and deriving t:B permits abstraction λx.t : A ⇒ B, while a term f:A ⇒ B applied to a term a:A yields f a : B.



### Bottom and Top Rules

***Bottom and Top Rules*** (`BottomAndTopRules`) record that a contradiction (a term of type ⊥) allows construction of any term via abort, while the unique inhabitant ⋆ witnesses ⊤ without further hypotheses.



### Reflex Rules

***Reflex Rules*** (`ReflexRules`) internalize the Reflex operator into the calculus: any derivation t:A yields ρ(t):A; if Γ already recognizes t ≤ u, then Reflex preserves that inequality; and when Reflex acts stably (ρ(t) ≤ t), it coincides with the underlying derivation.



### Semantics into RelationalStructure

### Standard Model

***Standard Model*** (`StandardModel`) semantics interpret the calculus inside any chosen Relational Structure. Each type denotes a recognition in R together with the existing lattice and implication operations; a context denotes the meet of its listed types; terms become monotone recognition-transformations that respect the constructors; and ρ acts by the designated Reflex endomap.



### Soundness

***Soundness*** (`Soundness`) proclaims that any derivation Γ ⊢ t : A in λ_R interprets to a valid recognition inequality inside every Relational Structure: the recognition denoted by Γ sits below the recognition denoted by A via the realization ⟦t⟧, and all equalities and rules translate to true order laws.


Proof. By induction on derivations. ∧/∨/⇒ rules correspond to universal properties and the Residuation Law Lemma. ρ-monotonicity follows from Reflex monotonicity. ⊥-elim and ⊤-intro are validated by ⊥, ⊤.

### Relational Language

***Relational Language*** (`RelationalLanguage`)λ_R refers to the syntax, judgments, and inference system just described, together with its interpretation into Relational Structures via the standard model clause.



### Operational Semantics and Metatheory

### Reduction Rules

***Reduction Rules*** (`ReductionRules`) describe when two terms represent the same recognition process. A single reduction step allows β-reduction (substituting arguments into abstractions), projection from pairs, case analysis on injections, reflex stability where ρ mirrors whatever reduction happens inside it, and the usual congruence steps that push reduction through larger contexts. Chaining these steps gives the multi-step reduction relation →*, and a term is in normal form when none of the generators apply.



### Preservation

***Preservation*** (`Preservation`) ensures that reduction never changes the recognition a term represents: if Γ proves t : A and t reduces to t′, then Γ still proves t′ : A.


Proof. By induction on the typing derivation of t; each reduction case corresponds to the matching introduction/elimination typing rule. ρ preserves typing by definition.

### Progress

***Progress*** (`Progress`) states that any closed term t : A is either already in canonical form or can take a reduction step, so well-typed programs never get stuck.


Proof. By induction on typing and canonical forms for ∧, ∨, ⇒, ⊥, ⊤. Closed values are either λ-abstractions, pairs of values, injections of values, ⋆, or an elimination redex exists; ρ does not block progress.

#### Theorem — Normalization

***Normalization Theorem*** (`NormalizationTheorem`).



Every well-typed λ_R term reduces to a normal form.

Proof (full, via reducibility candidates). We work with closed terms; the open-term case is handled by environments mapping variables to reducible terms.

### Strong Normalization

***Strong Normalization*** (`StrongNormalization`) says that a term t belongs to SN when no infinite reduction sequence starts from t; every reduction path must eventually end in a normal form.



### Context Closure of SN

***Context Closure of SN*** (`ContextClosureOfSn`) states that once a term t is strongly normalizing, wrapping it inside any evaluation context C built from application, pairing, injections, case expressions, projections, or the Reflex form ρ(·) keeps the overall expression strongly normalizing.


Proof. Any infinite reduction in C[t] would project to an infinite reduction in t or yield a contradiction with finiteness of context-driven steps; standard by structural induction on C and the fact that all redexes are within subterms except the finite top-level eliminations.

### Reducibility Candidates

***Reducibility Candidates*** (`ReducibilityCandidates`) associate to each type A a collection ⟦A⟧ of closed, strongly normalizing terms that behave well with respect to the type’s eliminations. For example, ⟦⊤⟧ and ⟦⊥⟧ contain exactly the strongly normalizing proofs of ⊤ and ⊥; ⟦A ∧ B⟧ contains those normalizing pairs whose projections already inhabit ⟦A⟧ and ⟦B⟧; ⟦A ∨ B⟧ contains normalizing sums that, when analyzed by any closed eliminator, yield a term in the target candidate; ⟦A ⇒ B⟧ contains normalizing functions turning every member of ⟦A⟧ into a member of ⟦B⟧; and the closure clause ensures that ρ(t) stays in ⟦A⟧ whenever t does.



### Basic Properties of Candidates

***Basic Properties of Candidates*** (`BasicPropertiesOfCandidates`) collect the standard closure facts: each candidate is stable under reduction, consists solely of strongly normalizing terms, and embraces introduction forms built from reducible parts whenever it already contains all closed eliminations for the type.


Proof. By simultaneous induction on type structure and reduction length; standard proofs for simply-typed λ-calculus with products and sums apply. For ρ, use the Context Closure of SN and that ρ only reduces through its subterm; closure follows since premises quantify over all eliminations and applications, which are preserved under a single internal reduction step.

### Reducible Environment

***Reducible Environment*** (`ReducibleEnvironment`) means an assignment of closed terms to each variable x:A in Γ such that the assigned term already belongs to the candidate ⟦A⟧.



### Substitution for Reducibility

***Substitution for Reducibility*** (`SubstitutionForReducibility`) states that whenever t : A is derivable under Γ and every variable in Γ is realized by a term from the matching candidate (a reducible environment), substituting those realizers into t yields a closed term in ⟦A⟧.


Proof. By induction on the typing derivation of t. Representative cases:
• Variable: t ≡ x and t[E] = E(x) ∈ ⟦A⟧ by definition of E.
• Pair/Projections and Injections/Case: use IH on subderivations and the corresponding clauses in candidates; sums quantify over all closed eliminations, which includes the specific case term.
• Abstraction: suppose Γ,x:B ⊢ t : C, and let v ∈ ⟦B⟧; by IH on t with environment E extended by x↦v we get t[E,x↦v] ∈ ⟦C⟧; thus λx.t[E] ∈ ⟦B ⇒ C⟧.
• Application: IH gives f[E] ∈ ⟦B ⇒ C⟧ and a[E] ∈ ⟦B⟧; hence f[E] a[E] ∈ ⟦C⟧.
• ⊥-elim and ⊤-intro: immediate from definitions and SN closure.
• ρ: if Γ ⊢ t : A then by IH t[E] ∈ ⟦A⟧, and by ρ-closure ρ(t[E]) ∈ ⟦A⟧.

#### Theorem — Fundamental Theorem of Logical Relations

***Fundamental Theorem of Logical Relations Theorem*** (`FundamentalTheoremOfLogicalRelationsTheorem`).



If Γ ⊢ t : A and E is a reducible environment for Γ, then t[E] ∈ ⟦A⟧.
Proof. This is the Substitution Lemma for Reducibility.

Conclusion. For closed ⊢ t : A, take the empty environment; by the Fundamental Theorem, t ∈ ⟦A⟧, hence SN(t). Therefore every well-typed closed term is strongly normalizing. Progress ensures any reduction leads to a normal form. This completes the normalization proof.

#### Theorem — Confluence (Church–Rosser, Sketch)

***Confluence (Church–Rosser, Sketch) Theorem*** (`ConfluenceChurchRosserSketchTheorem`).



If t →* u and t →* v, then there exists w with u →* w and v →* w.
Sketch. Define a standard parallel reduction ⇒ that contracts all disjoint redexes in one step (including β, projections, case) and propagates through ρ by reducing its subterm. Show: (i) → ⊆ ⇒ and ⇒ ⊆ →*, (ii) ⇒ has the diamond property by standard critical‑pair analysis for simply‑typed λ with products/sums; ρ is a context former and introduces no overlaps, (iii) hence ⇒ is confluent. Since normalization holds, Newman’s Lemma yields Church–Rosser for →.


## Dynamics of Relational Geometry

The goal of this section is to equip RelationalStructure with nucleus-like operators and a flow, stated purely relationally, and to develop fixed-point substructures and their interaction.

Equip RelationalStructure with nucleus-like operators and a flow, stated purely relationally; develop fixed-point substructures and their interaction.

### Relational Nucleus

***Relational Nucleus*** (`RelationalNucleus`) is an endomap ν : R → R placed on a Relational Structure to concentrate recognitions. It must respect the inclusion order, act idempotently, and choose a polarity: closure-like nuclei enlarge recognitions (x ≤ ν(x)) while interior-like nuclei shrink them (ν(x) ≤ x). Each polarity comes with compatibility equations describing how ν interacts with meets and joins so that repeated application of ν cooperates with the lattice operations.



### Fixed-Point Substructures

***Fixed-Point Substructures*** (`FixedPointSubstructures`) record that the recognitions stabilized by a closure-like nucleus (those satisfying ν(x) = x) themselves assemble into a Substructure: they contain ⊥ and ⊤, and the inherited ∧, ∨, ⇒ stay inside the fixed set. The dual statement holds for interior-like nuclei, where the ν-open recognitions form a substructure closed under ∧ and ⇒ while remaining upward-closed for ∨ once ν is applied.


Proof. For closure-like ν: ∧-closure from algebraic compatibility; ∨-closure from the stated equality; ⇒-closure follows since if a,b are closed then ν(a⇒b) ≥ a⇒b and also ≤ by monotonicity with a∧(a⇒b) ≤ b and idempotence, yielding equality. Dual statements for interior-like ν.

### Relational Geometry

***Relational Geometry*** (`RelationalGeometry`) enhances a Relational Structure with a specified family of nuclei {ν_i}, together with any stated interaction laws (such as commuting compositions). The geometry tracks how recognitions evolve under multiple, possibly overlapping stabilization processes.



### Relational Flow

### Relational Flow

***Relational Flow*** (`RelationalFlow`) is an endomap F : R → R describing how recognitions move forward in “time.” It preserves the inclusion order, tends toward idempotence (successive applications do not introduce new information beyond one step), chooses a directionality (inflationary flows expand recognitions while deflationary flows contract them), and satisfies whatever compatibility the geometry specifies with nuclei—for instance, a closure-like flow may require ν(F(x)) to dominate F(ν(x)).



#### Lemma — Fixed Sets

***Fixed Sets Lemma*** (`FixedSetsLemma`).



Under monotonicity and lax-idempotence, Fix(F) = {x | F(x)=x} is closed under ∧; if F is idempotent and R distributes, also under ∨ and ⇒.
Proof. If F is idempotent: F(x∧y) ≤ F(x)∧F(y) = x∧y and x∧y ≤ F(x∧y), hence equality. Similarly for ∨ using monotonicity and distributivity. For ⇒, use residuation with F(x∧(x⇒y)) ≤ F(y).

#### Proposition — Flow–Nucleus Compatibility

***Flow–Nucleus Compatibility Proposition*** (`FlowNucleusCompatibilityProposition`).



If F ∘ ν ≤ ν ∘ F for closure-like ν, then ν-closed recognitions are forward-invariant: ν(x)=x ⇒ ν(F(x))=F(x). The dual statement holds for interior-like ν with ν ∘ F ≤ F ∘ ν.
Proof. ν(F(x)) ≥ F(ν(x)) = F(x), but also ν(F(x)) ≤ F(x) since x is ν-closed and ν is extensive; hence equality.

#### Theorem — Fixed-Point Existence

***Fixed-Point Existence Theorem*** (`FixedPointExistenceTheorem`).



Assume R is ω-complete (every ascending ω-chain has a least upper bound). If F is inflationary and monotone, then for any x, the chain x ≤ F(x) ≤ F²(x) ≤ … has a least upper bound l with F(l) = l. Dually for deflationary F in ω-op-complete R.
Proof. Let l := ⋁_{n∈ℕ} Fⁿ(x). Monotonicity gives F(l) = F(⋁ Fⁿ(x)) ≥ ⋁ F^{n+1}(x) = l and also l ≥ F(l), so equality.

#### Proposition — Transport of Fixed Points

***Transport of Fixed Points Proposition*** (`TransportOfFixedPointsProposition`).



Let f : R → R' be a RelationalMorphism between RelationalStructures, and let F : R → R and F' : R' → R' be flows such that f ∘ F = F' ∘ f. If x is F-fixed (F(x)=x), then f(x) is F'-fixed (F'(f(x))=f(x)).
Proof. F'(f(x)) = f(F(x)) = f(x).

#### Proposition — Transport of Nucleus Fixed Points

***Transport of Nucleus Fixed Points Proposition*** (`TransportOfNucleusFixedPointsProposition`).



Let f : R → R' be a RelationalMorphism, and let ν, ν' be nuclei on R and R' with f ∘ ν = ν' ∘ f. If x is ν-closed (ν(x)=x), then f(x) is ν'-closed (ν'(f(x))=f(x)).
Proof. ν'(f(x)) = f(ν(x)) = f(x).

#### Definition — RelationalGeometry (Final)

A RelationalGeometry is a RelationalStructure with chosen nuclei and a flow F satisfying the Relational Flow Definition and any stated completeness assumptions when fixed-point existence is required.

### Dynamic Residuation Along Flow

#### Definition — Flow‑Indexed Implication

For a monotone flow F and recognitions a,b, define the flow‑indexed implication a ⇒_F b to be the greatest z (when it exists) such that F(z ∧ a) ≤ b (inflationary case) or z ∧ F(a) ≤ b (deflationary case).

#### Lemma — Dynamic Residuation Law

***Dynamic Residuation Law Lemma*** (`DynamicResiduationLawLemma`).



For all c, a, b, c ≤ (a ⇒_F b) iff F(c ∧ a) ≤ b (inflationary) or c ∧ F(a) ≤ b (deflationary).
Proof. Immediate from the definition as the greatest such c, using monotonicity of F and meet.

#### Proposition — Dynamic Residuation

***Dynamic Residuation Proposition*** (`DynamicResiduationProposition`).



With Flow‑Indexed Implication and the Dynamic Residuation Law Lemma, the usual *Recognition Structure* reasoning internalizes along F: a ∧ (a ⇒_F b) evolves under F to be ≤ b, and c ≤ (a ⇒_F b) iff the corresponding inequality with F holds as above.
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
***Regime(D) Forms a RelationalStructure Proposition*** (`RegimeDFormsARelationalstructureProposition`).



Regime(D) is closed under ∧, ∨, ⇒, contains ⊥ and ⊤, inherits the *Recognition Structure* operations, and all nuclei/flow restrict to Regime(D).

#### Definition — Composite Discipline
Two Disciplines D₁, D₂ commute when D₁(D₂(x)) = D₂(D₁(x)) for all x.  
When they commute, their Composite Discipline is  
  D₁₂ := D₁ ∘ D₂ = D₂ ∘ D₁.

#### Definition — Composite Regime
For a commuting family {Dᵢ}, their Composite Regime is  
  Regime({Dᵢ}) := ⋂ᵢ Regime(Dᵢ),  
the recognitions stable under every Discipline in the family.

#### Proposition — Composite Regime is a RelationalStructure
***Composite Regime is a RelationalStructure Proposition*** (`CompositeRegimeIsARelationalstructureProposition`).



Regime({Dᵢ}) is a substructure closed under the *Recognition Structure* operations with inherited nuclei and flow, and equals the Regime of the composite Discipline.

## Mechanics of Relational Physics

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

***Invariants Proposition*** (`InvariantsProposition`).



F-fixed recognitions are dynamical invariants. If ν is compatible with F (the Flow–Nucleus Compatibility Proposition), then ν-fixed recognitions define conserved or idealised quantities preserved along evolution.
Proof. If F(x)=x, invariance is immediate. If ν(F(x))=F(ν(x)) and ν(x)=x then ν(F(x))=F(x), hence preserved.

#### Proposition — Reachability

***Reachability Proposition*** (`ReachabilityProposition`).



For inflationary F, the least F-closed y with x ≤ y equals ⋁_{n} Fⁿ(x); this is the forward-reachable closure. For deflationary F, ⋀_{n} Fⁿ(x) gives the backward-stable core.
Proof. Direct from the Fixed-Point Existence Theorem by least/greatest fixed-point characterisations in ω-(op-) complete settings.

#### Theorem — Soundness of Physical Semantics

***Soundness of Physical Semantics Theorem*** (`SoundnessOfPhysicalSemanticsTheorem`).



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

***Well‑Defined Operations Lemma*** (`WellDefinedOperationsLemma`).



The operations ∧, ∨, ⇒ on R_Γ are well‑defined w.r.t. ≡_Γ and are monotone in each argument.
Proof. By congruence of λ_R typing under substitution and introduction/elimination rules; mutual derivability preserves and is preserved by forming ∧, ∨, ⇒ terms.

#### Theorem — Syntactic Structure

***Syntactic Structure Theorem*** (`SyntacticStructureTheorem`).



(R_Γ, ≤, ∧, ∨, ⇒, ⊥, ⊤) is a RelationalStructure; the Residuation Law Lemma holds for ⇒; hence R_Γ is a *Recognition Structure*.
Proof. Use the Well‑Defined Operations Lemma and interpret ≤_Γ as entailment. ∧/∨ satisfy the bounded distributive lattice laws by the λ_R rules. The Residuation Law mirrors ⇒‑intro/elim. Reflex acts as the identity on types (ρ preserves types) and is monotone on recognition types when interpreted by a monotone Reflex endomap.

## Completeness via the Canonical Model

#### Definition — Semantic Entailment

Γ entails A, written Γ ⊨ A, when for every RelationalStructure RStruct and interpretation of Γ into R, the denotation of Γ is ≤ the denotation of A.

#### Theorem — Syntactic Completeness

***Syntactic Completeness Theorem*** (`SyntacticCompletenessTheorem`).



If Γ ⊨ A then Γ ⊢ t : A for some t in λ_R.
Proof. Suppose not. Then A ∉ the upward closure of Γ in the preorder ≤_Γ. In the Syntactic Recognitions structure R_Γ, interpret each type by its class [·]. By construction, the denotation of Γ is not ≤ the denotation of A (since that would witness a derivation). This contradicts Γ ⊨ A. Hence Γ ⊢ A.

#### Corollary — Adequacy

λ_R is both sound (Soundness Theorem) and complete (Syntactic Completeness Theorem) for RelationalStructures in the sense defined in this treatise.


## Derived Nucleus and Flow Laws

#### Proposition — Closure Absorption

***Closure Absorption Proposition*** (`ClosureAbsorptionProposition`).



For a closure‑like ν and recognitions x,y, x ∧ ν(y) ≤ ν(x ∧ y) and ν(x) ∨ y ≤ ν(x ∨ y). Moreover, if y is ν‑closed, then x ∧ y ≤ ν(x ∧ y) = x ∧ y and ν(x) ∨ y = ν(x ∨ y) ≥ y.
Proof. From algebraic compatibility and idempotence.

#### Proposition — Interior Distribution

***Interior Distribution Proposition*** (`InteriorDistributionProposition`).



For an interior‑like ν and recognitions x,y, ν(x ∧ y) = ν(x) ∧ ν(y) and ν(x ∨ y) ≤ ν(x) ∨ ν(y). If x,y are ν‑open, then ν(x ∨ y) = x ∨ y.
Proof. By the interior compatibility axioms and idempotence.

#### Proposition — Nucleus Distributive Equalities

***Nucleus Distributive Equalities Proposition*** (`NucleusDistributiveEqualitiesProposition`).



For a closure‑like ν and recognitions x,y, ν(x ∧ ν(y)) = ν(x ∧ y) and ν(ν(x) ∨ y) = ν(x ∨ y). Dual equalities hold for an interior‑like ν.
Proof. Use monotonicity, idempotence, and the algebraic compatibility axioms; both directions follow from ν(y) ≥ y (closure‑like) and ν(ν(y))=ν(y).

#### Proposition — Flow Distributes over Meets

***Flow Distributes over Meets Proposition*** (`FlowDistributesOverMeetsProposition`).



If F is a monotone flow, then: if F is inflationary, F(x ∧ y) ≤ F(x) ∧ F(y); if F is deflationary, F(x) ∧ F(y) ≤ F(x ∧ y).
Proof. Use monotonicity and directionality: inflationary gives x ≤ F(x), y ≤ F(y), hence x ∧ y ≤ F(x) ∧ F(y) and by monotonicity F(x ∧ y) ≤ F(x) ∧ F(y). The deflationary case dualises.

#### Proposition — Temporal Closure

***Temporal Closure Proposition*** (`TemporalClosureProposition`).



If F is an inflationary, idempotent flow, define □x := Fix(F) ∧ x and ◇x := ⋁_{n} Fⁿ(x) when the join exists. Then □ is interior‑like on Fix(F) and ◇ is closure‑like; both commute with any ν that is compatible with F (Flow–Nucleus Compatibility Proposition).
Proof. Immediate from Fixed Sets Lemma, Fixed‑Point Existence Theorem, and Flow–Nucleus Compatibility.

#### Proposition — Principal Closure

***Principal Closure Proposition*** (`PrincipalClosureProposition`).



For any recognition k, the assignment ν_k(x) := x ∨ k is a closure‑like nucleus: it is monotone, extensive, and idempotent; its fixed points are precisely the recognitions y with k ≤ y.
Proof. Monotone and extensive are immediate from ∨. Idempotence: ν_k(ν_k(x)) = (x ∨ k) ∨ k = x ∨ k. Fixed points equal {y | y = y ∨ k} which is equivalent to k ≤ y.

#### Proposition — Dual Interior from Closure

***Dual Interior from Closure Proposition*** (`DualInteriorFromClosureProposition`).



Suppose negation ¬(·) is an antitone operation satisfying De Morgan‑style laws with ∧, ∨ (as in a *Recognition Structure* setting with relative negation). For any closure‑like ν, define δ(x) := ¬ν(¬x). Then δ is interior‑like and satisfies the interior compatibility laws.
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

Elements of Profile(Filter) are called Filter-stable recognitions.

### Proposition — Profile as RelationalStructure

***Profile as RelationalStructure Proposition*** (`ProfileAsRelationalstructureProposition`).



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

***Reflex Stability Lemma*** (`ReflexStabilityLemma`).



If x ∈ Profile(Filter), then ρ(x) ∈ Profile(Filter).

Proof.  
Filter(x) = x and Filter(ρ(x)) = ρ(Filter(x)) = ρ(x); hence ρ(x) is Filter-stable.

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

***ProfileLanguage Soundness Proposition*** (`ProfilelanguageSoundnessProposition`).



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

***ProfileGeometry is a RelationalGeometry Proposition*** (`ProfilegeometryIsARelationalgeometryProposition`).



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

***ProfilePhysics Soundness Theorem*** (`ProfilephysicsSoundnessTheorem`).



Interpreting λ_Profile in ProfilePhys(Filter) yields:

If Γ ⊢ t : A in λ_Profile, then under any evolution by F|_Profile and any nucleus νᵢ|_Profile, denotations respect ≤ and all invariants declared by ProfileGeom(Filter) are maintained.

Proof.  
This is an instance of the Soundness of Physical Semantics Theorem, applied to ProfileGeom(Filter). All required compatibility properties hold by restriction from Geom.

### Theorem — Filter-Induced Reflexive Reconstruction

***Filter-Induced Reflexive Reconstruction Theorem*** (`FilterInducedReflexiveReconstructionTheorem`).



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

***Composite Profile as RelationalStructure Proposition*** (`CompositeProfileAsRelationalstructureProposition`).



Profile({Filterᵢ}), with the inherited operations

  (≤, ∧, ∨, ⇒, ⊥, ⊤),

is a RelationalStructure.

*Proof.*  
Each Profile(Filterᵢ) is a substructure closed under the *Recognition Structure* operations.  
Finite intersections of subsets closed under the *Recognition Structure* operations remain closed.

#### Proposition — Composite ProfileGeometry

***Composite ProfileGeometry Proposition*** (`CompositeProfilegeometryProposition`).



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

***Profile Tower Theorem*** (`ProfileTowerTheorem`).



Given Filters acting on Profiles of Filters, the iterated construction

  Profile → ProfileStructure → ProfileLanguage → ProfileGeometry → ProfilePhysics

reconstructs at every level.  
Nested Profiles and Composite Profiles both inherit the full Treatise chain.

*Proof.*  
Immediate from the Profile and Composite Profile propositions and from the fact that restrictions of nuclei, flow, Reflex, and the *Recognition Structure* operations satisfy all axioms on each stable domain.

### Remark — Recursive Profiles

Filters on ProfileGeom(Filter) yield further Profiles.  
Thus Filters induce a recursive hierarchy of internal relational universes, each carrying its own Structure, Language, Geometry, and Physics, all defined purely in the relational vocabulary of this Treatise.

## Appendices

### Relational Text Syntax

In text, *Relational Terms* are written in ***Strong Emphasized Title Case*** when they are being defined, and *Emphasize Title Case* when they are being referenced, with a parentheticized `MonospacePascalCase` representation of how they will be used in our Relational Expression Syntax. For example, “A ***Relational Term*** (`RelationalTerm`) is symbol used to represent a *Recognition*.” After being defined in prose, the term must be given concretely in a code block, e.g.




### Relational Expression Syntax

This appendix specifies the concrete syntax of the Relational Expression Language used throughout this text. All expressions are S-expressions. An expression denotes either a recognition or a unary recognition-endomap. The syntax is fully prefix, with no infix forms and no implicit precedence.

#### Tokens

The language consists of three token types:

1. **Opening parenthesis**: `(`  
2. **Closing parenthesis**: `)`  
3. **Atoms**: any Unicode string that does not contain an unescaped parenthesis or whitespace, or any Unicode string enclosed in quotation marks.  
   - Atoms may contain arbitrary Unicode characters.  
   - Whitespace inside an atom is only permitted when enclosed in quotation marks.  
   - Quotation marks may be escaped within quoted atoms.  
   - Atoms are case-sensitive.

Whitespace outside atoms separates tokens and has no semantic meaning.

#### Expressions

An expression is either:
- a single atom, or  
- a parenthesized, nonempty sequence of expressions: `(E₁ E₂ … Eₙ)`.

The first expression inside the parentheses is the **head**. All remaining expressions are **arguments**. Application is prefix and left-associative. No arity is implied by syntax; arity is determined only by evaluation rules.

#### Reserved Heads

The following heads are reserved and must not be redefined:

`bottom`, `top`, `meet`, `join`, `imply`, `reflex`, `neg`, `fn`.

All other atoms may be used freely as variable names or operator names.

#### Binding Forms

Only one binding form exists:

- ***Operator definition*** (`OperatorDefinition`) — `(fn name? (p₁ … pₖ) body)`  


  - `name?` is either an atom (to bind the operator) or omitted entirely for an anonymous function, and `p₁ … pₖ` are atoms.  
  - With a name, the closure is equivalent to a nested sequence of unary functions and the binding extends the evaluation environment. Without a name, the closure is returned immediately without adding a top-level binding.

#### Evaluation Model

Evaluation is deterministic.

1. An atom evaluates to the value bound to it in the environment.  
2. `(bottom)` and `(top)` evaluate to their distinguished recognition values.  
3. `(meet E₁ E₂)`, `(join E₁ E₂)`, `(imply E₁ E₂)`, `(reflex E)`, `(neg E)` evaluate by:
 - evaluating their arguments, then  
 - invoking the corresponding primitive recognition operation of the current Relational Structure.
4. `(fn name? (p₁ … pₖ) body)` evaluates the body under nested unary binding of the listed parameters. If a `name` is provided, the resulting closure is bound in the environment under that atom; otherwise the closure is returned directly without introducing a binding.
6. Any list `(H A₁ … Aₙ)` where `H` evaluates to a closure is treated as iterative unary application: `(((H A₁) A₂) … Aₙ)`.  
7. Any list whose head does not evaluate to a closure or a reserved primitive is an error.
8. All fully evaluated expressions yield either a recognition value or a closure; closures are only applied and do not themselves denote recognitions.

#### Augmented Backus Naur Form

```abfn
program        = 1*sexpr

sexpr          = atom / list

list           = "(" 1*sexpr ")"

atom           = bare-atom / quoted-atom

bare-atom      = 1*bare-char
bare-char      = bare-ascii / utf8-non-ascii

bare-ascii     = %x21 / %x23-27 / %x2A-7E

quoted-atom    = DQUOTE *quoted-char DQUOTE

quoted-char    = escaped / unescaped

escaped        = %x5C ( WS / VCHAR / unicode-non-ascii )

unescaped      = WS / unescaped-ascii / unicode-non-ascii

unescaped-ascii = %x21 / %x23-5B / %x5D-7E

unicode-non-ascii = %x80-D7FF / %xE000-10FFFF

WS             = WSP / %x0A / %x0D

DQUOTE         = %x22
