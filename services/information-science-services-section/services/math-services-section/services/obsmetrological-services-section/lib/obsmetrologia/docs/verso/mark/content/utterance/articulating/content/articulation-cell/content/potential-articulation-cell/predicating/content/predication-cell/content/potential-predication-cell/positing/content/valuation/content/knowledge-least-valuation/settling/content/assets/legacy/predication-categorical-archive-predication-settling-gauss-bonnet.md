---
type: theorem
status: proved
depends-on: [settling-cohomology-vanishes-above-degree-1, closure-flow-curvature-regime-correspondence, settling-associated-sheaf, aperiodic-regime-cohomology-via-direct-limit, step-n-cohomological-rank-theorem, settling-cohomology]
see-also: [closure-flow-curvature-regime-correspondence, settling-cohomology, void-cone-cohomology]
---

# Settling Gauss–Bonnet theorem

The classical Gauss–Bonnet theorem for a Riemannian surface $\Sigma$ states:
$$\int_\Sigma K \, dA \;+\; \int_{\partial \Sigma} \kappa_g \, ds \;=\; 2\pi \chi(\Sigma)$$
relating total curvature (left side) to the topological Euler characteristic (right side). In the corpus, with NSC firings playing the role of curvature and the settling's apex structure playing the role of topological content, a direct analog holds.

**Theorem (settling Gauss–Bonnet).** *Let $v$ be a predication settling with settling-associated sheaf $\mathcal{F}_v$ on a bitopological settling site satisfying the cohomological-dimension hypothesis $\mathrm{cd}(\mathcal{C}^{\mathrm{op}}) \leq 1$. Define the* settling Euler characteristic *as:*
$$\chi(v) \;:=\; \mathrm{rank}\,H^0(\mathbf{T}^*, \mathcal{F}_v) \;-\; \mathrm{rank}\,H^1(\mathbf{T}^*, \mathcal{F}_v).$$
*Then:*

1. *(Vanishing above degree 1.) $H^k(\mathbf{T}^*, \mathcal{F}_v) = 0$ for all $k \geq 2$, so the Euler characteristic $\chi(v)$ is the complete alternating sum of cohomology ranks.*

2. *(Curvature contribution.) $\mathrm{rank}\,H^1 = |L_{\mathrm{ns}}(\kappa)|$ — the total number of curvature events (per the [curvature–regime correspondence](closure-flow-curvature-regime-correspondence.md)).*

3. *(Apex contribution.) $H^0(\mathbf{T}^*, \mathcal{F}_v) \cong \mathbb{Z}^{|\mathrm{Apex}_v|}$, so $\mathrm{rank}\,H^0 = |\mathrm{Apex}_v|$ — the total number of settled cells.*

4. *(Gauss–Bonnet formula.)*
$$\chi(v) \;=\; |\mathrm{Apex}_v| \;-\; |L_{\mathrm{ns}}(\kappa)| \;=\; \text{(total settled cells)} \;-\; \text{(total curvature events)}.$$

5. *(Step-$n$ case.) For a primitive step-$n$ substitution settling $v_\mathcal{S}$ with unimodular substitution matrix, the post-quotient Euler characteristic is:*
$$\chi^{(n)}(v_\mathcal{S}) \;:=\; \mathrm{rank}\,H^{0,(n)} - \mathrm{rank}\,H^{1,(n)} \;=\; n - n \;=\; 0.$$

## Proof

### Part 1: vanishing above degree 1

Immediate from [settling cohomology vanishes above degree 1](../../sheaf/content/settling-cohomology/references/settling-cohomology-vanishes-above-degree-1.md). $\square$

### Part 2: curvature contribution

Immediate from [closure-flow curvature–regime correspondence](closure-flow-curvature-regime-correspondence.md), part 3. $\square$

### Part 3: apex contribution

The settling-associated sheaf at a site point $(q, \tau, U)$ is $\mathcal{F}_v(q, \tau, U) = \mathbb{Z}^{\Delta^{+,*}_\tau(q) \cap U}$ — the free abelian group on the set of newly-designated cells at stage $\tau$ in predicate $q$ lying in clopen $U$.

A global section of $\mathcal{F}_v$ over the whole site assigns to each $(q, \tau, U)$ an element of $\mathbb{Z}^{\Delta^{+,*}_\tau(q) \cap U}$ compatibly with clopen restrictions. Since restrictions are set-inclusion maps (and the clopen lattice generates the whole fiber), a global section is determined by a choice of integer for each $(q, cell)$-pair that becomes designated at some stage — i.e., an integer for each element of $\mathrm{Apex}_v := \bigcup_{q, \tau} \Delta^{+,*}_\tau(q)$.

Compatibility is automatically satisfied because the restriction maps are inclusions, and an assignment of an integer to each element of $\mathrm{Apex}_v$ uniquely determines a consistent family. Therefore:
$$H^0(\mathbf{T}^*, \mathcal{F}_v) \;\cong\; \mathbb{Z}^{|\mathrm{Apex}_v|}. \qquad \square$$

### Part 4: Gauss–Bonnet formula

Combining Parts 1–3:
$$\chi(v) = \mathrm{rank}\,H^0 - \mathrm{rank}\,H^1 + 0 + 0 + \cdots = |\mathrm{Apex}_v| - |L_{\mathrm{ns}}(\kappa)|. \qquad \square$$

### Part 5: step-$n$ post-quotient

By the [step-$n$ cohomological rank theorem](../../aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-cohomological-rank-theorem.md):
$$\mathrm{rank}\,H^{1,(n)} = n.$$

For $H^{0,(n)}$: the settling-shift quotient $\sim$ on $\mathrm{Apex}_v$ identifies cells lying in the same letter-type orbit under the substitution. By primitivity of the substitution matrix $M$, the apex of a step-$n$ substitution settling has exactly $n$ letter-type orbits — the same orbits as the substitution-letter set $\{a_1, \ldots, a_n\}$. So:
$$\mathrm{rank}\,H^{0,(n)} = n.$$

Therefore:
$$\chi^{(n)}(v_\mathcal{S}) = n - n = 0. \qquad \blacksquare$$

## Regime-by-regime cases

| Regime | $|\mathrm{Apex}_v|$ | $|L_{\mathrm{ns}}|$ | $\chi(v)$ |
|---|---|---|---|
| Strict, finite base | finite $= m$ | $0$ | $m$ |
| Scott-continuous, $\omega$-settled | $\aleph_0$ | $0$ | $\aleph_0$ (infinite) |
| Transfinite-bounded, countable firings | $> \aleph_0$ | $< \aleph_0$ | ill-defined without quotient |
| Aperiodic, step-$n$ post-quotient | $n$ (quotient) | $n$ (quotient) | $0$ |

The finite-base strict regime gives the most direct formula: no curvature events, $\chi = $ total settled cells. The step-$n$ post-quotient gives $\chi^{(n)} = 0$ — a genuine Gauss–Bonnet vanishing result.

## Geometric interpretation

The formula $\chi = |\mathrm{Apex}| - |L_{\mathrm{ns}}|$ has a direct geometric reading:

- **$|\mathrm{Apex}|$** measures the "topological content" — the settled information content of the settling. In a Riemannian surface, this is the "area" term.
- **$|L_{\mathrm{ns}}|$** measures the "total curvature" — the count of curvature events. In a Riemannian surface, this is the curvature integral.
- **$\chi$** is the topological invariant — determined by the global shape, not by local geometry. In the step-$n$ case, $\chi^{(n)} = 0$ reflects the "torus-like" topology of the substitution settling's post-quotient moduli.

The Gauss–Bonnet formula is thus a conservation law: as the settling evolves (under deformation — cf. [settling-path](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-path.md)), the quantity apex − curvature remains constant. By the [no-tunneling theorem](cl-inv-locally-constant-on-paths.md), $H^1$ is locally constant on settling paths; by Part 3, $H^0$ (the apex count) is also preserved under formal deformations. Hence $\chi(v)$ is an invariant of the settling's MLD-class.

## Step-$n$ post-quotient case: $\chi^{(n)} = 0$

The vanishing $\chi^{(n)} = 0$ for primitive step-$n$ substitution settlings is the corpus's analog of the classical fact that tori and flat surfaces have Euler characteristic zero. In tiling theory, the cohomology $\check{H}^1(\Omega_\sigma) \cong \mathbb{Z}^n$ and $\check{H}^0(\Omega_\sigma) \cong \mathbb{Z}$ for a minimal substitution tiling space $\Omega_\sigma$, giving $\chi = 1 - n$. The post-quotient corpus version identifies $H^{0,(n)} = \mathbb{Z}^n$ (not $\mathbb{Z}$) because the corpus quotient is coarser — it identifies by letter type rather than by the full tiling-equivalence relation — giving $\chi^{(n)} = n - n = 0$.

The distinction is substantive: the classical tiling-space computation is on the inverse-limit space (a compact metrizable space), while the corpus computation is on the direct-limit site (the bitopological settling site) with the settling-shift quotient. The two quotients differ, and their Euler characteristics differ accordingly.

## Open directions

1. **Non-unimodular substitutions.** When $|\det M| = d > 1$, $\mathrm{rank}\,H^{1,(n)}$ is still $n$ but the coefficients are in $\mathbb{Z}[1/d]$. The Gauss–Bonnet formula extends to the $\mathbb{Z}[1/d]$-rank, giving $\chi^{(n)}_{\mathbb{Z}[1/d]} = 0$ for the same reason. Whether torsion contributions to $H^{0,(n)}$ break the $\chi^{(n)} = 0$ result is open.

2. **d-frame–valued Gauss–Bonnet.** The formula above is for the $\mathbb{Z}$-valued shadow sheaf. The d-frame–valued $\chi$ would carry truth-side and falsity-side components (by the d-frame cohomology comparison), giving a bigraded Gauss–Bonnet. Whether $\chi^{d-frame,(n)} = 0$ still holds, or whether the d-frame structure breaks the cancellation, is an open refinement.

3. **Higher-arity predicate categories.** The hypothesis $\mathrm{cd}(\mathcal{C}^{\mathrm{op}}) \leq 1$ is load-bearing. For higher-dimensional $\mathcal{C}$, $H^2$ can be non-zero, and the Euler characteristic formula gains a $+\mathrm{rank}\,H^2$ term. The Gauss–Bonnet formula becomes $\chi = \mathrm{rank}\,H^0 - \mathrm{rank}\,H^1 + \mathrm{rank}\,H^2 - \ldots$, and whether the cancellation persists is open.
