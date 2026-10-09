---
title: "Closure, Cones, and Proof-Path Forests: The Mathematics of Placement"
description: "An expository paper running from articulation to predication: tokens as a base, claims as fibers carrying a bilattice fiber algebra, utterances as sections, and a well-founded grounding chain bottoming out in marks; then the Galois closure theory of formal concept analysis, a sheaf-glued two-dimensional semantics of primary and secondary intensions, Lorentzian cone fields with causal order and Alexandrov topology, Curry-Howard-Lambek confluence making normal forms canonical names, categorical cones of readings with the leg-agreement condition, rigidity matroids and the pebble game, and a measured merge theorem in which vanishing Cech obstruction and zero sheaf-Laplacian disagreement energy glue two witness forests into one, deterministically, while nonzero energy refuses the merge with a number."
date-created: 2026-07-31
kind: research-note
keywords:
  - articulation
  - predication
  - fiber-algebra
  - bilattice
  - well-foundedness
  - formal-concept-analysis
  - galois-connection
  - closure-operator
  - concept-lattice
  - secondary-intension
  - two-dimensional-semantics
  - sheaf-cohomology
  - sheaf-laplacian
  - lorentzian-cones
  - causal-order
  - alexandrov-topology
  - curry-howard-lambek
  - confluence
  - categorical-cones
  - rigidity-matroid
  - pebble-games
status: settled
declared-by: claude-opus-writing-agent
source-variants:
  - triage.dev.emsenn.net/content/_archive/computing-explanation-proof-pathing-the-generative-unfolding-of-mathematics.md
  - triage.dev.emsenn.net/content/_archive/computing-proof-pathing-explanation-placing-a-concept-by-its-generating-morphism.md
type: explanation

---


## 1. Introduction

This paper runs a single arc from the smallest structure it treats to the
largest. It begins with *articulation* — a token, the claims made of it, and the
ordered pair that is an utterance — and shows that this data is a bundle whose
fibers carry an algebra. It descends from any token along its claims to the
*marks* in which the descent terminates, and shows that termination is
well-foundedness and that the terminal object is a canonical name. It then
assembles the theory needed to say when two such structures may be merged, and
ends with a merge theorem whose criterion is a measured number.

Along the way five bodies of mathematics are stated in a form usable by the
others: the Galois closure theory of formal concept analysis; a two-dimensional
semantics of primary and secondary readings, presented as a sheaf over a site of
claims rather than as a family indexed by possible worlds; the order theory of
Lorentzian cone fields, together with the reconstruction of topology and
conformal geometry from causal order alone; the Curry–Howard–Lambek
correspondence and the confluence theorem that makes a normal form a canonical
name; and the combinatorics of rigidity matroids, spanning forests, and the
pebble game that decides independence in them.

The thesis argued across all of them is this. The derived structure is a
function of the *incidence data* — which object bears which attribute, which
event precedes which, which segment generates which, which vertex meets which
edge — and is not a function of cardinality. Two configurations agreeing in
every count can differ in closure, in rank, in rigidity, and in what they prove.
Three corollaries follow and are collected in §12: that a composite retains
information its endpoint does not, so a factorization is data and not
presentation; that a family of local readings which agree pairwise need not
glue, so polysemy is a cohomological obstruction rather than a stylistic
complaint; and that aligning terms into a forest of derivations is exactly what
makes those derivations reusable as proofs.

The reader who wants only the arc may read §§3, 4, 5, 9, and 10, in that order.
Everything is stated for finite or small structures unless noted. Where a
statement is standard, the reference is given in §13 and the proof is omitted or
sketched; where a statement is a synthesis proposed here it is marked as such.

## 2. Formal contexts, Galois connections, and concept lattices

### 2.1 Derivation and closure

**Definition 2.1.** A *formal context* is a triple $\mathbb{K} = (G, M, I)$ in
which $G$ is a set of objects, $M$ a set of attributes, and
$I \subseteq G \times M$ an incidence relation. We write $gIm$ for
$(g,m) \in I$ and read it "the object $g$ bears the attribute $m$."

**Definition 2.2.** The *derivation operators* of $\mathbb{K}$ are the maps
$\mathcal{P}(G) \to \mathcal{P}(M)$ and $\mathcal{P}(M) \to \mathcal{P}(G)$
given, for $A \subseteq G$ and $B \subseteq M$, by

$$A' = \{\, m \in M \mid \forall g \in A,\ gIm \,\}, \qquad
B' = \{\, g \in G \mid \forall m \in B,\ gIm \,\}.$$

Thus $A'$ is the set of attributes shared by every object of $A$, and $B'$ the
set of objects bearing every attribute of $B$. The prime is overloaded; its
domain fixes which map is meant.

**Proposition 2.3.** Both operators are antitone, and together they form an
antitone Galois connection between $(\mathcal{P}(G), \subseteq)$ and
$(\mathcal{P}(M), \subseteq)$:

$$A \subseteq B' \iff B \subseteq A'.$$

*Proof.* Each side of the equivalence asserts that every object of $A$ bears
every attribute of $B$, which is the condition $A \times B \subseteq I$.
Antitonicity is immediate: enlarging $A$ can only shrink the set of attributes
common to all its members. $\square$

The adjunction of Proposition 2.3 is the hinge of the theory. Everything below
is a consequence of it together with the general theory of Galois connections.

**Corollary 2.4.** The composites $A \mapsto A''$ on $\mathcal{P}(G)$ and
$B \mapsto B''$ on $\mathcal{P}(M)$ are closure operators: each is extensive
($A \subseteq A''$), monotone, and idempotent ($A'''' = A''$). Moreover
$A' = A'''$ and $B' = B'''$.

**Definition 2.5.** A set fixed by its closure is *closed*. A closed subset of
$G$ is an *extent*; a closed subset of $M$ is an *intent*.

**Proposition 2.6.** Arbitrary intersections of extents are extents, and
arbitrary intersections of intents are intents. Hence the extents form a closure
system (a Moore family) on $G$ and the intents a closure system on $M$.

The two closures carry different epistemic content, and it is worth naming the
asymmetry. On the object side, $A''$ is the set of objects indiscernible from
the members of $A$ by any attribute common to $A$; closure on this side
expresses *empirical indiscernibility*. On the attribute side, $B''$ is the set
of attributes forced by $B$ in the given context; closure on this side expresses
*exact dependency*. One relation, read in two directions, yields both.

### 2.2 Concepts and the Basic Theorem

**Definition 2.7.** A *formal concept* of $\mathbb{K}$ is a pair $(A, B)$ with
$A \subseteq G$, $B \subseteq M$, $A' = B$ and $B' = A$. The set $A$ is its
*extent* and $B$ its *intent*.

Neither component of a concept is independently supplied: each determines the
other. Every $A \subseteq G$ generates the concept $(A'', A')$, and every
$B \subseteq M$ generates $(B', B'')$; distinct generating sets may yield the
same concept, closure discarding redundant generators while retaining their
consequences.

**Definition 2.8.** Order the concepts of $\mathbb{K}$ by

$$(A_1, B_1) \le (A_2, B_2) \iff A_1 \subseteq A_2 \iff B_1 \supseteq B_2,$$

the two conditions being equivalent by antitonicity. Write
$\mathfrak{B}(\mathbb{K})$ for the resulting ordered set.

The reversal is not a diagrammatic convention. The lower concept is the more
specific: it covers fewer objects and asserts more attributes.

**Theorem 2.9 (Basic Theorem of formal concept analysis).**
$\mathfrak{B}(\mathbb{K})$ is a complete lattice, with

$$\bigwedge_{j \in J} (A_j, B_j) = \Big(\bigcap_{j} A_j,\ \big(\bigcup_{j} B_j\big)''\Big),
\qquad
\bigvee_{j \in J} (A_j, B_j) = \Big(\big(\bigcup_{j} A_j\big)'',\ \bigcap_{j} B_j\Big).$$

Conversely, every complete lattice is isomorphic to $\mathfrak{B}(\mathbb{K})$
for some formal context $\mathbb{K}$.

The asymmetry of the two formulas is instructive and follows from Proposition
2.6: intersections of closed sets remain closed, whereas unions in general
require closing. The meet collects jointly satisfied specificity; the join forms
the least closed generalization.

The converse half is the stronger statement, and it is what licenses the
identification made throughout this paper. Incidence relations and complete
lattices are two presentations of a single structure: a context supplies
generators, a lattice supplies the completed order of concepts. Consequently any
result about complete lattices is available to any incidence relation, and any
construction on incidence relations descends to the lattice.

### 2.3 The logic internal to a context

**Definition 2.10.** An *attribute implication* is an expression $X \to Y$ with
$X, Y \subseteq M$. It is *valid* in $\mathbb{K}$ when every object bearing all
of $X$ bears all of $Y$.

**Proposition 2.11.** $\mathbb{K} \models X \to Y$ if and only if
$Y \subseteq X''$.

Thus the closure operator on attributes *is* the semantic consequence operator
of the context's internal logic. The valid implications are closed under
reflexivity, augmentation, and transitivity — the Armstrong rules of relational
dependency theory — and conversely every closure operator on a finite attribute
set is presented by a set of implications. Order theory, propositional Horn
logic, and dependency theory meet here at the level of closure.

Listing every valid implication is uninformative, since most are consequences of
others. The relevant object is a sound and complete *basis*.

**Definition 2.12.** A set $P \subseteq M$ is a *pseudo-intent* if $P \ne P''$
and $Q'' \subseteq P$ for every pseudo-intent $Q \subsetneq P$. The
*Duquenne–Guigues basis*, or canonical basis, is
$\{\, P \to P'' \setminus P \mid P \text{ a pseudo-intent} \,\}$.

**Theorem 2.13.** The Duquenne–Guigues basis is sound and complete for the valid
implications of $\mathbb{K}$, and is of minimum cardinality among complete
bases.

Minimality is in the number of implications, not in total literal count;
"canonical" names a structurally distinguished basis, not a computational
optimum. The associated interactive procedure — *attribute exploration* — turns
implication discovery into an alternation between a conjectured dependency and a
counterexample that is then added to the context, terminating with a complete
basis relative to the accumulated examples. The methodological point deserves
emphasis: knowledge acquisition here is a disciplined dialogue between
conjecture and refutation, not a passive extraction of patterns from a fixed
table.

### 2.4 Neighbouring identifications

Four descriptions of the same closure structure recur, and it is useful to have
them at hand, since each makes a different property obvious.

1. A formal concept is a maximal all-ones rectangle in the relation $I$: its
   extent and intent span a complete bipartite subgraph maximal under
   simultaneous enlargement. Concept enumeration is therefore a form of maximal
   biclique enumeration; the lattice order adds a global organization that a
   flat list of bicliques lacks.
2. Intents are exactly the closed itemsets of frequent-pattern mining under the
   Galois closure. Imposing a minimum-support constraint yields the iceberg
   sublattice.
3. The intent closure system is a Moore family, and the valid implications form
   a Horn theory. Model sets of Horn theories are closed under intersection,
   which is precisely Proposition 2.6; the canonical basis is a compressed
   axiomatization of the context.
4. Concept formation is a completion. Beginning with generators and an
   incidence, the concept lattice completes them into all stable pairs. Under
   suitable encodings this is an Isbell- or MacNeille-style completion, which
   explains the ubiquity of the construction: any polarity, and more generally
   any profunctor-like relation, generates such a space of fixed points.

The number of concepts may be exponential in the size of the context — the
contranominal scale on $n$ objects and $n$ attributes has $2^n$ concepts — so
exhaustive enumeration is not in general a defect of an algorithm but a property
of its output.

### 2.5 Closure, residuation, and the Lambek calculus

The closure operator of Corollary 2.4 is one instance of a shape that recurs
throughout this paper: an endomap that is extensive, monotone, and idempotent.
Any iterated settling process obeying those three laws computes a closure, and
computing the formal concepts of a finite context is exactly running such a
process to its fixed point.

Three algebraic facts connect this closure to substructural logic.

**Proposition 2.14.** Every integral commutative residuated lattice is a
commutative Lambek algebra: the single residual serves as both the left and the
right residual, and both Lambek bi-residuation adjunctions follow from the
single adjunction $x \cdot y \le z \iff x \le y \to z$.

**Proposition 2.15.** Generalizing Definition 2.1 so that incidence takes values
in a complete residuated lattice $L$, and replacing the derivation operators by
their residuated forms $A'(m) = \bigwedge_{g} \big(A(g) \to I(g,m)\big)$, one
again obtains a Galois connection, and the resulting concept lattice inherits
$L$-residuated structure. The Boolean case $L = \mathbf{2}$ recovers Definition
2.2.

**Theorem 2.16 (Wurm).** Syntactic concept lattices give a complete semantics
for the Lambek calculus.

Together these close a circle. Concept lattices are complete lattices (Theorem
2.9); many-valued concept lattices carry residuated structure (Proposition
2.15); residuated lattices are the algebraic semantics of the Lambek calculus
(Proposition 2.14); and concept lattices are complete for that calculus (Theorem
2.16). The closure operator that computes concepts and the residuation that
interprets a substructural implication are two readings of one algebraic
situation. A separate result of Pentus establishes that Lambek grammars generate
exactly the context-free languages, which locates the calculus in the Chomsky
hierarchy but is not needed below.

## 3. Articulation: tokens, claims, and the fiber algebra

### 3.1 Marks, positions, and utterances

**Definition 3.1.** A *mark* is a finite surface inscription, drawn from a fixed
set $\Sigma$ of atoms. A mark is not an identity: it is an inscription, and two
marks are distinguishable by inspection alone. Nothing in the definition asserts
that distinct marks denote distinct things, or that one mark denotes at all.

**Definition 3.2.** There are exactly two *positions*, written $\mathsf{tok}$
and $\mathsf{cl}$, and they are distinct. A mark occurring in the first position
is a *token*; a mark occurring in the second is a *claim*. Write $T$ for the set
of tokens and $Q$ for the set of claims.

**Definition 3.3.** An *utterance* is an ordered pair $u = (t, q)$ with $t \in T$
and $q \in Q$. Write $U \subseteq T \times Q$ for the set of admitted
utterances.

**Remark 3.4.** The pair is ordered and the order is load-bearing. The
transposition $(t,q) \mapsto (q,t)$ is not an automorphism of the structure; it
is the absence of one. Any representation that identifies the two positions
collapses a distinction that every construction below uses, and does so
silently, since the underlying marks are the same on both sides.

### 3.2 The claim fibration

**Definition 3.5.** The *claim fibration* is the projection

$$p : U \longrightarrow T, \qquad p(t,q) = t.$$

For $t \in T$ the *fiber* over $t$ is

$$U_t \;=\; p^{-1}(t) \;=\; \{\, q \in Q \mid (t,q) \in U \,\},$$

the set of claims made of $t$. The set $T$ is the *base*, $U$ the *total space*.

**Definition 3.6.** A *section* of $p$ over $S \subseteq T$ is a map
$s : S \to U$ with $p \circ s = \mathrm{id}_S$; equivalently, a choice
$s(t) \in U_t$ for each $t \in S$. A section over $S$ is an *articulation* of
$S$.

**Proposition 3.7.** Sections of $p$ over the one-point base $\{t\}$ are in
bijection with utterances whose token is $t$. Hence an utterance is exactly a
section over a point, and a section over $S$ is exactly a coherent
$S$-indexed family of utterances.

*Proof.* A section over $\{t\}$ is a choice of an element of $U_t$, which is a
claim $q$ with $(t,q) \in U$; the correspondence $s \mapsto (t, s(t))$ is a
bijection. $\square$

Proposition 3.7 is elementary but it fixes the vocabulary for the rest of the
paper. The single utterance and the global articulation are the same kind of
object at two scales, and the passage from one to the other is the passage from
a point of the base to a subset of it. Every question about whether local
articulations assemble into a global one is therefore a question about the
existence of sections, which is where the cohomology of §5.6 and §10 enters.

**Definition 3.8.** The fibration is *nondegenerate* at $t$ if $U_t \ne
\emptyset$. A token with empty fiber admits no utterance; it is a mark that has
never been said of anything.

### 3.3 The fiber algebra

The fibers are not bare sets. Each carries an algebra of evidential values, and
that algebra is what makes disagreement measurable.

**Definition 3.9.** Let $\mathbf{4} = \{\bot, \mathsf{f}, \mathsf{t}, \top\}$
carry two partial orders. The *information order* $\le_k$ has $\bot$ least,
$\top$ greatest, and $\mathsf{f}, \mathsf{t}$ incomparable in between. The
*truth order* $\le_t$ has $\mathsf{f}$ least, $\mathsf{t}$ greatest, and
$\bot, \top$ incomparable in between. Both are lattice orders, and each of the
four lattice operations is monotone for the other order; $(\mathbf 4, \le_k,
\le_t)$ is the smallest nontrivial *bilattice*.

**Proposition 3.10.** The map $c \mapsto (\mathrm{pos}(c), \mathrm{neg}(c))$,
sending $\bot \mapsto (0,0)$, $\mathsf t \mapsto (1,0)$,
$\mathsf f \mapsto (0,1)$, $\top \mapsto (1,1)$, is an isomorphism of
$\mathbf 4$ with $\mathbf{2} \times \mathbf{2}$, under which $\le_k$ is the
product order and $\le_t$ is the product order on the first coordinate with the
reverse order on the second. The automorphism group of $\mathbf 4$ preserving
the pair $\{\le_k, \le_t\}$ acts transitively on the four elements.

The two coordinates are *independently actionable*: evidence for and evidence
against are separate, and a value records both. Collapsing $\mathbf 4$ to
$\mathbf 2$ identifies $\bot$ with $\mathsf f$ and destroys the distinction
between the absence of evidence and the presence of contrary evidence, and
simultaneously identifies $\top$ with one of $\mathsf t, \mathsf f$ and destroys
the distinction between agreement and conflict. Both distinctions are used in
§10; the four-valued algebra is not a refinement for its own sake.

**Definition 3.11.** The *fiber algebra* over a token $t$ is

$$A_t \;=\; \mathbf{4}^{\,U_t},$$

the set of valuations of the claims of $t$, with the bilattice operations taken
pointwise. Each $A_t$ is a complete bilattice, being a product of copies of
$\mathbf 4$.

**Definition 3.12.** A *morphism of articulations* $\varphi : t \to t'$ is a map
$\varphi_\sharp : U_t \to U_{t'}$ of fibers — a rule carrying each claim made of
$t$ to a claim made of $t'$. Composition and identities are those of the
underlying maps, giving a category $\mathcal{T}$ of tokens.

**Proposition 3.13.** Each morphism $\varphi : t \to t'$ induces the *pullback*
$\varphi^* : A_{t'} \to A_t$, $\varphi^*(v) = v \circ \varphi_\sharp$, and
$\varphi^*$ is a homomorphism of complete bilattices. The assignment
$t \mapsto A_t$, $\varphi \mapsto \varphi^*$, is a contravariant functor
$A : \mathcal{T}^{\mathrm{op}} \to \mathbf{BiLat}$.

*Proof.* The bilattice operations on $A_t$ and $A_{t'}$ are pointwise, and
precomposition with a fixed map commutes with pointwise operations and with
arbitrary pointwise meets and joins. Functoriality is associativity of
composition. $\square$

Proposition 3.13 is the technical content of the phrase *fiber algebra*. The
fibers are not merely sets varying over a base; they are algebras varying
contravariantly, which is to say that $A$ is a presheaf of bilattices on
$\mathcal{T}$. Evidence transports backwards along articulation morphisms —
one can always ask of a claim about $t$ what its image says about $t'$, and pull
the answer back — while claims themselves transport forwards.

### 3.4 Bundling: from fibers to a total space

The fibers assemble into a single object by the standard construction.

**Definition 3.14.** The *total category* $\textstyle\int A$ of the presheaf $A$
has as objects the pairs $(t, v)$ with $t \in \mathcal{T}$ and $v \in A_t$, and
as morphisms $(t,v) \to (t',v')$ those $\varphi : t \to t'$ in $\mathcal{T}$
with $\varphi^*(v') = v$. Let $\Pi : \int A \to \mathcal{T}$ be the projection
$(t,v) \mapsto t$.

**Proposition 3.15.** $\Pi$ is a fibration whose fiber over $t$ is the discrete
category on $A_t$, and $A$ is recovered from $\Pi$ by taking fibers. The
assignments $A \mapsto \Pi$ and $\Pi \mapsto A$ are mutually inverse up to
equivalence.

The passage of Proposition 3.15 is what the word *bundling* means here. A family
of local fiber algebras, one per token, is the same data as a single fibered
category over the token base; nothing is added and nothing is lost. A section of
$\Pi$ over a subcategory $S \subseteq \mathcal{T}$ is a choice of $v_t \in A_t$
for each $t \in S$ such that $\varphi^*(v_{t'}) = v_t$ for every morphism
$\varphi : t \to t'$ of $S$ — that is, a *compatible* family of valuations.
This is the first appearance of the compatibility condition that §10 measures.

### 3.5 From bundle to sheaf: the claim site

To speak of *local* articulation we need a notion of locality, which is a
topology on the base.

**Definition 3.16.** A *claim site* is the category $\mathcal T$ equipped with a
Grothendieck topology: for each token a distinguished collection of families
$\{\varphi_i : t_i \to t\}$ declared *covering*, satisfying the usual stability,
locality, and identity axioms. Concretely one may take the supports to be a
distributive lattice of regions of evidence, with $\{U_i\}$ covering $U$ when
each $U_i \le U$ and $\bigvee_i U_i = U$.

**Definition 3.17.** The presheaf $A$ is a *sheaf* on the claim site if for every
covering family $\{t_i \to t\}$ the diagram

$$A_t \;\longrightarrow\; \prod_i A_{t_i} \;\rightrightarrows\; \prod_{i,j} A_{t_i \times_t t_j}$$

is an equalizer.

Unwinding: $A$ is a sheaf exactly when (i) a valuation on $t$ is determined by
its restrictions to any cover — *separation* — and (ii) any family of local
valuations agreeing on all overlaps arises from a valuation on $t$ — *gluing*.

**Proposition 3.18 (bundling is the sheaf condition).** The bundle $\Pi$ of
Definition 3.14 admits, over each covering family, a canonical comparison map
from its sections over $t$ to the compatible families of sections over the
$\{t_i\}$. This comparison map is injective exactly when $A$ is separated, and
bijective exactly when $A$ is a sheaf.

*Proof.* The set of sections of $\Pi$ over the one-object subcategory $\{t\}$ is
$A_t$; the set of compatible families over $\{t_i\}$ is the equalizer of the
double arrow. The comparison map is the canonical map into that equalizer, and
the two clauses are the two halves of the equalizer condition. $\square$

Proposition 3.18 is the precise sense in which *bundling the fibers is the sheaf
structure*. The bundle exists unconditionally; whether its local sections
assemble into global ones is exactly the sheaf axiom, and the failure of that
axiom is the subject of §5.6 and §10.4. It is worth stating the consequence
plainly: separation is what makes a merge *deterministic* when it succeeds,
since it says that at most one global valuation restricts to a given compatible
family; gluing is what makes the merge *possible*, since it says that at least
one does. The two halves answer different questions and can fail
independently.

### 3.6 Articulation as a formal context

The bridge back to §2 is immediate and will be used throughout.

**Proposition 3.19.** The claim fibration determines a formal context in the
sense of Definition 2.1, namely $\mathbb{K}_U = (Q, T, I_U)$ with
$q\, I_U\, t \iff (t,q) \in U$. Under this identification the extent operator
sends a set of claims to the tokens all of them are said of, the intent operator
sends a set of tokens to the claims common to all of them, and for a single
token $t$ the intent generated is the fiber $U_t$.

Thus articulation is an incidence relation, the fiber over a token is a column
of that relation, and everything in §2 — the Galois connection, the closure, the
concept lattice, the implication basis — applies verbatim to it. In particular
the closure $U_t''$ of a fiber is the set of claims *forced* by the claims
actually made of $t$, and the concept generated by $t$ is the pair consisting of
that forced fiber and the tokens sharing it.

## 4. The grounding chain

A claim is itself made of marks in token position. It therefore decomposes, and
the decomposition must terminate. This section states the termination condition
and draws its consequences.

### 4.1 Decomposition

**Definition 4.1.** For each claim $q \in Q$ let $\partial q \subseteq T$ be the
finite set of tokens *occurring* in $q$. Define the *dependency relation*
$\rhd$ on $T$ by

$$t \rhd t' \quad :\iff \quad \exists\, q \in U_t \ \text{ with } \ t' \in \partial q .$$

Read $t \rhd t'$ as "$t$ immediately depends on $t'$": some claim made of $t$
mentions $t'$.

**Definition 4.2.** A token $t$ is *atomic*, or a *mark*, if $\partial q =
\emptyset$ for every $q \in U_t$; equivalently, if $t$ has no $\rhd$-successor.
Write $\Sigma \subseteq T$ for the set of marks.

Definition 4.2 makes "mark" a *derived* notion rather than a stipulated one: a
token is a mark when the descent stops there, and stopping is a property of the
articulation, not a label attached in advance.

### 4.2 Well-foundedness

**Definition 4.3.** The articulation is *grounded* if $\rhd$ is well-founded:
every nonempty $S \subseteq T$ has a $\rhd$-minimal element, equivalently there
is no infinite descending chain $t_0 \rhd t_1 \rhd t_2 \rhd \cdots$.

**Proposition 4.4.** In a grounded articulation, the $\rhd$-minimal elements of
$T$ are exactly the marks.

*Proof.* A token is $\rhd$-minimal iff it has no $\rhd$-successor, which by
Definition 4.1 holds iff every claim made of it mentions no token, which by
Definition 4.2 is atomicity. $\square$

**Theorem 4.5 (grounding).** Let the articulation be grounded. Then:

1. *(Recursion.)* Every specification of the form
   $\Theta(t) = \Psi\big(t,\ (\Theta(t'))_{t \rhd t'}\big)$
   has a unique total solution $\Theta$ on $T$.
2. *(Induction.)* To prove $P(t)$ for all $t \in T$ it suffices to prove $P(t)$
   for $t \in \Sigma$ and to prove $P(t)$ from the hypothesis that $P(t')$ holds
   for every $t'$ with $t \rhd t'$.
3. *(Termination.)* Every descent $t_0 \rhd t_1 \rhd \cdots$ is finite and its
   last term is a mark.

*Proof.* (1) and (2) are the recursion and induction principles for a
well-founded relation. (3) is immediate from Definition 4.3 together with
Proposition 4.4. $\square$

Theorem 4.5 is what the well-foundedness hypothesis is *for*. Without it the
recursion of Definition 4.6 below does not define a function, the inductive
arguments of §10 have no base case, and the descent from a token to its ground
need not halt. With it, all three are available at once.

### 4.3 Grounded closure and mark support

**Definition 4.6.** In a grounded articulation define, by the recursion of
Theorem 4.5(1),

$$\mathrm{gr}(t) \;=\; \{t\} \;\cup \bigcup_{q \in U_t}\ \bigcup_{t' \in \partial q} \mathrm{gr}(t').$$

Call $\mathrm{gr}(t)$ the *grounded closure* of $t$ — its actual set of form —
and call $\mathrm{supp}(t) = \mathrm{gr}(t) \cap \Sigma$ its *mark support*.

**Theorem 4.7.** In a grounded articulation:

1. $\mathrm{gr}$ is well defined and total.
2. If $\rhd$ is finitely branching then $\mathrm{gr}(t)$ is finite for every $t$.
3. $t \rhd^* t'$ implies $\mathrm{gr}(t') \subseteq \mathrm{gr}(t)$; in
   particular $\mathrm{gr}$ is monotone along the dependency order.
4. $\mathrm{supp}(t) \ne \emptyset$ whenever $U_t \ne \emptyset$.
5. $\mathrm{gr}$ is a closure operator on $\mathcal{P}(T)$ when extended by
   $\mathrm{gr}(S) = \bigcup_{t \in S}\mathrm{gr}(t)$: it is extensive,
   monotone, and idempotent.

*Proof.* (1) is Theorem 4.5(1). (2) follows by well-founded induction, the
union being finite at each stage. (3) is immediate from the recursion. (4): if
$U_t \ne \emptyset$ pick $q \in U_t$; if $\partial q = \emptyset$ then $t$ is a
mark and $t \in \mathrm{supp}(t)$, otherwise descend, and by Theorem 4.5(3) the
descent terminates at a mark, which lies in $\mathrm{gr}(t)$ by (3). (5)
Extensivity and monotonicity are immediate; idempotence follows from (3).
$\square$

Clause (5) deserves emphasis: $\mathrm{gr}$ is a closure operator of exactly the
shape met in Corollary 2.4 and again in §6.5 — extensive, monotone, idempotent.
The grounded closure of a token, the concept closure of a set of attributes, and
the transitive closure of a causal seed are three instances of one algebraic
pattern, and each is computed by iterating an inflationary monotone step to its
fixed point.

### 4.4 Grounding is normalization

The descent of §4.3 is a rewriting process, and its termination has the
consequence one expects.

**Definition 4.8.** The *decomposition rewriting* $\to_\partial$ on finite
multisets of tokens replaces an occurrence of a non-atomic token $t$ by the
tokens of $\partial q$ for some $q \in U_t$. A multiset is in *normal form* iff
every element is a mark.

**Proposition 4.9 (strong normalization).** In a grounded articulation with
$\rhd$ finitely branching, $\to_\partial$ is strongly normalizing: every
reduction sequence terminates, and every normal form consists of marks.

*Proof.* Assign to a multiset the multiset of its tokens ordered by $\rhd$. Each
rewriting step replaces one element by finitely many strictly $\rhd$-smaller
elements, so the multiset extension of $\rhd$ — well-founded because $\rhd$ is —
strictly decreases. $\square$

**Theorem 4.10 (unique ground).** If in addition $\to_\partial$ is locally
confluent, then by Newman's lemma it is confluent, and every token has a
*unique* normal form under $\to_\partial$, namely its mark support
$\mathrm{supp}(t)$.

*Proof.* Newman's lemma: a terminating, locally confluent relation is confluent.
Termination is Proposition 4.9. Confluence plus termination gives unique normal
forms, and by Theorem 4.7(4) the normal form of the singleton $\{t\}$ consists
of marks and is contained in $\mathrm{supp}(t)$; the reverse inclusion is
Theorem 4.7(3). $\square$

Theorem 4.10 is the first appearance of the paper's naming principle, and §7.4
is the second. In both cases the pattern is identical: a rewriting relation that
terminates and is confluent assigns to each object a unique irreducible form,
and that form is a *definite description* — "the mark support of $t$", "the
normal form of $t$" — which can therefore serve as a name. In neither case is
the name assigned by fiat and looked up; it is computed, and the computation is
the justification.

The two normalizations are not the same relation and no theorem here identifies
them. What they share is the argument form. Where §7 normalizes a typed term
under $\beta$ and projection, §4 normalizes a token under decomposition into the
tokens its claims mention; the first terminates because the calculus is
strongly normalizing, the second because $\rhd$ is well-founded. Hitting marks
*is* normalization, in the exact sense that reaching an irreducible form is what
both procedures do.

## 5. Intensional profiles over a claim site

This section builds a two-dimensional semantics — a primary and a secondary
reading of a term — on the closure theory of §2 and the fibration of §3. Its
distinguishing feature is that the frame over which readings vary is a *site*,
with covers and gluing conditions, rather than a bare index set of possible
worlds. The classical primary/secondary distinction is recovered, and the sheaf
structure supplies something the classical formulation does not: an obstruction
theory, developed in §5.6 and computed in §9.4 and §10.

### 5.1 Term contexts and generated concepts

**Definition 5.1.** A *term context* is a pair $C = (T_C, \iota_C)$ consisting
of a set $T_C$ of terms and an incidence relation
$\iota_C \subseteq Q \times T_C$, where $Q$ is the set of claims. We read
$\iota_C(q, t)$ as "the claim $q$ bears the term $t$."

By Proposition 3.19 a term context is a formal context in the sense of
Definition 2.1, with claims as objects and terms as attributes; and the
articulation of §3 is the motivating example, with $T_C = T$ and
$\iota_C(q,t) \iff (t,q) \in U$. All of §2 applies verbatim.

**Definition 5.2.** The *direct profile* of a term $t \in T_C$ is the set of
claims bearing it,

$$\pi_C(t) = \{\, q \in Q \mid \iota_C(q, t) \,\} \subseteq Q,$$

that is, the column of $t$ in the incidence relation. The *generated concept* of
$t$ is the concept whose extent is the closure of that column:

$$\gamma_C(t) = \big(\pi_C(t)'',\ \pi_C(t)'\big).$$

In the articulation example, $\pi_C(t)$ is precisely the fiber $U_t$ of
Definition 3.5. The direct profile of a term is the fiber of the claim fibration
over it, and the generated concept is that fiber closed under Corollary 2.4.

**Proposition 5.3.** The extent of $\gamma_C(t)$ is closed, and
$t \in \pi_C(t)'$, so the generating term belongs to the intent of the concept
it generates.

*Proof.* Closedness is Corollary 2.4. For the second claim, $\pi_C(t)'$ is the
set of terms borne by every claim in $\pi_C(t)$; by definition of $\pi_C(t)$,
every such claim bears $t$. $\square$

A term's meaning, on this account, is not the term but its closed profile. Two
terms with the same fiber generate the same concept and are semantically
indistinguishable within the context, however different their surfaces. The
profile is incidence with claims, closed under Corollary 2.4 — not a
distribution over occurrences. The semantics is closure-theoretic rather than
statistical, and the two need not agree.

### 5.2 Transports

Meaning is context-relative, so comparison across contexts requires a structure
that carries incidence.

**Definition 5.4.** A *transport* $F : C \to D$ of term contexts is a pair of
maps $F_Q : Q \to Q$ and $F_T : T_C \to T_D$ such that

$$\iota_C(q, t) \implies \iota_D\big(F_Q(q),\, F_T(t)\big) \qquad
\text{for all } q \in Q,\ t \in T_C.$$

This is the two-sided form of the articulation morphism of Definition 3.12: the
map $F_T$ carries tokens, $F_Q$ carries claims, and the implication is exactly
preservation of incidence, hence of fibers.

**Proposition 5.5.** A transport carries direct profiles forward:
$F_Q\big(\pi_C(t)\big) \subseteq \pi_D\big(F_T(t)\big)$.

Note that the inclusion is one-directional. A transport may create incidences it
did not find; it may not destroy them. Consequently a transport need not carry
closures forward, and $\gamma_D(F_T(t))$ is in general unrelated to the image of
$\gamma_C(t)$. This is not a defect of the definition. It is the formal residue
of the fact that a term carried into a richer context may acquire commitments it
did not have.

**Definition 5.6.** Given a valuation $v$ on claims of $D$ — a map to the
bilattice $\mathbf 4$ of Definition 3.9 — its *pullback* along $F$ is
$F^*v = v \circ F_Q$.

**Proposition 5.7.** $F^*$ is a homomorphism of complete bilattices. If
$F_Q = \mathrm{id}_Q$, then $F^*v = v$ for every valuation $v$. If a valuation
supports every claim in $\pi_D(F_T(t))$, then its pullback supports every claim
in $\pi_C(t)$.

Proposition 5.7 identifies the pullback of Definition 5.6 with the fiber
transport $\varphi^*$ of Proposition 3.13. The transport that relates readings
across indices, in the two-dimensional semantics below, is the *same map* as the
one that transports evidence backwards along the bundle. Secondary intension and
fiber transport are one construction seen twice.

### 5.3 Topics, readings, and covers

Let $S$ be the claim site of Definition 3.16, with covering families written
$\{U_i \to U\}$.

**Definition 5.8.** A *topic* in a term context $C$ is a triple
$(\mathfrak{c}, u, \{U_i\})$ consisting of a concept $\mathfrak{c}$ of $C$, a
point $u$ of the site whose underlying claim lies in the extent of
$\mathfrak{c}$, and a covering family $\{U_i\}$ of the support of $u$.

A topic is thus not a primitive notion. It is the site-local presentation of a
concept: a concept, a place where it is witnessed, and a decomposition of that
place.

**Definition 5.9.** A *term reading* in $C$ is a pair $(\mathfrak{t}, t)$ of a
topic $\mathfrak{t}$ and a term $t$ lying in the intent of the topic's concept.

**Proposition 5.10 (locality).** Every member of a topic's covering family lies
below the topic's support, and their join is that support. A reading restricts
along each cover member, and the restrictions of a reading to $U_i$ and $U_j$
agree in term on the overlap $U_i \wedge U_j$.

Proposition 5.10 is the presheaf condition. It says that readings form a
presheaf on the site; it does not say that a compatible family of local readings
comes from a global one. By Proposition 3.18 that further statement is precisely
the sheaf axiom, and its failure is the subject of §5.6.

### 5.4 Primary and secondary readings

Fix now a family of term contexts.

**Definition 5.11.** An *intensional frame* is a pair
$F = (\mathrm{Ind}, C_{(-)})$ of an index set and an assignment $i \mapsto C_i$
of a term context to each index.

Two ways of reading a term across a frame present themselves, and their
difference is exactly the classical distinction between a primary and a
secondary intension.

**Definition 5.12.** A *term family* on $F$ is a choice $\tau$ of a term
$\tau_i \in T_{C_i}$ at each index. Its *primary concept* at $i$ is the concept
generated by the term chosen there,

$$\mathrm{Pr}_\tau(i) = \gamma_{C_i}(\tau_i).$$

**Definition 5.13.** An *anchored term* on $F$ is a quadruple
$\mathcal{A} = (a, t_a, \{F_i\}, \varepsilon)$ consisting of a distinguished
index $a$ (the *actual* index), a term $t_a \in T_{C_a}$, a family of transports
$F_i : C_a \to C_i$, and a normalization $\varepsilon$ asserting that $F_a$
fixes claims and fixes $t_a$. Its *secondary concept* at $i$ is

$$\mathrm{Sec}_{\mathcal{A}}(i) = \gamma_{C_i}\big((F_i)_T(t_a)\big).$$

The primary reading closes the term found at $i$; the secondary reading fixes
the term at the actual index, transports it to $i$, and closes there. The two
constructions stand in a precise relation.

**Theorem 5.14.** Let $\mathcal{A}$ be an anchored term and let
$\tau^{\mathcal{A}}$ be the term family
$\tau^{\mathcal{A}}_i = (F_i)_T(t_a)$ induced by transporting the anchor. Then:

1. $\mathrm{Sec}_{\mathcal{A}}(i) = \mathrm{Pr}_{\tau^{\mathcal{A}}}(i)$ for
   every $i$. A secondary reading is the primary reading of the term family its
   anchor induces.
2. $\mathrm{Sec}_{\mathcal{A}}(a) = \gamma_{C_a}(t_a)$. At the actual index the
   secondary reading is the concept generated by the anchored term itself.
3. Every extent $\mathrm{Sec}_{\mathcal{A}}(i)$ is closed.
4. The actual direct profile is preserved: if $q \in \pi_{C_a}(t_a)$ then
   $(F_i)_Q(q) \in \pi_{C_i}\big((F_i)_T(t_a)\big)$; and at $i = a$ this
   specializes to $q \in \pi_{C_a}\big((F_a)_T(t_a)\big)$.

*Proof.* (1) and (3) are definitional unfoldings together with Corollary 2.4.
(2) follows from the normalization $\varepsilon$, which makes $(F_a)_T(t_a) =
t_a$. (4) is Proposition 5.5 for the first part, and the claim-fixing half of
$\varepsilon$ for the second. $\square$

Theorem 5.14 is the technical heart of the section, and its content is easy to
state informally. The secondary construction is not a different *kind* of
object: it is the primary construction applied to a family that is not freely
chosen but generated by transport from a single point. The two readings agree
where the anchor sits, and may diverge elsewhere. What makes profiles at
distinct indices comparable at all is the transport; absent it, there is nothing
forcing any relation whatever between the concept a term generates here and the
concept it generates there.

This recovers the classical two-dimensional picture — a term evaluated at an
index considered as actual, versus a term whose reference is fixed at the actual
index and then evaluated elsewhere — with one structural difference. The
"worlds" here are objects of a site and carry covers, so readings are subject to
a gluing condition, and a compatible family of local readings may fail to
determine a global one. Nothing in the possible-world formulation has that
shape, and it is what the next subsection exploits.

### 5.5 Valuations and patch families

**Definition 5.15.** A *valuated reading* is a term reading together with a
valuation $v$ on claims such that every claim in the reading's direct profile is
supported by $v$ — that is, has positive coordinate $1$ in the sense of
Proposition 3.10.

Reading a valuation through a support produces a mask on cells: a cell is
admitted by a support $U$ under $v$ when $U$ admits at least one of the two
evidence coordinates present in the cell's value under $v$.

**Proposition 5.16.** The mask of a join of supports is the pointwise union of
the masks; consequently, if a cell is admitted by the mask of the join of a
finite covering family, some member of that family admits it.

**Definition 5.17.** A *patch family* is a support mask together with a finite
list of local masks such that every cell in the support mask lies in some local
mask.

**Proposition 5.18.** The covering family of a valuated reading's topic induces
a patch family, by Propositions 5.10 and 5.16. It is a covering of the *whole*
cell space — a sheaf cover in the strict sense — precisely when the reading's
support mask admits every cell.

The distinction in Proposition 5.18 between a relative patch family and an
absolute cover is not pedantry. A reading witnessed on a region covers what that
region displays, and nothing more; promoting it to a global cover requires the
hypothesis of full support, which must be supplied and not assumed. All of §5.4
transports through this machinery: the patch family and, under full support, the
sheaf cover of a secondary reading are those of the primary reading its anchor
induces, and pulling a valuation back along the transport at the actual index
recovers the original valuation and the original patches, by Proposition 5.7.

### 5.6 Polysemy as an obstruction

We can now state the consequence for naming that motivates the construction.

Let $t$ be a term and $\{U_i\}$ a covering family of a support $U$. By
Proposition 5.10, $t$ determines a reading over each $U_i$, and these agree in
term on overlaps. Ask whether they arise by restriction from a single reading
over $U$.

**Definition 5.19.** The family $\{r_i\}$ of local readings *glues* if there is a
reading $r$ over $U$ with $r|_{U_i} = r_i$ for all $i$.

Because readings form a presheaf, compatibility on overlaps is necessary for
gluing. To make the obstruction to sufficiency an invariant, assume the standard
torsor structure.

**Definition 5.20.** The readings of $t$ form an $\mathcal{A}$-*torsor* over the
claim site, for an abelian sheaf $\mathcal A$ of *re-readings*, if any two
readings over the same support differ by a unique section of $\mathcal A$ over
that support, and $\mathcal A(U)$ acts simply transitively on the readings over
$U$ whenever these are nonempty.

**Proposition 5.21.** Let the readings of $t$ form an $\mathcal A$-torsor. Then a
family of local readings over $\{U_i\}$, compatible up to the action of
$\mathcal A$, determines a class in $\check H^1(\{U_i\};\, \mathcal A)$, and the
family arises from a single reading over $U$ if and only if that class vanishes.
Equivalently, the isomorphism classes of $\mathcal A$-torsors trivialized on the
cover are in bijection with $\check H^1(\{U_i\};\mathcal A)$, the trivial class
corresponding to the readings that glue.

**Definition 5.22.** A term $t$ is *polysemous over the covering* $\{U_i\}$ if
its local readings are pairwise compatible but their class in
$\check H^1(\{U_i\};\mathcal A)$ is nonzero.

Definition 5.22 is the proposal this section exists to make. Polysemy is not
vagueness, not ambiguity of surface, and not a shortage of care in drafting. It
is the exact statement that no single closed concept has all the local profiles
of $t$ as restrictions. Its remedy is correspondingly exact and is forced rather
than chosen: since a term cannot name two concepts whose extents are unrelated
by the closure, either the covering must be refined until the obstruction dies,
or the term must split into terms whose local readings do glue.

Section 9.4 computes when the obstruction can be nonzero, and §10 supplies the
constructive converse: when it vanishes, the readings amalgamate canonically.

## 6. Cone fields and causal order

### 6.1 The local cone

**Definition 6.1.** A *spacetime* is a smooth manifold $M$ with a Lorentzian
metric $g$, of signature $(-,+,\dots,+)$. At $p \in M$, a nonzero tangent vector
$v \in T_pM$ is *timelike* if $g_p(v,v) < 0$, *null* if $g_p(v,v) = 0$, and
*spacelike* if $g_p(v,v) > 0$.

The null vectors at $p$ form a double cone, whose interior consists of the
timelike vectors and whose exterior consists of the spacelike ones. A *time
orientation* is a continuous choice of one of the two timelike components at
each point, labelling it future. This is an additional global datum; the metric
does not supply it, and not every spacetime admits one.

For a future-directed timelike curve $\gamma$, the proper time is
$L(\gamma) = \int \sqrt{-g(\dot\gamma, \dot\gamma)}\, d\lambda$; null curves
accumulate none, which is a statement about the failure of proper time to
parametrize a null worldline and not a claim about any experience.

### 6.2 Conformal structure and scale

**Proposition 6.2.** If $\tilde g = \Omega^2 g$ with $\Omega > 0$ smooth, then
$g(v,v)$ and $\tilde g(v,v)$ have the same sign for every $v$. Hence $g$ and
$\tilde g$ determine the same timelike, null, and spacelike directions, the same
cone field, and the same unparametrized null curves.

They do not determine the same lengths, volumes, curvature scalars, or clock
rates. This yields the first structural division of the subject:

- the *conformal structure* $[g]$ is the field of cones;
- the *scale* is what determines measurements within and between cones.

The division underwrites the statement that order plus volume recovers geometry,
made precise in Theorem 6.9 below: causal order determines the conformal class,
and a volume element determines the remaining factor, since in $n$ dimensions
$d\mathrm{vol}_{\Omega^2 g} = \Omega^n\, d\mathrm{vol}_g$.

A caution about the global object. At the local level $g(v,v) = 0$ picks out null
directions, and light rays follow null geodesics; but curvature focuses, shears,
and twists congruences of such rays, so null geodesics develop conjugate points
and caustics and the global "cone from $p$" need not remain a smooth
hypersurface. The precise global object is the causal boundary
$\partial J^+(p)$, which coincides with a smooth cone only within a convex normal
neighbourhood.

### 6.3 The causal order

**Definition 6.3.** For events $p, q \in M$ write $p \ll q$ (the *chronological*
relation) when a future-directed timelike curve runs from $p$ to $q$, and
$p \le q$ (the *causal* relation) when $p = q$ or a future-directed causal curve
runs from $p$ to $q$. Set $I^+(p) = \{q : p \ll q\}$ and
$J^+(p) = \{q : p \le q\}$, with $I^-$ and $J^-$ defined dually.

**Proposition 6.4.** $I^+(p)$ is open. $J^+(p)$ need not be closed without
further causal hypotheses. In the absence of closed causal curves, $\le$ is a
partial order.

It is a partial and not a total order, and the incomparability is the point:
spacelike-separated events are incomparable, which is the order-theoretic form of
the non-absoluteness of simultaneity.

**Definition 6.5.** For $p \le q$, the *causal diamond* is
$J^+(p) \cap J^-(q)$.

Diamonds are the natural finite causal regions and recur below as the basic
opens of a topology. A caution parallel to Proposition 6.2: the cone supplies a
*necessary accessibility relation*, saying where an influence may go. It does not
say what occurred, nor which of the permitted curves was realized. Relativistic
causal accessibility, causation in the explanatory sense, and causal order in the
information-theoretic sense are three notions and must not be merged.

**Definition 6.6.** A spacetime is *chronological* if it has no closed timelike
curve; *causal* if it has no closed causal curve; *strongly causal* if every
point has arbitrarily small neighbourhoods that no causal curve re-enters after
leaving; *stably causal* if causality survives a small widening of all cones; and
*globally hyperbolic* if it is causal and all causal diamonds are compact.

**Theorem 6.7.** Stable causality is equivalent to the existence of a continuous
global time function strictly increasing along every future-directed causal
curve. Global hyperbolicity is equivalent to the existence of a Cauchy
hypersurface, and a globally hyperbolic spacetime splits smoothly as
$M \cong \mathbb{R} \times S$ with each slice a smooth spacelike Cauchy surface.

The splitting does not make time absolute; it says the spacetime admits a
foliation by Cauchy surfaces, while distinct admissible time functions remain
possible.

The global force of the cone field comes from the evolution of congruences. For
an affinely parametrized, hypersurface-orthogonal null congruence with tangent
$k^a$ and expansion $\theta$ in four dimensions, the null Raychaudhuri equation
reads

$$\frac{d\theta}{d\lambda} = -\tfrac{1}{2}\theta^2 - \sigma_{ab}\sigma^{ab} - R_{ab}k^ak^b,$$

so that shear and a positive Ricci contraction focus neighbouring rays. This is
the mechanism by which a local statement about rays becomes a global
theorem-making device, and it is what converts the existence of a trapped surface
into null geodesic incompleteness under an energy condition and suitable global
causal hypotheses.

### 6.4 Alexandrov topology and order recovery

**Definition 6.8.** The *Alexandrov topology* on $M$ is generated by the sets
$I^+(p) \cap I^-(q)$.

In a strongly causal spacetime the Alexandrov topology agrees with the manifold
topology. Hence order alone already recovers the neighbourhood relation, and any
bijection preserving chronological order in both directions preserves the basic
diamonds and is therefore a homeomorphism. Pushing further, the way timelike
directions approach the edge of the chronological future identifies the null
directions, so such a bijection preserves the cone field.

**Theorem 6.9 (order determines conformal geometry).** Let $M, N$ be past- and
future-distinguishing spacetimes of dimension greater than two and let
$f : M \to N$ be a bijection such that $p \ll q$ if and only if
$f(p) \ll f(q)$. Then $f$ is a conformal isomorphism. Consequently the causal
order determines the topology, the differential structure, and the conformal
class; the conformal factor is determined in addition by a volume element.

Two remarks bound the theorem. First, differential and conformal regularity enter
the argument at the step identifying null directions; this is not a theorem about
arbitrary partially ordered sets, and a poset carrying only the order does not
inherit its conclusion. Second, what causal order does *not* determine is
extensive and should be stated: not the conformal scale, hence not proper-time
durations or volumes; not which permitted curve was realized; not a stress-energy
tensor or a field state; and not a global time coordinate, which requires the
further conditions of Definition 6.6. The causal structure is a large but
specific invariant — the geometry of possible influence, not the dynamical
history.

An operational reading due to Ehlers, Pirani and Schild reaches the same
stratification from the other side: light propagation supplies a conformal
structure, free-fall trajectories supply a projective structure, compatibility
recovers a Weyl geometry, and clock information selects a pseudo-Riemannian
metric. Cones, inertial paths, and scale are three independent data.

### 6.5 The discrete case

The order-theoretic content survives discretization, and it is worth recording
in the form that later sections use.

**Definition 6.10.** A *causal set* is a finite set $E$ of events with an acyclic
relation $\prec_0$ (the direct links). Let $\mathrm{reach}$ be the transitive
closure of $\prec_0$, and define $x \preceq y$ to mean $x = y$ or
$\mathrm{reach}(x,y)$.

**Proposition 6.11.** $\mathrm{reach}$ is transitive, irreflexive, and
asymmetric; $\preceq$ is a partial order. Antisymmetry of $\preceq$ is exactly
the absence of a closed causal cycle.

**Definition 6.12.** The *strict future* and *past* cones of $e$ are
$\mathrm{reach}(e, -)$ and $\mathrm{reach}(-, e)$; the *closed* cones are the
principal up-set and down-set of $\preceq$ at $e$. Events $x, y$ are *spacelike*
when neither reaches the other. The *diamond* of $a \preceq b$ is the
intersection of the closed future of $a$ with the closed past of $b$.

**Proposition 6.13.** Cones are order-closed: the strict future of $a$ is an
up-set for $\preceq$, and dually. Spacelike separation is symmetric.

The transitive closure is itself a closure operator in the sense of §2.5 and of
Theorem 4.7(5), obtained by iterating

$$T(v)(x,z) = v(x,z) \ \vee\ \exists y.\ v(x,y) \wedge v(y,z)$$

to a fixed point; on a finite acyclic seed the iteration terminates, and the
fixed point is the causal order. Three closure operators have now appeared —
concept closure, grounded closure, causal closure — and they are three instances
of the same extensive-monotone-idempotent pattern applied to different incidence
data.

**Proposition 6.14.** Instantiating Definition 6.8 at $\preceq$ gives a topology
in which the closed future cones are exactly the principal open up-sets, the
specialization order is $\preceq$, strict reachability is specialization together
with inequality, and continuous maps between causal sets are exactly the
order-preserving ones.

Proposition 6.14 is the discrete shadow of Theorem 6.9: causal order determines
the topology, with the Alexandrov construction as the bridge. What does not
survive is the recovery of a metric, since the regularity hypotheses of Theorem
6.9 have no finite analogue. Recovering a dimension from order alone — via the
ordering fraction of a diamond and its inversion — requires a further analytic
step.

## 7. The Curry–Howard–Lambek language

### 7.1 The calculus

**Definition 7.1.** Let types be generated by a base type, a unit, and the binary
formers $\to$ and $\times$. Let terms be de Bruijn expressions generated by
variables, abstraction, application, pairing, the two projections, and the unit
term. Let $\Gamma \vdash t : A$ be the usual typing relation over a context of
types.

**Definition 7.2.** The reduction $\rightsquigarrow$ is generated by

$$(\lambda.\, t)\, u \rightsquigarrow t[u], \qquad
\pi_1\langle a, b\rangle \rightsquigarrow a, \qquad
\pi_2\langle a, b\rangle \rightsquigarrow b,$$

closed under congruence in every subterm. Write $\twoheadrightarrow$ for its
reflexive-transitive closure.

### 7.2 Confluence

**Definition 7.3.** *Parallel reduction* $\Rightarrow$ contracts any set of
redexes present in a term simultaneously. The *complete development*
$\mathrm{dev}(t)$ contracts all redexes present in $t$ at once.

**Lemma 7.4 (Takahashi's triangle).** If $t \Rightarrow u$ then
$u \Rightarrow \mathrm{dev}(t)$.

**Corollary 7.5 (diamond).** If $t \Rightarrow u$ and $t \Rightarrow w$, there is
$s$ with $u \Rightarrow s$ and $w \Rightarrow s$; take $s = \mathrm{dev}(t)$.

**Theorem 7.6 (Church–Rosser).** If $t \twoheadrightarrow u$ and
$t \twoheadrightarrow w$, there is $s$ with $u \twoheadrightarrow s$ and
$w \twoheadrightarrow s$.

*Proof sketch.* $\Rightarrow$ is sandwiched between $\rightsquigarrow$ and
$\twoheadrightarrow$, so their reflexive-transitive closures coincide. Corollary
7.5 gives the diamond property for $\Rightarrow$, and the diamond property is
preserved under reflexive-transitive closure. $\square$

**Corollary 7.7 (uniqueness of normal forms).** A term has at most one normal
form. If $t \twoheadrightarrow u$ and $t \twoheadrightarrow w$ with $u, w$
normal, then $u = w$. Since the simply-typed calculus is moreover strongly
normalizing, every well-typed term has *exactly* one normal form.

Corollary 7.7 is the fact that §8 and §9 rest on, and it deserves to be isolated
from the technique that proves it. Confluence is what makes "the normal form of
$t$" a definite description. Without it, reduction would compute a set of
irreducible results rather than a value, and no normalization procedure could
serve as a naming scheme. It is the same argument form as Theorem 4.10, applied
to a different rewriting relation: terminating plus confluent yields a unique
irreducible form, and the irreducible form is the name.

### 7.3 The correspondence

**Theorem 7.8 (Curry–Howard).** Reading $\to$ as implication, $\times$ as
conjunction, and the unit type as truth, a closed type is inhabited by a term if
and only if the corresponding proposition is derivable, and the term structure
tracks the derivation: abstraction is implication introduction, application is
modus ponens, pairing is conjunction introduction, and the projections are its
eliminations. Proofs are programs.

The base case of the interpretation is not an arbitrary proposition. It is the
assertion that a valuation charges a *predication cell* positively, in the sense
of Definition 10.1 below; the atomic propositions of the calculus are facts about
the articulation of §3, not free parameters.

**Theorem 7.9 (Lambek).** The types and terms of Definition 7.1, modulo
$\twoheadrightarrow$-equality, form a cartesian closed category: $\times$ is the
categorical product with the projections and pairing as its universal cone, the
unit type is terminal, and $\to$ is right adjoint to $\times$, the exponential
adjunction

$$\mathrm{Hom}(C \times A,\ D) \cong \mathrm{Hom}(C,\ A \to D)$$

being currying. Conversely, every cartesian closed category interprets the
calculus. Programs are morphisms.

Together: **proofs = programs = morphisms**. The correspondence extends upward.
Read at the level of dependent type theory, the quantifier adjoints
$\exists_f \dashv f^* \dashv \forall_f$ of a Lawvere hyperdoctrine are the
$\Sigma$, substitution, and $\Pi$ formers, and the simply-typed statement above
is the propositional projection of that.

### 7.4 Canonical names

**Definition 7.10.** An *address term* is a well-typed term of Definition 7.1
whose intended denotation is a resource. Its *canonical address* is its normal
form.

**Proposition 7.11.** Canonical addresses are well defined, and two address terms
denote the same resource under $\twoheadrightarrow$-equality if and only if they
have the same canonical address.

*Proof.* Immediate from Corollary 7.7, given that $\twoheadrightarrow$-equality
is generated by reduction. $\square$

Proposition 7.11 is the sense in which a naming scheme can be *derived* rather
than stipulated. A registry assigns names by fiat and must be consulted; a
confluent calculus assigns names by computation and need not be. The difference
matters for the composition results of §9: a name obtained by normalization
carries its derivation with it, whereas a name obtained by lookup does not.

Theorem 4.10 and Proposition 7.11 are the two halves of one naming principle.
The first normalizes a token downward, through its claims, until it reaches
marks; the second normalizes a term inward, through reduction, until it reaches
an irreducible form. Both produce definite descriptions, and both do so because
the underlying relation terminates and is confluent. No theorem here identifies
the two relations.

## 8. Cones of readings and their legs

The word *cone* has now been used in two senses — the Lorentzian cone of §6 and,
in Theorem 7.9, the universal cone of a product. This section develops the second
and states the relation between an apex and its several realizations. No
identification of the two senses is assumed below.

### 8.1 Cones and cocones

**Definition 8.1.** Let $D : J \to \mathcal{L}$ be a diagram in a category
$\mathcal{L}$ of languages. A *cone* with apex $A \in \mathcal{L}$ is a family
$\lambda = \{\lambda_j : A \to D(j)\}_{j \in J}$ natural in $j$; a *cocone* with
apex $A$ is a family $\iota = \{\iota_j : D(j) \to A\}$ natural in $j$. The
individual $\lambda_j$ are the *legs* of the cone.

**Definition 8.2.** A *language cone* is a cone whose apex is an address term in
the sense of Definition 7.10 and whose diagram sends each surface — a path
grammar, a protocol identifier, a schema node, a natural-language label — to the
language object it inhabits. A *leg* is thus a structure-preserving realization
of the apex term in one surface language.

The classical three-column Curry–Howard–Lambek pattern of §7.3 is one such cone,
with legs into type theory, proof theory, and category theory. Nothing in
Definition 8.1 privileges three; a cone over a larger diagram may add legs into
domain theory, into a path theory over a hierarchical name space, or into any
further surface admitting structure-preserving realization. The three-column
pattern is a specialization, not the general object.

### 8.2 The leg-agreement condition

Legs are realizations, so a natural question is whether they are *jointly
faithful*: whether the observations made through the several legs determine the
apex.

**Definition 8.3.** A cone $\lambda$ over $D$ satisfies *leg agreement* if the
induced map

$$\langle \lambda_j \rangle : A \longrightarrow \prod_{j \in J} D(j)$$

is monic; equivalently, if whenever two apexes admit cones over $D$ agreeing leg
by leg, they are isomorphic.

Leg agreement is a condition on a family, not a property of any single leg. It
says that the surfaces jointly separate apexes: two address terms whose readings
coincide in every language are the same term. Its failure is the situation in
which two distinct resources present identically through every available
surface.

The condition can be sharpened using the Yoneda machinery.

**Theorem 8.4 (Yoneda).** For a locally small category $\mathcal{C}$, the
embedding
$\mathcal{Y} : \mathcal{C} \to [\mathcal{C}^{\mathrm{op}}, \mathbf{Set}]$,
$\mathcal{Y}(A) = \mathrm{Hom}_{\mathcal{C}}(-, A)$, satisfies
$\mathrm{Nat}(\mathcal{Y}(A), P) \cong P(A)$ naturally, and is fully faithful.
Consequently an object is determined up to isomorphism by its bundle of incoming
arrows.

**Proposition 8.5.** Let $J \subseteq \mathcal{C}$ be a small full subcategory
and let $\mathcal{Y}_J : \mathcal{C} \to [J^{\mathrm{op}}, \mathbf{Set}]$ be the
restricted Yoneda embedding. Then $\mathcal{Y}_J$ is fully faithful if and only
if $J$ is dense in $\mathcal{C}$.

Proposition 8.5 makes leg agreement a *density* condition. The legs of a language
cone recover the apex exactly when the surfaces they land in form a dense family
— when every object is canonically a colimit of the surfaces mapping into it.
Theorem 8.4 supplies the ingredients; it does not by itself supply density for
any particular family of surfaces, since a family of legs may simply fail to
generate. Whether a given collection of protocol, path, and label surfaces is
dense in the category of address terms is a substantive question about that
collection, and it is the mathematically precise form of the informal demand that
every language spoken at an address show the same thing.

A cone that fails leg agreement is not thereby useless. It still organizes the
realizations, and a distinguished leg may be singled out as the one through which
composition and discovery are performed, with the remaining legs required to
preserve it. That weaker requirement — preservation of a distinguished leg —
should not be confused with leg agreement, which is a joint condition on the
whole family.

### 8.3 Write cocones and extrema

Dually, a family of local moves $\{m_j\}$ injecting into a common successor apex
forms a cocone $\{\iota_j : \mathrm{Move}_j \to A'\}$. The read cone answers
"what does this apex look like in each surface?"; the write cocone answers "what
single apex do these local changes jointly determine?" The second question is
the one §10 answers quantitatively.

**Definition 8.6.** The *extrema* of a cone are the boundary objects at which it
is tested: domains and codomains of schema arrows, unresolved references,
verification goals, and planned targets.

A cone is verified at its extrema, not in its interior. This is the categorical
form of a familiar methodological point: the informative tests of a family of
realizations are the places where the family is under tension, not the places
where it is manifestly consistent.

## 9. Proof paths and forests

### 9.0 The four-stage placement test

The two June 19 proof-path essays are an earlier formulation of the placement
rule developed here. Their useful invariant is the four-stage test:

1. **Articulate** asks whether the material is a relation as such, before a
   claim is made of it.
2. **Predicate** asks whether it is a typed claim, composing arrow, category,
   or other structure of what is said of the related.
3. **Posit** asks whether evidence, standing, value, or degree is essential;
   this is where bilattice-valued and other non-classical logics enter.
4. **Settle** asks whether the object is fundamentally about closure, limits,
   convergence, gluing, or a fixed point; order, topology, analysis, sheaves,
   and cohomology are generated at this stage.

This is an essence test, not a topical tag: a concept is placed at the deepest
stage that generates it, not at a shallower stage it happens to use. The older
roadmap also records the two open application bases: language repeats the chain
over linguistic marks (with grammar at predication and illocutionary force at
positing), while agency repeats it over action (with becoming, work, and
governance at settling). Knowledge encoding is a sibling representation base,
not a justification for flattening these derivations into topical shelves.

The present note supplies the formal path, factorization, and merge criteria;
this subsection retains the earlier operational placement test without
maintaining a second proof-path document.

### 9.1 Paths as composites

Let $\mathcal{C}$ be a category whose objects are types and whose arrows are
*generating* and *restricting* morphisms. Consider a hierarchical name space in
which each admissible segment is labelled by an arrow of $\mathcal{C}$.

**Definition 9.1.** A *proof path* is a composable sequence of segments
$s_1, \dots, s_n$, labelled by arrows
$f_1 : X_0 \to X_1, \dots, f_n : X_{n-1} \to X_n$. Its *type* is $X_n$ and its
*derivation* is the composite $f_n \circ \cdots \circ f_1$.

**Definition 9.2.** A path is *earned* if every segment's label is an arrow that
some generator supplies. A path with an unearned segment asserts a derivation
that does not exist.

Under Definitions 9.1 and 9.2, a name space is a functor from the free category
on the segment graph to $\mathcal{C}$, root-to-leaf descent is composition, and
the resource reached inhabits the codomain of the composite. Read this way, the
statement that a path *is* a proof term is not a metaphor: it is the observation
that a composable sequence of arrows in a category of types and entailments is
precisely a derivation, and that under Theorems 7.8 and 7.9 a derivation is a
term. Combined with Proposition 7.11, a normalized earned path is a canonical
name whose spelling exhibits its own justification, and which therefore requires
no external index to interpret.

### 9.2 Factorization carries information

**Proposition 9.3.** Let $f = f_n \circ \cdots \circ f_1$. The composite $f$
determines its domain and codomain but not, in general, its factorization: there
may be many distinct sequences with the same composite.

Proposition 9.3 is trivial and is the reason the rest of this subsection is not.
The map from factorizations to composites is generally non-injective, so
recording only the composite is a lossy projection. Whether the loss matters
depends on what is asked of the record.

**Definition 9.4.** Let $T$ be a task, understood as a family of tests, queries,
or decisions that a representation must support. A map $\Phi : R \to R'$ between
representations is *admissible for $T$* if every relation and witness that $T$
tests is transported by $\Phi$.

**Proposition 9.5.** A non-injective $\Phi$ is admissible for $T$ only if the
distinctions it collapses are not tested by $T$. In particular, replacing an
earned path by its endpoint is admissible only for tasks that never ask by which
derivation the endpoint was reached.

The interest of Proposition 9.5 lies in what it forbids. Discovery, composition,
and reuse are precisely tasks that ask how a result was reached: a consumer that
wishes to extend a derivation must know its factorization, and one that wishes to
check it must know the arrows. For such tasks, flattening is inadmissible, and
the loss is not recoverable by adding annotations after the fact, since the
discarded factorization is not a function of what remains.

The same criterion applies to charts more generally. If a region is described by
several coordinate systems $\kappa_i : U_i \to A_i$ with transitions
$g_{ij} = \kappa_j \circ \kappa_i^{-1}$, then a change of chart is admissible for
$T$ only when it transports the relations $T$ tests. Two independently adequate
charts need not be related by any admissible map, and coincidence of a derived
quantity — a timestamp, a count, a label — is not evidence that one exists.

### 9.3 Three senses of forest

The word *forest* is used below in three senses, and it is worth separating them
at the outset, since only one carries a theorem.

1. *Witness forest*: a structure retaining, for each derived result, the
   witnessed path from its prerequisites, so that a consumer may check or extend
   the derivation instead of re-deriving it. This is made precise in Definition
   10.4. A witness structure is a forest only if no two distinct derivations
   converge on a shared node; in general it is a directed acyclic graph, and the
   forest property must be imposed and verified rather than read off the name.
2. *Spanning forest of a nerve*: the combinatorial invariant treated in §9.4.
3. *Proof tree of a path*: the composite of §9.1. A single path is a chain; a
   collection of paths is a forest only under the same non-convergence
   hypothesis as in sense (1).

No theorem here relates the three in general. What they share is structural: each
is an acyclic incidence structure whose *edges*, and not whose vertex count,
carry the content. Section 10.5 does relate (1) and (2) under an explicit
hypothesis.

### 9.4 Čech rank and the forest condition

Sense (2) is the one with content, and it is what settles the obstruction
question of §5.6.

**Definition 9.6.** Let $N$ be a finite nerve — for our purposes, the nerve of a
covering — with vertex set of size $|V|$, edge set of size $|E|$, and $|C|$
connected components. Define the *forest threshold* $\tau(N) = |V| - |C|$, the
number of edges in a spanning forest, and the *cycle rank*
$b_1(N) = |E| - \tau(N)$.

**Proposition 9.7.** $b_1(N) = |E| - |V| + |C|$ is the rank of
$\check{H}^1(N)$ with constant coefficients, and:

1. $b_1(N) = 0$ if and only if $|E| = \tau(N)$, if and only if $N$ is a forest,
   if and only if the Euler characteristic $|V| - |E|$ equals $|C|$.
2. $N$ contains a cycle if and only if $|E| \ge \tau(N) + 1$. The transition is
   sharp and occurs at a definite edge count.
3. $b_1$ is monotone in $|E|$ for fixed $|V|, |C|$: adding edges never decreases
   the cycle rank.
4. *(Onset.)* If $|E| = \tau(N)$ and one edge is added without changing $|V|$ or
   $|C|$, then $b_1 = 1$: the first surplus edge opens exactly one cycle.

**Theorem 9.8 (edge count does not determine cycle rank).** For every $d \ge 1$
there exist finite nerves $N, N'$ with $|E(N)| = |E(N')| = d$, $b_1(N) = 0$ and
$b_1(N') \ge 1$.

*Proof.* Let $N$ be a tree on $d+1$ vertices, so $|V| = d+1$, $|C| = 1$,
$\tau = d$, $b_1 = 0$. Let $N'$ be a $d$-cycle, so $|V| = d$, $|C| = 1$,
$\tau = d - 1$, $b_1 = 1$. Both have exactly $d$ edges. $\square$

Theorem 9.8 is the cleanest available statement of the paper's thesis. Two
configurations agreeing exactly in the number of cells differ in whether they
carry a cycle. No count distinguishes them; only the incidence does — that is,
only where the cells sit.

Its consequence for §5.6 requires care about coefficients.

**Proposition 9.9.** Let $\{U_i\}$ be a covering whose nerve $N$ is a forest.
Then $N$ has no $2$-simplices, so every Čech $1$-cochain is a cocycle and

$$\check H^1(\{U_i\};\mathcal A) \;=\; \operatorname{coker}\Big(\textstyle\prod_i \mathcal A(U_i) \xrightarrow{\ \delta^0\ } \prod_{ij \in E(N)} \mathcal A(U_{ij})\Big).$$

Consequently:

1. For constant coefficients $\underline{A}$ the group vanishes, since a forest
   is homotopy equivalent to a discrete set;
2. for a general coefficient sheaf $\mathcal A$ the group vanishes provided the
   restriction maps $\mathcal A(U_j) \to \mathcal A(U_{ij})$ along the nerve's
   edges are surjective, since one may then propagate a solution outward from a
   root of each tree component;
3. without that surjectivity, a forest nerve kills the *combinatorial*
   obstruction — there are no cocycle conditions to satisfy — but not
   necessarily the *coefficient* obstruction, which persists as the cokernel
   above.

**Corollary 9.10.** If the nerve of $\{U_i\}$ is a forest and the re-reading
sheaf $\mathcal A$ has surjective restrictions along its edges, then no term is
polysemous over that covering in the sense of Definition 5.22: every
pairwise-compatible family of local readings glues. If the nerve carries a cycle,
$\check H^1$ may be nonvanishing and polysemy becomes possible.

Two consequences deserve statement. First, polysemy is not a property of a term
in isolation; it is a property of a term relative to a covering, and refining the
covering to kill the cycles removes the combinatorial half of the obstruction.
Second, the failure is *witnessed by a cycle or by a non-surjective restriction*,
so the diagnosis is local and finite: to find where a name must split, find the
cycle in the nerve on which its readings disagree, or the overlap onto which no
local reading surjects.

### 9.5 Disagreement energy and degeneracy

The cohomological statement has a spectral counterpart, which supplies the
quantitative criterion used in §10.

**Definition 9.11.** Let $\mathcal{F}$ be a cellular sheaf on a graph, with local
sections $s = (s_i)$ and coboundary $\delta$. The *disagreement energy* is

$$E(s) = \lVert \delta s \rVert^2 = s^{\mathsf T} L_{\mathcal{F}}\, s,
\qquad L_{\mathcal{F}} = \delta^{\mathsf T}\delta,$$

with $L_{\mathcal{F}}$ the *sheaf Laplacian*.

**Proposition 9.12.** $L_{\mathcal F}$ is symmetric positive semidefinite;
$E(s) = 0$ if and only if $s \in \ker L_{\mathcal{F}}$, if and only if $s$ is a
global section. For the constant sheaf on a graph, $\dim \ker L$ equals the
number of connected components.

**Corollary 9.13.** Local sections supported on distinct components each attain
zero disagreement energy, whatever their mutual relation, because no edge
compares them. The ground state of a disconnected system is degenerate, with
degeneracy equal to the component count.

Corollary 9.13 is the precise sense in which local consistency is not global
coherence. A family of independently consistent descriptions with no restriction
maps between them minimizes disagreement energy trivially. Adding edges — that
is, adding comparisons — is what raises the energy of an incoherent family and
thereby makes its incoherence detectable; it is also, by Proposition 9.7(3),
what raises $b_1$ and thereby creates the possibility of obstruction. The two
effects are the same phenomenon seen from the spectral and the cohomological
side: comparison is what makes disagreement visible, and what makes gluing a
nontrivial demand.

### 9.6 Holonomy of chart transitions

A last measurement, which distinguishes two kinds of discrepancy that a naive
comparison conflates.

**Definition 9.14.** With charts and transitions as in §9.2, suppose the
transitions take values in the affine group, so that transport around a closed
route $\gamma$ has holonomy $H_\gamma = (R_\gamma, b_\gamma)$ with $R_\gamma$
linear and $b_\gamma$ a translation, composing and inverting by

$$(R_2, b_2)\circ(R_1, b_1) = (R_2R_1,\ R_2b_1 + b_2), \qquad
(R, b)^{-1} = (R^{-1},\ -R^{-1}b).$$

**Proposition 9.15.** Exactly one of four cases obtains for each closed route:

1. $R_\gamma = I$, $b_\gamma = 0$: the loop closes.
2. $R_\gamma = I$, $b_\gamma \ne 0$: a translational dislocation with Burgers
   vector $b_\gamma$.
3. $R_\gamma \ne I$, $b_\gamma = 0$: rotational residue, which may be a conserved
   charge of the structure rather than a defect.
4. $R_\gamma \ne I$, $b_\gamma \ne 0$: a mixed defect, whose two components must
   be treated separately.

The methodological consequence is a pair of complementary failures. A procedure
that measures only the rotational part cannot see a translational dislocation; a
procedure that drives all holonomy to zero destroys whatever protected rotational
charge the structure carried. Both components must be carried explicitly —
ordered route, orientation, frame identity, signed translation — and neither may
be inferred from a proxy such as separation or depth.

## 10. Predication, measured disagreement, and deterministic merge

This section is the payoff of the arc begun in §3. It defines predication over
the articulation bundle, defines the witness forest of a claim, and then gives
the merge theorem: when the obstruction vanishes the witness forests of two
claims amalgamate into one, canonically and without choice; when it does not,
the failure is a number.

### 10.1 Predication over the bundle

**Definition 10.1.** A *predication cell* is an ordered triple
$\varphi = (s, P, o)$ of tokens, the *subject*, *predicate*, and *object*. Write
$\Phi \subseteq T^3$ for the set of cells. A *valuation* is a map
$v : \Phi \to \mathbf{4}$ into the bilattice of Definition 3.9. A cell is
*truth-firing* under $v$ when $\mathrm{pos}(v(\varphi)) = 1$.

As with utterances, the order of the triple is load-bearing: $(s,P,o)$ and
$(o,P,s)$ are distinct cells and may receive unrelated values.

**Definition 10.2.** The *predication graph* of a valuation $v$ is the directed
labelled graph on $T$ with an edge $s \xrightarrow{P} o$ for each truth-firing
cell $(s,P,o)$.

**Proposition 10.3.** A valuation determines two formal contexts in the sense of
Definition 2.1: the *subject context* $(\Phi, T, \in_1)$ with $\varphi \in_1 t$
iff $t$ is the subject of $\varphi$ and $\varphi$ is truth-firing, and the
*predicate context* $(T, T \times T, R)$ with $s\, R\, (P,o)$ iff $(s,P,o)$ is
truth-firing. Each generates a concept lattice by Theorem 2.9.

Proposition 10.3 closes the loop begun in §2. Articulation supplies an incidence
of claims on tokens (Proposition 3.19); predication supplies an incidence of
cells on tokens; both are formal contexts; both therefore have Galois closures,
concept lattices, and implication bases, and the same machinery reads them. The
arc from token and claim to concept lattice passes through no additional
apparatus.

Predication is also where the Curry–Howard interpretation of §7.3 is anchored: the
base proposition of the type interpretation is that a valuation charges a cell
positively. Types over that base are built by $\to$, $\times$, and the unit, and
by Theorem 7.8 their inhabitants are derivations from predication facts.

### 10.2 Witness forests

**Definition 10.4.** Let $q$ be a claim of a grounded articulation and let
$D$ be a derivation of $q$ — a finite sequence of steps each licensed by a
truth-firing predication cell, descending along $\rhd$. The *witness structure*
$W(q, D)$ is the directed graph whose vertices are the tokens occurring in $D$,
with an edge $t \to t'$ labelled by the cell that licensed the step, for each
step of $D$ that descends from $t$ to $t'$.

**Proposition 10.5.** In a grounded articulation with $\rhd$ finitely branching,
$W(q,D)$ is a finite directed acyclic graph, its sinks are marks, and its
vertex set is contained in $\mathrm{gr}(t)$ for the token $t$ of $q$. It is a
*forest* precisely when no vertex has in-degree greater than one — that is, when
no token is reached by two distinct derivation steps.

*Proof.* Finiteness and acyclicity follow from Theorem 4.5(3) and Theorem
4.7(2); sinks are $\rhd$-minimal, hence marks by Proposition 4.4; the inclusion
is Theorem 4.7(3). The forest characterization is the standard one for directed
acyclic graphs. $\square$

The condition in Proposition 10.5 is a genuine hypothesis and not a convention.
A derivation that reaches the same token by two routes has *reused* a
sub-derivation, which is the desirable case computationally and the inconvenient
case combinatorially; the merge theorem below is stated for forests.

**Definition 10.6.** The *support* of a witness structure is the union of the
supports, in the claim site, of the cells labelling its edges.

### 10.3 The union cover

**Definition 10.7.** Let $W_1, \dots, W_n$ be witness structures with supports
$U_1, \dots, U_n$ and let $U = \bigvee_i U_i$. The *union cover* is the family
$\{U_i \to U\}$, and its *nerve* $N$ has a vertex for each $i$ and a $k$-simplex
for each $(k{+}1)$-subset with nonempty intersection.

**Proposition 10.8.** For $n = 2$ the nerve is a single edge, hence a tree, and
by Proposition 9.9

$$\check H^1(\{U_1,U_2\};\mathcal A) = \operatorname{coker}\Big(\mathcal A(U_1)\oplus\mathcal A(U_2) \xrightarrow{\ \delta^0\ } \mathcal A(U_{12})\Big),$$

where $\delta^0(a_1,a_2) = a_2|_{U_{12}} - a_1|_{U_{12}}$. This is the
Mayer–Vietoris obstruction, and it vanishes exactly when every section over the
overlap is a difference of sections over the two pieces.

Proposition 10.8 is worth pausing on, because it makes the two-claim case
completely explicit. The obstruction to merging two witness structures is a
cokernel of one linear map between three groups of sections. It is computable
whenever the sections are, and it is zero or nonzero — no judgement enters.

### 10.4 The merge theorem

**Theorem 10.9 (deterministic merge).** Let $\mathcal R$ be the presheaf of
readings, an $\mathcal A$-torsor as in Definition 5.20, and let $\{U_i\}$ be the
union cover of witness structures $W_1,\dots,W_n$ carrying local readings
$r_i \in \mathcal R(U_i)$ that agree on all pairwise overlaps. Then:

1. *(Separation.)* There is at most one reading $r \in \mathcal R(U)$ with
   $r|_{U_i} = r_i$ for all $i$. The merge, if it exists, involves no choice.
2. *(Gluing.)* Such an $r$ exists if and only if the class of the family in
   $\check H^1(\{U_i\};\mathcal A)$ vanishes.
3. *(Sufficient condition.)* The class vanishes whenever the nerve of the union
   cover is a forest and $\mathcal A$ has surjective restrictions along its
   edges; in particular it vanishes for $n = 2$ whenever the map $\delta^0$ of
   Proposition 10.8 is surjective.

*Proof.* (1) is the separation half of the sheaf axiom for the sheafification of
$\mathcal R$, transported through the torsor structure: two readings restricting
to the same family differ by a section of $\mathcal A$ over $U$ restricting to
$0$ on each $U_i$, hence by $0$. (2) is Proposition 5.21. (3) is Proposition
9.9. $\square$

Clause (1) is the clause the word *deterministic* refers to, and it should not be
passed over. Merging is not the selection of one amalgamation from several
candidates by a tie-breaking rule; when the obstruction vanishes there is exactly
one amalgamation, and any procedure that finds an amalgamation has found *the*
amalgamation. Determinism here is a theorem about the structure, not a property
of an algorithm.

It remains to see that the merged object is again a forest. This is not automatic
and requires the overlap to be connected.

**Proposition 10.10 (Mayer–Vietoris for graphs).** Let $G = G_1 \cup G_2$ be
finite graphs with $G_{12} = G_1 \cap G_2$. Then

$$b_1(G) = b_1(G_1) + b_1(G_2) - b_1(G_{12}) + c(G) - c(G_1) - c(G_2) + c(G_{12}),$$

where $c$ denotes the number of connected components.

*Proof.* Apply the Mayer–Vietoris sequence of the $1$-complexes,

$$0 \to H^0(G) \to H^0(G_1)\oplus H^0(G_2) \to H^0(G_{12}) \to H^1(G) \to H^1(G_1)\oplus H^1(G_2) \to H^1(G_{12}) \to 0,$$

exact because graphs have no cohomology above degree one, and take alternating
sums of dimensions, using $h^0 = c$ and $h^1 = b_1$. $\square$

**Theorem 10.11 (forest amalgamation).** Let $W_1, W_2$ be witness forests with
$W_{12} = W_1 \cap W_2$. Then $W_{12}$ is a forest, and

$$b_1(W_1 \cup W_2) = c(W_1\cup W_2) - c(W_1) - c(W_2) + c(W_{12}).$$

In particular:

1. If $W_1, W_2$ are trees and $W_{12}$ is nonempty and connected, then
   $W_1 \cup W_2$ is a tree.
2. In general $W_1 \cup W_2$ is a forest if and only if
   $c(W_1 \cup W_2) + c(W_{12}) = c(W_1) + c(W_2)$.

*Proof.* A subgraph of a forest is a forest, so $b_1(W_1) = b_1(W_2) =
b_1(W_{12}) = 0$, and Proposition 10.10 reduces to the displayed identity. For
(1), all four component counts equal $1$, giving $b_1 = 1-1-1+1 = 0$. (2) is the
identity together with $b_1 \ge 0$. $\square$

Theorem 10.11 gives the exact hypothesis under which "two forests glue into one
forest" is true, and it is not the hypothesis one might guess. Connectivity of
the *overlap* is what matters. Two trees meeting in two disconnected pieces
create a cycle — the union has $b_1 = 1 - 1 - 1 + 2 = 1$ — and the amalgamated
witness structure is then a genuine directed acyclic graph with a shared
sub-derivation reached two ways, not a forest. This is not a pathology to be
avoided; by Proposition 9.7 it is exactly the situation in which the nerve
acquires a cycle and, by Corollary 9.10, in which polysemy becomes possible.

### 10.5 The measured criterion

Theorem 10.9 is a dichotomy. The sheaf Laplacian converts it into a measurement.

**Definition 10.12.** Given local readings $r = (r_i)$ over a union cover, form
the cellular sheaf $\mathcal F$ on the nerve whose vertex stalks are the section
spaces $\mathcal R(U_i)$, whose edge stalks are the $\mathcal R(U_{ij})$, and
whose restriction maps are those of $\mathcal R$. The *disagreement* of the
family is $E(r) = r^{\mathsf T} L_{\mathcal F} r$ as in Definition 9.11.

**Proposition 10.13.** $E(r) \ge 0$, with $E(r) = 0$ if and only if $r_i$ and
$r_j$ agree on $U_{ij}$ for every edge $ij$ of the nerve — that is, if and only
if the compatibility hypothesis of Theorem 10.9 holds.

So the hypothesis of the merge theorem is not a qualitative judgement but the
vanishing of a nonnegative quadratic form. The question "do these two claims
agree enough to share structure?" has a numerical answer, and the answer is
exactly zero in the affirmative case.

For the negative case the spectrum supplies a bound.

**Theorem 10.14 (approximate merge).** Let $\lambda_1 > 0$ be the smallest
nonzero eigenvalue of $L_{\mathcal F}$ — the *spectral gap* — and let $\Pi$ be
orthogonal projection onto $\ker L_{\mathcal F}$, the space of global sections.
Then for every family $r$,

$$\lVert r - \Pi r\rVert^2 \;\le\; \frac{E(r)}{\lambda_1}.$$

*Proof.* Write $r = \Pi r + r^{\perp}$ with $r^\perp \perp \ker L_{\mathcal F}$.
Then $L_{\mathcal F} r = L_{\mathcal F} r^\perp$ and
$E(r) = (r^\perp)^{\mathsf T} L_{\mathcal F} r^\perp \ge \lambda_1
\lVert r^\perp\rVert^2$, since $L_{\mathcal F}$ restricted to the orthogonal
complement of its kernel has least eigenvalue $\lambda_1$. $\square$

Theorem 10.14 is the constructive content of a refused merge. A family whose
disagreement energy is small relative to the spectral gap lies close to a unique
coherent family, and the distance is bounded by an explicit quotient of two
measured quantities. A family whose energy is large does not; and the number
$\sqrt{E(r)/\lambda_1}$ says how far the local readings would have to move before
they could be glued.

### 10.6 The merge principle

Collecting the results of this section gives a decision procedure whose every
step is a computation rather than a judgement. Given witness forests
$W_1, \dots, W_n$ with local readings over a union cover:

1. Compute $E(r)$. By Proposition 10.13, $E(r) = 0$ exactly when the readings
   agree on all overlaps.
2. If $E(r) = 0$, compute the class in $\check H^1$ of the union cover. By
   Theorem 10.9 the readings glue if and only if the class vanishes, and by
   Proposition 9.9 the class vanishes when the nerve is a forest with surjective
   edge restrictions; for two claims this is the single cokernel of Proposition
   10.8.
3. When the class vanishes, the amalgamation exists and by Theorem 10.9(1) it is
   unique. By Theorem 10.11 the amalgamated witness structure is again a forest
   exactly when the component identity holds — in particular whenever the
   overlap is nonempty and connected and each $W_i$ is a tree.
4. When $E(r) > 0$, no amalgamation exists. The merge is refused, and by Theorem
   10.14 the quantity $\sqrt{E(r)/\lambda_1}$ bounds the distance from the given
   family to the nearest coherent one. The refusal carries a number.

**Corollary 10.15 (converse of Definition 5.22).** A term is polysemous over a
covering exactly when its local readings fail to merge in the sense of step (2).
The merge principle is therefore the constructive converse of the polysemy
result: where §5.6 showed that a nonvanishing obstruction forbids a single
reading, this section shows that a vanishing obstruction *produces* one, and
produces exactly one.

The two halves together are the answer this paper offers to the question with
which a reader may reasonably begin. Given a token and its claims, one descends
by §4 to the marks that ground them, assembles by §10.2 the witness forest of
each derivation, forms by §10.3 the union cover of their supports, measures by
§10.5 their disagreement, and either merges them canonically into one forest or
refuses with a quantity that says by how much they failed. Nothing in that
sequence requires a choice, and every step is a computation on incidence data.

## 11. Rigidity, matroids, and pebble games

Section 9.4 measured cycles in a graphic matroid. This section shows that the
same edge set supports a second matroid with a different rank function, and that
the distinction is decided by a game.

### 11.1 Two matroids on one edge set

**Definition 11.1.** The *graphic matroid* $M_{\mathrm{gr}}(G)$ of a graph
$G = (V,E)$ has ground set $E$, independent sets the acyclic edge subsets, rank
function $r_{\mathrm{gr}}(F) = |V(F)| - c(F)$, and bases the spanning forests.

**Definition 11.2.** Fix $d \ge 1$ and a generic embedding of $V$ in
$\mathbb{R}^d$. The *generic rigidity matroid* $M_{\mathrm{rig}}^d(G)$ has ground
set $E$ and independence given by linear independence of the rows of the rigidity
matrix at that embedding; genericity makes the matroid independent of the chosen
configuration. In the plane, the rank of a rigid graph is $2|V| - 3$.

The two matroids differ on the same ground set: $|V| - c$ against $2|V| - 3$.
Consequently a set of edges may be independent for one and dependent for the
other, and an algorithm computing connectivity computes the wrong rank function
for rigidity.

### 11.2 Laman's theorem

**Theorem 11.3 (Laman).** A graph $G = (V,E)$ is generically rigid in the plane
if and only if it contains a subset $F \subseteq E$ with $|F| = 2|V| - 3$ such
that for every subset $F' \subseteq F$ spanning $V'$ vertices,
$|F'| \le 2|V'| - 3$.

The condition is *hereditary*: it quantifies over every subgraph. This has a
consequence worth isolating, since it is the structural reason a local test
cannot suffice.

**Corollary 11.4.** Redundancy in $M_{\mathrm{rig}}^2$ is nonlocal. No per-vertex
or per-edge count decides it, and a locally sparse region may be globally
over-constrained.

### 11.3 The pebble game

**Definition 11.5.** The $(k,\ell)$-*pebble game* on $G$ assigns $k$ pebbles to
each vertex and processes edges one at a time. An edge is accepted as independent
if $\ell + 1$ free pebbles can be collected at its endpoints by a sequence of
pebble moves along already-accepted edges; otherwise it is rejected as redundant.
The accepted edges are exactly the independent sets of the $(k,\ell)$-sparsity
matroid.

**Theorem 11.6 (Jacobs–Hendrickson).** The $(2,3)$-pebble game decides
independence in $M_{\mathrm{rig}}^2$, in time polynomial in $|V|$ and $|E|$. The
two pebbles per vertex represent the two coordinate degrees of freedom in the
plane, and the free pebbles remaining at termination count the degrees of freedom
of the framework.

Contrast with the graphic case, which is the point of the construction.
Union-find decides independence in $M_{\mathrm{gr}}$ by detecting whether an edge
joins two already-connected components — a test on connectivity. That test is
blind to rigidity, because $M_{\mathrm{rig}}$ has a different rank function: an
edge joining two vertices already in one component may nonetheless be an
independent constraint, and an edge joining distinct components may fail to be
one. A procedure using connectivity where rigidity is meant will report a
flexible structure as load-bearing.

The parallel with §10 is exact in form. There, whether two witness structures may
be merged was decided by an obstruction that a count of their vertices cannot
see; here, whether an edge adds a constraint is decided by a rank function that a
count of components cannot see. In both cases the naive invariant is a
projection of the informative one, and in both cases the projection is
non-injective.

### 11.4 The transition, and dimension three

Rigidity percolation on the two-dimensional triangular lattice — the emergence of
a rigid spanning cluster as constraints are added at random — is a continuous,
second-order transition in its own universality class, not a discontinuous one.
The mean-field or Bethe-lattice treatment does yield a first-order transition,
which is why the two must be kept apart: a continuous rise in the rigid fraction
is the expected generic two-dimensional behaviour and is not evidence against the
model.

The matroid $M_{\mathrm{rig}}^d$ exists for all $d$, but Theorem 11.3 does not
generalize.

**Proposition 11.7.** Laman's condition fails in dimension three. The
double-banana graph satisfies $|F'| \le 3|V'| - 6$ on every subgraph and is
nonetheless flexible.

Hence no analogue of Theorem 11.6 follows from the sparsity count in three
dimensions. A three-dimensional structure may
meanwhile be treated as coupled two-dimensional layers, each exactly decidable,
rather than by a claimed three-dimensional combinatorial test.

## 12. Synthesis

The pieces now compose. Nine statements assemble the thesis, each with its
supporting result.

**(i) Articulation is a bundle, and bundling is the sheaf condition.** By
Definition 3.5 the claims of a token form the fiber of a projection; by
Definition 3.11 each fiber carries a complete bilattice; by Proposition 3.13 the
fiber algebras form a presheaf, and by Proposition 3.15 that presheaf is a
fibered category over the token base. By Proposition 3.18 the comparison map
from global to compatible local sections is injective exactly when the presheaf
is separated and bijective exactly when it is a sheaf. Separation is what makes a
successful merge unique; gluing is what makes it possible; they fail
independently.

**(ii) Descent through claims terminates at marks, and termination is a naming
principle.** By Definition 4.3 the dependency relation is well-founded, so by
Theorem 4.5 recursion and induction along it are legitimate and every descent is
finite. By Theorem 4.7 the grounded closure is a closure operator of the same
extensive-monotone-idempotent shape as concept closure and causal closure. By
Theorem 4.10, if decomposition is locally confluent then Newman's lemma gives
unique normal forms, and the normal form of a token is its mark support.

**(iii) Incidence determines closure, and closure is not a cardinal invariant.**
A formal context determines its concept lattice through the Galois connection of
Proposition 2.3. Permuting which object bears which attribute changes the closure
operator, hence the extents and intents, hence the lattice — while leaving
$|G|$, $|M|$ and $|I|$ fixed. Theorem 9.8 proves the same proposition for a
different closure structure, and Corollary 11.4 for a third: rigidity, like
closure and like cycle rank, is invisible to counting.

**(iv) A term's meaning is a closed profile, relative to a context and a
transport.** By Definition 5.2 and Proposition 5.3 a term has a direct profile —
which by Proposition 3.19 is the fiber over it — and a generated concept. By
Theorem 5.14 the secondary reading is the primary reading of the family its
anchor induces, and the two agree at the anchor. By Proposition 5.7 the
transport that relates readings across indices is the same map that transports
evidence backwards along the bundle. A term therefore has no meaning simpliciter:
it has a profile, which is context-relative, and an anchored transport, which is
what makes profiles at different indices comparable at all.

**(v) A derivation is a composite, and composites carry more than endpoints.** By
Definition 9.1 a path is a composite of generating and restricting morphisms; by
Proposition 9.3 the composite does not determine its factorization; by
Proposition 9.5 discarding the factorization is admissible only for tasks that do
not test it. Discovery, extension, and verification all test it.

**(vi) Confluence makes a normalized path a name.** By Corollary 7.7 a well-typed
term has exactly one normal form, so by Proposition 7.11 the canonical address is
well defined. The name is computed rather than assigned, and — because by (v) it
is a composite of arrows — it exhibits its own justification. Together with (ii)
this is the precise sense in which aligning terms into a path structure
*realizes* proof paths rather than merely recording them: the alignment is the
derivation, and normalizing it is naming it.

**(vii) A cone organizes the several readings of one apex; its faithfulness is a
density condition.** By Definitions 8.1 and 8.2 a language cone has an apex
address term and legs into surface languages. By Definition 8.3 leg agreement is
joint monicity of the legs, and by Proposition 8.5 it is equivalent to density of
the leg family. Theorem 8.4 supplies the general fact that an object is recovered
from its bundle of arrows; what it does not supply, for any particular family of
surfaces, is that the family generates.

**(viii) Order determines topology; incidence determines rank; neither determines
scale.** By Theorem 6.9 causal order recovers the topology and the conformal
class, but not the conformal factor, which requires a volume. By Proposition 9.7
and Theorem 11.6 incidence determines cycle rank and matroid rank, but neither
determines a critical density, since by Theorem 9.8 count is not sufficient. In
both cases the relational data fixes a large but specific invariant, and in both
cases what it omits must be supplied separately or left open.

**(ix) Agreement is measurable, and enough agreement forces a unique merge.** By
Proposition 10.13 the compatibility of a family of local readings is the
vanishing of a nonnegative quadratic form, the disagreement energy of a sheaf
Laplacian. By Theorem 10.9 vanishing compatibility together with a vanishing
Čech class yields an amalgamation that is unique, hence deterministic; by
Proposition 9.9 the Čech class vanishes when the nerve is a forest with
surjective edge restrictions. By Theorem 10.11 the amalgamated witness structure
is again a forest exactly when the overlap is connected enough, and by Theorem
10.14 a failed merge is bounded: the family lies within
$\sqrt{E(r)/\lambda_1}$ of the nearest coherent one. By Corollary 10.15 this is
the constructive converse of polysemy: a vanishing obstruction does not merely
permit a single reading, it produces exactly one.

The pattern common to all nine is that the *relational* data — incidence, order,
composition, restriction — carries the structure, and that quantitative summaries
of it are lossy projections whose losses are sometimes provably irreparable. A
forest of aligned derivations is therefore not a filing convention that happens
to be tidy. By (v) and (vi) the alignment is the proof; by (ix) the forest
condition is exactly what makes local agreement suffice for global meaning, and
what makes the merge of two proofs a computation rather than a negotiation.

## 13. References

Alexandrov, P. S. Diskrete Räume. *Matematicheskii Sbornik* 2 (1937), 501–518.

Armstrong, W. W. Dependency structures of data base relationships. In
*Information Processing 74*, North-Holland, Amsterdam, 1974, 580–583.

Belnap, N. D. A useful four-valued logic. In *Modern Uses of Multiple-Valued
Logic*, J. M. Dunn and G. Epstein, eds., D. Reidel, Dordrecht, 1977, 5–37.

Bělohlávek, R. *Fuzzy Relational Systems: Foundations and Principles.* Kluwer
Academic/Plenum, New York, 2002.

Bernal, A. N., and Sánchez, M. Smoothness of time functions and the metric
splitting of globally hyperbolic spacetimes. *Communications in Mathematical
Physics* 257 (2005), 43–50.

Birkhoff, G. *Lattice Theory.* American Mathematical Society, New York, 1940.

Bombelli, L., Lee, J., Meyer, D., and Sorkin, R. D. Space-time as a causal set.
*Physical Review Letters* 59 (1987), 521–524.

Bredon, G. E. *Sheaf Theory*, 2nd ed. Graduate Texts in Mathematics 170,
Springer, New York, 1997.

Chalmers, D. J. The foundations of two-dimensional semantics. In *Two-Dimensional
Semantics*, M. García-Carpintero and J. Macià, eds., Oxford University Press,
Oxford, 2006, 55–140.

Diestel, R. *Graph Theory*, 5th ed. Graduate Texts in Mathematics 173, Springer,
Berlin, 2017.

Ehlers, J., Pirani, F. A. E., and Schild, A. The geometry of free fall and light
propagation. In *General Relativity: Papers in Honour of J. L. Synge*,
L. O'Raifeartaigh, ed., Clarendon Press, Oxford, 1972, 63–84.

Galatos, N., Jipsen, P., Kowalski, T., and Ono, H. *Residuated Lattices: An
Algebraic Glimpse at Substructural Logics.* Studies in Logic and the Foundations
of Mathematics 151, Elsevier, Amsterdam, 2007.

Ganter, B. Two basic algorithms in concept analysis. Preprint 831, Technische
Hochschule Darmstadt, 1984.

Ganter, B., and Kuznetsov, S. O. Pattern structures and their projections. In
*Conceptual Structures: Broadening the Base*, Springer, Berlin, 2001, 129–142.

Ganter, B., and Wille, R. *Formal Concept Analysis: Mathematical Foundations.*
Springer, Berlin, 1999.

Geroch, R. Domain of dependence. *Journal of Mathematical Physics* 11 (1970),
437–449.

Ginsberg, M. L. Multivalued logics: a uniform approach to reasoning in artificial
intelligence. *Computational Intelligence* 4 (1988), 265–316.

Guigues, J.-L., and Duquenne, V. Familles minimales d'implications informatives
résultant d'un tableau de données binaires. *Mathématiques et Sciences humaines*
95 (1986), 5–18.

Hansen, J., and Ghrist, R. Toward a spectral theory of cellular sheaves.
*Journal of Applied and Computational Topology* 3 (2019), 315–358.

Hawking, S. W. The existence of cosmic time functions. *Proceedings of the Royal
Society of London A* 308 (1969), 433–435.

Hawking, S. W., King, A. R., and McCarthy, P. J. A new topology for curved
space-time which incorporates the causal, differential, and conformal structures.
*Journal of Mathematical Physics* 17 (1976), 174–181.

Howard, W. A. The formulae-as-types notion of construction. In *To H. B. Curry:
Essays on Combinatory Logic, Lambda Calculus and Formalism*, J. P. Seldin and
J. R. Hindley, eds., Academic Press, London, 1980, 479–490.

Jacobs, D. J., and Hendrickson, B. An algorithm for two-dimensional rigidity
percolation: the pebble game. *Journal of Computational Physics* 137 (1997),
346–365.

Jacobs, D. J., and Thorpe, M. F. Generic rigidity percolation: the pebble game.
*Physical Review Letters* 75 (1995), 4051–4054.

Jacobs, D. J., and Thorpe, M. F. Generic rigidity percolation in two dimensions.
*Physical Review E* 53 (1996), 3682–3693.

Kaplan, D. Demonstratives. In *Themes from Kaplan*, J. Almog, J. Perry, and
H. Wettstein, eds., Oxford University Press, New York, 1989, 481–563.

Lambek, J. The mathematics of sentence structure. *American Mathematical Monthly*
65 (1958), 154–170.

Laman, G. On graphs and rigidity of plane skeletal structures. *Journal of
Engineering Mathematics* 4 (1970), 331–340.

Lawvere, F. W. Adjointness in foundations. *Dialectica* 23 (1969), 281–296.

Lehmann, F., and Wille, R. A triadic approach to formal concept analysis. In
*Conceptual Structures: Applications, Implementation and Theory*, Springer,
Berlin, 1995, 32–43.

Mac Lane, S. *Categories for the Working Mathematician*, 2nd ed. Graduate Texts
in Mathematics 5, Springer, New York, 1998.

Mac Lane, S., and Moerdijk, I. *Sheaves in Geometry and Logic: A First
Introduction to Topos Theory.* Springer, New York, 1992.

Malament, D. B. The class of continuous timelike curves determines the topology
of spacetime. *Journal of Mathematical Physics* 18 (1977), 1399–1404.

Minguzzi, E. K-causality coincides with stable causality. *Communications in
Mathematical Physics* 290 (2009), 239–248.

Newman, M. H. A. On theories with a combinatorial definition of "equivalence".
*Annals of Mathematics* 43 (1942), 223–243.

Penrose, R. Gravitational collapse and space-time singularities. *Physical Review
Letters* 14 (1965), 57–59.

Pentus, M. Lambek grammars are context free. In *Proceedings of the Eighth Annual
IEEE Symposium on Logic in Computer Science*, IEEE, 1993, 429–433.

Rouane-Hacene, M., Huchard, M., Napoli, A., and Valtchev, P. A proposal for
combining formal concept analysis and description logics for mining relational
data. In *Formal Concept Analysis*, Springer, Berlin, 2007, 51–65.

Takahashi, M. Parallel reductions in $\lambda$-calculus. *Information and
Computation* 118 (1995), 120–127.

Wille, R. Restructuring lattice theory: an approach based on hierarchies of
concepts. In *Ordered Sets*, I. Rival, ed., D. Reidel, Dordrecht, 1982, 445–470.

Wurm, C. Completeness of full Lambek calculus for syntactic concept lattices. In
*Formal Grammar*, Springer, Berlin, 2012, 126–141.
</content>
