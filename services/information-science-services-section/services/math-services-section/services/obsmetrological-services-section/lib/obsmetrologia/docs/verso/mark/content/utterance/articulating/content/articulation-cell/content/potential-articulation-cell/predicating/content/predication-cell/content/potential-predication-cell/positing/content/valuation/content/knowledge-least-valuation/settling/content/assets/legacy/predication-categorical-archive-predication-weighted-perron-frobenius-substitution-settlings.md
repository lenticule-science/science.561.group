---
type: question
class: bridge
status: partial
explores:
  - continuous-valued-step-n-cohomological-rank
  - pisot-accumulation-image-length-connection
  - step-n-substitution-rule
  - step-n-classifying-invariant
  - continuous-valued-settling
  - lawvere-laplacian-grothendieck-sites
---

# Weighted Perron–Frobenius for substitution settlings

> **Progress.** Sub-question (a) — the tropical max-plus eigenvalue formula for Fibonacci — has a closed-form computational verification: $\lambda_w^{\max} = \max(w_a,\, (w_a + w_b)/2)$ and the Lawvere min-plus dual $\lambda_w^{\min} = \min(w_a,\, (w_a + w_b)/2)$. Verified across multiple weight choices via [`tools/predication_categories/theorems/continuous_state_regime_classification.py`](../tools/predication_categories/theorems/continuous_state_regime_classification.py); see [benchmark-continuous-V-step-n](../examples/benchmarks/benchmark-continuous-V-step-n.md). Padovan, Tribonacci, Tetranacci tropical eigenvalues also computed (cycle-mean enumeration). Closed-form formulas for $n \geq 3$ open. Sub-questions (b)–(e) remain open.
>
> **Companion question: weight-stability for non-degenerate rank.** The structural complement to dominant-eigenvalue computation is the question of *which weight assignments produce non-degenerate continuous-V settlings*: see the [tropical rank-collapse classification theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/tropical-rank-collapse-classification.md) (sketch) and its follow-up [polyhedral structure question](tropical-pisot-stability-cone-polyhedral-structure.md). The rank-stability cone $\mathcal{S}_\mathcal{S}$ is exactly the locus where this question's dominant-eigenvalue computation produces a non-degenerate Pisot growth rate on the classifying invariant.

The [continuous-valued step-$n$ cohomological rank theorem](../theorems/continuous-valued-step-n-cohomological-rank.md) introduces the **weighted matrix** $M_w \in \mathrm{Mat}_{n \times n}(\mathcal{V})$ with entries $(M_w)_{ij} = M_{ij} \cdot w_j$ — the substitution endomorphism induced on the rank-$n$ classifying invariant by per-letter weights $w_1, \ldots, w_n \in \mathcal{V}$. The dominant eigenvalue of $M_w$ is the natural $\mathcal{V}$-graded analog of the Pisot growth rate that the bilattice [Pisot accumulation = image-length theorem](../theorems/pisot-accumulation-image-length-connection.md) characterizes for the unweighted case.

The bilattice (unweighted) case is well-developed: the dominant eigenvalue is real, characterized by Perron–Frobenius, and connects to substitution-tilings literature via the Pisot conjecture. The weighted case is structurally novel — the dominant eigenvalue takes values in $\mathcal{V}$, and its behavior depends on which quantale.

## What the corpus has

- The [continuous-valued step-$n$ cohomological rank theorem](../theorems/continuous-valued-step-n-cohomological-rank.md) (sketch): defines $M_w$ and the rank-$n$ classifying invariant.
- The [Pisot accumulation = image-length theorem](../theorems/pisot-accumulation-image-length-connection.md) (proved): the bilattice / integer-matrix Perron–Frobenius result.
- The [step-$n$ substitution rule object](../objects/step-n-substitution-rule.md) (defined): the substitution-rule machinery.
- The [continuous-valued settling object](../../continuous-valued-settling/continuous-valued-settling.md) (defined): the $\mathcal{V}$-enriched setting.
- No theorem on the dominant eigenvalue / Perron–Frobenius for $M_w$.

## What the public literature has that this question needs to read

- **Tropical / max-plus linear algebra.** Akian–Bapat–Gaubert, Butkovic. The $\mathcal{V} = ([0, \infty], +, \min)$ case is exactly tropical-eigenvalue theory; the weighted matrix $M_w$ has a *tropical Perron eigenvalue* in this setting. Standard reference: Butkovic *Max-linear Systems: Theory and Algorithms* (2010).
- **Idempotent-semiring spectral theory.** Kolokoltsov–Maslov; Litvinov; the spectral theory of matrices over idempotent semirings.
- **Łukasiewicz / MV-algebra spectral theory.** Mundici, Cignoli–D'Ottaviano. The Łukasiewicz $[0, 1]_L$ case has its own spectral framework via the Mundici equivalence with $\ell u$-groups.
- **Categorical Perron–Frobenius.** Recent line by Leinster, Bradley, Fritz on Perron–Frobenius in categorical / quantale-enriched settings.
- **Substitution dynamics with weights.** Bressaud–Durand–Maass on substitution dynamics with unbounded image lengths; Akiyama–Lee on Pisot substitutions; the broader Pisot-conjecture literature (Berthe, Siegel, Solomyak).
- **Categorical Diffusion of Weighted Lattices** ([arXiv 2501.03890](https://arxiv.org/abs/2501.03890), 2025) — Lawvere Laplacian as endofunctor on quantale-enriched cellular sheaf cochains. The closest direct cousin to the corpus's framework.

## The question

What is the dominant eigenvalue of the weighted matrix $M_w$ as a $\mathcal{V}$-graded invariant of the substitution rule plus weight assignment, and what is its $\mathcal{V}$-graded analog of the Pisot conjecture?

## Sub-questions

### (a) Tropical case: $\mathcal{V} = ([0, \infty], +, \min)$

The weighted matrix $M_w$ over the Lawvere quantale is a *max-plus matrix*. Its tropical eigenvalue $\lambda_w^{\mathrm{trop}}$ — the maximal cycle mean — is computed by Karp's algorithm or Howard's policy iteration in $O(n^3 \cdot |\mathrm{cycles}|)$ time. Sub-question (a) asks: state and verify a *weighted-tropical Pisot accumulation theorem* — the tropical analog of the bilattice Pisot result, with $\lambda_w^{\mathrm{trop}}$ in place of the integer Perron eigenvalue. Verify on the Fibonacci, Tribonacci, Padovan benchmarks with concrete weight choices.

### (b) Łukasiewicz MV-algebra case: $\mathcal{V} = ([0, 1]_L, \cdot, \max)$

The Łukasiewicz weighted matrix has dominant eigenvalue bounded by 1 — the substitution does *not* grow exponentially. Sub-question (b) asks: characterize the dominant eigenvalue of $M_w$ over $[0, 1]_L$ as a function of $(M, w)$. Specifically, when is the eigenvalue strictly less than 1 (truth-decay) versus exactly 1 (truth-preservation)?

### (c) Probability semiring case: $\mathcal{V} = ([0, 1], \cdot, +)$

For row-stochastic $M_w$ (where each row of weights sums to 1 in the appropriate sense), the dominant eigenvalue is 1 by Perron–Frobenius. Sub-question (c) asks: identify exactly when $M_w$ is row-stochastic, and connect this back to the [stochastic-stationary-as-settling theorem](../../continuous-valued-settling/content/stochastic-settling/references/stochastic-stationary-as-settling.md). The substitution interpretation: a probability-weighted substitution settling reduces to a Markov-chain settling on the alphabet.

### (d) General $\mathcal{V}$: dominant eigenvalue framework

Sub-question (d) asks: state a general theorem identifying the dominant eigenvalue $\lambda_w^\mathcal{V}$ of $M_w$ in $\mathcal{V}$, with the bilattice / tropical / Łukasiewicz / probability cases as instances. The Lawvere-Laplacian fixed-point framework ([@ghrist-et-al2025], the corpus's [Lawvere Laplacian on Grothendieck sites theorem](../theorems/lawvere-laplacian-grothendieck-sites.md)) is the natural candidate machinery.

### (e) Weighted Pisot conjecture

The classical Pisot conjecture (substitution dynamics) says: if the dominant eigenvalue of $M$ is a Pisot number, the substitution has pure discrete spectrum. Sub-question (e) asks: state the $\mathcal{V}$-graded analog. What does "Pisot" mean for a $\mathcal{V}$-graded eigenvalue? In the tropical case, the analog is well-defined (via the algebraic-integer structure of $\mathcal{V}$); in the Łukasiewicz case, less clear.

## What would settle the question

A sequence of deliverables:

1. Tropical / max-plus Pisot theorem for $M_w$ — directly computable using existing tropical-algebra machinery.
2. Łukasiewicz dominant-eigenvalue characterization — via Mundici equivalence with $\ell u$-groups.
3. Probability-semiring identification with stochastic settlings — links existing corpus theorems.
4. General $\mathcal{V}$-graded Perron–Frobenius theorem.
5. Weighted Pisot conjecture statement (and verification on benchmarks where possible).

Deliverables 1–3 are session-to-cluster scale. Deliverables 4–5 are research-program-scale.

## Position in the program

This question is the natural follow-up to the [continuous-valued step-$n$ cohomological rank theorem](../theorems/continuous-valued-step-n-cohomological-rank.md). It opens the *quantitative* side of the rank-$n$ structure: the rank is universal, but the dominant eigenvalue is quantale-specific.

It interlocks with:

- [Continuous-valued aperiodic cohomology question](continuous-valued-aperiodic-cohomology.md) — the open question on computing $H^1$ of a continuum-Fibonacci.
- [Q-enriched aperiodic direct-limit cohomology question](q-enriched-aperiodic-direct-limit-cohomology.md) — the foundational direct-limit framework.

This question stays `open` until at least sub-question (a) — the tropical case on a benchmark — is settled.
