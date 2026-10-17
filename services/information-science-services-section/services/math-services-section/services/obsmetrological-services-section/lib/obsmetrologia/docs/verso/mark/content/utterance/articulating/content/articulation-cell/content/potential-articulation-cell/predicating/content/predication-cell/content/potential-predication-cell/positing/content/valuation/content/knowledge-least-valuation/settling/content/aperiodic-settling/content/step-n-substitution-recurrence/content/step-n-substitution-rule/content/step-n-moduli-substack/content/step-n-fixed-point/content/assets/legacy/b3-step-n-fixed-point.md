---
kind: definition
type: stack-colimit
symbol: "\\mathscr{M}^{(\\infty)}"
depends-on: [step-n-moduli-substack, step-shift-morphism, step-shift-functoriality-theorem, renormalization-group-flow]
---

# Step-n fixed-point object

The colimit of the ascending chain $\mathscr{M}^{(2)} \to \mathscr{M}^{(3)} \to \cdots$ under the [step-shift morphism](../morphisms/step-shift-morphism.md). The corpus's candidate **renormalization-group fixed point** at infinite step depth.

## Definition

By the [step-shift functoriality theorem](../theorems/step-shift-functoriality-theorem.md), the family $\{\mathscr{M}^{(n)}\}_{n \geq 2}$ with $\sigma$-morphisms forms an ascending chain in the 2-category of stacks. The colimit:

$$\mathscr{M}^{(\infty)} \;:=\; \mathrm{colim}_{n \to \infty}\, \mathscr{M}^{(n)}$$

is a 2-stack whose objects are equivalence classes of "step-$\infty$ substitution rules" — closure rules whose recurrence depth is unbounded.

## Why "fixed point"

The colimit is a fixed point of the step-shift flow in the precise sense: $\sigma(\mathscr{M}^{(\infty)}) = \mathscr{M}^{(\infty)}$. Each finite-step iteration $\sigma$ embeds into the colimit (by the colimit's universal property), and the colimit is invariant under further iteration.

This is the corpus's first instance of an RG fixed point, with structural content matching the [renormalization-group-flow narrative](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/renormalization-group-flow.md)'s discussion.

## Structural content

The fixed point's structural content is open. Candidate possibilities:

**1. Trivial fixed point.** The colimit could be degenerate — a single point (the trivial closure rule, vacuously satisfying any step-$n$ structure). If so, the RG flow has no non-trivial fixed point, and the "infinite-step" universal substitution doesn't exist as a richly-structured object.

**2. Universal substitution moduli.** The colimit could be a non-trivial classifier — the moduli of "all substitution-like closure rules" at infinite depth. Its structural content would include all the asymptotic features of the step-$n$ family (limiting Pisot numbers, asymptotic cohomological rank distributions, etc.).

**3. ∞-categorical refinement target.** The colimit could be naturally an ∞-stack rather than a 2-stack, requiring [(∞, 1)-categorical machinery](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/higher-categorical-direction.md) to develop fully.

Determining which possibility holds is open work.

## Critical exponents at the fixed point

By the [critical-exponents-at-step-n-fixed-point theorem](../../../../../../../references/critical-exponents-at-step-n-fixed-point.md) (forthcoming), specific algebraic-number invariants take limiting values at the fixed point:

- The **growth rate** of step-$n$ substitutions, in the limit $n \to \infty$, approaches an **accumulation point of Pisot numbers**. The smallest Pisot number is the plastic number $\rho \approx 1.3247$ (Padovan's growth rate); subsequent step-$n$ growth rates form an increasing sequence with specific accumulation behavior.
- The **cohomological rank** at the fixed point is $\aleph_0$ or $2^{\aleph_0}$ — depending on the colimit construction (set-theoretic vs categorical).
- The **closure-rule-language fragment** at the fixed point may be $\Pi_\omega$ or higher — beyond the standard rule-language hierarchy.

## Position in the program

The fixed-point object is the structural endpoint of the step-$n$ family. Its existence is established (as a colimit) but its content is open. The most pressing open questions:

- **Is $\mathscr{M}^{(\infty)}$ structurally rich, or trivial?**
- **Does it have a natural relationship to other corpus structures** (the Verdier duality, deformation theory, etc.)?
- **What's its ∞-categorical structure**, and does it anchor the corpus's [(∞, 1)-direction](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/higher-categorical-direction.md)?

These are next-research-frontier questions, with concrete structural content to investigate.
