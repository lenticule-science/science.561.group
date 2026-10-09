---
type: narrative
status: draft
discusses:
  - cohomological-framework
  - cohomological-framework-2category
  - cohomological-framework-comparison
  - framework-1-2-strict-agreement
  - framework-2-3-strict-agreement
  - framework-3-4-disagreement
  - framework-4-vanishing-transfer
  - q-enriched-cohomology
  - q-enriched-cohomology-higher-degree-vanishing
  - q-enriched-derived-cohomology-boolean-d-frame
  - lawvere-laplacian-grothendieck-sites
  - verdier-duality-bitopological-site
  - settling-moduli-stack-theorem
  - meta-moduli-prestack
  - four-regime-dichotomy
  - aperiodic-regime-classification
  - closure-2-monad
  - dualized-closure-2-comonad
  - temporal-2-category
  - bitopological-settling-site
  - d-frame
  - paired-priestley-space
  - predication-fiber-algebra
  - parameter-base-category
  - priestley-dual-cover-topology
  - settling-automorphism-1-truncation
  - internal-z2-gauge
  - higher-categorical-direction
  - cellular-extension-plan
see-also:
  - three-cohomological-frameworks
  - regime-stratification-opener
  - moduli-layer-opener
  - fine-vs-visible-moduli
  - higher-categorical-direction
  - verdier-duality-opener
---

# One stack, two t-structures, one recollement: predication-categories as a stratified Q-enriched six-functor formalism

This is a *Grothendieck reading* of predication-categories — a structural look at what the chapter is, structurally, trying to be, distinct from how it is currently written. The reading is unauthorised in the sense that no `objects/` or `theorems/` file has yet been edited to enact it; it is a proposal for what the underlying object's right name is. The argument is that the corpus, which presents itself as a 2-categorical study of *four* cohomological frameworks on *four* regimes with *two* parallel classifying invariants, is in fact studying *one* moduli stack carrying *one* derived cohomology, with the apparent multiplicity arising from three independently-chosen presentations: a heart-choice, a regime-stratification, and a duality. Naming this collapses several of the chapter's open questions into the same question and exposes the choices the corpus is silently making about generality.

## The single object

Strip away the presentations and the underlying object is:

> The Q-enriched stable ∞-category $\mathrm{Sh}^{\mathrm{Q}}_\infty(\mathbf T^*; \mathbf{dFrm})$ of paired-quantale-enriched sheaves on the bitopological settling site $\mathbf T^*$, fibered over the parameter base $(\mathbf B, J_{\mathbf B})$, equipped with the lax-idempotent action of the closure ∞-monad $\mathrm{Cl}$ and its dual ∞-comonad $\mathrm{Cl}^*$, stratified by closure-ordinal cofinality $\kappa$ at the boundaries $\omega$ and $\omega_1$.

Everything else in the chapter is, on this reading, a *presentation of* this object: a chart, a section, a coordinate, a stratum, a t-structure, a heart, an equivariance datum, or a strictification. The corpus already has the pieces — the [bitopological settling site](../../../../bitopological-settling-site/bitopological-settling-site.md), the [d-frame](../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/d-frame.md), the [Q-enriched cohomology](../../../../bitopological-settling-site/content/quantale-enriched-sheaf/content/q-enriched-cohomology/q-enriched-cohomology.md), the [closure 2-monad](../../morphisms/closure-2-monad.md), the [parameter base category](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/parameter-base-category.md) with its [Priestley-dual cover topology](../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/priestley-dual-cover-topology/priestley-dual-cover-topology.md), the [settling moduli stack theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-moduli-stack-theorem.md), the [four-regime dichotomy](../../../../../references/four-regime-dichotomy.md). What it has not done is glue them into a single statement. The proposal of this narrative is that the gluing should be the chapter's organizing claim, not its tacit background.

## Reading 1 — the four frameworks are two t-structures on one stable ∞-category

The [2-category $\mathbf{CohFr}$](../../objects/cohomological-framework-2category.md) catalogues four 0-cells $\mathbb F_1, \mathbb F_2, \mathbb F_3, \mathbb F_4$, each with its own site-presentation, value category, and cohomology functor. The corpus has done the careful work of typing the *comparisons* between them as 1-cells with subdomains and recording that some comparisons are agreement-1-cells while others are not. The structural fact that organizes them is not in $\mathbf{CohFr}$ itself; it is one level higher.

$\mathbb F_1$ (substitution-matrix Anderson–Putnam) is a *computational presentation*: it sees the bitopological settling site only via its associated tile space $\Omega_\omega$ for substitution settlings, and its cohomology is Čech in $\mathbf{Ab}$. It is the chapter's empirical instrument, not a conceptual layer. The [F1↔F2 strict agreement](../../theorems/framework-1-2-strict-agreement.md) on its restricted subdomain is exactly the statement that, where it computes, $\mathbb F_1$ is the abelianization of $\mathbb F_2$ — the shadow of the d-frame setting under the forgetful $\mathbf{dFrm} \to \mathbf{Ab} \times \mathbf{Ab}$. So $\mathbb F_1$ is not really a framework in the sense $\mathbb F_2, \mathbb F_3, \mathbb F_4$ are; it is a measurement device, the [@anderson-putnam] abelian shadow of the genuine framework.

$\mathbb F_2$, $\mathbb F_3$, and $\mathbb F_4$ are the genuine candidates. And here the structural collapse is sharp:

- $\mathbb F_2$ and $\mathbb F_3$ are *the same theory in two charts on the fiber*. $\mathbb F_2$ reads each per-base-point fiber as a discrete 0-dimensional topological space (2 points for the standard Belnap setting) and gets degree-≥1 vanishing for free; $\mathbb F_3$ reads it as the order complex of the clopen lattice (4 vertices, 5 edges, 2 triangles, contractible) and gets degree-≥1 vanishing because $\Delta^1$ is contractible. Both readings are correct; they differ only in *which presentation of the same site* one uses. [Framework-2–3 strict agreement](../../theorems/framework-2-3-strict-agreement.md) is the proof that the choice of fiber-presentation does not affect the cohomology — exactly because the order complex of any finite clopen lattice is contractible (Lemma B1, taking the limit at the terminal clopen $X$). This is not a comparison between two theories. It is a normalization statement about the coordinates one writes the same theory in.

- $\mathbb F_3$ and $\mathbb F_4$ are, on the proposed reading, *two t-structures on the same stable ∞-category*. The corpus's [framework-3-4-disagreement](../../theorems/framework-3-4-disagreement.md) is currently stated as evidence that they are different cohomology theories — Lemma D1 records that the parallel-pair equalizer kernel strictly contains the weighted-meet-equals-unit kernel. The reframing here, which is proposal rather than theorem, is to interpret the kernel inequality as the difference between two *coboundary conventions* on the cochain complex of Q-enriched sheaves, plausibly arising as two different *truncation functors* on a common derived ∞-category $\mathcal D(\mathrm{Sh}^{\mathrm{Q}}(\mathbf T^*))$. The corpus has not constructed the ambient stable ∞-category nor verified that both kernels arise as t-structure truncations there; that construction is the work the reframing would demand. What the corpus *does* establish — agreement in the Boolean d-frame heart, by the [Boolean derived cohomology agreement theorem](../../theorems/q-enriched-derived-cohomology-boolean-d-frame.md) — is at least *consistent* with the proposed reading, since two compatible t-structures whose hearts are Boolean would generically agree there. The genuine content of the proposal is that the non-Boolean disagreement should be tracked as *which t-structure to use*, not *which theory is right*; this is a research bet, not a corollary of existing results.

So the four-framework picture compresses to: one shadow ($\mathbb F_1$), two charts on the fiber ($\mathbb F_2$ and $\mathbb F_3$ are the same theory in different fiber-coordinates), two t-structures on the derived ∞-category ($\mathbb F_3$ and $\mathbb F_4$). The corpus's heart-choice — parallel-pair vs weighted-meet — is what is being made when one chooses $\mathbb F_3$ over $\mathbb F_4$ for the downstream Verdier / strong-MLD chain (per [three-cohomological-frameworks](three-cohomological-frameworks.md)). It should be named that way: a t-structure choice on $\mathcal D(\mathrm{Sh}^{\mathrm{Q}}_\infty)$, not a framework choice on the corpus's apparatus.

This has consequences. The $\mathbb F_4$-vanishing-transfer theorem ([framework-4-vanishing-transfer](../../theorems/framework-4-vanishing-transfer.md)) says high-degree vanishing in $\mathbb F_4$ pulls back to high-degree vanishing in $\mathbb F_3$ and $\mathbb F_2$. On the t-structure reading this is automatic: vanishing of $H^{\geq 2}$ for the connective t-structure forces vanishing for any compatible t-structure, because the heart of a t-structure is closed under the higher-cohomology vanishing of the ambient stable category. The corpus is essentially proving a special case of a general fact about t-structures and is paying for the proof in the more elaborate setting.

## Reading 2 — the four regimes are a recollement on the moduli stack

The [four-regime dichotomy](../../../../../references/four-regime-dichotomy.md) stratifies settlings by closure ordinal $\kappa$ at the boundaries $\omega$ and $\omega_1$. The strict / Scott-continuous / transfinite-bounded / aperiodic strata are presented as four parallel classes, each with its own cohomology theorem and its own behaviour for the [closure 2-monad](../../morphisms/closure-2-monad.md). The structural fact organizing them is again one level up.

Cohomologically, the genuine boundary is not between four classes but between *two*: the strata where $H^{\geq 1}_{\mathbf{dFrm}} = 0$ (strict, Scott-continuous) and the strata where it is non-trivial (transfinite-bounded, aperiodic). The closure 2-monad's structural status tracks the same boundary: it is strict-idempotent (or effectively so at the $\omega$-limit) below the boundary and genuinely lax-idempotent above it. This is not a coincidence; it is the closure-monad's strictification status *being* the cohomological vanishing. Where $\mathrm{Cl}$ strictifies, the algebra of [predication fiber algebras](../../objects/predication-fiber-algebra.md) descends without higher coherence and there is nothing for $H^1$ to record; where $\mathrm{Cl}$ does not strictify, $H^1$ records exactly the failure of strictification — the lax-idempotent 2-cells that don't trivialize, packaged as a sheaf-cohomology class on $\mathbf T^*$.

The reading proposed here is *recollement* — and to be clear, this is a structural proposal, not a theorem the corpus has proved. The [settling moduli stack theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-moduli-stack-theorem.md) establishes a 1-stack with effective descent; it does not yet equip that 1-stack with the open / closed substack structure of a recollement. What the proposal asserts is that the natural recollement-presentation *should* be: an open substack $\mathscr M^{\circ}$ where $\kappa \leq \omega$ (cohomologically trivial, closure strict) and a closed complement $\overline{\mathscr M}$ where $\kappa > \omega$ (cohomologically non-trivial, closure genuinely lax), with the closed complement further stratifying into a transfinite-bounded substratum ($\omega < \kappa < \omega_1$, countable cofinality) and an aperiodic substratum ($\kappa \geq \omega_1$, uncountable cofinality), corresponding to the boundary $\omega_1$ in the closure-ordinal lattice. This would be a length-three filtration

$$\mathscr M^{\mathrm{strict}} \;\hookrightarrow\; \mathscr M^{\leq \omega} \;\hookrightarrow\; \mathscr M^{< \omega_1} \;\hookrightarrow\; \mathscr M$$

with the four strata as successive quotients. Each inclusion is the open part of a recollement; each quotient is closed. The [aperiodic-regime classification](../../../../aperiodic-settling/references/aperiodic-regime-classification.md) is the classification of the open stratum of the topmost quotient, presented (as it currently is) by an explicit cohomology class $\mathrm{cl}\text{-}\mathrm{inv}(v) \in H^1$.

On this reading the [regime-stratification non-semicontinuity](../../theorems/regime-stratification-non-semicontinuity.md) result — that $\kappa$ is not semicontinuous in any natural topology on the moduli — is the statement that this is a *set-theoretic* recollement, not a topological one. The natural fix, in the higher-categorical direction the corpus already has on its agenda ([higher-categorical direction](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/higher-categorical-direction.md)), is to read the stratification on the *derived* moduli — where the t-structure on $\mathcal D(\mathrm{Sh}^{\mathrm{Q}}_\infty)$ supplies the missing topology. The strata then become genuine open / closed substacks in the derived sense, and the [aperiodic-regime cohomology via direct limit](../../../../aperiodic-settling/references/aperiodic-regime-cohomology-via-direct-limit.md) becomes a filtered-colimit statement on the derived moduli. The corpus's "stratification is set-theoretic only" caveat is not a deficiency of the regime-decomposition; it is a consequence of insisting on the underived presentation.

The [step-$n$ tower](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/higher-categorical-direction.md#rg-flow-layer-the-step-n-tower-as-an-internal-direction) — the corpus's internal RG flow on the meta-aperiodic stratum — is, on this reading, the *blow-up* of the aperiodic stratum along the cofinality $\omega_1$. The fixed-point object $\mathscr M^{(\infty)}$ is the colimit of an iterated localization at the closure $\omega_1$-boundary; in the recollement language, it is the formal completion of the aperiodic stratum. The [critical exponents at the step-$n$ fixed point](../../../../aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/critical-exponents-at-step-n-fixed-point.md) are the Hilbert function of the local ring at this completion. The corpus has already built the right object; it has not yet named it as the formal completion.

## Reading 3 — the closure 2-monad is the algebra side of a six-functor formalism

The [closure 2-monad](../../morphisms/closure-2-monad.md) and its [dual 2-comonad](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/dualized-closure-2-comonad.md) act on the temporal 2-category, lax-idempotently. The four predicate generators (specialization, converse, subject- and object-projection) act on the [parameter base category](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/parameter-base-category.md) by base-change, giving each settling a system of pullback / pushforward functors on its fiber-algebras. Combined with the [Verdier duality on the bitopological site](../../theorems/verdier-duality-bitopological-site.md), the chapter has — in pieces — the data of a six-functor formalism on $\mathrm{Sh}^{\mathrm{Q}}(\mathbf T^*)$:

- $f^*, f_*$ from the four predicate generators' base-change ([predication fiber functor](../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/references/predication-fiber-functor.md), [Beck–Chevalley on predication bilattices](../../theorems/beck-chevalley-commutation-on-predication-bilattices.md));
- $f_!, f^!$ from the [direct/inverse image package](../../../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-sheaf-direct-inverse-image.md);
- $\otimes, \mathcal{H}om$ from the [closed-monoidal structure on Q-enriched sheaves](../../../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-sheaf-closed-monoidal-structure.md);
- Verdier $\mathbb D$ from the [Verdier duality theorem](../../theorems/verdier-duality-bitopological-site.md);
- the four standard axioms (closed-monoidal compatibility, projection formula, Beck–Chevalley exchange, Verdier exchange) at corpus-rigor draft level.

The closure 2-monad is the *algebra side* of this formalism: it is the lax-idempotent monad that lands on the fixed-points of the cohomological closure operator, which are exactly the sheaves whose stalk-wise valuation is closed under the rule system. In the Stone-dual picture the [dualized closure 2-comonad](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/dualized-closure-2-comonad.md) deflates the spectrum to its closed sub-Priestley-space — "algebra grows; spectrum shrinks." This is *exactly* the algebra-side / spectrum-side picture of a Grothendieck six-functor formalism, with closure playing the role of the localization at the "settled" sheaves. The [closure-fixed-points–Priestley correspondence](../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/closure-operator/references/closure-fixed-points-priestley-correspondence.md) is the Stone-duality witnessing the localization.

What the corpus has not done is say it this way, and the proposal here is a research bet rather than a discovered theorem: the corpus's pieces *look like* the data of a six-functor formalism, but the closed-monoidal compatibility, projection formula, Beck–Chevalley exchange, and Verdier exchange are at draft level individually and have not been verified to assemble coherently as a Grothendieck-style formalism (in any of the published senses — [@khan2021], [@scholze-ck], etc.). The benefit of saying it this way is that the [six-functor question](../../learning/questions/six-functor-formalism-for-settling-cohomology.md) — currently posed as "does this six-functor formalism exist?" — sharpens to "is the closure-localization of $\mathrm{Sh}^{\mathrm{Q}}(\mathbf T^*)$ a Grothendieck six-functor formalism in a published sense?", and the per-axiom verifications become specific localization-compatibility checks against a fixed external standard. The deformation theory, currently developed on top of the moduli stack as an Ext-classification, becomes deformation theory of a six-functor formalism — for which there is published machinery in the algebraic-geometry literature.

## Reading 4 — the d-frame is the $\mathbb Z/2$-equivariance of the underlying frame

The [d-frame](../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/d-frame.md) presents itself as a paired structure $(L_+, L_-, \mathrm{con}, \mathrm{tot})$. The bilattice negation $\sim$ swaps the two components; this is the [internal $\mathbb Z/2$-gauge](../../teaching/explanations/internal-z2-gauge.md). Combined with the spatial Verdier duality on $\mathbf T^*$, the [Verdier-duality opener](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/verdier-duality-opener.md) records "two dualities composing": pure $\top$-firings are self-dual; truth-only and falsity-only firings exchange.

This is structurally the action of the cyclic group $\mathbb Z/2$ on the moduli stack, with the d-frame Verdier composition as the equivariance datum. The right object is not "d-frame-valued sheaves on $\mathbf T^*$" but "$\mathbb Z/2$-equivariant Q-enriched sheaves on $\mathbf T^*$," with $\mathbb Z/2$ acting by the simultaneous gauge-swap on values and Verdier-swap on the site. Pure $\top$-firings are the fixed locus; truth-only / falsity-only firings are the free locus. The bilattice value category $\mathbf{dFrm}$ is then *not* a primitive — it is the $\mathbb Z/2$-equivariant version of a single frame. The chapter's parallel "consistency / totality" structure is the equivariance datum.

This is unforced: nothing in the corpus's machinery requires $\mathbb Z/2$ specifically. A dihedral or Klein-four equivariant version would be a generalization to multi-valued evidence types — *told true / told false / told retracted / told both*, with a Klein-four group permuting them. The corpus has chosen $\mathbb Z/2$ because the [@belnap1977] four-valued setting is what motivated the theory; a more generally-formulated chapter would record this as a choice and let the equivariance group be a parameter. The [paraconsistent-variants opener](paraconsistent-variants-opener.md) is in some sense doing this already, but at the value-category level rather than at the equivariance-group level.

## Reading 5 — the meta-moduli is the moduli of presentations of $\mathscr M$

The [meta-moduli prestack](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/meta-moduli-prestack.md) classifies closure-rule systems modulo closure-equivalence; the [realizability map](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/meta-realizability-map.md) sends each rule system to its associated settling moduli. On the structural reading, this is the moduli of *presentations* of objects in the moduli of objects — the Lindenbaum–Tarski move at the moduli level. The right name for it is the *stack of presentations of $\mathscr M$*.

The realizability map's essential image is what the [realizability program](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/realizability-program.md) is searching for — which sheaf-cohomology classes are actually realised by some closure-rule system over each base. This is structurally the statement: which $H^1$-classes are *presentable* by a finite or countable set of equational axioms. There is a published sense of this question in algebraic logic — *recursive presentability* of an equational theory — and the corpus's realizability program is a cohomologically-graded refinement.

Naming this exposes a missing level: the chapter should have a *paired tower*

$$\mathscr M^{\mathrm{meta}} \;\xrightarrow{\;\mathrm{realize}\;}\; \mathscr M \;\xrightarrow{\;H^1\;}\; \mathscr B G$$

where $\mathscr B G$ is the classifying stack of the relevant cohomology coefficient (an abelian group in the $\mathbf{Ab}$ shadow, a d-frame in the d-frame setting), and the composite is the cohomological invariant of a rule system. The [combined cohomology classifying morphism](../../morphisms/combined-cohomology-classifying-morphism.md) is the second arrow; the realizability map is the first. The chapter does not yet present them as a single sequence.

## What is formal, what is substantive

A Grothendieck reading exposes which results are formal — true for any six-functor formalism on a stratified Q-enriched topos with a lax-idempotent closure ∞-monad — and which are substantive content particular to the corpus.

**Formal:**
- The 1-stack property of the moduli ([settling-moduli-stack-theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-moduli-stack-theorem.md)) is descent of equational algebras along a subcanonical topology — the Vistoli proof recapitulates the standard sheaf-of-algebras descent.
- High-degree cohomological vanishing ([higher-degree vanishing theorem](../../../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-cohomology-higher-degree-vanishing.md)) is the standard cellular-dimension argument plus base cohomological dimension — once the site is recognized as cellular-fibered with finite cohomological dimension, vanishing above degree 1 is automatic, regardless of value category.
- Boolean-heart agreement of $\mathbb F_3$ and $\mathbb F_4$ ([Boolean derived cohomology agreement](../../theorems/q-enriched-derived-cohomology-boolean-d-frame.md)) is the t-structure-uniqueness statement for active ∞-categories with Boolean heart.
- $\mathbb F_4$-vanishing-transfer is t-structure compatibility.
- The 1-truncation of the moduli ([settling-automorphism 1-truncation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-automorphism-1-truncation.md)) follows from the fibers being thin posets (predication fiber algebras are bounded distributive lattices); thinness ⇒ no 2-cells.

**Substantive content particular to predication-categories:**
- The closure 2-monad's KZ-lax-idempotence — that the rule-driven inflation is genuinely a lax-idempotent operation, not a strict idempotent. This is the corpus's structural claim about *what predication is*.
- The aperiodic-regime classification ([aperiodic-regime classification](../../../../aperiodic-settling/references/aperiodic-regime-classification.md)) — that aperiodic settlings over a common base are MLD-classified by a $H^1$-invariant via firing-ordinal combinatorics. This is content about $\omega_1$-cofinal closure dynamics specifically.
- The non-Boolean F3↔F4 disagreement (Lemma D1) — that on non-Boolean d-frames, the parallel-pair and weighted-meet kernels genuinely differ. This is content about the d-frame's two-sided structure, not derivable from generic Q-enrichment.
- The two-dualities-composing structure of the d-frame Verdier — that the value-category gauge swap and the spatial Verdier swap interact. This is content about the $\mathbb Z/2$-equivariant structure.
- Beck–Chevalley uniformly across the four predicate generators — that the cellwise structure of the predication fiber algebras makes BC automatic. This is content about the four-generator presentation of $\mathcal C$.

The split has practical consequences. Effort spent on the formal content is effort spent re-proving things that follow from the right framework choice; effort spent on the substantive content is effort spent on the corpus's actual mathematical contribution.

## What this reading proposes the chapter should do

Six concrete reorganizations follow.

**(R1) Promote the single object.** Add an `objects/` file `predication-stack.md` defining $\mathrm{Sh}^{\mathrm{Q}}_\infty(\mathbf T^*; \mathbf{dFrm})$ as a single object — the chapter's central entity — and refer to the four-framework apparatus as four presentations of it. The current $\mathbf{CohFr}$ is then the 2-category of *presentations*, not the 2-category of *frameworks*; rename accordingly.

**(R2) Rename the F3↔F4 disagreement as a t-structure split.** Lemma D1 is currently presented as evidence that "F3 and F4 are different cohomology theories." The reading here is that they are different t-structures on the same derived ∞-category. Reframe [framework-3-4-disagreement](../../theorems/framework-3-4-disagreement.md) accordingly; rewrite the [Boolean derived cohomology agreement](../../theorems/q-enriched-derived-cohomology-boolean-d-frame.md) as the standard agreement-of-t-structures-in-Boolean-heart fact.

**(R3) Read the four regimes as a recollement filtration.** The [regime-decomposition](../../theorems/regime-decomposition.md) is currently a set-theoretic stratification. Recast as a length-three filtration by closed substacks, with the strict / Scott-continuous / transfinite-bounded / aperiodic strata as the successive open complements. The [non-semicontinuity result](../../theorems/regime-stratification-non-semicontinuity.md) becomes the statement that this is an underived recollement; the derived recollement is the natural object.

**(R4) Name the closure 2-monad as the algebra side of a six-functor formalism.** Rewrite the [six-functor question](../../learning/questions/six-functor-formalism-for-settling-cohomology.md) as: is the closure-localization of $\mathrm{Sh}^{\mathrm{Q}}_\infty$ a Grothendieck six-functor formalism? This collapses the per-axiom checks into a single localization-compatibility question.

**(R5) Recognise $\mathbf{dFrm}$ as the $\mathbb Z/2$-equivariant version of a frame.** Add a narrative explicitly recording this; let the equivariance group be a parameter for downstream paraconsistent-variant work.

**(R6) Promote the meta-moduli to a paired tower.** Present $\mathscr M^{\mathrm{meta}} \to \mathscr M \to \mathscr B G$ as the chapter's complete classifying sequence; the realizability program is the determination of the essential image of the first arrow refined by the second.

None of these reorganizations *change* the mathematics. They change the chapter's *story*. The story currently being told is "predication-categories has four cohomological frameworks, four regimes, and two parallel classifying invariants on a 2-stack of settlings." The story this reading proposes is "predication-categories is a stratified Q-enriched six-functor formalism whose moduli stack admits a recollement by closure-ordinal cofinality, with two t-structures and a $\mathbb Z/2$-equivariance recording the chapter's heart-choice and value-gauge respectively." The latter is shorter, cleaner, and locates the chapter in the published derived-algebraic-geometry / six-functor literature where its open questions become well-defined and its formal content becomes inheritable.

## What this reading does not claim

It does not claim the corpus is *wrong* in its current presentation. The four-framework / four-regime / paired-classifying-invariant presentation is correct; it just is not what the underlying object structurally *is*. A chapter that takes the structural reframing seriously would write the same theorems but house them in a different organization.

It does not claim that the higher-categorical lift is required to make the reframing work. Most of the reframing happens at the 2-categorical level the corpus already inhabits: the t-structure reading of F3/F4 specializes to a coboundary-convention reading; the recollement reading specializes to a successive-quotient stratification of the 2-stack; the six-functor reading specializes to a closure-localized 2-categorical formalism. The full derived ∞-categorical version would be cleanest but is not the prerequisite.

It does not claim the [strong-MLD theorem](../../theorems/strong-mld-via-composed-duality.md) or the [aperiodic-regime classification](../../../../aperiodic-settling/references/aperiodic-regime-classification.md) are downgraded by the reframing. They are exactly the substantive content that survives — content about the lax-idempotent closure dynamics on the aperiodic stratum, which is the corpus's *contribution* to the broader landscape of Q-enriched sheaf theory.

What the reading does claim is that the chapter is currently spending effort on bookkeeping — typing four-framework comparisons, distinguishing four regimes, pairing two classifying invariants — that a more structural framing would absorb into definitions. Naming the underlying object, naming its t-structures, naming its strata, naming its equivariance, naming its six-functor formalism: each of these compresses several theorems into single statements and exposes which questions are open in a sense the published literature can engage with.

The corpus has built the right object. The question this narrative raises is whether the right object should be allowed to introduce itself.
