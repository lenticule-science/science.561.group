---
type: definition
class: closure-rule
symbol: "\\sigma_n"
depends-on: [step-n-substitution-recurrence, closure-rule-system, closure-rule, closure-rule-language, closure-operator]
name: Step-n substitution rule
description: A formal closure-rule object capturing the step-n recurrence structure.
---


A formal closure-rule object capturing the [step-n recurrence](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/step-n-substitution-rule/docs/dev/concepts/step-n-substitution-recurrence.md) structure. A **step-$n$ substitution rule** is a closure rule with antecedent depending on the prior $n$ settled stages and consequent producing new cells via an $n$-term recurrence pattern.

## Definition

A step-$n$ substitution rule on a base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$ with predicate $P$ on $\mathrm{dom}(P) = E \times E$ (or $\Delta_E$) is a closure rule of the form:

$$\sigma_n : \quad \bigwedge_{i = 1}^{n} \phi_i(v|_{[k - i, k]}) \;\Longrightarrow\; \psi(v(P)(k+1, \cdot))$$

where:

- $\phi_i$ are predicates on the cell-content at stage $k - i$ (look-back $i$ stages).
- $\psi$ is a constraint on the cell-content at stage $k + 1$.
- The substitution matrix structure determines the specific $\phi_i, \psi$ form.

Concretely: the rule's antecedent involves the prior $n$ stages of settling history, and its consequent specifies new cell content at the next stage according to an $n$-term recurrence.

## The substitution matrix

Each step-$n$ substitution rule has an associated **substitution matrix** $M \in \mathrm{Mat}_{n \times n}(\mathbb{N})$ where $M_{ij}$ is the number of $j$-letters produced by substituting on an $i$-letter. The growth rate of the substitution is the dominant eigenvalue (Perron-Frobenius eigenvalue) of $M$, which is a degree-$n$ algebraic number for primitive matrices.

For the canonical step-$n$ rules:

- **$n = 2$ Fibonacci:** $M = \begin{pmatrix} 1 & 1 \\ 1 & 0 \end{pmatrix}$, eigenvalue $\phi$ (golden ratio).
- **$n = 3$ Padovan:** $M = \begin{pmatrix} 0 & 1 & 0 \\ 0 & 0 & 1 \\ 1 & 1 & 0 \end{pmatrix}$, eigenvalue $\rho$ (plastic number).
- **$n = 4$ Tetranacci-style:** $M$ a $4 \times 4$ matrix with degree-4 characteristic polynomial.

Different step-$n$ rules with the same $n$ but different matrices give *distinct* substitution rules — even though they share the same step-parameter.

## Specialization to predication categories' bilattice

Each step-$n$ substitution rule is encoded in predication categories' predication-fiber-algebra structure. The substitution alphabet's $n$ letters correspond to $n$ distinct values or predicates over a single cell. For specific values of $n$, this aligns with the bilattice's intrinsic structure (per the [step-n / bilattice correspondence theorem](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-and-bilattice-correspondence.md), forthcoming):

- **$n = 2$:** alphabet $\{a, b\}$ ↔ bilattice's two orders (knowledge $\leq_k$, truth $\leq_t$).
- **$n = 3$:** alphabet $\{a, b, c\}$ ↔ non-bottom values $\{\mathbf{t}, \mathbf{f}, \top\}$.
- **$n = 4$:** alphabet $\{a, b, c, d\}$ ↔ full bilattice values $\{\bot, \mathbf{t}, \mathbf{f}, \top\}$.

For $n \geq 5$, no canonical bilattice correspondence — the alphabet exceeds the bilattice's own structural cardinality.

## Properties

A step-$n$ substitution rule has:

- **Closure ordinal $\kappa = \omega_1$** (when $E = \omega_1$): the substitution doesn't stabilize at any countable ordinal because new cells appear at every stage. **Aperiodic regime.**
- **Non-Scott-continuous closure** (when combined with limit-aggregation): the substitution rule alone is Scott-continuous (depends on finitely many prior stages); combined with aggregation at limit ordinals, becomes non-Scott-continuous.
- **Rule-language fragment $\Pi_{n-1}$** (or close): the rule's antecedent uses look-back-$n$ structure expressible at quantifier-depth $n - 1$.

## Examples in the corpus

- [fibonacci-substitution-settling](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/step-n-substitution-rule/docs/dev/examples/fibonacci-substitution-settling.md) — step-2.
- [padovan-substitution-settling](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/step-n-substitution-rule/docs/dev/examples/padovan-substitution-settling.md) (forthcoming) — step-3.
- [tribonacci-substitution-settling](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/step-n-substitution-rule/docs/dev/examples/tribonacci-substitution-settling.md) (forthcoming) — alternative step-3.
- [tetranacci-substitution-settling](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/step-n-substitution-rule/docs/dev/examples/tetranacci-substitution-settling.md) (forthcoming) — step-4.
- [thue-morse-substitution-settling](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/step-n-substitution-rule/docs/dev/examples/thue-morse-substitution-settling.md) — step-2 variant (different matrix from Fibonacci).
- [penrose-substitution-settling](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/step-n-substitution-rule/docs/dev/examples/penrose-substitution-settling.md) — 2-D step-$n$ for some specific $n$.
- [step-n-generic-substitution-template](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/step-n-substitution-rule/docs/dev/examples/step-n-generic-substitution-template.md) (forthcoming) — parameterized template at any $n \geq 2$.

## Position in predication categories

The fundamental object of the step-$n$ family. The corpus's substitution-flavored closure rules are step-$n$ rules for various $n$; the [step-n moduli sub-stack](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/content/step-n-moduli-substack/step-n-moduli-substack.md) classifies them; the [step-n classifying invariant](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/step-n-substitution-rule/docs/dev/scraps/step-n-classifying-invariant.md) records their cohomological content; the [step-shift morphism](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/step-n-substitution-rule/docs/dev/morphisms/step-shift-morphism.md) relates step-$n$ to step-$(n+1)$ rules; and the [step-n cohomological rank theorem](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-cohomological-rank-theorem.md) gives the structural connection between $n$ and the rank.
