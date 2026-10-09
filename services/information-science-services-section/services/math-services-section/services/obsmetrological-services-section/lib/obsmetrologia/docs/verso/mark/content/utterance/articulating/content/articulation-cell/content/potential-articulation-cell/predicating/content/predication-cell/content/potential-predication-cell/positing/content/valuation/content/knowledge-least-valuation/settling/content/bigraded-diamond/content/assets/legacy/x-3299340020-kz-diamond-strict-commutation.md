---
type: theorem
status: sketch
depends-on:
  - temporal-2-category
  - emmenegger-fibration-comonad
  - closure-2-monad
  - closure-2-monad-lax-idempotence
  - dualized-closure-2-comonad
  - dualized-closure-colax-idempotence
  - gray-street-fibration-monad
  - kz-coherent-sheaf
---

# KZ-diamond strict commutation via axis-orthogonality

The corpus's [temporal 2-category](../../../../temporal-2-category/temporal-2-category.md) $\mathbf{T}(\mathcal{C}, \lambda)$ carries two KZ-lax-idempotent 2-monad / 2-comonad structures: the [Emmenegger fibration 2-comonad](emmenegger-fibration-comonad.md) $\mathbb{N}$ (with $\mathbb{M} \dashv \mathbb{N}$) acting on the predicate-category axis, and the [closure 2-monad](../morphisms/closure-2-monad.md) $\mathrm{Cl}$ acting on the temporal axis. The [two-disentangled-KZ-structures narrative](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/two-disentangled-kz-structures.md) names their coexistence; this theorem records the structural relation between them.

## Statement

**Theorem (KZ-diamond strict commutation).** *On the temporal 2-category $\mathbf{T}(\mathcal{C}, \lambda)$, the closure 2-monad $\mathrm{Cl}$ and the Emmenegger fibration 2-comonad $\mathbb{N}$ commute via a **strict** distributive law (not just pseudo). Equivalently, the canonical 2-cell*

$$\delta : \mathbb{N} \circ \mathrm{Cl} \;\Rightarrow\; \mathrm{Cl} \circ \mathbb{N}$$

*is the identity 2-cell componentwise. The composite $\mathrm{Cl} \circ \mathbb{N} = \mathbb{N} \circ \mathrm{Cl}$ is a strict 2-monad-2-comonad pair on $\mathbf{T}(\mathcal{C}, \lambda)$, and its algebras are settlings carrying both fibration and closure structure compatibly. The same statement holds on the dual side for the [dualized closure 2-comonad](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/dualized-closure-2-comonad.md).*

## Proof sketch

The proof requires three steps: (1) identify the common 2-category on which both $\mathrm{Cl}$ and $\mathbb{N}$ act; (2) verify axis-orthogonality of the underlying object-level action; (3) verify the canonical comparison 2-cell is the identity.

### Step 1: Common 2-category

$\mathrm{Cl}$ is defined on $\mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$ — the 2-category of [predication fibrations](../objects/predication-fibration.md). $\mathbb{N}$ is defined on $\mathbf{Cat}/\mathcal{C}$. These are different 2-categories, so a direct $\delta : \mathbb{N} \circ \mathrm{Cl} \Rightarrow \mathrm{Cl} \circ \mathbb{N}$ comparison is not literally meaningful between the two original 2-categories.

The corpus's resolution is to consider both operations on **the 2-category of settlings**, i.e., on objects in the intersection $\mathbb{M}$-$\mathrm{Alg} \cap \mathrm{Cl}$-$\mathrm{Alg}$ — predication fibrations that are simultaneously cloven Grothendieck fibrations (an $\mathbb{M}$-algebra structure on the underlying $\mathbf{Cat}/\mathcal{C}$ object) and $\mathcal{C}$-closure-stable (a $\mathrm{Cl}$-algebra structure on the predication fibration).

For such settlings, both operations are *partial endomorphisms* — $\mathrm{Cl}$ refines the closure-status of the settling (up to settling-stage advancement), and $\mathbb{N}$ refines the fibration-status of the underlying $\mathbf{Cat}/\mathcal{C}$ object (up to fibration-cleavage refinement). Crucially, the two refinements act on *disjoint* aspects of the settling's data:

- $\mathrm{Cl}$'s action on a settling $v$ touches the values $v_q \in \mathbf{L}^{\bowtie\,E \times E}$ at each predicate $q$, but does NOT change the predicate-category structure (which predicates are related, the cleavage of the fibration, the indexing).
- $\mathbb{N}$'s action on $v$ touches the predicate-category structure (refining the cleavage), but does NOT change the values $v_q$ at any individual predicate.

This disjointness is a structural feature, not a coincidence — it reflects the [two-disentangled-KZ-structures narrative](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/two-disentangled-kz-structures.md) and is a direct consequence of the corpus's design: the closure operator is *valued* in $\mathbf{L}^\bowtie$, while the fibration-refinement is *indexed* by the predicate category.

### Step 2: Object-level commutation

For a settling $v$ at $(q, \tau)$ (predicate $q$, stage $\tau$):

- $\mathrm{Cl}(v)$ has the same predicate-category structure as $v$ (Axiom 4 of the [closure-rule language](../concepts/closure-rule-language.md): closure is $\mathcal{C}$-natural). Its values are advanced by one closure-step, so it lives at $(q, \tau + 1)$.

- $\mathbb{N}(v)$ has the same value-data as $v$ at each predicate (the cleavage refinement does not change valuations, only their indexing structure). It lives at $(q', \tau)$ where $q'$ is the predicate $q$ with the refined cleavage.

Composing in either order gives a settling at $(q', \tau + 1)$ with the refined cleavage AND the closed values. Since the refinement (cleavage) and the closure (values) commute as object-level operations:

$$\mathrm{Cl}(\mathbb{N}(v)) = \mathbb{N}(\mathrm{Cl}(v))$$

at the object level of the temporal 2-category.

### Step 3: 2-cell triviality

The canonical 2-cell $\delta : \mathbb{N} \circ \mathrm{Cl} \Rightarrow \mathrm{Cl} \circ \mathbb{N}$ in the temporal 2-category is built from the unit / counit / multiplication / comultiplication of the $\mathbb{M} \dashv \mathbb{N}$ adjunction together with the unit / multiplication of $\mathrm{Cl}$. By Step 2, both compositions equal each other on objects; the 2-cell $\delta$ is thus a *self-comparison* of an object with itself.

By the [closure-2-monad lax-idempotence theorem](closure-2-monad-lax-idempotence.md) (proved, K1: $\mu \dashv \eta_\mathrm{Cl}$ with identity counit), the closure-side coherence cells in $\delta$ are uniquely determined and reduce to identities under the lax-idempotence relations.

By the [Emmenegger fibration 2-comonad](emmenegger-fibration-comonad.md) theorem (proved, [@emmenegger-et-al2024]), the fibration-side coherence cells in $\delta$ are uniquely determined and reduce to identities under the dual lax-idempotence relations for $\mathbb{N}$.

Combining: $\delta$ has identity 2-cells componentwise. The distributive law is strict.

### Step 4: Composite as strict 2-monad-2-comonad

With $\delta$ strict, the composite $\mathrm{Cl} \circ \mathbb{N}$ on the 2-category of settlings is a 2-monad-2-comonad pair with strict associativity and unit laws (no pseudo-coherence). Its (co)algebras are settlings carrying both fibration cleavage and closure-stability, with the cleavage and closure compatible via the strict distributivity.

### Step 5: Dual side

The dual temporal 2-category swaps $\mathbb{M}$ and $\mathbb{N}$ (per the [Emmenegger 2-comonad's Priestley-dualization remark](emmenegger-fibration-comonad.md)). The [dualized closure 2-comonad](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/dualized-closure-2-comonad.md) acts dually on dualized settlings, with the [dualized closure colax-idempotence theorem](../../../../closure-2-monad/references/dualized-closure-colax-idempotence.md) providing the dual-side functoriality argument.

The argument in Steps 1–4 transfers verbatim with $\mathrm{Cl} \leftrightarrow \check{\mathrm{Cl}}$ and $\mathbb{N} \leftrightarrow \mathbb{M}$ swapped: the object-level commutation holds because the same disjointness-of-data argument applies, and the 2-cell triviality holds by colax-idempotence. $\square$

## What the proof does and does not establish

**Established at sketch rigor.**

- The conceptual structure: $\mathrm{Cl}$ and $\mathbb{N}$ act on disjoint aspects of a settling's data (values vs cleavage), so their object-level composition is order-independent.
- The 2-cell $\delta$'s structure as a composite of standard coherence cells from $\mathrm{Cl}$'s lax-idempotence and $\mathbb{N}$'s lax-co-idempotence.
- The reduction of $\delta$ to identities via the per-side coherence theorems.

**Remaining for promotion to proved at corpus rigor.**

- A precise statement of the 2-category of settlings (the $\mathbb{M}$-$\mathrm{Alg} \cap \mathrm{Cl}$-$\mathrm{Alg}$ intersection) as a 2-category in its own right, with explicit 2-cell structure.
- Verification that the per-side coherence cells of $\mathrm{Cl}$ and $\mathbb{N}$ are *genuinely independent* — i.e., that no coherence cell of $\mathrm{Cl}$ touches the cleavage data, and no coherence cell of $\mathbb{N}$ touches the value data. This is morally clear from the definitions but requires explicit verification in the formal 2-categorical algebra.
- The dual-side argument requires the [dualized closure 2-comonad](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/dualized-closure-2-comonad.md)'s explicit construction, which is itself sketch-level in the corpus; tightening that promotes the dual-side claim along with this one.

The structural argument is settled; the formal verification of "no coherence cell of one operation touches the other's data" is the technical step needed to upgrade this from sketch to proved.

## Implications

1. **Common knowledge as KZ-fixed-point.** For multi-agent epistemic logic in the corpus's apparatus, common knowledge $C\phi$ corresponds to the $\mathrm{Cl}$-fixed-point of the iterated $\mathbb{N}$-coalgebra of $\phi$. Strict commutation means the order of "iterate $E$" and "take limit" is immaterial — a structural simplification over the classical Halpern-Moses construction (see [bigraded-common-knowledge theorem](bigraded-common-knowledge.md)).

2. **No pseudo-coherence overhead.** The standard Marmolejo machinery for two interacting KZ-doctrines requires pseudo-distributive laws with explicit coherence cells. The corpus's two-axis structure makes the distributive law strict, eliminating this overhead.

3. **Dual diamond.** The same structure on the dual side gives a primal/dual KZ-diamond pair, both with strict commutation. This is a structurally novel feature: dual KZ-doctrine pairs are not standard in the public literature, and having strict distributivity in both is a strong commitment.

## Position in predication categories

This theorem settles **sub-task 6a** (pseudo-distributive law existence) of the [KZ-diamond hierarchical swarm coordination question](../questions/kz-diamond-hierarchical-swarm-coordination.md), settling it positively in the strict-commutation form.

It is the prerequisite for the [bigraded common-knowledge theorem](bigraded-common-knowledge.md) (which uses strict commutation to identify $C^t \phi$ and $C^k \phi$ with the per-axis $\mathrm{Cl}$-fixed-points of the per-axis iterated $\mathbb{N}$-coalgebras).

## Status

`sketch` because:

- The axis-orthogonality argument is structurally complete and the proof outline above (Steps 1–5) makes the structural argument explicit, but the formal 2-categorical algebra (Steps 2–3) requires precise specification of the common 2-category of settlings ($\mathbb{M}$-$\mathrm{Alg} \cap \mathrm{Cl}$-$\mathrm{Alg}$ intersection) and explicit verification that the per-side coherence cells touch disjoint data. These are mechanical 2-categorical-algebra checks but not yet at corpus's standard rigor.
- The dual-side claim depends on the [dualized closure 2-comonad](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/dualized-closure-2-comonad.md), which is itself sketch-level. Promotion of this theorem requires either tightening the dual-side or restricting the theorem statement to the primal side.

**Promotion path** (refined Pass-style work, post-bigraded-common-knowledge track):

1. *Step A* — define the 2-category of settlings $\mathbf{Set}_{\mathcal{C}, \lambda} := \mathbb{M}$-$\mathrm{Alg} \cap \mathrm{Cl}$-$\mathrm{Alg}$ as a 2-categorical pullback of the two algebra 2-categories, with explicit 2-cell structure.

2. *Step B* — show that $\mathrm{Cl}$ extends to an endo-2-functor on $\mathbf{Set}_{\mathcal{C}, \lambda}$ (settling-stage advancement preserves both fibration cleavage and closure-stability). This uses Axiom 4 ($\mathcal{C}$-naturality) directly.

3. *Step C* — show that $\mathbb{N}$ extends to an endo-2-functor on $\mathbf{Set}_{\mathcal{C}, \lambda}$ (cleavage-refinement preserves both fibration cleavage and closure-stability). This requires verifying that fibration-refinement does not break closure-stability; the corpus's [predicate-category-naturality concept](../../../../../../../../../../../../../../predicate-category/content/predicate-category-naturality/predicate-category-naturality.md) gives the structural argument.

4. *Step D* — verify $\mathrm{Cl} \circ \mathbb{N} = \mathbb{N} \circ \mathrm{Cl}$ as endo-2-functors on $\mathbf{Set}_{\mathcal{C}, \lambda}$, with all coherence 2-cells reducing to identities by the per-side lax-(co)idempotence.

Steps A–D are mechanical 2-categorical-algebra work, each session-scale. After Step D the theorem is at corpus's proved rigor.

No structural obstacles remain — the difficulty is in the formal 2-categorical bookkeeping, not in any open mathematical question.
