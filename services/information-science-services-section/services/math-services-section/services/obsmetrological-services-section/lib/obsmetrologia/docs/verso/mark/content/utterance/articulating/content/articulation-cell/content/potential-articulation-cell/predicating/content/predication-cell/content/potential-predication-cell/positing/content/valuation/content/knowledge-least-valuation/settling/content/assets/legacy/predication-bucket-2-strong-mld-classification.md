---
type: question
class: internal
status: open
explores: [aperiodic-regime-classification, mutually-locally-derivable, settling-morphism, aperiodic-classifying-invariant, bigraded-realizability-refinement, c-naturality-coupling-realizability-refinement, rule-language-fragment-realizability-refinement]
kind: question
---

# Strong MLD-classification

The [aperiodic-regime classification theorem](../../aperiodic-settling/references/aperiodic-regime-classification.md) classifies aperiodic settlings up to [mutually-locally-derivable](../concepts/mutually-locally-derivable.md) equivalence — a relatively loose equivalence that admits settling-shift, fiberwise relabeling preserving settling structure, and so on.

Open: a strictly finer equivalence — *strong MLD* — would constrain the [settling-morphism](../morphisms/settling-morphism.md) further (e.g., requiring it to preserve settling-stage labels exactly, not just up to shift, or requiring it to commute with auxiliary structure beyond the settling endofunctor). What classifies settlings up to strong MLD?

Candidates for the classifying invariant:

- *Pair $(H^1, H^0)$.* The $H^0$-count of converged-state cells gives a finer invariant; whether $\mathrm{cl}\text{-}\mathrm{inv} \oplus N_t$ classifies up to strong MLD is a natural conjecture.
- *A finer cohomological invariant.* Refining the [settling-associated sheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md) to track ordinal-position information would produce a richer cohomology that distinguishes shifted settlings from each other.
- *A non-cohomological invariant.* The strong-MLD equivalence might not correspond to any cohomological invariant — a possibility that would suggest the cohomology is the natural classifying gadget for MLD specifically and nothing finer.

Pursuing this requires refining both the equivalence relation and the invariant simultaneously.

## Connection to the realizability program

The [realizability program](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/realizability-program.md) gives concrete material for refining the candidate invariants. The per-axis refinements decompose the realizable cohomology classes along three structural dimensions (bigraded value-type, $\mathcal{C}$-naturality coupling, rule-language fragment), and any "strong MLD" invariant would naturally inherit this decomposition:

- The [bigraded refinement](../../../references/bigraded-realizability-refinement.md) shows that the truth-side and inconsistency-side components are independently realizable (on discrete $\mathcal{C}$). A strong-MLD invariant could distinguish settlings via the *pair* of components, not just their sum — finer than $\mathrm{cl}\text{-}\mathrm{inv}^{(0,1)}$ alone.
- The [$\mathcal{C}$-naturality coupling refinement](../theorems/c-naturality-coupling-realizability-refinement.md) shows that per-predicate firing patterns are coupled in regime-specific ways. A strong-MLD invariant could track the per-predicate firings under the four-generator-class action — a richer invariant than the global $\mathrm{cl}\text{-}\mathrm{inv}$.
- The [rule-language fragment refinement](../theorems/rule-language-fragment-realizability-refinement.md) parametrizes realizability by rule-language expressivity. A strong-MLD invariant could distinguish settlings by the *minimum rule-language fragment* that realizes their classifying class — an expressivity-based invariant orthogonal to the cohomological one.

The realizability program's [cardinality bound](../theorems/realizability-cardinality-bound.md) also bounds what a strong-MLD invariant could possibly distinguish: at most $2^{\aleph_0}$ classes in total, with per-axis structure constraining the decomposition.

Whether any of these refinements give a *complete* strong-MLD classification — versus distinguishing some pairs but not others — is the substantive open question. The framework has shifted: rather than choosing one of three candidates (pair, refined cohomology, non-cohomological), the answer is likely a combination informed by the per-axis decomposition.

## Concrete refined-invariant candidate from the d-frame chapter

The [transfinite-bounded-regime d-frame cohomology theorem](../../sheaf/content/settling-cohomology/references/transfinite-bounded-regime-d-frame-cohomology.md) (draft) gives a *specific* candidate refined invariant: at each non-Scott-continuous firing $\mu$, the $H^1$-generator is a d-frame $D_\mu$ encoding the firing's evidence-side structure (positive-only, negative-only, or $\top$). The full d-frame $H^1$ is $\bigoplus_\mu D_\mu$ — a per-firing-ordinal d-frame, strictly finer than the per-firing-ordinal $\mathbb{Z}$ of the $\mathbf{Ab}$-valued shadow.

**Concrete proposal.** Two transfinite-bounded settlings are **d-frame-MLD-equivalent** iff their per-firing d-frames $\{D_\mu\}_{\mu \in L_{\mathrm{ns}}}$ agree (as families of d-frames up to settling-shift). This is strictly finer than the existing $\mathbf{Ab}$-valued MLD-equivalence — it distinguishes settlings whose firing patterns differ in evidence-side structure or in $\top$-witness arrangement, even when the per-side firing-ordinal sets agree.

The aperiodic-regime case lifts this to $\omega_1$-scale via the [aperiodic-regime d-frame cohomology theorem](../../aperiodic-settling/references/aperiodic-regime-d-frame-cohomology.md) (draft). The combined regime structure gives a candidate strong-MLD invariant at every regime stratum.

This is the d-frame chapter's substantive contribution to the strong-MLD-classification question: a concrete refined invariant whose discriminating power exceeds the bigraded refinement, with the d-frame structure (consistency, totality) being what the bigraded refinement drops.

**Further refinement via Verdier duality.** With the [Verdier duality chapter](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/verdier-duality-opener.md) opened, a *dual* candidate refined invariant emerges: the cosheaf-side aperiodic co-invariant $\check{\mathrm{cl}\text{-}\mathrm{inv}}(v) \in H_1$ classifying aperiodic settlings dually. The duality establishes that the sheaf-side and cosheaf-side invariants encode the same MLD-class, but the *combination* — keeping both presentations — gives strictly more discriminating power than either alone in cases where the duality is non-trivially asymmetric. Whether this is the "right" strong-MLD invariant depends on what the duality's two-dualities-composing structure produces in concrete cases.

## Resolution at draft level

The question is now answered at draft level by the [strong-MLD classification via composed-duality orbits](../theorems/strong-mld-via-composed-duality.md) theorem. The refinement: each non-Scott-continuous firing's *orbit type* under the composed duality $\mathbb{D} = \mathbb{D}_{\mathrm{sp}} \circ \mathbb{D}_{\mathrm{val}}$ — truth-only / falsity-only / $\top$ — is added to the classifying data. Two aperiodic settlings are strong-MLD-equivalent iff their MLD-class agrees AND their firing-orbit-type functions agree.

The refinement is strict: a truth-only-firing settling and a falsity-only-firing settling with the same firing-ordinal set are MLD-equivalent but not strong-MLD-equivalent. Open work remains in concrete examples and cross-axis composition with the realizability program.
