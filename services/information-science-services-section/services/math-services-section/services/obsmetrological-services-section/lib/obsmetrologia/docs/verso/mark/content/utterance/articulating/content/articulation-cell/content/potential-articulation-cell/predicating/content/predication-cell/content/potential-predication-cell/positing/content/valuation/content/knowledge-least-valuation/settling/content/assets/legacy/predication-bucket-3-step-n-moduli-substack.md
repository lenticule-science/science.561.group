---
kind: definition
type: stack
symbol: "\\mathscr{M}^{(n)}"
depends-on: [step-n-substitution-rule, step-n-substitution-recurrence, meta-moduli-stack-theorem, meta-stratification-by-regime]
---

# Step-n moduli sub-stack

The sub-stack of the [meta-moduli stack](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/meta-moduli-stack-theorem.md) consisting of closure-equivalence classes of [step-$n$ substitution rules](step-n-substitution-rule.md). The collection $\{\mathscr{M}^{(n)}\}_{n \geq 2}$ stratifies the meta-aperiodic stratum $\mathscr{M}^{\mathrm{meta}}_{\mathrm{aper}}$ by step depth.

## Definition

For each $n \geq 2$:

$$\mathscr{M}^{(n)} \;:=\; \bigl\{\,[\mathcal{S}] \in \mathscr{M}^{\mathrm{meta}}_{\mathrm{aper}} \;:\; \mathcal{S} \text{ is closure-equivalent to a primitive step-}n \text{ substitution rule}\bigr\}.$$

A meta-point $[\mathcal{S}]$ is in $\mathscr{M}^{(n)}$ iff *some* representative of the closure-equivalence class is a primitive step-$n$ substitution rule. Primitivity (some power of the substitution matrix is strictly positive) is required for the rank-theorem-based step-depth invariance; non-primitive substitution rules form a separate sub-residue not covered by the step-$n$ stratification.

## Stratification of meta-aperiodic stratum

By the [step-n meta-stratification theorem](../../aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-meta-stratification.md):

$$\mathscr{M}^{\mathrm{meta}}_{\mathrm{aper}} \;=\; \Bigl(\bigsqcup_{n \geq 2} \mathscr{M}^{(n)}\Bigr) \;\sqcup\; \mathscr{M}^{\mathrm{meta}}_{\mathrm{aper, residue}}$$

where the residue contains aperiodic closure rules not closure-equivalent to any primitive step-$n$ substitution rule. The residue is uncountable by cardinality (proven), but explicit non-substitutive examples are open work — see the theorem's remark.

## The ascending chain structure

The [step-shift morphism](../morphisms/step-shift-morphism.md) $\sigma : \mathscr{M}^{(n)} \to \mathscr{M}^{(n+1)}$ embeds each step-$n$ sub-stack into the next. The collection $\{\mathscr{M}^{(n)}\}_{n \geq 2}$ has ascending-chain structure:

$$\mathscr{M}^{(2)} \xhookrightarrow{\sigma} \mathscr{M}^{(3)} \xhookrightarrow{\sigma} \mathscr{M}^{(4)} \xhookrightarrow{\sigma} \cdots$$

The colimit $\mathrm{colim}_n \mathscr{M}^{(n)}$ is a candidate **RG-fixed-point**: a universal substitution moduli at infinite step depth. (See [step-n fixed-point object](../../aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/content/step-n-moduli-substack/content/step-n-fixed-point/step-n-fixed-point.md) and [renormalization-group-flow narrative](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/renormalization-group-flow.md), forthcoming.)

## Concrete points

- $\mathscr{M}^{(2)}$ contains: Fibonacci, Thue-Morse, and other 2-letter substitutions. Each is a distinct closure-equivalence class — same step parameter, different substitution matrices.
- $\mathscr{M}^{(3)}$ contains: Padovan, Tribonacci, and other 3-letter substitutions.
- $\mathscr{M}^{(4)}$ contains: Tetranacci, Penrose-encoded variants, etc.

For each $n$, $\mathscr{M}^{(n)}$ has multiple meta-points — one per substitution matrix structure (modulo conjugacy). The cardinality of $\mathscr{M}^{(n)}$ grows with $n$ (more matrix structures available).

## Position in the program

The step-$n$ moduli sub-stack is the moduli-level companion to the step-$n$ substitution rule object. With the step-$n$ classifying invariant ($\mathbb{Z}^n$) and the step-shift morphism, the family $\{\mathscr{M}^{(n)}\}$ has full structural content — a parameterized family of moduli stratifying the meta-aperiodic stratum, with morphisms relating consecutive levels.

This is the corpus's first **internal renormalization-group structure**: a parameterized family of moduli with an RG-flow morphism (step-shift) and a candidate fixed point (the colimit-as-$n$-to-infinity).
