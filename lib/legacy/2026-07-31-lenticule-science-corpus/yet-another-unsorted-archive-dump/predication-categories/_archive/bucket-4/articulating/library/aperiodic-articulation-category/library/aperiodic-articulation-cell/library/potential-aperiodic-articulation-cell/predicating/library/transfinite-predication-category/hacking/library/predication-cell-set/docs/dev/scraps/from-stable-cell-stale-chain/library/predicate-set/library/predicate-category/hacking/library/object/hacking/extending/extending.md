---
title: "Extends"
description: "Extension is a relation A extends B — written B ≤ A or B ↪ A — asserting that B embeds in A as a sub-structure: there exists a monomorphism (structure-preserving injection) ι: B → A that commutes with all operations. The defining structure: A contains all of B (via ι) and may contain more. Extension is not mere inclusion of sets — it requires structure preservation: the embedding ι must respect the algebraic, logical, or categorical structure at stake. Extension is a preorder: reflexive (B ≤ B via the identity), transitive (B ≤ A and A ≤ C implies B ≤ C via composition), and generates a partial order on the equivalence classes of mutual extensions."
defines: Extends
related: Refines, Satisfies, FieldExtension, TheoryExtension, KanExtension, LiskovSubstitution
date-created: 2026-03-20
---

## Formal definition

**Extension** is a relation $B \leq A$ (read: $A$ extends $B$, or $B$ embeds in $A$):

$$B \leq A \quad\text{iff}\quad \exists\; \iota : B \hookrightarrow A \;\text{ (monomorphism)}$$

where:
- $B$ and $A$ are **structures** of the same signature — sets, algebras, topological spaces, categories, theories, or any other mathematical objects; the notion of extension depends on what kind of structure is at stake
- $\iota : B \hookrightarrow A$ is a **monomorphism** (injective structure-preserving map) — a morphism that (i) is injective on elements and (ii) preserves all structure (operations, relations, axioms) of $B$ within $A$; the monomorphism makes $B$ an isomorphic copy of a sub-structure of $A$
- "Structure-preserving" means: for each $n$-ary operation $f$ of $B$, $\iota(f^B(b_1, \ldots, b_n)) = f^A(\iota(b_1), \ldots, \iota(b_n))$; and for each predicate $R$ of $B$, $R^B(b_1, \ldots, b_n) \Leftrightarrow R^A(\iota(b_1), \ldots, \iota(b_n))$

**The extension preorder**: $\leq$ is a preorder on structures of a given signature:
- **Reflexivity**: $B \leq B$ via the identity morphism $\mathrm{id}_B$
- **Transitivity**: if $\iota_1 : B_1 \hookrightarrow B_2$ and $\iota_2 : B_2 \hookrightarrow B_3$, then $\iota_2 \circ \iota_1 : B_1 \hookrightarrow B_3$

**Extension is not implication**: a structure can extend another without implying it in any logical sense. The embedding $\iota$ is a structural containment, not a logical entailment.

**Extension vs. refinement**: extension requires a literal structural embedding $\iota : B \hookrightarrow A$ — $A$ literally contains a copy of $B$. Refinement requires only that $A$'s behaviors are a subset of $B$'s — no structural embedding required. Extension implies refinement (if $A$ extends $B$, every behavior of $A$ is compatible with $B$'s structure) but refinement does not imply extension.

## Algebraic extensions

**Field extensions** (Lang, *Algebra*, 1965): a **field extension** $L/K$ is a field $L$ together with a field homomorphism $\iota : K \hookrightarrow L$ making $L$ a $K$-algebra. The extension $L/K$ has:
- **Degree** $[L : K] = \dim_K L$ (the dimension of $L$ as a $K$-vector space)
- Simple extension: $L = K(\alpha)$ for a single element $\alpha \in L$; if $\alpha$ is a root of an irreducible polynomial $p(x) \in K[x]$, the extension is **algebraic** of degree $\deg(p)$; if $\alpha$ is transcendental over $K$, the extension is **transcendental**

**Galois extensions** (Galois 1832, formalized by Artin 1942): a finite algebraic extension $L/K$ is **Galois** iff $|Aut(L/K)| = [L : K]$. The **Galois group** $\mathrm{Gal}(L/K) = Aut(L/K)$ is the group of field automorphisms of $L$ fixing $K$ pointwise. The **fundamental theorem of Galois theory** establishes a bijection between: intermediate fields $K \subseteq E \subseteq L$ and subgroups $H \leq \mathrm{Gal}(L/K)$ — via $E \mapsto \mathrm{Gal}(L/E)$ and $H \mapsto L^H$ (fixed field of $H$). This is the archetypal theorem relating the extension structure (the lattice of intermediate fields) to a group-theoretic object (the lattice of subgroups), and is the prototype of Galois theory in its general form.

**Ring extensions and integral extensions**: $B$ is an integral extension of $A$ (where $A \hookrightarrow B$ as rings) iff every element of $B$ is integral over $A$ — satisfies a monic polynomial with coefficients in $A$. The going-up and going-down theorems (Cohen-Seidenberg) describe how prime ideals of $A$ extend and contract along an integral extension.

## Theory extensions in logic

**Theory extension**: a theory $T_2$ (a set of sentences in a first-order language) **extends** theory $T_1$ iff $T_1 \subseteq T_2$ — every axiom of $T_1$ is an axiom of $T_2$, and therefore every theorem of $T_1$ is a theorem of $T_2$.

**Conservative extension**: $T_2$ is a **conservative extension** of $T_1$ iff $T_2$ proves no new theorems in the language of $T_1$ — $T_2 \vdash \phi$ implies $T_1 \vdash \phi$ for every sentence $\phi$ in $L(T_1)$. A conservative extension adds new vocabulary or new axioms about the new vocabulary without changing what is provable in the old language. Conservative extensions are safe: they add expressive power without changing existing commitments.

**Non-conservative extension**: if $T_2$ extends $T_1$ but there exists a sentence $\phi \in L(T_1)$ with $T_2 \vdash \phi$ but $T_1 \not\vdash \phi$, then $T_2$ is a non-conservative extension. Non-conservative extensions add new theorems in the original language — they change the theory's commitments, not just its vocabulary.

**Craig's interpolation theorem** (Craig 1957): if $T_1 \vdash \phi$ (where $T_1$ is a theory and $\phi$ a sentence in an extended language), there exists an **interpolant** $\psi$ in the common language $L(T_1) \cap L(\phi)$ such that $T_1 \vdash \psi$ and $\psi \vdash \phi$. This is the fundamental theorem governing what can be "lifted" from an extension back to the base theory.

## Liskov substitution principle

Barbara Liskov and Jeannette Wing (*A Behavioral Notion of Subtyping*, 1994) formalized the **Liskov Substitution Principle** for type systems:

> "Let $\varphi(x)$ be a property provable about objects $x$ of type $T$. Then $\varphi(y)$ should be true for objects $y$ of type $S$ where $S$ is a subtype of $T$."

$S$ **subtypes** (extends) $T$ iff every instance of $S$ can be substituted for an instance of $T$ without violating any property that $T$ guarantees. This is the behavioral content of extension for type systems: the subtype extends the supertype not merely by having more methods, but by preserving all behavioral guarantees.

Liskov and Wing give four formal conditions for $S <: T$:

1. **Precondition rule** (contravariant): for each method $m$, $\mathrm{pre}_T(m) \Rightarrow \mathrm{pre}_S(m)$ — the subtype may not strengthen preconditions; it must accept all inputs the supertype accepts.

2. **Postcondition rule** (covariant): for each method $m$, $\mathrm{post}_S(m) \Rightarrow \mathrm{post}_T(m)$ — the subtype may not weaken postconditions; it must establish everything the supertype guarantees.

3. **Invariant rule**: $\mathrm{inv}_T(x) \Rightarrow \mathrm{inv}_S(x)$ — every value satisfying $T$'s invariant also satisfies $S$'s invariant; the subtype preserves all type invariants.

4. **History constraint** (the key addition): for any sequence of operations permitted on an object of type $S$, the corresponding state transitions are also permitted by type $T$'s behavioral specification. A subtype cannot introduce new mutable state transitions that the supertype's history would prohibit — subtype-only methods cannot violate supertype invariants that depend on the object's history. This rules out, for example, a mutable subtype of an immutable supertype.

The Liskov Substitution Principle is the type-theoretic formulation of extension: $S$ extends $T$ iff $S$ is a behavioral subtype of $T$ — $S$ embeds into $T$'s behavioral specification with all structural and behavioral guarantees preserved.

## Kan extensions in category theory

F. William Lawvere (1963) and Daniel Kan (*Adjoint Functors*, 1958) identified **Kan extensions** as the universal extension operation in category theory:

Given functors $F : \mathcal{C} \to \mathcal{E}$ and $K : \mathcal{C} \to \mathcal{D}$, the **left Kan extension** $\mathrm{Lan}_K F : \mathcal{D} \to \mathcal{E}$ is the universal functor such that $\mathrm{Lan}_K F \circ K \cong F$ — it extends $F$ along $K$ in the most general way. Universality: any functor $G : \mathcal{D} \to \mathcal{E}$ with $G \circ K \cong F$ factors through $\mathrm{Lan}_K F$ via a unique natural transformation.

Kan extensions are the fundamental extension operation in category theory — they generalize: adjoint functors (as Kan extensions along the unique functor to the terminal category), sheafification (left Kan extension along the inclusion of a site), and nerve-realization adjunctions (geometric realization as a Kan extension). Lawvere's dictum: "All concepts are Kan extensions."

The extension formula (when $\mathcal{D}$ has colimits): $(\mathrm{Lan}_K F)(d) = \int^{c \in \mathcal{C}} \mathcal{D}(Kc, d) \cdot Fc$ — the weighted colimit of $F$ over all $c$ with $Kc$ mapping to $d$.

## Open questions

- Whether the relationship between field extensions and Galois theory (the Galois correspondence between subextensions and subgroups) has a direct analogue for theory extensions — whether there is a "Galois group" of a theory extension that classifies the intermediate theories between $T_1$ and $T_2$.
- Whether Liskov behavioral subtyping (extension for types) and Kan extension (extension for functors) are the same concept seen in different categories — whether the Liskov condition is the type-theoretic instance of the Kan extension's universal property in some appropriate 2-category of type specifications.
- Whether the extension preorder on structures corresponds to the sub-object order in the topos $\mathbf{Sh}(T, J)$ — whether $B \leq A$ as structures corresponds to $B \hookrightarrow A$ as a sub-object in the sheaf topos, and whether the extension lattice is the sub-object lattice.
- Whether conservative extensions (which add vocabulary without changing provable sentences) correspond to adjoint equivalences in the corresponding category of models — whether the models of a conservative extension are equivalent to the models of the base theory, making conservative extension the categorical analogue of adding definitional extensions.
