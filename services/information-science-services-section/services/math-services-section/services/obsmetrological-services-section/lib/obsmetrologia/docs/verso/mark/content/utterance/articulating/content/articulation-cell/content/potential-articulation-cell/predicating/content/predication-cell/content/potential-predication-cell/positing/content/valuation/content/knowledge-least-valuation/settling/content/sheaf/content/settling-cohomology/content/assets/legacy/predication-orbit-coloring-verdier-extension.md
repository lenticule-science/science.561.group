---
type: theorem
status: sketch
depends-on:
  - verdier-duality-bitopological-site
  - jung-rivieccio-duality
  - predication-priestley-dual
  - bitopological-settling-site
  - orbit-coloring-generator
  - boundary-extended-predicate-category
  - relaxed-bilattice-homomorphism-classification
  - orbit-coloring-closure-2-monad-extension
  - paired-priestley-space
  - negation
see-also:
  - orbit-coloring-generator-structural-integration
---

# Orbit-coloring Verdier extension

The Priestley dual of an orbit-coloring generator is **not** a morphism in standard $\mathbf{PairedPriSp}$ — it requires enriching the target category by finitely many *absurd points* (one per painted orbit per fiber) and allowing maps to factor through them. With this finite enrichment, Verdier duality on the [bitopological settling site](../../../../../../bitopological-settling-site/bitopological-settling-site.md) extends to $\mathcal C^\beta$ — but conditionally on the closure-admissibility constraint from [sub-question 3](orbit-coloring-closure-2-monad-extension.md). The aperiodic-classification cohomology $H^1$ is unaffected (absurd points contribute only to $H^0$), and the six-functor formalism is not advanced by the boundary route.

## Statement

Let $(\mathbf L, \mathcal C, E)$ be base parameters, $\mathcal C^\beta$ the [boundary-extended predicate category](../objects/boundary-extended-predicate-category.md), and assume the chapter's [Verdier duality on the bitopological settling site](verdier-duality-bitopological-site.md) is established over $\mathcal C$. Then:

**(D1) Dual representation of orbit-coloring generators.** Standard [Jung-Rivieccio duality](../../../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/references/jung-rivieccio-duality.md) does not extend to relaxed bilattice homomorphisms. Each orbit-coloring generator $g$ in $\mathcal C^\beta$ has a Priestley dual in the enriched category $\mathbf{PairedPriSp}^\beta$ — paired Priestley spaces equipped with up to two designated *absurd points* per fiber (one per painted orbit), with morphisms allowed to factor through them. The dual $\hat g$ is a constant map to the orbit's absurd point on each painted orbit, and the chapter's Priestley-dual structure on each unpainted orbit.

**(D2) Conditional Verdier extension.** Provided the closure family $\mathrm{cl}$ satisfies the (C1)+(C2) admissibility conditions of [orbit-coloring closure 2-monad extension](orbit-coloring-closure-2-monad-extension.md), the bitopological settling site $(\mathbf T^*, J)$ extends to $(\mathbf T^{*,\beta}, J)$ over $\mathcal C^\beta$ by attaching the absurd points as degenerate $0$-cells in each fiber's paired-Priestley structure, and the three-layer Verdier duality proof extends through this enrichment. Layer 1 (sheafhood preservation), Layer 2 (Curry assembly), and Layer 3 (transfinite-cellular fibers) all pass through because the absurd points are degenerate cells with no boundary structure.

**(D3) Cohomology unchanged at $H^1$.** The absurd points contribute to $H^0(\mathbf T^{*,\beta}, J;\, F)$ as constant local sections valued at the painted value ($\top$ or $\bot$), but contribute nothing to $H^1(\mathbf T^{*,\beta}, J;\, F)$. The aperiodic-classification invariant and its co-classification dual under Verdier exchange are therefore preserved unchanged from the chapter.

**(D4) Self-duality of absurd points under composed duality.** The painted values $\top, \bot \in \mathbf{FOUR}$ are negation-fixed ($\neg \top = \top$, $\neg \bot = \bot$). Absurd points are therefore self-dual fixed points of the value-category gauge $L_+ \leftrightarrow L_-$, and trivially self-dual under the spatial sheaf-cosheaf exchange. They join the chapter's classification of $\top$-firings as self-dual fixed points of the composed d-frame Verdier duality.

**(D5) Six-functor formalism not advanced.** The boundary route adds finite degenerate-cell content but does not address the derived-structure refinements (full $(\otimes, \mathrm{Hom}, f^*, f_*, f^!, f_!)$ package, non-Boolean value categories, chain-complex-level derived enhancement) listed as open in [Verdier duality on the bitopological settling site](verdier-duality-bitopological-site.md). These remain open via their existing chapter framings, not closed or advanced via the boundary.

## Proof

### (D1) Failure of standard Jung-Rivieccio and the absurd-point enrichment

Standard [Jung-Rivieccio duality](../../../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/references/jung-rivieccio-duality.md) is the contravariant equivalence $\mathbf{DBiLat}^\mathrm{op} \simeq \mathbf{PairedPriSp}$, derived from classical Priestley duality $\mathbf{DLat}^\mathrm{op} \simeq \mathbf{PriSp}$. The morphism side requires preservation of $\bot$ and $\top$ — a constant lattice homomorphism is not a $\mathbf{DLat}$-morphism unless its codomain is trivial.

The orbit-coloring generators of [relaxed bilattice homomorphism classification](relaxed-bilattice-homomorphism-classification.md) explicitly drop $\bot$-preservation. Constant-$\top$ painting $\eta_\top : A_q \to A_p$ maps every $v \in A_q$ to $\top_{A_p}$, including $\eta_\top(\bot_{A_q}) = \top_{A_p} \neq \bot_{A_p}$. Pulling back along $\eta_\top$ on the Priestley side: for $x \in X_p = \mathrm{Spec}(A_p)$,

$$\hat\eta_\top(x)(a) = x(\eta_\top(a)) = x(\top_{A_p}) = 1$$

for every $a \in A_q$. The resulting "filter" $\hat\eta_\top(x) = A_q$ is not a prime filter (or, depending on convention, is the improper / maximal-trivial filter) — not a point of the standard Priestley space $X_q$.

The cleanest enrichment is to attach to each fiber Priestley space $X_q$ a set of designated *absurd points*, one per orbit that can be $\top$-painted (and dually $\bot$-painted, though the relaxed-classification's painted values for orbit-coloring generators are $\{\bot, \top\}$ within the $\le_k$-bound classification, so up to four distinct absurd-point types per fiber: $\Delta$-$\top$, $\Delta$-$\bot$, $\Delta^c$-$\top$, $\Delta^c$-$\bot$). The dual $\hat\eta$ of a constant-orbit-painting hom factors through the corresponding absurd point. Mixed orbit-coloring generators dual to maps that factor through one absurd point on the painted orbit and act as the chapter's standard Priestley dual on the unpainted orbit.

The category $\mathbf{PairedPriSp}^\beta$ is the enrichment of $\mathbf{PairedPriSp}$ by these absurd points and the partial/collapsing maps that target them. The contravariant equivalence

$$(\mathbf{DBiLat}_\mathrm{relaxed})^\mathrm{op} \simeq \mathbf{PairedPriSp}^\beta$$

is the natural extension of Jung-Rivieccio to the relaxed setting. This equivalence is finite enrichment: the absurd-point set per fiber has cardinality at most 4 (independent of $|E|$, $|\mathbf L|$, etc.), and no Stone-Čech compactification is involved.

### (D2) Verdier extension under closure admissibility

The bitopological settling site $(\mathbf T^*, J)$ has objects $(q, \tau, U)$ with $q \in \mathcal C$, $\tau$ an ordinal $< \lambda$, and $U$ a pairwise-Stone clopen in $X_q^\tau$. Extending to $\mathcal C^\beta$ requires:

- **Object extension.** The new objects $(q, \tau, U)$ with $q \in \mathcal C^\beta \setminus \mathcal C$ contribute fibers $X_q^\tau$ with the absurd points attached. Pairwise-Stone clopens on the absurd-point-enriched space are well-defined (the absurd points are isolated, so any subset including or excluding them is clopen).

- **Morphism extension.** New morphisms $(f, h, j)$ with $f$ an orbit-coloring generator. By (D1), $\hat f$ factors through absurd points — the morphism $(f, h, j)$ in the enriched site dualizes accordingly.

- **Topology extension.** Cover families remain fiber-only pairwise-Stone refinements at fixed $(q, \tau)$. The enriched fibers admit the same cover structure plus trivial covers including absurd points (each absurd point is a single-point clopen, generating its own degenerate cover sieve).

For this enrichment to inherit Verdier duality, the underlying [closure 2-monad](../morphisms/closure-2-monad.md) must extend to $\mathcal C^\beta$ — which by [orbit-coloring closure 2-monad extension](orbit-coloring-closure-2-monad-extension.md) requires (C1) boundary stability and (C2) orbit decomposability. Without (C1)+(C2), the dualized closure 2-comonad on which the bitopological site is built does not extend, and Verdier duality has no underlying structure to dualize.

Assume (C1)+(C2) hold. Then the three Verdier layers extend:

**Layer 1 — sheafhood preservation.** The Lawvere Laplacian on Grothendieck sites preserves sheafhood at any cover cardinality. Adding finitely many absurd points per fiber adds finitely many degenerate cover sieves but does not change the cardinality bounds in Layer 1's hypothesis. Sheafhood preservation extends.

**Layer 2 — Q-enriched Curry equivalence on Grothendieck sites with cellular fibers.** The chapter's Layer 2 covers fibered cellular sites with fiber-only covers. The absurd-point enrichment adds 0-dimensional cells (the absurd points themselves) with no boundary attaching maps to higher cells. Curry's framework explicitly handles arbitrary cellular complexes including degenerate ones; the contribution of a 0-cell with no boundary is a trivial direct summand to local sections at that cell. The per-fiber Curry equivalence extends; assembly on the Grothendieck site extends accordingly.

**Layer 3 — transfinite cellular fibers.** Adding finitely many degenerate cells per fiber does not change the transfinite-colimit structure. The directed-colimit assembly on $\omega_1$-cofinal cellular fibers extends without modification.

So Verdier duality on $(\mathbf T^{*,\beta}, J)$ holds, with derived equivalence

$$\mathrm{Sh}_{\mathsf Q}(\mathbf T^{*,\beta}, J) \simeq \mathrm{coSh}_{\mathsf Q}(\mathbf T^{*,\beta}, J).$$

### (D3) Absurd points contribute only to $H^0$

A 0-cell with no boundary attaching maps contributes a direct summand to local sections (degree 0) and contributes zero to higher cohomology (no coboundary to/from it). Symmetrically on the cosheaf side. So absurd points contribute to $H^0$ and $H_0$ but not to $H^1$ or higher.

The chapter's aperiodic-classification invariant $\mathrm{cl}\text{-}\mathrm{inv}(v) \in H^1$ and its Verdier-dual co-invariant $\check{\mathrm{cl}\text{-}\mathrm{inv}}(v) \in H_1$ are therefore unchanged by the boundary extension. The MLD-classification of aperiodic settlings via Verdier duality is preserved exactly.

### (D4) Self-duality of absurd points under composed duality

In $\mathbf{FOUR} = \mathbf 2^\bowtie$, bilattice negation $\neg : \langle a, b\rangle \mapsto \langle b, a\rangle$ acts as: $\neg \mathbf t = \mathbf f$, $\neg \mathbf f = \mathbf t$, $\neg \bot = \bot$, $\neg \top = \top$. The painted values for orbit-coloring generators are $\bot$ and $\top$ — both negation-fixed.

The chapter's [d-frame specialization of Verdier duality](verdier-duality-bitopological-site.md#d-frame-specialization-two-dualities-composing) has two dualities composing: (i) spatial sheaf-cosheaf exchange, (ii) value-category negation gauge $L_+ \leftrightarrow L_-$.

Absurd points represent constant-$\top$ or constant-$\bot$ painting. Under the value-category gauge: painted value is fixed by $\neg$, so absurd point is fixed. Under the spatial duality: a 0-cell with no boundary maps is fixed by sheaf-cosheaf exchange (its degree-0 contribution to sheaf cohomology equals its degree-0 contribution to cosheaf homology). So absurd points are doubly self-dual.

The chapter's framing of $\top$-firings as "self-dual fixed points of the composed duality" extends to absurd points without modification — they are the constant-painting analogues of pure $\top$-firings.

### (D5) Six-functor formalism

The chapter's open six-functor question concerns extending Verdier $\mathbb D$ to the full $(\otimes, \mathrm{Hom}, f^*, f_*, f^!, f_!)$ package on settling cohomology. The obstacles are derived-structure refinements at the chain-complex level and value-category generality (non-Boolean enrichments).

The boundary extension adds finite degenerate-cell content. None of the six-functor obstacles is addressed by adding finite content — the missing structure is in the *derived* direction, not the *spatial-finite-enrichment* direction. So the six-functor question is neither closed nor advanced by orbit-coloring generators. It remains open via its existing chapter framing. $\square$

## Reading

The Verdier extension is *conditional and structurally mild*. Conditional, because it requires the closure-admissibility constraint (C1)+(C2) from sub-question 3 — and many of the chapter's natural closures fail those conditions, in which case the bitopological site doesn't extend at all and the Verdier question doesn't arise. Mild, because when it does extend, the addition is finite (at most four absurd points per fiber) and degenerate (0-cells with no boundary structure), contributing nothing to $H^1$ or higher.

The honest distillation: orbit-coloring generators do **not** generate new cohomological content. Their Priestley dual contribution is an "edge case" in the dual representation — visible at $H^0$ as constant local sections, invisible at $H^1$. The aperiodic-classification framework is unchanged.

There is a small but real conceptual gain: the relaxed Jung-Rivieccio enrichment $(\mathbf{DBiLat}_\mathrm{relaxed})^\mathrm{op} \simeq \mathbf{PairedPriSp}^\beta$ formalizes how relaxed bilattice morphisms dualize. This generalization is independently interesting (it makes Jung-Rivieccio robust to dropping $\bot$-preservation) and may be useful in adjacent settings.

**Comparison with sub-question 3.** Where the closure 2-monad extension forces a real selection condition on closures (sub-question 3 was the "pattern broken" point), the Verdier extension is *piggyback*: it inherits the closure constraint from sub-question 3 without adding new constraints of its own beyond the mild Jung-Rivieccio enrichment. The structural action lives at the closure level, not at the Verdier level.

**The question's prediction.** The question text predicted: "the dual of an orbit-coloring generator $\eta_\top^O$ should be a paired-Priestley morphism that *collapses* to a single point — the $\top$-cell — on the dual of orbit $O$. This is a single-point morphism, not a boundary stratum; it adds a finite, concrete extension to the bitopological settling site rather than a Stone-Čech compactification."

This prediction is **structurally correct** and the present theorem makes it precise: the absurd point is the "$\top$-cell" the question text envisioned, the enrichment is finite (at most four absurd points per fiber), and it is concrete (no Stone-Čech). The prediction missed the closure-admissibility caveat — the Verdier extension only happens when (C1)+(C2) hold, so the "passive enrichment" framing does not transfer here either.

## Position

This resolves [orbit-coloring generator structural integration](questions/orbit-coloring-generator-structural-integration.md) sub-question 4 with a *conditional yes*: Verdier duality extends to $\mathcal C^\beta$ as a finite enrichment of the bitopological settling site by absurd points, contingent on the closure satisfying sub-question 3's (C1)+(C2). The aperiodic classification at $H^1$ is unchanged, the six-functor question is unaffected, and the relaxed Jung-Rivieccio equivalence formalizes how relaxed bilattice morphisms dualize.

One sub-question remains: strong-MLD with orbit-colored firings. By the same logic as sub-questions 3 and 4, its resolution depends on whether the strong-MLD framework's underlying closures satisfy (C1)+(C2). Cannot be assumed.
