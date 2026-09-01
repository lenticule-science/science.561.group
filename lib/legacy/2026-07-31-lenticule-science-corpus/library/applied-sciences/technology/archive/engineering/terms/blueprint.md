---
id: blueprint
description: "A Blueprint is a geometric theory T = (S, Ax) — a many-sorted signature S equipped with a set of axioms Ax expressed as geometric sequents (existential-conjunctive sentences closed under finitary conjunction and arbitrary disjunction). The defining structure: the complete syntactic specification of what any implementation must provide, without constituting a community or imposing a covering structure. A blueprint is operative at history t iff its blueprint proposition bp(T) = meet over all axiom propositions in H_t is in RelationalHistoryFixedFiber — all axioms are doubly settled. The shadow class type of each axiom proposition records its status: RelationalHistoryFixedFiber (invariant), RelationalHistoryFiberSaturationShadowClass (recognized but fragile), RelationalHistoryFiberTransferShadowClass (structurally required but unarticulated), RelationalHistoryFiberFreeShadowClass (draft only). The canonical blueprint of the system is the RelationalUniverseGeometricTheory T_RU — notably, separation is absent from Ax because it is not geometric; non-separated pairs are shadow elements resolved by the nuclear quotient, not by axiomatic fiat."
date-created: 2026-03-18
date-modified: 2026-03-21
params:
  operation-surface: relational-universe
  axiom-set: relational-universe-morphism
output: relational-universe
ast:
  axiom-governed-surface:
    - operation-surface
    - subobject-classification:
        - axiom-set
        - operation-surface
---

# Blueprint

## Formal definition

A **Blueprint** is a pair $\mathbb{T} = (\mathbf{S}, \mathrm{Ax})$:

$$\mathbb{T} = (\mathbf{S} : \mathrm{Signature},\; \mathrm{Ax} : \mathrm{Set}(\mathrm{GeometricSequents}(\mathbf{S})))$$

where:
- $\mathbf{S} = (\mathcal{S}, \Omega, ar)$ is the **signature** — the vocabulary of the blueprint: sort names $\mathcal{S}$, operation symbol names $\Omega$, and the arity function $ar$ assigning typed profiles (see [Signature](signature.md))
- $\mathrm{Ax}$ is the **axiom set** — a finite set of **geometric sequents** in the language of $\mathbf{S}$; a geometric sequent has the form $\phi \vdash_{\vec{x}} \psi$ where $\phi$ and $\psi$ are geometric formulas (built from $\top$, $\bot$, finitary $\wedge$, arbitrary $\bigvee$, and $\exists$; no $\forall$, no meta-level $\Rightarrow$, no $\neg$)

**Blueprint proposition.** The blueprint $\mathbb{T}$ generates a proposition in $H_t$:

$$\mathrm{bp}(\mathbb{T}) = \bigwedge_{\mathrm{ax} \in \mathrm{Ax}} \mathrm{prop}(\mathrm{ax}) \in H_t$$

where $\mathrm{prop}(\mathrm{ax})$ is the fiber element corresponding to axiom $\mathrm{ax}$. The blueprint is **operative** at $t$ iff $\mathrm{bp}(\mathbb{T}) \in H^*_t$ — all axiom propositions are doubly settled.

**Four invariants.** $\mathbb{T}$ is a blueprint iff it satisfies:

1. **Signature completeness**: the axioms refer only to sorts and operations declared in $\mathbf{S}$; no axiom mentions an operation that is not in the operational surface.

2. **Geometric restriction**: all axioms are geometric sequents; axioms requiring $\forall$ at the meta-level (such as separation: "any two amalgamations are equal") are not permitted. Non-geometric constraints are handled by the nuclear quotient, not by axiomatic fiat.

3. **No constituted community**: the blueprint declares what must be provided, not who provides it. There are no agents, no covering policies, no deontic constraints in $\mathrm{Ax}$. Adding a community constitutes a [Charter](charter.md).

4. **Operational determinism**: the blueprint fully constrains which sub-configurations are valid (subobject classification by the axioms) — every valid configuration is either specified or can be derived from the axioms by the geometric inference rules.

## What this is

A Blueprint is a complete technical specification — a design that fully constrains the structure of what it describes without itself being the deployed thing.

The origin of the term: a blueprint is a photographic reproduction of a technical drawing in blue-and-white, used in architecture and engineering to communicate the complete design to builders. A blueprint fully determines what can be built; it does not build anything. The "blueprint/building" distinction is the "theory/model" distinction.

**Blueprint is not Signature.** A [Signature](signature.md) has no axioms — it is purely syntactic vocabulary. A blueprint adds axioms to the vocabulary, constraining which configurations are valid. The signature says "these operations exist"; the blueprint says "these operations must satisfy these constraints."

**Blueprint is not Charter.** A [Charter](charter.md) adds a constituted community and covering policies to a blueprint — it makes the blueprint live by declaring who operates under it and what counts as covering the scope. A blueprint alone has no community, no Grothendieck topology, no sheaf condition.

**Blueprint is not Model.** A model $M \models \mathbb{T}$ is a [Signature](signature.md) implementation satisfying all axioms in $\mathrm{Ax}$. Multiple models of the same blueprint exist; the blueprint is the invariant that all models share.

## External grounding: algebraic specification theory

**Ehresmann's sketches** (Ehresmann, "Esquisses et types de structures algébriques", 1968): A sketch is a small category $\mathcal{C}$ with designated cones $\mathcal{L}$ (representing limit specifications) and designated cocones $\mathcal{D}$ (colimit specifications); a model of a sketch is a functor $\mathcal{C} \to \mathbf{Set}$ (or into another category) that preserves the designated limits and colimits. A blueprint is an Ehresmann sketch in the geometric fragment: the operation surface is $\mathcal{C}$, the axioms are the designated cones/cocones, and a model is a structure-preserving functor. Ehresmann's sketches generalize Lawvere's algebraic theories by admitting both limits and colimits as primitives — capturing sheaf-like conditions (gluing = colimit) as well as algebraic ones (products = limit).

**Lawvere's algebraic theories** (Lawvere, PhD thesis, Columbia, 1963): An algebraic theory is a category $\mathbb{T}$ with finite products whose objects are natural numbers \$0, 1, 2, \ldots$; a model is a product-preserving functor $\mathbb{T} \to \mathbf{Set}$. The key theorem: the category of models is equivalent to the category of algebras for the corresponding monad. A blueprint in the equational fragment (all axioms are equations, no existentials) is a Lawvere algebraic theory; its models are the algebras. The Lawvere theory for groups, rings, and commutative monoids are all examples.

**The geometric theory hierarchy** (Wraith 1975; Makkai-Reyes, "First Order Categorical Logic", 1977): the class of axioms expressible as geometric sequents is strictly larger than the class expressible as Horn clauses, which is strictly larger than the equational class. Each level captures more structure:

| Axiom class | Example | Captures |
|---|---|---|
| Equational (Birkhoff 1935) | $a \wedge a = a$ | Algebraic structures |
| Horn clauses (Horn 1951) | $a \leq b \wedge b \leq c \Rightarrow a \leq c$ | Relational structures |
| Geometric sequents | $\mathrm{match}(a_1,\ldots,a_n) \vdash \exists a.\; \mathrm{glue}(a)$ | Sheaf conditions, local-to-global |
| First-order | $\forall x \exists y.\; P(x,y)$ | Full classical logic |

The relational universe blueprint $\mathbb{T}_\mathbf{RU}$ uses the geometric fragment — exactly what is needed to specify the sheaf gluing condition (Group 7) and the nucleus axioms (Group 5), while excluding separation (which requires $\forall$).

## The canonical blueprint: RelationalUniverseGeometricTheory

The [RelationalUniverseGeometricTheory](../math/relational-universe-geometric-theory.md) $\mathbb{T}_\mathbf{RU}$ is the canonical blueprint of the system. Its signature is two-sorted (Hist for history objects, El for fiber elements), with function symbols for concatenation $\star$, projection $\pi$, restriction $\rho$, the two nuclei $\sigma$ and $\Delta$, and the Heyting algebra operations. Its axiom set consists of seven groups:

1. Prefix order on Hist (Refl, Trans, Anti, InitHist)
2. Monoid laws for concatenation (Unit, Assoc, PrefixMono)
3. Fiber sort preservation (FiberSort)
4. Heyting algebra axioms (MeetIdem, MeetComm, MeetAssoc, MeetTop, MeetBot, Distrib, HeyAdj)
5. Nucleus axioms for $\sigma$ and $\Delta$ (Ext, Idem, Meet) plus the commutation axiom (Comm)
6. Restriction naturality ($\rho$-Id, $\rho$-Comp, $\rho$-Meet, $\rho$-$\sigma$-Nat, $\rho$-$\Delta$-Nat)
7. Sheaf gluing (Glue — the existential amalgamation axiom)

**Separation is absent.** The separation axiom — "any two amalgamations of the same matching family are equal" — is not a geometric sequent (it requires $\forall$ at the meta-level). It is deliberately absent from $\mathrm{Ax}$. Non-separated pairs in $H_t$ are **shadow elements**: two elements $a \neq b$ with $\rho(a, h_i) = \rho(b, h_i)$ for all cover pieces are both in $H_t \setminus H^*_t$. The nuclear quotient — the application of $\sigma_t$ or $\Delta_t$ — resolves them: both map to the same element of $H^*_t$. Separation is thus a *consequence* of the nuclear quotient, not a primitive axiom.

## Blueprint models

A **model** $M$ of blueprint $\mathbb{T}$ in a relational universe $R$ is a $\mathbf{S}$-implementation of the signature (carriers for each sort, morphisms for each operation symbol) satisfying all axioms in $\mathrm{Ax}$. The category $\mathrm{Mod}(\mathbb{T}, R)$ of models in $R$ is determined by the axioms.

**Models and the classifying topos.** Every geometric theory $\mathbb{T}$ has a **classifying topos** $\mathrm{Set}[\mathbb{T}]$ — a Grothendieck topos such that geometric morphisms $\mathcal{E} \to \mathrm{Set}[\mathbb{T}]$ from any topos $\mathcal{E}$ are exactly the $\mathbb{T}$-models in $\mathcal{E}$. For $\mathbb{T}_\mathbf{RU}$: the classifying topos is the syntactic relational universe $R_\mathrm{syn}$, the initial model. Geometric morphisms $\mathcal{E} \to R_\mathrm{syn}$ classify relational universe models in $\mathcal{E}$.

## Blueprint, Charter, Locale

The three-stage development:

| Stage | Mathematical content | What is added |
|---|---|---|
| [Outpost](outpost.md) | Operation surface only: signature $\mathbf{S}$, no axioms | Named operations, ungoverned |
| **Blueprint** | Geometric theory $(\mathbf{S}, \mathrm{Ax})$ | Axioms — constraints on valid configurations |
| [Charter](charter.md) | Site $(\mathbf{S}, \mathrm{Ax}, J)$ | Grothendieck topology $J$ — covering policies, constituted community |
| [Locale](locale.md) | Classifying topos $\mathbf{Sh}(\mathbf{S}, \mathrm{Ax}, J)$ | Sheaf category — global sections, live operations |

The step from Outpost to Blueprint is adding governance: axioms constrain what was previously unconstrained. The step from Blueprint to Charter is constituting the community: declaring who operates under the blueprint and what covering families count as comprehensive. The step from Charter to Locale is activating the sheaf: compatible local sections assemble into global sections.

## Nuclear reading

**Proposition 1 (Blueprint proposition = meet of axiom propositions).** The blueprint $\mathbb{T} = (\mathbf{S}, \mathrm{Ax})$ generates a blueprint proposition in $H_t$:

$$\mathrm{bp}(\mathbb{T}) = \bigwedge_{\mathrm{ax} \in \mathrm{Ax}} \mathrm{prop}(\mathrm{ax}) \in H_t$$

The blueprint is operative at $t$ iff $\mathrm{bp}(\mathbb{T}) \in H^*_t$, i.e., iff every axiom proposition is doubly settled: $\sigma_t(\mathrm{prop}(\mathrm{ax})) = \mathrm{prop}(\mathrm{ax})$ and $\Delta_t(\mathrm{prop}(\mathrm{ax})) = \mathrm{prop}(\mathrm{ax})$ for all $\mathrm{ax} \in \mathrm{Ax}$.

*Proof.* The meet of a finite set of elements of $H^*_t$ is in $H^*_t$ (since $H^*_t$ is closed under meets — it is a sub-Heyting-algebra of $H_t$). If all axiom propositions are in $H^*_t$, their meet is in $H^*_t$. The converse: if any axiom proposition is not in $H^*_t$, the meet is bounded above by that element and hence not in $H^*_t$. $\square$

**Proposition 2 (Shadow class of axiom = axiomatic status).** The RelationalHistoryFiberShadowClassType of an axiom proposition $\mathrm{prop}(\mathrm{ax}) \in H_t$ gives the axiom's operative status:

| Shadow class | Axiomatic status |
|---|---|
| RelationalHistoryFixedFiber | **Invariant**: recognized by the community AND structurally required going forward; this constraint is part of the constitution of the blueprint's operation |
| RelationalHistoryFiberSaturationShadowClass | **Working assumption**: community has accepted this constraint ($\sigma_t(\mathrm{prop}(\mathrm{ax})) = \mathrm{prop}(\mathrm{ax})$) but it is not forward-active — future operations may undermine it |
| RelationalHistoryFiberTransferShadowClass | **Implicit constraint**: the operations structurally demand this constraint ($\Delta_t(\mathrm{prop}(\mathrm{ax})) = \mathrm{prop}(\mathrm{ax})$) but the community has not yet articulated it — the blueprint has an unarticulated axiom |
| RelationalHistoryFiberFreeShadowClass | **Draft only**: neither recognized nor required; a proposed constraint with no structural force |

*Proof.* The four cases are the four preimages of RelationalHistoryFiberShadowClassType, which partitions $H_t$ exhaustively by the two Boolean conditions $\{\sigma_t(a) = a\}$ and $\{\Delta_t(a) = a\}$. $\square$

*Content.* The TrShadowType case — structurally required but unarticulated — is the most practically significant: it identifies axioms that the blueprint NEEDS but has not stated. These are "latent axioms," implicit in the operational surface but absent from $\mathrm{Ax}$. Discovering them (applying $\sigma_t$ to close the recognition gap) is the process of making an incomplete blueprint explicit.

**Proposition 3 (Blueprint morphism = theory morphism; reduct monotonicity).** A blueprint morphism $\varphi : \mathbb{T}_1 \to \mathbb{T}_2$ is a signature morphism $\varphi : \mathbf{S}_1 \to \mathbf{S}_2$ preserving axioms: for each $\mathrm{ax} \in \mathrm{Ax}_1$, $\mathrm{Sen}(\varphi)(\mathrm{ax}) \in \mathrm{Ax}_2$. By the Reduct Monotonicity Theorem ([Signature](signature.md)): if $\mathrm{impl}_{M, \mathbb{T}_2} \in H^*_t$ (M operatively implements $\mathbb{T}_2$), then $\mathrm{impl}_{\varphi^*(M), \mathbb{T}_1} \in H^*_t$ (the reduct operatively implements $\mathbb{T}_1$).

*Proof.* $\mathrm{impl}_{M, \mathbb{T}_2} \in H^*_t$ means all axiom propositions of $\mathbb{T}_2$ are doubly settled in $M$. The reduct $\varphi^*(M)$ uses carriers $M_{\varphi_\mathcal{S}(s)}$ and operations $M_{\varphi_\Omega(\omega)}$ for $s \in \mathcal{S}_1$, $\omega \in \Omega_1$; by the Goguen-Burstall satisfaction condition, truth is invariant under signature translation, so all $\mathbb{T}_1$-axioms — which translate into $\mathbb{T}_2$-axioms via $\mathrm{Sen}(\varphi)$ — are satisfied by $\varphi^*(M)$. $\square$

*Content.* Blueprint morphisms induce reduct functors on model categories going backward: implementing a richer blueprint entails implementing every blueprint embedded into it. The blueprint lattice is contravariantly ordered with respect to model categories.

**Proposition 4 (Blueprint extension adds axioms; new axiom resolves shadow).** A blueprint extension $\mathbb{T} \subseteq \mathbb{T}'$ (adding axioms $\mathrm{Ax} \subset \mathrm{Ax}'$) adds new axiom propositions to $H_t$ and may change the shadow class type of existing elements. Specifically: adding an axiom $\mathrm{ax}_{\mathrm{new}}$ with $\mathrm{prop}(\mathrm{ax}_{\mathrm{new}}) \in \mathrm{TrShadow}_t$ at $t$ makes explicit an implicit constraint — the TrShadowType axiom moves to $H^*_t$ once stated, because it was already forward-active. The SatShadow case — a recognized but fragile axiom — may be destabilized by extension if the new axioms create a contradictory structure.

*Proof sketch.* TrShadowType axiom: $\Delta_t(\mathrm{prop}(\mathrm{ax})) = \mathrm{prop}(\mathrm{ax})$ holds but $\sigma_t(\mathrm{prop}(\mathrm{ax})) > \mathrm{prop}(\mathrm{ax})$. Adding the axiom to $\mathrm{Ax}$ and making it operative requires that the community recognize it — applying $\sigma_t$ closes the saturation gap, moving the axiom to Fix($\sigma_t$). Once in Fix($\sigma_t$) ∩ Fix($\Delta_t$) = $H^*_t$, the axiom is invariant. $\square$

**Proposition 5 (No separation axiom; separation is a consequence of the nuclear quotient).** The RelationalUniverseGeometricTheory $\mathbb{T}_\mathbf{RU}$ deliberately excludes the separation axiom. The separation axiom — "any two amalgamations of the same matching family are equal" — requires $\forall$ at the meta-level and is therefore not a geometric sequent. It is not in $\mathrm{Ax}$. Instead: non-separated pairs $(a, b)$ with $\rho(a, h_i) = \rho(b, h_i)$ for all cover pieces are shadow elements — both in $H_t \setminus H^*_t$, distinguished by the nuclear quotient: $\sigma_t(a) = \sigma_t(b) \in H^*_t$. The nuclear fixed-point is the unique canonical representative of both. Separation holds in the fixed fiber $H^*_t$ as a consequence of the nucleus, not as a primitive axiom.

*Proof.* From [RelationalUniverseGeometricTheory](../math/relational-universe-geometric-theory.md): non-separated pairs are shadow elements (both in $H_t \setminus H^*_t$); the generation map $G_t(a) = \Delta_t(\sigma_t(a))$ sends each to a unique element of $H^*_{t}$ at depth one higher. The nuclear quotient provides unique amalgamations where the separation axiom would enforce them by fiat. $\square$

*Content.* The absence of separation from the canonical blueprint is not an omission — it is a design decision. Insisting on separation as an axiom would exclude precisely the shadow elements that carry the system's Fibonacci growth structure. The nuclear quotient is the right mechanism for resolving ambiguity; axiomatic separation would be a shortcut that collapses the structure.

## Open questions

- Whether every geometric theory admits a blueprint presentation in the sense of this spec — whether the sorts, operations, and axiom groups of $\mathbb{T}_\mathbf{RU}$ can be mapped to the `params:`, `ast:`, and `description:` fields of a FARS spec file, and whether this mapping is functorial (blueprint morphism = spec file morphism).
- Whether a blueprint can be incrementally completed — whether there is a canonical completion procedure that adds exactly the TrShadowType axioms to $\mathrm{Ax}$ (making all implicit constraints explicit) without adding FreeShadowType axioms — and whether this completion is uniquely determined by the operational surface.
- Whether two blueprints with the same classifying topos (i.e., Morita-equivalent theories: $\mathrm{Set}[\mathbb{T}_1] \simeq \mathrm{Set}[\mathbb{T}_2]$) should be identified in this system, or whether the blueprint (as a syntactic presentation) is the object and the classifying topos is derived — and what the right notion of blueprint equivalence is for practical specification purposes.
- Whether the Ehresmann sketch formulation (designated cones and cocones) gives a more natural FARS representation than the geometric sequent formulation — and whether the two formulations are equivalent for all blueprints appearing in this system.
- Whether blueprint extension to a charter ($\mathbb{T} \to (\mathbb{T}, J)$) corresponds to choosing a Lawvere-Tierney topology on the classifying topos $\mathrm{Set}[\mathbb{T}]$ — and whether every topology choice on the classifying topos corresponds to a valid charter over the blueprint.
