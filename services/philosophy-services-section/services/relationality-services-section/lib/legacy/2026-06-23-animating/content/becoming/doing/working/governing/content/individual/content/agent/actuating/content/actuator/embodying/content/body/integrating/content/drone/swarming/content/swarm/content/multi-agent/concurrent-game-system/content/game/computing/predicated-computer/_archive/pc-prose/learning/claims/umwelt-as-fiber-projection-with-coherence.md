---
type: theorem
class: engineering-claim
status: proved
depends-on: [predication-fiber-functor, cache-coherence-via-functorial-projection, determinism-via-fiber-functoriality, federation-convergence, hash-injectivity-under-canonical-form]
see-also: [predicate-specialization, predicate-subject-projection, predicate-object-projection, closure-rule-system-realizes-closure-2-monad, federation-trust-bilattice-graded]
---

# An entity's umwelt is a fiber-projection with structural cross-observer coherence

**Claim.** For an entity $e \in E$ in a substrate $\mathcal{S}$ over a predication fiber $A_p$, the **umwelt of $e$ in $A_p$** is the non-$\bot$ image of a fiber-functor reindexing of the substrate's predication valuation $v$:

- the **as-subject umwelt** is $f_e^* v$ where $f_e : p|_e \to p$ is the [predicate specialization](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-specialization.md) along the inclusion $\iota_{f_e} : \{e\} \times E \hookrightarrow E \times E$,
- the **as-object umwelt** is the symmetric specialization along $E \times \{e\}$,
- the **two-position umwelt** is the bilattice $\vee_k$-join of the two,
- the **reflexive umwelt** is the diagonal-collapse image obtained via [predicate subject-projection](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-subject-projection.md) (or symmetrically [predicate object-projection](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-object-projection.md)), restricted at the substrate-content level to the cell $(e, p, e)$.

In each case, the umwelt is functorial in $\mathcal{C}$ (the predicate category) per [predication-fiber-functor](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md). Per [determinism-via-fiber-functoriality](determinism-via-fiber-functoriality.md) and [cache-coherence-via-functorial-projection](cache-coherence-via-functorial-projection.md), the umwelt's value on a given (substrate, fiber, entity) triple is uniquely determined and structurally coherent across observers, caches, and federation peers.

## Why this holds

**Part 1: The fiber functor is the umwelt operator.** Per [predication-fiber-functor](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md), there is a contravariant functor $F : \mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}(\mathbf{L})$ from the predicate category (op-ed) to distributive bilattices over $\mathbf{L}$, with action on the four predicate-generator morphism classes given pointwise on $E \times E$:

- specialization along $\iota_f : \mathrm{dom}(q) \hookrightarrow \mathrm{dom}(p)$: $f^*(v)(s,o) = v(s,o)$ if $(s,o) \in \mathrm{dom}(q)$, else $\bot$;
- converse: $f^*(v)(s,o) = v(o,s)$;
- subject-projection: $f^*(v)(s,o) = v(s,s)$;
- object-projection: $f^*(v)(s,o) = v(o,o)$.

For an entity $e$, the specialization along $\iota_{f_e} : \{e\} \times E \hookrightarrow E \times E$ retains $v$'s value on every cell of the form $(e, o)$ and sends every other cell to $\bot$. The non-$\bot$ image is precisely the predications on which $\mathcal{S}$ has a non-bottom valuation involving $e$ as subject — the captain's "umwelt of $e$ as subject."

The as-object umwelt is the symmetric specialization. The two-position umwelt is the $\vee_k$-join in $A_p$ of the two specializations, which is again an image of a $\mathcal{C}$-morphism (the join in the bilattice corresponds to a coproduct-like construction in the fiber's distributive structure). The reflexive umwelt arises from the subject-projection (diagonal-collapse) morphism rather than specialization-at-$e$ — at the substrate-content level, the substrate further restricts to the single cell $(e, p, e)$ to express introspection, the closure step `respond(e, e)`.

**Part 2: All four constructions are functorial.** Per [predication-fiber-functor](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md), each of the four morphism classes is given a bilattice-homomorphism action by the fiber functor; compositions of these morphisms inherit the functoriality. The umwelt operators (specialization-at-$e$, the symmetric variant, the join, the diagonal collapse) are images or compositions of fiber-functor morphisms — so they preserve the bilattice structure (meets, joins in both orders) and compose along the predicate category.

**Part 3: The umwelt's value is uniquely determined by the input.** Per [determinism-via-fiber-functoriality](determinism-via-fiber-functoriality.md), the substrate's runtime implementing a fiber-functor morphism produces the unique functor output for each input. The umwelt of $e$ in $A_p$ on a given substrate valuation $v$ is therefore a function of $(\mathcal{S}, p, e, v)$ — not a runtime contingency.

**Part 4: Cross-observer coherence is structural.** Two observers $O_1, O_2$ querying the substrate for the umwelt of $e$ in $A_p$ are computing the same function of the same input — by Part 3, they must agree. Per [cache-coherence-via-functorial-projection](cache-coherence-via-functorial-projection.md), if either observer caches the umwelt by content-addressed key (the canonical hash of $(p, e, v)$ per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md)), the cache is structurally coherent. No invalidation, no reconciliation between observers — the umwelt is one value, retrieved or recomputed identically.

**Part 5: Cross-substrate coherence is federation-bounded.** Two substrates $\mathcal{S}_1, \mathcal{S}_2$ federating per [federation-convergence](federation-convergence.md) compute umwelts on each substrate's local valuation. Where the substrates agree on the entity $e$'s identity (per the federation's trust grade) and the fiber $p$'s definition, the umwelts merge by the fiber's $\vee_k$-join. In the strict and Scott-continuous regimes [federation-convergence](federation-convergence.md) admits, the merged umwelt converges at the federation's endpoint state. In the transfinite-bounded and aperiodic regimes, the per-trajectory increments converge in the federation graph's bilattice-graded trust per [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md).

## Engineering consequence

- **One umwelt operator per substrate; many engineering surfaces.** The substrate exposes a single fiber-projection primitive (the specialization-at-$e$ operator, with options for as-subject / as-object / both / reflexive). Perception ("what does this entity see in fiber $p$"), relevance filtering ("what predications matter to this entity"), and dispatch scoping ("what can this office act on") are three engineering surfaces of the same operator differing only in choice of fiber $p$. No per-app perception subsystem is needed.
- **Cross-observer agreement is free.** Two callers asking for the same entity's umwelt on the same substrate get the same answer, structurally — a UI showing "what this user sees" and a permission-check asking "can this user see X" agree by Part 4, not by convention.
- **Umwelts are content-addressed cacheable.** Per [cache-coherence-via-functorial-projection](cache-coherence-via-functorial-projection.md) plus [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), an umwelt cache keyed by the canonical hash of $(p, e, v_p)$ — where $v_p$ is the substrate's settled valuation on $p$ — never goes stale: same input means same umwelt.
- **Reflexive umwelt is the introspection surface.** An entity's `respond(self, self)` query (the substrate's closure step on the diagonal cell $(e, p, e)$ per [closure-rule-system-realizes-closure-2-monad](closure-rule-system-realizes-closure-2-monad.md)) is the reflexive umwelt — the entity's view of its own predications-with-itself. Round-7's "respond(self, self) as dreams" framing is a direct instance.
- **Federated perception agrees within trust grade.** Two substrates federating expose to a shared entity an umwelt that converges per [federation-convergence](federation-convergence.md). Disagreements between substrates are bounded by the federation's bilattice-graded trust per [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md); they are not arbitrary.

## What the theorem rules out

- **Per-app perception subsystems.** A substrate that maintains separate perception logic per application is doing redundant work — the umwelt operator is one fiber-functor morphism, parameterised by the choice of fiber $p$. Per the theorem, the perception, relevance, and dispatch surfaces share the operator structurally.
- **Cross-observer disagreement on a single substrate.** Two observers querying the same substrate for the same entity's umwelt in the same fiber must agree by Part 4. A substrate that returns different umwelts to different observers (without a corresponding difference in the input — substrate, fiber, entity, valuation) is non-functorial, hence non-conformant per [determinism-via-fiber-functoriality](determinism-via-fiber-functoriality.md).
- **Stale umwelt cache hits.** An umwelt cache keyed by content-addressed hash of $(p, e, v_p)$ that returns a value differing from the structural umwelt is either non-functorial in its operator or non-canonical in its hash; both are non-conformant per [cache-coherence-via-functorial-projection](cache-coherence-via-functorial-projection.md).
- **Specialization-at-$e$ confused with subject-projection.** The umwelt-of-$e$ operator is *specialization* along the inclusion $\{e\} \times E \hookrightarrow E \times E$ (or its symmetric / join variants) — it restricts to a sub-domain. The subject-projection morphism is a *diagonal collapse* $v(s,o) \mapsto v(s,s)$ across all subjects; it is the operator behind reflexive `respond(self, self)`, not behind the as-subject umwelt at a particular $e$. The two are distinct fiber-functor morphisms with distinct actions; conflating them produces incorrect umwelt content.
- **Unbounded cross-substrate disagreement.** Federation peers' umwelt disagreements are bounded by the federation graph's trust grade per [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md). Disagreement exceeding the trust-grade bound indicates a federation-conformance violation, not a legitimate per-substrate divergence.

## What the theorem requires

- The substrate's value-domain admits the [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md), so [predication-fiber-functor](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md) applies.
- The substrate's umwelt operators implement the fiber-functor morphisms (specialization, converse, subject-projection, object-projection) per their pointwise actions on $E \times E$.
- The substrate maintains canonical-form discipline per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), so umwelt caches are content-addressed.
- For federation cases: the federation graph carries bilattice-graded trust per [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md), and peers' fiber-algebras share the predicate-category $\mathcal{C}$.

## Position

This corollary specialises [predication-fiber-functor](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md) to the substrate-engineering surface where it is most often invoked: the entity-perception primitive. Together with [cache-coherence-via-functorial-projection](cache-coherence-via-functorial-projection.md) (caching surface) and [federation-convergence](federation-convergence.md) (cross-substrate surface), the substrate's umwelt discipline is one phenomenon — a fiber-functor morphism — at three engineering surfaces.

The substrate's claim to *coherent shared perception* is therefore structural: two observers, two caches, two federation peers, all asking for the same entity's umwelt on the same substrate, get the same answer (or, across federation, agreeing answers within the trust grade). A "perception drift" failure mode in which different parts of the substrate disagree on what an entity sees cannot occur in a substrate respecting this corollary, because the structural argument forbids it.

The substrate's `umwelt(e, p)` operator — exposed to applications as the perception primitive, to dispatch as the scoping primitive, to relevance ranking as the filtering primitive — is the same fiber-functor morphism in each role, with cross-surface coherence guaranteed by the theorem.
