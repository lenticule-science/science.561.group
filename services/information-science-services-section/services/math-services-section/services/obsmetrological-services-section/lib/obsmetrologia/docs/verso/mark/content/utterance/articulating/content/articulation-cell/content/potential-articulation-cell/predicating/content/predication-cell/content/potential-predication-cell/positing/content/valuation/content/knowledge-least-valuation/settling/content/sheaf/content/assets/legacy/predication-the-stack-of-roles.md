---
type: narrative
status: current
discusses:
  - adjudication
  - evidence
  - truth
  - knowledge
  - negation
  - temporal-accumulation
  - predication-cell
  - pre-bilattice
  - predication-fiber-algebra
  - predication-hyperdoctrine
  - predication-settling
  - settling-cohomology
  - four-regime-dichotomy
see-also:
  - state-of-the-theory
  - part-1-derivation
  - part-2-study-and-use
  - settling-dynamics-opener
  - regime-stratification-opener
---

# The stack of roles

Predication categories has been growing along several different fronts at once — d-frame cohomology, agentic-swarm theory, Q-enriched extensions, common-knowledge constructions, deformation theory — and each new strand introduces its own objects and its own vocabulary. To a reader picking up the chapter mid-development, the proliferation can make the theory look like a federation of related-but-distinct pieces of math. It is not. The pieces are layered, and the layers are surprisingly stable: the math at the top changes session by session, the math in the middle changes year by year, and the math at the bottom has not changed since the chapter's foundational pass.

This narrative names the three layers and explains what each layer is responsible for. It complements [state-of-the-theory](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/state-of-the-theory.md) (which catalogues current status by content area) and the two part-narratives [Derivation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/part-1-derivation.md) and [Study-and-use](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/part-2-study-and-use.md) (which catalogue chapter dependencies). The point of separating the layers is to make it visible *what kind of thing* a new development is — a new role, a new realization of a stable role, or a new invariant of a stable realization — and therefore which other parts of the chapter it interacts with.

## The three layers

- **Roles.** What the theory takes as conceptually fixed: the structural jobs that any concrete realization of the framework must perform. The role layer is a vocabulary of *jobs*, not of *objects*. It is the slowest-changing layer; the named roles have been stable since the early chapters of the corpus.
- **Realizations.** How each role is filled by a specific mathematical object. The bilattice is one realization of a value structure; the predication fiber algebra is one realization of a predication-cell carrier; the closure 2-monad is one realization of inferential settling. Several alternative realizations sit in the corpus simultaneously (Boolean d-frame, Heyting frame, Lawvere quantale; discrete-points fiber, order-complex fiber; etc.). The realization layer is where most of the chapter's *math* lives.
- **Invariants.** What the corpus extracts from a realization: closure ordinal, regime, cohomology classes, moduli points, MLD-equivalence classes. Invariants depend on a chosen realization and are how the theory says something *non-trivial* about it. This is the layer where almost all theorems live, and where almost all of the chapter's *difficulty* lives.

The reason this stratification matters is that new math, when it arrives, almost always slots into the realization or the invariant layer without disturbing the role layer above it. The Q-enriched cohomology extension is a new *realization* (sheaves valued in a Lawvere quantale) of the same roles — evidence is still paired and transverse, knowledge is still monotone, settling is still saturation under closure. The bigraded-common-knowledge construction is a new *invariant* (two parallel greatest fixed points) extracted from an existing realization. Per-observer rule systems are a new realization of the *adjudication* role, distinguishing inferential disagreement from evidential disagreement at a finer grain than the original multi-observer object did. None of these required redrawing the role layer.

## The roles

The role-concepts in `concepts/` are the chapter's articulation of this layer. They are deliberately not realization-dependent — each concept records how the role is instantiated across the bilattice, twist-product, d-frame, fiber-algebra, settling, and (where applicable) CRDT and Q-enriched settings, rather than collapsing to any single realization.

- [**Adjudication**](../../teaching/explanations/adjudication.md). The job of resolving an evidential record into a state. Distinct from inference (which derives new evidence): adjudication consumes evidence and returns a position. Realized at the bilattice level by the $\leq_k$-join of evidential cells (with $\top$ for two-sided evidence); at the settling level by the closure operator's saturation step; at the multi-observer level by the per-observer rule application. The corpus's distinctive content here is that adjudication treats $\top$ as a *legitimate* output rather than an error condition.
- [**Evidence**](../../teaching/explanations/evidence.md). The job of carrying paired, transverse, monotone records of what has been observed. The role's three pressures (pairedness, transversality, monotonicity) force the value structure to be a (bounded interlaced) bilattice rather than a single lattice. Realized at the propositional level by the Belnap four-valued algebra; at the predication level by the fiber algebra $A_q = \mathbf L^{\bowtie\, E \times E}$; at the d-frame level by the consistency / totality refinement.
- [**Truth**](../../teaching/explanations/truth.md) and [**knowledge**](../../teaching/explanations/knowledge.md). The two orders the bilattice carries — what is *the case* (truth, $\leq_t$) and what is *taken to be the case* (knowledge, $\leq_k$). Their independence is the structural fact that makes the framework a bilattice rather than a lattice; their interaction is what makes adjudication well-defined. The truth role is what equality, classical entailment, and modal $\Box$/$\Diamond$ track; the knowledge role is what settling monotonicity, CRDT merge, and information-ordering of states track.
- [**Negation**](../../teaching/explanations/negation.md). The job of swapping the polarity of a record without disturbing its informational content. Realized as the coordinate-swap involution on the twist product, as $\neg : \mathbf L \to \mathbf L$ on the bilattice, as the internal $\mathbb Z/2$-gauge that licenses [equivariant settling cohomology](../../settling-cohomology/references/equivariant-settling-cohomology.md). The role's distinctive content is that strong negation is *not* the De Morgan dual; it acts only along the truth order and leaves the knowledge order strictly fixed.
- [**Temporal accumulation**](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/temporal-accumulation.md). The job of taking the dynamics seriously: settlings are transfinite trajectories, not single states, and the structural invariants are properties of the trajectory rather than of any single valuation. Realized as the [settling endofunctor](../../morphisms/settling-endofunctor.md)'s orbit, as $\leq_k$-monotone $\leq_k$-continuous sequences, as the closure ordinal $\kappa$. The role's distinctive content is the *transfinite* commitment: aperiodic settlings have $\kappa \geq \omega_1$, and the corpus's deepest results live at that ordinal.
- [**Predication cell**](../../teaching/explanations/predication-cell.md). The atomic unit on which everything else is computed: an oriented subject-to-object placeholder $(s, p, o)$ carrying a value $v \in \mathbf L^{\bowtie}$. Realized as a fiber-algebra element, as a position in a network sheaf, as a parameter of a multi-observer rule. The cell is *oriented* — $s \to o$ — and that orientation is what generates the four irreducible reindexing operations (specialization, converse, subject-projection, object-projection) at the predicate-category level.

These seven role-concepts are the theory's *commitments*. They have not changed since the chapter's first comprehensive pass and there is no current proposal to add or remove a role. New developments either fill an existing role with a new realization or compute a new invariant of an existing realization.

## The realizations

The realization layer is much wider, and substantially less stable. The chapter currently carries:

- **Value-structure realizations.** Belnap four-valued bilattice, distributive bilattice, post-closure bilattice, twist product, Boolean d-frame, Heyting frame, Lawvere quantale, $[0,1]$-valued continuous-state lattice. Each fills the *evidence* role and supports the *truth* and *knowledge* roles, with progressively weaker structural assumptions and progressively narrower theorems applicable.
- **Predication-cell-carrier realizations.** Predicate category $\mathcal C$ with predication fiber algebras $A_q = \mathbf L^{\bowtie\, E \times E}$ at each object; predication fibration; predication hyperdoctrine; multi-observer system; multi-observer system with per-observer rules; n-ary predication framework. These are different ways of organizing the cells once the value structure is chosen.
- **Settling realizations.** Closure-2-monad orbit; CRDT replica family; Anderson–Putnam direct limit on a substitution; continuous-state semigroup; stochastic stationary-distribution; agentic swarm with per-agent rule systems. Each fills the *temporal accumulation* role with a specific dynamical apparatus.
- **Site / dualization realizations.** Bitopological settling site, Q-enriched cellular site on the order complex of the clopen lattice, network sheaf on an agent graph. Each provides a setting for the cohomological invariants downstream.

The realization layer is where the chapter's *width* lives — and it is also where most cross-strand confusion has historically come from. Two different realizations of the same role typically share the role-level theorems and disagree on the realization-level ones. The audit recorded in [state-of-the-theory's post-bigraded-common-knowledge update section](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/state-of-the-theory.md) is the canonical example: a Lawvere-Laplacian computation on a generic 4-cycle was a computation on an object that filled *no* corpus role — neither the cells were corpus predication cells nor the closure was a corpus closure — and was correctly refuted as theory-external. The realization-layer discipline that audit established is: a new theorem is theory-internal if its statement and its proof both live entirely within objects that fill corpus roles.

## The invariants

The invariant layer is where almost all the chapter's theorems live and where its structural content is concentrated. The principal invariants:

- The [**closure ordinal**](../../objects/closure-ordinal.md) $\kappa$ of a settling, which classifies it into one of four regimes via the [four-regime dichotomy](../../../../../references/four-regime-dichotomy.md).
- [**Settling cohomology**](../../settling-cohomology/settling-cohomology.md) and its variants (d-frame-valued, Q-enriched, bigraded), with universal vanishing above degree 1 and regime-by-regime structure.
- The [**aperiodic classifying invariant**](../../objects/aperiodic-classifying-invariant.md) — the $H^1$-class of an aperiodic settling, classifying it up to MLD-equivalence per the [aperiodic-regime classification theorem](../../../../aperiodic-settling/references/aperiodic-regime-classification.md).
- The [**moduli classifying function**](../../morphisms/moduli-classifying-function.md) sending an MLD-class to its settling-associated-sheaf isomorphism class, and its [stack-level refinement](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-moduli-stack-theorem.md).
- The [**MLD-equivalence**](../../teaching/explanations/mutually-locally-derivable.md) classes themselves, which the cohomological invariants are designed to discriminate.
- For the distributed-systems strand, the consensus space $\Gamma = H^0$ with disagreement-paraconsistency tracked at the d-frame level, and the cohomological-CALM characterization of coordination-freeness.

These invariants depend on the realization layer in a non-trivial way: $\kappa$ is well-defined for any closure-2-monad orbit, but the four-regime classification only delivers its sharpest content for the discrete-bilattice realization; settling cohomology is computable in any of the four [cohomological frameworks](three-cohomological-frameworks.md), but cross-framework agreement is only verified in one concrete instance. The invariant layer is where the chapter's *honest* tensions live, and where the [state-of-the-theory's status reality check](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/state-of-the-theory.md) catalogues what is proved versus sketch.

## What changes when the math changes

The stratification gives a quick way to read what any given new development is doing:

- **A new role** would change the chapter's commitments. The chapter has not added a new role since the foundational pass, and there is no current proposal to add one. If one were proposed, it would propagate through every realization and every invariant.
- **A new realization** of an existing role is the most common kind of new development. The Q-enriched cohomology, the per-observer rule extension, the network-sheaf-on-agent-graph reformulation, the Felber task-sheaf translation, the continuous-state regime classification — all of these are new realizations slotting into existing roles. They typically come with their own scope-restricted theorems and either inherit or refine the invariants.
- **A new invariant** of an existing realization is the second most common. The bigraded common-knowledge construction, the [forward-trajectory Galois adjunction](../../theorems/forward-trajectory-via-galois-adjunction.md), the [settling internal Hom](../../../../../references/settling-internal-hom.md), the [void-cone cohomology](../../../../lorentzian-causal-settling/references/void-cone-cohomology.md) — each extracts something new from an already-realized object. These are the theorems most likely to *refine* the chapter's classification of an existing object rather than to extend its scope.

The role/realization/invariant separation also makes it visible which open questions belong to which layer. The [cross-framework agreement question](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/per-fiber-curry-on-clopen-lattice-fiber.md) is at the invariant layer (do two realizations of the same cohomology role compute the same invariants?). The [non-Boolean cohomology extensions](../../theorems/q-enriched-hodge-theorem-non-boolean-frames.md) are at the realization layer (does the Boolean-d-frame realization extend to weaker value-structure realizations?). The [unified distributed-systems cohomology question](../../learning/questions/unified-distributed-systems-cohomology.md) is asking whether several distinct realizations (corpus settling, Felber task sheaf, Hansen–Ghrist network sheaf) are realizations of the same role, and to what extent the existing role-level theorems apply uniformly across them. None of these is a question about the role layer itself.

## Where to read next

For a content-area-by-content-area survey of what is currently established and where the load-bearing risks sit, [state-of-the-theory](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/state-of-the-theory.md) is the catalog. For the seven-chapter structural derivation that builds the realizations on top of the role layer, [Derivation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/part-1-derivation.md). For the topics built on top of the derived apparatus, [Study-and-use](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/part-2-study-and-use.md). For the multi-framework structure of the cohomological invariants and what cross-framework agreement currently looks like, [the three cohomological frameworks](three-cohomological-frameworks.md). For each role's full articulation across realizations, the corresponding `concepts/` file linked above.
