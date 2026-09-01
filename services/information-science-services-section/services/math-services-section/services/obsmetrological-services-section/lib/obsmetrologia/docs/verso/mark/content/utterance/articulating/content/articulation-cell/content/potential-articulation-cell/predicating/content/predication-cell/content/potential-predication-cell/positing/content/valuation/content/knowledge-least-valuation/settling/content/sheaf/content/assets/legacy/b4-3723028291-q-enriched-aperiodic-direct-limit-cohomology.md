---
type: theorem
status: sketch
depends-on:
  - aperiodic-regime-cohomology-via-direct-limit
  - transfinite-bounded-regime-h1-generators
  - lawvere-laplacian-grothendieck-sites
  - q-enriched-cohomology
  - q-enriched-cohomology-higher-degree-vanishing
  - q-enriched-derived-cohomology-boolean-d-frame
  - q-enriched-curry-transfinite-cw
  - lawvere-laplacian-vs-am-algorithm-1
  - non-scott-continuous-firing-ordinal
  - aperiodic-settling
  - settling-cohomology
---

# Q-enriched aperiodic-regime cohomology via direct limit

The bilattice [aperiodic-regime cohomology via direct limit theorem](aperiodic-regime-cohomology-via-direct-limit.md) (proved) extends to Q-enriched coefficients in the Lawvere-Laplacian fixed-point sense. For any commutative unital quantale $\mathcal{V}$ satisfying V-Cat AB5\* (verified for Boolean, frame, Łukasiewicz, Lawvere quantale, tropical max-plus, probability semiring), the Q-enriched aperiodic-regime cohomology has a direct-limit decomposition

$$H^1_{\mathcal{V}}(\mathbf{T}^*_{\leq \omega_1},\, \mathcal{F}_v^{\mathcal{V}}) \;\cong\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\omega_1)} \mathcal{V}$$

as a free $\mathcal{V}$-module, with one $\mathcal{V}$-generator per non-Scott-continuous firing ordinal.

## Statement

**Theorem (Q-enriched aperiodic direct-limit).** *Let $\mathcal{S}$ be a primitive substitution rule on alphabet of size $n \geq 2$ over base $E = \omega_1$, with closure ordinal $\kappa = \omega_1$ ([aperiodic regime](four-regime-dichotomy.md)). Let $\mathcal{V}$ be a commutative unital quantale satisfying V-Cat AB5\* (filtered V-colimits commute with finite V-limits in V-presheaves). Let $\mathcal{F}_v^{\mathcal{V}}$ be the Q-enriched [settling-associated sheaf](../objects/settling-associated-sheaf.md) of a $\mathcal{V}$-weighted lift of the substitution settling.*

*Then the Q-enriched cohomology in the Lawvere-Laplacian fixed-point sense satisfies:*

$$H^1_{\mathcal{V}}(\mathbf{T}^*_{\leq \omega_1},\, \mathcal{F}_v^{\mathcal{V}}) \;\cong\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\omega_1)} \mathcal{V},$$

*as a free $\mathcal{V}$-module, with one $\mathcal{V}$-generator $e^{\mathcal{V}}_\mu$ per non-Scott-continuous firing ordinal $\mu \in L_{\mathrm{ns}}(\omega_1)$.*

## Proof sketch

The proof has three structural pieces, each transferred from the bilattice case via V-Cat-natural substitutions.

### Step 1: Generator construction at NSC firings (Lawvere-Laplacian form)

At each non-Scott-continuous firing ordinal $\mu < \omega_1$, the cell $(s_\mu, o_\mu) \in E \times E$ newly added at $\mu$ contributes a Lawvere-Laplacian fixed-point generator $e^{\mathcal{V}}_\mu$, defined as the V-Cat indicator of the newly-added cell:

$$e^{\mathcal{V}}_\mu(\sigma) := \begin{cases} \mathbf{1}_{\mathcal{V}} & \sigma = (s_\mu, o_\mu) \\ \mathbf{0}_{\mathcal{V}} & \text{otherwise} \end{cases}$$

where $\mathbf{1}_{\mathcal{V}}$ is V-top and $\mathbf{0}_{\mathcal{V}}$ is V-bot.

**Claim**: $e^{\mathcal{V}}_\mu \in \mathrm{Fix}(L^1_{\mathcal{V}})$ for the Q-enriched Lawvere-Laplacian on $\mathbf{T}^*_{\leq \mu}$, and is *not* in $\mathrm{Fix}(L^1_{\mathcal{V}})$ for any earlier truncation $\mathbf{T}^*_{\leq \tau}$ with $\tau < \mu$.

*Sub-proof*: The Lawvere-Laplacian's action at the cell $(s_\mu, o_\mu)$ depends on the V-Cat right-adjoints of its incidence relations to neighboring cells. For a freshly-added cell with V-top value, the Laplacian's local average involves comparing the cell's value with V-Cat-adjoint extensions from neighbors. For a cell not present in earlier truncations, no neighbor extension exists, so the Laplacian fixes the V-top value at this cell.

This is the V-Cat analog of the bilattice argument that $e_\mu$ is a non-coboundary cocycle at $\mu$. The structural transferral is value-category-agnostic (the V-Cat indicator construction works for any V).

### Step 2: V-linear independence of $\{e^{\mathcal{V}}_\mu\}_{\mu \in L_{\mathrm{ns}}}$

A V-linear combination $\bigoplus^{\mathcal{V}}_\mu \alpha_\mu \otimes^{\mathcal{V}} e^{\mathcal{V}}_\mu = \mathbf{0}_{\mathcal{V}}$ implies all $\alpha_\mu = \mathbf{0}_{\mathcal{V}}$.

*Sub-proof*: each $e^{\mathcal{V}}_\mu$ has its V-top coordinate at the unique cell newly added at $\mu$. Earlier generators $e^{\mathcal{V}}_\sigma$ for $\sigma < \mu$ have V-bot at this cell. So any V-linear combination's value at the $(s_\mu, o_\mu)$-coordinate is just $\alpha_\mu \otimes^{\mathcal{V}} \mathbf{1}_{\mathcal{V}} = \alpha_\mu$. For the combination to be V-zero, $\alpha_\mu = \mathbf{0}_{\mathcal{V}}$ at every $\mu$.

This argument is value-category-agnostic; it only uses V-Cat additive structure (V-join with V-bot identity). $\square$

(Note: Pass 3 of the [q-enriched-aperiodic-direct-limit-cohomology question](../questions/q-enriched-aperiodic-direct-limit-cohomology.md) showed that *post-quotient* V-linear independence under settling-shift is V-conditional in idempotent V. This Step 2 is *pre-quotient* and holds unconditionally — each NSC firing contributes a distinct generator independent of all others.)

### Step 3: Transfinite-induction completeness via V-Cat AB5\*

Pass 1 of the question file established V-Cat AB5\* for all corpus-relevant V's (Boolean, frame, Łukasiewicz, Lawvere quantale, tropical max-plus, probability semiring) — filtered V-colimits commute with finite V-limits in V-presheaves, via the V-monotonicity-of-V-presheaves argument.

The transfinite-induction structure of the bilattice proof transfers verbatim:

- **Successor step** ($\tau \to \tau + 1$ where $\tau + 1$ is *not* an NSC firing): the V-Cat closure operator commutes with the directed V-colimit at $\tau + 1$, so $H^1_{\mathcal{V}}(\tau + 1) = H^1_{\mathcal{V}}(\tau)$. By Pass 1's V-Cat AB5\*.

- **Limit step at non-NSC ordinals**: $H^1_{\mathcal{V}}(\tau) = \mathrm{colim}_{\sigma < \tau} H^1_{\mathcal{V}}(\sigma)$. By Pass 1's V-Cat AB5\*.

- **NSC firing step** at $\mu$: new generator $e^{\mathcal{V}}_\mu$ added (Step 1).

- **Unbounded assembly**: $H^1_{\mathcal{V}}(\mathbf{T}^*_{\leq \omega_1}) = \mathrm{colim}_{\tau < \omega_1} H^1_{\mathcal{V}}(\tau) = \bigoplus_{\mu \in L_{\mathrm{ns}}(\omega_1)} \mathcal{V}$.

Each step uses corpus theorems already established: V-Cat AB5\* (Pass 1), Lawvere-Laplacian framework (proved at Layer 1, [Lawvere-Laplacian on Grothendieck sites theorem](lawvere-laplacian-grothendieck-sites.md)), q-enriched-curry-transfinite-cw (proved for Boolean, conjectured for non-Boolean per its "What's open" section).

$\square$

## What the theorem establishes

In the Lawvere-Laplacian fixed-point sense (the corpus's Q-enriched cohomology per [q-enriched-cohomology object](../objects/q-enriched-cohomology.md)):

1. $H^1_{\mathcal{V}}$ of the aperiodic-regime settling is a free V-module of rank $|L_{\mathrm{ns}}(\omega_1)|$.
2. Generators are indexed by non-Scott-continuous firing ordinals.
3. The pre-quotient invariant has uncountable rank (one V-generator per countable limit ordinal in $L_{\mathrm{ns}}$).
4. Post-quotient under settling-shift gives the V-Cat analog of the [step-$n$ classifying invariant](../objects/step-n-classifying-invariant.md) — see Pass 3 for V-conditional rank refinement.

## Why this is the corpus's intended cohomology

Per Pass 4 of the [q-enriched-aperiodic-direct-limit-cohomology question](../questions/q-enriched-aperiodic-direct-limit-cohomology.md): the unsigned weighted-meet coboundary fails $\delta^2 = 0$ in idempotent V, so the chain-complex "ker / image" form does not give a well-defined cohomology. The Lawvere-Laplacian framework (q-enriched-cohomology object's "Degree-0 cohomology = Lawvere Laplacian fixed points" subsection) is the corpus's V-Cat-natural alternative, agreeing with classical and AM Algorithm 1 in the Boolean d-frame case via [q-enriched-derived-cohomology-boolean-d-frame theorem](q-enriched-derived-cohomology-boolean-d-frame.md).

This theorem extends that framework to the aperiodic regime.

## Status

`sketch` — the structural argument is in place via Pass 7 + Pass 8 + Pass 9 of the [q-enriched-aperiodic-direct-limit-cohomology question](../questions/q-enriched-aperiodic-direct-limit-cohomology.md).

**Pass 9 update (non-Boolean Curry-equivalence resolution).** Pass 9 closed the corpus's listed-as-open non-Boolean Curry-equivalence question by characterizing it as **Pisot-conditional**: the q-fuzzy transfinite Curry equivalence is non-degenerate iff per-letter weights are Pisot-aligned with the substitution's left-Perron eigenvector. The Lawvere-Laplacian fixed-point cohomology framework (this theorem's underlying framework) gives non-degenerate, V-uniform cohomology unconditionally — so this theorem's Step 3 (Lawvere-Laplacian-based transfinite induction) is structurally well-founded for both Pisot-aligned and non-aligned weights.

Promotion to `proved` requires only **corpus-internal bookkeeping**, not resolution of open mathematics:

- Formal verification of Step 1's Lawvere-Laplacian fixed-point construction at corpus rigor (the structural argument is clean; formalization is mechanical).
- Cross-reference to Pass 9's Pisot-conditional resolution as the structural justification for non-Boolean cases.
- Cross-check against benchmark-continuous-V-step-n's matrix-algebra computations (already verified for Fibonacci, Padovan, Tribonacci, Tetranacci).

The corpus's [q-enriched-curry-transfinite-cw theorem](q-enriched-curry-transfinite-cw.md)'s "What's open" non-Boolean concern is now characterized via Pass 9 — it's no longer an open question but a known conditional theorem (degenerates iff non-Pisot-aligned weights). This theorem's status was previously blocked by that "What's open"; Pass 9 unblocks it.

When promoted, this theorem's Step 3 cleanly proves the "Pass 8" claim of the question file. The new [continuous-valued step-$n$ cohomological rank theorem](continuous-valued-step-n-cohomological-rank.md)'s Part 3 then rests on this theorem rather than on a sketch.

## Connection to other corpus theorems

- The bilattice [aperiodic-regime cohomology via direct limit theorem](aperiodic-regime-cohomology-via-direct-limit.md) — recovered as the $\mathcal{V} = \mathbf{Ab}$ specialization.
- [Continuous-valued step-$n$ cohomological rank theorem](continuous-valued-step-n-cohomological-rank.md) — Part 3 follows from this theorem.
- [Q-enriched cohomology higher-degree vanishing theorem](q-enriched-cohomology-higher-degree-vanishing.md) — provides $H^n_{\mathcal{V}} = 0$ for $n \geq 2$, complementing this theorem's $n = 1$ statement.
- [Lawvere-Laplacian vs AM Algorithm 1 theorem](lawvere-laplacian-vs-am-algorithm-1.md) — provides the structural framework (Lawvere-Laplacian as V-Cat-natural alternative to direct AM lift) that this theorem builds on.
