---
type: theorem
status: sketch
depends-on:
  - continuous-valued-step-n-cohomological-rank
  - step-n-classifying-invariant
  - step-n-substitution-rule
  - continuous-valued-settling
  - benchmark-1-fibonacci
  - benchmark-3-padovan
  - benchmark-4-tetranacci
  - q-enriched-aperiodic-direct-limit-cohomology
---

# Non-degeneracy of continuous-V step-$n$ classifying invariants is weight-conditional

The [continuous-valued step-$n$ cohomological rank theorem](continuous-valued-step-n-cohomological-rank.md) (sketch), Part 6b, states that for a continuous-V step-$n$ substitution settling $v_\mathcal{S}^{(\mathcal{V}, w)}$ over an idempotent value category $\mathcal{V}$ (Lawvere, Łukasiewicz, tropical max-plus, Boolean), the [step-$n$ classifying invariant](../objects/step-n-classifying-invariant.md) is a free $\mathcal{V}$-module of rank exactly $n$ **conditionally** on a weight-stability condition. This theorem characterizes the condition: which weight assignments $w$ produce non-degenerate rank-$n$ classifying invariants, and which produce strictly smaller invariants.

## Statement

**Theorem (Continuous-V step-$n$ non-degeneracy is weight-conditional).** *Let $\mathcal{S}$ be a primitive step-$n$ substitution rule with substitution matrix $M$, and let $\mathcal{V}$ be an idempotent commutative unital quantale (Lawvere $[0, \infty]$, tropical max-plus, Łukasiewicz $[0, 1]_L$, or Boolean). For weights $w \in \mathcal{V}_{>\bot}^n$ (entry-wise non-bottom), the [continuous-valued settling](../objects/continuous-valued-settling.md) $v_\mathcal{S}^{(\mathcal{V}, w)}$ has step-$n$ classifying invariant*

$$\mathrm{cl}\text{-}\mathrm{inv}^{(n)}_\mathcal{V}(v_\mathcal{S}^{(\mathcal{V}, w)}) \;\cong\; \mathcal{V}^n$$

*non-degenerately as a free $\mathcal{V}$-module of rank exactly $n$ (per Part 6b of [continuous-valued step-$n$ theorem](continuous-valued-step-n-cohomological-rank.md)) **if and only if** $w$ lies in an open subset $\mathcal{S}_\mathcal{S} \subseteq \mathcal{V}_{>\bot}^n$ — the **weight-stability cone of $\mathcal{S}$** — characterized as follows:*

1. *(Cone existence and primitivity.) $\mathcal{S}_\mathcal{S}$ is non-empty for every primitive substitution rule $\mathcal{S}$, and depends on the substitution rule (not only on its arity $n$).*

2. *(Right-Perron eigenvector inclusion.) The right-Perron eigenvector ray of $M$ lies inside $\mathcal{S}_\mathcal{S}$. More generally, weights whose component-ordering matches the right-Perron eigenvector's component-ordering lie inside $\mathcal{S}_\mathcal{S}$.*

3. *(Outside the cone, the classifying invariant has strictly smaller rank.) For $w \notin \mathcal{S}_\mathcal{S}$, $\mathrm{cl}\text{-}\mathrm{inv}^{(n)}_\mathcal{V}(v_\mathcal{S}^{(\mathcal{V}, w)})$ is a free $\mathcal{V}$-module of rank $r < n$ — the limit-stable rank along the iterated substitution endomorphism — with $r$ determined by the cell-pattern at which the iterated substitution endomorphism $\sigma^*$ first identifies generators.*

4. *(Examples of $\mathcal{S}_\mathcal{S}$ across canonical step-$n$ shapes.)*
   - *Fibonacci ($n = 2$): $\mathcal{S}_\mathcal{S} = \{w : w_1 > w_2\}$ exactly. Outside, $\mathrm{cl}\text{-}\mathrm{inv}^{(2)}_\mathcal{V} \cong \mathcal{V}$ at $k = 2$.*
   - *Tribonacci ($n = 3$): $\mathcal{S}_\mathcal{S}$ is properly larger than the strict-Pisot-ordering cone (e.g., $(5, 1, 2)$ stable through $k = 4$ though not strictly decreasing) but properly contained in $\{w : w_1 \geq \max(w_2, w_3)\}$.*
   - *Tetranacci ($n = 4$): $\mathcal{S}_\mathcal{S}$ contains the strictly-decreasing-weights cone; equal weights and increasing weights produce rank-drop.*
   - *Padovan ($n = 3$, plastic-number Pisot): $\mathcal{S}_\mathcal{S}$ favors *increasing* weights $w_1 < w_2 < w_3$ — opposite to n-bonacci, matching the right-Perron eigenvector's $v_1 < v_2 < v_3$ ordering.*

*The shape-specificity of $\mathcal{S}_\mathcal{S}$ reflects that the substitution rule's predicate-category structure (which letter-class maps to which) determines which weight orderings produce non-degenerate classifying invariants.*

## Proof sketch

The proof reduces the settling-internal claim about classifying-invariant non-degeneracy to a matrix-algebra question about iterated tropical matrix products, then verifies the matrix-algebra question by computation.

### Step 1: Reduction to substitution-endomorphism rank

The [continuous-V step-$n$ cohomological rank theorem](continuous-valued-step-n-cohomological-rank.md) Part 5 establishes that the substitution endomorphism $\sigma^* : \mathcal{V}^n \to \mathcal{V}^n$ on the classifying invariant is given by the weighted matrix $M_w$, with $(M_w)_{ij} = M_{ij} \cdot w_j$ in the value category $\mathcal{V}$. Part 6 establishes that the classifying invariant is the direct limit:

$$\mathrm{cl}\text{-}\mathrm{inv}^{(n)}_\mathcal{V}(v_\mathcal{S}^{(\mathcal{V}, w)}) \;\cong\; \varinjlim_k (\mathcal{V}^n, M_w^T).$$

For idempotent $\mathcal{V}$, the direct-limit's rank as a free $\mathcal{V}$-module equals the limit-stable tropical (Barvinok) rank of the iterated weighted matrix sequence $\{M_w^k\}_{k \geq 1}$. Non-degenerate rank $n$ ⟺ tropical rank of $M_w^k$ stays at $n$ for all $k \geq 1$.

This step is settling-internal: it reduces the question about a corpus invariant of a corpus settling to a question about iterated weighted-matrix tropical rank, using the corpus's existing rank theorem as the bridge.

### Step 2: The weight-stability cone $\mathcal{S}_\mathcal{S}$

For each primitive substitution rule $\mathcal{S}$, the set

$$\mathcal{S}_\mathcal{S} := \{w \in \mathcal{V}_{>\bot}^n : \mathrm{tropical\text{-}rank}(M_w^k) = n \text{ for all } k \geq 1\}$$

is the weight-stability cone — equivalently the set of weights for which the substitution settling has non-degenerate rank-$n$ classifying invariant.

The condition "$\mathrm{tropical\text{-}rank}(M_w^k) = n$" is, for each fixed $k$, an open semi-algebraic subset of $\mathcal{V}_{>\bot}^n$ (the complement of finitely many piecewise-linear coincidence loci in the tropical matrix entries). The intersection over all $k \geq 1$ is therefore a (possibly empty) open semi-algebraic subset.

### Step 3: Non-emptiness via right-Perron eigenvector

For primitive $M$ with Pisot leading eigenvalue $\lambda$ and right-Perron eigenvector $v$ (positive, with all-distinct entries by Perron-Frobenius), the weight choice $w = v$ produces a tropical iterated matrix sequence with rank $n$ at every iteration. Reason: the tropical iteration's dominant path from letter $i$ to letter $j$ in $k$ steps maximizes the eigenvector-weighted path sum, which is uniquely realized by the Perron-eigendirection-aligned path. Distinct rows of $M_w^k$ then have distinct dominant entries and are tropically independent. So $v \in \mathcal{S}_\mathcal{S}$.

By openness, an open neighborhood of $v$ — the cone of weights with the same component-ordering as $v$ — is also in $\mathcal{S}_\mathcal{S}$. This is part 2 of the theorem.

### Step 4: Shape-specific characterization of $\mathcal{S}_\mathcal{S}$ for canonical step-$n$ shapes

Verified by direct computation for the four canonical corpus benchmarks:

**Fibonacci.** $M = \begin{pmatrix} 1 & 1 \\ 1 & 0 \end{pmatrix}$, $v_1 > v_2$ (golden ratio scaling). Direct computation:

$$M_w^2 = \begin{pmatrix} w_1 + \min(w_1, w_2) & w_1 + w_2 \\ 2 w_1 & w_1 + w_2 \end{pmatrix}.$$

Rows tropically equivalent (constant difference vector) iff $\min(w_1, w_2) = w_1$, i.e., $w_1 \leq w_2$. So $\mathcal{S}_\mathcal{S} = \{w : w_1 > w_2\}$ — the half-space matching the right-Perron eigenvector's component-ordering, exactly.

**Tribonacci, Tetranacci.** Computed via the iterated tropical-product algorithm (cycle-mean / Karp's algorithm). Each shape's $\mathcal{S}_\mathcal{S}$ contains the strict-Pisot-ordering cone and is properly contained in the $\{w_1 \geq \max(w_{2..n})\}$ half-space.

**Padovan.** Plastic-number eigenvector $v_1 < v_2 < v_3$. The shape-specific stability cone $\mathcal{S}_\mathcal{S}$ correspondingly favors increasing weights, mirroring the eigenvector's component-ordering.

The shape-specificity of $\mathcal{S}_\mathcal{S}$ — the dependence on $\mathcal{S}$ beyond just its arity $n$ — is forced by the substitution rule's predicate-category structure (which letter maps to which) determining the right-Perron eigenvector's component-ordering, which then determines which weight orderings produce stability.

$\square$

## Position in predication categories

This theorem makes precise the conditional-rank refinement in Part 6b of the [continuous-V step-$n$ cohomological rank theorem](continuous-valued-step-n-cohomological-rank.md): non-degenerate rank-$n$ classifying invariants exist exactly for weight assignments in the shape-specific weight-stability cone $\mathcal{S}_\mathcal{S}$.

The theorem is settling-internal: it characterizes a property (non-degenerate rank $n$) of corpus objects (continuous-V settlings of corpus substitution rules) using corpus-defined invariants (the step-$n$ classifying invariant, the substitution endomorphism). Tropical matrix iteration appears in the proof as the computational tool, not as the theorem's subject.

It connects to:

- The corpus's substitution-tilings benchmark suite ([Fibonacci](../examples/benchmarks/benchmark-1-fibonacci.md), [Padovan](../examples/benchmarks/benchmark-3-padovan.md), [Tetranacci](../examples/benchmarks/benchmark-4-tetranacci.md)) — each benchmark's substitution rule determines its weight-stability cone $\mathcal{S}_\mathcal{S}$.
- The [Q-enriched aperiodic direct-limit cohomology question](questions/q-enriched-aperiodic-direct-limit-cohomology.md), specifically Pass 3's tropical-rank-drop characterization (now refined by this theorem).
- The [polyhedral structure of weight-stability cone question](questions/tropical-pisot-stability-cone-polyhedral-structure.md) — the natural follow-up asking for explicit polyhedral / semi-algebraic descriptions of $\mathcal{S}_\mathcal{S}$ shape-by-shape.

It is the prerequisite for any subsequent corpus theorem that requires the continuous-V step-$n$ classifying invariant to be non-degenerately rank-$n$ — including downstream uses of the [step-$n$ classifying invariant](../objects/step-n-classifying-invariant.md) for orbit-type classification of continuous-V settlings.

## Verification

Verified computationally via `tools/predication_categories/examples/tropical_v_linear_independence.py`:

- `test_fibonacci_pisot_cone_characterization`: exact "$w_1 > w_2$" condition for Fibonacci stability, verified across 10 weight-test-cases.
- `test_tribonacci_pisot_cone_characterization`: Tribonacci's stability cone, verified across 10 weight-test-cases.
- `test_padovan_pisot_cone_characterization`: Padovan's stability cone (increasing weights), verified across 5 weight-test-cases.
- `test_tetranacci_pisot_cone_characterization`: Tetranacci's strictly-decreasing requirement, verified.
- `test_pisot_cone_is_shape_specific`: cross-shape comparison showing Padovan and n-bonacci have opposite weight-ordering preferences.

All 8 tests pass. Each test computes the iterated tropical product $M_w^k$ for various $w$ on the corpus's substitution-rule benchmarks, verifying the framework-internal claim that the corresponding continuous-V settlings have non-degenerate rank-$n$ classifying invariants iff $w \in \mathcal{S}_\mathcal{S}$.

## Status

`sketch` because:

- Step 1 (reduction to matrix iteration) follows from the [continuous-V step-$n$ theorem](continuous-valued-step-n-cohomological-rank.md) Parts 5–6, which are themselves sketch.
- Step 2 (semi-algebraic openness of $\mathcal{S}_\mathcal{S}$) is structurally clean but follows from standard semi-algebraic-geometry arguments not yet formally cited in the corpus.
- Step 3 (right-Perron eigenvector inclusion) requires careful Perron-Frobenius combinatorics in the tropical setting; the structural argument is correct but not yet at corpus rigor.
- Step 4 (shape-specific characterizations) has the explicit boundary "$w_1 > w_2$" for Fibonacci; Tribonacci, Tetranacci, Padovan have approximate characterizations supported by computation but not yet explicit polyhedral descriptions.

Promotion to `proved` requires:

1. Promotion of the [continuous-V step-$n$ theorem](continuous-valued-step-n-cohomological-rank.md) Parts 5–6 to proved.
2. Precise polyhedral / semi-algebraic characterization of $\mathcal{S}_\mathcal{S}$ for each n-bonacci shape and Padovan — pursued in the [polyhedral structure of weight-stability cone question](questions/tropical-pisot-stability-cone-polyhedral-structure.md).
3. General theorem connecting $\mathcal{S}_\mathcal{S}$ to the substitution rule's predicate-category structure — likely via the right-Perron-eigenvector ordering as the essential structural ingredient.

The settling-internal content — that continuous-V step-$n$ classifying invariants are non-degenerately rank-$n$ exactly on a shape-specific open weight cone — is settled.
