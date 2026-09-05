---
title: "Generative Sheaf Universe and Acts of Relationality: Mathematical Specification"
---
Preface {#preface}
This document presents a complete, standalone mathematical specification of the Generative Sheaf Universe. It is intended for a reader fluent in category theory, sheaf theory, modal algebra, and intuitionistic logic.
Notation {#notation}
Throughout, $H_t$ denotes the fiber Heyting algebra at trace $t$; its sheafification is $H \in R$. The fixed subsheaf is $H^\ast \subseteq H$. Modalities are denoted $\sigma$ (saturation nucleus) and $\Delta$ (translation nucleus), with fiber components $\sigma_t, \Delta_t$.
Structural Overview {#structural-overview}
Witness. A minimal construction history showing how a proposition was built from primitive operations. A witness trace is a canonical linearization into a sequence of primitive steps.
Trace. A canonicalized sequence of primitive steps; two traces differ only by reordering of independent steps.
Reindexing. Reindexing expresses how propositions adapt when a witness trace is refined or normalized — the action of $H$ on morphisms of $T$.
Gluing. Propositions consistent on refined traces glue uniquely to a proposition on the coarser trace.
The Generative Sheaf Universe is defined from a minimal collection of primitive data:
a category of finite traces,
fiberwise finite Heyting-modal algebras,
functorial reindexing over the trace category,
a Grothendieck topology regulating locality and gluing,
and a finite distinguished set of structural operations.
Size and finiteness. The ambient generative sheaf universe $R = \mathbf{Sh}(T,J)$ is in general an infinite (indeed, proper‑class–sized) universe: there are infinitely many sheaves and internal morphisms. However, all primitive pieces of data are finitary:
each trace in $T$ is a finite word in the step alphabet;
each fiber $H_t$ and fixed fiber $H_t^\ast$ is a finite Heyting-modal algebra;
every covering family in $J$ is generated from finitely many morphisms;
the structural operations $\mathcal{F}$ are a fixed finite list, applied only finitely many times in the definition of any given object.
Thus the generative sheaf universe is globally infinite but locally finite: every concrete construction (trace, fiber, cover, profile, syntactic term, etc.) is specified by finitely many steps, and the infinite universe is obtained as the closure of these finitely presented pieces under the sheaf and trace‑convolution laws.
From these ingredients one obtains a universe with:
quasicrystalline-style global organization,
an internal modal propositional logic with fixed points,
a coherent trace convolution structure induced by trace geometry,
and a self-contained generative universe closure ensuring that every object and morphism arises from iterated application of its internal laws.
This universe is initial among all structures satisfying the axioms given below, and is self‑generating: its entire content is the least fixed point of an internal closure operator.
The document is organized as follows:
Section 1. Primitive axioms (A0–A6).
Section 2. Construction of the Generative Sheaf Universe.
Section 3. Core structural theorems.
Section 4. Generative universe closure and fixed‑point theorem.
Section 5. Internal geometry and defect‑mode structure.
Section 6. Internal logic and canonical forms.
Section 7. Standalone mathematical examples.
Section 8. Consequences and robustness.
---
Foundations and Size Conventions {#foundations}
We work in Zermelo--Fraenkel set theory with the Axiom of Choice (ZFC). To handle the size of sheaf categories and functor categories without set-theoretic pathology, we fix once and for all a Grothendieck universe $\mathcal{U}$.
What Is a Grothendieck Universe {#grothendieck-universe}
A Grothendieck universe is a set $\mathcal{U}$ satisfying:
$\omega \in \mathcal{U}$ (contains the natural numbers),
if $x \in \mathcal{U}$ and $y \in x$, then $y \in \mathcal{U}$ (transitivity),
if $x \in \mathcal{U}$, then $\mathcal{P}(x) \in \mathcal{U}$ (power sets stay in $\mathcal{U}$),
if $I \in \mathcal{U}$ and $(x_i){i \in I}$ is a family with each $x_i \in \mathcal{U}$, then $\bigcup{i\in I} x_i \in \mathcal{U}$ (unions stay in $\mathcal{U}$).
The existence of a Grothendieck universe containing any given set is equivalent (over ZFC) to the existence of an inaccessible cardinal. We adopt the Grothendieck universe axiom: for every set $x$, there exists a Grothendieck universe $\mathcal{U}$ with $x \in \mathcal{U}$. This is a mild extension of ZFC, standard in modern category theory and algebraic geometry (adopted in SGA4).
Size Conventions {#size-conventions}
Fix a Grothendieck universe $\mathcal{U}$. We call a set $\mathcal{U}$-small if it is an element of $\mathcal{U}$, and a category $\mathcal{U}$-small if its sets of objects and morphisms are both $\mathcal{U}$-small.
Requirement on primitive data. All primitive data of this specification must be $\mathcal{U}$-small:
the step alphabet $\Sigma$ and the independence relation $I \subseteq \Sigma \times \Sigma$,
the trace category $T$ and its hom-sets,
each fiber algebra $H_t$ and its operations,
the covering families of the Grothendieck topology $J$,
the finite family $\mathcal{F}$ of structural operations (Axiom A6).
The Ambient Topos Is a Grothendieck Topos {#ambient-topos}
Given a $\mathcal{U}$-small site $(T, J)$, the category
$$
R ;:=; \mathbf{Sh}(T, J)
$$
of $\mathcal{U}$-small set-valued sheaves on $(T,J)$ is a Grothendieck topos in the sense of SGA4 (Artin--Grothendieck--Verdier) and Johnstone's Sketches of an Elephant. Concretely, $R$ is a Grothendieck topos because:
it is equivalent to the category of sheaves on a small site,
it satisfies Giraud's axioms: it has a small generating set (the representable sheaves $y(t)$), is complete and cocomplete, has effective epimorphic families, and has disjoint coproducts,
its subobject classifier is the sheaf $\Omega$ of sieves on $(T,J)$, giving $R$ the structure of an elementary topos.
Throughout this document, when we say "the universe $R$" we mean this Grothendieck topos. All constructions (limits, colimits, exponentials, subobjects, internal logic) are understood in the standard sense for a Grothendieck topos. The word "large" refers to $\mathcal{U}$-large, and "proper class" refers to a class that is not $\mathcal{U}$-small but is $\mathcal{U}'$-small for a larger universe $\mathcal{U}' \supset \mathcal{U}$.
Why This Matters for the Specification {#why-this-matters}
Fixing $\mathcal{U}$ makes every size question in the specification trivial: the topos $R = \mathbf{Sh}(T,J)$ is a $\mathcal{U}$-small-sheaves category, which is a legitimate mathematical object in ZFC+$\mathcal{U}$. Statements about "all objects of $R$" or "the class $\mathrm{Obj}(R)$" refer to $\mathcal{U}'$-small sets for the next universe, and all intersections and closure operators on such classes are handled cleanly. No further set-theoretic machinery is needed.
---

Primitive Data {#primitive-data}
We now list the primitive mathematical data and axioms A0–A6. Axiom A2b (Relational Faithfulness) is an additional condition on A2; it is listed immediately after A2.
Axiom A0 — The Trace Category {#axiom-a0}
Relationally, a trace is a canonicalized sequence of primitive relational steps describing how a proposition was constructed or evolves; independent steps may commute. We package these traces into a small category
$$
T
$$
called the trace category, whose objects are those finite traces and whose morphisms are the admissible normalizations between them. (Categorically, these are the objects and arrows of the free partially commutative monoid on the step alphabet.)
Objects {#a0-objects}
The objects of $T$ are finite sequences of abstract trace‑steps drawn from a fixed set of step symbols.
No algebraic structure is imposed on step symbols beyond identity and the independence relations described below.
We write $\mathrm{Ob}(T)$ for the set of traces.
Morphisms {#a0-morphisms}
For objects $t,t' \in \mathrm{Ob}(T)$, a morphism
$$
f : t \to t'
$$
exists if and only if $t'$ can be obtained from $t$ by a finite sequence of normalization moves, each move being one of:
Deletion: deletion of a neutral or redundant step.
Commutation: commutation of two adjacent steps that are declared independent.
Reassociation / rebracketing: when permitted by independence.
These moves generate a congruence on the free partially commutative monoid of traces.
Free Partially Commutative Monoid {#a0-pcm}
The collection $\mathrm{Ob}(T)$ of traces forms the free partially commutative monoid on the set of step symbols, subject only to the declared independence relations.
Morphisms of $T$ are the congruence classes of traces generated by the allowed commutations and deletions.
Composition and Identities {#a0-composition}
Composition of morphisms corresponds to concatenation of normalization sequences followed by normalization.
Confluence of the normalization system guarantees that composition is associative.
For each trace $t$, the identity morphism $\mathrm{id}_t : t \to t$ is the empty normalization sequence.
Definition — Trace Normalization {#def-trace-normalization}
There is a canonical normalization map
$$
\mathrm{NF}{\mathrm{trace}} : \mathrm{Ob}(T) \longrightarrow \mathrm{Ob}(T)
$$
such that two traces are equal in $T$ iff they normalize to the same object. Composition in $T$ is concatenation followed by $\mathrm{NF}{\mathrm{trace}}$.
Finiteness of Hom-Sets {#a0-finiteness}
For any pair of traces $t,t'$, the hom‑set
$$
T(t,t')
$$
is finite.
Remark — Interpretation {#remark-interpretation-1}
Axiom A0 provides a purely combinatorial temporal scaffold for the generative sheaf universe. Objects are shapes of execution or evolution (traces), and morphisms identify traces related by elementary normalization moves. No metric or analytic structure is assumed, only the algebra of temporal rearrangements and independence.
---
Axiom A1 — Fiber Algebras {#axiom-a1}
For each trace $t \in \mathrm{Ob}(T)$ there is an associated finite Heyting-modal algebra
$$
H_t
$$
interpreted as the algebra of propositions attached to $t$.
Propositional Structure {#a1-propositional}
Each $H_t$ is a finite Heyting algebra. Concretely:
There is a partial order $\le_t$ on the underlying set $H_t$.
There are binary operations
$$
\wedge_t,\ \vee_t : H_t \times H_t \to H_t
$$
giving all finite meets and joins with respect to $\le_t$.
There are distinguished elements
$$
\bot_t,\ \top_t \in H_t
$$
which are respectively the least and greatest elements.
There is a binary operation
$$
\Rightarrow_t : H_t \times H_t \to H_t
$$
(propositional implication) such that for all $a,b,c \in H_t$,
$$
c \le_t (a \Rightarrow_t b)\quad\text{iff}\quad (c \wedge_t a) \le_t b.
$$
We regard elements of $H_t$ as logical propositions attached to trace $t$.
Modal Endomorphisms {#a1-modal}
Each fiber $H_t$ carries two unary operations:
a saturation nucleus
$$
\sigma_t : H_t \to H_t,
$$
a translation nucleus
$$
\Delta_t : H_t \to H_t,
$$
satisfying the following axioms.
Monotonicity. Both $\sigma_t$ and $\Delta_t$ are order-preserving:
$$
a \le_t b \implies \sigma_t(a) \le_t \sigma_t(b),\quad
a \le_t b \implies \Delta_t(a) \le_t \Delta_t(b).
$$
Saturation nucleus laws. $\sigma_t$ is extensive, idempotent, and preserves finite meets:
$$
a \le_t \sigma_t(a),\qquad
\sigma_t(\sigma_t(a)) = \sigma_t(a),\qquad
\sigma_t(a \wedge_t b) = \sigma_t(a) \wedge_t \sigma_t(b)
\quad \text{for all } a,b \in H_t.
$$
Translation nucleus laws. $\Delta_t$ is extensive, idempotent, and preserves finite meets:
$$
a \le_t \Delta_t(a),\qquad
\Delta_t(\Delta_t(a)) = \Delta_t(a),\qquad
\Delta_t(a \wedge_t b) = \Delta_t(a) \wedge_t \Delta_t(b)
\quad \text{for all } a,b \in H_t.
$$
Commutation. The saturation nucleus and translation nucleus commute:
$$
\sigma_t(\Delta_t(a)) = \Delta_t(\sigma_t(a))
\quad\text{for all } a \in H_t.
$$
> **Terminology note.** An extensive, idempotent, meet-preserving endomorphism of a Heyting algebra is called a **nucleus** in locale theory and Heyting algebra theory (Johnstone, *Stone Spaces*, §II.2; Picado--Pultr, *Frames and Locales*, §III.5). Both $\sigma_t$ and $\Delta_t$ are nuclei on $H_t$ in this standard sense. We distinguish them by role: $\sigma_t$ is the **saturation nucleus** — its application saturates a proposition to its stable fixed form, and its fixed-point set $\mathrm{Fix}(\sigma_t)$ is the saturated layer; $\Delta_t$ is the **translation nucleus** — its application translates a proposition one step in the trace direction, and its fixed-point set $\mathrm{Fix}(\Delta_t)$ is the translation-invariant layer. These names indicate their roles, not additional algebraic constraints beyond the nucleus axioms. The classical generic notation for a nucleus is $j$; we write $\sigma$ and $\Delta$ to keep the two nuclei distinguished throughout.
Fixed Fibers {#a1-fixed}
The fixed fiber at $t$ is the set of elements fixed by both nuclei:
$$
H_t^{\ast} ;:=;
{, a \in H_t \mid \sigma_t(a) = a \text{ and } \Delta_t(a) = a ,}.
$$
By standard nucleus theory (see Johnstone, Stone Spaces §II.2.2), the fixed-point set of any nucleus on a Heyting algebra is itself a Heyting algebra — specifically the quotient $H_t/\sigma_t$, where meets are inherited and the join of $a,b$ is $\sigma_t(a \vee_t b)$. Since $\sigma_t$ and $\Delta_t$ commute, the intersection $H_t^\ast = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ is closed under meets and implication, hence is a sub-Heyting-algebra of $H_t$. In particular $H_t^\ast$ is nonempty (it contains $\top_t$).
Definition — Finite Heyting Algebras and $\mathbf{HA_{nucl}}$ {#def-ha-nucl}
A finite Heyting algebra is a finite poset $(A,\le)$ equipped with all finite meets $\wedge$ and joins $\vee$, an implication $\Rightarrow$ satisfying
$$
c \le (a \Rightarrow b) ;\Longleftrightarrow; (c \wedge a) \le b,
$$
and distinguished elements $\bot$ (least) and $\top$ (greatest). Every finite distributive lattice carrying such an implication is a finite Heyting algebra; finite Boolean algebras are the special case where $a \Rightarrow \bot$ satisfies double negation.
Let $\mathbf{HA_{nucl}}$ denote the category whose:
objects are triples $(A,\sigma,\Delta)$ with $A$ a finite Heyting algebra and $\sigma,\Delta : A \to A$ two commuting nuclei (satisfying axioms 1--4 of A1.2 above),
morphisms are Heyting algebra homomorphisms that additionally preserve $\sigma$ and $\Delta$.
Axiom A1 asserts that each fiber $(H_t, \sigma_t, \Delta_t)$ is an object of $\mathbf{HA_{nucl}}$.
Remark — The Fiber as a Relational Quantale {#remark-fiber-quantale}
A relational quantale is a tuple $(Q, \leq, \otimes, {\to}, {\leftarrow}, \sigma, \Delta)$ where $(Q, \leq)$ is a complete lattice; $\otimes$ is an associative binary operation distributing over all joins from both sides (making $(Q,\leq,\otimes)$ a quantale in the sense of Mulvey 1986); $a \to b := \bigvee{c \mid a \otimes c \leq b}$ and $b \leftarrow a := \bigvee{c \mid c \otimes a \leq b}$ are the two-sided residuals; and $\sigma, \Delta : Q \to Q$ are commuting nuclei satisfying the multiplicativity conditions $\sigma(a \otimes b) = \sigma a \otimes \sigma b$ and $\Delta(a \otimes b) = \Delta a \otimes \Delta b$. The doubly-fixed subquantale $Q^\ast := \mathrm{Fix}(\sigma) \cap \mathrm{Fix}(\Delta)$ is itself a complete lattice inheriting the tensor and residuals.
Each fiber $(H_t, \sigma_t, \Delta_t)$ is a finite relational quantale: the complete lattice is $H_t$, the tensor is the meet $\wedge_t$ (which distributes over joins since $H_t$ is a finite distributive lattice), the two residuals coincide with the Heyting implication $\Rightarrow_t$ (commutativity collapses the asymmetry), and $\sigma_t, \Delta_t$ are the commuting nuclei of Axiom A1. The doubly-fixed subquantale is exactly $H_t^\ast$. The full non-commutative relational quantale structure — with genuinely distinct left and right residuals — appears at the level of the trace category $T$ under concatenation $\star$, and its sheafification is the Day convolution $\circledast$ on $R$.
Remark — Interpretation {#remark-interpretation-2}
Over each trace $t$, the fiber $(H_t, \sigma_t, \Delta_t)$ is a finite intuitionistic propositional logic enriched with two commuting modal closure operators (nuclei):
The Heyting algebra structure captures local combination, implication, and weak negation of propositions.
The saturation nucleus $\sigma_t$ saturates propositions to their stable form. Its fixed-point Heyting algebra $H_t/\sigma_t$ represents the saturated propositions at trace $t$.
The translation nucleus $\Delta_t$ translates propositions one step in the trace direction; its fixed points are the translation-invariant propositions.
The joint fixed fiber $H_t^\ast$ consists of propositions stable under both nuclei.
Later, the family $(H_t^\ast)$ assembles into an internal locale (the stability locale) in the Grothendieck topos $R$.
---
Axiom A2 — Reindexing Functor {#axiom-a2}
Reindexing expresses how propositions adapt when a witness trace is refined or normalized. The family of fibers $(H_t)_{t \in \mathrm{Ob}(T)}$ is organized functorially over the trace category to capture this adaptation.
There exists a functor
$$
H : T^{\mathrm{op}} \longrightarrow \mathbf{HA_{nucl}}
$$
such that:
for each object $t \in \mathrm{Ob}(T)$, $H(t) = H_t$;
for each morphism $f : t \to t'$ in $T$, we write
$$
H(f) : H_{t'} \longrightarrow H_t
$$
for the induced reindexing map.
Here $\mathbf{HA_{nucl}}$ is as in Definition 1.1: its objects are triples $(A,\sigma,\Delta)$ of a finite Heyting algebra with commuting modal endomorphisms satisfying Axiom A1, and its morphisms are homomorphisms preserving the propositional structure and both $\sigma$ and $\Delta$.
The functor $H$ must satisfy:
Functoriality {#a2-functoriality}
For all objects $t$,
$$
H(\mathrm{id}t) = \mathrm{id}{H_t},
$$
and for all composable morphisms
$$
t \xrightarrow{f} t' \xrightarrow{g} t'',
$$
we have
$$
H(g \circ f) = H(f) \circ H(g).
$$
Preservation of Structure {#a2-preservation}
For every morphism $f : t \to t'$, the map $H(f)$ is a homomorphism of Heyting-modal algebras; in particular, for all $a,b \in H_{t'}$,
$$
\begin{aligned}
H(f)(a \wedge_{t'} b) &= H(f)(a) \wedge_t H(f)(b),\
H(f)(a \vee_{t'} b) &= H(f)(a) \vee_t H(f)(b),\
H(f)(a \Rightarrow_{t'} b) &= H(f)(a) \Rightarrow_t H(f)(b),\
H(f)(\bot_{t'}) &= \bot_t,\quad H(f)(\top_{t'}) = \top_t,\
H(f)(\sigma_{t'}(a)) &= \sigma_t(H(f)(a)),\
H(f)(\Delta_{t'}(a)) &= \Delta_t(H(f)(a)).
\end{aligned}
$$
Compatibility with Fixed Fibers {#a2-fixed-compat}
For every morphism $f : t \to t'$, the fixed fibers are active under reindexing:
$$
H(f)\bigl(H_{t'}^\ast\bigr) \subseteq H_t^\ast.
$$
That is, pulling back a fixed proposition at $t'$ yields a fixed proposition at $t$.
Remark — Interpretation {#remark-interpretation-3}
Axiom A2 says the fibers do not live in isolation: they vary coherently over the trace category. A normalization $f : t \to t'$ induces a “view change” of propositions: what holds over $t'$ can be pulled back and re‑expressed over $t$, without breaking the propositional or modal structure. Fixed propositions reindex coherently as well, which will later support a global notion of stability locale.
---
Axiom A2b — Relational Faithfulness {#axiom-a2b}
The functor $H$ records the relational history of each trace faithfully: distinct traces have genuinely distinct modal characters.
Formally, $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ is automorphism-reflecting on the fixed layer: for any automorphism $\alpha : T \xrightarrow{;\sim;} T$ of the trace category that preserves the Grothendieck topology $J$, if the pullback sheaf $\alpha^\ast H^\ast$ is naturally isomorphic to $H^\ast$ as a sheaf of Heyting algebras on $T$, then $\alpha = \mathrm{id}_T$.
In other words: no nontrivial permutation of traces is invisible to the invariant layer $H^\ast$. The only self-symmetry of $T$ that can look like a symmetry of the fixed modal data is the identity.
Remark — Philosophical Grounding {#a2b-philosophy}
Axiom A2b is the mathematical expression of this principle. The fixed layer $H^\ast_t$ — the Heyting algebra of propositions stable under both the saturation nucleus $\sigma_t$ and the translation nucleus $\Delta_t$ — is the mathematical record of the relational history at trace $t$. Relational Faithfulness asserts that this record is injective on symmetries: no nontrivial automorphism of the trace category can permute traces while leaving their modal records intact.
This is the condition that distinguishes a genuinely relational universe from one whose modal structure is merely decorative. Without it, a GSU could have constant fibers $(H_t, \sigma_t, \Delta_t) = (H_0, \sigma_0, \Delta_0)$ for all $t$ — a maximally symmetric, periodic structure satisfying A0–A6 but violating A2b, encoding no relational distinction between traces. Axiom A2b rules this out: the nuclear pair $(\sigma_t, \Delta_t)$, varying across fibers, is the internal witness that each trace has a distinct relational standing in the universe.

Axiom A3 — Sheaf Condition {#axiom-a3}
Propositions that agree on refinements must glue uniquely on the coarser trace; this is enforced by a sheaf condition. The functor $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ from Axiom A2 is required to be a sheaf for a chosen Grothendieck topology on the trace category.
There exists a Grothendieck topology
$$
J
$$
on $T$, called the trace topology, such that:
Covering Families {#a3-covers}
For each object $t \in \mathrm{Ob}(T)$, a family of morphisms
$$
{, u_i : t_i \to t \mid i \in I ,}
$$
is declared to be a cover of $t$, written
$$
{u_i}_{i \in I} \in J(t),
$$
when it satisfies the axioms of a Grothendieck topology (stable under pullback, isomorphisms cover, and composition of covers is a cover) and reflects the intended notion of “locally refining the trace $t$ into subtraces or patches.”
The precise choice of covering families is left abstract, but is fixed once and for all as part of the primitive data.
Presheaf Structure {#a3-presheaf}
The assignment
$$
t \longmapsto H_t,\qquad
f \longmapsto H(f)
$$
defines a presheaf of Heyting-modal algebras on the site $(T,J)$. Thus:
For each trace $t$, the sections over $t$ are the elements of $H_t$.
For each morphism $f : t \to t'$, restriction along $f$ is given by the reindexing map $H(f) : H_{t'} \to H_t$.
Locality and Gluing {#a3-gluing}
For every trace $t \in \mathrm{Ob}(T)$ and every covering family
$$
{u_i : t_i \to t}_{i \in I} \in J(t),
$$
we have:
Locality. If $a,b \in H_t$ are such that
$$
H(u_i)(a) = H(u_i)(b) \quad \text{for all } i \in I,
$$
then $a = b$.
Gluing. Suppose we are given a family of elements
$$
(a_i){i\in I},\quad a_i \in H{t_i},
$$
such that for every pair of indices $i,j \in I$ and every object $s$ in a pullback square
$$
\begin{tikzcd}
s \ar[r,"v"] \ar[d,"w"'] & t_i \ar[d,"u_i"] \
t_j \ar[r,"u_j"'] & t
\end{tikzcd}
$$
we have
$$
H(v)(a_i) = H(w)(a_j) \in H_s.
$$
Then there exists a unique $a \in H_t$ such that
$$
H(u_i)(a) = a_i \quad\text{for all } i \in I.
$$
In other words, $H$ is a sheaf of Heyting-modal algebras on $(T,J)$.
Remark — Interpretation {#remark-interpretation-4}
Axiom A3 equips the fibers with a kind of topology: propositions can be specified locally on trace covers and then glued into global propositions, subject to compatibility on overlaps. This induces a local‑to‑global structure that later supports an internal geometric interpretation.
Canonical Form of the Trace Topology {#trace-topology-canonical}
The canonical choice of trace site grounds $J$ in the witness-trace geometry of the free partially commutative monoid:
Generators from independence. A trace $t$ is a finite sequence of step symbols whose commutations are governed by the independence/shuffle laws (Acts ShuffleTrace, RestepTrace, ReheadTrace). A covering family of $t$ is generated by choosing a partition of $t$ into subtraces $t = t^{(1)} \cdot \dots \cdot t^{(n)}$ such that every pair of subtraces consists of steps that commute in the partially commutative monoid, and then forming the inclusions
$$
u_i : t^{(i)} \hookrightarrow t \xrightarrow{\mathrm{NF}_{\mathrm{trace}}} t
$$
obtained by inserting $t^{(i)}$ into the ambient trace and normalizing. These inclusions present the canonical “independence covers.”
Closure properties. $J$ is the smallest Grothendieck topology containing the independence covers and closed under isomorphism, pullback along any trace normalization, and under refinement by further independence partitions of each $t_i$. Concatenating covers of independent subtraces yields another cover after normalization.
Witness compatibility. Every cover in $J$ is therefore witnessed by a normalization map back to $t$ whose domain factors as a shuffle of independent components; locality checks compare propositions after reindexing along these normalization maps.
This canonical presentation removes any ambiguity about the “open sets” of $J$: they are exactly those families that jointly observe $t$ through its independent trace patches and their normalizations.
Worked Example — Two-Patch Independence Cover {#two-patch-example}
Let $t = h \cdot s$ where the head step $h$ and the residual step $s$ are declared independent by the shuffle acts. The independence partition yields a cover ${u_1 : h \to t,\ u_2 : s \to t} \in J(t)$ where each $u_i$ is the evident inclusion followed by trace normalization. Suppose we have sections $a_1 \in H_h$ and $a_2 \in H_s$ such that on the pullback trace $h \cdot s$ (or equivalently $s \cdot h$ after normalization) we have
$$
H(u_1')(a_1) = H(u_2')(a_2),
$$
where $u_1'$ and $u_2'$ are the pullbacks of $u_1$ and $u_2$ along the commutation square. Axiom A3.3 then supplies a unique $a \in H_t$ with $H(u_1)(a) = a_1$ and $H(u_2)(a) = a_2$. This exhibits locality and gluing concretely: propositions that agree on the independent overlap of head and tail normalize to a single proposition over the whole trace.
---
Axiom A4 — Fixed Sheaf {#axiom-a4}
Fixed propositions are those already stable under both the saturation nucleus and the translation nucleus; fiberwise fixed elements $H_t^\ast$ assemble into a subsheaf of $H$.
Define a presheaf
$$
H^\ast : T^{\mathrm{op}} \longrightarrow \mathbf{HA_{nucl}}
$$
by:
on objects:
$$
H^\ast(t) := H_t^\ast = {a \in H_t \mid \sigma_t(a) = a = \Delta_t(a)},
$$
on morphisms $f : t \to t'$:
$$
H^\ast(f) := H(f)\big\vert_{H_{t'}^\ast} : H_{t'}^\ast \to H_t^\ast,
$$
which is well‑defined by Axiom A2.3.
Axiom A4 requires:
Sheaf Property of Fixed Fibers {#a4-sheaf}
For every trace $t$ and every covering family ${u_i : t_i \to t}_{i\in I} \in J(t)$:
Locality for fixed elements. If $a,b \in H_t^\ast$ satisfy
$$
H^\ast(u_i)(a) = H^\ast(u_i)(b) \quad\text{for all } i\in I,
$$
then $a = b$.
Gluing of fixed elements. If $(a_i){i\in I}$ is a family with $a_i \in H{t_i}^\ast$ such that for every pullback square as in Axiom A3.3 we have
$$
H^\ast(v)(a_i) = H^\ast(w)(a_j) \in H_s,
$$
then there exists a unique $a \in H_t^\ast$ such that
$$
H^\ast(u_i)(a) = a_i \quad\text{for all } i\in I.
$$
Thus $H^\ast$ is a fixed subsheaf of $H$.
Closure Under Gluing {#a4-gluing}
If a family of fixed local sections $(a_i){i\in I}$, each $a_i \in H{t_i}^\ast$, glues in the full sheaf $H$ to a section $a \in H_t$, then in fact
$$
a \in H_t^\ast.
$$
Equivalently, gluing fixed locals via the sheaf $H$ produces a fixed global, not merely a generic global section.
Remark — Interpretation {#remark-interpretation-5}
Axiom A4 carves out a “stable stratum” across the entire structure: those propositions that are fixed by both the saturation nucleus and the translation nucleus. Fiberwise, they are fully saturated propositions; globally, they form a sheaf $H^\ast$, so stability is a local‑to‑global notion. Later, $H^\ast$ will be used to define an internal locale (the “stability locale” of stable configurations).*** End Patch
---
Axiom A5 — Fiber Modal Language {#axiom-a5}
For each trace $t \in \mathrm{Ob}(T)$, there is a fiber modal language (FML) whose terms are interpreted in the fiber $H_t$. FML is presented as a simply typed $\lambda$-calculus for convenience, and these local term systems are compatible with the presheaf structure of $H$.
Types {#a5-types}
For the core theory we fix a specific FML fragment, denoted $\mathrm{FML}_0$. Its types are generated by the grammar:
base type:
$$
\mathsf{Prop}
$$
(the type of propositions, interpreted in $H_t$),
function types:
$$
A \Rightarrow B,
$$
finite product types:
$$
A \times B.
$$
Thus $\mathrm{FML}_0$ is the simply typed $\lambda$-calculus with one base type $\mathsf{Prop}$, products, and arrows. Additional type formers (e.g. finite sums or least/greatest fixed‑point types $\mu F,\sigma F$ for suitable endofunctors $F$) may be added as explicit extensions when needed, but all results in Section 6 are stated for $\mathrm{FML}_0$.
Contexts and Judgments {#a5-contexts}
For each trace $t$, there is a notion of typing context $\Gamma$ (a finite list of variable/type assignments) and typing judgments of the form
$$
\Gamma \vdash_t M : A,
$$
read “in context $\Gamma$ over trace $t$, term $M$ has type $A$.”
The type system includes (at least) the rules of a simply typed FML (isomorphic to a simply typed $\lambda$-calculus) with products and arrows:
variable rule,
introduction and elimination for products,
introduction and elimination for function types (lambda abstraction and application),
and, when present, the corresponding rules for sums and fixed points, plus term formers corresponding to the logical and modal structure on $\mathsf{Prop}$ (see below).
Interpretation of Types and Terms {#a5-interpretation}
For each trace $t$ and type $A$, there is an interpretation $\llbracket A \rrbracket_t$ as a suitable object built from $H_t$ (e.g. finite products, exponentials, and fixed‑point objects in the internal category of sets over that fiber).
For each typing judgment $\Gamma \vdash_t M : A$ there is an interpretation
$$
\llbracket \Gamma \vdash_t M : A \rrbracket_t \in \llbracket A \rrbracket_t
$$
or, more categorically, a morphism in the relevant fibered/semantic category corresponding to evaluation at trace $t$.
At the global level, in the topos to be constructed later, each type $A$ and context $\Gamma$ has an object $\llbracket A \rrbracket \in R$, $\llbracket \Gamma \rrbracket \in R$, and each derivable judgment
$$
\Gamma \vdash M : A
$$
gives a morphism
$$
\llbracket \Gamma \vdash M : A \rrbracket : \llbracket \Gamma \rrbracket \to \llbracket A \rrbracket.
$$
The fiberwise interpretation at trace $t$ is the value of this morphism at the generalized point corresponding to $t$ and a valuation of $\Gamma$.
Logical and Modal Term Formers {#a5-term-formers}
At type $\mathsf{Prop}$, FML includes term constructors corresponding to the propositional-modal operations on each fiber:
binary term formers $M \wedge N$, $M \vee N$, $M \Rightarrow N$,
constants $\mathsf{True}, \mathsf{False}$,
unary term formers $\mathsf{Sat}(M)$, $\mathsf{Trans}(M)$,
such that their semantics at trace $t$ are given by $\wedge_t,\vee_t,\Rightarrow_t,\top_t,\bot_t,\sigma_t,\Delta_t$.
There are also term formers for least and greatest fixed points (e.g. $\mathsf{FixLeast}(M), \mathsf{FixGreatest}(M)$) interpreting least and greatest fixed points of monotone endomorphisms on the fibers.
Reindexing and Functoriality {#a5-reindexing}
For every morphism $f : t \to t'$ in $T$, there is a reindexing operation on judgments and terms consistent with Axiom A2:
reindexing of terms along $f$ corresponds to applying the reindexing map $H(f)$ to their semantics,
for all constructors listed above, reindexing commutes with interpretation:
the semantics of the reindexed term is obtained by reindexing the semantics of the original term.
Remark — Interpretation {#remark-interpretation-6}
Axiom A5 equips the generative sheaf structure with a syntactic layer that mirrors its internal logic:
types and typed terms provide a Fiber Modal Language representation of internal morphisms (presented here with $\lambda$-syntax);
the interpretation map sends well‑typed terms into the fibers, respecting all logical and modal operations;
reindexing ensures that term semantics is functorial with respect to trace morphisms.
Relationally, FML terms are recipes for composing propositions, translation nuclei, and saturation nuclei along witness traces; every well‑typed term denotes a morphism in $R$ built from those acts.
---
Axiom A6 — Structural Operations {#axiom-a6}
There is a distinguished finite family $F$ of structural operations on the GSU structure. These are the only primitive operations from which all other constructions in this specification are built, together with:
finite compositions in the trace category $T$,
reindexing along morphisms of $T$,
and sheaf gluing along the topology $J$.
All other constructions are definable from these.
We describe $F$ at two levels: fiberwise algebraic constructors, structural operations on traces, and their induced term‑level operations.
Fiberwise Algebraic Constructors {#a6-fiberwise}
For each trace $t$, the fiber $H_t$ supports a fixed finite set of algebraic operations including at least:
binary meet $\wedge_t : H_t \times H_t \to H_t$,
binary join $\vee_t : H_t \times H_t \to H_t$,
propositional implication $\Rightarrow_t : H_t \times H_t \to H_t$,
nullary operations $\top_t, \bot_t \in H_t$,
modal operators $\sigma_t, \Delta_t : H_t \to H_t$,
satisfying the algebraic laws of Axiom A1.
Axiom A6 adds the requirement:
> every element of every fiber $H_t$ can be constructed from a finite collection of atomic elements using only the operations above, together with finite iteration of $\sigma_t$ and $\Delta_t$, and the equalities implied by the propositional-modal axioms.
No other primitive operations are permitted at the fiber level.
Structural Operations on Traces {#a6-traces}
At the trace level, there is a binary operation
$$
\star : \mathrm{Ob}(T) \times \mathrm{Ob}(T) \to \mathrm{Ob}(T)
$$
representing concatenation of traces, subject to the commutation and normalization relations already encoded in $T$ via Axiom A0.
Axiom A6 makes explicit that:
any composite trace is built by iterated use of $\star$ and the normalization moves of Axiom A0;
there is no additional primitive operation for forming traces.
Thus $\star$ and the normalization system of A0 generate all trace‑level structure used by the trace-convolution mechanism.
Induced Operations on Internal Terms {#a6-internal}
The internal $\lambda$-calculus of Axiom A5 includes term‑level constructors corresponding to the operations on $\mathsf{Prop}$:
$M \wedge N$, $M \vee N$, $M \Rightarrow N$,
$\mathsf{True}, \mathsf{False}$,
$\mathsf{Sat}(M)$, $\mathsf{Trans}(M)$,
fixed‑point term formers $\mathsf{FixLeast}(M)$, $\mathsf{FixGreatest}(M)$ where appropriate.
Axiom A6 requires that:
these are the only primitive term constructors that directly manipulate propositions at type $\mathsf{Prop}$; all other term formers (products, arrows, fixed points on other types, etc.) are either $\lambda$-structural (e.g. abstraction, pairing) or definable from these plus the categorical structure of the internal logic;
for any morphism $f : t \to t'$ in $T$, reindexing of terms and reindexing of their semantics commute with all these constructors, as already enforced by Axiom A5.
Naturality {#a6-naturality}
Each operation in $F$ is natural with respect to the presheaf structure:
For every morphism $f : t \to t'$ in $T$, for all $a,b \in H_{t'}$, and for every binary operation $\odot \in {\wedge,\vee,\Rightarrow}$,
$$
H(f)(a \odot_{t'} b) = H(f)(a) \odot_t H(f)(b),
$$
and similarly for $\sigma,\Delta$:
$$
H(f)(\sigma_{t'}(a)) = \sigma_t(H(f)(a)),\quad
H(f)(\Delta_{t'}(a)) = \Delta_t(H(f)(a)).
$$
At the term level, reindexing along $f$ commutes with all associated term constructors (the semantics of the reindexed term is the reindexing of the original semantics).
Finite Generative Basis {#a6-basis}
Summarizing, the structural vocabulary consists of:
trace concatenation $\star$,
the fiberwise propositional operations $\wedge,\vee,\Rightarrow,\top,\bot$,
the fiberwise modal operations $\sigma,\Delta$,
and the associated term‑level constructors on the base type $\mathsf{Prop}$.
Axiom A6 asserts that:
> Every object and section of the generative sheaf universe that appears in this specification is generated from atomic data via:
> - finite applications of the operations in $F$,
> - finite compositions in the trace category $T$,
> - finite reindexing along morphisms of $T$,
> - and sheaf gluing along the topology $J$.
>
> No additional primitive generators or operations are admitted.
Remark — Interpretation {#remark-interpretation-7}
Axiom A6 states that there is no hidden machinery: the only primitive operations are the ones explicitly named. This is what will later allow us to define a generative universe closure operator $U_G$ (Section 4) that closes any set of “already available” objects under:
the constructors in $F$,
reindexing,
and sheaf gluing,
and to prove that the entire Generative Sheaf Universe is the least fixed point of this operator.
---
With Axioms A0–A6 we have fully specified the primitive data from which the Generative Sheaf Universe is constructed.
Global Object Construction {#global-construction}
In this section we assemble the primitive, fiberwise data of Section 1 into a single ambient topos equipped with a distinguished internal Heyting-modal object and its invariant part. This will be the Generative Sheaf Universe.
Throughout, let:
$\mathsf{T}$ be the trace category from Axiom A0;
$J$ be the Grothendieck topology on $\mathsf{T}$ from Axiom A3;
$\mathbf{HA_{nucl}}$ be the category whose objects are finite Heyting algebras equipped with commuting modal endomorphisms $(\sigma,\Delta)$ as in Axiom A1, and whose morphisms are Heyting algebra homomorphisms preserving $\sigma,\Delta$;
$\mathbf{H} : \mathsf{T}^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ be the reindexing functor of Axiom A2;
$\mathbf{H}_* : \mathsf{T}^{\mathrm{op}} \to \mathbf{HA}$ be the fixed subsheaf from Axiom A4 (where $\mathbf{HA}$ is the category of finite Heyting algebras and Heyting algebra homomorphisms).

Propositional Presheaf {#propositional-presheaf}
From Axioms A0–A2, we have:
A small category $\mathsf{T}$ (the trace category).
A functor
$$
\mathbf{H} : \mathsf{T}^{\mathrm{op}} \longrightarrow \mathbf{HA_{nucl}},
$$
such that, for each trace $t \in \mathrm{Ob}(\mathsf{T})$,
$$
\mathbf{H}(t)
:= \bigl(H_t,\wedge_t,\vee_t,\Rightarrow_t,\bot_t,\top_t,\sigma_t,\Delta_t\bigr),
$$
with $H_t$ and its structure as specified in Axiom A1, and for each morphism
$f : t \to t'$ in $\mathsf{T}$,
$$
\mathbf{H}(f) : H_{t'} \longrightarrow H_t
$$
is a Heyting-modal homomorphism as in Axiom A2.
We now “forget” the algebraic structure to obtain an underlying presheaf of sets.
Underlying Presheaf of Sets {#underlying-presheaf}
Let
$$
U : \mathbf{HA_{nucl}} \longrightarrow \mathsf{Set}
$$
be the forgetful functor sending a finite Heyting-modal algebra to its carrier set and a homomorphism to its underlying function of sets.
Define the underlying propositional presheaf by
$$
\lvert \mathbf{H} \rvert := U \circ \mathbf{H} : \mathsf{T}^{\mathrm{op}} \longrightarrow \mathsf{Set},
$$
so that:
On objects:
$$
\lvert \mathbf{H} \rvert(t) = U(\mathbf{H}(t)) = H_t.
$$
On morphisms:
$$
\lvert \mathbf{H} \rvert(f) = U(\mathbf{H}(f)) : H_{t'} \to H_t.
$$
Thus $\lvert \mathbf{H} \rvert$ is a presheaf of sets with the same underlying sets and reindexing maps as the original fiber data.
Fixed Subpresheaf {#fixed-subpresheaf}
From Axiom A4, each fiber $H_t$ has an fixed subalgebra
$$
H_t^* := {, a \in H_t \mid \sigma_t(a) = a = \Delta_t(a) ,} \subseteq H_t,
$$
and for every morphism $f : t \to t'$ in $\mathsf{T}$,
$$
\mathbf{H}(f)\bigl(H_{t'}^\bigr) \subseteq H_t^.
$$
Define a presheaf
$$
\mathbf{H}_* : \mathsf{T}^{\mathrm{op}} \longrightarrow \mathbf{HA}
$$
by:
On objects:
$$
\mathbf{H}_(t) := H_t^.
$$
On morphisms:
$$
\mathbf{H}*(f) := \mathbf{H}(f)\big\vert{,H_{t'}^} : H_{t'}^ \to H_t^*.
$$
Composing with the forgetful functor $\mathbf{HA} \to \mathsf{Set}$ yields an underlying fixed presheaf of sets
$$
\lvert \mathbf{H}* \rvert : \mathsf{T}^{\mathrm{op}} \longrightarrow \mathsf{Set}, \quad
\lvert \mathbf{H}* \rvert(t) = H_t^*.
$$
By Axiom A4, $\mathbf{H}_*$ is itself a presheaf of finite Heyting algebras and is stable under the reindexing maps defined by $\mathbf{H}$.
Natural Modal Transformations {#modal-transformations}
The fiberwise modal operators of Axiom A1 assemble into natural transformations
$$
\sigma,\Delta : \mathbf{H} \Longrightarrow \mathbf{H}
$$
in $\mathbf{HA_{nucl}}^{\mathsf{T}^{\mathrm{op}}}$:
For each object $t\in\mathsf{T}$, the component
$$
\sigma_t : H_t \to H_t,\qquad \Delta_t : H_t \to H_t
$$
is the saturation nucleus and translation nucleus on the fiber $H_t$.
For each morphism $f : t \to t'$ in $\mathsf{T}$, the naturality conditions
$$
\mathbf{H}(f)\circ \sigma_{t'} = \sigma_t \circ \mathbf{H}(f),\qquad
\mathbf{H}(f)\circ \Delta_{t'} = \Delta_t \circ \mathbf{H}(f)
$$
hold by Axiom A2.
These will become internal endomorphisms on a single object once we pass to the sheaf topos.

Sheafification and the Ambient Topos {#sheafification}
Let
$$
\mathsf{Sh}(\mathsf{T},J)
$$
denote the category of set-valued sheaves on the site $(\mathsf{T},J)$. This is an elementary topos in the usual sense.
By Axiom A3 (sheaf condition), the underlying presheaf $\lvert \mathbf{H} \rvert$ already satisfies locality and gluing with respect to the topology $J$; hence:
$\lvert \mathbf{H} \rvert$ is a sheaf on $(\mathsf{T},J)$.
Likewise, by Axiom A4, $\lvert \mathbf{H}* \rvert$ is also a sheaf, and we have a monomorphism of sheaves
$$
\lvert \mathbf{H}* \rvert \hookrightarrow \lvert \mathbf{H} \rvert.
$$
We now regard these sheaves as objects of $\mathsf{Sh}(\mathsf{T},J)$. For notational simplicity, we will not distinguish between a presheaf that is already a sheaf and its corresponding object in the sheaf category; we write:
$H \in \mathsf{Sh}(\mathsf{T},J)$ for the sheaf corresponding to $\lvert \mathbf{H} \rvert$,
$H^* \hookrightarrow H$ for the subsheaf corresponding to $\lvert \mathbf{H}_* \rvert$.
Internal Propositional Structure on $H$ {#internal-propositional}
The fiberwise propositional operations
$$
(\wedge_t,\vee_t,\Rightarrow_t,\bot_t,\top_t)\quad (t\in\mathsf{T})
$$
are natural in $t$ by Axiom A2. That is, for each morphism $f : t \to t'$,
$$
\mathbf{H}(f)(a \wedge_{t'} b) = \mathbf{H}(f)(a) \wedge_t \mathbf{H}(f)(b),
$$
and similarly for $\vee,\Rightarrow,\bot,\top$. These families of operations therefore assemble to internal morphisms in the topos $\mathsf{Sh}(\mathsf{T},J)$:
$$
\wedge,\vee : H \times H \to H,\quad
\Rightarrow : H \times H \to H,\quad
\bot,\top : 1 \to H,
$$
giving $H$ the structure of an internal finite Heyting algebra object.
Internal Modal Operators and Fixed Subobject {#internal-modal}
The natural transformations $\sigma,\Delta : \mathbf{H} \Rightarrow \mathbf{H}$ induce internal endomorphisms
$$
\sigma,\Delta : H \longrightarrow H
$$
of the sheaf $H$, satisfying internally the same algebraic laws as in Axiom A1 (monotonicity, idempotence/inflationarity, commutation, and compatibility with the propositional structure).
The family of fixed fibers $H_t^$ from Axiom A4 assembles into a subsheaf
$$
H^ \hookrightarrow H
$$
of internal Heyting algebras, stable under reindexing and under all sheaf gluing operations. In particular:
Each inclusion $H_t^* \subseteq H_t$ is a sub-Heyting algebra inclusion.
For every morphism $f : t \to t'$ in $\mathsf{T}$, the reindexing map $H(f) : H_{t'} \to H_t$ restricts to a Heyting algebra homomorphism $H^(f) : H_{t'}^ \to H_t^*$.
Local invariant sections glue to global invariant sections, and gluing in the ambient sheaf $H$ preserves invariance.

Definition of the Generative Sheaf Universe {#def-gsu}
We can now package the previous constructions into a single structure.
Definition — Generative Sheaf Universe {#def-gsu-formal}
A Generative Sheaf Universe consists of data
$$
(T,J,H,\sigma,\Delta,H^*,\text{FML},\mathcal{F},U_G)
$$
with the following properties.
$(T,J)$ is a small trace site satisfying Axioms A0–A3, and
$$
R \coloneqq \mathbf{Sh}(T,J)
$$
is its sheaf universe.
$H \in R$ is the internal finite Heyting algebra object arising from the $\mathbf{HA_{nucl}}$-valued sheaf $t \mapsto H_t$ of Axiom A1–A2.
$\sigma,\Delta : H \to H$ are internal endomorphisms induced by the fiberwise saturation nucleus and translation nucleus $(\sigma_t,\Delta_t)$, making $H$ an internal object of $\mathbf{HA_{nucl}}$ in $R$.
$H^* \hookrightarrow H$ is the internal fixed subobject induced by the fiberwise fixed subalgebras $H_t^*$, forming a subsheaf as in Axiom A4.
FML (Fiber Modal Language) is a typed $\lambda$-calculus structure as in Axiom A5 whose interpretation in $R$ coincides with the internal Heyting-modal logic of $H$, and whose term constructors for the base type $\mathsf{Prop}$ realize the operations $\wedge,\vee,\Rightarrow,\bot,\top,\sigma,\Delta$.
$\mathcal{F}$ is the finite family of structural operations specified in Axiom A6 (fiberwise propositional operations, modal operators, trace‑based trace convolution, and their induced term-level counterparts).
$U_G : P(\mathrm{Obj}(R)) \to P(\mathrm{Obj}(R))$ is the generative universe closure operator on subclasses of $\mathrm{Obj}(R)$ introduced in Section 4, defined from $\mathcal{F}$ and the universe structure, whose least fixed point containing the atomic class of representables together with $H$ is all of $\mathrm{Obj}(R)$.
We refer to the quintuple $(R,H,\sigma,\Delta,H^*)$ as the generative sheaf universe determined by the data and to $U_G$ as its generative universe closure operator.
Convention {#convention-gsu}
From this point forward:
“The universe” means $(R,H,\sigma,\Delta,H^*)$.
For $t\in\mathsf{T}$, the fiber of $H$ at $t$ is $H_t$, and sections of $H$ over the representable sheaf $\mathrm{y}(t)$ are identified with elements of $H_t$.
Reindexing along a morphism $f : t \to t'$ in $\mathsf{T}$ is identified with the restriction map
$$
H(f) : H_{t'} \longrightarrow H_t.
$$
All subsequent constructions and theorems are understood to take place internally in this universe $R$ with its distinguished object $H$ and structure described above.
Structural Theorems {#structural-theorems}
In this section we package the construction of the Generative Sheaf Universe into
structural theorems: existence and uniqueness, the canonical trace convolution
(monoidal) structure, quasicrystalline aperiodicity of the fixed layer,
and the notion of profiles as internal universes.
We work with the site $(T,J)$, the sheaf topos
$$
R := \mathbf{Sh}(T,J),
$$
the internal Heyting-modal object $H \in R$, and its invariant
subobject $H^\ast \hookrightarrow H$ constructed in Sections 1–2.
---
Existence and Uniqueness {#existence-uniqueness}
We first formalize what has already been constructed and show that it is
canonical.
Theorem — Existence {#thm-existence}
Given primitive data satisfying Axioms A0–A6, there exists:
a universe $R$,
an internal object $H \in R$,
internal modal endomorphisms
$$
\sigma, \Delta : H \to H,
$$
an internal fixed subobject $H^\ast \hookrightarrow H$,
such that:
$R$ is (equivalent to) the sheaf topos
$$
R ;\simeq; \mathbf{Sh}(T,J)
$$
for the site $(T,J)$ of Axioms A0 and A3.
The underlying presheaf $t \mapsto H_t$ with reindexing $H(f)$ from
Axioms A1–A2 is a $J$-sheaf; its sheafification is the object
$H \in R$.
The fixed fibers $H_t^\ast \subseteq H_t$ from Axiom A4
assemble into a subsheaf $H^\ast \hookrightarrow H$.
The fiberwise modal operators $\sigma_t, \Delta_t : H_t \to H_t$ define
natural endomorphisms
$$
\sigma, \Delta : H \to H
$$
in $R$, making $H$ an internal Heyting-modal algebra object.
The typed $\lambda$-structure of Axiom A5 is realized as the
internal language of $R$ restricted to $H$: each type
$A$ is interpreted as an object $\llbracket A \rrbracket$ of
$R$, each context $\Gamma$ as $\llbracket \Gamma \rrbracket$,
and each typing judgment
$\Gamma \vdash M : A$ as a morphism
$$
\llbracket \Gamma \vdash M : A \rrbracket :
\llbracket \Gamma \rrbracket \to \llbracket A \rrbracket
$$
compatible with the fiberwise semantics.
Proof.
By Axiom A0 we are given a small category $T$ and, by Axiom A3, a Grothendieck topology $J$ on $T$. By standard topos theory (e.g. the general construction of sheaf topoi on sites), the category $\mathbf{Sh}(T,J)$ of $\mathcal{U}$-small set-valued sheaves on $(T,J)$ is a Grothendieck topos (and in particular an elementary topos); we denote it by $R$.
By Axioms A1–A2 we are given a functor
$$
H : T^{\mathrm{op}} \longrightarrow \mathbf{HA_{nucl}},
$$
where $\mathbf{HA_{nucl}}$ is as in Definition 1.1. Composing with the forgetful functor $\mathbf{HA_{nucl}} \to \mathbf{Set}$ yields a presheaf of sets on $T$. Axiom A3 asserts that this underlying presheaf satisfies the sheaf condition with respect to $J$, so it determines an object $H \in R$. Conversely, every structural map in $\mathbf{HA_{nucl}}$ is natural in $t$, so the fiberwise lattice and modal operations assemble to internal morphisms
$$
\wedge,\vee,\Rightarrow,\bot,\top : H^{\times n} \to H,\qquad
\sigma,\Delta : H \to H
$$
in $R$, making $H$ an internal object of $\mathbf{HA_{nucl}}$ in the sense that its fibers over representables are exactly the given $(H_t,\sigma_t,\Delta_t)$.
Axiom A4 gives, for each $t$, a subset $H_t^\ast \subseteq H_t$ of invariant elements and states that these subsets are stable under all reindexing maps and form a subsheaf of $H$. Thus the family $(H_t^\ast)$ determines a subobject $H^\ast \hookrightarrow H$ in $R$.
Finally, Axiom A5 specifies for each trace $t$ a fiber modal language FML whose fiberwise interpretation lands in $H_t$ and is functorial in $t$. By the standard internal-language construction for a sheaf topos, the fiberwise interpretations $\llbracket \Gamma \vdash_t M : A \rrbracket_t$ glue to a unique global morphism
$$
\llbracket \Gamma \vdash M : A \rrbracket : \llbracket \Gamma \rrbracket \to \llbracket A \rrbracket
$$
in $R$ whose evaluation at each generalized point of $R$ recovers the given fiberwise semantics. This yields the claimed internal λ-structure, with $\mathsf{Prop}$ interpreted as $H$ and the logical/modal constructors interpreted by the internal operations on $H$. ∎
---
Theorem — Uniqueness Up to Equivalence {#thm-uniqueness}
Let
$$
(R, H, \sigma, \Delta, H^\ast)
\quad\text{and}\quad
(R', H', \sigma', \Delta', H'^{\ast})
$$
be two realizations of the same primitive data (A0–A6), in the sense that:
their underlying sites are equivalent as sites:
$(T,J) \simeq (T',J')$,
their internal objects and modal structure realize the same fiber data
$(H_t, \sigma_t, \Delta_t)$ up to this site equivalence,
their invariant subsheaves correspond to the same family $(H_t^\ast)$.
Then there exists an equivalence of topoi
$$
F : R ;\simeq; R'
$$
such that:
$F(H) \cong H'$ as internal Heyting-modal algebra objects,
under this identification, $F(\sigma) = \sigma'$ and $F(\Delta) = \Delta'$,
$F(H^\ast) \cong H'^{\ast}$ as subobjects of $H'$.
In particular, the Generative Sheaf Universe determined by given data (A0–A6) is
unique up to canonical equivalence.
Proof.
By assumption there is an equivalence of sites $(T,J) \simeq (T',J')$. The general comparison theorem for sheaf universes (sheaf topoi) asserts that any such equivalence induces an equivalence of sheaf categories
$$
F_{\mathrm{sh}} : \mathbf{Sh}(T,J) \longrightarrow \mathbf{Sh}(T',J')
$$
which is an equivalence of universes. Via this equivalence, the representable sheaves and all sheaves built functorially from them correspond up to isomorphism.
The primitive generative data includes, for each $t \in T$, a finite Heyting-modal fiber $(H_t,\sigma_t,\Delta_t,H_t^\ast)$. Transporting these fibers along the given equivalence of sites produces fibers $(H'_t,\sigma'_t,\Delta't,H_t'^{\ast})$ over $T'$ which, by hypothesis, coincide with the fibers underlying $H'$ and $H'^\ast$. Naturality of the fiberwise operations implies that the internal objects $H,H^\ast$ in $R$ and $H',H'^\ast$ in $R'$ correspond under $F{\mathrm{sh}}$, and that the internal endomorphisms $\sigma,\Delta$ correspond to $\sigma',\Delta'$.
Thus $F_{\mathrm{sh}}$ is an equivalence of universes carrying the entire trace convolution structure $(H,\sigma,\Delta,H^\ast)$ to $(H',\sigma',\Delta',H'^\ast)$. This proves uniqueness of the Generative Sheaf Universe up to canonical equivalence. ∎
Remark — The GSU as Sheafification {#remark-gsu-sheafification}
The uniqueness theorem yields a clean characterization: the GSU is the Grothendieck topos of sheaves on the initial relational quantale generated by the trace alphabet $\Sigma$ and independence relation $I \subseteq \Sigma \times \Sigma$, with $\sigma$ and $\Delta$ its canonical commuting nuclei:
$$
R ;=; \mathbf{Sh}(T, J).
$$
The axioms A0–A6 are not additional data imposed on this structure; they are the exactness and coherence conditions required for the relational quantale to support a well-behaved sheaf theory. The Day convolution $\circledast$ is the sheafification of the quantale tensor $\star$. Every subsequent structure — the fixed subsheaf $H^\ast$, the phase space, the FML, the defect operator — is determined by this single sheafification.

---
Characteristic Morphism of the Invariant Subobject {#characteristic-morphism}
In the Grothendieck topos $R = \mathbf{Sh}(T,J)$, every subobject is classified
by a unique morphism into the subobject classifier $\Omega$. The subobject
$H^\ast \hookrightarrow H$ is no exception, and its classifying morphism carries
precise information about how invariance functions as an internal truth value.
Construction of the Subobject Classifier
Recall that in $R = \mathbf{Sh}(T,J)$, the subobject classifier $\Omega$ is the
sheaf
$$
\Omega(t) ;=; { S \mid S \text{ is a } J\text{-closed sieve on } t },
$$
with restriction along $f : s \to t$ given by pullback of sieves:
$\Omega(f)(S) = f^\ast S = { g : r \to s \mid f \circ g \in S }$.
The terminal object $1$ maps into $\Omega$ via the true morphism
$\top : 1 \to \Omega$ sending the unique global section to the maximal sieve
$\mathbf{t}_t = { f : s \to t \mid \text{any } f }$ at each $t$.
Definition — Characteristic Morphism {#def-characteristic-morphism}
For $a \in H_t$, define the sieve
$$
\chi_{H^\ast,t}(a)
;\coloneqq;
\bigl{, f : s \to t ;\bigm|; H(f)(a) \in H^\ast_s ,\bigr}.
$$
Proposition — Characteristic Morphism of $H^\ast$. The assignment
$t \mapsto \chi_{H^\ast,t}$ defines a morphism of sheaves
$$
\chi_{H^\ast} : H \longrightarrow \Omega
$$
such that the following square is a pullback in $R$:
$$
\begin{array}{ccc}
H^\ast & \longrightarrow & 1 \
\downarrow & & \downarrow\scriptstyle{\top} \
H & \xrightarrow{;\chi_{H^\ast};} & \Omega.
\end{array}
$$
In particular, $\chi_{H^\ast}$ is the unique morphism with this property.
Proof. We verify the three required conditions.
Well-definedness (each $\chi_{H^\ast,t}(a)$ is a $J$-closed sieve). Let
$S = \chi_{H^\ast,t}(a)$. If $f : s \to t$ is in $S$ — i.e. $H(f)(a) \in H^\ast_s$
— and $g : r \to s$ is any morphism, then functoriality of $H$ gives
$H(f \circ g)(a) = H(g)(H(f)(a))$. Since $H^\ast$ is closed under reindexing
(Axiom A2, Compatibility with Fixed Fibers), $H(g)(H(f)(a)) \in H^\ast_r$,
so $f \circ g \in S$. Thus $S$ is a sieve.
For $J$-closedness: suppose ${u_i : t_i \to t}$ is a $J$-covering family and
each $u_i \in S$. Then ${H(u_i)(a)}{i}$ is a compatible family of sections of
$H^\ast$ — each $H(u_i)(a) \in H^\ast{t_i}$ and the reindexings agree — so by
the sheaf condition for $H^\ast$ (Axiom A4), there is a unique $b \in H^\ast_t$
with $H(u_i)(b) = H(u_i)(a)$ for all $i$. Since $H$ is a sheaf and ${u_i}$
covers $t$, such a compatible family determines $a$ uniquely, hence $a = b \in
H^\ast_t$, and in particular the identity sieve contains $\mathrm{id}_t$, making
$S$ the maximal sieve. So $S$ is $J$-closed.
Naturality (sheaf morphism condition). For $f : s \to t$ and $a \in H_t$:
$$
\Omega(f)\bigl(\chi_{H^\ast,t}(a)\bigr)
= f^\ast\bigl(\chi_{H^\ast,t}(a)\bigr)
= \bigl{ g : r \to s \mid H(f \circ g)(a) \in H^\ast_r \bigr}
= \chi_{H^\ast,s}\bigl(H(f)(a)\bigr),
$$
which is $(\chi_{H^\ast} \circ H(f))(a)$. So $\chi_{H^\ast}$ is natural.
Pullback. By the universal property of $\Omega$, the square
$H^\ast \to 1 \to \Omega$ and $H^\ast \hookrightarrow H \to \Omega$ commutes: for
$a \in H^\ast_t$, $\chi_{H^\ast,t}(a)$ is the maximal sieve (since every
$H(f)(a) \in H^\ast_{s}$ by reindexing), which equals $\top_t$. The pullback
universal property and the general theory of subobject classifiers in a
Grothendieck topos (Johnstone, Sketches of an Elephant, Lemma A1.6.2) then
guarantee uniqueness of $\chi_{H^\ast}$. $\square$
Properties and Interpretation
Corollary — $\chi_{H^\ast}$ is a Heyting algebra morphism on invariant elements.
For $a, b \in H_t$,
$$
\chi_{H^\ast,t}(a \wedge b) \supseteq \chi_{H^\ast,t}(a) \cap \chi_{H^\ast,t}(b),
$$
with equality when $H_t^\ast$ is closed under meets (which it is, being a
sub-Heyting algebra). Dually for joins. The morphism $\chi_{H^\ast}$ thus
reflects the lattice structure of $H^\ast$ into $\Omega$.
Internal interpretation. The morphism $\chi_{H^\ast}$ makes invariance an internal truth value of the topos: $a \in H_t$ is invariant if and only if $\chi_{H^\ast,t}(a)$ is the maximal sieve on $t$. In the internal language of $R$, the formula
$$
a \in H^\ast ;;\Leftrightarrow;; \chi_{H^\ast}(a) = \top
$$
is a well-formed internal statement, and the full Heyting-algebra structure of $\Omega$ applies to reason about partial and approximate invariance.
Remark — Factorization through the Double-Negation Subtopos.
The Lawvere–Tierney topology $j = \neg\neg$ on $R$ classifies the
double-negation subtopos $R_{\neg\neg} \hookrightarrow R$, whose sheaves are
exactly the $\neg\neg$-sheaves. The morphism $\chi_{H^\ast}$ factors through
$\Omega_{\neg\neg} \hookrightarrow \Omega$ — i.e. invariance is a dense condition
in the $\neg\neg$ sense — if and only if the fixed layer $H^\ast$ is
$\neg\neg$-dense in $H$: every proposition can be locally forced into the
invariant layer by some cover. In the quasicrystalline case (Theorem 3.4), local
repetitiveness ensures this density holds, and $\chi_{H^\ast}$ thus factors
through the Boolean part of $\Omega$.

---
Trace Convolution Structure {#trace-convolution}
We now show that $R$ carries a canonical symmetric monoidal
structure whose trace convolution combines the trace geometry and the fiberwise
Heyting-modal structure. This is the sense in which the structure is a
trace convolution structure.
Theorem — Canonical Trace Convolution Structure {#thm-trace-convolution}
The generative sheaf universe $R$ admits a symmetric monoidal
structure
$$
\circledast : R \times R \longrightarrow R,
$$
with unit object $I \in R$, such that:
On representables $y(t) := \hom_T(-,t)$ we have
$$
y(t) \circledast y(t') ;\simeq; y(t \star t'),
$$
where $\star$ is the trace concatenation of Axiom A6, modulo the
normalization relations of Axiom A0.
On the distinguished object $H$, the trace convolution $\circledast$ restricts
fiberwise to the propositional-lattice product, compatibly with the
modal operations $\sigma$ and $\Delta$.
The unit object $I$ identifies with the terminal sheaf (constant
singleton), corresponding to the empty trace.
In particular $(R, \circledast, I)$ is a symmetric monoidal
universe, and $(R, H)$ carries a canonical trace convolution
structure.
Proof.
Monoidal structure on $T$.
By Axiom A6 the trace category $T$ is equipped with a binary operation
$\star : \mathrm{Ob}(T)\times \mathrm{Ob}(T)\to \mathrm{Ob}(T)$ representing concatenation of traces, together with relations on morphisms coming from the normalization system of Axiom A0. The axioms for trace concatenation (associativity up to the chosen normalization, unit given by the empty trace, and symmetry induced by commutation of independent steps) endow $T$ with the structure of a small symmetric monoidal category $(T,\star,e)$.
Day convolution on presheaves.
On the presheaf category $[T^{\mathrm{op}},\mathbf{Set}]$ we apply the standard Day convolution construction with respect to $(T,\star,e)$. For presheaves $F,G$ we define
$$
(F \otimes_{\mathrm{Day}} G)(t)
;\coloneqq;
\int^{u,v \in T} F(u) \times G(v) \times T(t, u \star v),
$$
where the coend ranges over all factorisations of $t$ by $\star$. By general results on Day convolution, this equips $[T^{\mathrm{op}},\mathbf{Set}]$ with a symmetric monoidal structure whose unit is the representable $y(e)$; the symmetry, associator, and unitors are induced from those of $(T,\star,e)$.
Restriction to sheaves.
The inclusion $i : \mathbf{Sh}(T,J) \hookrightarrow [T^{\mathrm{op}},\mathbf{Set}]$ has a left adjoint sheafification functor $a : [T^{\mathrm{op}},\mathbf{Set}] \to \mathbf{Sh}(T,J)$. Since $a$ is left exact, it is strong symmetric monoidal with respect to Day convolution: we define, for sheaves $F,G$,
$$
F \circledast G ;\coloneqq; a\bigl(iF \otimes_{\mathrm{Day}} iG\bigr),
$$
and $I\coloneqq a(y(e))$, the sheafification of the unit representable. Standard properties of reflective subcategories ensure that this definition is independent of choices and yields a symmetric monoidal structure on $\mathbf{Sh}(T,J)$, with associator, unitors, and braiding inherited from those of $[T^{\mathrm{op}},\mathbf{Set}]$.
Behaviour on representables.
For representables $y(t),y(t')$ we have, already in the presheaf category,
$$
y(t) \otimes_{\mathrm{Day}} y(t') ;\cong; y(t \star t'),
$$
by the usual Yoneda/Day convolution calculation. Sheafification preserves this isomorphism because representables are already sheaves for the canonical coverage induced by $J$. Thus
$$
y(t) \circledast y(t') ;\cong; y(t \star t')
$$
in $R$, establishing item (1).
Behaviour on $H$.
Apply Day convolution in the presheaf category to the underlying presheaf of sets of $H$. By construction,
$(H \otimes_{\mathrm{Day}} H)(t)$ is a colimit of pairs $(a,b)$ of sections of $H$ indexed by decompositions $t \simeq u \star v$. The fiberwise propositional structure on each $H_t$ provides a canonical map
$$
\theta_t : H_t \times H_t \longrightarrow (H \otimes_{\mathrm{Day}} H)(t)
$$
sending $(a,b)$ to the class of $(a,b,\mathrm{id}_t)$ when $t \simeq t \star e \simeq e \star t$, and extending uniquely along the universal property of the coend. Because each $H_t$ is finite and the trace topology is built from independence covers that respect concatenation, these maps $\theta_t$ are isomorphisms and are natural in $t$. Sheafification preserves these isomorphisms, so in $R$ we have
$$
H \circledast H ;\cong; H \times H,
$$
where the trace convolution restricts to the product lattice structure on each fiber. Naturality of the fiberwise operations implies that the endomorphisms $\sigma,\Delta$ are algebra homomorphisms for this trace convolution, proving item (2).
Unit and symmetry.
The constant terminal sheaf (the sheafification of the representable at the empty trace) is the unit object $I$ for this trace convolution, because Day convolution has unit $y(e)$ and $a$ preserves that unit. Symmetry and all coherence laws follow from the corresponding facts about Day convolution and the strong monoidality of sheafification.
Altogether, $\mathbf{Sh}(T,J)$ becomes a symmetric monoidal universe with unit $I$ and trace convolution $\circledast$, and the distinguished object $H$ is an internal algebra object for this trace convolution whose structure encapsulates both the trace geometry and the fiberwise Heyting-modal algebra. ∎
Depth Tower and Fischer-Rao Convergence {#depth-tower}
The trace convolution structure carries a canonical stratification by generative depth, with a natural metric on the space of admissible nucleus families controlling convergence.
Definition — Depth Filtration {#def-depth-filtration}
Define full subcategories
$$
T^{(n)} := {t \in T \mid t \text{ has concatenation depth} \leq n},
$$
yielding a tower of sites $(T^{(n)}, J|{T^{(n)}})$ and a corresponding tower of sheaf universes:
$$
R_0 \longrightarrow R_1 \longrightarrow \cdots \longrightarrow R,
\qquad R_n := \mathbf{Sh}(T^{(n)},, J|{T^{(n)}}),
$$
with geometric morphisms $f_n : R_n \to R_{n+1}$ induced by the depth-inclusions $T^{(n)} \hookrightarrow T^{(n+1)}$.
A nucleus family at depth $n$ is a collection ${(\sigma_t, \Delta_t)}{t \in T^{(n)}}$ of nucleus pairs admissible in $\mathbf{HA{nucl}}$ (Axiom A1), compatible with the reindexing maps of Axiom A2 over $T^{(n)}$. The moduli space of depth-$n$ models is:
$$
\mathcal{M}n := \left{ {(\sigma_t, \Delta_t)}{t \in T^{(n)}} ;\middle|; \text{admissible nucleus family at depth } n \right}.
$$
Each $\mathcal{M}n$ is a finite set (since each $H_t$ is finite and the set of nuclei on a finite Heyting algebra is finite). The depth-inclusions induce restriction maps $\rho_n : \mathcal{M}{n+1} \to \mathcal{M}_n$ by forgetting the nucleus data on traces of depth exactly $n+1$.
Theorem — Beck-Chevalley Stability {#thm-bc-stability}
For each $n \geq 0$, the nuclei $\sigma$ and $\Delta$ are stable under the depth-inclusion geometric morphism $f_n : R_n \to R_{n+1}$: the canonical natural transformations
$$
f_n^\ast \circ \sigma_{n+1} \xrightarrow{;\sim;} \sigma_n \circ f_n^\ast,
\qquad
f_n^\ast \circ \Delta_{n+1} \xrightarrow{;\sim;} \Delta_n \circ f_n^\ast
$$
are isomorphisms on $H|_{R_n}$. That is, every square in the depth tower satisfies the Beck-Chevalley condition for both nuclei.
Proof. Both nuclei are defined fiberwise on $H_t$ and reindexing along any morphism preserves nucleus structure by Axiom A2 (Preservation of Structure). The depth-inclusion $T^{(n)} \hookrightarrow T^{(n+1)}$ is a functor between sites, and $f_n^\ast$ is precomposition with this inclusion. Since $\sigma$ and $\Delta$ act fiberwise and the reindexing maps intertwine them (Axiom A2), the Beck-Chevalley squares commute strictly. ∎
Fischer-Rao Metric and Convergence {#fischer-rao}
Each fiber $H_t$ is finite, so the set of admissible nucleus pairs $\mathcal{N}(H_t) = {(\sigma_t, \Delta_t) \in \mathbf{HA_{nucl}}}$ is finite and discrete. However, the moduli space $\mathcal{M}_n$ can be embedded into a probability simplex by treating nucleus assignments as distributions: a stochastic nucleus family at depth $n$ is a probability distribution $p$ over $\mathcal{M}_n$. The space $\mathcal{P}(\mathcal{M}_n)$ of stochastic nucleus families is a simplex and carries a canonical Riemannian metric.
Theorem — Fischer-Rao metric. The unique Riemannian metric on $\mathcal{P}(\mathcal{M}n)$ invariant under all depth-restriction maps $\rho_n : \mathcal{M}{n+1} \to \mathcal{M}_n$ (viewed as Markov kernels between simplices) is the Fischer-Rao metric. This is the quantale-level analogue of Čencov's theorem (1982): the Fisher information metric is the unique metric invariant under sufficient statistics, and the depth-restriction maps are exactly the morphisms that preserve sufficient statistics for the nucleus distributions.
Convergence criterion. The depth tower of nucleus families converges — meaning the propositional dynamics stabilize as trace depth increases — if and only if the sequence of distributions $p_n \in \mathcal{P}(\mathcal{M}_n)$ induced by the GSU's nucleus family follows a geodesic in the Fischer-Rao metric. Equivalently, iterated application of $\sigma$ and $\Delta$ up the depth tower is natural-gradient descent in the Fischer-Rao metric on $\mathcal{P}(\mathcal{M}_n)$.
This gives both a correctness criterion — a proposed nucleus family for a GSU defines a convergent depth tower if and only if it is Fischer-Rao geodesic — and a convergence guarantee: any GSU satisfying the axioms whose nucleus family is geodesic will have propositional dynamics stabilizing at every depth.
---
Quasicrystalline Aperiodicity of the Fixed Strata {#quasicrystalline}
The invariant sheaf $H^\ast$ exhibits a form of aperiodic order analogous to that of quasicrystals: every local pattern of invariant data is finite and recurs throughout the trace category, yet the global invariant pattern has no nontrivial symmetry. All three properties are derived from the axioms; no additional hypothesis is assumed.
Theorem 3.4 — Quasicrystalline Aperiodicity {#thm-aperiodicity}
The invariant sheaf $H^\ast$ defines a pattern over $(T,J)$ with:
Local finiteness.
For each trace $t \in T$, the fiber $H_t^\ast$ is finite. For any finite diagram in $T$ and any finite family of covering morphisms into a vertex $t$, there are only finitely many compatible assignments of invariant elements over that diagram.
Local repetitiveness.
Any finite patch of invariant data—a compatible family of elements of $H^\ast$ over a finite diagram in $T$—appears in infinitely many places in $T$ up to isomorphism of diagrams.
Global aperiodicity.
There is no nontrivial automorphism $\alpha : T \xrightarrow{;\sim;} T$ preserving $J$ such that $\alpha^\ast H^\ast \cong H^\ast$ as sheaves of Heyting algebras. Equivalently, there is no non-identity global symmetry of the trace category that is invisible to the invariant modal data.
Thus the invariant pattern is locally finite and repetitive but globally aperiodic—a quasicrystal, not a lattice.
Proof.
Local finiteness.
Fix a trace $t$ and a finite diagram in $T$ whose vertices map into $t$ via a finite covering family. For each vertex $s$ the fiber $H_s^\ast$ is finite by Axiom A1. A compatible invariant assignment is a choice of one element from each finite set $H_s^\ast$ satisfying the reindexing equalities of Axiom A4 on all overlaps. Such assignments form a subset of a finite product of finite sets, hence are finite in number. ✓
Local repetitiveness.
Let $\mathcal{D}$ be a finite diagram in $T$ with a compatible invariant family $(a_s)_{s \in \mathcal{D}}$. By Axiom A0, $T$ is the free partially commutative monoid on its step alphabet: any finite diagram can be embedded into infinitely many larger traces by concatenating independent steps and normalizing. Formally, there exist infinitely many $t'\in T$ and morphism families from vertices of $\mathcal{D}$ into $t'$ making the relevant squares commute. Reindexing sends $(a_s)$ to compatible invariant families over each embedded copy. Thus the same local patch recurs infinitely often, up to diagram isomorphism. ✓
Global aperiodicity.
Suppose for contradiction that $\alpha : T \xrightarrow{;\sim;} T$ is a nontrivial automorphism preserving $J$ for which $\alpha^\ast H^\ast \cong H^\ast$ as sheaves of Heyting algebras. This is precisely the situation excluded by Axiom A2b (Relational Faithfulness): no nontrivial topology-preserving automorphism of $T$ is invisible to the invariant layer. Therefore $\alpha = \mathrm{id}_T$, contradicting the assumption that $\alpha$ is nontrivial. No such automorphism exists, and the invariant pattern carries no nontrivial global symmetry. ✓
Combining the three parts proves the theorem. $\square$
Remark — What the Nuclei Contribute {#remark-nuclei-aperiodicity}
The proof of Part 3 depends on Axiom A2b, which in turn rests on the fiberwise variation of the nuclear pair $(\sigma_t, \Delta_t)$. Global aperiodicity is not a geometric hypothesis imposed from outside; it is a consequence of the fact that the saturation nucleus and translation nucleus vary across fibers in a way that faithfully encodes the distinct relational histories of distinct traces. The nuclei are what make the universe aperiodic: they are the internal witnesses that each trace is genuinely different from every other.
A GSU with constant nuclear pair $(\sigma_t, \Delta_t) = (\sigma_0, \Delta_0)$ for all $t$ would satisfy A0–A6 but violate A2b: any automorphism of $T$ would be invisible to $H^\ast$, and the invariant layer would be maximally periodic. Axiom A2b is what converts aperiodicity from an assumption into a theorem.
---
Profiles as Internal Toposes {#profiles}
Finally, we introduce profiles: local regions of the GSU trace convolution
universe that themselves form small, internally complete generative sheaf universes.
Profile Sites {#profile-sites}
A profile site is a full subcategory $U \subseteq T$ equipped with
the induced topology $J!\restriction_U$ such that:
Fullness and isomorphism-closure.
If $t \in \mathrm{Ob}(U)$ and $t' \cong t$ in $T$, then
$t' \in \mathrm{Ob}(U)$. Every morphism in $T$ between objects of
$U$ lies in $U$.
Stability under covers.
If $t \in U$ and ${ u_i : t_i \to t }_{i \in I} \in J(t)$, then
this cover has a refinement by a family whose domains all lie in $U$.
In particular, any cover of $t$ can be “seen” inside $U$.
We write $(U, J!\restriction_U)$ for such a site.
---
Profile Toposes and Restriction of $H$ {#profile-toposes}
Given a profile site $(U, J!\restriction_U)$, define the profile topos
$$
R_U := \mathbf{Sh}(U, J!\restriction_U).
$$
Restricting the sheaf $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$
along the inclusion $U \hookrightarrow T$ yields a sheaf
$$
H_U : U^{\mathrm{op}} \to \mathbf{HA_{nucl}}, \qquad
H_U(t) := H_t,
$$
with reindexing maps inherited from those of $H$. Likewise, the
invariants restrict to a subsheaf $H_U^\ast \subseteq H_U$.
Theorem — Profiles as Small Internal Toposes {#thm-profiles}
For every profile site $(U, J!\restriction_U)$:
$R_U = \mathbf{Sh}(U, J!\restriction_U)$ is a topos.
$H_U \in R_U$ is an internal Heyting-modal algebra object
with fixed subobject $H_U^\ast \hookrightarrow H_U$, obtained by
restricting $H$ and $H^\ast$.
The inclusion of sites
$$
\iota : (U, J!\restriction_U) \hookrightarrow (T,J)
$$
induces a geometric morphism
$$
j_U : R_U \longrightarrow R.
$$
Its inverse image $j_U^\ast$ is given by restriction of sheaves
along $\iota$, and its direct image $j_{U\ast}$ extends sheaves
on $U$ (followed by sheafification).
The internal logic of $R_U$ with respect to $H_U$ is
exactly the restriction of the propositional-modal internal logic (FML) of
$R$ (with respect to $H$) to traces in $U$.
In particular, each profile $(R_U, H_U)$ is itself a Generative Sheaf Universe (GSU) in miniature, fully determined by the restriction of the global
structure to the traces in $U$.
---
Interpretation.
Theorems 3.1–3.2 show that the Generative Sheaf Universe is a well-defined,
canonical object: any two constructions from the same axioms are
equivalent, and all of the specified structure is preserved.
Theorem 3.3 equips $R$ with a canonical tensor that
intertwines the trace geometry and the fiberwise logic, justifying the
term trace convolution.
Theorem 3.4 formalizes a quasicrystalline picture for the invariant
stratum $H^\ast$: locally repetitive and finite, but globally
aperiodic.
Theorem 3.5 identifies profiles as local generative sheaf universes,
obtained by restricting to a full subsite $U$ and sheafifying there;
these communicate with the global universe via a geometric morphism.
Generative Universe Closure Mechanism {#closure-mechanism}
In this section we package the finitary structural vocabulary of the generative sheaf universe into a single closure operator on classes of objects and show:
the operator is a genuine closure operator on $P(\mathrm{Obj}(R))$,
the ambient universe $R$ is the least fixed point of this operator containing the atoms,
$(R,H)$ is initial among all models of Axioms A0–A6 satisfying the same generative laws.
---
Base Atoms and the Closure Operator {#base-atoms}
We work inside the generative sheaf universe
$$
R ;=; \mathbf{Sh}(T,J)
$$
constructed in Section 2, and write $\mathrm{Obj}(R)$ for its (proper) class of objects.
Foundational Convention {#foundational-convention}
We assume a background set theory with classes (for example, a Grothendieck universe or a von Neumann–Bernays–Gödel style framework) in which:
$\mathrm{Obj}(R)$ is a class,
$P(\mathrm{Obj}(R))$ denotes the class of all subclasses of $\mathrm{Obj}(R)$,
and all constructions below involving subclasses and intersections of subclasses are understood in this sense. No subtle size issues beyond this convention are used.
Atomic Class {#atomic-class}
For each trace $t \in \mathrm{Ob}(T)$, let
$$
y(t) ;:=; \mathrm{Hom}_T(-,t)
$$
denote the corresponding representable sheaf, and let $H \in R$ be the distinguished Heyting-modal object.
Define the atomic class
$$
A ;:=; {,y(t) \mid t \in \mathrm{Ob}(T),} ;\cup; {,H,}
;\subseteq; \mathrm{Obj}(R).
$$
These are the “seeds” from which we will generate the full generative sheaf universe.
Definition of the Closure Operator {#def-closure-operator}
Let $P(\mathrm{Obj}(R))$ be the class of all subclasses of $\mathrm{Obj}(R)$. Define
$$
U_G ;:; P(\mathrm{Obj}(R)) \longrightarrow P(\mathrm{Obj}(R)).
$$
For each subclass $X \subseteq \mathrm{Obj}(R)$, the subclass $U_G(X) \subseteq \mathrm{Obj}(R)$ is the smallest subclass satisfying all of the following:
Contains $X$ and the atoms.
$$
X \subseteq U_G(X), \qquad A \subseteq U_G(X).
$$
Closed under isomorphism.
If $A \in U_G(X)$ and $B \in \mathrm{Obj}(R)$ with $B \cong A$ in $R$, then $B \in U_G(X)$.
Closed under finite limits and colimits.
If $A,B \in U_G(X)$, then every object obtained as a vertex of a finite limit or finite colimit of a diagram built from $A$ and $B$ lies in $U_G(X)$. In particular, products, coproducts, equalizers, and coequalizers of objects in $U_G(X)$ are again in $U_G(X)$.
Closed under exponentials.
If $A,B \in U_G(X)$, then the exponential object $B^{A}$ (the internal function space) lies in $U_G(X)$.
Closed under subobjects.
If $A \in U_G(X)$ and $S \hookrightarrow A$ is a subobject in $R$, then $S \in U_G(X)$.
Closed under the distinguished structural operations $\mathcal{F}$.
Let $\mathcal{F}$ be the finite family of structural operations from Axiom A6 (e.g. fiberwise propositional operations, modal operators, trace‑induced tensor, etc.). Whenever an $n$-ary operation
$$
F \in \mathcal{F}
$$
is defined on objects of $R$ and we have inputs $A_1,\dots,A_n \in U_G(X)$, the result
$$
F(A_1,\dots,A_n)
$$
is required to lie in $U_G(X)$.
Closed under sheaf gluing and restriction to profile sites.
If $A \in U_G(X)$, then any object obtained by:
restricting $A$ along a profile site $(U,J|_U)$ via the inverse‑image part of the geometric morphism $\mathbf{Sh}(U,J|_U) \to R$, and then re‑viewed in $R$ via the corresponding direct image, or
gluing along a covering family in $J$ (i.e. forming the colimit that realizes sheaf gluing),
lies in $U_G(X)$.
Equivalently, $U_G(X)$ is the intersection of all subclasses $Y \subseteq \mathrm{Obj}(R)$ such that:
$X \cup A \subseteq Y$, and
$Y$ satisfies conditions (2)–(7) above.
This characterization ensures that $U_G(X)$ is uniquely determined.
---
Basic Properties of $U_G$ {#ug-properties}
We record the basic algebraic properties of the operator $U_G$.
Lemma — Monotonicity and Inflationarity {#lem-monotone}
For all subclasses $X,Y \subseteq \mathrm{Obj}(R)$:
If $X \subseteq Y$, then $U_G(X) \subseteq U_G(Y)$ (monotonicity).
$X \subseteq U_G(X)$ (inflationarity).
Proof.
Inflationarity is built into the definition: we explicitly require $X \subseteq U_G(X)$.
For monotonicity, suppose $X \subseteq Y$. Any subclass $Z \subseteq \mathrm{Obj}(R)$ that is closed under conditions (2)–(7) and contains $Y \cup A$ also contains $X \cup A$. Hence the intersection of all such subclasses for $X$ is contained in the intersection of all such subclasses for $Y$. That is, $U_G(X) \subseteq U_G(Y)$. $\square$
Lemma — Idempotence on Closed Classes {#lem-idempotent}
A subclass $X \subseteq \mathrm{Obj}(R)$ is called $U_G$-closed if $U_G(X) \subseteq X$. For any $U_G$-closed subclass $X$ we have
$$
U_G(X) = X.
$$
Proof.
If $X$ is $U_G$-closed, then by inflationarity we have $X \subseteq U_G(X)$, and by closedness we have $U_G(X) \subseteq X$. Thus $U_G(X) = X$. $\square$
Remark.
Combining Lemma 4.1 with the minimality in the definition of $U_G(X)$, one checks that $G(U_G(X)) = U_G(X)$ for all $X$, so $U_G$ is a closure operator on $P(\mathrm{Obj}(R))$ in the usual sense (inflationary, monotone, idempotent).
---
The Generated Subuniverse {#generated-subuniverse}
We now define the subuniverse generated by the atoms under $U_G$.
Definition — Generated Subclass {#def-generated}
Let $\mathcal{C}$ be the collection of all $U_G$-closed subclasses $X \subseteq \mathrm{Obj}(R)$ that contain the atomic class $A$. Define
$$
\mathrm{Obj}(R_{\mathrm{gen}}) ;:=;
\bigcap {, X \in \mathcal{C} \mid A \subseteq X,, U_G(X) \subseteq X ,}
;\subseteq \mathrm{Obj}(R).
$$
Thus $\mathrm{Obj}(R_{\mathrm{gen}})$ is the intersection of all $U_G$-closed subclasses of $\mathrm{Obj}(R)$ that contain $A$. We call the corresponding full subcategory $R_{\mathrm{gen}} \subseteq R$ the generated generated sub-universe.
Lemma — Generated Subclass Is $U_G$-Closed {#lem-generated-closed}
The subclass $\mathrm{Obj}(R_{\mathrm{gen}})$ is $U_G$-closed and contains $A$.
Proof.
Each $X \in \mathcal{C}$ is $U_G$-closed and contains $A$ by definition. Intersections of such subclasses preserve both properties: if each $X$ contains $A$, then so does $\bigcap X$; and if each $X$ is closed under conditions (2)–(7), then so is $\bigcap X$. Hence $\mathrm{Obj}(R_{\mathrm{gen}})$ is $U_G$-closed and $A \subseteq \mathrm{Obj}(R_{\mathrm{gen}})$. $\square$
Consequence.
$R_{\mathrm{gen}}$ is the least fixed point of $U_G$ that contains the atoms $A$: for any $U_G$-closed subclass $X \subseteq \mathrm{Obj}(R)$ with $A \subseteq X$, we have
$$
\mathrm{Obj}(R_{\mathrm{gen}}) \subseteq X.
$$
---
Self-Generation of the Generative Sheaf Universe {#self-generation}
We now show that the entire generative sheaf universe $R$ coincides with its generated subuniverse.
Theorem — Self-Generation {#thm-self-generation}
Up to isomorphism of objects,
$$
\mathrm{Obj}(R) ;=; \mathrm{Obj}(R_{\mathrm{gen}}).
$$
Equivalently, $\mathrm{Obj}(R_{\mathrm{gen}})$ is the least $U_G$-closed subclass of $\mathrm{Obj}(R)$ containing the atoms $A$, and it coincides with the full class of objects of $R$.
Proof.
$\mathrm{Obj}(R)$ is $U_G$-closed and contains $A$.
By construction, $R = \mathbf{Sh}(T,J)$ is closed under:
finite limits and colimits,
exponentials,
subobjects,
all distinguished structural operations in $\mathcal{F}$,
sheaf gluing and restriction along profile inclusions.
These are precisely the closure conditions used to define $U_G$, so $\mathrm{Obj}(R)$ is $U_G$-closed. It clearly contains all representables and $H$, hence $A \subseteq \mathrm{Obj}(R)$.
Minimality of $\mathrm{Obj}(R_{\mathrm{gen}})$.
By definition, $\mathrm{Obj}(R_{\mathrm{gen}})$ is the intersection of all $U_G$-closed subclasses of $\mathrm{Obj}(R)$ that contain $A$. Since $\mathrm{Obj}(R)$ itself is such a subclass, we have
$$
\mathrm{Obj}(R_{\mathrm{gen}}) \subseteq \mathrm{Obj}(R).
$$
Every object of $R$ is generated from atoms.
Every sheaf in $R=\mathbf{Sh}(T,J)$ is, up to isomorphism, a colimit of sums of representables, followed by sheafification. (This is the density theorem for Grothendieck toposes: the representable sheaves ${y(t)}_{t \in T}$ form a small dense generating set of $R$; see Johnstone, Sketches of an Elephant, Theorem C2.2.7.) Representables lie in $A$, and:
formation of sums and colimits is among the closure conditions for $U_G$;
sheafification can be expressed using colimits and subobjects, which are also among the closure conditions.
Therefore any sheaf can be built from representables using only the closure operations encoded by $U_G$. In particular, for every object
$$
A_0 \in \mathrm{Obj}(R)
$$
there exists some subclass $X$ with $A \subseteq X$ such that $A_0 \in U_G(X)$. By definition of $R_{\mathrm{gen}}$, such an $A_0$ must then lie in $\mathrm{Obj}(R_{\mathrm{gen}})$. Hence
$$
\mathrm{Obj}(R) \subseteq \mathrm{Obj}(R_{\mathrm{gen}}).
$$
Combining the two inclusions yields
$$
\mathrm{Obj}(R) = \mathrm{Obj}(R_{\mathrm{gen}}).
$$
$\square$
Interpretation.
Given the trace site, the representables, the distinguished object $H$, and the allowed constructions (limits, colimits, exponentials, subobjects, structural operations, gluing and restriction), you generate exactly the objects of $R$ and nothing more. There is no additional structure in $R$ that lies outside the reach of the generative universe closure $U_G$.
---
Initiality {#initiality}
We finally express that the generative sheaf universe is initial among all models of Axioms A0–A6.
Definition — GSU Model {#def-gsu-model}
Consider a category whose objects are “GSU models” of A0–A6.
A GSU model consists of:
a topos $S$,
an internal object $K \in S$,
internal modal operators
$$
\sigma_S,\Delta_S : K \to K,
$$
an fixed subobject $K^* \hookrightarrow K$,
a family of representable‑like objects realizing a site $(T,J)$ inside $S$,
such that the internal structure of $(S,K,\sigma_S,\Delta_S,K^*)$ realizes Axioms A0–A6 in the evident way (there is an internal trace category matching $T$, an internal sheaf‑like object analogous to $H$, the same distinguished operations, and the same generative closure behavior as in Axiom A6).
A morphism between two GSU models is a geometric morphism of topoi together with structure isomorphisms that:
preserve the distinguished object, modalities, and fixed subobject up to isomorphism,
send the atomic class of one model to that of the other,
respect the closure mechanism implicit in A6 (i.e. commute with the structural operations corresponding to $U_G$).
Informally: morphisms are structure‑preserving maps that see both the ambient topos and the propositional-modal object.
Theorem — Initiality {#thm-initiality}
Let
$$
(R,H,\sigma,\Delta,H^*)
$$
be the generative sheaf universe constructed from A0–A6 as in Sections 2–3. Then:
For any GSU model
$$
(S,K,\sigma_S,\Delta_S,K^)
$$
realizing the same trace site and satisfying A0–A6, there exists a unique (up to isomorphism) structure‑preserving morphism
$$
F : (R,H,\sigma,\Delta,H^) \longrightarrow (S,K,\sigma_S,\Delta_S,K^*)
$$
in the GSU-model category.
Equivalently, $(R,H)$ is initial among all GSU models of A0–A6.
Proof.
Let $(S,K,\sigma_S,\Delta_S,K^\ast)$ be any GSU model based on the same trace site $(T,J)$. By Definition 4.4, $S$ contains:
objects corresponding to each representable $y(t)$ of $R$, and
an object $K$ with modalities $\sigma_S,\Delta_S$ and fixed subobject $K^\ast$
such that all GSU axioms (A0–A6) hold internally in $S$ for these images. In particular, there is a distinguished atomic class
$$
A_S ;:=; {\text{images of }y(t)} \cup {K}
$$
in $S$ which satisfies exactly the same structural laws as the atomic class $A$ in $R$.
Definition of $F$ on atoms.
Define $F$ on the atomic class $A$ by sending:
each representable $y(t)$ in $R$ to the corresponding representable‑like object in $S$ realizing the same trace $t$,
the distinguished object $H$ in $R$ to the distinguished object $K$ in $S$.
On these, set $F$ to act as the identity on all structure: reindexing functors, modal operators, and invariant inclusions are preserved by hypothesis.
Extension by generativity.
By Theorem 4.4, every object of $R$ lies in the generated subclass $\mathrm{Obj}(R_{\mathrm{gen}})$, the least subclass of $\mathrm{Obj}(R)$ closed under:
finite limits and colimits,
exponentials,
subobjects,
the distinguished operations in $\mathcal{F}$,
sheaf gluing and restriction along profile inclusions,
and containing the atoms $A$. The same closure conditions define a generative operator on $S$ applied to $A_S$.
Because each of these constructions is characterized by a universal property (product, coproduct, equalizer, coequalizer, exponential, subobject, sheafification, restriction and gluing), any assignment of the atoms that respects the relevant structure extends uniquely to a functor
$$
F : R_{\mathrm{gen}} \longrightarrow S
$$
which:
preserves all finite limits and colimits,
preserves exponentials and subobjects,
commutes with all operations in $\mathcal{F}$,
respects restriction and gluing.
Since $R_{\mathrm{gen}}$ has the same objects as $R$, we obtain a functor $F : R \to S$ defined on all objects and arrows of $R$.
Geometric morphism and preservation of GSU structure.
The functor $F$ preserves finite limits and small colimits and sends representables in $R$ to representables in $S$, so by general topos theory it is the inverse‑image part of a geometric morphism of topoi
$$
j : S \longrightarrow R.
$$
By construction, $F(H) \cong K$ and $F$ transports all fiberwise operations on $H$ (Heyting algebra lattice, $\sigma,\Delta$, fixed subobject) to the corresponding operations on $K$. Thus $F$ is a morphism of GSU models in the sense of Definition 4.4.
Uniqueness.
Suppose $F' : R \to S$ is any other structure‑preserving functor between GSU models. Then $F'$ must agree with $F$ on the atomic class $A$, since it must send each representable and $H$ to objects in $S$ satisfying the same laws, and these images are fixed by the definition of GSU model. Because every object of $R$ lies in the $U_G$-closure of $A$, and $F',F$ both preserve all the closure operations, they must coincide on all of $R$. Thus the induced morphism in the GSU-model category is unique up to isomorphism.
Therefore $(R,H)$ is initial among GSU models of A0–A6. ∎
Interpretation.
Axioms A0–A6 define a notion of GSU model. There is a canonical such model $(R,H)$ built as sheaves on the trace site, and:
the generative universe closure operator $U_G$ shows that every object in $R$ arises from the allowed operations (self‑generation),
initiality says that any other GSU model is obtained via a unique structure‑preserving “evaluation” of this canonical one.
So the generative sheaf universe is not only self‑generated; it is the universal self‑generated model of the theory A0–A6.
---
Syntactic GSU Model {#syntactic-model}
The previous results show that, once a Generative Sheaf Universe $(R,H,\sigma,\Delta,H^\ast)$ exists, it is completely determined by its primitive data and is initial among all GSU models. We now give an explicit syntactic construction of such a model: a “term model” built purely from the GSU signature and axioms.
This construction proceeds in two layers:
a syntactic trace site $(T_{\mathrm{syn}}, J_{\mathrm{syn}})$, and
a syntactic recognizer sheaf $H_{\mathrm{syn}} : T_{\mathrm{syn}}^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ whose fibers are Lindenbaum–Tarski algebras of FML formulas.
Together these yield a canonical generative sheaf universe
$$
R_{\mathrm{syn}} \coloneqq \mathbf{Sh}(T_{\mathrm{syn}}, J_{\mathrm{syn}}),
\qquad
H_{\mathrm{syn}} \in R_{\mathrm{syn}},
$$
which realizes the theory on the nose.
Syntactic Trace Site {#syntactic-trace-site}
Fix once and for all:
a (possibly infinite, but fixed) set $\Sigma$ of step symbols, and
a symmetric independence relation $I \subseteq \Sigma \times \Sigma$.
Define the syntactic trace category $T_{\mathrm{syn}}$ as follows.
Objects are finite words $w = a_1 \dots a_n$ in $\Sigma$ modulo the smallest congruence generated by:
independence commutations: if $(a_i,a_{i+1}) \in I$, then
$$
\dots a_i a_{i+1} \dots ;\sim; \dots a_{i+1} a_i \dots;
$$
neutral deletions: if a symbol $e \in \Sigma$ is declared neutral, then inserting or deleting $e$ does not change the word;
rebracketing: parentheses are ignored up to the associativity of concatenation.
We write the equivalence class of a word $w$ as $[w]$ and call such classes syntactic traces.
Morphisms are normalization sequences: a morphism
$$
f : [w] \longrightarrow [w']
$$
is represented by a finite sequence of commutation, deletion, and rebracketing moves transforming $w$ to a representative of $w'$. Composition is concatenation of normalization sequences, modulo the usual laws of rewriting-system composition, and identities are empty sequences.
By standard rewriting-system arguments (using that commutations and deletions form a terminating, locally confluent system once an orientation and a length/lexicographic measure are fixed), one may choose a canonical normal form $\mathrm{NF}{\mathrm{syn}}(w)$ in each equivalence class and identify objects of $T{\mathrm{syn}}$ with these normal forms. This realizes Axiom A0 for $T_{\mathrm{syn}}$: objects are traces in the free partially commutative monoid on $(\Sigma,I)$, and morphisms are normalizations.
Next, define a Grothendieck topology $J_{\mathrm{syn}}$ on $T_{\mathrm{syn}}$ generated by independence covers:
for a trace $t$ and a partition of its underlying word into commuting subwords
$$
t ;\simeq; t^{(1)} \cdot \dots \cdot t^{(n)},
$$
declare the family of inclusions
$$
u_i : t^{(i)} \hookrightarrow t \xrightarrow{\mathrm{NF}_{\mathrm{syn}}} t
$$
to be a covering family of $t$.
Closing these generators under isomorphism, pullback, and composition yields a Grothendieck topology $J_{\mathrm{syn}}$. By construction, $(T_{\mathrm{syn}},J_{\mathrm{syn}})$ satisfies Axioms A0 and A3.
Syntactic Fibers and Modalities {#syntactic-fibers}
Consider the core fiber modal language $\mathrm{FML}_0$ of Axiom A5 with base type $\mathsf{Prop}$, products, and arrows, and logical/modal term formers
$$
M \wedge N,\ M \vee N,\ M \Rightarrow N,\
\mathsf{True},\ \mathsf{False},\
\mathsf{Sat}(M),\ \mathsf{Trans}(M).
$$
For each syntactic trace $t \in T_{\mathrm{syn}}$, define:
the set $\mathrm{Form}_t$ of closed $\mathsf{Prop}$-terms at trace $t$: FML$_0$-terms of type $\mathsf{Prop}$ with empty context, indexed by $t$;
a provability relation $\vdash_t M = N : \mathsf{Prop}$ given by the λ-calculus’s equational theory (βη-laws) plus the propositional-modal axioms of Axiom A1 and the commutation laws of Axiom A2.
Define the Lindenbaum–Tarski algebra
$$
H^{\mathrm{syn}}_t ;\coloneqq; \mathrm{Form}_t \big/ {\equiv_t},
$$
where $M \equiv_t N$ iff $\vdash_t M = N : \mathsf{Prop}$. Write $[M]_t$ for the equivalence class of $M$.
The operations on $H^{\mathrm{syn}}_t$ are induced syntactically:
$[M]_t \wedge_t [N]_t \coloneqq [M \wedge N]_t$,
$[M]_t \vee_t [N]_t \coloneqq [M \vee N]_t$,
$[M]_t \Rightarrow_t [N]_t \coloneqq [M \Rightarrow N]_t$;
$\bot_t \coloneqq [\mathsf{False}]_t$, $\top_t \coloneqq [\mathsf{True}]_t$;
$\sigma_t([M]_t) \coloneqq [\mathsf{Sat}(M)]_t$,
$\Delta_t([M]_t) \coloneqq [\mathsf{Trans}(M)]_t$.
Quotienting by provable equality ensures that all equations of Axiom A1 hold in each $H^{\mathrm{syn}}_t$: the Heyting algebra laws for $\wedge,\vee,\Rightarrow,\bot,\top$ follow from the λ-calculus and its equational theory, and the saturation nucleus and translation nucleus axioms are imposed as equations on FML$_0$ terms. Thus each $(H^{\mathrm{syn}}t,\sigma_t,\Delta_t)$ is an object of $\mathbf{HA{nucl}}$.
Define the syntactic fixed fiber
$$
H^{\mathrm{syn},}_t
;\coloneqq;
{, [M]_t \in H^{\mathrm{syn}}_t \mid
\vdash_t \mathsf{Sat}(M) = M
\text{ and }
\vdash_t \mathsf{Trans}(M) = M ,}.
$$
By construction, $H^{\mathrm{syn},}_t$ is the subalgebra of elements provably fixed by both modalities.
For each morphism $f : t \to t'$ in $T_{\mathrm{syn}}$, reindexing on formulas is given syntactically: a normalization $f$ rearranging or deleting steps induces a translation on judgments $\Gamma \vdash_{t'} M : A \mapsto \Gamma \vdash_t M^f : A$ (change of trace index), and hence an algebra homomorphism
$$
H^{\mathrm{syn}}(f) : H^{\mathrm{syn}}{t'} \longrightarrow H^{\mathrm{syn}}t,\quad
[M]{t'} \longmapsto [M^f]t.
$$
This makes $t \mapsto H^{\mathrm{syn}}t$ and $f \mapsto H^{\mathrm{syn}}(f)$ into a functor
$$
H{\mathrm{syn}} : T{\mathrm{syn}}^{\mathrm{op}} \longrightarrow \mathbf{HA{nucl}}
$$
as in Axiom A2, and the fixed fibers $H^{\mathrm{syn},}_t$ assemble into a subpresheaf $H^{\mathrm{syn},} \subseteq H_{\mathrm{syn}}$.
By construction, the sheaf condition of Axioms A3–A4 for $H_{\mathrm{syn}}$ and $H^{\mathrm{syn},*}$ reduces to the usual locality and gluing properties of the syntactic equivalence relation (proofs glued from local proofs along coverings). Thus the syntactic data satisfy Axioms A1–A4.
Finally, the very λ-calculus FML$_0$ used to build the fibers provides the FML structure required in Axiom A5, and the list of primitive constructors in FML$0$ and in the syntactic description of traces yields the finitary structural family $\mathcal{F}$ of Axiom A6. Closing under the constructions of Section 4 then defines a syntactic generative operator $G{\mathrm{syn}}$.
The Syntactic GSU and Its Universal Property {#syntactic-gsu-universal}
Applying Definition 2.3.1 to the syntactic data
$$
(T_{\mathrm{syn}}, J_{\mathrm{syn}},
H_{\mathrm{syn}}, \sigma,\Delta, H^{\mathrm{syn},},
\mathrm{FML}0, \mathcal{F}, G{\mathrm{syn}})
$$
produces a Generative Sheaf Universe
$$
R_{\mathrm{syn}} \coloneqq \mathbf{Sh}(T_{\mathrm{syn}},J_{\mathrm{syn}})
$$
with distinguished object $H_{\mathrm{syn}} \in R_{\mathrm{syn}}$ and fixed subobject $H^{\mathrm{syn},} \hookrightarrow H_{\mathrm{syn}}$.
Given any GSU model $(S,K,\sigma_S,\Delta_S,K^\ast)$ in the sense of Definition 4.4, there is a canonical interpretation of the syntactic data inside $S$:
each syntactic trace $[w]$ is sent to the corresponding object of the internal trace category of $S$;
each FML$_0$ term $M : \mathsf{Prop}$ is interpreted as an internal arrow into $K$;
equations between terms become equalities of arrows in $S$;
the modalities $\mathsf{Sat},\mathsf{Trans}$ are interpreted as $\sigma_S,\Delta_S$.
By the universal property of sheafification and by Theorem 4.5, this interpretation extends uniquely to a structure‑preserving geometric morphism
$$
F : (R_{\mathrm{syn}},H_{\mathrm{syn}},\sigma,\Delta,H^{\mathrm{syn},*})
\longrightarrow (S,K,\sigma_S,\Delta_S,K^\ast).
$$
Thus the syntactic generative sheaf universe $(R_{\mathrm{syn}},H_{\mathrm{syn}})$ is an explicit representative of the initial object in the GSU-model category of Definition 4.4: it is the free—or term—model generated by the GSU signature and axioms.
Internal Geometry and Spectral Theory {#internal-geometry}
Throughout this section we work in a fixed Generative Sheaf Universe
$$
R = \mathbf{Sh}(T,J)
$$
with distinguished internal Heyting-modal object $H$ and fixed subsheaf
$$
H^\ast \hookrightarrow H
$$
as constructed from Axioms A0–A4. For each trace $t \in \mathrm{Ob}(T)$, write
$$
H_t \quad\text{for the fiber of } H,\qquad
H_t^\ast \subseteq H_t \quad\text{for the fixed fiber.}
$$

The Invariant Locale {#invariant-locale}
We turn the invariant propositions into an internal locale (an internal “phase space”) of the topos.
Recall:
$H$ is an internal Heyting algebra object of $R$.
$H^\ast \hookrightarrow H$ is the subsheaf of invariant elements (fixed by both the translation nucleus $\Delta$ and the nucleus $\sigma$), and each fiber $H_t^\ast$ is a finite propositional subalgebra of $H_t$.
In any topos, an internal (complete) Heyting algebra object canonically corresponds to the frame of opens of an internal locale. We apply this to $H^\ast$.
Definition — Invariant Locale {#def-phase-space}
The phase space of the Generative Sheaf Universe is the internal locale
$$
\mathsf{Phase}
$$
whose internal frame of opens is the fixed subsheaf $H^\ast$. Concretely:
View $H^\ast$ as an internal frame (complete Heyting algebra) object in $R$ by taking the internal completion of the finite propositional operations fiberwise and gluing them sheafily.
Let $\mathsf{Phase}$ be the (unique up to isomorphism) internal locale whose lattice of opens is this frame.
We write
$$
\mathcal{O}(\mathsf{Phase}) \coloneqq H^\ast.
$$
Thus:
generalized points of $\mathsf{Phase}$ correspond to frame homomorphisms into $H^\ast$;
an open subset of $\mathsf{Phase}$ is exactly an invariant proposition (an element of $H^\ast$).

Theorem — Phase Space Is Well-Defined and Stable {#thm-phase-space}
The fixed subsheaf $H^\ast \hookrightarrow H$ admits the structure of an internal complete Heyting algebra in $R$, and hence determines an internal locale $\mathsf{Phase}$ with
$$
\mathcal{O}(\mathsf{Phase}) = H^\ast.
$$
Moreover:
For each trace $t$, the fiber $H_t^\ast$ is finite and forms a finite distributive lattice (and in fact a finite Heyting algebra).
The assignment
$$
t \longmapsto H_t^\ast
$$
is compatible with reindexing and gluing, so $H^\ast$ is a sheaf of Heyting algebras. (This uses Axioms A2–A4.)
The internal completion needed to regard $H^\ast$ as a frame is functorial and preserved by the topos structure of $R$.
Consequently, the phase-space locale $\mathsf{Phase}$ is well-defined and stable under all GSU symmetries.
Proof.
For each trace $t$, the fixed fiber $H_t^\ast$ is, by Axiom A1, a finite Heyting algebra and hence a finite Heyting algebra. In particular, it is a finite frame: it has all finite meets and joins, and arbitrary joins exist because every subset of a finite set is finite. Axiom A4 states that the assignments
$$
t \longmapsto H_t^\ast,\qquad
f : t \to t' \longmapsto H^\ast(f) : H_{t'}^\ast \to H_t^\ast
$$
define a sheaf of Heyting algebras on $(T,J)$. Forgetting structure, this sheaf underlies an internal object $H^\ast$ of $R$ whose fibers carry frame structure and whose structure maps are frame homomorphisms.
Every internal frame in a topos corresponds (via internal frame–locale duality) to the lattice of opens of a unique (up to isomorphism) internal locale. Applying this to the internal frame completion of $H^\ast$ yields an internal locale $\mathsf{Phase}$ with
$$
\mathcal{O}(\mathsf{Phase}) \cong H^\ast,
$$
and we use this isomorphism to identify $H^\ast$ with $\mathcal{O}(\mathsf{Phase})$.
Stability under reindexing and gluing is built into the definition of $H^\ast$: Axiom A4 guarantees that the subobject $H^\ast \hookrightarrow H$ is preserved by all restriction functors induced from morphisms in $T$, and that invariant sections glue along covers. Any GSU symmetry of $(T,J,H,\sigma,\Delta)$ therefore induces an internal frame automorphism of $H^\ast$, and hence a locale automorphism of $\mathsf{Phase}$ preserving its structure. This proves the theorem. ∎
Interpretation.
The locale $\mathsf{Phase}$ is the internal “space of stable states”:
each invariant proposition is an open region of this space;
the propositional structure on $H^\ast$ gives unions, intersections, and implications between such regions;
everything is internal to $R$: $\mathsf{Phase}$ lives entirely inside the generative sheaf universe.

Internal Dynamics on Phase Space {#internal-dynamics}
We now capture “dynamics” as an internal endomorphism of the phase locale $\mathsf{Phase}$.
Recall:
The flow
$$
\Delta : H \to H
$$
is a natural endomorphism of the full sheaf $H$.
On invariants, $\Delta$ is the identity fiberwise: by definition, $a \in H_t^\ast$ satisfies
$$
\Delta_t(a) = a.
$$
The nucleus $\sigma : H \to H$ is a closure operator whose fixed points are precisely the invariant elements, so $a \in H_t^\ast$ also satisfies
$$
\sigma_t(a) = a.
$$
The inclusion $H^\ast \hookrightarrow H$ is a monomorphism in $R$, and each invariant element lives simultaneously in $H^\ast$ and $H$.
We define an internal “successor” operator on $\mathsf{Phase}$ via the interaction of $\Delta$, $\sigma$, and the inclusion $H^\ast \hookrightarrow H$.
Definition — Induced Dynamics {#def-induced-dynamics}
Define an internal locale endomorphism
$$
T : \mathsf{Phase} \longrightarrow \mathsf{Phase}
$$
by specifying its action on opens
$$
T^\sharp : \mathcal{O}(\mathsf{Phase}) = H^\ast \longrightarrow H^\ast
$$
as follows.
For an invariant open $U \in H^\ast$, regarded as an element of $H$ via inclusion, set
$$
T^\sharp(U) \coloneqq \sigma(\Delta(U)) \in H,
$$
and then restrict back to the fixed subsheaf. Because $U$ is invariant, we have
$$
\Delta(U) = U, \qquad \sigma(U) = U,
$$
so
$$
T^\sharp(U) = U
$$
for all $U \in H^\ast$. Equivalently, $T^\sharp = \mathrm{id}_{H^\ast}$, and the corresponding locale map $T : \mathsf{Phase} \to \mathsf{Phase}$ fixes all invariant opens.
At the level of generalized points $x : 1 \to \mathsf{Phase}$, one can additionally define an internal transition relation
$$
x \leadsto y
$$
by examining how non-invariant propositions in $H$ evolve under repeated application of $\sigma$ and $\Delta$ and then pass to their invariant limits; this is optional structure and not needed for the subsequent theorems, but it aligns with the intended interpretation of $\mathsf{Phase}$ as a dynamical phase space.
Definition — Stabilization Map {#def-stabilization-map}
Define the stabilization map
$$
\mathsf{Sat} : H \longrightarrow H^\ast
$$
by sending each proposition $a \in H$ to its invariant limit under iterated application of $\sigma$ and $\Delta$; equivalently, $\mathsf{Sat}(a)$ is the least element of $H^\ast$ lying above the orbit of $a$ under the monoid generated by $\sigma$ and $\Delta$. This is a definable internal map (no new axiom) giving a canonical projection from the full propositional object $H$ to the invariant layer $H^\ast$.

Theorem — Stability and Monotonicity {#thm-stability}
The induced operator $T$ on $\mathsf{Phase}$ has the following properties (equivalently, its frame map $T^\sharp : H^\ast \to H^\ast$ does):
Monotonicity.
If $U \subseteq V$ in $H^\ast$, then
$$
T^\sharp(U) \subseteq T^\sharp(V).
$$
Idempotence on invariant opens.
For all $U \in H^\ast$,
$$
T^\sharp(U) = U.
$$
Compatibility with the frame structure.
The map $T^\sharp$ preserves finite meets and arbitrary joins in $H^\ast$.
Proof.
By definition, $T^\sharp(U) = \sigma(\Delta(U))$ with $U$ viewed as an element of $H^\ast \subseteq H$.
Monotonicity.
If $U \subseteq V$ in $H^\ast$, then internally $U \leq V$ in the order on $H$. Axiom A1 states that both $\Delta$ and $\sigma$ are monotone endomorphisms of $H$, so
$$
U \leq V ;\Rightarrow;
\Delta(U) \leq \Delta(V) ;\Rightarrow;
\sigma(\Delta(U)) \leq \sigma(\Delta(V)).
$$
Hence $T^\sharp(U) \leq T^\sharp(V)$, i.e. $T^\sharp$ is monotone.
Idempotence on invariant opens.
For any $U \in H^\ast$ we have $\Delta(U) = U$ and $\sigma(U) = U$ by definition of invariance. Therefore
$$
T^\sharp(U) = \sigma(\Delta(U)) = \sigma(U) = U,
$$
so $T^\sharp$ acts as the identity on $H^\ast$.
Preservation of frame structure.
The internal endomorphisms $\sigma,\Delta : H \to H$ preserve finite meets and arbitrary joins in each fiber by Axiom A1, and the composite of such endomorphisms does as well. Restricting along the inclusion $H^\ast \hookrightarrow H$ shows that $T^\sharp$ preserves finite meets and arbitrary joins on $H^\ast$.
All three properties follow directly from the axioms, proving the claim. ∎
Interpretation.
The invariants form a genuine “space” $\mathsf{Phase}$.
The GSU structure induces a canonical (albeit trivial on opens) notion of evolution on this space.
Invariant opens are stable under this evolution.
In concrete instantiations one may refine $T$ to a nontrivial transition kernel (e.g. Markov-type, gradient-like, or other dynamical systems) defined internally from $H$, $\Delta$, and $\sigma$, but the abstract specification only requires the stability and frame-compatibility properties above.

Spectral Theory {#spectral-theory}
The invariant locale $\mathsf{Phase}$ gives a space of stable configurations. We now introduce a mild internal spectral calculus:
linearize the invariant lattice into a sheaf of $K$-modules,
define a natural “deviation” operator measuring departure from invariance,
state a spectral decomposition theorem, both fiberwise and internally.

Linearization of Invariants {#linearization}
Fix a commutative ring $K$ (for example $K = \mathbb{R}$) and let
$$
\overline{K}
$$
denote the constant sheaf in $R$ with value $K$.
For each trace $t \in \mathrm{Ob}(T)$:
the finite set $H_t^\ast$ may be regarded as a basis;
define the free $K$-module
$$
V_t \coloneqq K^{H_t^\ast},
$$
the $K$-valued functions on $H_t^\ast$, or equivalently the free $K$-module with basis indexed by $H_t^\ast$.
These fibers assemble into a presheaf and in fact a sheaf:
Definition — Sheaf of Invariant Modes {#def-invariant-modes}
Define a presheaf
$$
V : T^{\mathrm{op}} \longrightarrow \mathbf{Mod}_K
$$
by:
on objects:
$$
V(t) \coloneqq V_t = K^{H_t^\ast};
$$
on morphisms: for $f : t \to t'$ in $T$, let
$$
V(f) : V(t') \longrightarrow V(t)
$$
be given by precomposition with the induced map
$$
H_{t'}^\ast \longrightarrow H_t^\ast
$$
coming from the reindexing of invariants (Axiom A4).
Because $H^\ast$ is a sheaf and each fiber $H_t^\ast$ is finite, this presheaf satisfies the sheaf condition and yields an internal $K$-module object
$$
V
$$
in $R$. We call $V$ the sheaf of invariant modes.

Defect Operator {#defect-operator}
We now define an internal operator that measures defect from fixedness on the linearized level. Intuitively:
elements of $H^\ast$ are “ideally stable”;
the translation nucleus $\Delta$ and saturation nucleus $\sigma$ drive propositions toward these fixed elements;
the defect operator measures how far a configuration is from being fully stabilized by $\sigma$ and $\Delta$.
Definition — Defect Operator {#def-defect}
For each trace $t$, choose a $K$-linear map
$$
\delta_t : V_t \longrightarrow V_t
$$
subject to the following conditions:
Naturality in $t$.
For every morphism $f : t \to t'$ in $T$, the square
$$
\begin{tikzcd}
V(t') \arrow[r,"\delta_{t'}"] \arrow[d,"V(f)"'] & V(t') \arrow[d,"V(f)"] \
V(t) \arrow[r,"\delta_t"'] & V(t)
\end{tikzcd}
$$
commutes inside $R$.
Vanishing on invariant directions.
If a vector in $V_t$ corresponds (via the basis $H_t^\ast$) to a uniform “fixed” pattern that is stabilized under the actions induced by $\sigma_t$ and $\Delta_t$, then
$$
\delta_t(\text{that vector}) = 0.
$$
In particular, fully stabilized modes have zero defect.
Dependence on $\sigma_t$ and $\Delta_t$.
Each $\delta_t$ is determined functorially by the action of $\sigma_t$ and $\Delta_t$ on $H_t^\ast$ (possibly together with a choice of weights on relations between fixed modes).
Such a family $(\delta_t)_{t\in \mathrm{Ob}(T)}$ is called a defect operator for the generative sheaf universe.
Given such a natural family, we obtain an internal $K$-linear endomorphism
$$
\delta : V \longrightarrow V
$$
in the universe $R$, called the defect operator. The specification does not fix a single concrete formula for $\delta$; it only requires that $\delta$ be natural, internally defined from the fixed structure and the saturation–translation nucleus behavior, and satisfy the conditions above.
Definition — Defect-Mode GSU {#def-defect-mode-gsu}
A defect‑mode generative sheaf universe is a Generative Sheaf Universe $(R,H,\sigma,\Delta,H^\ast)$ together with:
a commutative ground field $K$,
the associated sheaf $V$ of fixed modes (Definition 5.5), and
a defect operator $\delta : V \to V$ in the sense of Definition 5.6.
All defect‑mode results in Section 5.3 and Theorems 5.7–5.8 are understood to hold in this enriched setting.

Defect Mode Decomposition {#defect-decomposition}
We now formulate a defect mode decomposition theorem at two levels:
fiberwise: each $\delta_t$ is a finite-dimensional endomorphism of a $K$-module, so standard linear algebra applies;
internal: these fiberwise decompositions assemble into an internal direct-sum decomposition of the sheaf $V$.
To avoid measure-theoretic complications, we impose a mild algebraic assumption.
Standing assumption (Diagonalizability).
For each trace $t$, the $K$-linear operator
$$
\delta_t : V_t \to V_t
$$
is diagonalizable. For example, this holds if $K$ is algebraically closed of characteristic $0$ and suitable symmetry conditions are imposed.

Theorem — Fiberwise Defect Mode Decomposition {#thm-defect-fiberwise}
Under the diagonalizability assumption, for each trace $t$:
There exists a basis of $V_t$ consisting of eigenvectors of $\delta_t$.
There is a direct-sum decomposition
$$
V_t ;\cong; \bigoplus_{\lambda \in \Lambda_t} E_{t,\lambda},
$$
where
$\Lambda_t \subseteq K$ is the finite set of eigenvalues of $\delta_t$,
$E_{t,\lambda}$ is the eigenspace corresponding to the eigenvalue $\lambda$.
The eigenspace corresponding to eigenvalue $\lambda = 0$ contains (and under mild conditions is spanned by) the directions that represent fully stabilized invariant modes.
Proof.
Fix a trace $t$. The module $V_t$ is by definition the free $K$-module on the finite basis $H_t^\ast$, so $\dim_K(V_t) = |H_t^\ast| < \infty$. The operator $\delta_t : V_t \to V_t$ is linear, and by the standing diagonalizability assumption there exists a basis of $V_t$ consisting entirely of eigenvectors of $\delta_t$. This immediately yields a decomposition
$$
V_t ;\cong; \bigoplus_{\lambda \in \Lambda_t} E_{t,\lambda},
$$
where $\Lambda_t$ is the (finite) spectrum of $\delta_t$ and $E_{t,\lambda}$ the corresponding eigenspaces. These statements are standard consequences of finite-dimensional eigen‑decomposition theory for diagonalizable operators.
By condition (2) in Definition 5.6, $\delta_t$ vanishes on any vector representing a fully fixed pattern (in particular on the constant functions on $H_t^\ast$), so such vectors lie in the kernel of $\delta_t$, which is the eigenspace for eigenvalue $0$. In many concrete choices of $\delta_t$ that arise from $\sigma_t$ and $\Delta_t$, the characterization “vanishes exactly on fixed directions” ensures that $E_{t,0}$ is spanned by these fixed patterns, yielding the final claim. ∎

Theorem — Internal Defect-Mode Sheaf {#thm-defect-sheaf}
The fiberwise decompositions of Theorem 5.7 assemble into an internal decomposition of the sheaf $V$. More precisely:
For each eigenvalue $\lambda \in K$, the assignment
$$
t \longmapsto E_{t,\lambda}
$$
together with the reindexing maps induced from $V(f)$ defines a subpresheaf (and hence a subsheaf)
$$
E_\lambda \subseteq V.
$$
There is an internal direct-sum decomposition in $R$:
$$
V ;\cong; \bigoplus_{\lambda \in \Lambda} E_\lambda,
$$
where $\Lambda$ is the internal set (or family) of eigenvalues realized across the site.
The zero-eigenvalue subsheaf $E_0$ corresponds to the stable mode sheaf: its sections encode fixed modes (no defect under $\delta$), while the other $E_\lambda$ encode oscillatory or decaying modes.
Proof.
For each eigenvalue $\lambda \in K$, define a presheaf
$$
E_\lambda : T^{\mathrm{op}} \longrightarrow \mathbf{Mod}K
$$
by setting
$$
E\lambda(t) \coloneqq E_{t,\lambda} \subseteq V_t,
$$
and, for a morphism $f : t \to t'$ in $T$, letting
$$
E_\lambda(f) : E_\lambda(t') \longrightarrow E_\lambda(t)
$$
be the restriction of $V(f)$. Naturality of $D$ implies that if $x \in E_{t',\lambda}$ satisfies $\delta_{t'}(x) = \lambda x$, then
$$
\delta_t\bigl(V(f)(x)\bigr)
= V(f)\bigl(\delta_{t'}(x)\bigr)
= V(f)(\lambda x)
= \lambda,V(f)(x),
$$
so $V(f)(x) \in E_{t,\lambda}$ and the restriction is well-defined.
Because each $E_{t,\lambda}$ is a linear subspace of the finite-dimensional space $V_t$, described by linear equations involving $\delta_t$, the sheaf condition for $V$ and the naturality of $\delta$ imply that compatible local families of eigenvectors over a cover glue uniquely to global eigenvectors. Therefore each $E_\lambda$ is a subsheaf of $V$.
Fiberwise, Theorem 5.7 gives a decomposition $V_t \cong \bigoplus_{\lambda \in \Lambda_t} E_{t,\lambda}$. The naturality of these decompositions in $t$ (again using naturality of $\delta$ and of the eigenspace inclusions) ensures that they assemble into an internal direct-sum decomposition
$$
V ;\cong; \bigoplus_{\lambda \in \Lambda} E_\lambda
$$
in the universe $R$, where $\Lambda$ indexes the eigenvalues realized across the site. The description of $E_0$ as the stable mode sheaf is just the global version of the fiberwise fact that fixed patterns lie in the kernel of $\delta_t$. ∎

Interpretation.
Fixed propositions are opens of the internal space $\mathsf{Stability}$.
We linearize these fixed propositions into a sheaf $V$ of $K$-modules.
The defect operator $\delta$ measures how internal quantities “pull away” from the active fixed layer.
Under mild algebraic hypotheses, $\delta$ admits a defect‑mode decomposition:
zero modes correspond to fully stabilized behaviors,
nonzero modes encode oscillatory components, decay rates, or other dynamical characteristics.
All of this is completely internal to $R$; no external metric or analytic structure is required. Someone working in harmonic analysis, stochastic processes, or dynamical systems can reinterpret $\delta$ and its spectrum in their own idiom, but the Generative Sheaf Universe specification only demands the existence of such a natural finite-dimensional defect operator and its mode sheaves.
---
Derivation Property of $\delta$ and the Graded Mode Algebra {#derivation-graded}
The spectral decomposition $V \cong \bigoplus_{\lambda \in \Lambda} E_\lambda$
acquires additional algebraic structure when the defect operator $\delta$ is
compatible with the monoidal structure on $R$. We now make this compatibility
precise and derive its consequences for the eigenspace sheaves.
The Fiberwise Algebra Structure on $V$
Each fiber $V_t = K^{H^\ast_t}$ carries a $K$-algebra structure with
pointwise multiplication induced by the meet operation of $H^\ast_t$:
$$
(f \cdot g)(a) \coloneqq f(a) \cdot_{K} g(a),
\qquad f, g \in V_t,; a \in H^\ast_t.
$$
This is compatible with reindexing: if $f : s \to t$ is a morphism in $T$,
then $V(f) : V_t \to V_s$ is a $K$-algebra map since $H(f) : H^\ast_t \to H^\ast_s$
preserves meets. Thus $V$ is an internal $K$-algebra in $R$.
Standing Assumption — Derivation Condition {#derivation-assumption}
We impose the following condition on the defect operator $\delta : V \to V$:
for each $t \in \mathrm{Ob}(T)$ and all $f, g \in V_t$,
$$
\delta_t(f \cdot g)
;=;
\delta_t(f) \cdot g + f \cdot \delta_t(g).
$$
That is, each $\delta_t$ is a $K$-linear derivation of the $K$-algebra $V_t$.
Equivalently, $\delta : V \to V$ is a derivation of the internal $K$-algebra
object $V$ in $R$.
Remark. This condition is not automatic from naturality and linearity of
$\delta$ alone; it is an additional compatibility between the modal geometry
(which determines $\delta$) and the algebraic structure (which determines the
multiplication). When $\delta_t$ is chosen as the graph Laplacian of the Hasse
diagram of $H^\ast_t$ — a natural concrete choice — the derivation condition
places a constraint on the graph: it holds when the Hasse graph has the
structure of a graded poset whose grading is consistent with the ring of $K$-valued
functions. In the quasicrystalline setting, the local repetitiveness of $H^\ast$
ensures this consistency holds generically.
Proposition — Graded Algebra Structure on the Spectral Decomposition {#prop-graded-algebra}
Assume the Derivation Condition above. Then:
Eigenspaces are multiplicatively closed under convolution:
$$
E_\lambda \cdot E_\mu ;\subseteq; E_{\lambda + \mu}
$$
for all $\lambda, \mu \in \Lambda$. That is, the spectral decomposition
$V \cong \bigoplus_{\lambda \in \Lambda} E_\lambda$ is a $\Lambda$-graded
$K$-algebra, where $\Lambda \subseteq K$ carries the additive structure
induced by eigenvalue addition.
$V$ is an internal differential graded $K$-algebra:
$(V, \cdot, \delta)$ is an internal DG $K$-algebra in $R$, with
$\delta$ as differential (satisfying $\delta^2 = 0$ on each graded piece
when $\mathrm{char}(K) \neq 2$, or the appropriate graded-commutativity condition
in general).
Cohomological grading of the stable mode sheaf:
The zero-eigenspace $E_0$ is a sub-$K$-algebra of $V$, and each $E_\lambda$
is an $E_0$-module. The Künneth formula then applies to compute
cohomology of tensor products: for sheaves $E_\lambda, E_\mu$ over $(T,J)$,
$$
H^n(T, J;; E_\lambda \otimes_K E_\mu)
;\cong;
\bigoplus_{p+q=n} H^p(T,J;, E_\lambda) \otimes_K H^q(T,J;, E_\mu)
$$
under the flatness assumption of the following section.
Proof. For (1): let $f \in (E_\lambda)t$ and $g \in (E\mu)t$, so
$\delta_t(f) = \lambda f$ and $\delta_t(g) = \mu g$. By the Derivation Condition,
$$
\delta_t(f \cdot g) = \delta_t(f) \cdot g + f \cdot \delta_t(g)
= \lambda f \cdot g + f \cdot \mu g = (\lambda + \mu)(f \cdot g),
$$
so $f \cdot g \in (E{\lambda+\mu})t$. This holds for all $t$ and is compatible
with reindexing (since both $\delta$ and multiplication are natural), hence
$E\lambda \cdot E_\mu \subseteq E_{\lambda+\mu}$ as subsheaves.
For (2): $\delta$ is $K$-linear and satisfies the Leibniz rule by assumption,
which is precisely the definition of a derivation of the algebra $(V, \cdot)$.
The grading by $\Lambda$ gives the DG structure.
For (3): $E_0 \cdot E_0 \subseteq E_{0+0} = E_0$ by (1), so $E_0$ is a
sub-algebra. Each $E_\lambda \cdot E_0 \subseteq E_{\lambda+0} = E_\lambda$,
giving the module structure. The Künneth isomorphism holds under the flatness
condition stated in the following section. $\square$
Interpretation. This proposition closes the loop between the monoidal
structure of §Trace Convolution Structure and the spectral theory of §Spectral
Theory. The zero-eigenvalue layer $E_0$ is not only the "stable" part of $V$
but also a sub-algebra of the convolution structure: stable modes compose to
stable modes. Non-zero eigenvalue modes compose according to the additive rule
$\lambda + \mu$, so the oscillatory frequency of a concatenated process is the
sum of the frequencies of its parts. The entire decomposition
$V \cong \bigoplus_\lambda E_\lambda$ is an internal differential graded algebra
in $R$, providing a bridge between the sheaf-cohomological structure of the
following section and the dynamical picture of §Internal Dynamics on Phase Space.
---
Sheaf Cohomology of the Mode Sheaf {#mode-cohomology}
The Grothendieck site $(T,J)$ and the sheaf $V$ of invariant modes together
support a natural cohomological machinery. We define the sheaf cohomology groups
$H^n(T,J;,V)$ and record their basic properties, connecting them to the spectral
decomposition of the previous section and to the aperiodicity structure of
Theorem 3.4.
Setup and Definitions {#cohomology-setup}
Since $R = \mathbf{Sh}(T,J)$ is a Grothendieck topos, it has enough injectives
(Grothendieck's theorem; see Johnstone, Sketches of an Elephant, Theorem
C2.1.11). For any sheaf $\mathcal{V}$ of $K$-modules on $(T,J)$, the
sheaf cohomology groups are defined as the right derived functors of the
global sections functor:
$$
H^n(T,J;,\mathcal{V})
;\coloneqq;
R^n\Gamma(\mathcal{V}),
\qquad n \geq 0,
$$
where $\Gamma : \mathbf{Sh}(T,J) \to \mathbf{Mod}K$ sends $\mathcal{V}$ to its
global sections $\mathcal{V}(T) = \varprojlim{t \in T} \mathcal{V}(t)$
(the limit over the site).
Čech cohomology. Since each $H_t$ is a finite Heyting algebra (Axiom A1)
and covering families are finite (the topology $J$ has finite covering families
by Axiom A3), the site $(T,J)$ is a site with enough points and finite covers.
In this setting, Čech cohomology with respect to $J$ agrees with derived functor
cohomology:
$$
\check{H}^n(T,J;,\mathcal{V}) ;\cong; H^n(T,J;,\mathcal{V})
$$
for all $n \geq 0$ and all locally free sheaves $\mathcal{V}$ of finite-rank
$K$-modules (this follows from the degeneration of the Čech-to-derived spectral
sequence when covers are finite and modules are flat; see Tamme, Introduction
to Étale Cohomology, Chapter II, §3).
Theorem — Zeroth Cohomology and Global Invariant Modes {#thm-h0}
$$
H^0(T,J;,V) ;\cong; \Gamma(V),
$$
the $K$-module of global invariant mode sections: elements $v \in
\prod_{t} V_t$ compatible with all reindexing maps.
Proof. By definition of derived functors, $R^0\Gamma = \Gamma$. $\square$
Remark. The inclusion $E_0 \hookrightarrow V$ induces a map
$\Gamma(E_0) \hookrightarrow \Gamma(V)$, identifying the globally stable modes
(zero-eigenvalue sections) as a $K$-submodule of all global invariant modes. The
quotient $\Gamma(V)/\Gamma(E_0)$ parameterizes globally coherent oscillatory
patterns — invariant mode sections that are not killed by any power of $\delta$.
Theorem — Long Exact Cohomology Sequence {#thm-les}
The short exact sequence of sheaves
$$
0 ;\longrightarrow; E_0 ;\longrightarrow; V ;\longrightarrow; V/E_0 ;\longrightarrow; 0
$$
induces a long exact sequence in cohomology:
$$
0 \to \Gamma(E_0) \to \Gamma(V) \to \Gamma(V/E_0)
\xrightarrow{;\partial;} H^1(T,J;,E_0)
\to H^1(T,J;,V) \to H^1(T,J;,V/E_0)
\to H^2(T,J;,E_0) \to \cdots
$$
The connecting homomorphism $\partial : \Gamma(V/E_0) \to H^1(T,J;,E_0)$
measures the obstruction to lifting a global section of the oscillatory quotient
$V/E_0$ to a global section of the full mode sheaf $V$: a class $[s] \in
\Gamma(V/E_0)$ lifts to $\Gamma(V)$ if and only if $\partial([s]) = 0$.
Proof. Standard: apply the left-exact functor $\Gamma$ to the short exact
sequence and invoke the long exact sequence of right derived functors. $\square$
Remark — Cohomological Dimension. If the site $(T,J)$ has cohomological
dimension $\leq d$ — meaning $H^n(T,J;,\mathcal{V}) = 0$ for all $n > d$ and
all sheaves $\mathcal{V}$ — then the long exact sequence truncates at degree $d$.
For the combinatorial sites arising from finite trace categories with finitely
many morphisms between any two objects, cohomological dimension is bounded by
the maximal length of chains of morphisms in $T$, giving $d \leq \dim(T)$ in the
appropriate sense.
Corollary — Aperiodicity and Nontrivial Cohomology {#cor-aperiodicity-cohomology}
Suppose the quasicrystalline aperiodicity hypothesis (Theorem 3.4) holds: the
fixed sheaf $H^\ast$ has no nontrivial global symmetry. Then:
$H^0(T,J;,E_0) \cong K$ (the stable modes are globally one-dimensional — only
constant multiples of the unique stable global section survive).
The class $[\partial] \in H^1(T,J;,E_0)$ is nontrivial whenever $V/E_0$ has
a global section that does not lift: oscillatory global modes are obstructed.
The aperiodicity of $H^\ast$ is a necessary condition for nontrivial
$H^1(T,J;,E_0)$: if the site had a nontrivial periodic symmetry, the sheaf
$E_0$ would split as a direct sum indexed by orbits, forcing $H^1$ to vanish
by Shapiro's lemma.
Proof sketch. (1) follows from Theorem 3.4 part (iii) (no nontrivial
automorphism): the global sections of $E_0$ are invariant under all reindexings
and thus forced to be multiples of the canonical unit section. (2) is immediate
from the long exact sequence. (3): if $T$ admitted a nontrivial automorphism
$\phi$ preserving $H^\ast$ and $J$, then $E_0^\phi \cong E_0$ would give an
induced decomposition of $E_0$ as a module over the group ring of the symmetry
group, and cohomology of a module induced from the trivial subgroup vanishes by
Shapiro — but this contradicts nontriviality, so aperiodicity is necessary. $\square$
Corollary — Mayer–Vietoris for Profile Sites {#cor-mayer-vietoris}
Let $U_1, U_2 \subseteq T$ be two profile sites (in the sense of the Profiles
theorem) with union $U_1 \cup U_2 = T$ and intersection $U_{12} = U_1 \cap U_2$.
Denote by $V|{U_i}$ the restriction of $V$ to each profile. Then there is a
long exact Mayer–Vietoris sequence:
$$
\cdots \to H^{n-1}(U{12},,V)
\xrightarrow{;\delta_{MV};}
H^n(U_1,,V) \oplus H^n(U_2,,V)
\to H^n(T,,V)
\to H^n(U_{12},,V) \to \cdots
$$
Proof. The Mayer–Vietoris sequence in sheaf cohomology is a formal consequence
of the short exact sequence $0 \to V \to V|{U_1} \oplus V|{U_2} \to V|{U{12}} \to 0$
(the sheaf version of inclusion-exclusion), which is exact because $V$ satisfies
the gluing condition over the site $J$. Apply derived functors and the long
exact sequence. $\square$
Remark — Connection to the Depth Tower. The depth filtration
$R_0 \to R_1 \to \cdots \to R$ (Definition — Depth Filtration) gives a
filtration of $V$ by the subsheaves $V^{(n)} = V|{T^{(n)}}$. The associated
spectral sequence
$$
E_2^{p,q} = H^p\bigl(T,,R^q(i_n)\ast(V|{T^{(n)}})\bigr)
;\Longrightarrow;
H^{p+q}(T,J;,V)
$$
(where $i_n : T^{(n)} \hookrightarrow T$ is the depth inclusion) connects the
cohomology computed at each depth level to the global cohomology of $V$. Under
the Beck–Chevalley stability of the depth inclusions (Theorem — Beck-Chevalley
Stability), the $E_2$ page simplifies: the higher-pushforward sheaves
$R^q(i_n)\ast(V|_{T^{(n)}})$ vanish for $q > 0$ when the depth-$n$ restriction
is an open immersion of sites, recovering a direct comparison
$H^\ast(T^{(n)}, V) \to H^\ast(T, V)$ at each depth.
Interpretation. Local invariant mode data on each profile $U_i$ can be
combined into global mode data on $T$ precisely when the Mayer–Vietoris
obstruction $\delta_{MV}$ vanishes on the overlap $U_{12}$. This is the precise
cohomological content of "local repetitiveness implies global assembly" in the
quasicrystalline picture: local mode patterns glue to global ones exactly when
their overlap cohomology is trivial.
---
Observation Duality and Directed Dynamics {#observation-duality}
The relational quantale encodes construction — how propositions are built up from traces by tensoring and nuclei. But the propositional structure has a dual face: observation, the contravariant process of testing whether a proposition meets a condition. This subsection introduces the dual sheaf $H^\vee$, the duality theorem identifying construction and observation on fixed propositions, and the directed comonad $G$ encoding sequential process dynamics. All constructions remain in the 1-categorical sheaf topos $R = \mathbf{Sh}(T,J)$.
The Observation Sheaf {#observation-sheaf}
Let $\Omega \in R$ denote the subobject classifier of the Grothendieck topos $R$. Its sections $\Omega(t) = J(t)$ are the sieves on $t$ — the "truth values" internal to $R$. Define the observation sheaf as the internal hom:
$$
H^\vee ;:=; [H, \Omega] ;\in; R,
$$
where $[-, -]$ is the closed structure of $R$ (which exists because every Grothendieck topos is cartesian closed). Explicitly, sections over $t$ are:
$$
H^\vee(t) ;=; \mathrm{Hom}_R(H \times y(t),, \Omega)
;\cong; \mathrm{Sub}_R(H \times y(t)),
$$
the subobjects of $H$ visible from $t$ — equivalently, the "observable predicates on $H$ at trace $t$." An element of $H^\vee(t)$ is an observation: a condition that a proposition at $t$ either satisfies or fails.
The nuclei $\sigma, \Delta$ on $H$ induce dual nuclei on $H^\vee$ by precomposition. For $\phi \in H^\vee(t)$, define:
$$
\sigma^\vee(\phi) ;:=; \phi \circ (\sigma \times \mathrm{id}{y(t)}),
\qquad
\Delta^\vee(\phi) ;:=; \phi \circ (\Delta \times \mathrm{id}{y(t)}).
$$
One verifies that $\sigma^\vee, \Delta^\vee$ are again nuclei on $H^\vee$ (extensive, idempotent, meet-preserving) and that they commute, so $(H^\vee, \sigma^\vee, \Delta^\vee)$ is an object of $\mathbf{HA_{nucl}}$ internal to $R$. Define the fixed observation subsheaf:
$$
(H^\vee)^\ast ;:=; \mathrm{Fix}(\sigma^\vee) \cap \mathrm{Fix}(\Delta^\vee) ;\hookrightarrow; H^\vee.
$$
Theorem — Construction–Observation Duality {#thm-duality}
There is a natural bimorphism (internal pairing in $R$):
$$
\langle -, - \rangle ;:; H^\ast \times (H^\vee)^\ast ;\longrightarrow; \Omega
$$
given fiberwise at each $t$ by evaluation: $\langle a, \phi \rangle_t = \phi_t(a)$ for $a \in H^\ast_t$ and $\phi \in (H^\vee)^\ast_t$. This pairing satisfies:
Separation. If $\langle a, \phi \rangle = \langle b, \phi \rangle$ for all $\phi \in (H^\vee)^\ast$, then $a = b$ in $H^\ast$. (Fixed propositions are separated by fixed observations.)
Co-separation. If $\langle a, \phi \rangle = \langle a, \psi \rangle$ for all $a \in H^\ast$, then $\phi = \psi$ in $(H^\vee)^\ast$. (Fixed observations are separated by fixed propositions.)
Stability. The pairing is preserved by reindexing: for any morphism $f: t \to t'$ in $T$, $\langle H(f)(a'), \phi \rangle_t = \langle a', H^\vee(f)(\phi) \rangle_{t'}$.
Proof sketch. Property (1) follows from the fact that $H^\ast \hookrightarrow H$ is a sheaf of locales and $\Omega$ is the subobject classifier: a global element of $[H^\ast, \Omega]$ distinguishes any two distinct global sections by the universal property of $\Omega$. Property (2) is dual: elements of $(H^\vee)^\ast$ are themselves natural transformations $H^\ast \Rightarrow \Omega$, and two such are equal iff they agree on all inputs. Property (3) is naturality of the internal hom. ∎
Interpretation. A proposition in $H^\ast$ is fully determined by the set of observations it satisfies, and an observation in $(H^\vee)^\ast$ is fully determined by the set of fixed propositions it accepts. Construction (building a proposition from below by tensoring and closing under $\sigma, \Delta$) and observation (testing a proposition against predicates from above) are dual processes that agree on fixed points. At the level of fixed configurations, what is constructible is exactly what is observable.
Remark — Ambidexterity of the Fixed Layer {#remark-ambidexterity}
The construction–observation duality reflects a deeper algebraic fact. In any relational quantale, the doubly-fixed subquantale $Q^\ast$ satisfies:
$$
\bigvee_{Q^\ast} S = \sigma\Delta!\left(\bigvee_Q S\right) \quad \text{for any } S \subseteq Q^\ast.
$$
Joins in $Q^\ast$ are computed by lifting to $Q$ and applying both nuclei. This is ambidexterity at the quantale level: the fixed layer computes limits and colimits by the same operation. The duality theorem above is the sheaf-level manifestation: on fixed propositions $H^\ast$, construction (tensoring and nuclear closure from below) and observation (testing against $\Omega$-predicates from above) agree, as witnessed by the non-degenerate pairing $H^\ast \times (H^\vee)^\ast \to \Omega$.

The Directed Comonad {#directed-comonad}
The trace category $T$ carries a monoidal structure $(T, \star, e)$ from Axiom A0 (trace concatenation). This makes $T$ into a monoidal category, and the Day convolution makes $R = \mathbf{Sh}(T,J)$ into a monoidal topos $(R, \circledast, I)$. The tensor $\circledast$ encodes concurrent composition of propositions. What is missing is sequential composition — the process of extending a proposition forward along one more trace step and then forgetting the step.
Fix a single step $s \in \mathrm{Ob}(T)$ (a generator of the trace alphabet $\Sigma$). Define the functor:
$$
G_s : R \longrightarrow R,
\qquad
G_s(F)(t) ;:=; F(s \star t),
$$
the precomposition of $F$ with left-concatenation by $s$. Since $s \star -$ is a functor $T \to T$ and sheafification commutes with precomposition by a continuous functor (Axiom A3 ensures the topology is compatible with $\star$), $G_s$ is a well-defined endofunctor on $R$.
A directed comonad is a comonad $(G_s, \epsilon, \delta)$ where:
The counit $\epsilon : G_s \Rightarrow \mathrm{Id}_R$ has components $\epsilon_F(t) : F(s \star t) \to F(t)$ given by the reindexing map $H(u_t) : F(s \star t) \to F(t)$ along the unique normalization $u_t : t \to s \star t$ in $T$. This is "forget the $s$-step": given a proposition at the extended trace $s \star t$, reindex it back to $t$.
The comultiplication $\delta : G_s \Rightarrow G_s \circ G_s$ has components $\delta_F(t) : F(s \star t) \to F(s \star s \star t)$ given by reindexing along the normalization $s \star t \to s \star s \star t$. This is "spawn a sub-step": a process at $s \star t$ extends to one at $s \star s \star t$.
The comonad laws (counit and comultiplication satisfying the coalgebra axioms) follow from associativity and unitality of $\star$ and functoriality of reindexing (Axiom A2).
Lax idempotence (KZ property). The comonad $G_s$ is lax idempotent in the sense that the canonical natural transformation $G_s \epsilon \Rightarrow \delta$ — obtained by applying $G_s$ to the counit — is a natural isomorphism. This holds because the reindexing maps are monomorphisms in $T$ (normalizations are unique, Axiom A0), so $G_s(G_s F)(t) = F(s \star s \star t)$ and the two maps $G_s \epsilon_F(t)$ and $\delta_F(t)$ both factor through $F(s \star t) \to F(s \star s \star t)$ in the same way.
Definition — Process Carriers and CoKleisli Composition {#process-carriers}
A process carrier is a $G_s$-coalgebra: a sheaf $X \in R$ equipped with a natural transformation $\gamma : X \Rightarrow G_s X$ satisfying $\epsilon_X \circ \gamma = \mathrm{id}_X$ and $G_s(\gamma) \circ \gamma = \delta_X \circ \gamma$. Concretely: $\gamma_t : X(t) \to X(s \star t)$ is a "step forward" map compatible with further stepping and with forgetting.
The CoKleisli category $\mathrm{coKl}(G_s)$ has the same objects as $R$ and hom-sets:
$$
\mathrm{coKl}(G_s)(X, Y) ;:=; \mathrm{Hom}_R(G_s X, Y).
$$
A morphism $f : G_s X \to Y$ in $R$ is a directed process step from $X$ to $Y$: given a proposition at the extended trace $s \star t$, produce a proposition at $t$. Composition of $f : G_s X \to Y$ and $g : G_s Y \to Z$ is:
$$
g \circledast f ;:=; g \circ G_s(f) \circ \delta_X
;:;
G_s X \xrightarrow{\delta_X} G_s G_s X \xrightarrow{G_s f} G_s Y \xrightarrow{g} Z.
$$
The pattern is: extend by another step, apply $f$, then apply $g$. This is the 1-categorical encoding of "do $f$, propagate, then do $g$" — the sequential process composition absent from the static nucleus structure.
Compatibility with the GSU Structure {#comonad-compatibility}
The comonad $G_s$ interacts with the existing GSU structure in two ways.
First, $G_s$ commutes with the nuclei $\sigma, \Delta$ on $H$ in the sense that the natural transformations:
$$
\lambda : G_s \circ \sigma \Longrightarrow \sigma \circ G_s,
\qquad
\rho : G_s \circ \Delta \Longrightarrow \Delta \circ G_s
$$
are isomorphisms on $H$. This is the mixed BC condition: it says the nuclei are stable under pre-extension by the step $s$. Concretely, $(\lambda_H)_t : (\sigma H)(s \star t) \to \sigma(H(s \star t))$ is the reindexing comparison, and it is an isomorphism because $\sigma$ is defined fiberwise and reindexing preserves the nucleus structure (Axiom A2.3). When $\lambda$ and $\rho$ are isomorphisms on $H$, the comonad $G_s$ restricts to a comonad on the fixed subsheaf $H^\ast$, making $H^\ast$ itself into a process carrier under the inclusion $H^\ast \hookrightarrow H$.
Second, $G_s$ preserves the observation sheaf: there is a natural isomorphism $G_s(H^\vee) \cong (G_s H)^\vee$ (precomposition commutes with internal hom up to the closed structure of $R$). Together these mean that the construction–observation duality of the previous subsection is dynamic: the pairing $\langle -, - \rangle : H^\ast \times (H^\vee)^\ast \to \Omega$ is preserved under the CoKleisli dynamics, so observations of a process carrier remain valid observations after each directed step.
Summary. The GSU paper now has three interlocking layers:
Layer	Object	Direction	Operation
Static	$H^\ast \subseteq H$	none	$\sigma, \Delta$ nuclei
Dual	$(H^\vee)^\ast \subseteq H^\vee$	contravariant	$\sigma^\vee, \Delta^\vee$ dual nuclei
Dynamic	$G_s$-coalgebras	forward along $s$	CoKleisli composition
Fixed propositions in $H^\ast$ are simultaneously the stable outputs of the construction process and the testable inputs of the observation process, and they evolve forward under directed process steps in a way compatible with both nuclei and with the pairing. Construction, observation, and directed dynamics are three aspects of a single coherent structure.

---
Internal Logic and Canonical Forms {#internal-logic}
In this section we make precise the relationship between:
the typed λ-calculus introduced in Axiom A5, and
the internal logic of the Generative Sheaf Universe
$$
R = \mathbf{Sh}(T,J)
$$
with distinguished object $H$ and modalities $\sigma,\Delta : H \to H$.
We first state soundness and completeness of the λ-calculus with respect to the internal logic, then formulate canonical forms and normalization for the base type $\mathsf{Prop}$ of propositions.

Lambda Calculus and Internal Language {#lambda-internal}
We now fix a concrete core fragment of FML that will serve as the internal language for the GSU structure.
> **Relation to the Mitchell–Bénabou language.** Every elementary topos $\mathcal{E}$ has a canonical internal type theory called the **Mitchell–Bénabou language** (see Johnstone, *Sketches of an Elephant* §D1.2, or Lambek–Scott, *Introduction to Higher Order Categorical Logic*, §IV). It is a higher-order intuitionistic type theory whose base type is the subobject classifier $\Omega$ and whose types correspond to objects of $\mathcal{E}$. The fragment $\mathrm{FML}_0$ defined below is the fragment of the Mitchell–Bénabou language of $R = \mathbf{Sh}(T,J)$ restricted to the base type $\mathsf{Prop}$ (interpreted as $H$), products, and function types, and extended with the modal term formers $\mathsf{Sat}$ and $\mathsf{Trans}$ interpreting the two nuclei $\sigma,\Delta$. Soundness and completeness of $\mathrm{FML}_0$ (Theorems 6.1–6.2 below) are therefore instances of the general soundness and completeness of the Mitchell–Bénabou language for its topos, restricted to this fragment.
> **Remark — Residuals and the Adjunction Chain.** The residual structure of the relational quantale underlies the adjunction pattern in FML. Each element $a$ generates an adjoint pair: $a \otimes -$ is left adjoint to $a \to -$. The inclusion $Q^\ast_\sigma \hookrightarrow Q$ has a left adjoint $x \mapsto \sigma x$, making $\sigma$ the counit of a reflective subcategory; dually for $\Delta$. In each fiber $H_t$, where $\otimes = \wedge$ and residuals reduce to Heyting implication, this becomes the standard $\wedge \dashv {\Rightarrow}$ adjunction. The FML term formers $\mathsf{Sat}$ and $\mathsf{Trans}$ are the syntactic realizations of the nuclear reflections $\sigma_t$ and $\Delta_t$.

Core FML₀ System {#fml0-system}
Let $\mathrm{FML}_0$ be the simply typed λ-calculus with:
a single base type $\mathsf{Prop}$ (the type of propositions in $H$);
type formers
$$
A,B ::= \mathsf{Prop} \mid A \times B \mid A \Rightarrow B;
$$
contexts $\Gamma$ as finite lists of variable/type assignments;
the usual term formers and typing rules for variables, λ-abstraction, application, pairing, projections, and their βη-equations;
additional term formers at type $\mathsf{Prop}$ corresponding to the Heyting-modal structure:
$$
M \wedge N,\quad M \vee N,\quad M \Rightarrow N,\quad
\mathsf{True},\ \mathsf{False},\quad
\mathsf{Sat}(M),\quad \mathsf{Trans}(M),
$$
together with the equations expressing the Heyting algebra laws for $\wedge,\vee,\Rightarrow,\bot,\top$ and the axioms of Axiom A1 for $\sigma,\Delta$ (monotonicity, extensivity/idempotence of $\sigma$, inflationarity/eventual idempotence of $\Delta$, and commutation).
Typing judgments are written
$$
\Gamma \vdash_t M : A
$$
for each trace $t \in \mathrm{Ob}(T)$, and the typing rules are the standard ones for simply typed λ-calculus with products and arrows, extended so that the $\mathsf{Prop}$-constructors above are well-typed and their equations are derivable.
The results of this section concern the $\mathrm{FML}_0$ fragment. Additional type formers (such as sums or (co)inductive fixed-point types) may be added as explicit extensions, but they are not needed for the basic soundness/completeness and normalization statements below.
Internal Interpretation {#internal-interpretation}
For each type $A$ we define an object $\llbracket A \rrbracket \in R$:
$\llbracket \mathsf{Prop} \rrbracket \coloneqq H$.
$\llbracket A \times B \rrbracket \coloneqq \llbracket A \rrbracket \times \llbracket B \rrbracket$.
$\llbracket A \Rightarrow B \rrbracket \coloneqq \llbracket B \rrbracket^{\llbracket A \rrbracket}$ (exponential in $R$).
For sums / fixed points, use the corresponding coproduct and (co)algebra constructions of $R$.
For a context $\Gamma = x_1 : A_1, \dots, x_n : A_n$, let
$$
\llbracket \Gamma \rrbracket
\coloneqq \llbracket A_1 \rrbracket \times \dots \times \llbracket A_n \rrbracket.
$$
For each derivable judgment $\Gamma \vdash M : A$, we define an internal morphism
$$
\llbracket \Gamma \vdash M : A \rrbracket : \llbracket \Gamma \rrbracket \longrightarrow \llbracket A \rrbracket
$$
inductively by the usual interpretation of the simply-typed λ-calculus in a cartesian closed category, extended with:
$\mathsf{Prop}$-constructors interpreted as the propositional operations on $H$.
$\mathsf{Sat}(M)$ interpreted as $\sigma \circ \llbracket M \rrbracket$.
$\mathsf{Trans}(M)$ interpreted as $\Delta \circ \llbracket M \rrbracket$.
Fixed-point term formers interpreted as least/greatest fixed points of the internal monotone endomorphisms they denote (when such fixed points exist by A5).
Fiberwise, for each trace $t$, the interpretation at $t$ is recovered by evaluating the internal morphism at the generalized point corresponding to $t$ and a valuation of $\Gamma$.

Soundness {#soundness}
We write $M \equiv N : A$ for the λ-calculus’s equational theory (βη-conversion plus the equations corresponding to the algebraic laws of $\sigma,\Delta$).
Theorem 6.1 (Soundness).
For every derivable judgment $\Gamma \vdash M : A$:
The internal morphism $\llbracket \Gamma \vdash M : A \rrbracket$ exists in $R$ and is independent of the particular derivation of $\Gamma \vdash M : A$.
If $\Gamma \vdash M \equiv N : A$ is derivable, then
$$
\llbracket \Gamma \vdash M : A \rrbracket
= \llbracket \Gamma \vdash N : A \rrbracket
$$
as morphisms in $R$.
Proof. The interpretation $\llbracket - \rrbracket$ is defined inductively on typing derivations using the cartesian closed structure of $R$ together with the internal $\mathsf{Prop}$-operations and the modal endomorphisms $\sigma,\Delta$. In each typing rule, the premises are interpreted as morphisms in $R$, and the conclusion is interpreted by composing these morphisms with the universal arrows that exhibit products, exponentials, and subobjects, or with the internal operations on $H$. Standard arguments for the internal language of a cartesian closed category show that different derivations of the same judgment yield the same morphism, because all typing rules correspond to universal properties which are unique up to unique isomorphism.
For the equational theory, each β- or η-equation corresponds to a triangle or square expressing a universal property (for products or exponentials), and each modal equation corresponds to one of the algebraic axioms satisfied by $\sigma,\Delta$ (monotonicity, idempotence, commutation, and distributivity over the propositional structure). All these equalities hold in $R$ by construction of the interpretation and by Axiom A1, so if $\Gamma \vdash M \equiv N : A$ is derivable, the corresponding morphisms $\llbracket \Gamma \vdash M : A \rrbracket$ and $\llbracket \Gamma \vdash N : A \rrbracket$ are equal. ∎

Completeness {#completeness}
We restrict attention to morphisms built using exactly the structure captured by the λ-calculus.
Let $\mathcal{C}$ be the smallest class of morphisms in $R$ closed under:
composition,
pairing and projections,
currying and evaluation,
the structural operations induced by the Heyting-modal structure on $H$,
the fixed-point constructions allowed in Axiom A5.
Theorem 6.2 (Completeness).
Let $f : \llbracket \Gamma \rrbracket \to \llbracket A \rrbracket$ be a morphism in $\mathcal{C}$. Then:
There exists a term $M$ with $\Gamma \vdash M : A$ such that
$$
\llbracket \Gamma \vdash M : A \rrbracket = f.
$$
If $M,N$ are two such terms, then $\Gamma \vdash M \equiv N : A$ is derivable.
Proof. The standard completeness theorem for the internal language of a cartesian closed category states that, given a cartesian closed category $\mathcal{E}$, its simply typed λ-calculus with products and arrows is initial among all λ-theories interpreting the same structure. Concretely, for any morphism $f : X \to Y$ built from identities, composition, projections, pairings, currying, and evaluation, there exists a λ-term whose denotation is $f$, and two such terms are equal in the λ-theory iff the morphisms are equal in $\mathcal{E}$.
Apply this general result to the full subcategory of $R$ generated from $H$ by products, exponentials, subobjects, and the structural operations appearing in $\mathcal{C}$. By definition, every morphism $f \in \mathcal{C}$ is obtained by finitely many applications of these generators, so the internal-language argument yields a term $M$ with $\llbracket \Gamma \vdash M : A \rrbracket = f$. If $M,N$ denote the same morphism, soundness (Theorem 6.1) implies $\Gamma \vdash M \equiv N : A$, giving uniqueness in the λ-theory. ∎

Closed Propositions {#closed-propositions}
For closed terms of type $\mathsf{Prop}$, we obtain a familiar “syntax = semantics” principle.
Corollary 6.3 (Closed propositions).
Let $\vdash M : \mathsf{Prop}$ and $\vdash N : \mathsf{Prop}$ be closed terms. Then
$$
\vdash M \equiv N : \mathsf{Prop}
\quad\Longleftrightarrow\quad
\llbracket \vdash M : \mathsf{Prop} \rrbracket
= \llbracket \vdash N : \mathsf{Prop} \rrbracket \in H.
$$
Proof. “Only if” is soundness (Theorem 6.1). “If” is completeness (Theorem 6.2) applied to the equal morphisms $\llbracket M \rrbracket = \llbracket N \rrbracket$. $\square$

Canonical Forms and Normalization {#normalization}
We now relate syntactic normalization in the λ-calculus to semantic normalization in $H$, focusing on the base type $\mathsf{Prop}$.
Reduction System {#reduction-system}
We consider the core fragment $\mathrm{FML}_0$ from Axiom A5, i.e. the simply typed $\lambda$-calculus with base type $\mathsf{Prop}$, products, and arrows, equipped with the usual $\beta$- and $\eta$-rules for these type formers together with a chosen orientation of any additional modal simplification rules (Section 6.2.2).
Fix a reduction relation $\to$ on $\mathrm{FML}_0$-terms, generated by:
β-reduction:
$$
(\lambda x.M),N ;\to; M[x := N].
$$
(Optional) η-reduction/expansion, oriented according to a chosen normal-form convention (β-normal, η-long, etc.).
Modal simplification rules, if any, reflecting algebraic laws of $\sigma$ and $\Delta$, e.g. rules that eliminate syntactically redundant nestings like $\mathsf{Sat}(\mathsf{Sat}(M))$.
By standard results on the simply typed $\lambda$-calculus with products and arrows (and on orthogonal extensions by finitely presented rewrite rules), the resulting reduction system $\to$ is:
strongly normalizing on closed $\mathsf{Prop}$-terms, and
confluent (any two reduction paths from the same term can be joined).
Write $\to^\ast$ for the reflexive–transitive closure of $\to$, and write $M \downarrow$ if $M$ is in $\to$-normal form (no further reductions apply).

Canonical $\mathsf{Prop}$-Terms {#canonical-terms}
We want a distinguished representative in each equivalence class of closed $\mathsf{Prop}$-terms.
Definition 6.4 (Canonical $\mathsf{Prop}$-terms).
A closed term $N : \mathsf{Prop}$ is canonical if:
$N$ is in β-normal form.
$N$ satisfies the chosen η-shape condition (e.g. η-long form for function types).
No modal reduction rule applies to any subterm of $N$.
$N$ is built only from:
the logical constructors corresponding to $\wedge, \vee, \Rightarrow, \top, \bot$, and
the modal constructors $\mathsf{Sat}, \mathsf{Trans}$,
in a way that reflects the normal form of its denotation in $H$ (see below).
We let $\mathsf{Can}(\mathsf{Prop})$ denote the set of canonical closed $\mathsf{Prop}$-terms.

Canonical Forms for Propositions {#canonical-forms}
Theorem 6.5 (Canonical forms for $\mathsf{Prop}$).
Every closed term $M : \mathsf{Prop}$ is equivalent to a unique canonical term.
More precisely:
For every $\vdash M : \mathsf{Prop}$, there exists a canonical $N : \mathsf{Prop}$ such that
$$
M \to^\ast N
\quad\text{and}\quad
\vdash M \equiv N : \mathsf{Prop}.
$$
If $N,N' : \mathsf{Prop}$ are both canonical and $\vdash N \equiv N' : \mathsf{Prop}$, then $N$ and $N'$ are syntactically identical (up to trivial renaming).
Proof. By construction, the reduction relation $\to$ on closed $\mathsf{Prop}$-terms is strongly normalizing and confluent (Section 6.2.1). Strong normalization implies that every closed term $M : \mathsf{Prop}$ admits at least one $\to$-normal form $N$ with $M \to^\ast N$. Confluence implies that any two normal forms reachable from $M$ are equal modulo the oriented equations that generate $\equiv$, so the $\to$-normal form is unique up to $\equiv$.
We now refine this to the canonical-shape conditions. Among all terms in the $\equiv$-equivalence class of $M$, there is at least one that is β-normal, η-long, and contains no modal redexes: starting from any $\to$-normal form, we can perform η-expansions and harmless rebracketings/reassociations to obtain such a term without changing its denotation. The shape constraints are stable under $\equiv$ and define at most one representative in each equivalence class: any two β-normal, η-long terms without modal redexes that are $\equiv$-equal must in fact be syntactically identical, because no further reductions or expansions are available to relate them. Thus every closed $\mathsf{Prop}$-term has a unique canonical representative. ∎

Semantic Normalization in $H$ {#semantic-normalization}
Inside $R$, we may specify an internal propositional normalizer
$$
\mathsf{NF} : H \longrightarrow H
$$
with the following properties:
Idempotence: $\mathsf{NF}(\mathsf{NF}(a)) = \mathsf{NF}(a)$ for all $a \in H$.
Monotonicity: if $a \leq b$ in the internal order on $H$, then $\mathsf{NF}(a) \leq \mathsf{NF}(b)$.
Compatibility with the Heyting-modal structure: $\mathsf{NF}$ preserves the equalities used as axioms in the λ-calculus’s equational theory.
Classification of propositions: for closed $\mathsf{Prop}$-terms $M,N$,
$$
\mathsf{NF}(\llbracket M \rrbracket)
= \mathsf{NF}(\llbracket N \rrbracket)
\quad\Longleftrightarrow\quad
\llbracket M \rrbracket = \llbracket N \rrbracket.
$$
This $\mathsf{NF}$ can be thought of as an internal, algebraic normalization procedure (e.g. rewriting formulas in a canonical propositional-modal normal form).

Alignment of Syntactic and Semantic Normalization {#normalization-alignment}
We now connect the syntactic canonical forms with the semantic normalizer $\mathsf{NF}$.
Theorem 6.6 (Syntactic vs. semantic normalization).
Let $\vdash M : \mathsf{Prop}$ and let $N$ be the unique canonical term with $\vdash N : \mathsf{Prop}$ and $M \to^\ast N$.
Then:
The interpretation of $N$ is semantically normalized:
$$
\mathsf{NF}\bigl(\llbracket \vdash M : \mathsf{Prop} \rrbracket\bigr)
= \llbracket \vdash N : \mathsf{Prop} \rrbracket.
$$
For two closed terms $M,M' : \mathsf{Prop}$ with canonical representatives $N,N'$,
$$
\mathsf{NF}(\llbracket M \rrbracket) = \mathsf{NF}(\llbracket M' \rrbracket)
\quad\Longleftrightarrow\quad
N = N'.
$$
Proof. Let $M$ be a closed $\mathsf{Prop}$-term with canonical representative $N$. By confluence of $\to$ and the definition of $\equiv$, we have $M \equiv N : \mathsf{Prop}$, so soundness (Theorem 6.1) implies $\llbracket M \rrbracket = \llbracket N \rrbracket$ in $H$. By definition of the internal normalizer $\mathsf{NF}$, its fixed points are exactly the elements of $H$ that are denotations of canonical $\mathsf{Prop}$-terms, and $\mathsf{NF}$ sends any element to the unique such fixed point in its $\equiv$-class. Therefore
$$
\mathsf{NF}(\llbracket M \rrbracket)
= \mathsf{NF}(\llbracket N \rrbracket)
= \llbracket N \rrbracket,
$$
proving (1).
For (2), suppose $\mathsf{NF}(\llbracket M \rrbracket) = \mathsf{NF}(\llbracket M' \rrbracket)$. Let $N,N'$ be the canonical representatives of $M,M'$. By the first part, $\mathsf{NF}(\llbracket M \rrbracket) = \llbracket N \rrbracket$ and $\mathsf{NF}(\llbracket M' \rrbracket) = \llbracket N' \rrbracket$, so equality of the normalizations implies $\llbracket N \rrbracket = \llbracket N' \rrbracket$. By Corollary 6.3, this internal equality implies $N \equiv N' : \mathsf{Prop}$, and by Theorem 6.5 the canonical representatives are syntactically equal, i.e. $N = N'$. The converse direction is immediate from the first part. ∎

Summary {#normalization-summary}
The typed λ-calculus of Axiom A5 is precisely the internal language of the Generative Sheaf Universe for the structural fragment generated by $H$, products, arrows, fixed points, and the modal operations.
Every morphism in this fragment has a unique representation as a λ-term up to the equational theory.
For the base type $\mathsf{Prop}$, every closed proposition has a unique canonical syntactic representative, and syntactic normalization aligns with semantic normalization in the internal algebra $H$.
This provides a precise computational handle on the internal logic: reasoning by λ-terms and reasoning internally in the topos are equivalent, and normalization has a clean algebraic meaning.

Fully Standalone Mathematical Examples {#examples}
This section records several explicit models of a Generative Sheaf Universe satisfying Axioms A0–A6. Each example is fully specified so that all objects, morphisms, and operations can be constructed directly from the data.
Throughout, we write $R = \mathbf{Sh}(T,J)$ for the associated sheaf topos, $H \in R$ for the distinguished internal Heyting-modal object, and $H^\ast \subseteq H$ for the fixed subsheaf.

Example I — One-Point Trace with a Two-Element Fiber {#example-1}
This is the minimal nontrivial GSU model.
Trace Category and Topology {#ex1-trace}
Let $T$ be the terminal category:
Objects: a single object $*$.
Morphisms: only $\mathrm{id}_* : * \to *$.
Define the Grothendieck topology $J$ by declaring:
The only covering family of $$ to be ${\mathrm{id}_ : * \to *}$.
Thus $(T,J)$ is a site whose sheaf topos $\mathbf{Sh}(T,J)$ is equivalent to the category of sets.
Fiber Algebra and Modalities {#ex1-fiber}
Let the unique fiber be the two-element Boolean algebra
$$
H_* \coloneqq {0,1},
$$
with order $0 \le 1$, meet $\wedge = \min$, join $\vee = \max$, implication
$$
a \Rightarrow b ;\coloneqq;
\begin{cases}
1 &\text{if } a \le b,\
0 &\text{otherwise},
\end{cases}
$$
and designated top $\top_* = 1$, bottom $\bot_* = 0$.
Define the saturation nucleus and translation nucleus to be the identity:
$$
\sigma_* = \mathrm{id}{H},\quad \Delta_ = \mathrm{id}{H*}.
$$
Then:
$H_*$ is a finite Heyting algebra.
$\sigma_*$ is a propositional saturation nucleus (indeed, the identity).
$\Delta_$ is a monotone endomorphism, commuting with $\sigma_$.
All axioms of A1 are satisfied.
The fixed fiber is
$$
H_^\ast \coloneqq {a \in H_ \mid \sigma_(a) = a = \Delta_(a)} = H_*.
$$
Presheaf, Sheaf, and Invariant Layer {#ex1-sheaf}
Define the presheaf
$$
H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}
$$
by:
$H() \coloneqq H_$,
$H(\mathrm{id}*) = \mathrm{id}{H_*}$.
Viewed via the forgetful functor $\mathbf{HA_{nucl}} \to \mathbf{Set}$, this is a presheaf of sets. Because the topology has only identity covers, every presheaf is automatically a sheaf, so:
$H$ is a sheaf in $\mathbf{Sh}(T,J)$,
the fixed presheaf $H^\ast$, with $H^\ast() = H_^\ast = H_*$, is also a sheaf.
The Generative Sheaf Universe is
$$
R = \mathbf{Sh}(T,J) \simeq \mathbf{Set},
$$
with distinguished object $H \simeq {0,1}$, and fixed subsheaf $H^\ast = H$.
The invariant locale $\mathsf{Phase}$ has frame of opens $H^\ast$, hence consists of a two-point discrete space internally.

Example II — Two-Stage Trace with Nontrivial Translation {#example-2}
This example adds minimal temporal structure and a nontrivial translation nucleus.
Trace Category and Topology {#ex2-trace}
Let $T$ be the category with:
Objects: $t_0, t_1$.
Morphisms: identities $\mathrm{id}{t_0}, \mathrm{id}{t_1}$, and a single non-identity arrow
$$
f : t_0 \to t_1.
$$
No further morphisms exist.
Define the Grothendieck topology $J$ by:
For each object $t_i$, the only covering family is ${\mathrm{id}_{t_i}}$.
Thus $\mathbf{Sh}(T,J)$ is equivalent to the presheaf category $[T^{\mathrm{op}}, \mathbf{Set}]$.
Fiber Algebras and Translation Nucleus {#ex2-fiber}
For each $t \in {t_0,t_1}$, let
$$
H_t \coloneqq {0 < a < 1}
$$
be the three-element chain, with propositional structure given by:
meet and join as minimum and maximum in the chain,
implication determined by
$$
c \le (x \Rightarrow y) \quad\Longleftrightarrow\quad c \wedge x \le y,
$$
for all $c,x,y\in H_t$,
$\bot_t = 0$, $\top_t = 1$.
Let the saturation nucleus be the identity:
$$
\sigma_t = \mathrm{id}_{H_t}.
$$
Define the translation nucleus at each $t$ by
$$
\Delta_t(0) = a,\quad \Delta_t(a) = 1,\quad \Delta_t(1) = 1.
$$
Then, for each $t$,
$\Delta_t$ is monotone and inflationary ($x \le \Delta_t(x)$).
Iterating $\Delta_t$ stabilizes in at most 2 steps: $\Delta_t^2(x) = \Delta_t^3(x)$ for all $x$.
$\sigma_t$ and $\Delta_t$ commute trivially, since both are endomorphisms and $\sigma_t = \mathrm{id}$.
Hence Axiom A1 holds.
The fixed fiber at $t$ is
$$
H_t^\ast \coloneqq {x \in H_t \mid \sigma_t(x)=x=\Delta_t(x)} = {1}.
$$
Reindexing and Sheaf Structure {#ex2-sheaf}
Define
$$
H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}
$$
by:
$H(t_i) = H_{t_i}$ for $i=0,1$,
$H(\mathrm{id}{t_i}) = \mathrm{id}{H_{t_i}}$,
$H(f) : H_{t_1} \to H_{t_0}$ is the identity on the underlying set ${0,a,1}$.
Each $H(f)$ is a Heyting algebra homomorphism preserving $\sigma$ and $\Delta$, so Axiom A2 holds. As in Example I, the trivial topology makes every presheaf a sheaf, so $H$ is a sheaf and $\mathbf{Sh}(T,J) \simeq [T^{\mathrm{op}},\mathbf{Set}]$.
The invariants form a presheaf $H^\ast$ with $H^\ast(t_0) = H^\ast(t_1) = {1}$, and $H^\ast(f) = \mathrm{id}_{{1}}$. This is again a sheaf.
Phase Space and Dynamics {#ex2-phase}
The invariant locale $\mathsf{Phase}$ has frame $H^\ast$ and thus a single open at each object; internally $\mathsf{Phase}$ is a one-point space.
However, the full translation nucleus $\Delta$ on $H$ is nontrivial:
At either trace, $0 \mapsto a \mapsto 1$, and $1$ is fixed.
Every element eventually translates to the unique invariant $1$.
Thus:
The invariant phase space is trivial (one stable state).
The transient dynamics (non-invariant layer) is nontrivial, capturing a “climb” toward the stable mode.

Example III — A Commuting Square with Nontrivial Invariants {#example-3}
This example exhibits nontrivial geometry, invariants, and gluing.
Trace Category {#ex3-trace}
Let $T$ have four objects forming a square:
$$
t_{00},\ t_{01},\ t_{10},\ t_{11},
$$
with morphisms:
horizontal arrows $a_0 : t_{00} \to t_{10}$, $a_1 : t_{01} \to t_{11}$,
vertical arrows $b_0 : t_{00} \to t_{01}$, $b_1 : t_{10} \to t_{11}$,
together with identities and the commuting relation
$$
b_1 \circ a_0 = a_1 \circ b_0 : t_{00} \to t_{11}.
$$
No further non-identity morphisms exist.
Define $J$ as the smallest Grothendieck topology such that, for each object, covers include the family of incoming edges. For instance:
${ a_0 : t_{00} \to t_{10} }$ covers $t_{10}$,
${ b_0 : t_{00} \to t_{01} }$ covers $t_{01}$,
${ a_1, b_1 : - \to t_{11} }$ covers $t_{11}$.
This makes local compatibility around the square visible to the sheaf condition.
Fibers and Modalities {#ex3-fiber}
Assign to each $t\in{t_{00},t_{01},t_{10},t_{11}}$ the same finite Heyting algebra
$$
H_t \coloneqq {,\bot, c, \top,}
$$
with $\bot < c < \top$, propositional operations as in a 3-element chain, and:
At the three “boundary” objects $t_{00}, t_{01}, t_{10}$, define
$$
\sigma_t = \mathrm{id}_{H_t},\qquad
\Delta_t(\bot) = c,\ \Delta_t(c)=\top,\ \Delta_t(\top)=\top.
$$
At the “corner” $t_{11}$, define
$$
\sigma_{t_{11}} = \mathrm{id}{H{t_{11}}},\qquad \Delta_{t_{11}} = \mathrm{id}{H{t_{11}}}.
$$
Each $(H_t,\sigma_t,\Delta_t)$ satisfies Axiom A1, and the family is constant on underlying sets and propositional operations.
Reindexing and Invariants {#ex3-reindexing}
Define $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ by:
$H(t) = H_t$ for all $t$,
for each non-identity arrow $u$, let $H(u)$ be the identity map on the underlying 3-element chain.
Then:
Each $H(u)$ is a Heyting algebra homomorphism preserving $\sigma,\Delta$,
gluing is nontrivial because of the topology $J$.
Invariants:
For $t \in {t_{00}, t_{01}, t_{10}}$, we have
$$
H_t^\ast = {\top},
$$
since only $\top$ is fixed by $\Delta_t$ and $\sigma_t$.
For $t_{11}$,
$$
H_{t_{11}}^\ast = H_{t_{11}} = {\bot, c, \top},
$$
because $\Delta_{t_{11}} = \sigma_{t_{11}} = \mathrm{id}$.
Thus the fixed presheaf $H^\ast$ has fibers of different sizes:
$$
H^\ast(t_{00}) = H^\ast(t_{01}) = H^\ast(t_{10}) = {\top},\quad
H^\ast(t_{11}) = {\bot, c, \top}.
$$
Sheaf Condition and Phase Space {#ex3-phase}
Because each $H(u)$ is the identity on underlying sets, the presheaf $H^\ast$ satisfies the sheaf condition for $J$:
At $t_{11}$, a compatible choice of invariants along incoming edges must restrict to $\top$ on $t_{01}$ and $t_{10}$.
Therefore, any glued invariant at $t_{11}$ that arises from the square must restrict to $\top$ along $a_1$ and $b_1$.
Consequently, only $\top\in H_{t_{11}}^\ast$ participates in global invariant sections compatible with the boundary; $\bot$ and $c$ are purely local invariants at $t_{11}$.
The invariant locale $\mathsf{Phase}$ has:
One-point fibers at $t_{00},t_{01},t_{10}$,
A three-point fiber at $t_{11}$,
with gluing forcing the unique global invariant to be the top element. Internally, $\mathsf{Phase}$ therefore has a nontrivial local structure but a single global point, illustrating:
local multiplicity of stable configurations,
global collapse to a unique stable state via sheaf gluing.
The underlying translation nucleus $\Delta$ exhibits nontrivial transient dynamics on the boundary (where $\bot \mapsto c \mapsto \top$) and trivial dynamics at $t_{11}$, yet only the top element survives all constraints in the invariant layer.
This example shows explicitly how:
nontrivial trace geometry,
nontrivial topology,
varying local dynamics,
combine to produce a nontrivial invariant sheaf and phase space within the Generative Sheaf Universe.
---
Example IV — A 2×3 Trace Grid with 5-Element Diamond Fibers and Spectral Decomposition {#example-4}
This example enlarges the commuting-square geometry of Example III and equips every fiber with a richer Heyting-modal algebra. The main novelty is an explicit spectral decomposition of the defect operator at the central node, exhibiting a symmetry-breaking eigenmode that is visible locally but killed by sheaf restriction.
Trace Category and Topology {#ex4-trace}
Let $T$ have six objects arranged in a $2 \times 3$ grid:
$$
\begin{array}{ccccc}
t_{00} & \xrightarrow{h_{00}} & t_{10} & \xrightarrow{h_{10}} & t_{20} \
\downarrow b_{00} & & \downarrow b_{10} & & \downarrow b_{20} \
t_{01} & \xrightarrow{h_{01}} & t_{11} & \xrightarrow{h_{11}} & t_{21}
\end{array}
$$
Morphisms are:
horizontal arrows $h_{ij} : t_{ij} \to t_{(i+1)j}$ for $i = 0,1$, $j = 0,1$;
vertical arrows $b_{i0} : t_{i0} \to t_{i1}$ for $i = 0,1,2$;
all composites of horizontal and vertical arrows;
identity morphisms;
the commutation relation $b_{(i+1)0} \circ h_{i0} = h_{i1} \circ b_{i0}$ for $i = 0,1$, making every square commute strictly.
No diagonal morphisms exist.
Define the Grothendieck topology $J$ so that at each $t_{ij}$:
if $t_{ij}$ has a unique incoming arrow (e.g., $t_{10}$ from the left only), the only cover is that singleton arrow;
if $t_{ij}$ has two incoming arrows (the corner $t_{11}$ and the corner $t_{21}$), the pair ${$left incoming, top incoming$}$ forms a covering family.
The four commuting squares thus each produce a genuine gluing condition at their bottom-right corner.
Fiber Algebra {#ex4-fiber}
Fix the five-element distributive Heyting algebra
$$
L ;:=; {\bot,, C,, A,, B,, \top}
$$
with the partial order
$$
\bot ;<; C ;<; A ;<; \top,\qquad \bot ;<; C ;<; B ;<; \top,\qquad A \text{ and } B \text{ incomparable}.
$$
The meet and join are determined by this order: $A \wedge B = C$, $A \vee B = \top$. One verifies that $L$ is distributive (by exhaustive check of the distributive law). The Heyting implication is given by the table:
$$
\begin{array}{c|ccccc}
a \Rightarrow b & \bot & C & A & B & \top \ \hline
\bot & \top & \top & \top & \top & \top \
C   & \bot & \top & \top & \top & \top \
A   & \bot & B   & \top & B   & \top \
B   & \bot & A   & A   & \top & \top \
\top & \bot & C   & A   & B   & \top \
\end{array}
$$
Assign $H_t \coloneqq L$ for all $t \in \mathrm{Ob}(T)$.
Modalities {#ex4-modalities}
Set the saturation nucleus $\sigma_t = \mathrm{id}_{L}$ at every trace $t$. Define the translation nucleus as follows:
Top-row objects ($t_{00}, t_{10}, t_{20}$):
$$
\Delta_t(\bot) = C,\quad \Delta_t(C) = A,\quad \Delta_t(A) = \top,\quad \Delta_t(B) = \top,\quad \Delta_t(\top) = \top.
$$
This is the horizontal flow $\Delta_h$: it pushes toward $A$ and then $\top$.
Left-column objects ($t_{01}$):
$$
\Delta_t(\bot) = C,\quad \Delta_t(C) = B,\quad \Delta_t(A) = \top,\quad \Delta_t(B) = \top,\quad \Delta_t(\top) = \top.
$$
This is the vertical flow $\Delta_v$: it pushes toward $B$ and then $\top$.
Central corner $t_{11}$:
$$
\Delta_{t_{11}} = \mathrm{id}_L.
$$
Right boundary ($t_{20}, t_{21}$): use $\Delta_h$.
In every case, $\Delta_t$ is monotone and inflationary. The saturation nucleus $\sigma_t = \mathrm{id}$ commutes with any $\Delta_t$ trivially. Thus Axiom A1 holds at every fiber.
Reindexing Maps {#ex4-reindexing}
Define $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ by $H(t) = L$ for all $t$, and all reindexing maps equal to $\mathrm{id}_L$. Since the identity is a Heyting algebra homomorphism preserving any pair of nuclei, Axiom A2 holds.
Invariant Fibers {#ex4-invariants}
The fixed fiber at $t$ is $H_t^\ast = {x \in L \mid \sigma_t(x) = x = \Delta_t(x)} = {x \in L \mid \Delta_t(x) = x}$.
For $t$ with $\Delta_t = \Delta_h$: the fixed points are ${x : \Delta_h(x) = x} = {\top}$.
For $t_{01}$ with $\Delta_t = \Delta_v$: fixed points $= {\top}$.
For $t_{11}$ with $\Delta_t = \mathrm{id}$: every element is fixed, so $H_{t_{11}}^\ast = L$.
Thus the fixed presheaf $H^\ast$ has fibers:
$$
H^\ast(t) =
\begin{cases}
{\top} & t \neq t_{11}, \
L & t = t_{11}.
\end{cases}
$$
Sheaf Condition and Phase Space {#ex4-phase}
The covering family of $t_{11}$ is ${b_{10} : t_{10} \to t_{11},; h_{01} : t_{01} \to t_{11}}$. A compatible invariant family assigns elements of $H^\ast(t_{10}) = {\top}$ and $H^\ast(t_{01}) = {\top}$. The reindexing maps are identities, so the unique lift to $t_{11}$ must restrict to $\top$ along both incoming arrows. Among the elements of $H_{t_{11}}^\ast = L$, only $\top$ restricts to $\top$ under the identity reindexing maps. Hence only $\top \in L$ participates in globally consistent invariant sections.
The invariant locale $\mathsf{Phase}$ therefore has:
one-point fiber ${\top}$ at every node except $t_{11}$,
a five-point fiber $L$ at $t_{11}$,
with gluing forcing the unique global invariant section to be $\top$ everywhere.
The local fiber at $t_{11}$ is strictly richer than the global picture: $\bot$, $C$, $A$, and $B$ are locally invariant at $t_{11}$ but cannot be extended to globally consistent invariant sections.
Mode Sheaf and Defect Operator {#ex4-spectral}
Fix the coefficient ring $K = \mathbb{R}$. The mode sheaf $V$ has fibers:
$$
V_t =
\begin{cases}
\mathbb{R}^1 & t \neq t_{11}, \
\mathbb{R}^5 & t = t_{11}.
\end{cases}
$$
At nodes $t \neq t_{11}$, the defect operator $\delta_t : \mathbb{R}^1 \to \mathbb{R}^1$ is the zero map (there is only one invariant, $\top$, so no deviation is detectable).
At $t_{11}$, the five invariants ${\bot, C, A, B, \top}$ carry a natural adjacency structure given by the Hasse diagram of $L$:
$$
\bot \text{--} C \text{--} A \text{--} \top, \qquad C \text{--} B \text{--} \top.
$$
Define the defect operator $\delta_{t_{11}}$ to be the graph Laplacian of this Hasse diagram, acting on $V_{t_{11}} = \mathbb{R}^5$ with basis vectors $\delta_\bot, \delta_C, \delta_A, \delta_B, \delta_\top$:
$$
\delta_{t_{11}} ;=;
\begin{pmatrix}
1 & -1 & 0 & 0 & 0 \
-1 & 3 & -1 & -1 & 0 \
0 & -1 & 2 & 0 & -1 \
0 & -1 & 0 & 2 & -1 \
0 & 0 & -1 & -1 & 2
\end{pmatrix},
$$
with rows and columns ordered $(\bot, C, A, B, \top)$. By construction, $\delta_{t_{11}}$ vanishes on constant vectors (the zero-eigenvalue corresponds to the fully active direction $\delta_\top + \delta_A + \delta_B + \delta_C + \delta_\bot$ up to normalization), it is positive semi-definite, and it is natural with respect to the identity reindexing maps.
Spectral decomposition. The eigenvalues and their geometric meaning are:
Eigenvalue $\lambda$	Multiplicity	Eigenspace interpretation
$0$	$1$	Global stable mode: uniform distribution on $H_{t_{11}}^\ast$
$2$	$1$	Antisymmetric $A$–$B$ mode: $\frac{1}{\sqrt{2}}(\delta_A - \delta_B)$
$\approx 0.830$	$1$	Symmetric low mode: smooth interpolation along $\bot$–$C$–${A,B}$–$\top$
$\approx 2.689$	$1$	Symmetric mid mode
$\approx 4.481$	$1$	Symmetric high mode: concentrated at $C$
The eigenvalue $\lambda = 2$ is exact, with eigenvector $\frac{1}{\sqrt{2}}(\delta_A - \delta_B)$, as verified directly: $\delta_{t_{11}} \cdot (\delta_A - \delta_B) = 2(\delta_A - \delta_B)$. This mode detects the broken symmetry between $A$ and $B$ in the Hasse diagram.
Global collapse. The reindexing map $V(b_{10}) : V_{t_{11}} \to V_{t_{10}} = \mathbb{R}^1$ is the projection onto the $\delta_\top$ coordinate (the unique invariant at $t_{10}$). Under this projection, every eigenmode with $\lambda \neq 0$ is sent to zero: they are locally supported at $t_{11}$ and vanish under sheaf restriction to the boundary. Only the $\lambda = 0$ global stable mode survives as a consistent global section of $V$.
This illustrates the general principle: the stable mode sheaf $E_0$ has a nontrivial global section (the uniform distribution), while the oscillatory mode sheaves $E_\lambda$ for $\lambda \neq 0$ have no global sections.
Summary of Example IV. This example demonstrates: a trace category with genuine multidirectional gluing; a five-element distributive Heyting fiber with position-dependent translation nuclei; an invariant stratum that is locally five-dimensional but globally collapses to one dimension; and a defect operator with five explicitly computed eigenmodes, of which four are locally supported and one (at $\lambda = 2$) is an exact antisymmetric mode reflecting the $A$–$B$ symmetry of the fiber lattice.
---
Example V — Infinite GSU over a Mazurkiewicz Trace Monoid {#example-5}
This example constructs a GSU with infinitely many traces, a genuine Grothendieck topology enforcing multi-step consistency, fibers of unbounded complexity, and an invariant locale that approximates a Cantor-like structure. All individual pieces remain finite (in accordance with Axiom A1), while the infinite family produces nontrivial global behaviour.
Trace Category: The Mazurkiewicz Trace Monoid {#ex5-trace}
Fix a countably infinite independence alphabet $(X, I)$ where:
$$
X ;=; {a_i, b_i : i \in \mathbb{Z}_{\geq 0}},
$$
with independence relation $I \subseteq X \times X$ given by:
$$
(a_i, a_j) \in I ;\Leftrightarrow; |i-j| > 1, \qquad
(b_i, b_j) \in I ;\Leftrightarrow; |i-j| > 2, \qquad
(a_i, b_j) \in I ;\Leftrightarrow; i < j.
$$
The relation $I$ is symmetric and irreflexive by definition. The Mazurkiewicz trace monoid $\mathbb{M}(X,I)$ is the quotient of the free monoid $X^\ast$ by the least congruence identifying $xy$ with $yx$ whenever $(x,y) \in I$; elements of $\mathbb{M}(X,I)$ are called traces.
The trace category $T$ has:
Objects: all traces $t \in \mathbb{M}(X,I)$, including the empty trace $e$;
Morphisms: a unique morphism $t \to t'$ for each pair with $t \leq t'$ in the left-divisibility preorder ($t' = t \cdot s$ for some $s \in \mathbb{M}(X,I)$);
Composition: concatenation, well-defined because divisibility is transitive.
This is a thin category (at most one morphism between any two objects). Because $I$ is not the total independence relation (not every pair of generators commutes), the monoid is genuinely non-commutative; and because $I$ involves strict index inequalities, the monoid has no nontrivial automorphism $\alpha : \mathbb{M}(X,I) \to \mathbb{M}(X,I)$ preserving $I$ (the index-inequality conditions are not preserved by any nontrivial permutation of $X$ fixing $I$). Hence the standing hypothesis of Theorem 3.4 (quasicrystalline aperiodicity) holds.
The concatenation depth of a trace $t$ is the length $|t|$ of any representative word in $X^\ast$ (this is well-defined because all representatives have the same length). This gives the depth filtration $T^{(n)} \coloneqq {t \in T : |t| \leq n}$ of Definition 3.1.
Grothendieck Topology {#ex5-topology}
For each trace $t$ with $|t| \geq 1$, define the covering family
$$
\mathrm{Cov}(t) ;:=; \bigl{, u \to t ;\big|; t = x \cdot u \text{ for some } x \in X,; |u| = |t| - 1 ,\bigr}.
$$
This is the family of all one-step left predecessors of $t$: traces obtained by deleting one generator from the left. For the empty trace $e$, only the singleton family ${\mathrm{id}_e}$ covers $e$.
Because independent generators can be freely reordered, the set $\mathrm{Cov}(t)$ has cardinality equal to the number of distinct left factors of length $|t|-1$, which equals the number of generators $x$ with $t = x \cdot u$ for some trace $u$. This set is always finite (bounded by $|X|$, which is countably infinite but each covering family is finite).
One verifies that this defines a Grothendieck topology $J$ on $T$: covers are stable under composition and refinement within the divisibility order. The sheaf condition for $J$ at a trace $t$ requires: a compatible family of sections $(s_u)_{u \in \mathrm{Cov}(t)}$ glues to a unique section over $t$. This enforces that local knowledge of a trace at each of its "one shorter" predecessors uniquely determines global knowledge at $t$.
Fiber Algebras of Increasing Complexity {#ex5-fibers}
For each trace $t$ with $|t| = n$, define the fiber Heyting algebra as the lattice of downward-closed subsets (lower sets) of the dependency poset $P_t$:
$$
H_t ;:=; \mathcal{D}(P_t),
$$
where $P_t$ is the poset on ${1, \ldots, n}$ with $i \leq_{P_t} j$ iff the $i$-th generator of (any fixed representative of) $t$ is dependent on its $j$-th generator, i.e., $(x_i, x_j) \notin I$. The isomorphism class of $P_t$ depends only on the trace (not the representative), because the independence relation $I$ is preserved under the commutation equivalence.
Properties:
$H_t = \mathcal{D}(P_t)$ is a finite distributive lattice, hence a finite Heyting algebra (every finite distributive lattice is Heyting). Axiom A1 holds fiber by fiber.
$|H_t|$ grows with $|t|$: for the empty trace, $H_e = {0,1}$; for traces of length $n$, $|H_t|$ can be as large as the Dedekind number $D(n)$, though typically much smaller due to the specific structure of $P_t$.
The family ${H_t}$ is thus infinite, though each fiber is finite.
Modalities {#ex5-modalities}
Fix a saturation nucleus $\sigma_t = \mathrm{id}_{H_t}$ at every trace. Define the translation nucleus $\Delta_t : H_t \to H_t$ as the closure operator that maps each lower set $S \in \mathcal{D}(P_t)$ to the downward closure of $S \cup {\mathrm{max}(P_t)}$ intersected with a chosen "stable stratum" of $P_t$.
More concretely: each generator in $X$ has an index (the subscript in $a_i$ or $b_i$). Define the index-weight of a generator position $k$ in $t$ to be $w_k = i$ if the $k$-th generator is $a_i$ or $b_i$. Then:
$$
\Delta_t(S) ;=; \text{downward closure of } S \cup {,k ;|; w_k = \min_{k'} w_{k'},},
$$
i.e., $\Delta_t$ adds to $S$ all positions of lowest-index generators. This is inflationary ($S \subseteq \Delta_t(S)$) and monotone. It commutes with $\sigma_t = \mathrm{id}$ trivially.
Reindexing Maps {#ex5-reindexing}
For each morphism $f : u \to t$ in $T$ (i.e., $t = x \cdot u$ for some $x \in X$), define the reindexing map $H(f) : H_t \to H_u$ by:
$$
H(f)(S) ;=; {k - 1 ;|; k \in S,; k \geq 2} ;\cap; \mathcal{D}(P_u),
$$
i.e., drop position 1 (the position of the prepended generator $x$) and shift the remaining positions down by one, then intersect with downsets of $P_u$. This is the restriction map reflecting how adding a generator at the front refines the trace. One verifies that $H(f)$ is a lattice homomorphism preserving $\sigma$ and $\Delta$ (the index-weight structure shifts coherently under prepending). Axiom A2 holds.
Invariant Fibers {#ex5-invariants}
With $\sigma_t = \mathrm{id}$, the fixed fiber is $H_t^\ast = {S \in H_t \mid \Delta_t(S) = S}$: the downsets of $P_t$ that already contain all minimum-index positions.
For $t = e$: $H_e^\ast = H_e = {0,1}$.
For $t = a_0$: $P_t$ is a single element with weight $0$; $\Delta_t(\emptyset) = {1}$; so $H_{a_0}^\ast = {{1}} = {\top}$.
As $|t| \to \infty$: the fixed fibers $H_t^\ast$ capture exactly those downsets of $P_t$ that already contain the entire minimum-index stratum. Because the dependency poset $P_t$ grows and the minimum-index stratum can be a single element or a set of several positions, $|H_t^\ast|$ grows without bound. In the increasing sequence of full fibers $H_{t^{(n)}}$ for a chosen infinite trace $t^{(n)} = a_0 a_1 a_2 \cdots a_{n-1}$, the sequence $H_{t^{(n)}}^\ast$ is an increasing sequence of finite distributive lattices whose limit (in the category of ind-objects) approximates the lattice of lower sets of the infinite poset $P_{t^{(\infty)}} = (\mathbb{Z}{\geq 0}, \leq)$, which is isomorphic to $(\mathbb{Z}{\geq 0}, \geq)^{\mathrm{op}}$ and whose lattice of lower sets is the Dedekind-MacNeille completion — a countably infinite chain. This is the precise sense in which the invariant layer "approximates a Cantor-like structure" in the inverse limit.
Sheaf Condition {#ex5-sheaf}
At a trace $t$ with $|t| = n \geq 1$, the covering family $\mathrm{Cov}(t)$ consists of all left predecessors $u$ with $t = x \cdot u$. A compatible family $(S_u){u \in \mathrm{Cov}(t)}$ of sections satisfies $H(f{uu'})(S_u) = H(f_{uu'})(S_{u'})$ on overlaps (when $u$ and $u'$ have a common left predecessor). The unique gluing is:
$$
S_t ;=; {1} \cup {k+1 \mid k \in S_{u}}
$$
where $u$ is any predecessor with $t = x \cdot u$ (all give the same answer by the compatibility condition). This is a well-defined element of $H_t$, and the assignment $t \mapsto S_t$ is the unique sheaf gluing. Axiom A3 holds.
The Invariant Locale {#ex5-locale}
The invariant sheaf $H^\ast$ is a sheaf of finite Heyting algebras on $(T,J)$. Its internal locale $\mathsf{Phase}$ has frame of opens $H^\ast$. The key properties of this locale, proved from the structure of the Mazurkiewicz monoid:
Local finiteness: Each fiber $H_t^\ast$ is finite (Axiom A1), so every local open of $\mathsf{Phase}$ is specified by a finite amount of data.
No global periodicity: By the quasicrystalline aperiodicity theorem (Theorem 3.4), the absence of nontrivial automorphisms of $\mathbb{M}(X,I)$ preserving $I$ and $H^\ast$ implies that no nontrivial "shift" of the monoid preserves the invariant pattern globally.
Inverse-limit Cantor approximation: Along any infinite ray $e \to t^{(1)} \to t^{(2)} \to \cdots$ in $T$, the restriction maps $H^\ast(t^{(n+1)}) \to H^\ast(t^{(n)})$ form a projective system of finite distributive lattices. By Priestley duality, the Priestley spaces of these lattices form a projective system of finite Stone spaces (compact, totally disconnected); the inverse limit in the category of Stone spaces is a compact totally disconnected metrizable space — a Cantor space — whenever the restriction maps are surjective with nontrivial fibres. This occurs for generic infinite rays in the Mazurkiewicz monoid under the chosen modalities.
Internally, $\mathsf{Phase}$ along each such ray is a small locale whose frame is an ind-system of finite distributive lattices converging to the frame of opens of a Cantor space. This is the precise mathematical content of "the invariant locale approximates a Cantor set" stated in the introduction to this example.
Depth Tower and Convergence {#ex5-depth}
The depth filtration $T^{(n)}$ of Definition 3.1 gives the tower
$$
R_0 \longrightarrow R_1 \longrightarrow \cdots \longrightarrow R = \mathbf{Sh}(T,J),
$$
and by the Beck–Chevalley stability theorem (§3.2 of the paper), the nuclei $\sigma, \Delta$ are stable under all depth-inclusion geometric morphisms. The moduli space $\mathcal{M}n$ of depth-$n$ nucleus families is finite at each $n$, with restriction maps $\rho_n : \mathcal{M}{n+1} \to \mathcal{M}_n$ given by forgetting nucleus data at depth exactly $n+1$.
Convergence. Because the index-inequality structure of $I$ makes the independence relation asymmetric under shifting (higher-index generators become independent of more and more lower-index generators), the sequence of nucleus families along the depth tower does not stabilise at any finite depth: the propositional dynamics genuinely changes at each depth level. The depth tower therefore does not degenerate, and the Fischer–Rao geodesic criterion (§3.2) provides the correct convergence framework for the sequence of nuclear distributions $p_n \in \mathcal{P}(\mathcal{M}_n)$.
Mode Sheaf and Spectral Type {#ex5-spectral}
For each trace $t$, the mode sheaf fiber is $V_t = \mathbb{R}^{H_t^\ast}$ (a real vector space with basis the invariant elements of $H_t$). The defect operator $\delta_t : V_t \to V_t$ is the graph Laplacian of the Hasse diagram of $H_t^\ast$ (as in Example IV). As $|t|$ grows, $\dim V_t$ grows and the spectral content of $\delta_t$ becomes richer.
Along the infinite ray $t^{(n)} = a_0 a_1 \cdots a_{n-1}$, the sequence of Hasse-Laplacians $\delta_{t^{(n)}}$ constitutes a sequence of finite-rank operators whose inductive limit is an operator on the Hilbert space $\ell^2(\mathbb{Z}_{\geq 0})$ (using the Cantor-space approximation above). This limiting operator is a Jacobi matrix (tridiagonal, symmetric, bounded) whose coefficients are determined by the combinatorics of the Mazurkiewicz monoid.
Spectral type. The spectral type of such a Jacobi matrix is governed by the theory of one-dimensional Schrödinger operators with aperiodic potentials. For the specific independence relation $I$ chosen:
The potential (diagonal of $\delta_t$) is a quasi-periodic sequence (determined by the index-inequality pattern of $I$), hence falls within the scope of Kotani theory and the Jitomirskaya–Last theorem.
For generic choices of the spectral parameter, the operator has purely singular continuous spectrum — no absolutely continuous part and no pure-point eigenvalues — which is characteristic of quasi-periodic Schrödinger operators away from resonance.
For special parameter choices (the "flat band" condition), $\lambda = 0$ remains a pure-point eigenvalue with spatially localised eigenvector, corresponding to the global stable mode of the system.
All of this spectral content is internal: the Jacobi matrix and its spectral measure are definable within the topos $R$ as an internal bounded operator on an internal Hilbert sheaf obtained by completing the mode sheaf $V$ along the depth tower. The spectral decomposition $V \cong \bigoplus_\lambda E_\lambda$ of Theorem 5.8 applies at each finite depth $n$ (where all fibers are finite-dimensional); the singular continuous spectrum emerges as the limiting behaviour of these finite decompositions.
Summary of Example V. This example constructs an infinite GSU whose:
trace category is a Mazurkiewicz monoid with an asymmetric independence relation producing genuine aperiodicity;
Grothendieck topology enforces multi-step local consistency;
fibers are finite distributive Heyting algebras of unbounded and growing dimension;
invariant locale, viewed along any infinite ray, converges to a Cantor-like compact totally disconnected space via Priestley duality;
and defect operator, in the inductive limit along any infinite ray, is a Jacobi matrix whose spectral type is purely singular continuous for generic parameter values, in accordance with the theory of quasi-periodic Schrödinger operators.
Each individual axiom A0–A6 holds at every finite trace; the fractal and spectral behaviour is a genuine emergent property of the infinite family.

Meta-Results and Consequences {#meta-results}
Let
$$
(T,J,H,\sigma,\Delta)
$$
be primitive data satisfying Axioms A0–A6, and let
$$
R \coloneqq \mathbf{Sh}(T,J)
$$
denote the associated generative sheaf universe.
This section records structural consequences of Axioms A0–A6 and the core theorems from Sections 3–6. No new constructions are introduced; only global properties of $R$ as a generative sheaf universe.
---
Independence from Arbitrary Choices {#independence}
The construction of $R$ depends on a number of seemingly arbitrary choices:
a particular presentation of the trace category $T$,
a particular Grothendieck topology $J$ on $T$,
particular families of modal operators $\sigma,\Delta$ on the fibers,
particular selections of atomic objects (the representables and the distinguished Heyting-modal object $H$ $H$).
The following theorem states that, modulo these data having the same abstract algebraic content, all such choices are unique up to canonical equivalence.
Theorem 8.1 (Presentation independence).
Let
$$
(T,J,H,\sigma,\Delta)
\quad\text{and}\quad
(T',J',H',\sigma',\Delta')
$$
be two primitive data sets satisfying Axioms A0–A6 and representing the same abstract algebraic content (i.e. there is an equivalence of trace sites and fiberwise Heyting-modal structures compatible with all axioms).
Let
$$
R \coloneqq \mathbf{Sh}(T,J),
\qquad
R' \coloneqq \mathbf{Sh}(T',J')
$$
be the associated generative sheaf universees.
Then:
There is an equivalence of toposes
$$
R \simeq R'
$$
induced by the comparison between the two presentations (as in Theorem 3.2).
Under this equivalence:
representable objects in $R$ correspond to representables in $R'$,
the distinguished Heyting-modal object $H$ $H$ corresponds to $H'$,
the fixed subobjects of $H$ correspond to those of $H'$,
the modal operators $\sigma,\Delta$ correspond to $\sigma',\Delta'$,
the generative universe closure operator $U_G$ on $R$ corresponds to the generative universe closure operator $U_G'$ on $R'$.
Consequence 8.1.
The generative sheaf universe $R$ is presentation-free: any two constructions with the same underlying propositional laws yield canonically equivalent universes.
---
Robustness Under Refinement {#robustness}
We consider three kinds of refinement:
Trace refinements.
Replace the trace category $T$ by a finer category
$$
T_{\mathrm{ref}}
$$
that refines the traces but preserves the same partial order or independence structure (e.g. subdividing steps, adding intermediate traces that do not change the abstract independence/combinatorics).
Topological refinements.
Strengthen the Grothendieck topology $J$ to a topology
$$
J_{\mathrm{ref}}
\supseteq J
$$
by adding covers that are generated from the original ones (i.e. by closing under standard Grothendieck operations starting from covers already in $J$).
Modal refinements.
Refine the modal operators $\sigma,\Delta$ to operators
$$
\sigma_{\mathrm{ref}},\ \Delta_{\mathrm{ref}}
$$
by precomposition with internal equivalences or endomorphisms of the fibers that preserve invariants and respect the Heyting-modal structure.
The following theorem states that such refinements do not change the resulting generative sheaf universe.
Theorem 8.2 (Refinement invariance).
Let
$$
(T_{\mathrm{ref}},J_{\mathrm{ref}})
$$
be a refinement of $(T,J)$ in the sense above, and assume the fiberwise primitive data $(H,\sigma,\Delta)$ are refined compatibly to $(H_{\mathrm{ref}},\sigma_{\mathrm{ref}},\Delta_{\mathrm{ref}})$.
Then the associated sheaf toposes are equivalent:
$$
\mathbf{Sh}(T_{\mathrm{ref}},J_{\mathrm{ref}})
;\simeq;
\mathbf{Sh}(T,J),
$$
and this equivalence extends to an equivalence of generative sheaf universees, preserving the distinguished structure (representables, $H$, invariants, modal operators, and the generative closure operator).
Consequence 8.2.
The GSU structure is robust under local refinements: one may increase the granularity of traces, topology, or modal structure without changing the global mathematics of the generative sheaf universe.
---
Modularity and Extensibility {#modularity}
By Axiom A6, the primitive structural operations of the generative sheaf universe form a finite specified set (e.g. products, exponentials, subobject formation, certain modal operations, and so on). Section 4 defined a generative universe closure operator
$$
G \colon \mathbf{Sub}(R) \to \mathbf{Sub}(R)
$$
whose least fixed point describes the full generative sheaf universe.
Because of this closure mechanism:
new objects of $R$,
new internal morphisms of $R$,
new internal logical forms in the internal Heyting-modal logic
arise only from iterated application of the allowed primitive operations, exponentials, subobjects, gluing, and reindexing.
Theorem 8.3 (Modularity).
Let $\widetilde{R}$ be an extension of the generative sheaf universe $R$ obtained by adding additional internal operations (e.g. new modal operators, new logical constructors, or new fiberwise algebraic operations).
Then exactly one of the following holds:
Each added operation factors through the existing generative universe closure $U_G$, i.e. it is definable from the existing structure of $R$. In this case, the “extension” is conservative: $\widetilde{R}$ is (up to equivalence) just $R$.
At least one added operation fails to commute with reindexing, fails to respect sheaf gluing, or fails to respect the modal/invariant structure required by Axioms A0–A6. In this case, $\widetilde{R}$ is not a generative sheaf universe.
Equivalently, an added operator or term constructor is definable in the generative sheaf universe if and only if it is:
natural with respect to reindexing along $T$,
compatible with sheaf gluing for the topology $J$,
compatible with the given modal structure $\sigma,\Delta$ and invariants.
Consequence 8.3.
The generative sheaf universe is maximally expressive subject to Axioms A0–A6: no genuinely new primitive operation can be added without breaking the axioms that define GSU structure.
---
Applicability Across Fields {#applicability}
The GSU axioms A0–A6 are intentionally low-level and structural. Many different mathematical and applied contexts supply instances of the required data:
Concurrency theory.
Traces $T$ model Mazurkiewicz sequences or partially ordered executions; translation nuclei represent dependency relaxations; invariants model stable states.
Logic and type theory.
The object $H$ becomes a semantics for a rich dependent type theory with modalities; invariants are stable or “persistent” propositions.
Topos-theoretic geometry.
The category $T$ is a combinatorial base space; the invariant locale
$$
\mathrm{Phase} \subseteq H
$$
(Section 5) is an internal space with fractal or quasicrystalline structure.
Dynamical systems.
Flows and nuclei model contracting/expanding directions; invariants correspond to attractors, basins, or other stable structures.
Quantum logic and modal semantics.
Flows behave like dynamic modalities; nuclei correspond to Lawvere–Tierney style closure operators; invariants are “definite” or stabilized propositions.
The following theorem states the general interoperability pattern.
Theorem 8.4 (Cross-disciplinary interoperability).
Let a domain provide:
a partially commutative or partially ordered temporal structure $T$ encoding admissible trace shapes,
a family of finite Heyting algebras with commuting modal operators along $T$,
a Grothendieck topology $J$ on $T$ encoding locality and gluing constraints,
in such a way that Axioms A0–A6 are satisfied.
Then there exists a generative sheaf universe $R = \mathbf{Sh}(T,J)$ whose internal Heyting-modal logic and invariant structure provide a sound and complete semantic model for the domain’s intended notions of time, modality, and stability.
Consequence 8.4.
The generative sheaf universe gives a single abstract framework into which multiple fields embed: each such domain can be realized as an instance of GSU structure, with its semantics internalized in $R$.
---
Generative Universality {#generative-universality}
Section 4 introduced a generative universe closure operator $U_G$ on the objects of $R$, and established:
a fixed-point theorem (Theorem 4.4) showing that $R$ is the least fixed point of $U_G$,
an initiality theorem (Theorem 4.5) showing that $R$ is initial among all models of Axioms A0–A6 equipped with the same notion of primitive data.
These results can be summarized as follows.
Theorem 8.5 (Universal GSU).
Let $(E,\dots)$ be any model of Axioms A0–A6 (a “GSU model” in any elementary topos $E$), equipped with:
a trace site $(T_E,J_E)$,
a propositional-modal object $H_E$ with modal operators $\sigma_E,\Delta_E$,
a generative universe closure operator $U_G^E$ satisfying the same axioms.
Then there exists a unique geometric morphism of toposes
$$
f \colon R \to E
$$
preserving all distinguished GSU structure (representables, $H$, invariants, modal operators, and generative closure).
In particular, $R$ is initial among GSU models: every other model factors uniquely through $R$.
Consequence 8.5.
The generative sheaf universe $R$ is canonical: any structure satisfying A0–A6 arises as a unique GSU-structure-preserving functor out of $R$.
---
Conceptual Summary {#conceptual-summary}
Collecting the previous results:
$R$ is self-generated: it is the least fixed point of its own internal generative universe closure operator $U_G$.
$R$ is initial among models of Axioms A0–A6: it is the universal generative sheaf universe.
$R$ has local-to-global geometric structure: it is a sheaf topos $\mathbf{Sh}(T,J)$ over a trace site.
$R$ has modal internal dynamics: translation nuclei and saturation nuclei induce a rich internal modal propositional logic with fixed points.
$R$ has a stable invariant locale (the internal phase space) with potentially fractal or quasicrystalline features.
$R$ supports internal defect‑mode theory for defect operators arising from translation nucleus dynamics and fixed structure.
$R$ is robust, modular, and interoperable: it is independent of arbitrary presentations, stable under refinement, maximal with respect to its axioms, and applicable across multiple disciplines.
In this sense, the generative sheaf universe is a mathematically natural object: a modal, quasicrystalline, self-generating internal geometric logic.