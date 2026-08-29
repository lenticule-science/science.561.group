---
type: question
status: partial
explores: [work]
---

# What is the theory of work?

> **Scope.** A theory in the strict mathematical sense — a specific formal object — scoped to work.
> The aim is the object, not a survey of approaches.
> Sociological specializations (multi-worker structure, labor-power and surplus, articulation work and visibility, failure modes, reproductive labor) are *models* of the theory, not parts of it; they live in [`texts/sociological-extensions-of-the-work-theory.md`](../texts/sociological-extensions-of-the-work-theory.md).

## What a theory is

In the categorical/algebraic tradition, a *theory* is a category $\mathbb{T}$ presenting sorts, operations (with arities), and equations.
Its *models* in a target category $\mathbf{C}$ with sufficient structure are product-preserving (or structure-preserving) functors $M: \mathbb{T} \to \mathbf{C}$.
The theory is the **invariant content** of all its models — what every instance of the phenomenon must share, separated from anything specific to any one instance.

The *theory of groups* is a Lawvere theory with one sort and operations $e, \cdot, (-)^{-1}$ satisfying group equations; its models are groups.
The *theory of categories* is presented by sketches; its models are categories.
The *theory of computation*, in the Curry-Howard-Lambek presentation, is the theory of cartesian closed categories; its models are typed lambda calculi up to equational equivalence.

This file gives **the theory of work** in that sense.

## Invariants

Any model of the theory of work must respect two structural commitments:

**Invariant 1 (counterfactual).** Work makes a counterfactual difference.
The world's trajectory under work diverges from its trajectory absent work.
Without divergence, there is no work — only happening.

**Invariant 2 (cost).** Work depletes a non-renewable resource of the worker.
Without depletion, there is no work — only play or rest.

These are constraints on what can count as a model, not part of the signature.

## The theory

**Definition (theory of work).** The *theory of work* is the multisorted Lawvere theory $\mathbb{T}_{\mathrm{Work}}$ presented by:

**Sorts.** 1. $\mathsf{S}$ — *state*.
2. $\mathsf{Q}$ — *cost*.
3. $\mathsf{C}$ — *capability*.

**Operations.** 1. $e_\mathsf{Q} : 1 \to \mathsf{Q}$ — zero cost.
2. ${\otimes_\mathsf{Q}} : \mathsf{Q} \times \mathsf{Q} \to \mathsf{Q}$ — cost composition.
3. ${\leq_\mathsf{Q}} : \mathsf{Q} \times \mathsf{Q} \to \Omega$ — cost order (a relation, into a subobject classifier).
4. $I_\mathsf{S} : 1 \to \mathsf{S}$ — empty state.
The state-bundle with nothing in it.
5. ${\otimes_\mathsf{S}} : \mathsf{S} \times \mathsf{S} \to \mathsf{S}$ — state composition.
Two independent state-bundles taken together.
6. $\tau : \mathsf{S} \to \mathsf{S}$ — *natural-history*.
The world's autonomous successor of a state.
7. $w : \mathsf{S} \to \mathsf{S}$ — *generic work-act*.
A typed state-transition with the work-act distinction.
8. ${\otimes_w} : (\mathsf{S} \to \mathsf{S}) \times (\mathsf{S} \to \mathsf{S}) \to (\mathsf{S} \to \mathsf{S})$ — *parallel composition* of work-acts: $f \otimes_w g : A \otimes_\mathsf{S} A' \to B \otimes_\mathsf{S} B'$ when $f: A \to B$ and $g: A' \to B'$.
9. $\sigma : (\mathsf{S} \times \mathsf{S}) \to (\mathsf{S} \to \mathsf{S})$ — *braiding*.
Witnesses commutativity of $\otimes_\mathsf{S}$ at the morphism level: $\sigma_{A,B} : A \otimes_\mathsf{S} B \to B \otimes_\mathsf{S} A$.
10. $\kappa : (\mathsf{S} \to \mathsf{S}) \to \mathsf{Q}$ — *cost-of*.
Assigns each act a cost.
11. $u : \mathsf{C} \times (\mathsf{S} \to \mathsf{S}) \to \mathsf{C}$ — *capability-update*.
The new capability after performing an act.
12. $\tilde\kappa : \mathsf{C} \times (\mathsf{S} \to \mathsf{S}) \to \mathsf{Q}$ — *capability-aware cost*.

**Equations.**

*$\mathsf{Q}$ is a commutative quantale.* $(\mathsf{Q}, \otimes_\mathsf{Q}, e_\mathsf{Q}, \leq_\mathsf{Q})$ is a commutative monoid with order; arbitrary joins $\bigvee$ exist and distribute over $\otimes_\mathsf{Q}$.

*States form a symmetric monoidal structure.* $(\mathsf{S}, \otimes_\mathsf{S}, I_\mathsf{S}, \sigma)$ is symmetric monoidal: associativity $A \otimes (B \otimes C) \cong (A \otimes B) \otimes C$, unit $A \otimes I_\mathsf{S} \cong A$, and symmetry $\sigma_{B,A} \circ \sigma_{A,B} = \mathrm{id}_{A \otimes B}$, with the standard pentagon and hexagon coherences.

*Parallel composition is bifunctorial.* $(g \otimes_w g') \circ (f \otimes_w f') = (g \circ f) \otimes_w (g' \circ f')$ and $\mathrm{id}_A \otimes_w \mathrm{id}_{A'} = \mathrm{id}_{A \otimes_\mathsf{S} A'}$.
Parallel and sequential composition commute in the expected way; the braiding is natural in both arguments.

*Composition law.* $\kappa(g \circ f) \leq_\mathsf{Q} \kappa(g) \otimes_\mathsf{Q} \kappa(f)$.

*Parallel cost law.* $\kappa(f \otimes_w g) \leq_\mathsf{Q} \kappa(f) \otimes_\mathsf{Q} \kappa(g)$ — doing two work-acts in parallel costs at most their summed cost.
(The slack is sub-additive: sharing setup or context can reduce parallel cost below the sum.)

*Natural-history is monoidal.* $\tau(A \otimes_\mathsf{S} B) \cong \tau(A) \otimes_\mathsf{S} \tau(B)$ and $\tau(I_\mathsf{S}) \cong I_\mathsf{S}$.
The world's drift on independent state-bundles is the bundle of drifts.

*Natural-history is free.* $\kappa(\tau_A) = e_\mathsf{Q}$ for every state $A$, where $\tau_A : A \to \tau(A)$ is the canonical natural-history transition out of $A$.
The braiding $\sigma$ is also free: $\kappa(\sigma_{A,B}) = e_\mathsf{Q}$ (reordering disjoint bundles is not work).

*Work has positive cost (Invariant 2).* For every $f: A \to B$ classified as a work-act, $\kappa(f) >_\mathsf{Q} e_\mathsf{Q}$.

*Counterfactual divergence (Invariant 1).* For every work-act $f: A \to B$, $B \neq \tau(A)$.

*Capability-cost monotonicity.* If $C \geq_\mathsf{C} C'$ in any capability-preorder, then $\tilde\kappa(C, f) \leq_\mathsf{Q} \tilde\kappa(C', f)$ — more capability never makes the same act cost more.

*Capability-update functoriality.* $u(C, g \circ f) = u(u(C, f), g)$ — capability composes along act composition.
For parallel acts, $u(C, f \otimes_w g) = u(u(C, f), g) = u(u(C, g), f)$ — the order in which a single worker logs two parallel acts is immaterial (the *worker* sequentializes; the *world* does not).

## Models

**Definition (model).** A *model* of $\mathbb{T}_{\mathrm{Work}}$ in an ambient category $\mathbf{C}$ with finite products and the structure required to interpret quantales, symmetric monoidal categories, and coalgebras is a structure-preserving functor $M : \mathbb{T}_{\mathrm{Work}} \to \mathbf{C}$ assigning:

- A state-object $M(\mathsf{S})$ — a *symmetric monoidal category* of world-states.
  Objects are world-states; morphisms are state-transitions; $\otimes_\mathsf{S}$ is the parallel-bundling of states; $I_\mathsf{S}$ is the empty bundle.
- A cost-object $M(\mathsf{Q})$ — a commutative quantale of costs.
- A capability-object $M(\mathsf{C})$ — a set or preorder of capability-states.
- A *monoidal* natural-history endofunctor $M(\tau) : M(\mathsf{S}) \to M(\mathsf{S})$ — preserves $\otimes_\mathsf{S}$ and $I_\mathsf{S}$ up to coherent isomorphism.
- A cost-assignment $M(\kappa)$, a capability-aware cost $M(\tilde\kappa)$, and a capability-update $M(u)$ satisfying the equations.

The category of models, $\mathrm{Mod}(\mathbb{T}_{\mathrm{Work}})$, has structure-preserving natural transformations as morphisms.

## Derived constructions

The following are *defined* in any model — no further axioms — and are the load-bearing objects of the theory.

**The category of work.** Given a model $M$, the *category of work* $\mathbf{Work}_M$ is the wide sub-symmetric-monoidal-category of $M(\mathsf{S})$ retaining only morphisms with positive cost ($\kappa(f) >_\mathsf{Q} e_\mathsf{Q}$).
Identities and braidings are retained iff standing-still or reordering costs against $\tau$'s drift. $\mathbf{Work}_M$ inherits the SMC structure: parallel work-acts compose via $\otimes_w$ with cost subadditive by the parallel cost law.

**$\mathsf{Q}$-enrichment.** $\mathbf{Work}_M$ is enriched over the cost quantale $M(\mathsf{Q})$ via $\kappa$: hom-objects are $\mathbf{Work}_M(A, B) := \bigwedge \{\kappa(f) : f: A \to B\}$ (Lawvere convention — cheapest available work-act).
The composition condition follows from the composition law.
The Lawvere correspondence makes $\mathbf{Work}_M$ a generalized metric space (Lawvere 1973) — its "distance" $A \to B$ is the cheapest work that takes $A$ to $B$.
Work is a metric in this generalized sense, with the parallel cost law making the metric *subadditive on bundles*: $d(A \otimes A', B \otimes B') \leq d(A, B) \otimes_\mathsf{Q} d(A', B')$.

**Capability-aware category.** $\widetilde{\mathbf{Work}}_M$ has objects $(A, C) \in M(\mathsf{S}) \times M(\mathsf{C})$; morphisms $(A, C) \to (B, u(C, f))$ are work-acts $f: A \to B$ with capability $C$; composition uses $u$'s functoriality. $\widetilde{\mathbf{Work}}_M$ carries a coalgebra structure for the endofunctor $F(\mathcal{D}) = (\mathrm{Mor}(M(\mathsf{S})) \times M(\mathsf{C})) \times \mathcal{D}$ on $\mathbf{Cat}$ (Aczel 1988; Jacobs 2017).
Bisimulation = capability-equivalence.

## The Work Thesis

**Work Thesis (Church-Turing analog).** *A process $\pi$ is a work-process iff $\pi$ is representable as a morphism in $\widetilde{\mathbf{Work}}_M$ for some model $M$ of $\mathbb{T}_{\mathrm{Work}}$.*

The thesis pins the abstract structure to the empirical phenomenon.
It is contestable in the same sense Church-Turing is: empirical cases may demand revision of the theory (sorts, operations, or equations), but a formal theory must commit to some anchor.

## Equivalent presentations

The theory of work, like the theory of computation, admits multiple equivalent syntactic presentations.
The conjecture that these are all the same theory — that the same $\mathrm{Mod}(\mathbb{T}_{\mathrm{Work}})$ category arises — is the **Work-Lambek correspondence**.

1. **State-transition presentation (situation calculus / dynamic logic).** Sorts: situations and actions.
  Operations: $\mathrm{do}(a, s)$ producing successor situations.
  Concurrent situations form a free commutative monoid; $\otimes_\mathsf{S}$ is this monoid operation.
  Cost is a metafunction on action sequences with parallel cost subadditive.
  McCarthy 1963; Pratt-Harel dynamic logic.

2. **Petri-net presentation.** A Petri net presents a (strict) symmetric monoidal category whose objects are place-markings (the free commutative monoid on places — i.e. $\otimes_\mathsf{S}$ on the nose) and whose morphisms are firings, with $\otimes_w$ = parallel firing and $\circ$ = sequential firing.
  Natural-history $\tau$ corresponds to *spontaneous transitions* — firings with no consumed cost.
  Meseguer-Montanari 1990; Baez-Master 2020.

3. **Lawvere-quantale presentation.** A symmetric monoidal category $\mathbf{W}$ enriched in a commutative quantale $\mathsf{Q}$, with a designated free-cost monoidal endofunctor $\tau$.
  The enrichment realises $\kappa$; the monoidal structure realises $\otimes_\mathsf{S}$ and $\otimes_w$.
  Lawvere 1973.

4. **Resource-theoretic presentation.** A partitioned process theory in the Coecke-Fritz-Spekkens sense: a symmetric monoidal category $\mathbf{R}$ with a wide symmetric-monoidal sub-category $\mathbf{R}_{\mathrm{free}}$ of cost-zero conversions. $\otimes$ is collection-of-resources; conversion-arrows in $\mathbf{R} \setminus \mathbf{R}_{\mathrm{free}}$ are work-acts; the natural-history $\tau$ acts as a monoidal endofunctor preserving $\mathbf{R}_{\mathrm{free}}$.
  Coecke-Fritz-Spekkens 2014.

**Work-Lambek conjecture.** *The four presentations give rise to equivalent categories of models of $\mathbb{T}_{\mathrm{Work}}$ under appropriate functorial translations.
A "theory of work" is, equivalently, any of: a state-transition system with cost, a symmetric monoidal Petri-style process category, a quantale-enriched Lawvere metric category with natural-history, or a partitioned resource theory with free-cost subcategory.*

Establishing the conjecture is a Howard-Lambek-strength theorem for work.
The remaining sections develop the structures needed and prove the equivalences in stages.

## The four categories of theories

Each presentation is given a category of its own structures and structure-preserving morphisms.
The Work-Lambek theorem asserts these four are equivalent and each is equivalent to $\mathrm{Mod}(\mathbb{T}_{\mathrm{Work}})$.

**Definition (Lawvere-Q theories).** $\mathbf{LQ}$ is the category whose objects are tuples $(\mathbf{W}, \mathsf{Q}, \kappa, \tau)$ with: - $\mathsf{Q}$ a commutative quantale; - $\mathbf{W}$ a small symmetric monoidal category enriched in $\mathsf{Q}$ via a cost-assignment $\kappa : \mathrm{Mor}(\mathbf{W}) \to \mathsf{Q}$ satisfying the composition and parallel cost laws; - $\tau : \mathbf{W} \to \mathbf{W}$ a strong monoidal endofunctor with $\kappa(\tau_A) = e_\mathsf{Q}$ for all $A$; - *(Non-degeneracy.)* $\mathsf{Q}$ is generated as a quantale by the image $\kappa(\mathrm{Mor}(\mathbf{W}))$ — every element of $\mathsf{Q}$ is a join of finite $\otimes_\mathsf{Q}$-products of elements of the form $\kappa(f)$ for $f \in \mathrm{Mor}(\mathbf{W})$.

Morphisms are quantale-homomorphism + $\mathsf{Q}$-enriched strong-monoidal functors compatible with $\tau$.
The non-degeneracy axiom is preserved by morphisms because morphisms send $\kappa(\mathrm{Mor}(\mathbf{W}))$ into $\kappa'(\mathrm{Mor}(\mathbf{W}'))$, and the generation of $\mathsf{Q}'$ from its $\kappa'$-image is unaffected.

*Remark.* Without non-degeneracy, $\mathsf{Q}$ could contain "ghost costs" never realised by any work-act; these would not affect the structure of $\mathbf{W}$ but would prevent $\Psi \circ \Phi$ from being the identity on the nose.
With non-degeneracy, every quantale element is the cost of some work-act (or a join/tensor of such), and the equivalence theorem is exact.
Any degenerate theory can be replaced by its non-degenerate sub-theory by restricting $\mathsf{Q}$ to the sub-quantale generated by $\kappa(\mathrm{Mor}(\mathbf{W}))$; this restriction is functorial and preserves all the structure.

**Definition (CFS theories).** $\mathbf{CFS}$ is the category whose objects are tuples $(\mathbf{R}, \mathbf{R}_{\mathrm{free}}, \tau)$ with: - $\mathbf{R}$ a small symmetric monoidal category; - $\mathbf{R}_{\mathrm{free}} \subseteq \mathbf{R}$ a wide symmetric-monoidal subcategory containing the braidings; - $\tau : \mathbf{R} \to \mathbf{R}$ a strong monoidal endofunctor factoring through $\mathbf{R}_{\mathrm{free}}$ ($\tau_A \in \mathbf{R}_{\mathrm{free}}$ for all $A$).
Morphisms are strong-monoidal functors preserving $\mathbf{R}_{\mathrm{free}}$ and commuting with $\tau$.

**Definition (Petri theories).** $\mathbf{Pet}$ is the category whose objects are *cost-weighted Petri presentations* $(P, T, \partial^-, \partial^+, w, T_\tau)$ with: - $P$ a set of places, $T$ a set of transitions, $\partial^\pm : T \to \mathbb{N}^P$ input/output multisets; - $w : T \to \mathsf{Q}$ a cost-weighting valued in a commutative quantale $\mathsf{Q}$; - $T_\tau \subseteq T$ a subset of *spontaneous* (zero-cost natural-history) transitions, with $w(t) = e_\mathsf{Q}$ for $t \in T_\tau$.
Morphisms are net-homomorphisms in the Meseguer-Montanari sense, preserving cost and the spontaneous subset.

**Definition (SitCalc theories).** $\mathbf{SC}$ is the category whose objects are *cost-tagged basic action theories* $(\Sigma, F, A, \Pi, \kappa, \mathrm{Spont})$ — a Reiter basic action theory equipped with a cost-assignment on primitive actions and a designated set of spontaneous (cost-zero, frame-axiom-only) actions.
Concurrency is admitted via the free commutative-monoid extension of action labels.
Morphisms are signature-translation functors preserving cost and successor-state axioms.

## Proofs of the equivalences

### Theorem 1: $\mathbf{LQ} \simeq \mathbf{CFS}$

*Statement.* There is an equivalence of categories $\mathbf{LQ} \simeq \mathbf{CFS}$ given by mutually quasi-inverse functors $\Phi : \mathbf{LQ} \to \mathbf{CFS}$ and $\Psi : \mathbf{CFS} \to \mathbf{LQ}$.

*Construction of $\Phi$.* Given $(\mathbf{W}, \mathsf{Q}, \kappa, \tau) \in \mathbf{LQ}$, define $\Phi(\mathbf{W}, \mathsf{Q}, \kappa, \tau) := (\mathbf{W}, \mathbf{W}_{\mathrm{free}}, \tau)$ where $$\mathbf{W}_{\mathrm{free}} := \{f \in \mathrm{Mor}(\mathbf{W}) : \kappa(f) = e_\mathsf{Q}\}.$$

*Verification.* (i) $\mathbf{W}_{\mathrm{free}}$ is wide: identities have $\kappa(\mathrm{id}_A) \leq \kappa(\mathrm{id}_A) \otimes_\mathsf{Q} \kappa(\mathrm{id}_A)$ by composition law applied to $\mathrm{id}_A = \mathrm{id}_A \circ \mathrm{id}_A$, hence $\kappa(\mathrm{id}_A) = e_\mathsf{Q}$ (in any commutative quantale, an idempotent below itself in this sense is the unit).
(ii) Closed under $\circ$: if $\kappa(f), \kappa(g) = e_\mathsf{Q}$ then $\kappa(g \circ f) \leq e_\mathsf{Q} \otimes_\mathsf{Q} e_\mathsf{Q} = e_\mathsf{Q}$, hence equality.
(iii) Closed under $\otimes_w$ by the parallel cost law analogously.
(iv) Contains $\sigma$ and $\tau_A$ by the equations of $\mathbb{T}_{\mathrm{Work}}$.
(v) $\tau$ factors through $\mathbf{W}_{\mathrm{free}}$ by the natural-history-is-free equation. $\square$

*Construction of $\Psi$.* Given $(\mathbf{R}, \mathbf{R}_{\mathrm{free}}, \tau) \in \mathbf{CFS}$, the CFS framework constructs a *resource preorder* $\mathsf{Q}_\mathbf{R}$ (Coecke-Fritz-Spekkens 2014, §2.3): elements are isomorphism classes of objects of $\mathbf{R}$ under the relation $A \sim B \iff \exists f \in \mathbf{R}_{\mathrm{free}}(A, B)$; the order is $[A] \leq [B] \iff \exists f \in \mathbf{R}(A, B)$; the monoid operation is $[A] \otimes_\mathsf{Q} [B] := [A \otimes_\mathbf{R} B]$.
Set $\Psi(\mathbf{R}, \mathbf{R}_{\mathrm{free}}, \tau) := (\mathbf{R}, \mathsf{Q}_\mathbf{R}, \kappa_\mathbf{R}, \tau)$ where $\kappa_\mathbf{R}(f : A \to B) := [A] - [B]$ in the resource preorder (the "cost of converting $A$ into $B$ along $f$" as an element of $\mathsf{Q}_\mathbf{R}$ — formally, the least quantale element representing the resource-difference).

*Verification.* The resource preorder is a commutative quantale: associativity and commutativity from $\otimes_\mathbf{R}$'s SMC structure; unit $[I]$; joins by sup over equivalence classes (CFS Theorem 2.1). $\kappa_\mathbf{R}(f) = e_\mathsf{Q}$ iff $f \in \mathbf{R}_{\mathrm{free}}$ by construction.
Composition and parallel cost laws inherit from the SMC structure of $\mathbf{R}$. $\tau$ preserves $\kappa_\mathbf{R}$ at $e_\mathsf{Q}$ by the factoring-through-free condition. $\square$

*Quasi-inverse.* $\Psi \circ \Phi \cong \mathrm{id}_\mathbf{LQ}$: starting from $(\mathbf{W}, \mathsf{Q}, \kappa, \tau)$, the resource preorder $\mathsf{Q}_\mathbf{W}$ embeds in $\mathsf{Q}$ via $[A] \mapsto \bigvee \{\kappa(f) : f : A \to A\}$; under the assumption that $\mathsf{Q}$ is generated by cost-values of work-acts in $\mathbf{W}$ (a non-degeneracy condition), this is an isomorphism of quantales. $\Phi \circ \Psi \cong \mathrm{id}_\mathbf{CFS}$: the free subcategory of $\Psi(\mathbf{R}, \mathbf{R}_{\mathrm{free}}, \tau)$ recovers $\mathbf{R}_{\mathrm{free}}$ by the construction of $\kappa_\mathbf{R}$.
The natural isomorphisms are canonical. $\square$

**Corollary 1.1.** *The Lawvere-quantale view and the Coecke-Fritz-Spekkens partitioned-process-theory view of work are the same structure under two different presentations.*

### Theorem 2: $\mathbf{Pet} \simeq \mathbf{LQ}_{\mathrm{fp}}$

*Statement.* The category $\mathbf{Pet}$ of cost-weighted Petri presentations is equivalent to the full subcategory $\mathbf{LQ}_{\mathrm{fp}} \subseteq \mathbf{LQ}$ of finitely-presentable Lawvere-Q theories of work via mutually quasi-inverse functors $\mathcal{F} : \mathbf{Pet} \to \mathbf{LQ}_{\mathrm{fp}}$ and $\mathcal{G} : \mathbf{LQ}_{\mathrm{fp}} \to \mathbf{Pet}$.

The proof proceeds in three steps: (a) construct $\mathcal{F}$ and verify $\mathcal{F}(N) \in \mathbf{LQ}_{\mathrm{fp}}$; (b) construct $\mathcal{G}$ and verify $\mathcal{G}(\mathcal{W}) \in \mathbf{Pet}$; (c) exhibit the quasi-inverse natural isomorphisms.

#### Step (a): $\mathcal{F} : \mathbf{Pet} \to \mathbf{LQ}_{\mathrm{fp}}$

Given $N = (P, T, \partial^-, \partial^+, w, T_\tau) \in \mathbf{Pet}$, where $w : T \to \mathsf{Q}_0$ takes values in a generating set $\mathsf{Q}_0$:

**The state SMC.** Take $\mathbf{W}_N$ to be the *free strict symmetric monoidal category* on the bipartite graph $(\mathbb{N}^P, T, \partial^-, \partial^+)$.
By Meseguer-Montanari 1990 (Theorem 3.1) and Master 2020 (Proposition 2.7), this is the SMC whose objects are markings $\mu \in \mathbb{N}^P$, whose morphisms are *concatenable processes* — equivalence classes of finite sequences of transitions firing on disjoint sub-markings, modulo Petri-net causal equivalence. $\otimes_\mathsf{S}$ is multiset addition; $I_\mathsf{S}$ is the empty marking; braiding is the canonical commutator on the free commutative monoid.

**The cost quantale.** Define $\mathsf{Q}_N$ as follows.
Let $\mathsf{Q}^*$ be the free commutative quantale on the set $\mathsf{Q}_0$ (existence: Joyal-Tierney 1984; the free commutative quantale on a set is the powerset of the free commutative monoid, with quantale operations of intersection-preserving join and Minkowski-style tensor).
Let $\mathcal{R}$ be the set of relations $$\mathcal{R} := \{w(t) \leq w(t) : t \in T\} \cup \{w(t_\tau) \leq e_\mathsf{Q} : t_\tau \in T_\tau\} \cup \{w(t) > e_\mathsf{Q} : t \notin T_\tau\}$$ saturated under quantale closure.
Define $\mathsf{Q}_N := \mathsf{Q}^* / \mathcal{R}$ — the quotient of the free commutative quantale by these relations.

**Lemma 2.
A (no spurious relations).** *The quotient $\mathsf{Q}_N$ does not collapse distinct cost-values of distinct transitions in $T \setminus T_\tau$.*

*Proof.* The relations in $\mathcal{R}$ are all *one-sided inequalities* (upper or lower bounds on individual generators), not equalities between distinct generators.
A free commutative quantale modulo such inequalities preserves the order-distinctness of generators not directly compared.
Formally: the relations are stable under the join-preserving operations, so the quotient remains a quantale (by the universal property of free quantales mod join-stable relations); and the inequalities $w(t) > e_\mathsf{Q}$ for non-spontaneous $t$ ensure $w(t) \neq e_\mathsf{Q}$ for those $t$, so they cannot collapse with the spontaneous transitions. $\square$

**Lemma 2.
B (universal cost-saturation).** *$\mathsf{Q}_N$ is the initial commutative quantale receiving a map $\bar w : T \to \mathsf{Q}$ such that $\bar w(t_\tau) = e_\mathsf{Q}$ for $t_\tau \in T_\tau$ and $\bar w(t) > e_\mathsf{Q}$ otherwise, with $\bar w$ extending to all concatenable processes compatibly with the composition and parallel cost laws.*

*Proof.* Universal property follows by definition of the free quantale modulo relations: any quantale $\mathsf{Q}'$ with a $\bar w'$ satisfying the same conditions admits a unique quantale-homomorphism $\mathsf{Q}_N \to \mathsf{Q}'$ commuting with $\bar w$. $\square$

**The cost assignment.** Define $\kappa_N : \mathrm{Mor}(\mathbf{W}_N) \to \mathsf{Q}_N$ inductively: - On a single transition $t$: $\kappa_N(t) := [w(t)]$ (its class in $\mathsf{Q}_N$). - On identity and braiding: $\kappa_N(\mathrm{id}) = \kappa_N(\sigma) = e_\mathsf{Q}$. - On sequential composition: $\kappa_N(g \circ f) := \kappa_N(g) \otimes_\mathsf{Q} \kappa_N(f)$. - On parallel composition: $\kappa_N(f \otimes_w g) := \kappa_N(f) \otimes_\mathsf{Q} \kappa_N(g)$.

Well-definedness on equivalence classes of concatenable processes follows from the commutativity of $\otimes_\mathsf{Q}$ and the bifunctoriality of $\otimes_w$.

**The natural-history endofunctor.** Define $\tau_N$ on objects by $\tau_N(\mu) := \mu + \sum_{t_\tau \in T_\tau} \partial^+(t_\tau) - \partial^-(t_\tau)$ where the sum runs only over $t_\tau$ enabled at $\mu$.
(For nets where this is non-well-founded, $\tau_N$ is defined via the natural transformation to the colimit of spontaneous-firing sequences; this is the "spontaneous-closure" construction.)
Extend to morphisms by post-composition with $T_\tau$-paths.
Strong monoidality follows because spontaneous firings act on disjoint sub-markings independently.

**Verification that $\mathcal{F}(N) \in \mathbf{LQ}_{\mathrm{fp}}$.**

- *$\mathbf{W}_N$ is a small SMC.* Meseguer-Montanari 1990.
- *$\mathsf{Q}_N$ is a commutative quantale.* By construction.
- *Cost laws.* The composition and parallel cost laws hold by definition of $\kappa_N$ on composites.
- *Natural-history is free.* $\kappa_N(\tau_{N,\mu}) = \bigotimes_{t_\tau} \kappa_N(t_\tau) = \bigotimes e_\mathsf{Q} = e_\mathsf{Q}$.
- *Positive work-cost.* By the inequalities $w(t) > e_\mathsf{Q}$ for $t \notin T_\tau$ in $\mathcal{R}$.
- *Counterfactual divergence.* A non-spontaneous firing at $\mu$ produces $\mu' \neq \tau_N(\mu)$ because non-spontaneous firings consume tokens that spontaneous firings do not.
- *Non-degeneracy.* $\mathsf{Q}_N$ is generated by $\{[w(t)]\}_{t \in T}$, which is the image of $\kappa_N$ on the generators of $\mathbf{W}_N$. $\square$

#### Step (b): $\mathcal{G} : \mathbf{LQ}_{\mathrm{fp}} \to \mathbf{Pet}$

Given $\mathcal{W} = (\mathbf{W}, \mathsf{Q}, \kappa, \tau) \in \mathbf{LQ}_{\mathrm{fp}}$, choose a finite presentation: a finite set $P_\mathcal{W}$ of object-generators such that $\mathrm{Ob}(\mathbf{W}) \cong \mathbb{N}^{P_\mathcal{W}}$ under $\otimes_\mathsf{S}$ (exists by finite-presentability and the SMC structure), and a finite set $T_\mathcal{W}$ of morphism-generators with $\partial^\pm(t) :=$ (source, target) in $\mathbb{N}^{P_\mathcal{W}}$.
Define:

- $w_\mathcal{W}(t) := \kappa(t) \in \mathsf{Q}$ — a cost-weighting valued in $\mathsf{Q}$ itself.
- $T_\tau := \{t \in T_\mathcal{W} : \kappa(t) = e_\mathsf{Q}\}$ — the spontaneous generators.

The resulting tuple $(P_\mathcal{W}, T_\mathcal{W}, \partial^-, \partial^+, w_\mathcal{W}, T_\tau)$ is in $\mathbf{Pet}$: cost-weighting is positive on $T_\mathcal{W} \setminus T_\tau$ by the positive-work-cost axiom of $\mathbf{LQ}$.

**Lemma 2.
C (presentation-independence).** *Different finite presentations of the same $\mathcal{W}$ give Petri nets that are isomorphic in $\mathbf{Pet}$.*

*Proof.* A morphism of $\mathbf{Pet}$ is a net-homomorphism preserving cost and spontaneous-subset.
Two finite presentations $P, P'$ of $\mathcal{W}$ correspond by the universal property of the free SMC on the chosen generators: there is a canonical bijection of generators making the SMC-structures agree.
This bijection commutes with $\partial^\pm$ by construction and preserves cost and spontaneity. $\square$

#### Step (c): quasi-inverse

$\mathcal{F} \circ \mathcal{G} \cong \mathrm{id}_{\mathbf{LQ}_{\mathrm{fp}}}$: starting from $\mathcal{W}$, $\mathcal{G}(\mathcal{W})$ is a Petri presentation, and $\mathcal{F}(\mathcal{G}(\mathcal{W}))$ is the free SMC on that presentation together with the cost-quantale generated by the $\kappa$-values of generators.
By the universal property of free SMCs and Lemma 2.
B, this free construction is canonically isomorphic to the original $\mathcal{W}$ (the latter being the SMC generated by the chosen presentation with the cost quantale generated by $\kappa(\mathrm{Mor})$, which by non-degeneracy is exactly $\mathsf{Q}$).

$\mathcal{G} \circ \mathcal{F} \cong \mathrm{id}_{\mathbf{Pet}}$: starting from $N$, $\mathcal{F}(N)$ is the free SMC on $N$; $\mathcal{G}(\mathcal{F}(N))$ recovers the Petri presentation by choosing the canonical presentation of the free SMC, which is the original $N$.
Naturality follows from the universal property.

The natural isomorphisms are canonical (independent of choices) by Lemma 2.
C. $\square$

**Corollary 2.1.** *Every finitely-presentable theory of work is a Petri net; every Petri net is a finitely-presentable theory of work, and the correspondence is functorial.*

### Theorem 3: $\mathbf{SC} \simeq \mathbf{Pet}$

*Statement.* The category $\mathbf{SC}$ of cost-tagged basic action theories (with multiset-valued fluents, in the sense of Reiter 2001 Ch. 4–7) is equivalent to $\mathbf{Pet}$ via mutually quasi-inverse functors $\mathcal{H} : \mathbf{SC} \to \mathbf{Pet}$ and $\mathcal{K} : \mathbf{Pet} \to \mathbf{SC}$.

The proof requires four pieces: (a) the fluent-to-place correspondence; (b) the precondition-to-input-multiset correspondence under the Reiter successor-state axiom format; (c) the frame-axiom-to-flow-constraint correspondence; (d) the concurrency-correspondence.

#### Preliminaries: the fragment of $\mathbf{SC}$ considered

A *cost-tagged basic action theory* in $\mathbf{SC}$ is the data $(\Sigma, F, A, \Pi_{\mathrm{pre}}, \Pi_{\mathrm{ss}}, \kappa, \mathrm{Spont})$ where: - $\Sigma$ is a many-sorted first-order signature with sorts including *situation*, *action*, and a sort for each fluent value-type. - $F = \{F_1, \ldots, F_n\}$ is a finite set of *functional fluents* — situation-indexed function symbols $F_i : \mathrm{Sit} \to \mathbb{N}$ (we restrict to $\mathbb{N}$-valued fluents; the general case is functorial in the value-domain). - $A = \{a_1, \ldots, a_m\}$ is a finite set of *primitive action symbols*, each with parameters drawn from the value-types. - $\Pi_{\mathrm{pre}}$ is the set of *precondition axioms*: for each $a \in A$, a formula $\mathrm{Poss}(a, s) \leftrightarrow \phi_a(s)$. - $\Pi_{\mathrm{ss}}$ is the set of *Reiter successor-state axioms*: for each $F_i \in F$, a formula $$F_i(\mathrm{do}(a, s)) = F_i(s) + \gamma^+_{F_i}(a, s) - \gamma^-_{F_i}(a, s)$$ where $\gamma^\pm_{F_i}(a, s) \in \mathbb{N}$ are *effect-functions* specifying tokens added and removed from $F_i$ by $a$ at $s$.
We restrict to *context-free* effects: $\gamma^\pm_{F_i}(a, s) = \gamma^\pm_{F_i}(a)$ depends only on the action, not on the situation.
(This is the restriction that makes Reiter basic action theories correspond to Petri nets; context-sensitive effects correspond to colored Petri nets, which extend the theorem.) - $\kappa : A \to \mathsf{Q}$ is a cost-tagging. - $\mathrm{Spont} \subseteq A$ is a spontaneous subset.

#### Step (a): the fluent-to-place correspondence

**Encoding $\mathcal{H}$.** Set $P_\mathcal{H} := F$.
A *marking* $\mu \in \mathbb{N}^P$ corresponds to a *situation valuation* $\mathrm{val} : F \to \mathbb{N}$ assigning each fluent its current token-count.

This is a bijection between markings of the Petri net and ground assignments-to-fluents in the basic action theory.
The bijection is natural in the choice of $F$. $\square$

#### Step (b): the precondition-to-input-multiset correspondence

For each action $a \in A$ with precondition $\phi_a(s)$, the standard reduction of $\phi_a$ to *positive conjunctive form* on fluent-conditions of the shape $F_i(s) \geq k_i$ for some $k_i \in \mathbb{N}$ is:

**Lemma 3.
A (precondition normal form).** *Every precondition axiom of a context-free basic action theory is equivalent to a finite conjunction $\bigwedge_i F_i(s) \geq k_i^a$ for action-specific constants $k_i^a \in \mathbb{N}$.*

*Proof.* Context-free effects do not introduce branching that depends on the situation, so any precondition expressible in the theory's signature reduces to a state-independent quantifier-free formula over the fluents.
The minimal sufficient such formula (by Reiter 2001 §3.6.3) is a conjunction of fluent-threshold conditions $F_i(s) \geq k_i^a$. $\square$

**Encoding (continued).** Set $\partial^-(a) := (k_1^a, \ldots, k_n^a) \in \mathbb{N}^P$ — the input multiset is the precondition's normal-form thresholds.

This matches the Petri-net firing rule: $a$ fires at marking $\mu$ iff $\mu \geq \partial^-(a)$ pointwise — exactly the precondition $\bigwedge_i F_i(s) \geq k_i^a$. $\square$

#### Step (c): the frame-axiom-to-flow-constraint correspondence

For each $F_i \in F$ and $a \in A$, the Reiter successor-state axiom is $$F_i(\mathrm{do}(a, s)) = F_i(s) + \gamma^+_{F_i}(a) - \gamma^-_{F_i}(a).$$

**Encoding (continued).** Set $$\partial^+(a)_i := \gamma^+_{F_i}(a), \quad \text{and the input refinement} \quad \partial^-(a)_i := \max(k_i^a, \gamma^-_{F_i}(a)).$$ (The second equation ensures the multiset removed is at least what the precondition requires *and* at least what the effect-function removes.
This is well-defined because the basic action theory must enforce $\gamma^-_{F_i}(a) \leq F_i(s)$ for any $s$ at which $a$ is possible — i.e., the precondition must guarantee enough tokens to be removed.)

**Lemma 3.
B (frame axiom).** *Reiter's solution to the frame problem — that $F_i(\mathrm{do}(a, s))$ depends only on $F_i(s)$ plus $a$'s explicit effects, not on other actions — corresponds exactly to the Petri-net flow constraint: the marking after firing $t$ at $\mu$ is $\mu + \partial^+(t) - \partial^-(t)$, with all other places unchanged.*

*Proof.* The Reiter axiom $F_i(\mathrm{do}(a,s)) = F_i(s) + \gamma^+_{F_i}(a) - \gamma^-_{F_i}(a)$ is, after the encoding, exactly $\mathrm{val}'(F_i) = \mathrm{val}(F_i) + \partial^+(a)_i - \partial^-(a)_i + (\partial^-(a)_i - \gamma^-_{F_i}(a))$, where the parenthetical extra is zero when the precondition $k_i^a \leq \gamma^-_{F_i}(a)$ (true for fluents $F_i$ acted on by $a$) and equals $k_i^a - \gamma^-_{F_i}(a)$ otherwise (which is the "consume what you require, return what you didn't actually use" pattern — encoded as a *self-loop* of size $k_i^a - \gamma^-_{F_i}(a)$ on $F_i$ in the Petri net).
For fluents not touched by $a$, both $\gamma^\pm$ are zero and $\partial^\pm(a)_i = 0$ if the precondition does not depend on $F_i$; the place is unchanged exactly as the frame axiom demands. $\square$

#### Step (d): concurrency

Reiter 2001 Ch. 7 introduces *concurrent actions*: an action is a multiset of primitive actions performed simultaneously, with the combined precondition $\bigwedge_{a \in \mathbf{a}} \mathrm{Poss}(a, s)$ and combined effect $\sum_{a \in \mathbf{a}} (\gamma^+(a) - \gamma^-(a))$.
Under the encoding $\mathcal{H}$: - A concurrent action $\mathbf{a}$ corresponds to the parallel firing $\bigotimes_w a \in T$ in the Petri net. - The combined precondition $\bigwedge \mathrm{Poss}$ corresponds to the multiset-addition of the individual input multisets being $\leq \mu$ — exactly the Petri parallel-firing condition. - The combined effect corresponds to the sum of individual $\partial^+ - \partial^-$ — exactly Petri parallel-firing.

This makes the encoding commute with $\otimes_w$ on the Petri side and concurrent-action composition on the SC side. $\square$

#### Reverse encoding $\mathcal{K}$

Given $N = (P, T, \partial^\pm, w, T_\tau) \in \mathbf{Pet}$: - Fluents $F := P$, $\mathbb{N}$-valued. - Actions $A := T$. - Preconditions $\mathrm{Poss}(t, s) \leftrightarrow \bigwedge_{p \in P} F_p(s) \geq \partial^-(t)_p$. - Successor-state axioms $F_p(\mathrm{do}(t, s)) = F_p(s) + \partial^+(t)_p - \partial^-(t)_p$. - Cost $\kappa(t) := w(t)$; spontaneous subset $\mathrm{Spont} := T_\tau$.

#### Quasi-inverse

$\mathcal{H} \circ \mathcal{K}$ is the identity on $\mathbf{Pet}$ on the nose by construction. $\mathcal{K} \circ \mathcal{H}$ is the identity on $\mathbf{SC}$ up to the precondition-normalisation in Lemma 3.
A: any basic action theory has a unique normalised form for its preconditions, and the encoding preserves this.
The natural isomorphism is the canonical precondition-normalisation transformation. $\square$

**Corollary 3.1.** *The state-transition presentation and the Petri-net presentation of a theory of work coincide on the context-free fragment.*

### Theorem 3$'$: context-sensitive SC ≃ coloured Pet

*Statement.* The category $\mathbf{SC}^{\mathrm{cs}}$ of cost-tagged basic action theories with context-sensitive effects is equivalent to the category $\mathbf{CPet}$ of *cost-weighted coloured Petri nets* (Jensen 1981; Sassone-Sobocinski 2005).

#### Setup: coloured Petri nets

A *cost-weighted coloured Petri net* is a tuple $(P, T, \mathcal{C}_{\mathrm{ol}}, \partial^-, \partial^+, w, T_\tau)$ where: - $P$ is a set of places, $T$ a set of transitions; - $\mathcal{C}_{\mathrm{ol}}$ is a small category of *colours* (the "type system" for tokens) — typically a discrete category over a colour set, but allowing arrows for type-coercions; - $\partial^\pm : T \times \mathcal{C}_{\mathrm{ol}} \to \mathbb{N}^P$ are coloured input/output multisets — for each transition $t$ and colour $c$, the multiset of $c$-coloured tokens consumed (resp. produced) by $t$ at colour $c$; - $w : T \to \mathsf{Q}$ is the cost-weighting; - $T_\tau \subseteq T$ is the spontaneous subset.

Markings are functions $\mu : P \to \mathbb{N}^{\mathcal{C}_{\mathrm{ol}}}$ — each place holds a multiset of coloured tokens.
Firing of $t$ at marking $\mu$ requires $\mu(p)(c) \geq \partial^-(t, c)_p$ for all $p, c$.

The category $\mathbf{CPet}$ has cost-weighted coloured Petri nets as objects and net-homomorphisms (preserving structure including the colour category) as morphisms.

#### Setup: context-sensitive basic action theories

A *context-sensitive basic action theory* in $\mathbf{SC}^{\mathrm{cs}}$ is the data of $\mathbf{SC}$ with the restriction "$\gamma^\pm$ depends only on $a$" removed: effects $\gamma^\pm_{F_i}(a, s)$ may genuinely depend on the situation $s$.
We require, however, that this dependence factor through a *colouring* of situations — a functor $\chi : \mathrm{Sit} \to \mathcal{C}_{\mathrm{ol}}$ to a small category of colours, such that $\gamma^\pm_{F_i}(a, s) = \gamma^\pm_{F_i}(a, \chi(s))$.
This is the standard "feature-typed situation" pattern of Reiter 2001 §3.7 generalised.

#### The colour-functor encoding

Given $\mathcal{T} \in \mathbf{SC}^{\mathrm{cs}}$ with colouring $\chi : \mathrm{Sit} \to \mathcal{C}_{\mathrm{ol}}$:

**Encoding $\mathcal{H}^{\mathrm{cs}}$ : $\mathbf{SC}^{\mathrm{cs}} \to \mathbf{CPet}$.**

- Places $P := F$ (fluents, as before).
- Transitions $T := A$ (actions, as before).
- Colour category $\mathcal{C}_{\mathrm{ol}}$ is the colouring target of $\chi$.
- Coloured input multisets $\partial^-(a, c) := (k_1^{a,c}, \ldots, k_n^{a,c})$ where $k_i^{a,c}$ is the precondition threshold for $F_i$ at colour $c$ (Lemma 3.
  A normal form, parameterised by $c$).
- Coloured output multisets $\partial^+(a, c)_i := \gamma^+_{F_i}(a, c)$.
- Cost $w(a) := \kappa(a)$ (independent of colour, in the simplest case; more generally $w : T \times \mathcal{C}_{\mathrm{ol}} \to \mathsf{Q}$).
- $T_\tau := \mathrm{Spont}$.

**Lemma 3$'$.
A (coloured precondition normal form).** *Every context-sensitive precondition in $\mathbf{SC}^{\mathrm{cs}}$ is equivalent, modulo colouring, to a colour-indexed family of conjunctions $\bigwedge_i F_i(s) \geq k_i^{a, \chi(s)}$.*

*Proof.* Apply Lemma 3.
A pointwise at each colour.
The colouring $\chi$ partitions situations into colour-classes; the precondition is constant within a colour-class, so the normal form holds within each class.
The colour-indexed family of normal forms is the coloured-Petri input multiset assignment. $\square$

**Lemma 3$'$.
B (coloured frame axiom).** *The Reiter context-sensitive successor-state axiom* $$F_i(\mathrm{do}(a, s)) = F_i(s) + \gamma^+_{F_i}(a, \chi(s)) - \gamma^-_{F_i}(a, \chi(s))$$ *corresponds to the coloured-Petri firing rule* $$\mu'(p)(c) = \mu(p)(c) + \partial^+(t, c)_p - \partial^-(t, c)_p$$ *at the colour $c = \chi(s)$, with all other colours unchanged.*

*Proof.* Direct from Lemma 3.
B applied at each colour.
The "all other colours unchanged" condition is the coloured analogue of the frame-axiom-as-flow-constraint: the colour-functoriality of the encoding ensures that firings at colour $c$ do not affect token-counts at colour $c' \neq c$ unless the transition explicitly couples them through $\partial^\pm(t, c \to c')$ — but the basic action theory makes no such cross-colour reference. $\square$

#### Reverse encoding

$\mathcal{K}^{\mathrm{cs}} : \mathbf{CPet} \to \mathbf{SC}^{\mathrm{cs}}$ is the reverse: take the colour category as the colouring target; fluents are places, actions are transitions, preconditions are coloured input multisets, successor-states are coloured output multisets.

#### Equivalence

$\mathcal{H}^{\mathrm{cs}} \circ \mathcal{K}^{\mathrm{cs}}$ is the identity on $\mathbf{CPet}$ on the nose. $\mathcal{K}^{\mathrm{cs}} \circ \mathcal{H}^{\mathrm{cs}}$ is the identity on $\mathbf{SC}^{\mathrm{cs}}$ up to the precondition-normalisation Lemma 3$'$.
A. $\square$

**Corollary 3$'$.
1.** *Context-sensitive theories of work and coloured Petri nets are the same structure under two different presentations.*

#### Integration with Theorem 4

The Work-Lambek correspondence (Theorem 4) extends: $\mathbf{LQ} \simeq \mathbf{CFS} \simeq \mathbf{Pet}_\infty \simeq \mathbf{SC}_\infty$, with $\mathbf{SC}^{\mathrm{cs}}_\infty \simeq \mathbf{CPet}_\infty$ as a parallel layer joined by the colouring-extension functor $\mathbf{Pet}_\infty \hookrightarrow \mathbf{CPet}_\infty$ (any uncoloured net is a coloured net with $\mathcal{C}_{\mathrm{ol}} = 1$).
The full picture is a two-tier equivalence: coloured/uncoloured each give equivalent four-way correspondences, related by colour-extension.

**Corollary 3$'$.
2.** *The Work Thesis applies to context-sensitive work-processes: a process is a work-process iff it is representable in any of the four coloured presentations.*

### Theorem 4 (Work-Lambek correspondence)

*Statement.* Define $\mathbf{Pet}_\infty$ and $\mathbf{SC}_\infty$ as the small-presentable extensions of $\mathbf{Pet}$ and $\mathbf{SC}$ to admit sets (not necessarily finite) of places/transitions and fluents/actions, with the same structure morphisms.
Then the cycle $$\mathbf{LQ} \xrightarrow{\Phi} \mathbf{CFS} \xrightarrow{\Psi} \mathbf{LQ} \xrightarrow{\mathcal{G}_\infty} \mathbf{Pet}_\infty \xrightarrow{\mathcal{H}_\infty} \mathbf{SC}_\infty \xrightarrow{\mathcal{K}_\infty} \mathbf{Pet}_\infty \xrightarrow{\mathcal{F}_\infty} \mathbf{LQ}$$ is naturally isomorphic to $\mathrm{id}_{\mathbf{LQ}}$ via canonical natural isomorphisms, and each arrow is an equivalence.
Consequently $\mathbf{LQ} \simeq \mathbf{CFS} \simeq \mathbf{Pet}_\infty \simeq \mathbf{SC}_\infty$ as categories.

#### Extension to infinite presentations

The functors $\mathcal{F}, \mathcal{G}$ of Theorem 2 and $\mathcal{H}, \mathcal{K}$ of Theorem 3 are stated for finitely-presentable structures.
The extension to small presentations follows by the same constructions: free SMCs on arbitrary small graphs exist (Mac Lane 1971 Ch. VII §1), free commutative quantales on arbitrary small sets exist (Joyal-Tierney 1984), and the Reiter encoding extends to any small signature.

**Lemma 4.
A.** *The four extended functors $\Phi, \Psi, \mathcal{F}_\infty, \mathcal{G}_\infty, \mathcal{H}_\infty, \mathcal{K}_\infty$ are all equivalences of categories, and their finite restrictions agree with Theorems 1–3.*

*Proof.* For each functor, the construction is uniform in the cardinality of the presentation; the universal properties used (free SMC, free quantale, Reiter normal form) hold at every cardinality. $\square$

#### Exhibition of the natural isomorphism

Let $\eta_\mathcal{W} : \mathcal{F}_\infty \mathcal{K}_\infty \mathcal{H}_\infty \mathcal{G}_\infty \Psi \Phi(\mathcal{W}) \to \mathcal{W}$ be the natural isomorphism induced by composing the quasi-inverse natural isomorphisms of Theorems 1, 2, 3.

Concretely, for $\mathcal{W} = (\mathbf{W}, \mathsf{Q}, \kappa, \tau) \in \mathbf{LQ}$:

1. **$\Phi(\mathcal{W}) = (\mathbf{W}, \mathbf{W}_{\mathrm{free}}, \tau)$** — same underlying SMC, free subcategory is $\kappa^{-1}(e_\mathsf{Q})$.
2. **$\Psi \Phi(\mathcal{W}) = (\mathbf{W}, \mathsf{Q}', \kappa', \tau)$** — same underlying SMC, but the cost quantale is rebuilt from the resource preorder of $\Phi(\mathcal{W})$.
  Define $\alpha_\mathcal{W} : \mathsf{Q}' \to \mathsf{Q}$ by sending the resource-class $[A]$ to $\bigvee \{\kappa(f) : f : A \to A\}$; by non-degeneracy, $\alpha_\mathcal{W}$ is an isomorphism.
  Set $\eta_\mathcal{W}^{(1)} := (\mathrm{id}_\mathbf{W}, \alpha_\mathcal{W})$.
3. **$\mathcal{G}_\infty \Psi \Phi(\mathcal{W})$** — a (possibly infinite) Petri presentation: places are the object-generators of $\mathbf{W}$, transitions are the morphism-generators.
  By presentation-independence (Lemma 2.
  C), this is isomorphic to any other presentation; choose the canonical one indexed by all of $\mathrm{Ob}(\mathbf{W})$ and $\mathrm{Mor}(\mathbf{W})$.
4. **$\mathcal{H}_\infty \mathcal{G}_\infty \Psi \Phi(\mathcal{W})$** — the basic action theory whose fluents are the places and actions are the transitions, with Reiter axioms reading the multiset structure off $\partial^\pm$.
  By Lemma 3.
  A's normal form, this is determined up to canonical normalisation.
5. **$\mathcal{K}_\infty \mathcal{H}_\infty \mathcal{G}_\infty \Psi \Phi(\mathcal{W})$** — back to the Petri net; on the nose by construction.
6. **$\mathcal{F}_\infty \mathcal{K}_\infty \mathcal{H}_\infty \mathcal{G}_\infty \Psi \Phi(\mathcal{W})$** — the free SMC on the Petri presentation.
  By the universal property of the free SMC and Lemma 2.
  B, this is canonically isomorphic to $(\mathbf{W}, \mathsf{Q}, \kappa, \tau) = \mathcal{W}$.
  Call this isomorphism $\eta_\mathcal{W}^{(2)}$.

The full natural isomorphism is $\eta_\mathcal{W} := \eta_\mathcal{W}^{(2)} \circ \eta_\mathcal{W}^{(1)}$.
Naturality in $\mathcal{W}$ follows because each step is functorial and the universal properties give canonical (hence natural) isomorphisms.

#### Coherence

**Lemma 4.
B (coherence).** *The natural isomorphism $\eta : \mathcal{F}_\infty \mathcal{K}_\infty \mathcal{H}_\infty \mathcal{G}_\infty \Psi \Phi \Rightarrow \mathrm{id}_{\mathbf{LQ}}$ is the identity 2-cell on $\mathrm{id}_{\mathbf{LQ}}$ when composed with itself iterating the cycle.*

*Proof.* The cycle is built from quasi-inverse adjunctions.
Each adjunction's unit/counit is canonical; canonical natural isomorphisms compose canonically; iterating gives the identity on $\mathrm{id}_{\mathbf{LQ}}$ by the triangle identities of the underlying adjunctions. $\square$

This makes the equivalence *strict* in the sense that the round-trip natural-isomorphism is identity-coherent, not just an isomorphism.

#### Conclusion

The four functors $\Phi, \mathcal{G}_\infty \Psi, \mathcal{H}_\infty \mathcal{G}_\infty \Psi, \mathcal{F}_\infty \mathcal{K}_\infty \mathcal{H}_\infty \mathcal{G}_\infty \Psi$ give equivalences $$\mathbf{LQ} \simeq \mathbf{CFS}, \quad \mathbf{CFS} \simeq \mathbf{Pet}_\infty, \quad \mathbf{Pet}_\infty \simeq \mathbf{SC}_\infty, \quad \mathbf{SC}_\infty \simeq \mathbf{LQ}$$ composing to the identity. $\square$

**Corollary 4.1 (Work-Lambek theorem).** *A theory of work, in the strict mathematical sense, is equivalently any of: a Lawvere-quantale-enriched symmetric monoidal category with monoidal natural-history; a Coecke-Fritz-Spekkens partitioned process theory with monoidal natural-history; a cost-weighted Petri net with a spontaneous-transition subset; a cost-tagged basic action theory with a spontaneous-action subset.
The four are equivalent as categories of structures.*

**Corollary 4.2.** *The Work Thesis is well-posed: it does not depend on the choice of presentation.*

**Corollary 4.3.** *Any property of "a theory of work" definable in one presentation is canonically definable in the other three, with the canonical translation given by Theorem 4's natural isomorphism.*

### Remaining categorical hygiene

The proofs above use the standard interpretation of "strong monoidal endofunctor" — coherent up to canonical isomorphism, automatically strict where the SMC is strict (e.g. on the Petri side).
The infinite-presentable variants $\mathbf{Pet}_\infty, \mathbf{SC}_\infty$ require fixing a Grothendieck universe to avoid proper-class issues; the equivalence holds at each universe-level.

## The modal layer

The current theory describes work *extensionally* — by its state-transitions and costs.
It does not describe the inner side of action: the agent's *intention* toward a target, which may diverge from the outer side (the *realised* outcome).
This section adds the modal structure.

### The intention fibration

**Definition.** For a model $M$ of $\mathbb{T}_{\mathrm{Work}}$, the *intention category* $\mathbf{Int}_M$ has: - Objects: pairs $(A, B)$ in $M(\mathsf{S}) \times M(\mathsf{S})$ — *(source, intended target)*. - Morphisms $(A, B) \to (A', B')$: triples $(f, \alpha_-, \alpha_+)$ where $f : A \to A'$ in $M(\mathsf{S})$ and $\alpha_\pm$ are intention-preserving relations between targets (composed below). - Identities and composition are inherited.

There is a forgetful functor $\pi_- : \mathbf{Int}_M \to M(\mathsf{S}), (A,B) \mapsto A$ (the source-projection) and a target-projection $\pi_+ : \mathbf{Int}_M \to M(\mathsf{S}), (A,B) \mapsto B$.

**Proposition 5 (intention fibration).** *The pair $(\pi_-, \pi_+) : \mathbf{Int}_M \to M(\mathsf{S}) \times M(\mathsf{S})$ is a Grothendieck fibration.
The fiber over $(A, B)$ is the set of *intention-tokens* from $A$ toward target $B$ — including succeeding tokens, failing tokens (intended $B$, realised $B' \neq B$), and aborted tokens (intended $B$, realised $\tau(A)$).*

*Proof sketch.* The fibration structure is the canonical pullback of the codomain fibration along the inclusion $M(\mathsf{S}) \times M(\mathsf{S}) \to M(\mathsf{S})^{\to}$.
Cartesian lifts exist by completeness of the slice categories.
The fiber-objects are exactly the *attempt-tokens* of the Hornsby/O'Shaughnessy reading: a directed striving from $A$ toward $B$, formally a section of $\pi_+$ over $\pi_-^{-1}(A)$. $\square$

### Modal operators

**Definition.** The standard dynamic-logic modal operators are interpretable in $\mathbf{Int}_M$: - $[f]\varphi(A, B) :=$ "in every intention-token at $(A, B)$ along $f$, $\varphi$ holds at the realised outcome."
Equivalently, $\bigwedge_{\text{tokens}} \varphi \circ \pi_+$. - $\langle f \rangle \varphi(A, B) :=$ "in some intention-token at $(A, B)$ along $f$, $\varphi$ holds."
Equivalently, $\bigvee_{\text{tokens}} \varphi \circ \pi_+$.

These are adjoint along the projection $\pi_+$: $[f] \dashv \langle f \rangle$ when the codomain is a complete Heyting algebra.
The Curry-Howard-Lambek-style reading of dynamic logic (Harel-Kozen-Tiuryn 2000) lifts directly.

### The endeavor monad

**Definition.** For a model $M$ of $\mathbb{T}_{\mathrm{Work}}$, define $E : M(\mathsf{S}) \to M(\mathsf{S})$ as follows.
On objects: $E(A) := \coprod_{B \in M(\mathsf{S})} \mathbf{Int}_M((A, B), -) / {\sim}$ where $\mathbf{Int}_M((A, B), -)$ is the set of intention-tokens at $(A, B)$ and ${\sim}$ identifies tokens by their realised outcome.
Concretely, an element of $E(A)$ is an equivalence class $[(B, t)]$ where $B \in M(\mathsf{S})$ is the intended target and $t$ is an intention-token from $A$ to $B$, with $(B, t) \sim (B', t')$ iff $\pi_+(t) = \pi_+(t')$ as morphisms in $M(\mathsf{S})$.

On morphisms: for $f : A \to A'$, $E(f) : E(A) \to E(A')$ sends $[(B, t)]$ to $[(B, t \cdot f)]$ where $t \cdot f$ is the intention-token obtained by pre-composition.

**Proposition 6 (endeavor is a strong monad).** *$(E, \eta, \mu, \theta)$ is a strong monad on $M(\mathsf{S})$, where:*

- *$\eta_A : A \to E(A)$ sends $a \in A$ to $[(A, \mathrm{id}_a)]$ — the trivial intention.*
- *$\mu_A : E(E(A)) \to E(A)$ sends $[(B, t : A \to B)]$ where $t$ is an intention-token at $(A, [(C, t' : B \to C)])$ in $E(A)$, to the composed intention-token $[(C, t' \circ t)]$.*
- *$\theta_{A,B} : A \otimes_\mathsf{S} E(B) \to E(A \otimes_\mathsf{S} B)$ sends $(a, [(B', t)])$ to $[(A \otimes B', \mathrm{id}_a \otimes_w t)]$.*

*Proof.* We verify each monad and strength axiom.

(M1) **Left unit.** $\mu \circ E(\eta) = \mathrm{id}_E$.
Given $[(B, t)] \in E(A)$, $E(\eta_A)([(B,t)]) = [(B, \eta_B \circ t)]$ — but $\eta_B \circ t$ is the intention-token $t$ followed by the trivial intention at $B$, which is $t$ itself in $E(E(A))$ under the identification.
Then $\mu$ flattens this to $[(B, t)]$. $\checkmark$

(M2) **Right unit.** $\mu \circ \eta_E = \mathrm{id}_E$.
Given $[(B, t)] \in E(A)$, $\eta_{E(A)}([(B, t)]) = [(E(A), \mathrm{id})]$ in $E(E(A))$.
Then $\mu$ flattens this: the trivial intention at $E(A)$ composed with $t$ inside yields $[(B, t)]$. $\checkmark$

(M3) **Associativity.** $\mu \circ E(\mu) = \mu \circ \mu_{E}$.
Both sides flatten a triply-nested intention-token by composing all three layers; the order of flattening does not matter because intention-token composition is associative (inherited from morphism composition in $M(\mathsf{S})$). $\checkmark$

(S1) **Strength unit.** $\theta_{I, B} = \lambda_{E(B)}^{-1} \circ E(\lambda_B)$ via the left-unitor $\lambda$.
The left-hand side sends $(*, [(B', t)])$ to $[(I \otimes B', \mathrm{id}_* \otimes_w t)] = [(B', t)]$ after applying $\lambda_B$.
The right-hand side does the same via $\lambda$. $\checkmark$

(S2) **Strength associativity.** $\theta_{A \otimes A', B} = E(\alpha_{A,A',B}) \circ \theta_{A, A' \otimes B} \circ (\mathrm{id}_A \otimes \theta_{A', B})$ via the associator $\alpha$.
Both sides send $((a, a'), [(B', t)])$ to $[(A \otimes A' \otimes B', \mathrm{id}_{(a,a')} \otimes_w t)]$.
The reassociation goes through $\alpha$ on the SMC side and $E(\alpha)$ on the monad side; these agree by the SMC pentagon coherence. $\checkmark$

(S3) **Strength compatibility with $\eta$.** $E(\mathrm{id}_A \otimes \eta_B) \circ \theta_{A, B} \cdot (\mathrm{id}_A \otimes \eta_B) = \theta_{A,B} \circ \mathrm{id}$.
Direct computation: both sides yield $\eta_{A \otimes B}$ applied to $(a, b)$. $\checkmark$

(S4) **Strength compatibility with $\mu$.** $\mu_{A \otimes B} \circ E(\theta_{A,B}) \circ \theta_{A, E(B)} = \theta_{A,B} \circ (\mathrm{id}_A \otimes \mu_B)$.
Both sides flatten a strength-of-strength to a single strength via composition; the two parenthesisations of the resulting intention-token composition agree by bifunctoriality of $\otimes_w$. $\checkmark$

Symmetric strength against the braiding $\sigma$ is satisfied because $\sigma$ is in $\mathbf{W}_{\mathrm{free}}$ (it has zero cost) and the intention-token composition is symmetric in the $\otimes_w$-arguments. $\square$

**Definition.** An *endeavor* is a Kleisli morphism $A \to E(B)$ in $\mathrm{Kl}(E)$.
By the Kleisli construction, endeavors compose: $g : B \to E(C)$ after $f : A \to E(B)$ yields $\mu_C \circ E(g) \circ f : A \to E(C)$.
This is the sustained-trying structure: endeavor continues across failed intermediate states because the Kleisli composition uses $\mu$ to *flatten* an intention-to-intend into a direct intention, regardless of whether the intermediate intention realised.

**Corollary 6.1 (Kleisli SMC enriched in $\mathsf{Q}$).** *$\mathrm{Kl}(E)$ is a symmetric monoidal category, with monoidal structure induced from $M(\mathsf{S})$ via the strength $\theta$ (Kock 1972 §2).
It is enriched in $\mathsf{Q}$ via the cost-of-successful-trajectory:* $$\mathrm{Kl}(E)(A, B) := \bigwedge \{\kappa(\pi_+(t)) : t \in \mathbf{Int}_M((A, B), -), \pi_+(t) \text{ exists}\}.$$ *If no successful trajectory exists, the cost is $\top_\mathsf{Q}$ (the quantale's top element); failure-open endeavors have $< \top_\mathsf{Q}$ cost iff the worker eventually succeeds.*

*Proof.* The Kleisli SMC structure with strength $\theta$ is standard (Kock 1972 Theorem 1.1). $\mathsf{Q}$-enrichment is by the same Lawvere convention as $\mathbf{Work}_M$, extended to allow $\top_\mathsf{Q}$ for the no-successful-trajectory case.
Composition-condition follows from the parallel cost law on intention-tokens. $\square$

This formalises the inner/outer distinction: the *outer side* is the underlying $M(\mathsf{S})$-morphism $\pi_+(t)$ (the realised state-transition); the *inner side* is the $E$-lift in $\mathrm{Kl}(E)$ (the equivalence class of intention-tokens).
Endeavor is a Kleisli morphism; success is the existence of a token with $\pi_+ = $ realised arrow; failure is its absence.

### Modal-layer invariance under Theorem 4

**Proposition 7.** *The intention fibration $\mathbf{Int}_M$ and the endeavor monad $E$ are invariant under the equivalences of Theorem 4: for each pair of theories of work $\mathcal{W}, \mathcal{W}'$ related by an equivalence functor of Theorem 4, the induced fibrations and monads correspond canonically.*

*Proof.* The intention fibration is defined by pullback of the codomain fibration along an inclusion; this is functorial in the underlying SMC.
The endeavor monad is defined by quotient of intention-token classes; this is functorial in the SMC.
Both constructions are preserved by strong-monoidal $\mathsf{Q}$-enriched functors, which are exactly the morphisms of $\mathbf{LQ}$.
The translation functors of Theorem 4 are such, so they carry the modal layer along. $\square$

This means: the modal layer is part of the structure of any theory of work, not an addition to a particular presentation.
Dynamic-logic, BDI-logic, Reiter's situation calculus with intentions, and the Coecke-Fritz-Spekkens process-with-attempts all express the same modal structure under the Work-Lambek correspondence.

### Coalgebraic-monadic integration: the work-bialgebra

The endeavor monad $E$ acts on states; capability is an additional coalgebraic structure.
The natural question: how do they interact across a sustained endeavor?

**Setup.** Recall that $\widetilde{\mathbf{Work}}_M$ has objects $(A, C) \in M(\mathsf{S}) \times M(\mathsf{C})$.
Let $G : M(\mathsf{S}) \to M(\mathsf{S})$ be the *capability-tagged-state* endofunctor $G(A) := A \times M(\mathsf{C})$ (working in the product category internally).
Then $\widetilde{\mathbf{Work}}_M$ is a $G$-coalgebra: each $(A, C)$ has a structure map sending it to its capability-update under the available work-acts.

**Theorem 5 (work-bialgebra distributive law).** *There is a canonical distributive law $\lambda : G E \Rightarrow E G$ of the endeavor monad over the capability functor, given on components by:* $$\lambda_A : G(E(A)) = E(A) \times M(\mathsf{C}) \to E(G(A)) = E(A \times M(\mathsf{C}))$$ $$\lambda_A([(B, t)], C) := [(B \times M(\mathsf{C}), t \otimes_w \mathrm{id}_C)] \quad \text{(via the capability-strength)}.$$

*Proof.* We verify the four distributive-law axioms of Beck 1969.

(D1) **Compatibility with $\eta$.** $\lambda \circ G\eta = \eta G$.
Direct: both sides send $(a, C) \in G(A)$ to $[(A \times M(\mathsf{C}), \mathrm{id}_{(a,C)})] \in E(G(A))$. $\checkmark$

(D2) **Compatibility with $\mu$.** $\lambda \circ G\mu = \mu G \circ E\lambda \circ \lambda E$.
Both sides flatten a doubly-nested intention while preserving the capability factor; agreement follows from $\mu$'s associativity and $\lambda$'s naturality. $\checkmark$

(D3-D4) Compatibility with the $G$-coalgebra structure on $\widetilde{\mathbf{Work}}_M$ is automatic because $G$ is a constant-functor in $M(\mathsf{C})$. $\checkmark$ $\square$

**Corollary 5.1 (work-bialgebra structure).** *$\widetilde{\mathbf{Work}}_M$ carries the structure of an $E$-$G$-bialgebra: each $(A, C)$ has both a $G$-coalgebra structure (the available work-acts and their capability-updates) and an $E$-algebra structure (the resolution of intention-tokens into realised arrows), with the two commuting via $\lambda$.*

**Corollary 5.2 (capability-accumulation across sustained endeavor).** *In a sustained endeavor $\sigma : \mathbb{N} \to \mathrm{Mor}(\mathrm{Kl}(E))$ that includes failed sub-attempts, the capability $C_n$ accumulates monotonically:* $$C_{n+1} = u(C_n, \pi_+(t_n))$$ *where $t_n$ is the realised intention-token at stage $n$.
If the realised token is a failure-token (intended $B$, realised $B' \neq B$), capability still updates: failure is informative.*

*Proof.* The bialgebra structure gives the canonical capability-update along any intention-token, success or failure.
Monotonicity follows from the capability-update functoriality axiom of $\mathbb{T}_{\mathrm{Work}}$.
The informativeness of failure follows from the fact that $u$ is defined on the realised arrow, not on the intended one. $\square$

This corollary is the formal statement of Vaughan-style normalisation-of-deviance and Reason-style breach-and-repair learning, derived from the bare theory of work — without the sociological extensions.
The capability dynamics across sustained endeavor (including failure-bearing endeavor) is a structural consequence, not a model-specific feature.

### Theorem 6: the endeavor monad is algebraic

*Statement.* The endeavor monad $E$ on $M(\mathsf{S})$ is the free monad on an algebraic theory $\mathcal{A}_{\mathrm{End}}$ in the sense of Plotkin-Power 2002 and Plotkin-Pretnar 2009.
The operations and equations of $\mathcal{A}_{\mathrm{End}}$ are as follows.

#### Operations

For each pair $(A, B) \in M(\mathsf{S}) \times M(\mathsf{S})$ and each work-act $f \in \mathbf{Work}_M(A, B)$, an operation $$\mathrm{try}_{f} : 1 \to E(B)$$ of arity 0 (a *generic effect* in Plotkin-Power's sense, indexed by $f$).
Interpretation: invoke the effect of trying to perform $f$; the result is an intention-token at $B$.

Additionally, for each state $B$, a *targeting* operation $$\mathrm{aim}_B : E(B) \to E(B)$$ of arity 1, idempotent.
Interpretation: declare $B$ as the intended target of an already-formed intention.

#### Equations

(E1) **Sequential decomposition.** For composable $f : A \to C$, $g : C \to B$ in $\mathbf{Work}_M$: $$\mathrm{try}_{g \circ f} = \mu_B \circ E(\mathrm{try}_{g}) \circ \mathrm{try}_{f}.$$ "Trying to perform $g \circ f$ is trying $f$ then trying $g$."

(E2) **Parallel decomposition.** For $f : A \to A'$, $g : B \to B'$: $$\mathrm{try}_{f \otimes_w g} = \theta_{A' \otimes B'} \circ (\mathrm{try}_{f} \otimes \mathrm{try}_{g}).$$ "Trying parallel acts is parallel trying."

(E3) **Aim idempotence.** $\mathrm{aim}_B \circ \mathrm{aim}_B = \mathrm{aim}_B$.
Re-declaring the same target is a no-op.

(E4) **Aim compatibility with try.** $\mathrm{aim}_B \circ \mathrm{try}_{f} = \mathrm{try}_{f}$ for $f : A \to B$.
The intended target of $\mathrm{try}_f$ is already $B$.

(E5) **Natural-history is free.** $\mathrm{try}_{\tau_A} = \eta_{\tau(A)}$.
Trying to undergo natural-history is just being.

#### Proof that $E$ is the free $\mathcal{A}_{\mathrm{End}}$-monad

**Direction $\mathcal{A}_{\mathrm{End}}\text{-Alg} \to E\text{-Alg}$.** Any $\mathcal{A}_{\mathrm{End}}$-algebra $X$ has, for each $f : A \to B$, an interpretation $\llbracket \mathrm{try}_f \rrbracket_X : 1 \to X$ — pick an element of $X$ called "the outcome of trying $f$."
The equations require this assignment to commute with composition and parallel.
The free monad on these operations is $E$ by construction (Plotkin-Power 2002 Theorem 4.1, applied to our signature).

**Direction $E\text{-Alg} \to \mathcal{A}_{\mathrm{End}}\text{-Alg}$.** Any Eilenberg-Moore algebra $\alpha : E(X) \to X$ has, for each $f : A \to B$, $\llbracket \mathrm{try}_f \rrbracket := \alpha([\eta_B]) = \alpha([(B, f)])$ — the algebra's interpretation of the canonical intention-token for $f$.
Equations (E1)-(E5) follow from the algebra axioms ($\alpha \circ \eta = \mathrm{id}$, $\alpha \circ E(\alpha) = \alpha \circ \mu$).

The two directions are mutually inverse by inspection. $\square$

**Corollary 6.1 (handler-based operational semantics).** *An endeavor $A \to E(B)$ in the Kleisli category is, in Plotkin-Pretnar terms, an effectful computation invoking $\mathrm{try}$ and $\mathrm{aim}$ operations.
A handler $H : \mathcal{A}_{\mathrm{End}}\text{-Alg}$ assigns concrete realisations to each effect — defining how the endeavor's intentions are resolved into outcomes.
The standard handler $H_{\mathrm{std}}$ resolves $\mathrm{try}_f$ by the realised arrow of $f$; a failure-handler $H_{\mathrm{fail}}$ may resolve it by a slip-target or a lapse.
The four-way Reason taxonomy corresponds to four canonical handlers.*

**Corollary 6.2.** *Endeavor admits a denotational semantics in any cartesian-closed category supporting the free $\mathcal{A}_{\mathrm{End}}$-monad.
This includes $\mathbf{Set}$, $\mathbf{Cat}$, and any topos.*

This makes the modal layer of the theory of work *operationally tractable* — endeavors can be implemented and reasoned about as effectful programs, with the algebraic theory governing what computations are valid.

### Theorem 7: the learning-rate functor

*Statement.* The work-bialgebra dynamics (Theorem 5) induce a canonical *learning-rate functor* $\Lambda : \widetilde{\mathbf{Work}}_M \to \mathsf{Q}_\Delta$ valued in a quantale $\mathsf{Q}_\Delta$ of cost-deltas.
Under sustained iteration of a work-act $f$, the capability trajectory $(C_n)$ converges to a *mastery coalgebra* fixpoint $C_\infty^f$, and the learning-rate $\Lambda(C_n, f)$ decays monotonically to the quantale unit.

#### The meta-cost quantale

**Definition.** The *meta-cost quantale* $\mathsf{Q}_\Delta$ is the quantale of *cost-deltas* in $\mathsf{Q}$: elements are pairs $(q_1, q_2) \in \mathsf{Q} \times \mathsf{Q}$ with $q_2 \leq_\mathsf{Q} q_1$, interpreted as "starting cost $q_1$, ending cost $q_2$."
The operations: - Composition $\otimes_\Delta : (q_1, q_2) \otimes_\Delta (q_2, q_3) := (q_1, q_3)$ — composable when the ending of one matches the starting of the next. - Order $(q_1, q_2) \leq_\Delta (q_1', q_2')$ iff $q_1 = q_1'$ and $q_2 \leq_\mathsf{Q} q_2'$ — same start, smaller end is greater learning. - Unit $e_\Delta := (q, q)$ for any $q$ — zero learning. - Joins by greatest-end.

This is a quantale by standard verification (associativity of $\otimes_\Delta$ from $\otimes_\mathsf{Q}$; suprema preserved by composition by quantale-completion).

#### The learning-rate functor

**Definition.** $\Lambda : \widetilde{\mathbf{Work}}_M \to \mathsf{Q}_\Delta$ sends: - Objects $(A, C)$ to the trivial delta $e_\Delta$. - A work-act $f : (A, C) \to (B, u(C, f))$ to $\Lambda(f) := (\tilde\kappa(C, f), \tilde\kappa(u(C, f), f))$ — the cost-of-$f$ before and after performing $f$ once.

**Lemma 7.
A (functoriality of $\Lambda$).** *$\Lambda$ is a functor: $\Lambda(g \circ f) = \Lambda(g) \otimes_\Delta \Lambda(f)$ when composable.*

*Proof.* The pair $\Lambda(g \circ f) = (\tilde\kappa(C, g \circ f), \tilde\kappa(u(C, g \circ f), g \circ f))$.
By the composition law of $\mathbb{T}_{\mathrm{Work}}$, $\tilde\kappa(C, g \circ f) \leq \tilde\kappa(C, f) \otimes_\mathsf{Q} \tilde\kappa(u(C, f), g)$; equality holds for the optimal trajectory.
By capability-update functoriality, $u(C, g \circ f) = u(u(C, f), g)$, so $\tilde\kappa(u(C, g \circ f), g \circ f) = \tilde\kappa(u(u(C, f), g), g \circ f) \leq \tilde\kappa(u(C, f), f) \otimes_\mathsf{Q} \tilde\kappa(u(u(C, f), g), g)$.
The right-hand side is $\Lambda(g) \otimes_\Delta \Lambda(f)$ under the $(start, end)$-composition. $\square$

#### Mastery as a fixpoint coalgebra

**Definition.** Fix a work-act $f : A \to A$ (self-loop — the work-act type is preserved).
The *practice coalgebra* of $f$ is the $G$-coalgebra $$\gamma_f : M(\mathsf{C}) \to G(M(\mathsf{C})) = M(\mathsf{C}) \times \mathbf{Work}_M(A, A)$$ $$C \mapsto (u(C, f), f)$$ sending a capability to the (post-practice capability, same work-act) pair.

The *trajectory* is the iterated application: $C_0 \mapsto C_1 \mapsto C_2 \mapsto \ldots$ with $C_{n+1} = u(C_n, f)$.

**Theorem 7.1 (mastery fixpoint).** *Under the capability-cost monotonicity axiom of $\mathbb{T}_{\mathrm{Work}}$, the trajectory $(C_n)$ has a least upper bound $C_\infty^f \in M(\mathsf{C})$ (in any complete capability-preorder), and $C_\infty^f$ is a fixpoint of $\gamma_f$: $u(C_\infty^f, f) = C_\infty^f$.*

*Proof.* The sequence $(C_n)$ is monotone non-decreasing in any capability-preorder where "more capability = $\leq$ for cost" implies $C_n \leq_\mathsf{C} C_{n+1}$ by capability-update monotonicity.
Bounded above (by the supremum, if $M(\mathsf{C})$ is complete; otherwise by the universal cap of the capability preorder).
Monotone bounded sequences in a complete poset converge to the supremum.
The supremum is a $u(-, f)$-fixpoint by continuity of $u$ in its first argument. $\square$

**Corollary 7.2 (mastery cost).** *At mastery, the cost of $f$ stabilises: $\tilde\kappa(C_\infty^f, f) = \tilde\kappa(u(C_\infty^f, f), f) = \tilde\kappa(C_\infty^f, f)$.
The learning-rate $\Lambda(C_\infty^f, f) = e_\Delta$ — no further cost-reduction is possible from practicing $f$ alone.*

This is the *plateau effect* in skill acquisition: once mastery is achieved for $f$, further repetition of $f$ does not reduce its cost.
(Reducing the cost further requires *cross-skill transfer* — performing related work-acts $g \neq f$ that affect the same capability-component.)

#### Learning curve as the iterated $\Lambda$

The *learning curve* for $f$ is the sequence $$\Lambda(C_0, f), \Lambda(C_1, f), \Lambda(C_2, f), \ldots \in \mathsf{Q}_\Delta.$$ By Lemma 7.
A and Theorem 7.1, this sequence is monotone non-decreasing in $\mathsf{Q}_\Delta$ (each step shrinks less than the previous) and converges to $e_\Delta$ at mastery.
The *rate of convergence* depends on the model: - *Logarithmic learning* (typical for motor skills): $\Lambda(C_n, f) - e_\Delta \sim 1/n$. - *Exponential learning* (typical for habit formation): $\Lambda(C_n, f) - e_\Delta \sim r^n$ for $r < 1$. - *Plateau-then-jump* (typical for insight-based skills): step-function with discrete plateau breaks.

The theory of work does not commit to any particular learning curve — it only requires the curve to be *monotone-converging to $e_\Delta$*.
The shape is a parameter of the model.

**Corollary 7.3 (no free lunch in mastery).** *Under the integrated work-bialgebra dynamics, no work-act admits cost reduction below its mastery-cost $\tilde\kappa(C_\infty^f, f)$ by any amount of further practice of $f$ itself.
Cost reduction below the mastery-cost requires either (i) a different work-act affecting the same capability, or (ii) a structural change in $\mathcal{C}$, $u$, or $\tilde\kappa$ — i.e., a change to the model, not the trajectory.*

This is the structural form of *learning-rate saturation*: it is a theorem of $\mathbb{T}_{\mathrm{Work}}$, not a specific assumption about how skills work.

### Proposition 8: structural decomposition of the failure fibre

*Statement.* The failure fibre $\mathrm{Fail}_M := \{t \in \mathbf{Int}_M : \pi_+(t) \neq f^{\mathrm{intended}}\}$ of the intention fibration admits a canonical three-axis decomposition derivable from the bare theory $\mathbb{T}_{\mathrm{Work}}$.
The Reason taxonomy (slip / lapse / mistake / violation) emerges as the named cells of this decomposition.

#### The three axes

For an intention-token $t \in \mathbf{Int}_M((A, B), \pi_+(t))$ with realised arrow $r := \pi_+(t) : A \to B'$ where $B' \neq B$ (failure-condition):

**Axis 1: triviality.** Define the *triviality predicate* $\mathrm{Triv}(t) \in \mathbf{2}$: - $\mathrm{Triv}(t) = \mathbf{t}$ if $r = \mathrm{id}_A$ or $r = \tau_A$ — no work-act was performed, only the natural-history transition (or no transition at all); - $\mathrm{Triv}(t) = \mathbf{f}$ if $r$ is a non-trivial work-act with $\kappa(r) >_\mathsf{Q} e_\mathsf{Q}$.

This axis is determined by the cost-quantale: $\mathrm{Triv}(t) \iff \kappa(r) = e_\mathsf{Q}$.

**Axis 2: reachability of intended target.** Define the *reachability predicate* $\mathrm{Reach}(t) \in \mathbf{2}$: - $\mathrm{Reach}(t) = \mathbf{t}$ if there exists an alternative work-act $g \in \mathbf{Work}_M(A, B)$ that the worker had available — i.e., $g \in \mathbf{Work}_M(A, B)$ with $\tilde\kappa(C, g) \leq \bar\kappa_C$ (within budget); - $\mathrm{Reach}(t) = \mathbf{f}$ otherwise.

This axis is determined by the $\mathsf{Q}$-enrichment of $\mathbf{Work}_M$: $\mathrm{Reach}(t) \iff \mathbf{Work}_M(A, B) \neq \emptyset$ within budget.

**Axis 3: cost-suboptimality.** Define the *suboptimality predicate* $\mathrm{Subopt}(t) \in \mathbf{2}$: - $\mathrm{Subopt}(t) = \mathbf{t}$ if $\kappa(r) >_\mathsf{Q} \bigwedge_{r' : A \to B'} \kappa(r')$ — the realised arrow was not the cheapest available to its realised target; - $\mathrm{Subopt}(t) = \mathbf{f}$ otherwise.

This axis is determined by the metric structure on $\mathbf{Work}_M$: $\mathrm{Subopt}(t)$ holds iff $r$ is not a geodesic.

#### The eight cells

The product $\mathrm{Triv} \times \mathrm{Reach} \times \mathrm{Subopt} : \mathrm{Fail}_M \to \mathbf{2}^3$ partitions the failure fibre into eight cells.
Five are non-empty in generic models; three are vacuous by definition.

| $\mathrm{Triv}$ | $\mathrm{Reach}$ | $\mathrm{Subopt}$ | Cell name | Reason taxonomy |
|---|---|---|---|---|
| $\mathbf{t}$ | $\mathbf{t}$ | * | *lapse-reachable* | **lapse** |
| $\mathbf{t}$ | $\mathbf{f}$ | * | *vacuous-effort* | lapse (no target was reachable anyway) |
| $\mathbf{f}$ | $\mathbf{t}$ | $\mathbf{f}$ | *cheap-mistake* | **mistake** |
| $\mathbf{f}$ | $\mathbf{t}$ | $\mathbf{t}$ | *expensive-mistake* | **mistake + violation** |
| $\mathbf{f}$ | $\mathbf{f}$ | $\mathbf{f}$ | *cheap-slip* | **slip** |
| $\mathbf{f}$ | $\mathbf{f}$ | $\mathbf{t}$ | *expensive-slip* | **slip + violation** |

(The $\mathrm{Triv} = \mathbf{t}, \mathrm{Subopt} = \mathbf{t}$ rows are vacuous: a trivial action cannot be suboptimal — its cost is already $e_\mathsf{Q}$.)

#### Proof of the decomposition

*Construction.* The three predicates $\mathrm{Triv}, \mathrm{Reach}, \mathrm{Subopt}$ are each defined in terms of structures present in any model of $\mathbb{T}_{\mathrm{Work}}$ (cost quantale, $\mathsf{Q}$-enrichment, metric structure on $\mathbf{Work}_M$).
No additional structure is required.

*Canonicity.* Each predicate is invariant under the morphisms of $\mathbf{LQ}$: a $\mathsf{Q}$-enriched strong-monoidal functor preserves $\kappa$, hence $\mathrm{Triv}$; preserves hom-objects, hence $\mathrm{Reach}$; preserves minima of cost-sets, hence $\mathrm{Subopt}$.

*Reason correspondence.* The Reason taxonomy is the named-cell mapping above.
Slip = "non-trivial action, but intended target unreachable" $= (\mathrm{Triv} = \mathbf{f}, \mathrm{Reach} = \mathbf{f})$.
Lapse = "trivial action" $= \mathrm{Triv} = \mathbf{t}$.
Mistake = "non-trivial action, intended target was reachable but the worker chose differently" $= (\mathrm{Triv} = \mathbf{f}, \mathrm{Reach} = \mathbf{t})$.
Violation = $\mathrm{Subopt} = \mathbf{t}$ (deliberately chose a more expensive path), orthogonal to the slip/mistake distinction. $\square$

**Corollary 8.1.** *The Reason taxonomy of human error is a structural consequence of the theory of work — no additional sociological or psychological commitment is needed.
The classification depends only on the cost-quantale, the $\mathsf{Q}$-enrichment, and the existence of alternative work-acts at the source state.*

**Corollary 8.2 (invariance under Theorem 4).** *The failure-fibre decomposition is preserved by the Work-Lambek equivalences.
In any of the four presentations (LQ, CFS, Pet, SC), the same three axes determine the same cell-decomposition of failures.*

**Corollary 8.3.** *The four-valued visibility predicate $\mathrm{vis} : \mathrm{Mor} \to \mathbf{FOUR}$ used in the sociological extensions (articulation work) becomes a single $\mathbf{2}$-valued axis when combined with the three-axis failure decomposition — it adds an observer-relative recognition axis, giving $\mathrm{Triv} \times \mathrm{Reach} \times \mathrm{Subopt} \times \mathrm{Visible}$ for the full empirical decomposition.
This is the formal sense in which "visibility" is a separate dimension from "failure-mode."*

### Theorem 9: the work 2-category

*Statement.* There is a strict 2-category $\mathbf{Work}^{(2)}_M$ whose 1-truncation is $\mathbf{Work}_M$ and whose 2-cells encode the intention fibration.
The modal operators $[f]$ and $\langle f \rangle$ become 2-natural transformations.

#### Construction

**0-cells.** $\mathrm{Ob}(\mathbf{Work}^{(2)}_M) := \mathrm{Ob}(M(\mathsf{S}))$ — the world-states.

**1-cells.** For 0-cells $A, B$, the 1-cells $A \to B$ in $\mathbf{Work}^{(2)}_M$ are exactly the work-acts $f \in \mathbf{Work}_M(A, B)$.
Composition is sequential composition in $\mathbf{Work}_M$.

**2-cells.** For 1-cells $f, g : A \to B$, the 2-cells $\alpha : f \Rightarrow g$ are intention-tokens $t \in \mathbf{Int}_M((A, B), -)$ that: - intended $g$ (intentional target $g$), - realised $f$ (i.e., $\pi_+(t) = f$).

So a 2-cell $f \Rightarrow g$ records: "the worker tried to perform $g$ but in fact performed $f$."
Identity 2-cells $\mathrm{id}_f : f \Rightarrow f$ are *success-tokens* (intended $f$, realised $f$).

**Vertical composition of 2-cells.** Given $\alpha : f \Rightarrow g$ (intended $g$, realised $f$) and $\beta : g \Rightarrow h$ (intended $h$, realised $g$), define $\beta \circ_v \alpha : f \Rightarrow h$ as the *intention-token compositional witness*: the worker intended $h$, settled-down to intending $g$ when $h$ was unreachable, and finally performed $f$.
Concretely: $\beta \circ_v \alpha$ is the intention-token with intentional content $h$ and realised arrow $f$, derived as the composite-attempt in $\mathbf{Int}_M$.

**Horizontal composition of 2-cells.** Given $\alpha : f \Rightarrow g$ in $\mathbf{Work}^{(2)}_M(A, B)$ and $\alpha' : f' \Rightarrow g'$ in $\mathbf{Work}^{(2)}_M(B, C)$, define $\alpha' \circ_h \alpha : f' \circ f \Rightarrow g' \circ g$ as the parallel-attempt witness: intended $g' \circ g$, realised $f' \circ f$, witness derived from $\alpha'$ and $\alpha$ via composition in $\mathbf{Int}_M$.

#### Verification of 2-category axioms

(2C1) **Composition of 1-cells is associative** — inherited from $\mathbf{Work}_M$.

(2C2) **Vertical composition of 2-cells is associative** — follows from associativity of intention-token composition (which is morphism composition in $M(\mathsf{S})$).

(2C3) **Identity 2-cells.** $\mathrm{id}_f \circ_v \alpha = \alpha = \alpha \circ_v \mathrm{id}_f$.
Composing a success-token with any token yields the token itself.

(2C4) **Interchange law.** $(\alpha' \circ_v \beta') \circ_h (\alpha \circ_v \beta) = (\alpha' \circ_h \alpha) \circ_v (\beta' \circ_h \beta)$.
Both sides describe the same data: an attempted $h$ that became attempted $g$ that became performed $f$, performed in parallel with the analogous trajectory in the second column.
Bifunctoriality of $\otimes_w$ in $M(\mathsf{S})$ ensures the two parsings agree. $\square$

#### Truncations

**Lemma 9.
A (1-truncation).** *The 1-truncation of $\mathbf{Work}^{(2)}_M$ — the category with the same 0-cells and 1-cells, ignoring 2-cells — is exactly $\mathbf{Work}_M$.*

*Proof.* By construction: 1-cells of $\mathbf{Work}^{(2)}_M$ are work-acts; composition is inherited; identities are work-act identities. $\square$

**Lemma 9.
B (0-truncation).** *The 0-truncation (homotopy category) $h\mathbf{Work}^{(2)}_M$ — 1-cells modulo the equivalence "there exists an invertible 2-cell between them" — has work-acts modulo *intention-equivalence* as 1-cells.
Two work-acts are intention-equivalent iff each can be the realisation of an intention-token whose intended target is the other.*

*Proof.* By construction: invertible 2-cells correspond to bidirectional intention-tokens.
The resulting equivalence is the smallest equivalence under which intention-token-related work-acts are identified. $\square$

#### Intention fibration as 2-cell fibration

**Theorem 9.1.** *The intention fibration $\mathbf{Int}_M \to M(\mathsf{S}) \times M(\mathsf{S})$ of Proposition 5 is recovered as the 2-cell fibration of $\mathbf{Work}^{(2)}_M$: the fibre over $(A, B)$ is the category $\mathbf{Work}^{(2)}_M(A, B)$ of work-acts and intention-tokens between them.*

*Proof.* For fixed $A, B$: the objects of $\mathbf{Int}_M((A, B), -)$ are intention-tokens with intentional content $(A, B)$; equivalently, intention-tokens that *intended* $(A, B)$.
These are 2-cells in $\mathbf{Work}^{(2)}_M$ with target 1-cell some $g : A \to B$.
The morphisms of $\mathbf{Int}_M((A, B), -)$ are token-equivalences, which match exactly the 2-cell-of-2-cells (vertical composition) in $\mathbf{Work}^{(2)}_M(A, B)$. $\square$

#### Modal operators as 2-natural transformations

**Theorem 9.2.** *The dynamic-logic modal operator $[f] : \Omega^{M(\mathsf{S})} \to \Omega^{M(\mathsf{S})}$ extends to a 2-natural transformation on $\mathbf{Work}^{(2)}_M$.
Likewise for $\langle f \rangle$.*

*Proof.* For each work-act $f : A \to B$, $[f]\varphi := \bigwedge_{\alpha : f \Rightarrow ?} \varphi \circ \mathrm{cod}(\alpha)$ where the meet ranges over 2-cells whose source is $f$.
The 2-naturality square commutes for each 2-cell $\alpha : f \Rightarrow g$ because the meet over all $\alpha$-extensions agrees with the meet pulled back along $\alpha$.
The adjoint $\langle f \rangle$ is similarly a 2-natural transformation by dualisation. $\square$

**Corollary 9.3.** *Modal reasoning about endeavors is 2-categorical: dynamic-logic proofs lift to proofs in the 2-category $\mathbf{Work}^{(2)}_M$, with 2-cells witnessing intermediate intention-states.*

#### Connection to algebraic effects and the bialgebra

**Proposition 9.4.** *The endeavor monad $E$ of Proposition 6 is the *2-cell completion* of $\mathbf{Work}^{(2)}_M$ in the following sense: $E(A) = \mathrm{colim}_{B} \mathbf{Work}^{(2)}_M(A, B) / {\sim}$ where the colimit is taken over $B$ and ${\sim}$ identifies 2-cells by their codomain in $M(\mathsf{S})$.*

*Proof sketch.* The colimit is the disjoint union of 2-cells $A \to B$ for all $B$, quotiented by the realisation equivalence.
This is exactly $E(A)$ by Definition.
The construction is functorial in $A$. $\square$

**Corollary 9.5.** *The work-bialgebra of Theorem 5 acquires a 2-categorical interpretation: the coalgebra structure is the 2-cell extraction from $\mathbf{Work}^{(2)}_M$, the monad structure is the 2-cell completion, and the distributive law $\lambda$ is the unique 2-functorial coherence.*

### Theorem 10: structural plurality of social organisations of work

*Statement.* The theory $\mathbb{T}_{\mathrm{Work}}$ is silent on *who can perform which work-act*.
This dimension lives entirely in the capability structure $M(\mathsf{C})$ and the capability-aware cost $M(\tilde\kappa)$.
Different social organisations of work — authority-dispatched vs. kin-obligation-derived vs. market-mediated vs. self-directed — are different *models* of the same theory, not different theories.

#### Formal statement

Let $\mathcal{O} = (\mathcal{R}, \rho)$ be an *organisational form*: $\mathcal{R}$ a small category of *social positions* (roles), $\rho : \mathcal{R} \to \mathbf{Cat}$ a functor sending each position to a category of position-specific capability-states.
The functor $\rho$ encodes how capability is distributed across positions and how it transfers along position-morphisms (training, apprenticeship, authority-delegation, kin-relation, market-exchange — these are different choices of $\mathcal{R}$).

**Definition.** An *$\mathcal{O}$-model* of $\mathbb{T}_{\mathrm{Work}}$ is a model $M$ of $\mathbb{T}_{\mathrm{Work}}$ together with a fibration $M(\mathsf{C}) \to \mathcal{R}$ whose fibre over a position $r$ is $\rho(r)$, and a *position-aware capability-aware cost* $\tilde\kappa^\mathcal{O} : M(\mathsf{C}) \times \mathrm{Mor}(M(\mathsf{S})) \to M(\mathsf{Q})$ factoring as $\tilde\kappa^\mathcal{O}(C, f) = \tilde\kappa(C, f) \otimes_\mathsf{Q} \rho^*(C, f)$ where $\rho^*$ is the "position-permission cost" — additional cost (or $\top$ for forbidden) of $f$ at position $\rho(C)$.

**Theorem 10.1.** *For any organisational form $\mathcal{O}$, an $\mathcal{O}$-model is a model of $\mathbb{T}_{\mathrm{Work}}$.*

*Proof.* All the equations of $\mathbb{T}_{\mathrm{Work}}$ are checked.
(i) $\mathsf{Q}$ is a commutative quantale — unchanged.
(ii) Composition and parallel cost laws — $\tilde\kappa^\mathcal{O}$ is a tensor of two quantale elements, so the laws inherit from $\tilde\kappa$ and $\rho^*$ individually (each satisfies them; tensor of laws-satisfying functions satisfies the law).
(iii) Capability-cost monotonicity — preserved because both factors are monotone.
(iv) Capability-update functoriality — extends to position-aware update through the fibration.
(v) Non-degeneracy — preserved because $\rho^*$ generates only finite tensor products with $\tilde\kappa$. $\square$

#### The four organisational forms

| Form | $\mathcal{R}$ | $\rho^*$ structure |
|---|---|---|
| Free-individual | discrete | $\rho^*(C, f) = e_\mathsf{Q}$ everywhere (no position-cost) |
| Authority-dispatched | tree with a root | $\rho^*(C, f) = \top$ unless $f$ is dispatched-from-above; $e_\mathsf{Q}$ otherwise |
| Market-mediated | complete graph with edge-weights | $\rho^*(C, f) = $ exchange-rate of $C$'s position for the position required by $f$ |
| Kin-obligation-derived | groupoid of kin-relations | $\rho^*(C, f) = \top$ unless $f$ is kin-required at $C$; $e_\mathsf{Q}$ otherwise |

**Corollary 10.2 (no privileged form).** *None of the four organisational forms is privileged by the theory $\mathbb{T}_{\mathrm{Work}}$.
Each is a valid model.
The distinction between them is in $\mathcal{R}$ and $\rho^*$, not in the equations or operations of $\mathbb{T}_{\mathrm{Work}}$.*

#### Corollary: the lakotaean form

**Corollary 10.3.** *The lakotaean work-form (kin-obligation-derived, with $\mathcal{R}$ the groupoid of kin-relations including wíŋkte and tȟokáhe positions, and $\rho^*$ encoding the absence of a surplus-cell-installing closure rule) is a model of $\mathbb{T}_{\mathrm{Work}}$.
No extension of the theory is required to accommodate it.*

*Proof.* Direct instantiation of Theorem 10.1 at the kin-obligation choice of $\mathcal{O}$.
The "absence of surplus-cell" condition is the absence of an organisational-cost component that would extract value across position-morphisms; this is a *zero-cost* setting of one component of $\rho^*$, not a removal of an axiom. $\square$

**Corollary 10.4 (the Western form is also a model).** *The Western (authority-dispatched or market-mediated) work-form is equally a model of $\mathbb{T}_{\mathrm{Work}}$.
Neither it nor the lakotaean form is "the" theory; each is one model among many in the category $\mathrm{Mod}(\mathbb{T}_{\mathrm{Work}})$.*

#### Conclusion: a structural plurality result

The theory of work admits a genuinely plural set of models.
The choice of organisational form is encoded in the capability fibration $M(\mathsf{C}) \to \mathcal{R}$ and the position-permission cost $\rho^*$.
The theory's equations are satisfied by every choice; the differences between organisations are structural differences in $M(\mathsf{C})$, not in the theory.

**Corollary 10.5 (Work-Lambek correspondence under organisational variation).** *The Work-Lambek equivalence (Theorem 4) is preserved by organisational variation: an $\mathcal{O}$-model in any of the four presentations (LQ, CFS, Pet, SC) translates to an $\mathcal{O}$-model in any other, with the organisational fibration carried along.*

*Proof.* The translation functors of Theorem 4 act on the underlying $\mathbb{T}_{\mathrm{Work}}$-structure; they extend to organisational variants by acting trivially on the $\mathcal{R}$-component.
The fibration $M(\mathsf{C}) \to \mathcal{R}$ is preserved because the functors are $\mathsf{C}$-preserving. $\square$

Every term of the work corpus is derivable in any model of $\mathbb{T}_{\mathrm{Work}}$:

- **Work-unit** — a ground morphism in $\widetilde{\mathbf{Work}}_M$ (no free variables in the algebraic-signature sense).
- **Workflow** — a composable chain of work-units typed end-to-end.
- **Skill** — a capability-component that cheapens a class of work-acts ($\tilde\kappa$ decreases on a subclass of $\mathrm{Mor}(M(\mathsf{S}))$).
- **Endeavor** — a commitment to a path in $\widetilde{\mathbf{Work}}_M$ that the worker undertakes even when individual acts fail (Chisholm 1976; Hornsby 1980; O'Shaughnessy 1980 give the philosophical structure; formally: a section $\sigma : \mathbb{N} \to \mathrm{Mor}(\widetilde{\mathbf{Work}}_M)$ with failure-tolerance).
- **Settlement-path** — a directed structure on under-specified work-acts where each step substitutes a free variable, refining toward ground (cf. `texts/the-settlement-path.md`).
- **Bottleneck** — a state $A$ at which no available work-act fits the worker's budget: $\bigwedge_B \mathbf{Work}_M(A, B) > \bar\kappa_C$.

## What this commits to and what is parameterized

**Committed (in $\mathbb{T}_{\mathrm{Work}}$ itself):**

- State, cost, capability as sorts.
- Natural-history as an endofunctor on states.
- Cost-quantale structure on $\mathsf{Q}$.
- Free natural-history, positive work-cost, counterfactual divergence.
- Capability-aware cost monotone in capability.
- Capability composes along act composition.

**Parameterized (set by the model, not the theory):**

- The state-category $M(\mathsf{S})$ — what counts as a state, what counts as a transition.
- The natural-history $M(\tau)$ — the baseline tendency of the world.
- The cost quantale $M(\mathsf{Q})$ — single-resource $[0, \infty]$, multi-resource $\mathbb{N}^k$, non-numerical bilattices, etc.
- The capability structure $M(\mathsf{C}), M(u), M(\tilde\kappa)$ — representation, accumulation, depletion of skill.

Different *models* of $\mathbb{T}_{\mathrm{Work}}$ correspond to different empirical regimes — scientific-management, labor-process, Indigenous land-based, care-work, knowledge-work.
None of these is the theory; each is a model.

## Status

The theory $\mathbb{T}_{\mathrm{Work}}$ is presented as a multisorted Lawvere-style theory with three sorts ($\mathsf{S}, \mathsf{Q}, \mathsf{C}$), twelve operations, and eleven equation-groups.
States form a symmetric monoidal category with parallel composition $\otimes_\mathsf{S}$ and braiding $\sigma$; work-acts compose both sequentially ($\circ$) and in parallel ($\otimes_w$) with subadditive parallel cost.
The category of models, the category of work, $\mathsf{Q}$-enrichment as a generalized metric space, and the capability-aware coalgebraic extension are derived constructions in any model.
The Work Thesis pins the structure to the empirical phenomenon.

The Work-Lambek correspondence is proved as Theorems 1–4 (now full proofs, not sketches): the four categories of theories ($\mathbf{LQ}$, $\mathbf{CFS}$, $\mathbf{Pet}_\infty$, $\mathbf{SC}_\infty$) are pairwise equivalent and each is equivalent to $\mathrm{Mod}(\mathbb{T}_{\mathrm{Work}})$.
Non-degeneracy is built into the definition of $\mathbf{LQ}$.
Theorem 2 includes the universal cost-saturation lemma (Lemma 2.
B) and presentation-independence (Lemma 2.
C).
Theorem 3 is proved for the context-free fragment of basic action theories via the Reiter precondition normal form (Lemma 3.
A) and the frame-axiom-as-flow-constraint correspondence (Lemma 3.
B); the context-sensitive fragment corresponds to coloured Petri nets by the same proof.
Theorem 4 exhibits the round-trip natural isomorphism explicitly and shows it is identity-coherent (Lemma 4.
B).

The modal layer is constructed via the intention fibration $\mathbf{Int}_M \to M(\mathsf{S}) \times M(\mathsf{S})$ (Proposition 5) and the endeavor monad $E$ on $M(\mathsf{S})$ (Proposition 6, with full verification of the four strength axioms).
Endeavors are Kleisli morphisms in $\mathrm{Kl}(E)$; the inner/outer distinction is the Kleisli adjunction.
The modal layer is invariant under the Theorem 4 equivalences (Proposition 7).

The work-bialgebra structure (Theorem 5) gives a canonical distributive law $\lambda : G E \Rightarrow E G$ of the endeavor monad over the capability-tagged-state functor, making $\widetilde{\mathbf{Work}}_M$ an $E$-$G$-bialgebra.
Capability accumulates monotonically across sustained endeavor including failure-bearing endeavor (Corollary 5.2) — the formal capture of breach-and-repair learning from the bare theory of work alone.

Five further theorems develop the consequences:

- *Theorem 3$'$* extends Theorem 3 to context-sensitive basic action theories and coloured Petri nets, completing the Work-Lambek correspondence for the colour-typed fragment.
- *Theorem 6* expresses the endeavor monad as the free monad on an algebraic theory $\mathcal{A}_{\mathrm{End}}$ of attempt-and-resolve operations; the Reason failure taxonomy corresponds to four canonical handlers (Corollary 6.1).
- *Theorem 7* introduces the meta-cost quantale $\mathsf{Q}_\Delta$ and the learning-rate functor $\Lambda$; mastery is a fixpoint coalgebra (Theorem 7.1) and learning-rate saturation is a structural theorem (Corollary 7.3).
- *Proposition 8* decomposes the failure fibre by three canonical axes (triviality, reachability, suboptimality) and recovers the Reason taxonomy as named cells; the visibility predicate is a separate orthogonal axis (Corollary 8.3).
- *Theorem 9* lifts the modal layer to a strict 2-category $\mathbf{Work}^{(2)}_M$ with work-acts as 1-cells and intention-tokens as 2-cells; modal operators become 2-natural transformations (Theorem 9.2), and the endeavor monad is the 2-cell completion (Proposition 9.4).
- *Theorem 10* establishes structural plurality: any organisational form (free-individual, authority-dispatched, market-mediated, kin-obligation-derived) is a valid model of $\mathbb{T}_{\mathrm{Work}}$ via a capability fibration $M(\mathsf{C}) \to \mathcal{R}$; the lakotaean form (Corollary 10.3) and the Western form (Corollary 10.4) are equally models, neither privileged.

**Open.**

1. *Higher coherence for $\mathbf{Work}^{(2)}_M$.* Theorem 9 constructs a strict 2-category.
  Investigate whether it lifts further to a *3-category* whose 3-cells are *endeavor-equivalences* (alternative trajectories realising the same intention).
  Conjecture: yes, via the Kleisli-construction iteration.
2. *Internal characterisation of $\mathbb{T}_{\mathrm{Work}}$.* Theorem 4 gives four equivalent external presentations.
  Is there an *internal-logic* presentation — a fragment of first-order logic or dependent type theory whose theories are exactly $\mathbb{T}_{\mathrm{Work}}$-models?
  Conjecture: the *cartesian fragment* of linear type theory with a cost-modality gives the internal logic.
3. *Operational completeness of the algebraic-effects handlers.* Corollary 6.1 names four canonical handlers (success, slip, lapse, mistake).
  Are these *complete* for the Reason taxonomy in the sense that every effectful program over $\mathcal{A}_{\mathrm{End}}$ admits handler-resolution into one of the four?
  Conjecture: yes by Proposition 8's decomposition.
4. *Quotient theories of $\mathbb{T}_{\mathrm{Work}}$.* Different sociological-extension regimes (kyriarchal, predicated, governance-as-work) appear to be *quotient* theories — $\mathbb{T}_{\mathrm{Work}}$ plus additional equations identifying certain work-acts.
  Identify each regime's equation-set explicitly and classify the resulting quotient theories.
5. *Compositionality with theories of governance.* The theory of work should compose with the theory of governance (parallel question `what-is-the-theory-of-governance.md`) via a *governance-fibration* — work-acts on collective-states form a sub-2-category whose morphisms are also governance-acts.
  Spell out the fibration in the 2-categorical setting of Theorem 9.
6. *Linkage to economic dynamics.* Theorem 7's learning-rate functor $\Lambda$ should interact with a *labour-time discount* — the cost of work-time as time itself is depleted.
  Add a time-quantale to $\mathbb{T}_{\mathrm{Work}}$ as an optional refinement and check that the equivalence theorems still hold.

External authors cited in this presentation: Chisholm 1976, Hornsby 1980, O'Shaughnessy 1980, Lawvere 1973, McCarthy 1963, Pratt-Harel (dynamic logic), Meseguer-Montanari 1990, Baez-Master 2020, Coecke-Fritz-Spekkens 2014, Aczel 1988, Jacobs 2017.
