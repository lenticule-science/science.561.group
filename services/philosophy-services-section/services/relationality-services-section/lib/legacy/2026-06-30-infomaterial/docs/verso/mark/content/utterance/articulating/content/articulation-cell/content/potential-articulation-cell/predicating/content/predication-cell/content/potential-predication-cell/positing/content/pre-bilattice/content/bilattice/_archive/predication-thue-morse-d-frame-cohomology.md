---
type: example
status: verified
depends-on: [aperiodic-regime-d-frame-cohomology, thue-morse-substitution-settling, fibonacci-classifying-invariant, transfinite-induction-d-frame-h1-generators, step-n-and-bilattice-correspondence]
instantiates: [aperiodic-regime-d-frame-cohomology]
lineage: 5
---

# d-frame cohomology of the Thue-Morse substitution settling

The L5b instance of the [aperiodic-regime d-frame cohomology theorem](../theorems/aperiodic-regime-d-frame-cohomology.md). **Lineage 5b** instance — predication categories' first concrete d-frame $H^1$ computation in the aperiodic regime, on a substitution whose substitution matrix is **singular** (Thue-Morse's $\det M = 0$).

## d-frame $H^1$ generators

The Thue-Morse settling has substitution steps producing alternating $\mathbf{t}$ / $\mathbf{f}$ content at successive positions. At each NSC firing $\mu \in L_{\mathrm{ns}}(\omega_1)$, the d-frame generator $D_\mu$ has structure:

- For $\mu$ where the new cell is "1" (truth-positive): $D_\mu = (\mathbb{Z}, 0, \cdot, \cdot)$.
- For $\mu$ where the new cell is "0" (falsity-positive): $D_\mu = (0, \mathbb{Z}, \cdot, \cdot)$.

The d-frame $H^1$:

$$H^1_{\mathbf{dFrm}}(\mathbf{T}^*_{\leq \omega_1}, \mathbb{F}_v) \;=\; \bigoplus_{\mu \in L_{\mathrm{ns}}^+} D_\mu^{(\mathbf{t})} \;\oplus\; \bigoplus_{\mu \in L_{\mathrm{ns}}^-} D_\mu^{(\mathbf{f})}$$

with $L_{\mathrm{ns}}^+$ = truth-positive firings and $L_{\mathrm{ns}}^-$ = falsity-positive firings, partitioning $L_{\mathrm{ns}}(\omega_1)$.

## Bigraded shadow

Under the [shadow functor](../theorems/d-frame-cohomology-comparison.md), the pre-quotient shadow is:

$$\mathbb{S}(H^1_{\mathbf{dFrm}}) \;=\; \bigoplus_{\mu \in L_{\mathrm{ns}}^+} \mathbb{Z} \;\oplus\; \bigoplus_{\mu \in L_{\mathrm{ns}}^-} \mathbb{Z}$$

— two uncountable-rank components on each evidence side. After the post-quotient localization induced by the substitution's action (Perron eigenvalue $\lambda = 2$), each side becomes $\mathbb{Z}[1/2]$.

## Localization at the Perron eigenvalue

Thue-Morse's substitution matrix $M = [[1,1],[1,1]]$ has eigenvalues $2$ and $0$. The kernel direction $(1, -1)$ collapses in the cohomology direct limit; the image direction $(1, 1)$ has the substitution acting by multiplication by $2$. So the post-quotient cohomology *localizes at $2$*:

$$\check{H}^1(\Omega_{\mathrm{TM}}) \cong \mathbb{Z}[1/2]$$

(rank 1, dyadic rationals — *not* $\mathbb{Z}^2$ as a Fibonacci-template would predict). This is the published Anderson-Putnam result for Thue-Morse, verified computationally via `tools/predication_categories/examples/benchmark_1_fibonacci.py`.

## Substitution-rule self-duality

Beyond the cohomological-rank content, Thue-Morse exhibits a structural property that's predication categories' only known concrete positive case of the **substitution-rule self-duality** notion (per the [step-$n$ / bilattice cardinality coincidence theorem](../theorems/step-n-and-bilattice-correspondence.md)):

$$M_{\mathrm{TM}} \cdot \mathrm{swap} = \mathrm{swap} \cdot M_{\mathrm{TM}}$$

where $\mathrm{swap}$ is the alphabet permutation $0 \leftrightarrow 1$, which corresponds to bilattice negation under the natural labeling $0 \leftrightarrow \mathbf{f}, 1 \leftrightarrow \mathbf{t}$. Equivalently: $\sigma \circ \neg = \neg \circ \sigma$ at the substitution-matrix level. **Thue-Morse's substitution rule itself respects bilattice negation**, distinguishing it from Fibonacci, Padovan, Tribonacci, and Tetranacci (none of which exhibit this property).

This is the most concrete d-frame structural finding in predication categories' substitution-tilings benchmark suite — it survives the singular-matrix obstruction and gives Thue-Morse genuinely distinctive d-frame content.

## What this exhibits

The corpus's first concrete d-frame $H^1$ computation:

- Where the post-quotient Ab-rank is **1**, not the alphabet size $n = 2$ (singular substitution matrix).
- Where both evidence sides are non-trivially populated (truth-only firings from $1$-cells, falsity-only from $0$-cells, no $\top$-firings).
- Where the substitution-rule self-duality property holds — making Thue-Morse the unique structural-correspondence positive case.

These three features each contradict what a Fibonacci-template predicts and each is now verified.

## Position in Lineage 5b

The L5b d-frame computation, **revised** after benchmark 2's computational verification corrected the rank claim. Pairs with [thue-morse-classifying-invariant](thue-morse-classifying-invariant.md) (the post-quotient $\mathbb{Z}[1/2]$ result), [benchmark 2](benchmark-2-thue-morse.md) (the end-to-end protocol verification), and the [step-$n$ / bilattice cardinality coincidence theorem](../theorems/step-n-and-bilattice-correspondence.md) (the structural-correspondence positive case).
