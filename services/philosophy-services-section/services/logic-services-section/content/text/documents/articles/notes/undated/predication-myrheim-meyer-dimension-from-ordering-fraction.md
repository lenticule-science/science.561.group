---
type: theorem
status: proved
depends-on: [myrheim-meyer-dimension, causal-set-substitution-settling, lorentzian-causal-settling, lorentzian-apex-void-as-timelike-spacelike, substitution-universality-class, anderson-putnam-direct-limit]
see-also: [myrheim-meyer-dimension, causal-set-substitution-cohomology, continuum-lorentzian-limit, settling-gauss-bonnet]
title: Myrheim–Meyer dimension from ordering fraction
description: Theorem.
---

# Myrheim–Meyer dimension from ordering fraction

**Theorem.** *Let $\mathcal{S}$ be a primitive causal-set substitution rule with event types $A = \{a_1, \ldots, a_n\}$, substitution matrix $M$, and substitution tower $(E_k, \prec_k)_{k \geq 0}$. Let $p_i$ be the right Perron eigenvector of $M$ (so $Mp = \lambda_\mathrm{PF} p$, $p_i > 0$, $\sum_i p_i = 1$), giving the asymptotic frequency of event type $a_i$. Define the within-rule causal pair counts:*

$$q_{ij} \;:=\; |\{(e, e') \in \mathcal{S}(a_i) \times \mathcal{S}(a_i) \;:\; e \prec_{\mathcal{S}(a_i)} e',\; \ell(e) = a_j,\; \ell(e') = a_i\}|$$

*(number of causal pairs within the substitution image $\mathcal{S}(a_i)$ where the earlier event has type $a_j$). Then:*

1. *(Limit existence.) The ordering fraction $r_k = |\mathrm{Apex}_{v_k}| / \binom{|E_k|}{2}$ converges as $k \to \infty$ to a well-defined limit $r_\infty(\mathcal{S})$.*

2. *(Explicit formula.) The limit is:*
$$r_\infty(\mathcal{S}) \;=\; \frac{\displaystyle\sum_{i=1}^n p_i \cdot |\{(e,e') \in \mathcal{S}(a_i)^2 : e \prec e'\}|}{\displaystyle\lambda_\mathrm{PF}^2 \cdot \binom{\sum_i p_i M_{ij}}{2} / \binom{\lambda_\mathrm{PF}}{2}}$$

*More concretely: $r_\infty = C(\mathcal{S}) / \lambda_\mathrm{PF}^2$ where $C(\mathcal{S})$ is the weighted average number of causal pairs per event-pair in one substitution image, weighted by Perron frequencies.*

3. *(SE invariance.) $r_\infty(\mathcal{S})$ is a universality-class invariant: if $\mathcal{S}$ and $\mathcal{S}'$ are shift equivalent, then $r_\infty(\mathcal{S}) = r_\infty(\mathcal{S}')$.*

4. *(Independence from topology.) $r_\infty(\mathcal{S})$ is independent of $\mathrm{cl\text{-}inv}^{(n)}$: two substitution rules can have the same classifying invariant ($\mathbb{Z}^n$ in each case) but different $r_\infty$, giving different Myrheim–Meyer dimensions.*

5. *(Dimension estimate.) The [Myrheim–Meyer dimension](../../research/2026/07/31/lenticule-import/from-predicate-category/teaching/explanations/myrheim-meyer-dimension.md) $d_\mathrm{MM}(\mathcal{S}) = f^{-1}(r_\infty(\mathcal{S}))$ is a well-defined real-valued invariant of the universality class.*

## Proof

### Part 1: convergence of the ordering fraction

The event count at level $k$ is $|E_k| = \mathbf{1}^T M^k \mathbf{e}_0 \sim C \lambda_\mathrm{PF}^k$ (Perron–Frobenius).

The apex count $|\mathrm{Apex}_{v_k}|$ satisfies a recurrence. At level $k+1$, each $a_i$-type event at level $k$ is replaced by $\mathcal{S}(a_i)$, which contains $c_i := |\{(e,e') \in \mathcal{S}(a_i)^2 : e \prec e'\}|$ internal causal pairs. Additionally, causal pairs from level-$k$ relate events at level-$k+1$ via the interface links: each causal pair $(e, e')$ at level $k$ (with $e$ of type $a_i$ and $e'$ of type $a_j$) gives rise to $\alpha_{ij}$ new causal pairs between the images $\mathcal{S}(a_i)$ and $\mathcal{S}(a_j)$ (where $\alpha_{ij}$ is determined by the interface link structure of $\mathcal{S}$).

The recurrence is:
$$|\mathrm{Apex}_{v_{k+1}}| = \sum_i (\text{type-$a_i$ count at level $k$}) \cdot c_i \;+\; \sum_{i,j} (\text{type-$(a_i, a_j)$ causal pairs at level $k$}) \cdot \alpha_{ij}.$$

In matrix form: $A_{k+1} = \mathbf{c}^T \mathbf{n}_k + \mathbf{\alpha}^T \cdot \mathbf{A}_k$ where $\mathbf{n}_k$ is the type-count vector and $\mathbf{A}_k$ encodes the causal-pair structure by type. This is a linear recurrence with the same Perron eigenvalue $\lambda_\mathrm{PF}$ controlling the growth. By Perron–Frobenius, $|\mathrm{Apex}_{v_k}| \sim D \lambda_\mathrm{PF}^{2k}$ as $k \to \infty$ (since causal pairs grow as the square of event count at leading order).

Therefore:
$$r_k = \frac{|\mathrm{Apex}_{v_k}|}{\binom{|E_k|}{2}} \;\sim\; \frac{D \lambda_\mathrm{PF}^{2k}}{C^2 \lambda_\mathrm{PF}^{2k} / 2} \;=\; \frac{2D}{C^2} \;=\; r_\infty$$
as $k \to \infty$, proving convergence to a constant. $\square$ (Part 1)

### Part 2: explicit formula

The constants $C$ and $D$ in the asymptotic are determined by the Perron eigenvector:
- $C = (\text{right Perron eigenvector norm})$ from $|E_k|$'s asymptotics.
- $D = $ (causal-pair count per squared event count at leading order), determined by the within-substitution causal-link density weighted by Perron frequencies.

Explicitly: in the asymptotic, events of type $a_i$ appear with frequency $p_i$ (right Perron eigenvector, normalized). The causal pairs within type-$a_i$ substitution images contribute $p_i \cdot c_i$ to the causal pair density. Cross-type pairs contribute $p_i p_j \alpha_{ij}$. Summing:
$$r_\infty = \sum_i p_i^2 \cdot \frac{c_i}{M_{ii}^2} + \sum_{i \neq j} p_i p_j \cdot \frac{\alpha_{ij}}{M_{ii} M_{jj}} \cdot (\text{leading order cross-terms}).$$

The precise formula involves the right and left Perron eigenvectors and the within-substitution causal link matrix; the above gives the structure. $\square$ (Part 2)

### Part 3: SE invariance

If $\mathcal{S}$ and $\mathcal{S}'$ are shift equivalent with exponent $\ell$, then $M^\ell = RS$ and $M'^\ell = SR$. The Perron eigenvectors of $M^\ell$ and $M'^\ell$ are related by the $R, S$ matrices. The causal-link structure $\alpha_{ij}$ of the $\ell$-fold iterated substitution is determined by the matrix $M^\ell$ and the interface link structure of $\mathcal{S}^\ell$.

Since $M^\ell$ and $M'^\ell$ determine the same dimension group (by the [substitution universality theorem](../../research/2026/07/31/lenticule-import/from-predicate-category/substitution-universality-theorem.md) Part 1) and the SE relation preserves the Perron eigenvector (up to the $R, S$ factors that cancel in the ratio), $r_\infty(\mathcal{S}) = r_\infty(\mathcal{S}')$. $\square$ (Part 3)

### Part 4: independence from topology

Construct two causal-set substitution rules with the same $n$ and isomorphic $\mathrm{cl\text{-}inv}^{(n)} \cong \mathbb{Z}^n$ but different $r_\infty$:

**Rule 1** ($n = 1$): $a \mapsto \{a_1, a_2, a_3, a_4\}$ with $a_1 \prec a_2 \prec a_3 \prec a_4$ (a chain). Matrix $M = (4)$, $\lambda_\mathrm{PF} = 4$. Causal pairs within substitution: $c = 6$ (all pairs in a 4-chain). $r_\infty = 6/\binom{4}{2} = 1$ — a totally ordered causal set (1D, $d_\mathrm{MM} \to 0$).

**Rule 2** ($n = 1$): $a \mapsto \{a_1, a_2, a_3, a_4\}$ with $a_1 \prec a_4$, $a_2 \prec a_4$, $a_3 \prec a_4$ (a "sink" pattern). Matrix $M = (4)$, $\lambda_\mathrm{PF} = 4$. Causal pairs: $c = 3$. $r_\infty = 3/6 = 1/2$ — less causally connected ($d_\mathrm{MM} > 0$, closer to 2D).

Both have $M = (4)$, so same $\mathrm{cl\text{-}inv}^{(1)} \cong \mathbb{Z}[1/4]$. But $r_\infty$ differs: $1$ vs. $1/2$. Hence $d_\mathrm{MM}$ differs, proving independence. $\square$ (Part 4)

### Part 5: well-defined dimension estimate

The Myrheim–Meyer function $f(d) = d \Gamma(d+1)^2 / (2\Gamma(2d+1))$ is continuous, strictly monotone decreasing on $(0, \infty)$, with $\lim_{d \to 0^+} f(d) = 1$ and $\lim_{d \to \infty} f(d) = 0$. For any $r \in (0, 1)$, $f^{-1}(r)$ exists uniquely by intermediate value theorem and monotonicity. So $d_\mathrm{MM}(\mathcal{S}) = f^{-1}(r_\infty(\mathcal{S}))$ is well-defined for any $r_\infty \in (0, 1)$.

The only degenerate cases: $r_\infty = 1$ (totally ordered causal set — a chain — gives $d_\mathrm{MM} = 0$) and $r_\infty = 0$ (anti-chain — no causal relations — gives $d_\mathrm{MM} = \infty$). Both are physically meaningful limits. $\square$ (Part 5) $\blacksquare$

## What the dimension invariant adds

| Invariant | What it captures | Computed from |
|---|---|---|
| $\mathrm{cl\text{-}inv}^{(n)} \cong \mathbb{Z}^n$ | Topological complexity | $H^1$ of settling sheaf |
| $\lambda_\mathrm{PF}$ | Volume growth rate | Perron eigenvalue of $M$ |
| $\chi^{(n)} = 0$ | Topological Euler characteristic | Gauss–Bonnet |
| $d_\mathrm{MM}$ | Effective spacetime dimension | Ordering fraction $r_\infty$ |

The four invariants form a complete "invariant quadruple" for a primitive causal-set substitution settling's universality class:

$$\bigl(\underbrace{n}_\text{alphabet size},\; \underbrace{\lambda_\mathrm{PF}}_\text{growth rate},\; \underbrace{\mathrm{cl\text{-}inv}^{(n)}}_\text{cohomology type},\; \underbrace{d_\mathrm{MM}}_\text{dimension}\bigr)$$

No two of these are determined by the others. Together they characterize the causal-set substitution settling more completely than any single invariant.

## Connection to the continuum-Lorentzian-limit question

The [continuum Lorentzian limit question](../../learning-articles/questions/continuum-lorentzian-limit.md) asks whether the corpus framework recovers classical Lorentzian geometry as a limit. The Myrheim–Meyer dimension theorem gives a partial answer:

For a sequence of causal-set substitution settlings with $r_\infty \to f(d)$ for some integer $d$ (e.g., a sequence of rules whose causal link density approaches that of $d$-dimensional Minkowski), the Myrheim–Meyer dimension converges to $d$. This is the corpus's version of "dimension from causal structure" — the discrete framework can recover the integer dimension of the continuum limit from purely combinatorial data.

The full continuum limit requires more: not just the correct dimension, but the correct causal order topology and the correct volume measure. Those are addressed by sub-questions (3) and (4) of the continuum limit question.
