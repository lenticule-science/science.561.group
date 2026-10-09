---
type: narrative
status: current
discusses: [d-frame, d-frame-valued-sheaf, d-frame-cohomology-comparison, settling-cohomology, bigraded-settling-cohomology]
---

# The framework choice for d-frame cohomology

The [bilattice-valued cohomology chapter](bilattice-cohomology-opener.md) is open as a project: definitions in place ([d-frame](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/d-frame.md), [d-frame-valued sheaf](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/d-frame-valued-sheaf/d-frame-valued-sheaf.md), [sheaf condition proved](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-valued-sheaf-condition.md)), section-level [comparison theorem](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-cohomology-comparison.md) proved. The next blocker is *what kind of cohomology theory* d-frame-valued sheaves get — what derived-functor framework supplies $H^n$ for $n \geq 1$ in the d-frame setting.

This isn't a minor technical choice. The framework determines:

- Which existing $\mathbf{Ab}$-valued results transport cleanly via the shadow.
- Whether the d-frame setting yields invariants beyond the shadow.
- Whether the [vanishing above degree 1](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-cohomology-vanishes-above-degree-1.md) result lifts.
- How [deformation theory](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/deformation-theory-of-skhs.md), [six-functor formalism](../../learning/questions/six-functor-formalism-for-settling-cohomology.md), and [Verdier duality](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/verdier-duality-on-bitopological-site.md) develop on the d-frame side.

This narrative records the survey of options, the literature each rests on, and the recommended choice.

## What's actually in the literature

A focused survey of homological algebra for d-frames and adjacent structures:

**1. d-frames don't have a published cohomology.** Jakl's d-frame thesis ([@jakl2018]) is exhaustive on duality, free constructions, Vietoris functors, stably compact spaces, and Belnap–Dunn logic — but contains no homological algebra. No sheaf cohomology, no derived functors, no module theory. Jakl 2025 ([@jakl2025]) connects d-frames to linear logic via twist-product representation but doesn't develop cohomology either. **The d-frame literature is duality-focused, not cohomology-focused.** This is the major surprise of the survey: the natural framework "d-modules with Jakl's homological infrastructure" doesn't exist.

**2. Standard locale cohomology is well-developed.** Joyal–Tierney's localic-topos framework, Borceux's locale theory, and the Stacks-Project's sheaf-cohomology presentation give complete homological algebra for $\mathbf{Ab}$-valued sheaves on a locale. This is the framework underlying predication categories' existing cohomology. It does *not* extend natively to d-frames — locale cohomology is single-frame; d-frames have two frames plus relations.

**3. Cellular sheaf cohomology is well-developed (Curry, Shepard).** Curry's thesis ([@curry2014]) builds cellular sheaves and cosheaves on regular CW complexes with a complete derived equivalence (cellular sheaf ↔ cellular cosheaf), recovering Verdier duality (after [@shepard1985]). The framework is concrete and computational — discrete Morse theory gives explicit cohomology computation. Limitation: cellular structure is required; predication categories' bitopological settling site is fiber-cellular (paired Priestley fibers) but not globally cellular.

**4. Spectral sheaf theory provides a vector-space-valued precursor.** Hansen–Ghrist ([@hansen-ghrist2019]) develops a Hodge Laplacian on cellular sheaves of vector spaces, lifting graph-Laplacian spectral theory to sheaves. This is the abelian (vector-space) version of what's coming next.

**5. Ghrist–Riess (2022) gives non-abelian cohomology for lattice-valued cellular sheaves.** [@ghrist-riess2022] *initiates* a discrete Hodge theory for cellular sheaves taking values in a category of **lattices and Galois connections**. The technical heart is the **Tarski Laplacian** — an endomorphism on the cochain complex whose fixed points yield a cohomology that agrees with the global section functor in degree zero. Tarski's fixed-point theorem guarantees convergence of the diffusion process.

**6. Ghrist–Lopez–North–Riess (2025) generalizes to quantale-enriched cellular sheaves.** [@ghrist-et-al2025] develops the **Lawvere Laplacian** — an endofunctor on the cochain complex of cellular sheaves enriched in a commutative unital quantale, with the **Tarski–Lawvere Fixed Point Theorem** showing that suffix and prefix points form complete weighted lattices. **Frames are quantales** (with multiplication = meet), so this strictly generalizes [@ghrist-riess2022] and is the natural framework candidate for d-frame-valued sheaves. The paper explicitly identifies extensions to "arbitrary base spaces including simplicial sets" and to quantaloid-enriched categories as future directions — placing the cellular extension we need on the field's potential frontier.

**7. General non-abelian cohomology in $(\infty,1)$-topoi.** The nLab framework gives a maximally-general non-abelian cohomology via $\mathrm{Hom}$-spaces in $(\infty,1)$-topoi. Conceptually clean but heavy machinery, and not specialized to lattice-valued data.

## The candidates

From the literature survey, four viable framework candidates surface:

**Candidate A: Cohomology-via-shadow.** Define d-frame-valued cohomology by-fiat as $H^n(\mathbb{F}) := H^n(\mathbb{S}(\mathbb{F}))$ where $\mathbb{S}$ is the [shadow functor](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-cohomology-comparison.md) extracting the pair of $\mathbf{Ab}$-valued sheaves. The consistency and totality relations are tracked alongside but not as cohomological invariants in their own right.

- *Pros:* Simple, computable, builds on existing $\mathbf{Ab}$-valued cohomology with no new machinery.
- *Cons:* Misses the structural-faithfulness goal — the cohomology *is* the abelianized cohomology, just packaged with extra relational data. Doesn't deliver invariants the bigraded refinement can't already give.
- *Status:* Acceptable as scaffolding; not the destination.

**Candidate B: Tarski-Laplacian framework on cellular d-frame-valued sheaves (Ghrist–Riess style).** Treat d-frame-valued sheaves as cellular sheaves valued in the lattice-and-Galois category, where the d-frame's pair structure is one specific shape of lattice-with-Galois-connections data. Apply [@ghrist-riess2022]'s Tarski Laplacian to get cohomology via fixed points.

- *Pros:* Direct published precedent. Native non-abelian setup. Aligns naturally with predication categories' existing Tarski / KZ structure (the [closure 2-monad](../../morphisms/closure-2-monad.md) is lax-idempotent — Tarski-style fixed points are everywhere already). Gives genuinely new invariants beyond the shadow.
- *Cons:* Requires cellular structure on the site. The bitopological settling site is fiber-cellular (paired Priestley fibers are cellular for finite distributive bilattices) but not globally cellular. Extending the Tarski Laplacian framework from cell complexes to fibered or stratified-cellular sites is itself open work.
- *Status:* The most promising candidate for the long-term direction, with the cellular-extension question as a sub-problem.

**Candidate C: d-modules with newly-developed homological algebra.** Define modules over a d-frame (pairs of frame-modules with consistency/totality compatibility), identify an abelian category structure on $\mathbf{dMod}$, and run standard derived-functor cohomology in this category.

- *Pros:* Gives a true abelian-category-based framework. Standard machinery applies.
- *Cons:* No published precedent. Substantial new homological algebra development required. Multi-session research, possibly multi-paper.
- *Status:* Plausible but high cost. Reserved as an alternative if Candidate B's cellular-extension work proves intractable.

**Candidate D: $(\infty, 1)$-topos-theoretic cohomology.** Embed d-frame-valued sheaves in an $(\infty, 1)$-topos and use the maximally-general non-abelian-cohomology framework.

- *Pros:* Most general; cleanly connects to higher-categorical structure.
- *Cons:* Heaviest machinery. Loses the concrete computational character that finite-cellular methods have. Connects to the [higher-categorical extensions question](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/higher-categorical-extensions.md) but that question is itself substantial.
- *Status:* Interesting long-term direction, deferred until the lower-machinery candidates are exhausted.

## Recommendation

**Adopt Candidate B (Tarski / Lawvere Laplacian on cellular d-frame-valued sheaves) as the operational framework, with Candidate A (cohomology-via-shadow) as the near-term scaffold for cases where the cellular extension isn't yet available.** Specifically: the Lawvere Laplacian ([@ghrist-et-al2025]) is the right framework, with the Tarski Laplacian ([@ghrist-riess2022]) as its specialization to non-enriched lattice values.

Reasoning:

1. **Direct precedent.** [@ghrist-riess2022] is the only published framework for non-abelian sheaf cohomology specialized to lattice-valued data. The d-frame setting fits naturally — d-frames are paired-frame-with-relations structures; frames are special lattices; frame morphisms involve Galois connections. We're applying a published framework, not inventing one.

2. **Structural resonance with the corpus.** The corpus's [closure 2-monad](../../morphisms/closure-2-monad.md) is KZ lax-idempotent — Tarski-style fixed points are already the technical core of the program. The Tarski Laplacian extends this fixed-point structure to cohomology. This is not coincidence: predication categories' order-theoretic foundations are exactly the structure the Tarski Laplacian framework requires.

3. **Genuine non-abelian invariants.** Unlike the shadow framework, the Tarski Laplacian gives invariants the bigraded $\mathbf{Ab}$-valued cohomology can't see — specifically, the consistency and totality structure feeds into the Laplacian definition itself, so it appears in $H^n$, not just alongside.

4. **Workable in the finite case.** For strict-regime and Scott-continuous-regime settlings (where the closure ordinal is finite or $\omega$), the bitopological settling site reduces to a cell complex, and Ghrist–Riess applies directly. Concrete $H^n$-computation is available immediately for these cases.

5. **Identifies the substantive open problem precisely.** The cellular-extension to transfinite-bounded and aperiodic regimes (where the site has $\omega_1$-scale fiber structure) is the genuine new homological algebra needed. This is well-defined research, not vague speculation: extend the Tarski Laplacian framework from regular CW complexes to fibered cellular sites with transfinite limits.

The fallback to Candidate A in cases where cellular structure isn't yet established lets the chapter develop continuously — every result has at least the shadow-cohomology meaning, and as the cellular framework extends, results acquire native d-frame meaning.

## What this means for the chapter's open theorems

Three theorems pending:

**Comparison theorem (section-level proved; derived-functor-level pending).** The section-level part holds independent of framework choice. The derived-functor-level statement under Candidate B becomes: *the shadow $\mathbb{S}$ commutes with the Tarski-Laplacian cohomology in finite-regime cases (where the framework applies directly), and conjecturally extends to transfinite cases via the cellular-extension work*. This is now precisely statable.

**Vanishing-above-degree-1 in the d-frame setting.** Under Candidate B, this becomes: *does the Tarski Laplacian on the d-frame-valued cellular sheaf $\mathbb{F}_U$ have only degree-0 fixed points beyond a threshold?* The answer is regime-specific:
- Strict regime: $H^1 = 0$ is expected (predication categories' $\mathbf{Ab}$-valued vanishing applies; Tarski Laplacian shadow recovers it).
- Scott-continuous regime: same.
- Transfinite-bounded and aperiodic regimes: open, depending on whether the cellular extension preserves the fiber-Boolean-dimension axis of the existing 3-axis vanishing argument.

**Cellular extension of the Tarski / Lawvere Laplacian.** The substantive new theorem the chapter needs: extend the [@ghrist-riess2022] / [@ghrist-et-al2025] framework from regular CW complexes (Tarski Laplacian) and graphs (Lawvere Laplacian) to **fibered Grothendieck sites with cellular fibers**, including the transfinite case for aperiodic-regime settlings. Status: active research problem with concrete entry points; the substantive extension plan is laid out in the [cellular extension plan narrative](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/cellular-extension-plan.md).

## Position relative to the exceptional higher cohomology question

The exceptional-$H^{\geq 2}$ question asks whether any natural sheaf has non-trivial $H^{\geq 2}$. The candidates flagged there were "non-standard sheaves" and "higher-order morphisms." Under Candidate B, the d-frame-valued sheaf $\mathbb{F}_U$ is precisely a "non-standard sheaf" candidate: its Tarski Laplacian cohomology may or may not vanish above degree 1, depending on the cellular-extension work. So the bilattice-valued cohomology project is substantively connected to the exceptional-$H^{\geq 2}$ question — if d-frame cohomology has non-trivial $H^{\geq 2}$, the exceptional question is answered affirmatively for the natural d-frame-shadow case.

## Three structural pieces filled in

Three theorems extend the framework's scope concretely:

- **D-frame H¹-generator construction.** The [d-frame H¹-generator at NSC firing theorem](../../theorems/d-frame-h1-generator-at-nsc-firing.md) centralizes the construction of the d-frame generator $D_\mu$ at each non-Scott-continuous firing — previously scattered across the regime-cohomology theorems. The construction handles three cases by the firing's bilattice value (truth-only, falsity-only, $\top$-firing); downstream theorems (transfinite-bounded, aperiodic, d-frame Verdier composition, strong-MLD) cite this directly rather than reproducing the case analysis.

- **Two-dualities composing.** The [d-frame Verdier composition theorem](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-verdier-composition.md) gives the chapter's distinctive cohomology contribution beyond Curry's classical cellular Verdier: spatial Verdier composes with the unconditional value-category swap (bilattice negation) to give a richer composed duality $\mathbb D = \mathbb D_{\mathrm{sp}} \circ \mathbb D_{\mathrm{val}}$. The composition exposes a classification of d-frame-valued sheaves into self-dual (paraconsistent / $\top$-only firings) vs exchange-paired (truth-only ↔ falsity-only) orbits, which the bigraded refinement and standard $\mathbf{Ab}$-Verdier cannot see.

- **Higher-arity scaling.** The [higher-arity cohomological rank theorem](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/higher-arity-cohomological-rank.md) gives the cohomological scaling law for $n$-ary settlings: arity-collapse for projection-only closures (rank stays at the binary value), arity-amplification for genuine $n$-ary joins (rank scales as $k^n$). This refines the "what's new at higher arity?" question concretely — higher arity is cohomologically novel iff the closure rule uses genuine $n$-ary joins.

## Summary

The framework choice is a judgment under uncertainty: the d-frame literature has no published cohomology, the natural extension (Tarski Laplacian via Ghrist–Riess) requires cellular-structure work that isn't fully published, and the alternative options (d-modules, $(\infty,1)$-cohomology) cost more for less direct connection.

The recommendation: **Tarski Laplacian via Ghrist–Riess as the operational framework**, with shadow-cohomology as scaffolding. The substantive open work — the cellular extension of the Tarski Laplacian to fibered transfinite sites — is identified as a specific research problem with a clear entry point in the literature.

This is a research bet, not a settled foundation. But it's a well-supported research bet, with structural resonance to predication categories' existing machinery and direct precedent in the lattice-valued-sheaf-cohomology literature.
