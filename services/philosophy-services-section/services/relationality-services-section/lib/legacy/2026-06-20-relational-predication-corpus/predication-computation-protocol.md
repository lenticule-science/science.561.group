---
type: narrative
status: current
discusses: [predication-settling, four-regime-dichotomy, settling-cohomology, d-frame-cohomology-comparison, verdier-duality-bitopological-site, strong-mld-via-composed-duality, anderson-putnam-direct-limit]
---

# Computation protocol for benchmark settlings

A canonical pipeline for computing predication categories' classification of any concrete settling. The corpus's theorem layer is now substantively complete: 142 proved theorems span the CHL apex tower, the cellular extension plan (Layers 1+2+3), the four-regime dichotomy across all levels, and the step-$n$ family of substitution-flavored aperiodic settlings. The remaining empirical question is whether the framework *computes things people care about* — and answering that requires running specific settlings through the framework, end to end, in a reproducible way.

This protocol locks the pipeline. Every benchmark conforms to the same eight-step template; every benchmark deliverable is a markdown report plus reproducible code; every benchmark is comparable to every other.

## The eight-step pipeline

For a settling $v$ specified by closure rule $\mathcal{S}$, increment sequence $U$, and base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$:

### 1. Specification

The specification is a frontmatter-style block stating $\mathcal{S}$, $U$, $B$ explicitly enough that the settling is reconstructible. For substitution-flavored settlings: substitution matrix $M$, alphabet, base ordinal. For epistemic settlings: Kripke frame, agent set, accessibility relations. For CRDT settlings: data type, operation set, replica configuration. The specification's purpose is *unambiguity*: two readers should construct the same settling from it.

### 2. Regime classification

Compute the closure ordinal $\kappa(v)$ and identify which of the [four regimes](../../theorems/four-regime-dichotomy.md) the settling falls into:

- $\kappa < \omega$: strict regime.
- $\kappa = \omega$: Scott-continuous regime.
- $\omega < \kappa < \omega_1$: transfinite-bounded regime.
- $\kappa \geq \omega_1$: aperiodic regime.

The regime classification determines which cohomology theorems apply and what the expected $H^1$ structure is.

### 3. $\mathbf{Ab}$-valued cohomology

Compute $H^0(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_v)$ and $H^1(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_v)$ with explicit generators. For substitution-flavored aperiodic settlings, this is a rank-$n$ direct limit per the [step-$n$ cohomological rank theorem](../../theorems/step-n-cohomological-rank-theorem.md) reducing to [Anderson-Putnam](../../objects/anderson-putnam-direct-limit.md). For other regimes, the [regime-specific cohomology theorems](../../theorems/aperiodic-regime-cohomology-via-direct-limit.md) give explicit forms.

The $\mathbf{Ab}$-valued cohomology is the *baseline* — what the settling's classification looks like before the bilattice / d-frame structure is added.

### 4. d-frame cohomology

Compute $H^1_{\mathbf{dFrm}}(\mathbf{T}^*_{\leq \kappa}, \mathbb{F}_v)$ via the per-firing $D_\mu$ generator construction:

- For each non-Scott-continuous firing ordinal $\mu \in L_{\mathrm{ns}}(\kappa)$, classify the firing as **truth-only**, **falsity-only**, or **$\top$** (per the [transfinite-bounded d-frame cohomology theorem](../../theorems/transfinite-bounded-regime-d-frame-cohomology.md)).
- Build the d-frame generator $D_\mu$ at each firing.
- Verify the [shadow comparison](../../theorems/d-frame-cohomology-comparison.md): $\mathbb{S}(H^1_{\mathbf{dFrm}}) = (H^1(\mathcal{F}^{(k)}_v),\, H^1(\mathcal{F}^{(k,-)}_v))$.

This is predication categories' *distinctive* content. The shadow comparison ensures the d-frame layer reduces correctly to the $\mathbf{Ab}$-valued result; the per-firing $D_\mu$ structure is the genuinely new content.

### 5. Verdier dual

Compute $H_1(\mathbf{T}^*_{\leq \kappa}, \check{\mathcal{F}}_v)$ on the cosheaf side and verify the [Verdier duality](../../theorems/verdier-duality-bitopological-site.md) $H^1 \cong H_1$. For Boolean d-frame data this is a strict isomorphism; otherwise it's $q$-fuzzy with quantale-graded error tracked.

### 6. Strong-MLD orbit type

Classify the settling's composed-duality orbit type per the [strong-MLD theorem](../../theorems/strong-mld-via-composed-duality.md):

- **Self-dual**: every firing is $\top$ — the settling is fixed under the composed Verdier × negation duality.
- **Truth-only / falsity-only orbit**: every firing is on one evidence side; the settling exchanges with its negation under $\mathbb{D}$.
- **Mixed**: firings of different types, more complex orbit structure.

This is the [d-frame Verdier composition](../../theorems/d-frame-verdier-composition.md)'s firing-pattern characterization applied to the specific settling.

### 7. Literature comparison

For every case where the literature has an established classification of the underlying mathematical structure, document agreement:

- Substitution settlings: agreement with Anderson-Putnam, Sadun, BDHS at the cohomological-rank level.
- Epistemic Kripke frames: agreement with MCMAS / DEMO-S5 at the epistemic level.
- CRDTs: agreement with the existing convergence-classification literature.

If the framework's classification *disagrees* with established literature, that's a flag — either an error, or a genuine refinement. Both outcomes are documentable results.

### 8. What's new

State explicitly, for this case:

- Which classification refinements the d-frame / strong-MLD structure produces *visibly* in this specific computation.
- Or, equivalently: confirm "in this case the d-frame structure adds nothing beyond the shadow."

The first outcome is predication categories' distinctive content showing up. The second is a negative result — also useful, since it identifies cases where the bilattice layer is decoration.

## Acceptance criteria

A benchmark counts as "done" iff all four hold:

1. **Reproducibility.** Code at `tools/<case-name>/compute.py` (or composed from the canonical tools) runs end-to-end producing the documented output. Anyone with sympy + predication categories' standard tools can verify.
2. **Triangulation.** At least two independent computations agree — by hand and by code; or by direct-limit and by Anderson-Putnam reduction; or by sheaf-side and cosheaf-side under Verdier; etc. Single-method computations are not accepted.
3. **Literature alignment.** Where the literature has an established answer (case 7), agreement is documented. Where the literature has no answer, this requirement is vacuous and noted as such.
4. **Distinctness or admission.** Step 8 is explicit, not hand-waved. Either: a specific generator / orbit type / classification refinement that the d-frame structure produces and the shadow loses, OR: a clear statement that the d-frame structure adds nothing in this case.

## Deliverables

For each benchmark case:

1. **A report** at `examples/benchmarks/benchmark-N-<casename>.md` conforming to the eight-step template above. Frontmatter `kind: example`, `status: verified` once acceptance criteria are met.
2. **Reproducible code** under `tools/<casename>/` or composed from the canonical tools (`regime-classifier`, `d-frame-cohomology`, `verdier-dual`, `strong-mld-orbits`, orchestrated by `run-benchmark`).
3. **Cross-references** from the report to the relevant theorems (steps 2-6) and references (step 7).

After the full benchmark suite (cases 1-7) is complete:

4. **A summary table** at [benchmark-suite-summary](../../examples/benchmarks/benchmark-suite-summary.md) answering the headline question: *in how many cases did the d-frame structure produce a classification refinement beyond the shadow?* Plus per-case verdicts on triangulation and literature alignment.

## What this protocol is not

It is not a *theorem-proving* pipeline. The theorems (rank, regime classification, Verdier duality, strong-MLD characterization, etc.) are already proved in predication categories' theorem layer. The protocol is a *computation* pipeline — applying those proved theorems to specific settlings to produce concrete classifications.

It is not a *generic-mathematics* pipeline. It assumes predication categories' specific setup: bilattice value category, closure 2-monad dynamics, bitopological settling site, four-regime structure. Cases that don't fit this setup require either a bridge (cf. `tools/predication_categories/examples/benchmark_5_epistemic_kripke.py/`, `tools/predication_categories/examples/benchmark_5_epistemic_kripke.py/`) or are simply outside the protocol's scope.

It is not an *open-research* pipeline. The two open sketches (`meta-moduli-deformation-theory`, `q-enriched-sheaf-direct-inverse-image`) are not part of the protocol — they're paper-scale theorem development, not benchmark computation.

## Position in predication categories

This protocol is the empirical-validation layer of the corpus. The theorem layer answers "what would be true if the framework is correct"; the protocol answers "is it correct on cases we can compute." The deliverables from running it (reports, code, summary) are what makes the corpus checkable from outside without re-deriving the entire theorem layer.

The next-cohort priority, per the recent program survey: build the canonical tools, run cases 1-4 against the substitution-tilings literature, build the bridges for cases 5-6, run those, finish with case 7, then assemble the summary. The collab note at `operations/command/plans/collab/ghrist-hansen-riess-pysheaf.md` indicates the natural moment to engage external reviewers: after 3-4 benchmark cases are documented, before the summary is assembled.

## References to the rest of the corpus

The protocol ties together:

- The [four-regime dichotomy](../../theorems/four-regime-dichotomy.md) (step 2) — the regime classification.
- The [aperiodic-regime cohomology via direct limit](../../theorems/aperiodic-regime-cohomology-via-direct-limit.md) and the [step-$n$ cohomological rank theorem](../../theorems/step-n-cohomological-rank-theorem.md) (step 3) — the $\mathbf{Ab}$-valued cohomology computations.
- The [d-frame cohomology comparison](../../theorems/d-frame-cohomology-comparison.md) and the [transfinite-bounded](../../theorems/transfinite-bounded-regime-d-frame-cohomology.md) / [aperiodic](../../theorems/aperiodic-regime-d-frame-cohomology.md) regime-specific theorems (step 4) — the d-frame layer.
- The [Verdier duality](../../theorems/verdier-duality-bitopological-site.md) and the [aperiodic co-classification](../../theorems/aperiodic-co-classification.md) (step 5) — the cosheaf-side dual.
- The [d-frame Verdier composition](../../theorems/d-frame-verdier-composition.md) and the [strong-MLD theorem](../../theorems/strong-mld-via-composed-duality.md) (step 6) — the orbit-type classification.

Every benchmark exercises this entire chain on a specific concrete settling. After enough benchmarks, the chain is no longer just an internal logical structure — it's an empirically-verified computational pipeline.
