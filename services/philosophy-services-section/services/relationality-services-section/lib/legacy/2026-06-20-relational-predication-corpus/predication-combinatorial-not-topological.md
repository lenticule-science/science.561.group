---
type: narrative
status: current
discusses:
  - four-regime-dichotomy
  - regime-stratification-non-semicontinuity
  - tangent-dimension-constructible-non-semicontinuous
  - skh-deformation-ext-classification
  - non-scott-continuous-firing-ordinal
  - closure-ordinal
  - bitopological-settling-site
  - paired-priestley-space
  - coarse-settling-moduli
see-also:
  - state-of-the-theory
  - the-stack-of-roles
  - regime-stratification-opener
  - settling-dynamics-opener
  - moduli-layer-opener
---

# Combinatorial, not topological

The chapter's central organizing structural fact is the [four-regime dichotomy](../../theorems/four-regime-dichotomy.md): every settling falls into one of four regimes by its closure ordinal $\kappa$. Visually and by name, the dichotomy invites an algebro-geometric or topological reading — *strata of a moduli space, with each regime a locally closed piece, and invariants varying semicontinuously across stratum boundaries*. That reading is wrong, and the audit work over the chapter's recent sessions has identified it as a recurring source of theory-external constructions that pattern-match the corpus's surface vocabulary without engaging its primitives.

The regime stratification is **combinatorial**: it is determined by the closure operator's continuity properties (Scott-continuous or not, $\omega_1$-cofinal or not) and the cofinality of the value lattice, both of which are set-theoretic / order-theoretic data, not topological data. The [regime-stratification non-semicontinuity theorem](../../theorems/regime-stratification-non-semicontinuity.md) (proved) makes the precise negative claim available: no order-theoretic topology induced by a partial order extending the natural pointwise $\leq_k$ on settlings can make $\kappa$ or $\dim H^1$ semicontinuous; consequently the regime partition is not an order-stratification in the Zariski-style sense. Whether some other (non-order-induced) topology on the moduli of MLD-classes might reproduce the regime classification as locally-closed strata is not addressed by this theorem; what is ruled out is the natural one, and that is the source of most of the standing misreadings. Reading the chapter accurately depends on keeping the combinatorial nature of the stratification in front, especially when importing apparatus from neighbouring literatures that habitually do work the corpus's stratification.

This narrative names the distinction, traces its consequences across the chapter's strands, and points to where genuine topology in the corpus *does* live — the bitopological site and the paired-Priestley fibers — so the reader does not lose them by over-correcting. The load-bearing claims below (non-semicontinuity, tangent-dimension constructibility, four-regime decomposition, step-$n$ meta-stratification, aperiodic injective classification) are all at proved-theorem rigor in the chapter; the realizability characterization on aperiodic $H^1$-classes is regime- and language-specific and partial.

## What makes the stratification combinatorial

A settling's regime is determined by the smallest ordinal $\kappa$ at which its valuation orbit becomes a fixed point of the closure operator. The four regimes correspond to four bands of $\kappa$:

- $\kappa < \omega$: strict
- $\kappa = \omega$: Scott-continuous
- $\omega < \kappa < \omega_1$: transfinite-bounded
- $\kappa \geq \omega_1$: aperiodic

Which band a given settling lands in is determined by two structural facts about its closure operator, both purely combinatorial:

- *Whether the closure operator is Scott-continuous*: i.e., whether $\mathrm{cl}$ commutes with directed suprema in the fiber algebra. Scott-continuity is an order-theoretic property of a monotone map — true or false depending on whether any rule fires only at limit ordinals after countably many predecessors are present, with the consequent not derivable from any finite subset.
- *Whether the value lattice's directed-cofinality is bounded by $\omega_1$*: i.e., whether all directed suprema in the fiber algebra are realized at countable ordinals. For finite or $\omega$-presentable lattices this is automatic; for the aperiodic regime the condition fails, and uncountable cofinality is what carries the regime's distinctive content (per [non-Scott-continuous firing ordinals](../../teaching/explanations/non-scott-continuous-firing-ordinal.md)).

Both properties are diagnoses of the closure operator's combinatorial structure: which rules it has, what their antecedents look like, what suprema are needed to fire them. Neither is a topological property of any space. The stratification is therefore stable under any structural transformation that preserves Scott-continuity and lattice-cofinality, and it is *not* stable under transformations (such as topological refinement) that operate on a space rather than on the closure-rule structure.

## What the non-semicontinuity theorem proves

The [regime-stratification non-semicontinuity theorem](../../theorems/regime-stratification-non-semicontinuity.md) constructs three settlings $v_B \leq_k v_C \leq_k v_{\mathrm{pre}}$ — pointwise $\leq_k$-comparable in the natural order on settlings — whose closure ordinals are $\omega, \omega + 1, \omega$ and whose $\dim H^1$ values are $0, 1, 0$. The chain represents three distinct MLD-classes, and the regime-typing along the chain is *non-monotonic*: it goes B → C → B, with $\dim H^1$ jumping up and then down.

The structural content of the theorem is that *no* partial order on MLD-classes extending the natural $\leq_k$-pointwise order can make either $\kappa$ or $\dim H^1$ semicontinuous in either direction. The mechanism the theorem makes visible — *antecedent-satisfaction* (more cells fire more rules, raising $\kappa$) competing with *consequent-preemption* (more cells make some rule consequents trivially true, lowering $\kappa$) — is generic, not specific to the constructed example. Neither effect dominates universally, so no semicontinuity can hold.

The consequence: the regime stratification is not a Zariski-style locally-closed stratification of the moduli of MLD-classes — at least not via any order-induced topology coming from a partial order extending the natural pointwise $\leq_k$. It is at best a partition into combinatorially-defined pieces, with no such order-induced topology on the moduli making the partition into a stratification in the algebro-geometric sense. The sets are well-defined; the natural-order geometry is not. (As noted in paragraph 2: this is a precise scoped claim, not a universal one — the theorem is silent on hypothetical non-order-induced topologies, of which the corpus does not currently construct any candidate.)

## Consequences across the chapter

Several strands of the chapter inherit the combinatorial-not-topological character of the regime stratification, and tracking them by this lens makes the corpus's structural commitments more legible.

**Deformation theory.** Combined with the [SKH deformation Ext-classification theorem](../../theorems/skh-deformation-ext-classification.md), the non-semicontinuity result yields the [tangent-dimension constructible-non-semicontinuous theorem](../../theorems/tangent-dimension-constructible-non-semicontinuous.md): the tangent-dimension function $T(v) = \dim_{\mathbb Z} \mathrm{Ext}^1(\mathcal F_v, \mathcal F_v)$ is constructible (locally constant on each regime piece) but non-semicontinuous (jumps up *and down* across regime boundaries). The deformation theory is unobstructed at every point — formally smooth on each piece — but the moduli is not globally smooth in the tangent-dimension sense. The classical algebro-geometric expectation (tangent-dimension upper-semicontinuous on a smooth-in-codimension-one moduli) is the wrong frame for reading the corpus's deformation behaviour.

**Moduli structure.** The [coarse settling moduli](../../objects/coarse-settling-moduli.md) is the underlying set of MLD-classes; the [settling moduli prestack](../../objects/settling-moduli-prestack.md) and [meta-moduli prestack](../../objects/meta-moduli-prestack.md) refine to stack-level structure. The four-regime [regime decomposition](../../theorems/regime-decomposition.md) partitions the underlying set; it does not *topologize* it. Separately, the [step-$n$ moduli substacks](../../objects/step-n-moduli-substack.md) stratify the meta-aperiodic sector (plus a residue) per the [step-$n$ meta-stratification theorem](../../theorems/step-n-meta-stratification.md); this is a finer stratification of one of the four regimes, not a refinement of the four-regime decomposition itself. In neither case does the partition come with the locally-closed gluing structure of a Zariski stratification of a scheme.

**Aperiodic-regime classification.** The [aperiodic-regime classification theorem](../../theorems/aperiodic-regime-classification.md) classifies aperiodic settlings up to MLD-equivalence by an $H^1$-class — *injectively*, in common-base scope, per [aperiodic-regime moduli classification](../../theorems/aperiodic-regime-moduli-classification.md). The classification is by an algebraic invariant (the Anderson–Putnam classifying invariant), but the indexing on the moduli is set-theoretic: which $H^1$-classes are *realized* by some MLD-class is a separate, regime- and language-specific question, addressed by [aperiodic-regime realizability](../../theorems/aperiodic-regime-realizability.md) and the surrounding realizability program rather than by a blanket surjectivity. There is no claim that the moduli of aperiodic settlings carries a topology over which $H^1$ varies continuously.

**Audit episode.** The [Lawvere-Laplacian on a 4-cycle](state-of-the-theory.md) computation that the audit refuted was the cleanest case of the topological misreading at the *theorem* level. The computation took a generic simplicial 1-complex with constant V-sheaf, computed an $H^1$, and compared it to classical cellular cohomology — treating the corpus's V-Cat $H^1$ as if it were a cohomology of *spaces*, with predication structure replaced by topological structure. The corpus's actual $H^1$ on corpus objects (via [aperiodic-regime cohomology via direct limit](../../theorems/aperiodic-regime-cohomology-via-direct-limit.md), [step-$n$ cohomological rank theorem](../../theorems/step-n-cohomological-rank-theorem.md), [continuous-V step-$n$ theorem](../../theorems/continuous-valued-step-n-cohomological-rank.md)) gives rank-$n$ classifying-invariant content on substitution settlings; constants-on-a-cycle is not the right toy case because predication settlings are not generic CW complexes. The audit's standard — "a theorem is theory-internal if both its statement and its proof derive from corpus primitives" — operationally enforces the combinatorial-not-topological reading: the corpus's primitives include cells, closures, and ordinals, not points, opens, and dimensions.

## What *is* topological in the chapter

The negative claim is a constraint on the regime stratification, not a wholesale rejection of topology in the chapter. Genuine topology lives at two specific levels and should not be confused with the combinatorial regime structure.

- **Per-fiber paired-Priestley topology.** Each fiber $X_q^\tau = \mathrm{Spec}(A_q)$ at settling stage $\tau$ carries a [paired Priestley space](../../objects/paired-priestley-space.md) structure: a compact totally-order-disconnected space refining the bilattice's algebraic structure into Stone-dual topological data. The fiber-level apparatus is genuinely topological — the Priestley duality theorems, the bitopological structure, the per-fiber Curry equivalence, all live here.
- **Bitopological settling site.** The [bitopological settling site](../../objects/bitopological-settling-site.md) assembles the per-fiber paired-Priestley structure across the predicate base and the settling-stage base into a Grothendieck site. The site's covers are *fiber covers only* (per [why fiber covers only](why-fiber-covers-only.md)) — the predicate-base and settling-stage variation is encoded in the site's morphisms, not in additional cover families. The site is a genuine topological-style object on which sheaf cohomology can be done; this is the level the cohomological invariants live on.

The two layers separate cleanly: per-fiber and per-site, the corpus has topology; per-moduli and per-regime-stratum, the corpus has combinatorics. The cohomological invariants extracted at the topological layer (settling cohomology, d-frame cohomology, Q-enriched cohomology) are then *applied* to discriminate combinatorial classes at the moduli layer. The classification is a use of the cohomology, not a topology on the moduli.

## How to read the chapter with this lens

The combinatorial-not-topological commitment changes how several routine reading operations work.

- **Strata of the moduli are pieces, not subschemes.** When the chapter refers to "the strict stratum" or "the aperiodic stratum," it means the set of MLD-classes with $\kappa$ in the named band. There is no claim of locally-closed structure, no closure-of-stratum, no expected dimensions, no semicontinuous behaviour of invariants across the boundary. Importing an algebro-geometric stratum-vocabulary risks attributing structure the corpus has not built.
- **Invariants are constructible, not semicontinuous.** Tangent dimension is constructible (locally constant per stratum) but jumps both ways. So does $\dim H^1$. So does $\kappa$ itself. The constructibility is genuine and useful; the semicontinuity expectation is unsupported.
- **Deformations live in their own structural category.** Deformation theory in the corpus runs through Ext groups of settling-associated sheaves; per [SKH deformation Ext-classification](../../theorems/skh-deformation-ext-classification.md), the deformation classes are first-cohomology classes of an explicit sheaf complex. Local smoothness on each stratum is unobstructedness; global smoothness is not the right expectation, because the moduli does not have the topological structure that would make global smoothness meaningful.
- **Comparisons with Anderson–Putnam.** The [aperiodic-regime classification](../../theorems/aperiodic-regime-classification.md) is structurally analogous to Anderson–Putnam's classification of substitution tilings, but the analogy is at the level of *classification by a cohomological invariant*, not at the level of *topology on the moduli space*. The Anderson–Putnam direct-limit construction in the corpus is the indexing apparatus for an invariant; it is not a topology on the moduli.

The combinatorial-not-topological lens is also a quick diagnostic for whether a proposed import from algebraic geometry, spectral graph theory, or differential topology is going to fit. If the import works only after assuming the corpus's regime stratification is a topological stratification of the moduli *via the natural order on settlings*, the import is not going to fit cleanly — not because the corpus rejects the technique, but because the technique is asking for structure the corpus has not built and has shown is unavailable in the natural order-induced way (per the non-semicontinuity theorem). An import that supplies its own non-order-induced topology on the moduli is not ruled out by anything proved here; the corpus simply has not built one, and a candidate would itself need to be theory-internal to be admissible.

## Where to read

For the four-regime classification in detail: [regime-stratification-opener](regime-stratification-opener.md). For the negative theorem about semicontinuity: [regime-stratification non-semicontinuity](../../theorems/regime-stratification-non-semicontinuity.md). For the deformation-theoretic consequences: [tangent-dimension constructible-non-semicontinuous](../../theorems/tangent-dimension-constructible-non-semicontinuous.md). For where genuine topology lives in the chapter: [why-fiber-covers-only](why-fiber-covers-only.md), and the [bitopological settling site object](../../objects/bitopological-settling-site.md). For the audit episode that made the topological misreading explicit at the theorem level, with the corrected structural reading: [state-of-the-theory](state-of-the-theory.md) post-bigraded-common-knowledge update section. For where this commitment sits in the chapter's role/realization/invariant stratification: [the stack of roles](the-stack-of-roles.md), specifically the *invariant layer* discussion and the cross-framework / non-semicontinuity tensions.
