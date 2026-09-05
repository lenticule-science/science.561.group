---
type: question
class: bridge
status: open
explores:
  - tropical-rank-collapse-classification
  - continuous-valued-step-n-cohomological-rank
  - weighted-perron-frobenius-substitution-settlings
  - q-enriched-aperiodic-direct-limit-cohomology
  - step-n-substitution-rule
  - perron-frobenius-substitution-matrix
  - benchmark-1-fibonacci
  - benchmark-3-padovan
  - benchmark-4-tetranacci
---

# Polyhedral structure of the weight-stability cone for continuous-V settlings

The [tropical rank-collapse classification theorem](../theorems/tropical-rank-collapse-classification.md) (sketch) characterizes which weight assignments $w$ produce continuous-V step-$n$ settlings $v_\mathcal{S}^{(\mathcal{V}, w)}$ with non-degenerate rank-$n$ classifying invariants: those in the shape-specific weight-stability cone $\mathcal{S}_\mathcal{S} \subseteq \mathcal{V}_{>\bot}^n$. The cone is non-empty for every primitive substitution rule, contains the right-Perron eigenvector ray of the substitution matrix $M$, and depends on the substitution rule beyond just its arity.

What remains open is the *quantitative* / *polyhedral* structure of $\mathcal{S}_\mathcal{S}$ for each substitution shape. Empirically, the cones are larger than the strict-Pisot-eigenvector ray but properly contained in the corresponding "weight-ordering matches Pisot eigenvector ordering" half-spaces, with shape-specific boundary inequalities. This question opens the systematic characterization — for each corpus substitution rule, what are the precise inequalities defining its weight-stability cone, and how do they relate to the rule's predicate-category structure?

## What the corpus has

- The [tropical rank-collapse classification theorem](../theorems/tropical-rank-collapse-classification.md) (sketch): qualitative structure of $\mathcal{S}_\mathcal{S}$, with empirical characterization for Fibonacci ($\mathcal{S}_\mathcal{S} = \{w : w_1 > w_2\}$ exactly), Tribonacci (properly larger than strict-Pisot, contained in $\{w : w_1 \geq \max(w_2, w_3)\}$), Padovan (favors increasing weights), Tetranacci (approximately strictly-decreasing).
- The [continuous-valued step-$n$ cohomological rank theorem](../theorems/continuous-valued-step-n-cohomological-rank.md) (sketch) Part 6b: non-degenerate rank-$n$ holds iff $w \in \mathcal{S}_\mathcal{S}$.
- The [weighted Perron-Frobenius for substitution settlings question](weighted-perron-frobenius-substitution-settlings.md) (partial): the *dominant-eigenvalue* side; this question is the structural complement asking when the eigenvalue's growth is realized non-degenerately on the classifying invariant.
- Computational module `tools/predication_categories/examples/tropical_v_linear_independence.py`: 8 tests verifying the qualitative classification.

## The question

For each primitive substitution rule $\mathcal{S}$ in the corpus, characterize the weight-stability cone $\mathcal{S}_\mathcal{S} \subseteq \mathcal{V}_{>\bot}^n$ — the set of weights producing non-degenerate rank-$n$ continuous-V step-$n$ classifying invariants — as a polyhedral / semi-algebraic set with explicit defining inequalities. Connect the boundary structure of $\mathcal{S}_\mathcal{S}$ to the substitution rule's predicate-category structure (which letter-class maps to which) via the right-Perron eigenvector's component-ordering.

## Sub-questions

### (a) Fibonacci closed form

Fibonacci ($n=2$) has $\mathcal{S}_M = \{w : w_1 > w_2\}$ — a single open half-space. This is settled empirically and follows from a direct $M_w^2$ computation. Deliverable: a clean symbolic proof recording the iff condition, available as a corpus sub-theorem.

### (b) Tribonacci explicit polyhedral description

Tribonacci's $\mathcal{S}_M$ is empirically characterized as:

- Strictly contained in the half-space $\{w_1 \geq \max(w_2, w_3)\}$.
- Strictly contains the strict-Pisot ray $\mathbb{R}_{>0} \cdot v$ where $v \approx (1, 0.839, 0.544)$ is the right-Perron eigenvector.
- Contains $(5, 1, 2)$ but not $(5, 3, 4)$ (verified computationally).

Sub-question (b) asks: what are the precise polyhedral inequalities defining $\mathcal{S}_M$ for Tribonacci? The candidate from systematic enumeration: a 3-dimensional polyhedral cone with several piecewise-linear boundaries, possibly involving $w_1, w_2, w_3, w_1 + w_2, w_2 + w_3, \ldots$ in a way determined by the tropical-product structure of $M_w^k$ at small $k$.

### (c) Padovan and the increasing-weight cone

Padovan ($n=3$, $v_1 < v_2 < v_3$ plastic-number scaling) has $\mathcal{S}_M$ favoring *increasing* weights. The empirical evidence: $(1, 2, 3)$, $(1, 3, 5)$, $(3, 5, 8)$ stable through $k = 6$; $(1, 1, 1)$, $(2, 2, 2)$, $(3, 2, 1)$, $(5, 3, 2)$ all drop. Sub-question (c): explicit polyhedral description for Padovan's $\mathcal{S}_M$, and connection to the plastic-number Perron eigenvector.

### (d) General n-bonacci

The n-bonacci shape (letter $1$ as hub: $M_{1j} = 1$ for all $j$, $M_{i+1, i} = 1$ for $i < n$) has Pisot eigenvector $v$ with $v_1 > v_2 > \ldots > v_n$. Tetranacci empirical evidence: strictly-decreasing weights $(4, 3, 2, 1)$ stable, $(1, 1, 1, 1)$ and $(1, 2, 3, 4)$ drop.

Sub-question (d) asks: state and prove an n-bonacci-uniform theorem characterizing $\mathcal{S}_M$ as a polyhedral cone defined by inequalities in the weights and their pairwise sums. Conjecture: $\mathcal{S}_M$ approximately equals the open cone $\{w : w_1 > w_i \text{ for } i \geq 2\}$ intersected with a finite collection of "no-tropical-collision" hyperplanes determined by the tropical-product structure of $M_w^k$ for $k \leq n$.

### (e) Connection to the right-Pisot eigenvector

For all four substitutions tested (Fibonacci, Tribonacci, Tetranacci, Padovan), the stability cone *contains* the open neighborhood of weight-orderings matching the right-Perron-eigenvector ordering. This is the structural empirical pattern. Sub-question (e): prove the general theorem — for any primitive $M$ with right-Perron eigenvector $v$ having all-distinct components, the open cone $\{w \in \mathbb{R}_{>0}^n : w_i < w_j \iff v_i < v_j\}$ is contained in $\mathcal{S}_M$. Equivalently: weights that respect the eigenvector's ordering are tropical-Pisot-stable.

The proof should follow from: (i) tropical-product paths in $M_w^k$ are dominated by the path with maximal weight-sum; (ii) for ordering-matched weights, this dominant path is unique; (iii) uniqueness of the dominant path implies pairwise-distinct row contributions, hence rank preservation.

### (f) Boundary chambers and rank-drop classification

Outside $\mathcal{S}_M$, the iterated tropical rank drops to some $r < n$. The rank-drop locus $\mathbb{R}_{>0}^n \setminus \mathcal{S}_M$ stratifies further by *which* rank the iteration eventually achieves. For Fibonacci, rank drops to 1 in $k=2$ for any $w$ outside $\{w_1 > w_2\}$. For Tribonacci, the drop pattern depends on which boundary chamber $w$ lies in.

Sub-question (f): characterize the chamber decomposition of $\mathbb{R}_{>0}^n \setminus \mathcal{S}_M$ by limit-stable tropical rank. This is the natural extension of (a)–(e) to the "what happens when stability fails" question.

## What would settle the question

Six graduated deliverables:

1. **Fibonacci closed form** (sub-question a): symbolic proof, ~1 page.
2. **Tribonacci explicit polyhedral description** (sub-question b): systematic enumeration of $M_w^k$ for $k \leq 4$, identification of the precise inequalities, computational verification on a fine grid.
3. **Padovan explicit polyhedral description** (sub-question c): same shape as (b) but for Padovan's substitution matrix.
4. **n-bonacci uniform theorem** (sub-question d): a single theorem covering all n-bonacci shapes.
5. **Right-Pisot-eigenvector inclusion theorem** (sub-question e): general theorem for any primitive $M$.
6. **Chamber decomposition** (sub-question f): full stratification of $\mathbb{R}_{>0}^n$ by limit tropical rank.

Deliverables 1–3 are session-scale. Deliverable 4 is research-program-scale within tropical algebra. Deliverables 5–6 are research-program-scale and require connection to Pisot-Vijayaraghavan number theory.

## Why this question

The [tropical rank-collapse classification theorem](../theorems/tropical-rank-collapse-classification.md) gives the corpus a *qualitative* answer: $\mathcal{S}_\mathcal{S}$ is a non-empty open shape-specific cone, containing the right-Perron-eigenvector ray. Without the polyhedral-cone characterization, the answer is qualitative — we know the cone exists but cannot answer "is *this specific weight assignment* in $\mathcal{S}_\mathcal{S}$" without running the computational tool.

The polyhedral characterization makes the corpus's continuous-V rank-$n$ classification *predictive*. For a downstream user who needs the [continuous-V step-$n$ cohomological rank theorem](../theorems/continuous-valued-step-n-cohomological-rank.md)'s rank-$n$ conclusion to apply to a specific continuous-V settling $v_\mathcal{S}^{(\mathcal{V}, w)}$, this question's answer says exactly when that conclusion holds.

## Position in predication categories

This question is the structural follow-up to the [tropical rank-collapse classification theorem](../theorems/tropical-rank-collapse-classification.md) and directly upstream of any corpus theorem requiring the continuous-V step-$n$ classifying invariant to be non-degenerately rank-$n$. It is **session-scale for individual substitution rules** (Fibonacci, Tribonacci, Tetranacci, Padovan), and **research-program-scale for the general primitive-rule theorem**.

The proof technique uses tropical matrix algebra (Akian-Bapat-Gaubert, Butkovic) as a black-box computational tool to verify settling-internal claims about classifying-invariant non-degeneracy. The settling-internal claim is the subject; tropical matrix algebra is the proof apparatus.

## Status

`open` until at least sub-question (a) — Fibonacci closed-form symbolic proof — is settled.
