---
type: theorem
status: sketch
depends-on: [aperiodic-regime-classification, aperiodic-classifying-invariant, mutually-locally-derivable, settling-morphism, fibered-coinduction, closure-2-monad-lax-idempotence]
title: "Aperiodic-regime classification: base-changing extensions"
description: Extends the common-base aperiodic-regime classification to settlings over different bases, related by a base morphism.
---

# Aperiodic-regime classification: base-changing extensions

Extends the [common-base aperiodic-regime classification](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-classification.md) to settlings over *different* bases, related by a base morphism. Where the common-base case exploits the structural simplification "$T$ is shared" to produce a direct combinatorial bijection (proved via the [combinatorial firing-ordinal bijection theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-classification-via-firing-ordinal-bijection.md)), the base-changing case must construct the MLD-equivalence across non-trivial base morphisms — which requires a more abstract bisimulation-lifting framework.

## Setup

Let $(\mathbf L, \mathcal C, E, \lambda)$ and $(\mathbf L', \mathcal C', E', \lambda')$ be two bases related by a base morphism $\beta : (\mathbf L, \mathcal C, E, \lambda) \to (\mathbf L', \mathcal C', E', \lambda')$. Let $v$ be an aperiodic settling over the first base, $v'$ over the second.

The **base-changing MLD-equivalence** is the equivalence relation on pairs $(v, v')$ defined by the existence of an invertible settling-morphism $(\phi, \delta) : v \to v'_\beta$, where $v'_\beta$ is the pullback of $v'$ along $\beta$ to the first base.

## The conjecture

**Conjecture (aperiodic classification, base-changing).** *Aperiodic settlings $v, v'$ over different bases related by $\beta$ are base-changing MLD-equivalent iff $\beta_* \mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v')$ in $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal F_{U'}^{\mathrm{univ}})$, where $\beta_*$ is the cohomology pushforward along the base morphism $\beta$.*

The conjecture extends the common-base classification by:

- Allowing the bases to differ.
- Adding the cohomology pushforward $\beta_*$ as the operative comparison (since $\mathrm{cl}\text{-}\mathrm{inv}(v)$ and $\mathrm{cl}\text{-}\mathrm{inv}(v')$ live in different cohomology groups before $\beta_*$ identifies them).

## Proof framework: fibered coinduction

The proof framework uses Hermida–Jacobs [@hermida-jacobs1998] **fibered coinduction** applied to settlings as fibered coalgebras over the base category, plus Bonchi–Petrişan–[@bonchi-et-al2014]'s **coinduction-up-to-closure**. The structural argument:

**Step 1 — settlings as fibered coalgebras.** Both $v$ and $v'_\beta$ are coalgebras of the closure operator $T$ (or its $\beta$-pullback) on the predication-fiber-algebra category. Hermida–Jacobs gives a fibered notion of bisimulation: a settling-morphism $\phi$ corresponds to a bisimulation between the two coalgebras lifted to the predication fibration.

**Step 2 — equal cohomology gives a coboundary witness.** Suppose $\beta_* \mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v')$ in the universal $H^1$. By the direct-limit characterization, there exists $\tau^* < \omega_1$ such that the classes agree in $H^1(\mathbf{T}^*_{\leq \tau^*}, \mathcal F_{U'}^{\mathrm{univ}})$. This gives a 1-cochain $\psi_{\tau}$ at each $\tau \leq \tau^*$ making $\beta_* \mathrm{cl}\text{-}\mathrm{inv}(v) - \mathrm{cl}\text{-}\mathrm{inv}(v')$ a coboundary.

**Step 3 — bisimulation lifting.** The family of coboundary witnesses $(\psi_\tau)_{\tau \leq \tau^*}$ extends to a settling-morphism $\phi : v \to v'_\beta$ via fibered-coinduction's bisimulation lifting, *provided* the two coalgebras admit a bisimulation lifting the cochain-coboundary relation. Bonchi et al's coinduction-up-to-closure provides this lifting because the [closure 2-monad](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/hacking/library/settlement-base-morphism/docs/dev/morphisms/closure-2-monad.md) is [lax-idempotent](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/hacking/library/settlement-base-morphism/docs/dev/theorems/closure-2-monad-lax-idempotence.md) and the closure-equivalence of coboundary-related states extends to a settling-morphism in the up-to-closure sense.

**Step 4 — extending from $\tau^*$ to $\omega_1$.** By $\leq_k$-monotonicity of the settling and direct-limit compatibility, $\phi$ defined at $\tau^*$ extends uniquely to the full settling up to $\omega_1$. Inverse exists by symmetry.

## Status: sketch — what's open

The proof framework above is structurally argued at the corpus's standard rigor for the common-base reduction (which the [companion theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-classification-via-firing-ordinal-bijection.md) proves directly). The base-changing extension's open content:

1. **Cohomology pushforward $\beta_*$ along base morphisms.** The functoriality of settling-cohomology under base morphisms is structural but not formally established in the corpus. Specifically: that $\beta_*$ is a well-defined map on $H^1$-classes, and that it commutes with the direct-limit definition of unbounded settling cohomology.

2. **Hermida–Jacobs fibered-coinduction in the predication setting.** The corpus's [fibered coinduction concept](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/hacking/library/settlement-base-morphism/docs/dev/theorems/fibered-coinduction.md) is partially developed. Applying Hermida–Jacobs' general framework to predication-fiber-algebra coalgebras specifically requires verifying the fibration's exactness conditions.

3. **Bonchi-style up-to-closure lifting.** The closure-2-monad's lax-idempotence is established; the corresponding up-to-closure bisimulation theorem in the predication setting requires careful application of [@bonchi-et-al2014]'s framework.

These are genuinely open. The corpus has the structural pieces (closure-2-monad, lax-idempotence, fibered settings, settling-as-coalgebra view) but has not assembled them into a complete base-changing classification proof.

## Why the common-base case is genuinely simpler

The [common-base aperiodic classification](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-classification.md) avoids this entire framework because:

- Closure operator $T$ is shared between $v$ and $v'$ (rules are part of the base).
- Cohomology lives in a single ambient $H^1$ for both settlings.
- Cell-level bijection extends to a settling-morphism by direct check ("rules firing at $v_\mu$ producing cell $X$" maps to "rules firing at $v'_\mu$ producing $\phi(X)$" because the same rules are firing).

The base-changing case loses each of these simplifications — different $T$'s, different ambient cohomologies, no automatic rule-respecting extension. The substantive bridge work is what fibered coinduction would provide.

## What this theorem would give once proved

- A complete classification of aperiodic settlings up to base-changing MLD, generalizing the common-base classification.
- A bridge between settlings over different bilattices (e.g., $\mathbf L = \mathbf 2$ Belnap vs $\mathbf L = \mathbf 3$ richer setting), with cohomology-class agreement as the classifying invariant.
- Foundation for the moduli-of-settlings questions ([deformation theory of SKHs](deformation-theory-of-skhs.md), [moduli scope restrictions](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/hacking/library/settlement-base-morphism/docs/dev/narratives/moduli-scope-restrictions.md)) where base-changing equivalence is the natural relation.
