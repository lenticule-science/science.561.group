---
type: theorem
status: proved
depends-on: [non-scott-continuous-firing-ordinal, settling-cohomology, settling-associated-sheaf, four-regime-dichotomy, scott-continuous-closure, strict-regime-cohomology-vanishing, settling-cohomology-vanishes-above-degree-1, ayzenberg-magai2025]
title: "Transfinite-bounded regime: $H^1$-generators at non-Scott-continuous firings"
description: "For a predication settling in transfinite-bounded regime with closure ordinal $\\omega < \\kappa < $ state-space cofinality:"
---

# Transfinite-bounded regime: $H^1$-generators at non-Scott-continuous firings

For a predication settling in [transfinite-bounded regime](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md) with closure ordinal $\omega < \kappa < $ state-space cofinality:

$$H^1(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_U) \;\cong\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z},$$

one copy of $\mathbb{Z}$ per [non-Scott-continuous firing ordinal](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-continuity/content/non-scott-continuous-firing-ordinal/non-scott-continuous-firing-ordinal.md) below $\kappa$, with generator $e_\mu$ corresponding to the newly-added cell at $\mu$. Higher cohomology vanishes by [settling cohomology vanishes above degree 1](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-cohomology-vanishes-above-degree-1.md).

## Proof

The argument has three structural pieces — generator construction, linear independence, completeness — followed by transfinite induction over the firing-ordinal sequence to assemble the unbounded statement. The completeness step requires care: [@ayzenberg-magai2025]'s Algorithm 1 / Theorem C.76 applies directly only to *finite* posets, so the unbounded $H^1$ requires colimit assembly from finite-truncation pieces rather than direct application of the algorithm.

### Generator construction at each firing

At a non-Scott-continuous firing ordinal $\mu$, the settling's failure to commute with filtered colimits produces a cokernel in the chain map $\varinjlim_\sigma \mathcal F_U|_\sigma \to \mathcal F_U|_\mu$. This cokernel lives in one degree of the total complex (the "jump degree") and contributes exactly one new generator to $H^1$ at the firing ordinal.

Concretely: at $\mu$, the cell $(s_\mu, o_\mu) \in E \times E$ newly added by the non-Scott-continuous closure firing contributes an element $e_\mu \in \mathcal F_U^{(t)}(q_\mu, \mu)$ not in the image of any $\mathcal F_U^{(t)}(q', \sigma)$ for $\sigma < \mu$. This element is a cocycle (in the kernel of the next differential because no later firing eliminates it) but not a coboundary (no earlier element maps to it). So $[e_\mu] \in H^1$ is non-zero.

### Linear independence

The collection $\{[e_\mu]\}_{\mu \in L_{\mathrm{ns}}(\kappa)}$ is $\mathbb Z$-linearly independent: a linear combination $\sum_\mu a_\mu e_\mu = 0$ in $H^1$ means the underlying cochain is a coboundary, which requires it to be in the image of $\mathcal F_U|_\sigma$ for some $\sigma < \min\{\mu : a_\mu \neq 0\}$ — contradicting the newly-addedness of each $e_\mu$ at its respective $\mu$.

### Completeness via transfinite induction on truncations

Every $H^1$-class arises as a finite linear combination of the $\{e_\mu\}_{\mu \in L_{\mathrm{ns}}(\kappa)}$. The argument proceeds by transfinite induction on the truncation index $\tau \in [0, \kappa)$, with three structurally distinct cases:

**Base case ($\tau < \omega$, finite truncation).** The truncated bitopological settling site $\mathbf T^*_{\leq \tau}$ is a finite poset (predicate category $\mathcal C$ × finite ordinal segment $[0, \tau]$ × clopens of finite paired-Priestley fibers). The settling-associated sheaf $\mathcal F_U$ on this finite truncation is a cellular sheaf in the Ayzenberg–Magai sense.

By [@ayzenberg-magai2025] Theorem C.76 / Algorithm 1 (applicable here because the poset is finite), there exists a minimal cochain functor $F_{\min} : \mathrm{Shvs}(\mathbf T^*_{\leq \tau}; \mathbf{Ab}) \to \mathrm{Cochain}(\mathbf{Ab})$ that honestly computes cohomology with the **lower bound on multiplicity**: each cell stalk contributes to the cochain complex exactly the minimum number of times needed for the algorithm to produce $H^*$ correctly. Crucially for our purposes, each finite truncation $\mathbf T^*_{\leq \tau}$ for $\tau < \omega$ is a homology Morse cell poset (Definition A.32 of [@ayzenberg-magai2025]) — the boundary of each cell-down-set has the homology of a sphere, by the bitopological-site's regular cellular structure on each fiber. So Algorithm 1 produces generators *indexed by cells*, and the $H^1$-generators are exactly the cells whose addition is non-trivially homological — which by the strict-regime structure are exactly the (finitely many) NSC firings at this truncation.

For $\tau < \omega$, no NSC firings occur at all (Scott-continuity in the strict regime is automatic since the settling stabilizes in finitely many steps before reaching any limit ordinal). Hence $H^1(\mathbf T^*_{\leq \tau}, \mathcal F_U) = 0$ for $\tau < \omega$, matching the [strict-regime cohomology vanishing theorem](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/strict-regime-cohomology-vanishing.md).

**Successor step (Scott-continuous segment $\tau \to \tau + 1$ with $\tau + 1$ not a NSC firing).** When $\tau + 1$ is not an NSC firing, the closure operator commutes with the directed colimit $\varinjlim_{\sigma \leq \tau} \mathcal F_U|_\sigma$, so $\mathcal F_U|_{\tau + 1}$ is the colimit and no new cell is added. The cohomology is unchanged: $H^1(\mathbf T^*_{\leq \tau + 1}) = H^1(\mathbf T^*_{\leq \tau})$.

**Limit step at non-NSC limit ordinals ($\tau$ a limit ordinal that is not an NSC firing).** Scott-continuity of the closure at $\tau$ gives $\mathcal F_U|_\tau = \varinjlim_{\sigma < \tau} \mathcal F_U|_\sigma$. Cohomology commutes with directed colimits in the relevant range (filtered colimits of $\mathbf{Ab}$-valued sheaf cohomologies on a directed system of inclusions, which is the standard AB5-style argument for $\mathbf{Ab}$). Hence $H^1(\mathbf T^*_{\leq \tau}) = \varinjlim_{\sigma < \tau} H^1(\mathbf T^*_{\leq \sigma})$, which by the inductive hypothesis is $\bigoplus_{\mu \in L_{\mathrm{ns}}(\tau)} \mathbb Z$ (where $L_{\mathrm{ns}}(\tau)$ is the firing set strictly below $\tau$).

**Firing step at an NSC firing $\tau = \mu$.** By the generator-construction step above, the truncation at $\mu$ adds exactly one new cell $(s_\mu, o_\mu)$ that contributes a non-coboundary cocycle $e_\mu$. The cohomology becomes $H^1(\mathbf T^*_{\leq \mu}) = H^1(\mathbf T^*_{< \mu}) \oplus \mathbb Z\langle e_\mu \rangle$, where the new $\mathbb Z$ is generated by $e_\mu$ and the linear-independence step ensures the direct-sum decomposition (no relation with earlier generators).

**Unbounded assembly.** By transfinite induction over the well-ordered sequence of truncations $\tau \in [0, \kappa)$, $H^1(\mathbf T^*_{\leq \tau}) = \bigoplus_{\mu \in L_{\mathrm{ns}}(\tau)} \mathbb Z$ at every $\tau$. The unbounded settling cohomology

$$H^1(\mathbf T^*_{\leq \kappa}, \mathcal F_U) \;:=\; \varinjlim_{\tau < \kappa} H^1(\mathbf T^*_{\leq \tau}, \mathcal F_U) \;=\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb Z,$$

by the directed-colimit definition of settling cohomology and the transitions being generator-including inclusions at each step. $\square$

### What Ayzenberg–Magai is and isn't doing

[@ayzenberg-magai2025]'s Algorithm 1 (Theorem C.76) supplies the **finite-poset base case** — establishing that on each finite truncation $\mathbf T^*_{\leq \tau}$ for $\tau < \omega$, the minimal cochain complex has generators indexed by NSC firings (which in the strict regime is the empty set, giving $H^1 = 0$). Their work does *not* directly handle transfinite truncations $\tau \geq \omega$; for those, the colimit assembly above is required.

The cited extension to the unbounded case is corpus-internal work (the transfinite induction above), not a direct citation. Ayzenberg–Magai's framework provides the foundational concept (homology Morse cell posets, minimal cochain complexes with cell-indexed generators) on which the corpus's transfinite extension builds.

## The aperiodic classifying invariant in the transfinite-bounded regime

The [aperiodic classifying invariant](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/settling-cohomology/docs/dev/objects/aperiodic-classifying-invariant.md) for a transfinite-bounded settling is

$$\mathrm{cl}\text{-}\mathrm{inv}(v) \;=\; \sum_{\mu \in L_{\mathrm{ns}}(\kappa)} e_\mu \;\in\; H^1(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_U^{(t)})$$

— the sum of all non-Scott-continuous firing contributions. The "identity class" definition coincides with summing all non-trivial $H^1$-generators.

## MLD interpretation

Two transfinite-bounded predication settlings are [mutually-locally-derivable](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/settling-cohomology/docs/dev/concepts/mutually-locally-derivable.md) iff their non-Scott-continuous-firing-set structures agree up to settling-shift. This is concretely checkable — finer than MLD-equivalence for the strict regime (trivial invariant), coarser than full settling-isomorphism.
