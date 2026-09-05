---

name: stewardable-semiotic-concept-universe
member-of:
  - semiotic-universe
keywords:
  - semiotics
  - mathematical-universe
  - knowledge-management
completeness: "~25% — Abstract and Sections 1-1.2 complete; annotation calculus through coherence theorems need writing"
unique-concepts:
  - annotation calculus for concept-level surface structure
  - constant-identity groupoid
  - failure semantics and partiality
  - semantic delta and subtraction
  - stewardship operators and interface algebra
  - provenance semantics
nomenclature: generative-sheaf-universe
publish-to:
  - emsenn-net
  - math-papers
---

## A Modal–Comonadic Heyting Framework for Stewardable Semantic Concepts  
### *with Annotation Calculus, Constant Identity, Failure Semantics, Provenance, Delta, Subtraction, Interface Algebra, Fibration, Sheaf Semantics, and Coherence Theorems*

**Author:** emsenn  
**Date:** December 2025  

---

# Abstract

We extend the *Semiotic Universe*—a modal–comonadic Heyting structure equipped with definable operators from a typed λ-calculus—into a full **Stewardable Semiotic Concept Universe**. This extended universe supports the creation, annotation, revision, comparison, restriction, and *evaluation* of semantic concepts while preserving all structural invariants of the underlying Heyting–modal–comonadic semantics.

On top of the base Semiotic Universe, we introduce:

1. a formal **annotation calculus** for concept-level surface structure,  
2. a **groupoid of constant identity** for concept names,  
3. a layer of **failure semantics** and **partiality** compatible with the Heyting structure,  
4. a **provenance semantics** tracking the intensional history of concept fragments,  
5. a quantitative **evaluation semantics** for fragments, deltas, and stewardship actions,  
6. a notion of **semantic delta** at annotation, fragment, and closure levels,  
7. a notion of **semantic subtraction** defined Heyting-algebraically and fragmentwise,  
8. a **monoidal category of stewardship operators**,  
9. a **stewardship interface algebra** compiling steward actions into operators,  
10. a **2-category of partial structures**,  
11. a **monoidal action** of stewardship operators on partial structures,  
12. a **Grothendieck fibration of fragments with provenance**,  
13. **sheaf semantics** for fragmentwise interpretation and evaluation, and  
14. **coherence theorems** establishing compatibility of all these structures with the closure operator of the Semiotic Universe.

All constructions remain internal to the mathematics of the Semiotic Universe. The resulting structure, denoted
$$
\mathcal{U}^{\mathrm{SSC}},
$$
is a *stewardable semiotic concept universe*: a mathematically robust setting within which concepts can be created, revised, compared, subtracted, evaluated, and traced under stewardship actions.

---

# 1. Preliminaries

We recall only the structures required from the base *Semiotic Universe*.

## 1.1 Heyting–Modal–Comonadic Ambient

Let $(H,\leq)$ be a complete Heyting algebra with operations  
$\wedge,\vee,\Rightarrow,\bot,\top$.

A **modal closure operator** $j:H\to H$ is extensive, monotone, idempotent, and join-continuous.

A **Heyting–comonadic trace** $G:H\to H$ is simultaneously:

- a comonad on the thin category induced by $(H,\le)$, and  
- a complete Heyting algebra endomorphism preserving all Heyting structure and join suprema.

We assume:

- **Modality–trace interaction:** $j(G(a))\le G(j(a))$ for all $a\in H$;  
- **Stability:** $a\in H^{\mathrm{st}} \iff G(a)\in H^{\mathrm{st}}$, where
  $$
  H^{\mathrm{st}}:=\{a\in H : j(a)=a\}.
  $$

## 1.2 Definable Operators

We assume a typed λ-calculus with base type $P$ (“propositional concept”).  
Definable operators $\mathsf{Op}^{\mathrm{def}}$ are closed λ-terms of type $P^n\to P$ modulo definitional equality.

Each $f \in \mathsf{Op}^{\mathrm{def}}$ has an interpretation
$$
\llbracket f\rrbracket : H^n \to H
$$
satisfying:

- monotonicity and directed join-continuity in each argument,  
- Heyting compatibility,  
- modal homomorphism:
  $$
  j(\llbracket f\rrbracket(\vec a))=\llbracket f\rrbracket(j(\vec a)),
  $$
- trace compatibility:
  $$
  G(\llbracket f\rrbracket(\vec a))=\llbracket f\rrbracket(G(\vec a)),
  $$
- fragment preservation, and  
- hereditary extensionality (fragmentwise equality propagates under all closure operations).

## 1.3 Fragments and Global Closure

A **fragment** is a finitely generated modal–temporal Heyting subalgebra $F\subseteq H$, closed under $\wedge,\vee,\Rightarrow,\bot,\top,j,G$.

A **partial semiotic concept structure** is a pair
$$
X=(H_X,\Op_X)
$$
with $H_X\subseteq H$ and $\Op_X\subseteq \mathsf{Op}^{\mathrm{def}}$.

We have three closure operators on the complete lattice
$$
\mathcal{U} := \{(H_X,\Op_X)\mid H_X\subseteq H,\ \Op_X\subseteq \mathsf{Op}^{\mathrm{def}}\}:
$$

- $\mathcal{S}_{\mathrm{sem}}$ (semantic closure),  
- $\mathcal{S}_{\mathrm{syn}}$ (syntactic closure with finitary justification),  
- $\mathcal{S}_{\mathrm{fus}}$ (fusion closure).

Their composite
$$
\mathcal{S} := 
   \mathcal{S}_{\mathrm{fus}}
   \circ \mathcal{S}_{\mathrm{syn}}
   \circ \mathcal{S}_{\mathrm{sem}}
$$
is a closure operator on $\mathcal{U}$.

The **Semiotic Universe** is the least fixed point of $\mathcal{S}$, denoted
$$
\mathcal{U}_{\mathrm{semiotic}}=(H_{\mathrm{sem}},\Op_{\mathrm{sem}}).
$$

---

# 2. The Lattice of Partial Concept Structures

## 2.1 Definition

$$
\mathcal{U} = \{ (H_X, \Op_X) \mid H_X\subseteq H,\ \Op_X\subseteq \mathsf{Op}^{\mathrm{def}} \}.
$$

We order partial structures pointwise:
$$
(H_X,\Op_X) \le (H_Y,\Op_Y)
\quad\text{iff}\quad
H_X\subseteq H_Y\ \text{and}\ \Op_X\subseteq \Op_Y.
$$

## 2.2 Completeness

**Proposition 2.1.**  
$(\mathcal{U},\le)$ is a complete lattice with:

$$
\bigwedge_i (H_i,\Op_i)
 = \Big(\bigcap_i H_i,\ \bigcap_i \Op_i\Big),
$$
$$
\bigvee_i (H_i,\Op_i)
 = \Big(\bigcup_i H_i,\ \bigcup_i \Op_i\Big).
$$

*Proof.* Set-theoretic intersection and union preserve subset inclusion into $H$ and $\mathsf{Op}^{\mathrm{def}}$. ∎

---

# 3. Syntax and Typing of Annotation Terms

We define a formal language for surface annotations on concept constants.

## 3.1 Syntax

Let $\mathsf{Const}$ be constants of type $P$, one for each *concept*.

**Definition 3.1 (Annotation Terms).**
$$
t ::= c \mid k(t_1,\dots,t_n),
$$
where $c\in\mathsf{Const}$ and $k\in \mathsf{Op}^{\mathrm{def}}$.

Finite annotation sets are subsets of a set $\mathsf{AnnTerm}$ of annotation terms.

## 3.2 Typing Rules

Typing context: $\Gamma(c)=P$ for constants.

Rules:
$$
\frac{}{\Gamma\vdash c:P}
\qquad
\frac{\Gamma\vdash t_i:P}{\Gamma\vdash k(t_1,\dots,t_n):P}.
$$

**Theorem 3.2 (Type Soundness).**  
If $\Gamma\vdash t:P$ then $\llbracket t\rrbracket$ is defined in $H$.

*Proof.* Immediate from interpretation of definable operators in the Heyting algebra $H$. ∎

## 3.3 Canonical Forms

Annotation terms may be regarded as written in λ-normal form, with operator symbols as canonical heads. We treat the syntactic category of annotation terms modulo definitional equality.

---

# 4. Groupoid of Constant Concept Identity

We formalize the identity of concept constants across revisions and encodings.

## 4.1 Primitive Identity

We introduce a symmetric relation $c\approx c'$ on $\mathsf{Const}$.

## 4.2 Groupoid Structure

**Definition 4.1.**  
Let $\mathcal{G}$ be the groupoid with:

- objects: $c\in\mathsf{Const}$;  
- morphisms: $(c,c')$ whenever $c\approx c'$;  
- identities $(c,c)$;  
- inverses $(c',c)$;  
- composition $(c,c')\circ(c',c'')=(c,c'')$.

**Theorem 4.2.**  
$\mathcal{G}$ is a small groupoid.

*Proof.* Reflexivity, symmetry, and transitivity of $\approx$ provide identities, inverses, and associativity of composition. ∎

## 4.3 Transport on Annotation Terms

If $c\approx c'$, define $t[c'/c]$ by replacing each occurrence of $c$ with $c'$ in $t$.

**Lemma 4.3.**  
Typing is preserved under transport: if $\Gamma\vdash t:P$ then $\Gamma\vdash t[c'/c]:P$.

*Proof.* Replacement preserves the type $P$; proof by structural induction on $t$. ∎

## 4.4 Fragmentwise Coherence

**Theorem 4.4.**  
If $c\approx c'$, then $\llbracket t\rrbracket = \llbracket t[c'/c]\rrbracket$ in any fragment $F$ containing the denotations of both constants.

*Proof.* Fragment evaluation is extensional and respects definable operators; constants identified by $\approx$ are interpreted as the same element of $H$. ∎

---

# 5. Failure Semantics and Partiality

We enrich the universe with a minimal notion of failure that is compatible with the Heyting algebra and closure operators.

## 5.1 Failure Elements and Flags

We designate the Heyting bottom $\bot\in H$ as the **semantic failure value** $\bot_{\mathrm{fail}}$. Conceptually:

- $\bot_{\mathrm{fail}}$ may represent inconsistent or malformed content,  
- but algebraically it is just $\bot$; the additional failure information is carried separately.

**Definition 5.1 (Failure-annotated partial structure).**  
A **partial structure with failures** is a triple
$$
X = (H_X,\Op_X,F_X)
$$
where:

- $H_X\subseteq H$,  
- $\Op_X\subseteq \mathsf{Op}^{\mathrm{def}}$,  
- $F_X\subseteq H_X\cup\Op_X$ is a set of **failure-marked** elements (semantic or operator-level).

Failure arises from invalid annotations, impossible fragment formation, or malformed operator application.

## 5.2 Failure Fragment

**Definition 5.2 (Failure fragment).**  
The **failure fragment** $\mathcal{F}_{\mathrm{fail}}$ is the least fragment containing $\bot_{\mathrm{fail}}$. Since fragments are closed under all Heyting operations, modality, and trace, we have:
$$
\mathcal{F}_{\mathrm{fail}} = \{\bot_{\mathrm{fail}}\}.
$$

**Lemma 5.3 (Failure propagation in fragments).**  
If any generator of a fragment $F$ is $\bot_{\mathrm{fail}}$, then $F = \mathcal{F}_{\mathrm{fail}}$.

*Proof.* For any $a\in F$, closure under $\wedge$ yields $a\wedge\bot_{\mathrm{fail}} = \bot_{\mathrm{fail}}$, so all generated content collapses to $\bot_{\mathrm{fail}}$. ∎

## 5.3 Failure under Operators and Closure

We extend semantics with the following convention:

- If any operator application $\llbracket f\rrbracket(\vec a)$ is undefined or ill-typed, we interpret it as $\bot_{\mathrm{fail}}$ and mark the corresponding term or operator in $F_X$.

**Definition 5.4 (Failure propagation under semantic closure).**  
Semantic closure $\mathcal{S}_{\mathrm{sem}}$ on a failure-annotated structure $(H_X,\Op_X,F_X)$ satisfies:

1. If any application of $f\in\Op_X$ to elements of $H_X$ yields $\bot_{\mathrm{fail}}$, then $\bot_{\mathrm{fail}}\in H_{\mathcal{S}_{\mathrm{sem}}(X)}$ and $\mathcal{F}_{\mathrm{fail}}$ is included.  
2. Any newly introduced failure is recorded in $F_{\mathcal{S}_{\mathrm{sem}}(X)}$.

**Theorem 5.5 (Monotonicity of failure).**  
If $X\le Y$ and $X$ contains a failure-marked element, then:
$$
\mathcal{S}(X) \le \mathcal{S}(Y)
\quad\text{and}\quad
\bot_{\mathrm{fail}} \in H_{\mathcal{S}(Y)}.
$$

*Proof.* Closure is inflationary and monotone; failure is represented by $\bot_{\mathrm{fail}}$, which is preserved under extension of carrier sets. ∎

In what follows we suppress $F_X$ in notation when not essential, but all closure and operator definitions are implicitly extended to track failures.

---

# 6. Annotation Operator and Concept Fragments

We move from syntactic annotations to semantic fragments.

## 6.1 Surface Annotation Sets

A surface annotation for a concept constant $k\in\mathsf{Const}$ is a finite set
$$
\mathrm{Ann}(k)\subseteq \mathsf{AnnTerm}.
$$

To each partial structure $X$ we associate an auxiliary mapping
$$
\mathrm{Ann}_X : \mathsf{Const}\to \mathcal{P}(\mathsf{AnnTerm}).
$$

## 6.2 Annotation Operator

**Definition 6.1 (Annotation operator).**  
The **annotation operator** for a concept constant $k$ is the endomap
$$
\mathcal{A}_k : \mathcal{U}\to\mathcal{U},\qquad
\mathcal{A}_k(X):=X,
$$
which leaves the underlying partial structure unchanged and updates only the external annotation map $\mathrm{Ann}_X(k)$.

All semantic consequences of annotations are mediated through fragment generation.

## 6.3 Interpretation and Fragment Generation

**Definition 6.2 (Interpretation set).**  
Given $X$ and $k$, define:
$$
T_{k,X} := \{\llbracket t\rrbracket : t\in \mathrm{Ann}_X(k)\}\subseteq H.
$$

**Definition 6.3 (Concept fragment).**  
$$
F_{k,X} := \text{the least fragment containing } T_{k,X}.
$$

**Lemma 6.4 (Monotonicity of fragments in annotations).**  
If $\mathrm{Ann}_X(k)\subseteq \mathrm{Ann}'_X(k)$, then $F_{k,X}\subseteq F'_{k,X}$.

*Proof.* The generating set of $F_{k,X}$ is included in that of $F'_{k,X}$; fragments are minimal modal–temporal subalgebras containing their generators. ∎

Failure semantics from the previous section apply to fragment generation: if any $\llbracket t\rrbracket = \bot_{\mathrm{fail}}$, then $F_{k,X}=\mathcal{F}_{\mathrm{fail}}$.

---

# 7. Provenance Semantics for Concept Fragments

We now equip fragments with intensional histories.

## 7.1 Provenance Categories

For each fragment $F$, we wish to record how its elements arose from annotations and semantic operations.

**Definition 7.1 (Provenance histories).**  
A **provenance history** for an element $a\in F$ is a finite sequence of construction steps, each step being one of:

- introduction as $\llbracket t\rrbracket$ for some annotation term $t$,  
- formation by a Heyting operation, modality $j$, or trace $G$,  
- application of a definable operator $\llbracket f\rrbracket$,  
- inclusion under fragment extension.

Two histories are **comparable** if one refines the other by adding or collapsing intermediate steps.

**Definition 7.2 (Provenance category of a fragment).**  
For each fragment $F$, let $P(F)$ be the small category whose:

- objects are provenance histories of elements of $F$,  
- morphisms are refinement relations between histories (viewed as arrows from coarser to finer descriptions).

Composition is concatenation of refinements.

## 7.2 Provenance Functor on Fragment-Indexed Structures

Recall the total category $\mathcal{E}$ of fragment-indexed structures (defined later in Section 14). We anticipate it now.

**Definition 7.3 (Provenance functor).**  
Define a functor:
$$
\mathcal{P} : \mathcal{E} \to \mathbf{Cat}
$$
by:
$$
\mathcal{P}(F,X) := P(F),
$$
$$
\mathcal{P}\big((F,X)\to(F',X')\big) := \text{the functor extending histories along }F\subseteq F'.
$$

**Lemma 7.4 (Functoriality of provenance).**  
$\mathcal{P}$ is a functor: it preserves identities and composition.

*Proof.* Identity inclusions induce identity refinements of histories; composition of fragment inclusions corresponds to composition of refinement functors. ∎

## 7.3 Provenance-Lifting of Stewardship Operators

Each stewardship operator $E:\mathcal{U}\to\mathcal{U}$ acts on fragments; we require that it lift to provenance.

**Definition 7.5 (Lifted provenance action).**  
For a fragment $F$ and its image $E(F)$, define a functor:
$$
E^\sharp_F : P(F) \to P(E(F))
$$
sending each history to the history extended by a tagged step “application of $E$”.

**Lemma 7.6 (Provenance stability under operators).**  
The assignment $F\mapsto E^\sharp_F$ is natural in $F$; for any inclusion $F\subseteq F'$, the square
$$
\begin{array}{ccc}
P(F) & \xrightarrow{E^\sharp_F} & P(E(F)) \\
\downarrow & & \downarrow \\
P(F') & \xrightarrow{E^\sharp_{F'}} & P(E(F'))
\end{array}
$$
commutes up to canonical isomorphism of refinement.

*Proof.* Both routes extend histories by inclusion and then record the application of $E$; the order of these two operations is coherent. ∎

Provenance semantics will later be shown to be preserved by closure and compatible with the fragment fibration (Section 18).

---

# 8. Semantic Contribution via Global Closure

We now compute the semantic “footprint” of a concept in the Semiotic Universe, enriched with failure and provenance.

## 8.1 Concept-Level Semantic Contribution

**Definition 8.1 (Semantic contribution of a concept).**  
For a concept constant $k$ in a partial structure $X$, set:
$$
\mathrm{Sem}_X(k) := \mathcal{S}(F_{k,X}),
$$
where $\mathcal{S}$ is the global semiotic closure and $F_{k,X}$ the concept fragment generated from annotations.

This closure implicitly:

- propagates failures,  
- extends provenance histories, and  
- ensures coherence with the base Semiotic Universe.

**Theorem 8.2 (Boundedness by the Semiotic Universe).**  
$$
\mathrm{Sem}_X(k) \le \mathcal{U}_{\mathrm{semiotic}}.
$$

*Proof.* $\mathcal{U}_{\mathrm{semiotic}}$ is the least fixed point of $\mathcal{S}$. The closure of any partial structure lies below that least fixed point in $\mathcal{U}$. ∎

## 8.2 Closure and Provenance

**Theorem 8.3 (Provenance stability under closure).**  
For any fragment $F$, the provenance of $\mathcal{S}(F)$ is the colimit of the provenances of the intermediate fragments used in closure:
$$
\mathcal{P}(\mathcal{S}(F)) \cong \operatorname{colim}\{\mathcal{P}(F') \mid F\subseteq F'\subseteq H_{\mathrm{sem}}\ \text{and}\ F'\ \text{appears in the closure chain}\}.
$$

*Sketch.* Closure steps form a directed system of fragments; provenance functor $\mathcal{P}$ sends this system to a diagram in $\mathbf{Cat}$. Closure’s monotonicity and uniformity ensure that histories glue uniquely along inclusions. ∎

---

# 9. Revision and Local Persistence

We study how semantic contributions evolve under annotation revision.

## 9.1 Monotone Revision

**Theorem 9.1 (Monotonicity in annotations).**  
If $\mathrm{Ann}_X(k)\subseteq \mathrm{Ann}'_X(k)$ then
$$
\mathrm{Sem}_X(k)\le \mathrm{Sem}'_X(k).
$$

*Proof.* By Lemma 6.4, $F_{k,X}\subseteq F'_{k,X}$. Monotonicity of $\mathcal{S}$ yields
$\mathcal{S}(F_{k,X})\le \mathcal{S}(F'_{k,X})$. ∎

## 9.2 Local Persistence

**Definition 9.2 (Locally persistent annotation).**  
An annotation term $t\in\mathrm{Ann}_X(k)$ is **locally persistent** if
$$
\llbracket t\rrbracket\in F_{k,X}
\quad\text{but}\quad
\llbracket t\rrbracket\notin H_{\mathrm{Sem}_X(k)}.
$$

In words: the annotation contributes inside the local fragment but is not promoted by global closure.

**Proposition 9.3 (Local containment).**  
Locally persistent terms have no effect outside $F_{k,X}$: their denotations do not propagate beyond the concept’s fragment under closure.

*Proof.* By definition of local persistence, $\llbracket t\rrbracket$ is not in the semantic carrier of $\mathrm{Sem}_X(k)$, so closure does not promote it beyond its local fragment. ∎

---

# 10. Evaluation Semantics

We add a quantitative evaluation layer over the universe, without imposing any normative semantics.

## 10.1 Evaluation Monoid and Valuation

**Definition 10.1 (Evaluation monoid).**  
Let $(M,\le_M,+,0)$ be a commutative ordered monoid. Intuitively, $M$ measures size, complexity, cost, or semantic weight.

**Definition 10.2 (Semantic valuation).**  
A **valuation** is a monotone map
$$
\mu : H \to M
$$
satisfying:

1. $\mu(\bot_{\mathrm{fail}}) = 0$,  
2. $\mu(a\vee b) \le_M \mu(a)+\mu(b)$,  
3. $\mu(j(a)) \ge_M \mu(a)$,  
4. $\mu(G(a)) \ge_M \mu(a)$.

We do not require full additivity; subadditivity at joins suffices.

## 10.2 Fragment and Concept Valuations

**Definition 10.3 (Fragment valuation).**  
For a finitely generated fragment $F$ with generators $\mathrm{gens}(F)$,
$$
\mu(F) := \sum_{a\in\mathrm{gens}(F)} \mu(a).
$$

**Definition 10.4 (Concept valuation).**  
For $\mathrm{Sem}_X(k)$, define:
$$
\mu(k;X) := \mu\big(H_{\mathrm{Sem}_X(k)}\big) := 
\sup\{\mu(F)\mid F\subseteq H_{\mathrm{Sem}_X(k)}\ \text{fragment}\}.
$$

## 10.3 Delta Magnitude

**Definition 10.5 (Delta magnitude).**  
For concept constants $k,k'$, define:
$$
\mu\big(\Delta_{\mathrm{sem}}(k,k')\big)
 := \mu\big(\Delta_{\mathrm{frag}}(F_{k,X},F_{k',X})\big),
$$
where fragment and semantic delta are defined in Section 16.

## 10.4 Evaluation and Closure

**Theorem 10.6 (Monotonicity of evaluation).**  
If $X\le Y$, then
$$
\mu(H_X)\le_M \mu(H_Y).
$$

*Proof.* $H_X\subseteq H_Y$ and $\mu$ is monotone. ∎

**Theorem 10.7 (Evaluation compatibility with closure).**  
For any partial structure $X$,
$$
\mu(H_{\mathcal{S}(X)}) 
 = \sup\{\mu(F)\mid F\subseteq H_{\mathcal{S}(X)}\ \text{fragment}\}.
$$

*Proof.* By definition of $\mu(H_{\mathcal{S}(X)})$ and the fact that fragments generate the closure carrier. ∎

This evaluation layer will be used to quantify the impact of stewardship operators and concept revisions.

---

# 11. Restriction

We formalize syntactic and semantic restriction to remove concepts.

## 11.1 Syntactic Restriction

**Definition 11.1 (Restriction by a concept constant).**  
For a constant $k\in\mathsf{Const}$ in a partial structure $X=(H_X,\Op_X)$, define:
$$
X\setminus k :=
(H_X\setminus\{\text{denotation of }k\},\
 \Op_X\setminus\{f\in\Op_X : f\ \text{mentions }k\}).
$$

**Proposition 11.2 (Monotonicity of restriction).**  
If $X\le Y$, then $X\setminus k \le Y\setminus k$.

*Proof.* Removing the same constant and operators from larger carriers or operator sets preserves inclusion. ∎

## 11.2 Restricted Closure

**Definition 11.3 (Restricted closure).**  
The **restricted closure** of $X$ at $k$ is:
$$
\mathcal{S}(X\setminus k).
$$

**Proposition 11.4 (Idempotence of restricted closure).**  
$$
\mathcal{S}(\mathcal{S}(X\setminus k)\setminus k) 
  = \mathcal{S}(X\setminus k).
$$

*Proof.* Once $k$ is removed, repeated restriction has no further effect; $\mathcal{S}$ is idempotent on fixed points. ∎

We compare restriction with semantic subtraction in Section 17.

---

# 12. Stewardship Operator Algebra

We now formalize stewardship operators as algebraic and categorical objects acting on partial structures.

## 12.1 Monoidal Category of Stewardship Operators

**Definition 12.1 (Stewardship operators).**  
A **stewardship operator** is a monotone map
$$
E: \mathcal{U} \to \mathcal{U}
$$
compatible with:

- fragments (preserves fragment structure of carriers),  
- closure (respects $\mathcal{S}$ up to inequality),  
- failure semantics (does not unmark failures),  
- provenance (admits a lifting $E^\sharp$),  
- evaluation (does not decrease $\mu$).

Let $\mathbf{Stew}$ be the category with:

- a single object $\bullet$,  
- morphisms $\bullet\to\bullet$ given by such operators $E$.

Composition is function composition, $E\otimes F := E\circ F$, and identity is $\mathrm{id}$.

**Theorem 12.2.**  
$\mathbf{Stew}$ is a strict monoidal category.

*Proof.* Function composition is associative; identity is strict; tensor is composition. ∎

## 12.2 2-Category of Partial Structures

**Definition 12.3 (2-category of partial structures).**  
Define a 2-category $\mathbf{Part}$ where:

- 0-cells: partial structures $X\in\mathcal{U}$,  
- 1-cells: monotone maps $f:X\to Y$ in $\mathcal{U}$,  
- 2-cells: refinements $f\Rightarrow g$ if $f(X)\le g(X)$ pointwise.

**Theorem 12.4.**  
$\mathbf{Part}$ is a strict 2-category.

*Proof.* Composition of monotone maps is monotone; identities exist; refinement as inequality is reflexive and transitive; vertical and horizontal composition of inequalities is valid. Standard for posets enriched in posets. ∎

## 12.3 Monoidal Action on Partial Structures

**Definition 12.5 (Monoidal action).**  
A **monoidal action** of $\mathbf{Stew}$ on $\mathbf{Part}$ is a functor:
$$
\mathbf{Stew} \times \mathbf{Part} \to \mathbf{Part},
\quad
(E,X) \mapsto E(X),
$$
compatible with the monoidal structure.

**Theorem 12.6 (Action coherence).**  
The stewardship operators define a strict monoidal action on $\mathbf{Part}$.

*Proof.*  

- Identity: $\mathrm{id}(X)=X$.  
- Composition: $(E\circ F)(X)=E(F(X))$.  
- Functoriality: If $X\le Y$, then $E(X)\le E(Y)$ since $E$ is monotone.  
- 2-cells: If $E\Rightarrow E'$ (pointwise inequality), then for all $X$, $E(X)\le E'(X)$.

These properties satisfy the axioms of a strict action of a monoidal category on a 2-category. ∎

---

# 13. Stewardship Interface Algebra

We now define a typed action language for stewards and its compilation into stewardship operators.

## 13.1 Interface Actions

**Definition 13.1 (Interface actions).**  
Let $\mathsf{Act}$ be the set of syntactic **stewardship actions** generated by:

- $\mathsf{Annotate}(k, A)$, where $k\in\mathsf{Const}$ and $A\subseteq\mathsf{AnnTerm}$ finite;  
- $\mathsf{Compare}(k,k')$ for constants $k,k'$;  
- $\mathsf{Subtract}(k,\mathrm{Ctx})$, where $\mathrm{Ctx}$ is a partial structure;  
- $\mathsf{RefineFrag}(F, \varphi)$, where $F$ is a fragment and $\varphi$ is a refinement directive;  
- $\mathsf{Evaluate}(F)$ for fragments;  
- finite compositions and combinations thereof.

These are *not yet* operators; they are an external syntax.

## 13.2 Action Typing

We endow actions with simple types indicating their domain and codomain shape:

- $\mathsf{Annotate}: \mathsf{Const} \times \mathcal{P}(\mathsf{AnnTerm}) \to \mathbf{Stew}$,  
- $\mathsf{Compare}: \mathsf{Const} \times \mathsf{Const} \to \mathbf{Stew}$,  
- $\mathsf{Subtract}: \mathsf{Const}\times\mathcal{U}\to \mathbf{Stew}$,  
- $\mathsf{RefineFrag}: \mathcal{F}\times\Phi \to \mathbf{Stew}$, where $\Phi$ is a space of refinement policies,  
- $\mathsf{Evaluate}: \mathcal{F} \to M$, purely observational.

## 13.3 Compilation to Stewardship Operators

**Definition 13.2 (Interface compilation).**  
Define a map:
$$
\llbracket - \rrbracket_{\mathrm{iface}} : \mathsf{Act} \to \mathbf{Stew}
$$
by structural recursion:

- $\llbracket \mathsf{Annotate}(k,A)\rrbracket_{\mathrm{iface}} := E^{\mathrm{ann}}_{k,A}$,  
  where $E^{\mathrm{ann}}_{k,A}$ updates $\mathrm{Ann}_X(k)$ to include $A$ and re-closes $F_{k,X}$.  
- $\llbracket \mathsf{Compare}(k,k')\rrbracket_{\mathrm{iface}} := E^{\Delta}_{k,k'}$,  
  where $E^{\Delta}_{k,k'}$ computes $\Delta_{\mathrm{sem}}(k,k')$ and may extend the structure with comparison artifacts.  
- $\llbracket \mathsf{Subtract}(k,\mathrm{Ctx})\rrbracket_{\mathrm{iface}} := E^{\ominus}_{k,\mathrm{Ctx}}$,  
  where $E^{\ominus}_{k,\mathrm{Ctx}}$ performs semantic subtraction (Section 17).  
- $\llbracket \mathsf{RefineFrag}(F,\varphi)\rrbracket_{\mathrm{iface}} := E^{\mathrm{ref}}_{F,\varphi}$,  
  where $E^{\mathrm{ref}}_{F,\varphi}$ manipulates fragments consistent with $\varphi$.  
- Composition of actions maps to composition of operators:
  $$
  \llbracket a_2\circ a_1\rrbracket_{\mathrm{iface}}
   := \llbracket a_2\rrbracket_{\mathrm{iface}}\circ \llbracket a_1\rrbracket_{\mathrm{iface}}.
  $$

**Lemma 13.3 (Well-typedness of compilation).**  
For any action $a\in\mathsf{Act}$,
$$
\llbracket a \rrbracket_{\mathrm{iface}} \in \mathbf{Stew}.
$$

*Proof.* Each primitive compilation clause yields a monotone endomap on $\mathcal{U}$ that respects fragments, closure, failures, provenance, and evaluation. Composition of such maps preserves these properties. ∎

## 13.4 Interface–Operator Compatibility

**Theorem 13.4 (Compatibility of interface and stewardship algebra).**  
Let $a\in\mathsf{Act}$ and $E:=\llbracket a\rrbracket_{\mathrm{iface}}$. Then for all partial structures $X$:

1. $E(X)$ is fragment-preserving,  
2. $E$ admits a provenance lifting $E^\sharp$,  
3. failures in $X$ remain failures (they are not “healed” silently),  
4. $\mu(H_{E(X)}) \ge_M \mu(H_X)$.

*Sketch.* Follows from the construction of each primitive operator and the monotone, fragmentwise, and evaluation-preserving properties of closure and definable operators. ∎

---

# 14. Fragment Fibration

We formalize locality of fragments and their relationship to partial structures.

## 14.1 Base Category of Fragments

Let $\mathcal{F}$ be the poset-category of fragments under inclusion:

- objects: fragments $F\subseteq H$,  
- morphisms: unique arrow $F\to F'$ iff $F\subseteq F'$.

## 14.2 Total Category of Fragment-Indexed Structures

**Definition 14.1 (Total category $\mathcal{E}$).**  
Define a category $\mathcal{E}$ with:

- objects: pairs $(F,X)$ where $F$ is a fragment and $X=(H_X,\Op_X)$ is a partial structure with $H_X\subseteq F$;  
- morphisms: $(F,X)\to(F',X')$ whenever $F\subseteq F'$ and $X\le X'$.

Define projection:
$$
\pi:\mathcal{E}\to \mathcal{F},\quad \pi(F,X)=F.
$$

**Theorem 14.2 (Grothendieck fibration).**  
$\pi:\mathcal{E}\to \mathcal{F}$ is a Grothendieck fibration.

*Proof Sketch.*  
Given inclusion $u:F\subseteq F'$ and an object $(F,X)$, define the cartesian lift as $(F',X)$ with the evident inclusion. For any morphism $(G,Z)\to(F',Y')$ over $u$, factor uniquely through this lift by the partial structure inclusion $X\le Y'$ induced by $Z\le Y'$. Standard for posets. ∎

Provenance semantics from Section 7 fit over this fibration through the functor $\mathcal{P}$.

---

# 15. Sheaf Semantics for Fragmentwise Interpretation and Evaluation

We interpret fragments as local semantic and evaluative views.

## 15.1 Presheaf of Semantic Carriers

**Definition 15.1 (Semantic presheaf).**  
Define a presheaf:
$$
\mathcal{H}: \mathcal{F}^{op} \to \mathbf{Set}
$$
by:
$$
\mathcal{H}(F) := F,
$$
$$
\mathcal{H}(F\subseteq F') := (\text{inclusion }F'\hookrightarrow F)^\ast
$$
given by restriction.

## 15.2 Sheaf Condition

**Definition 15.2 (Covering family).**  
A family $\{F_i\}_{i\in I}$ **covers** $F$ if
$$
F = \bigvee_i F_i,
$$
their fragmentwise join (least fragment containing $\bigcup_i F_i$).

**Theorem 15.3 (Sheaf condition).**  
If elements $a_i\in F_i$ satisfy $a_i=a_j$ in every intersection $F_i\cap F_j$, then there exists a unique $a\in F$ with $a|_{F_i}=a_i$ for all $i$.

*Proof Sketch.* Fragments are sub-Heyting algebras; intersections inherit Heyting structure. The join fragment is generated by the union of generators, and Heyting operations are functional, so a coherent family glues uniquely. ∎

## 15.3 Closure and Sheaf Structure

**Theorem 15.4 (Closure preserves sheaf semantics).**  
If $\{F_i\}$ covers $F$, then
$$
\mathcal{S}(F) = \bigvee_i \mathcal{S}(F_i)
$$
inside the sheaf.

*Proof Sketch.* $\mathcal{S}$ is built from monotone inflationary operators acting uniformly on generators. Given that the union of generator sets of $F_i$ generates $F$, closure of the union coincides with the join of the closures. Fragmentwise extensionality guarantees uniqueness. ∎

## 15.4 Evaluation as a Sheaf

The valuation $\mu$ induces a functor:
$$
\mathcal{M}:\mathcal{F}^{op}\to \mathbf{Pos}
$$
sending $F$ to the poset of valuations restricted to $F$. The sheaf condition for $\mathcal{H}$ lifts to $\mathcal{M}$ by monotonicity of $\mu$.

---

# 16. Semantic Delta

We define annotation, fragment, and semantic deltas for concepts.

## 16.1 Annotation Delta

For finite annotation sets $A,B\subseteq \mathsf{AnnTerm}$:

$$
\Delta_{\mathrm{ann}}(A,B)
   := (A\setminus B) \cup (B\setminus A).
$$

## 16.2 Fragment Delta

For fragments $F,G\subseteq H$:

$$
\Delta_{\mathrm{frag}}(F,G)
 := \text{least fragment containing }(F\cup G)\setminus(F\cap G).
$$

**Lemma 16.1.**  
$\Delta_{\mathrm{frag}}(F,G)$ is a fragment.

*Proof.* The generating set $(F\cup G)\setminus(F\cap G)$ is finite. Closing under Heyting operations, modality, and trace yields a fragment. ∎

## 16.3 Semantic Delta for Concepts

Let $k,k'\in\mathsf{Const}$ be concept constants with fragments $F_{k,X}$, $F_{k',X}$.

**Definition 16.2 (Semantic delta).**  
$$
\Delta_{\mathrm{sem}}(k,k')
  := \mathcal{S}\bigl(\Delta_{\mathrm{frag}}(F_{k,X},F_{k',X})\bigr).
$$

**Theorem 16.3 (Monotonicity of semantic delta).**  
Suppose annotations extend:

$$
\mathrm{Ann}_X(k) \subseteq \mathrm{Ann}'_X(k),\quad
\mathrm{Ann}_X(k') \subseteq \mathrm{Ann}'_X(k'),
$$
so that corresponding fragments satisfy
$$
F_{k,X} \subseteq F'_{k,X},\quad
F_{k',X} \subseteq F'_{k',X}.
$$
Then
$$
\Delta_{\mathrm{sem}}(k,k')
\;\le\;
\Delta_{\mathrm{sem}}(k,k')'
:= \mathcal{S}\bigl(\Delta_{\mathrm{frag}}(F'_{k,X},F'_{k',X})\bigr).
$$

*Proof Sketch.* Enlarged annotations enlarge fragments (Lemma 6.4). Enlarged fragments yield enlarged fragment deltas. Monotonicity of $\mathcal{S}$ gives the result. ∎

Evaluation $\mu$ applied to $\Delta_{\mathrm{sem}}$ yields a quantitative divergence measure (Definition 10.5).

---

# 17. Semantic Subtraction

Semantic subtraction removes the *semantic support* of one fragment (or concept) from another, using Heyting structure.

## 17.1 Heyting Subtraction of Elements

Given $a,b\in H$, define:
$$
a\ominus b := a \wedge (b \Rightarrow \bot).
$$

This uses the Heyting pseudo-complement $b\Rightarrow\bot$ as a “negation” of $b$.

**Lemma 17.1.**  
For all $a,b\in H$:

1. $a\ominus b \le a$.  
2. If $c\wedge b\le \bot$, then $c\le a\ominus b$.

*Proof.*  
(1) Trivial from meet.  
(2) $c\wedge b\le \bot$ implies $c\le b\Rightarrow\bot$, hence $c\le a\wedge(b\Rightarrow\bot) = a\ominus b$. ∎

## 17.2 Fragment Support and Fragment Subtraction

**Definition 17.2 (Fragment support).**  
For fragment $F$, define its **semantic support**:
$$
s(F) := \bigvee_{x\in F} x.
$$

**Definition 17.3 (Fragment subtraction).**  
Given fragments $F,G$, define:
$$
F\ominus G
:= 
\text{the least fragment containing }
\{\, a\ominus s(G) : a\in F\,\}.
$$

**Lemma 17.4.**  
$F\ominus G$ is a fragment.

*Proof.* The set $\{a\ominus s(G)\mid a\in F\}$ is finite if $F$ is finitely generated. Closure under the fragment operations yields a fragment. ∎

## 17.3 Semantic Subtraction for Concepts

Let $k$ be a concept constant with fragment $F_{k,X}$.

**Definition 17.5 (Semantic subtraction of a concept).**  
Define:
$$
X \ominus k :=
\left( H_X',\,\Op_X \right)
$$
where
$$
H_X' := 
\text{least fragment containing }
\{\, a\ominus s(F_{k,X}) : a\in H_X \,\}.
$$

**Theorem 17.6 (Monotonicity of subtraction).**  
If $X\le Y$, then
$$
X\ominus k \;\le\; Y\ominus k.
$$

*Proof.*  
$H_X \subseteq H_Y$ implies $\{a\ominus s(F_{k,X})\mid a\in H_X\}\subseteq\{b\ominus s(F_{k,Y})\mid b\in H_Y\}$. Since $F_{k,X}\subseteq F_{k,Y}$, we have $s(F_{k,X})\le s(F_{k,Y})$, so $b\ominus s(F_{k,Y}) \le b\ominus s(F_{k,X})$. Closure of generators preserves inclusion. Operators are unchanged. ∎

## 17.4 Relation to Restriction

**Theorem 17.7 (Subtraction versus restriction).**  
For all $X$ and $k$,
$$
\mathcal{S}(X\ominus k) \;\le\; \mathcal{S}(X\setminus k).
$$

*Proof Sketch.*  
$X\ominus k$ removes the semantic support associated to $k$ from each element of $H_X$, while $X\setminus k$ fully removes the syntactic constant and all expressions mentioning it. Closure from $X\setminus k$ must eliminate at least as much semantic influence as $X\ominus k$. ∎

---

# 18. Unified Coherence Theorems

We now show that the extended system—syntax, identity, failures, annotations, fragments, provenance, evaluation, closure, stewardship operators, interface actions, delta, subtraction, and fragment fibration—coheres into a single mathematical object.

## 18.1 Identity Coherence

**Theorem 18.1 (Identity stability).**  
If $c\approx c'$, then for all stewardship operators $E\in\mathbf{Stew}$,
$$
\mathrm{Sem}(E(c)) = \mathrm{Sem}(E(c')).
$$

*Proof Sketch.*  
Annotations transport via constant identity (Section 4). Fragments for $c$ and $c'$ coincide; delta is trivial; subtraction behaves identically; closure of isomorphic fragments yields the same semantic contribution and provenance histories. ∎

## 18.2 Sheaf Coherence of Stewardship Actions

**Theorem 18.2 (Sheaf coherence of operators).**  
Stewardship operators preserve the fragment fibration and sheaf semantics:  
for all $E\in\mathbf{Stew}$ and all morphisms $(F,X)\to(F',X')$ in $\mathcal{E}$,
$$
E(X)|_F = E(X')|_F
\quad\text{whenever}\quad X\le X'.
$$

*Proof Sketch.*  
Monotonicity of $E$ ensures $E(X)\le E(X')$. Since $E$ preserves fragments and closure commutes with restriction up to inequality, the restriction of $E$ to $F$ agrees whether we act before or after extension to $F'$. Extensionality in fragments yields equality. ∎

## 18.3 Provenance and Evaluation Coherence

**Theorem 18.3 (Provenance coherence).**  
For any stewardship operator $E$ and fragment inclusion $F\subseteq F'$, the square
$$
\begin{array}{ccc}
P(F) & \xrightarrow{E^\sharp_F} & P(E(F)) \\
\downarrow & & \downarrow \\
P(F') & \xrightarrow{E^\sharp_{F'}} & P(E(F'))
\end{array}
$$
commutes up to canonical refinement equivalence.

*Proof.* Follows from the definition of $E^\sharp$ and functoriality of $\mathcal{P}$ (Lemma 7.6). ∎

**Theorem 18.4 (Evaluation coherence).**  
For any stewardship operator $E$,
$$
\mu(H_X) \le_M \mu(H_{E(X)})
\quad\text{and}\quad
\mu(H_{\mathcal{S}(E(X))}) \ge_M \mu(H_{\mathcal{S}(X)}).
$$

*Proof.* By definition, $E$ is evaluation non-decreasing; closure preserves or increases valuation by Theorem 10.7. ∎

## 18.4 Monoidal-2-Category Coherence

**Theorem 18.5 (Global coherence).**  
The monoidal category $\mathbf{Stew}$ acts coherently on the 2-category $\mathbf{Part}$:
$$
E(F(X)) = (E\otimes F)(X)
$$
up to a unique 2-cell, and this action preserves:

- the fragment fibration $\pi:\mathcal{E}\to\mathcal{F}$,  
- provenance semantics $\mathcal{P}$,  
- sheaf semantics $\mathcal{H}$,  
- evaluation semantics $\mathcal{M}$,  
- and failure semantics.

*Sketch.*  
Composition and monotonicity of stewardship operators guarantee functoriality. Refinements of operators supply 2-cells. Closure $\mathcal{S}$ commutes suitably with restriction and fragment inclusion. Provenance and evaluation coherence follow from Theorems 18.3 and 18.4. ∎

## 18.5 Stability Under Closure

**Theorem 18.6 (Universe stability).**  
For any finite composition of stewardship operators $E_n\circ\cdots\circ E_1$ and any $X\le \mathcal{U}_{\mathrm{semiotic}}$,
$$
\mathcal{S}(E_n(\cdots E_1(X)\cdots))
\le 
\mathcal{U}_{\mathrm{semiotic}}.
$$

*Proof.* $\mathcal{U}_{\mathrm{semiotic}}$ is the least fixed point of $\mathcal{S}$. Each $E_i$ is an endomap on $\mathcal{U}$ preserving the base ambient. Monotonicity implies that repeated application of $\mathcal{S}$ after any composition lands at or below $\mathcal{U}_{\mathrm{semiotic}}$. ∎

---

# 19. The Stewardable Semiotic Concept Universe

We assemble all components into one object.

**Definition 19.1 (Stewardable Semiotic Concept Universe).**  
A **Stewardable Semiotic Concept Universe** is the structure
$$
\mathcal{U}^{\mathrm{SSC}} :=
\big(
H,\ j,\ G,\ 
\mathsf{Op}^{\mathrm{def}},\ 
\mathsf{Const},\ 
\mathsf{AnnTerm},\ 
\mathcal{G},\ 
\mathcal{U},\ 
\mathcal{S},\ 
\mathcal{F},\ 
\mathcal{E}\xrightarrow{\pi}\mathcal{F},\
\mathcal{P},\
\mathcal{H},\
\mu,\
\mathbf{Stew},\
\mathbf{Part},\
\Delta_{\mathrm{ann}},\Delta_{\mathrm{frag}},\Delta_{\mathrm{sem}},\
\ominus
\big)
$$
equipped with:

- a complete Heyting–modal–comonadic ambient $(H,j,G)$,  
- a family of definable operators $\mathsf{Op}^{\mathrm{def}}$ satisfying fragment preservation and hereditary extensionality,  
- a set of concept constants $\mathsf{Const}$ and annotation terms $\mathsf{AnnTerm}$,  
- a groupoid of constant identity $\mathcal{G}$,  
- a complete lattice of partial structures $\mathcal{U}$ and closure $\mathcal{S}$,  
- a poset of fragments $\mathcal{F}$ and fragment-indexed total category $\mathcal{E}$,  
- a provenance functor $\mathcal{P}:\mathcal{E}\to\mathbf{Cat}$,  
- a semantic presheaf $\mathcal{H}:\mathcal{F}^{op}\to\mathbf{Set}$ with sheaf semantics,  
- an evaluation monoid $M$ and valuation $\mu:H\to M$,  
- a monoidal category of stewardship operators $\mathbf{Stew}$ acting on $\mathbf{Part}$,  
- delta and subtraction operations $\Delta_{\mathrm{ann}},\Delta_{\mathrm{frag}},\Delta_{\mathrm{sem}},\ominus$,  
- and compatibility conditions as proved in Section 18.

**Theorem 19.2 (Soundness and completeness of $\mathcal{U}^{\mathrm{SSC}}$).**  
$\mathcal{U}^{\mathrm{SSC}}$ is a well-defined, coherent mathematical universe supporting:

- creation, annotation, revision, and deletion (restriction/subtraction) of semantic concepts,  
- fragmentwise and global semantic evaluation,  
- intensional provenance of concept fragments and closure steps,  
- a typed interface algebra for steward actions compiled to stewardship operators,  
- semantic difference and semantic removal,  
- and stable interaction with the underlying Semiotic Universe.

*Proof.* Each component is defined using structures already present or admissible in the Semiotic Universe; all interactions are verified by the coherence theorems of Section 18; closure stability guarantees universe-level consistency. ∎

---

# 20. Conclusion

We have constructed a **Stewardable Semiotic Concept Universe** as an extension of the Semiotic Universe with:

- a formal annotation calculus as syntactic substrate for concept-level knowledge;  
- a groupoid of constants providing identity across revisions and encodings;  
- a layer of failure semantics that localizes and records inconsistencies;  
- provenance categories and a fibration that track the intensional history of fragments;  
- a quantitative evaluation semantics for fragments, deltas, and stewardship actions;  
- semantic delta and subtraction to compare and locally remove conceptual footprints;  
- a monoidal category of stewardship operators equipped with an explicit interface algebra;  
- a 2-category of partial structures plus a Grothendieck fibration of fragments;  
- sheaf semantics for local-to-global coherence; and  
- unified coherence theorems ensuring stability of the whole construction under closure and operator action.

The resulting structure, $\mathcal{U}^{\mathrm{SSC}}$, is a **stewardable semiotic universe of concepts**: a setting in which concept-level artifacts can be created, revised, compared, subtracted, evaluated, and traced—internally, mathematically, and in a way that is compatible with external stewardship interfaces.
