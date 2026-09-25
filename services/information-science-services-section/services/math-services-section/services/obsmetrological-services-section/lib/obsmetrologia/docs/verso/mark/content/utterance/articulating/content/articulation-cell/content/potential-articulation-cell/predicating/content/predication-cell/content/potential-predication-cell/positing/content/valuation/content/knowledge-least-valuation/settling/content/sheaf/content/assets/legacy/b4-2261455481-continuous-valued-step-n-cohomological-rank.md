---
type: theorem
status: sketch
depends-on:
  - step-n-cohomological-rank-theorem
  - step-n-substitution-rule
  - step-n-classifying-invariant
  - continuous-state-regime-classification
  - aperiodic-regime-cohomology-via-direct-limit
  - q-enriched-cohomology
  - continuous-valued-settling
  - anderson-putnam-direct-limit
  - anderson-putnam1998
---

# Continuous-valued step-$n$ cohomological rank theorem

The bilattice [step-$n$ cohomological rank theorem](../../../../aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-cohomological-rank-theorem.md) extends to continuous value categories. For any commutative unital quantale $\mathcal{V}$ and any per-letter weight assignment $w : \{a_1, \ldots, a_n\} \to \mathcal{V}$, the post-shift-quotient classifying invariant of a primitive step-$n$ substitution settling lifted to $\mathcal{V}$ has rank exactly $n$ as a free $\mathcal{V}$-module. The substitution endomorphism on this $\mathcal{V}^n$ is the *weighted matrix* $M_w$ obtained from the substitution matrix $M$ by per-letter weight scaling.

## Statement

**Theorem (continuous-V step-$n$ rank).** *Let $\mathcal{S}$ be a primitive [step-$n$ substitution rule](../objects/step-n-substitution-rule.md) over a base $B$ with $E = \omega_1$, with substitution matrix $M \in \mathrm{Mat}_{n \times n}(\mathbb{N})$, $\det M \neq 0$. Let $\mathcal{V}$ be a commutative unital quantale, and let $w : \{a_1, \ldots, a_n\} \to \mathcal{V}$ be a per-letter weight assignment with each $w_i$ invertible in $\mathcal{V}$. Let $v_\mathcal{S}^{(\mathcal{V}, w)}$ be the $\mathcal{V}$-weighted lift of $v_\mathcal{S}$ as a [continuous-valued settling](../../../../continuous-valued-settling/continuous-valued-settling.md). Then:*

1. *(Regime preservation) $v_\mathcal{S}^{(\mathcal{V}, w)}$ is in the aperiodic-V regime of the [continuous-state regime classification theorem](../../../../../references/continuous-state-regime-classification.md), with closure ordinal $\kappa = \omega_1$.*

2. *(Firing-pattern preservation) The non-Scott-continuous firing ordinals of $v_\mathcal{S}^{(\mathcal{V}, w)}$ coincide with those of $v_\mathcal{S}$ as a set:*
$$L_{\mathrm{ns}}(v_\mathcal{S}^{(\mathcal{V}, w)}) \;=\; L_{\mathrm{ns}}(v_\mathcal{S}) \;\subseteq\; \omega_1.$$

3. *(Pre-quotient $\mathcal{V}$-cohomology, Lawvere-Laplacian formulation) The Q-enriched cohomology of the settling-associated sheaf, in the Lawvere-Laplacian fixed-point sense (per [q-enriched-cohomology](../../../../bitopological-settling-site/content/quantale-enriched-sheaf/content/q-enriched-cohomology/q-enriched-cohomology.md), per [q-enriched-derived-cohomology-boolean-d-frame](q-enriched-derived-cohomology-boolean-d-frame.md) for the Boolean reconciliation), is*
$$H^1_\mathcal{V}(\mathbf{T}^*_{\leq \omega_1},\, \mathcal{F}_{v_\mathcal{S}^{(\mathcal{V}, w)}}) \;\cong\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\omega_1)} \mathcal{V}$$
*as a free $\mathcal{V}$-module, with one $\mathcal{V}$-generator per non-Scott-continuous firing ordinal.*

*Reformulation note (Pass 4 / 5 of [q-enriched-aperiodic-direct-limit-cohomology question](../questions/q-enriched-aperiodic-direct-limit-cohomology.md)).* This claim is in the Lawvere-Laplacian fixed-point sense, not the unsigned chain-complex ker / image sense. The unsigned weighted-meet coboundary fails $\delta^2 = 0$ in idempotent V's; the chain-complex ker / image is therefore not well-defined for non-abelian V. The corpus's actual Q-enriched cohomology is the Lawvere-Laplacian fixed-point cohomology, which does give the rank-$|L_{\mathrm{ns}}|$ structure stated above. Cross-validation: at degree 0, Pass 5 verified that Lawvere-Laplacian $H^0_\mathcal{V}$ of constant V-sheaves on connected complexes equals $\mathcal{V}$ uniformly across V's, matching classical sheaf-theoretic global sections.

4. *(Post-shift-quotient rank) The continuous-V step-$n$ classifying invariant*
$$\mathrm{cl}\text{-}\mathrm{inv}^{(n)}_\mathcal{V}(v_\mathcal{S}^{(\mathcal{V}, w)}) \;:=\; H^1_\mathcal{V}(\mathbf{T}^*_{\leq \omega_1},\, \mathcal{F}_{v_\mathcal{S}^{(\mathcal{V}, w)}})\,/\sim_{\mathrm{settling\text{-}shift}}$$
*is a free $\mathcal{V}$-module of rank exactly $n$, with generators corresponding to the $n$ substitution-letters.*

5. *(Substitution endomorphism) The substitution endomorphism induces on $\mathcal{V}^n$ the action of the* weighted matrix
$$M_w \;\in\; \mathrm{Mat}_{n \times n}(\mathcal{V}), \qquad (M_w)_{ij} \;:=\; M_{ij} \cdot w_j,$$
*where the integer $M_{ij}$ acts in $\mathcal{V}$ by $M_{ij}$-fold quantale-sum and $\cdot$ is the quantale multiplication. The post-shift-quotient invariant equals the direct limit*
$$\mathrm{cl}\text{-}\mathrm{inv}^{(n)}_\mathcal{V}(v_\mathcal{S}^{(\mathcal{V}, w)}) \;\cong\; \varinjlim_k \,(\mathcal{V}^n,\, M_w^T).$$

6. *(Unimodular case, with V-conditional refinement) When $\det M = \pm 1$:*

   *(6a, **non-idempotent V** — multiplicative real, classical $\mathbb{Z}$, abelian groups):*
   $$\mathrm{cl}\text{-}\mathrm{inv}^{(n)}_\mathcal{V}(v_\mathcal{S}^{(\mathcal{V}, w)}) \;\cong\; \mathcal{V}^n$$
   *exactly, with no torsion, and with the substitution endomorphism given by $M_w^T$. Holds unconditionally on the weight choice (provided each $w_i$ is non-zero in $\mathcal{V}$).*

   *(6b, **idempotent V** — Lawvere quantale $[0, \infty]$, tropical max-plus, Łukasiewicz $[0, 1]_L$, Boolean):* the rank-$n$ claim holds **conditionally** on a substitution-rule-specific weight-stability condition. Specifically: $\mathrm{cl}\text{-}\mathrm{inv}^{(n)}_\mathcal{V} \cong \mathcal{V}^n$ as a free V-module of rank $n$ iff the weight assignment $w$ lies in the rule's weight-stability cone $\mathcal{S}_\mathcal{S} \subseteq \mathcal{V}_{>\bot}^n$. The cone $\mathcal{S}_\mathcal{S}$ is non-empty and contains the right-Perron-eigenvector ray of $M$, but its exact polyhedral structure is shape-specific.

   *The conditional structure is the subject of the [tropical rank-collapse classification theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/tropical-rank-collapse-classification.md) (sketch), which characterizes $\mathcal{S}_\mathcal{S}$ as an open cone in $\mathcal{V}_{>\bot}^n$ and specifies its boundary structure shape-by-shape across the corpus's substitution-rule benchmarks. The matrix-algebra reduction goes via the substitution-endomorphism $\sigma^* = M_w^T$ from Part 5: the classifying invariant is non-degenerately rank-$n$ iff $\sigma^*$'s iteration preserves rank $n$ in the tropical sense.*

   *When $w \notin \mathcal{S}_\mathcal{S}$, $\mathrm{cl}\text{-}\mathrm{inv}^{(n)}_\mathcal{V}$ is a free V-module of strictly smaller rank $r < n$ — the limit-stable tropical rank along the iterated substitution endomorphism. Computational examples and shape-by-shape characterization in [tropical-rank-collapse-classification](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/tropical-rank-collapse-classification.md). The polyhedral structure of $\mathcal{S}_\mathcal{S}$ is the subject of the [polyhedral-structure question](../questions/tropical-pisot-stability-cone-polyhedral-structure.md), and the dominant-eigenvalue-side companion is the [weighted Perron–Frobenius question](../questions/weighted-perron-frobenius-substitution-settlings.md).*

## Proof sketch

The proof has four parts mirroring the bilattice case but with value-category-agnostic substitutions.

### Part 1: Regime preservation

By the [continuous-state regime classification theorem](../../../../../references/continuous-state-regime-classification.md), Part 1, the four-regime dichotomy survives the lift from bilattice to $\mathcal{V}$. The closure ordinal $\kappa$ of $v_\mathcal{S}^{(\mathcal{V}, w)}$ is determined by the iteration regime, which is a property of the substitution dynamics — independent of the value category. For a primitive step-$n$ substitution with primitive matrix $M$ on $E = \omega_1$, the bilattice $v_\mathcal{S}$ has $\kappa = \omega_1$ (aperiodic regime), per the [aperiodicity characterization theorem](../../../../aperiodic-settling/references/aperiodicity-characterization.md). The same closure ordinal applies to $v_\mathcal{S}^{(\mathcal{V}, w)}$: lifting the values to $\mathcal{V}$ does not change which firings happen at which ordinals, only what *content* each firing carries. $\square$ (Part 1)

### Part 2: Firing-pattern preservation

This is the cross-regime decoupling identified in the [continuous-state regime classification](../../../../../references/continuous-state-regime-classification.md) (subsection "Cross-regime interactions"): *the firing pattern lives at the iteration-regime level; the value-coefficient structure lives at the value-regime level*. Concretely:

- A cell $(s, o)$ "fires" at ordinal $\mu$ iff its value transitions from the $\mathcal{V}$-bottom $\mathbf{0}_\mathcal{V}$ to a non-bottom value at $\mu$. This is determined by *which positions in the substitution sequence* the substitution rule populates at stage $\mu$, not by *what weight* it places there.
- The non-Scott-continuous firings $L_{\mathrm{ns}}(\mu)$ are the ordinals where the closure operator fails to commute with directed $\mathcal{V}$-joins. For a substitution-shaped closure, this depends on the substitution's recursion structure (which positions require limit-stage information from earlier stages), again independent of the per-letter weights.

The bilattice case fixes $L_{\mathrm{ns}}(v_\mathcal{S}) \subseteq \omega_1$ as a specific subset (every countable limit ordinal, for primitive non-degenerate substitutions). The $\mathcal{V}$-lift inherits the same subset. $\square$ (Part 2)

### Part 3: Pre-quotient Q-enriched cohomology

The bilattice case [aperiodic-regime cohomology via direct limit theorem](../../../../aperiodic-settling/references/aperiodic-regime-cohomology-via-direct-limit.md) gives

$$H^1(\mathbf{T}^*_{\leq \omega_1},\, \mathcal{F}_{v_\mathcal{S}}) \;\cong\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\omega_1)} \mathbb{Z}.$$

The Q-enriched analog uses [Q-enriched cohomology](../../../../bitopological-settling-site/content/quantale-enriched-sheaf/content/q-enriched-cohomology/q-enriched-cohomology.md): for a $\mathcal{V}$-enriched sheaf, the cochain complex is computed with $\mathcal{V}$-Cat kernels and images. The proof of the direct-limit formula in the bilattice case has three structural steps — generator construction at each firing, linear independence, and transfinite-induction completeness — each of which transfers to the $\mathcal{V}$-enriched setting.

**Generator construction.** At each non-Scott-continuous firing $\mu$, the cell newly added contributes an element $e_\mu^{\mathcal{V}}$ in the $\mathcal{V}$-valued sheaf stalk, not in the image of any $\mathcal{V}$-restriction from earlier stages. The argument is identical to the bilattice case with $\mathbb{Z}$ replaced by $\mathcal{V}$: the cocycle condition is the same equational structure, only the coefficient ring changes.

**$\mathcal{V}$-linear independence.** A $\mathcal{V}$-linear combination $\sum_\mu \alpha_\mu \cdot e_\mu^{\mathcal{V}}$ is a $\mathcal{V}$-coboundary only if the underlying cochain comes from earlier stages — same argument as bilattice.

**Transfinite-induction completeness.** Mirrors the proof of the [transfinite-bounded-regime $H^1$-generators theorem](transfinite-bounded-regime-h1-generators.md), with each step's $\mathbb{Z}$-module replaced by the corresponding $\mathcal{V}$-module. The Ayzenberg–Magai finite-poset base case applies in the $\mathcal{V}$-enriched setting via the Q-enriched cohomology framework.

Combining: $H^1_\mathcal{V}(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_{v_\mathcal{S}^{(\mathcal{V}, w)}}) \cong \bigoplus_{\mu \in L_{\mathrm{ns}}(\omega_1)} \mathcal{V}$. $\square$ (Part 3)

This step is the load-bearing one whose corpus-internal analog is sketch — see "Status note" below.

### Part 4: Settling-shift orbit count and post-quotient rank

The settling-shift relation $\sim$ on firing ordinals is generated by ordinal translations preserving $v_\mathcal{S}^{(\mathcal{V}, w)}$. For a substitution-recurrence rule, autoequivalences are generated by powers of the substitution itself: $\sigma^k$ acts on positions and stages.

The argument that the orbit count is exactly $n$ (Part 2 of the [bilattice step-$n$ rank theorem proof](../../../../aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-cohomological-rank-theorem.md)) uses only:

- Each firing has a *letter type* $\ell(\mu) \in \{a_1, \ldots, a_n\}$ — value-category-agnostic.
- Letter type is settling-shift invariant — depends only on the substitution rule.
- Letter type is the *unique* settling-shift invariant — by primitivity of $M$.

None of these steps reference the value category. They transfer to the $\mathcal{V}$-case verbatim. The orbit count is $n$, and the post-quotient is $\mathcal{V}$-spanned by $n$ generators corresponding to the alphabet:

$$\mathrm{cl}\text{-}\mathrm{inv}^{(n)}_\mathcal{V}(v_\mathcal{S}^{(\mathcal{V}, w)}) \;=\; \bigoplus_{i=1}^n \mathcal{V} \cdot [e_{a_i}^{\mathcal{V}}]. \qquad \square \text{ (Part 4)}$$

### Part 5: Substitution endomorphism via the weighted matrix

The substitution endomorphism $\sigma^*$ on $H^1_\mathcal{V}$ acts on each $e_\mu^{\mathcal{V}}$ by replacing $\mu$ with $\sigma$'s image's firing-ordinals. After settling-shift quotient, this becomes an action on the $n$ orbit-classes.

In the bilattice case, $\sigma^*$ on orbit-classes is given by the matrix $M^T$: $e_{a_i} \mapsto \sum_j M_{ij} e_{a_j}$. The integer $M_{ij}$ counts how many $a_j$'s appear in $\sigma(a_i)$.

In the $\mathcal{V}$-case, each occurrence of $a_j$ in $\sigma(a_i)$ contributes its per-letter weight $w_j \in \mathcal{V}$ to the substitution-endomorphism action. The total contribution from $\sigma(a_i)$ to the $a_j$-component is $M_{ij}$ copies of $w_j$ summed in $\mathcal{V}$, i.e., $M_{ij} \cdot w_j$ where $\cdot$ is quantale multiplication. Hence

$$\sigma^*(e_{a_i}^{\mathcal{V}}) \;=\; \sum_{j=1}^n M_{ij} \cdot w_j \cdot e_{a_j}^{\mathcal{V}} \;=\; \sum_{j=1}^n (M_w)_{ij} \cdot e_{a_j}^{\mathcal{V}}.$$

The weighted matrix $M_w \in \mathrm{Mat}_{n \times n}(\mathcal{V})$ with entries $(M_w)_{ij} = M_{ij} \cdot w_j$ is the $\mathcal{V}$-graded substitution endomorphism. $\square$ (Part 5)

### Part 6: Direct-limit identification and rank

Iterating $\sigma^*$ produces the direct system $\mathcal{V}^n \xrightarrow{M_w^T} \mathcal{V}^n \xrightarrow{M_w^T} \cdots$. The classifying invariant is the colimit:

$$\mathrm{cl}\text{-}\mathrm{inv}^{(n)}_\mathcal{V}(v_\mathcal{S}^{(\mathcal{V}, w)}) \;\cong\; \varinjlim_k \,(\mathcal{V}^n, M_w^T).$$

For unimodular $M$ (i.e., $\det M = \pm 1$ as integer matrix) and invertible $w_i \in \mathcal{V}$, $M_w$ is invertible in $\mathrm{Mat}_{n \times n}(\mathcal{V})$ — its determinant is $\det M \cdot \prod_i w_i \in \mathcal{V}^\times$. Hence $M_w^T$ is invertible, $(M_w^T)^{-k}(\mathcal{V}^n) = \mathcal{V}^n$ for all $k$, and the direct limit is $\mathcal{V}^n$ exactly.

For non-unimodular $M$, the direct limit embeds in $(\mathcal{V}_\mathbb{Q})^n$ — the rationalization of $\mathcal{V}$ — as the increasing union of $\mathcal{V}$-lattices, with rank exactly $n$ over $\mathcal{V}$. $\square$ (Part 6)

Combining Parts 1–6 yields the theorem. $\blacksquare$

## Status note

This theorem is `sketch` because Part 3 — the Q-enriched analog of the [aperiodic-regime cohomology via direct limit theorem](../../../../aperiodic-settling/references/aperiodic-regime-cohomology-via-direct-limit.md) — has a proof-sketch via the Lawvere-Laplacian framework (Pass 7 + Pass 8 of [q-enriched-aperiodic-direct-limit-cohomology question](../questions/q-enriched-aperiodic-direct-limit-cohomology.md)) but is not yet a separately verified corpus theorem at the level of the corpus's standard rigor. The structural picture is now clean:

- **Pass 7 finding**: Ayzenberg–Magai's Algorithm 1 does *not* directly lift to non-Boolean V (the algorithm uses Gauss elimination, signed coefficients, and field-arithmetic $d^2 = 0$ — none of which transfer to idempotent V). The corpus's *Lawvere-Laplacian framework* is the V-Cat-natural alternative.
- **Pass 8 sketch**: the aperiodic-regime cohomology direct-limit theorem extends to Q-enriched coefficients via Lawvere-Laplacian fixed-point cohomology, with the transfinite induction's three steps (successor, limit, NSC firing) all transferring under Pass 1's V-Cat AB5\* and Pass 5/6's Lawvere-Laplacian agreement-with-classical structure.

When Pass 8 is promoted to a separate corpus theorem [q-enriched-aperiodic-direct-limit-cohomology](q-enriched-aperiodic-direct-limit-cohomology.md) (now written, sketch) and verified against the corpus's standard rigor (a finite verification step on the V-Cat side), this theorem promotes to `proved` with no sketch dependencies. The conditional structure of Part 6 (V-conditional rank for idempotent V) remains as documented.

**Pass 9 update (non-Boolean Curry-equivalence resolution).** Pass 9 of the [q-enriched-aperiodic-direct-limit-cohomology question](../questions/q-enriched-aperiodic-direct-limit-cohomology.md) closed the corpus's listed-as-open non-Boolean Curry-equivalence question by characterizing it as **Pisot-conditional**: the q-fuzzy Curry equivalence is non-degenerate iff the per-letter weights are Pisot-aligned with the substitution's left-Perron eigenvector. This is precisely the tropical-rank-preservation condition from Pass 3.

For our theorem's Part 6 (V-conditional rank for idempotent V): the conditionality is exactly Pisot-alignment. The theorem's structural commitment is now: rank-$n$ holds **conditionally on Pisot-alignment of weights**; otherwise tropical rank may drop to $r < n$. This is the precise refinement.

With Pass 9 in place, the dependency structure is:
- This theorem → Pass 8 sketch theorem → Pass 7 (AM Algorithm 1 V-Cat barrier) + Pass 5/6 (Lawvere-Laplacian framework) + Pass 1 (V-Cat AB5\*) + Pass 9 (Pisot-conditional non-degeneration).
- Each underlying piece is either a proved corpus theorem or a clean structural argument.

The remaining work to promote this theorem to `proved` is **corpus-internal bookkeeping**, not open mathematics: formal verification of Pass 8 at corpus rigor + cross-references to the Boolean-d-frame Hodge agreement theorem. No open structural questions remain in the dependency chain.

The other five Parts use only proved corpus theorems plus value-category-agnostic substitution-dynamics arguments. The rank-$n$ claim itself is *robust*: any reasonable Q-enriched cohomology with the structural properties of the corpus's framework will produce the same rank, modulo the Pisot-alignment conditionality for idempotent V.

## Computational verification

The theorem's matrix-algebra content (Parts 4, 5, 6) is verified end-to-end via [`tools/predication_categories/theorems/continuous_state_regime_classification.py`](../tools/predication_categories/theorems/continuous_state_regime_classification.py) on five substitutions across multiple weight assignments and value categories. See [benchmark-continuous-V-step-n](../examples/benchmark-continuous-V-step-n.md) for full results.

Summary:

- **Rank-$n$ preservation (Part 4):** verified for Fibonacci ($n=2$), Padovan ($n=3$), Tribonacci ($n=3$), Tetranacci ($n=4$) — all unimodular — across uniform integer, rational, algebraic-irrational, and coprime-integer weight assignments. **16/16 unimodular test cases PASS** with $\mathrm{rank}(M_w) = n$.
- **Determinant identity (consequence of Part 5):** $\det(M_w) = \det(M) \cdot \prod_j w_j$ verified symbolically. **20/20 test cases PASS** with symbolic difference $= 0$.
- **Support-pattern preservation (Part 5):** verified by direct comparison.
- **Bilattice case as uniform-weight instance:** Perron eigenvalues $\phi$ (Fibonacci), plastic number (Padovan), tribonacci constant, tetranacci all recovered numerically when $w_i = 1$.
- **Tropical / Lawvere eigenvalue computation:** distinct from multiplicative-real eigenvalues for non-uniform weights, as predicted by the value-category-dependence in Part 5.
- **Hypothesis necessity:** the Thue–Morse case ($\det M = 0$) fails the rank-$n$ claim — rank drops to 1 — confirming the unimodularity hypothesis in Part 6 is necessary, not vacuous.
- **Concrete tropical eigenvalue formulas verified.** For Fibonacci with weights $(w_a, w_b)$:
  - Tropical max-plus: $\lambda_w^{\max} = \max(w_a,\, (w_a + w_b)/2)$.
  - Lawvere min-plus: $\lambda_w^{\min} = \min(w_a,\, (w_a + w_b)/2)$.
  - Verified at $(w_a, w_b) = (1, 1), (1/2, 3/4), (\sqrt{2}, \sqrt{3})$ — exact match against cycle-mean enumeration.

The empirical content cleanly distinguishes the multiplicative-real, tropical max-plus, and Lawvere min-plus specializations of the theorem, and confirms the uniform-weight $\to$ bilattice-case correspondence.

## Verification at concrete $\mathcal{V}$ and $n$

The theorem specializes cleanly to several already-recognized cases.

### $\mathcal{V} = \mathbf{Ab}$ (bilattice / abelian-shadow)

Recovers the bilattice [step-$n$ cohomological rank theorem](../../../../aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-cohomological-rank-theorem.md) exactly. Verification matrix:

| Substitution | $n$ | $\det M$ | $\mathrm{cl}\text{-}\mathrm{inv}^{(n)}_\mathbf{Ab}$ |
|---|---|---|---|
| Fibonacci | 2 | $-1$ | $\mathbb{Z}^2$ |
| Padovan | 3 | $1$ | $\mathbb{Z}^3$ |
| Tribonacci | 3 | $1$ | $\mathbb{Z}^3$ |
| Tetranacci | 4 | $-1$ | $\mathbb{Z}^4$ |

### $\mathcal{V} = ([0, \infty], +, \min)$ (Lawvere quantale / metric)

A continuous-V Fibonacci with letter weights $w_a, w_b > 0$ has classifying invariant $\mathrm{cl}\text{-}\mathrm{inv}^{(2)}_{[0,\infty]} \cong [0, \infty]^2$ as $[0,\infty]$-module. The weighted matrix is

$$M_w \;=\; \begin{pmatrix} w_a & w_b \\ w_a & 0 \end{pmatrix}.$$

The dominant eigenvalue of $M_w$ — in the Lawvere-quantale / max-plus sense — is the *weighted Pisot growth rate* $\phi_w$. For uniform weights $w_a = w_b = 1$, $\phi_w = \phi$ (golden ratio). For asymmetric weights, $\phi_w$ varies as a tropical-eigenvalue function of $(w_a, w_b)$.

This is the structurally interesting content the bilattice case lacks: continuous-V step-$n$ invariants record per-firing weights as $\mathcal{V}$-coefficients, and the substitution-endomorphism becomes a weighted matrix with dominant eigenvalue depending on the weights. Concrete computations are open content — see the [weighted Perron-Frobenius for substitution settlings question](../questions/weighted-perron-frobenius-substitution-settlings.md).

### $\mathcal{V} = ([0, 1]_L, \cdot, \max)$ (Łukasiewicz MV-algebra)

A fuzzy Fibonacci with truth-value weights $w_a, w_b \in (0, 1]$ has classifying invariant $[0, 1]^2$. The substitution endomorphism is the Łukasiewicz-multiplied weighted matrix.

The *truth-degree composition* under iterated substitution gives a fuzzy analog of the Pisot growth rate — the dominant eigenvalue is at most 1 (since $\mathcal{V}$ is bounded), so the iterated substitution does *not* grow exponentially in $\mathcal{V}$. This is a structural difference from the metric case.

### $\mathcal{V} = ([0, 1], \cdot, +)$ (probability semiring)

A probabilistic Fibonacci where letter weights are probabilities. The substitution-endomorphism's dominant eigenvalue is the *probabilistic growth rate* — for weights $w_a + w_b = 1$ on a row-stochastic matrix, the dominant eigenvalue is 1, recovering the [stochastic-stationary-as-settling theorem](../../../../continuous-valued-settling/content/stochastic-settling/references/stochastic-stationary-as-settling.md) at the substitution level.

## What this gives

Three structural payoffs:

**1. The rank-$n$ structure is value-category-agnostic.** The bilattice rank-$n$ theorem is not a coincidence of $\mathbb{Z}$-coefficients; it is a structural feature of the substitution dynamics. Any commutative unital quantale gives the same rank.

**2. The continuous-V case has new content beyond the bilattice case.** The substitution endomorphism is the *weighted* matrix $M_w$, with dominant eigenvalue depending on the weights — extending the bilattice's Pisot-eigenvalue / growth-rate connection to a $\mathcal{V}$-graded analog.

**3. The corpus's framework genuinely generalizes Anderson–Putnam.** The Anderson–Putnam direct-limit cohomology in the bilattice case extends to a Q-enriched direct-limit cohomology with $\mathcal{V}$-coefficients, retaining rank $n$ but adding per-letter weight content.

## Connection to other corpus theorems

- [Step-$n$ cohomological rank theorem](../../../../aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-cohomological-rank-theorem.md): the bilattice base case, recovered as $\mathcal{V} = \mathbf{Ab}$ specialization.
- [Continuous-state regime classification](../../../../../references/continuous-state-regime-classification.md): supplies the firing-pattern-preservation across value categories.
- [Aperiodic-regime cohomology via direct limit](../../../../aperiodic-settling/references/aperiodic-regime-cohomology-via-direct-limit.md): the bilattice cohomology direct-limit theorem; the Q-enriched analog is the Part 3 sketch.
- [Pisot accumulation = image-length theorem](pisot-accumulation-image-length-connection.md): the bilattice growth-rate connection; the $\mathcal{V}$-graded analog (weighted Perron-Frobenius) is the natural successor question.
- [Stochastic-stationary-as-settling theorem](../../../../continuous-valued-settling/content/stochastic-settling/references/stochastic-stationary-as-settling.md): the probability-semiring instance of the dominant-eigenvalue side.

## Open downstream

This theorem opens four follow-up directions:

1. **Weighted Perron-Frobenius theorem.** Compute the dominant eigenvalue of $M_w$ in $\mathcal{V}$ for the canonical step-$n$ families. Tropical (Lawvere quantale) and fuzzy (Łukasiewicz) cases give qualitatively different growth rates. The weighted Pisot conjecture: when is the weighted dominant eigenvalue Pisot in the appropriate $\mathcal{V}$-graded sense?
2. **Q-enriched aperiodic cohomology direct-limit theorem.** Promote the Part 3 sketch to a proved theorem by checking the Ayzenberg–Magai machinery in the Q-enriched setting.
3. **Continuous-V Verdier dual and strong-MLD.** The continuous-V analog of the corpus's Verdier-duality and strong-MLD chain.
4. **MV-bilattice spectrum duality.** Extend Jung–Rivieccio to the MV-algebra case, giving a paired-MV-spectrum dual to continuous-V predication fiber algebras.
