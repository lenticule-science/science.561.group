---
type: question
class: internal
status: open
explores:
  - cohomological-framework-2category
  - cohomological-framework-comparison
  - framework-3-4-disagreement
  - framework-1-2-strict-agreement
  - framework-2-3-strict-agreement
  - framework-4-vanishing-transfer
---

# Internal cohomology of $\mathbf{CohFr}$

The [2-category of cohomological frameworks](../objects/cohomological-framework-2category.md) types each agreement-or-disagreement claim as the invertibility-or-non-invertibility of a comparison transformation $\alpha$ on a specified subdomain. The current four agreement-class theorems express this:

- $\mathbb{F}_1 \to \mathbb{F}_2$ on substitution / strict regime — $\alpha$ is a natural iso (sketch).
- $\mathbb{F}_2 \to \mathbb{F}_3$ on strict-regime — $\alpha$ is a natural iso (sketch; partial via Lemma B1).
- $\mathbb{F}_3 \to \mathbb{F}_4$ on Grothendieck-site assembly — $\alpha$ is **not** a natural iso. *Positive negative result*: the Grothendieck-site presentation $\mathbb{F}_4$ does not recover the factoring data of the order-complex presentation $\mathbb{F}_3$.
- $\mathbb{F}_4 \to \mathbb{F}_3$ on $H^{\geq 2}$ — $\alpha$ transfers vanishing (draft).

The 2-cells of $\mathbf{CohFr}$ — *modifications* between parallel comparison 1-cells — are well-defined but, as far as the corpus has gone, structurally undeveloped: the agreement theorems are about *whether* a specific $\alpha$ is invertible, not about the *modification-structure* that 2-cells provide between competing comparison 1-cells.

This question asks whether the 2-cells carry their own cohomological content, classifying the *failures* (and successes) of agreement structurally beyond the per-1-cell invertibility verdict.

## The question

Does $\mathbf{CohFr}$ carry an internal cohomology theory whose classes classify the agreement/disagreement structure of the framework family — beyond what the per-1-cell $\alpha$-invertibility data records?

## Sub-questions

**1. Cohomology of the nerve.** Take the nerve $N\mathbf{CohFr}$ as a simplicial set (or 2-truncated simplicial space). Its cohomology with coefficients in a suitable abelian-valued functor classifies the framework family's agreement structure as a combinatorial / topological invariant. What is $H^n(N\mathbf{CohFr}; -)$? What does each degree mean?

- *$H^0$:* presumably constant-on-components data — agreement-component counts.
- *$H^1$:* circuit-style obstructions — 3-framework cycles $\mathbb{F}_a \to \mathbb{F}_b \to \mathbb{F}_c \to \mathbb{F}_a$ whose composed $\alpha$-comparison fails to be the identity. The $\mathbb{F}_3 \leftrightarrow \mathbb{F}_4$ disagreement may already be (a generator of) such an $H^1$.
- *$H^2$:* higher coherence failures involving 4 frameworks or more.

**2. Coefficient choice.** The natural coefficient candidates:

- *Sub-domain lattice.* Each agreement claim is typed by a sub-domain (substitution settlings, strict regime, etc.); the lattice of sub-domains may be a natural coefficient system.
- *Comparison-transformation modifications.* The 2-cells of $\mathbf{CohFr}$ themselves; cohomology valued in the 2-cell groupoid.
- *Disagreement defects.* For non-iso $\alpha$, the obstruction-to-iso has its own structure (a specific cokernel-like object); cohomology valued in these defects.

**3. Disagreement-as-class. The $\mathbb{F}_3 \to \mathbb{F}_4$ disagreement is currently a structural fact (the assembly choice $\mathbb{F}_3$ makes is not recoverable from $\mathbb{F}_4$'s Grothendieck-site presentation). Is it a *non-trivial cohomology class* in some natural cohomology of $\mathbf{CohFr}$, with the **class** of the disagreement being the structural invariant (the specific assembly-information lost) rather than just the **fact** of disagreement?

**4. Relation to typed-comparison patterns elsewhere in the corpus.** The [predicatory-comparison family](teaching/explanations/predicatory-comparison.md) has the same shape: comparisons returning structured witnesses (loci, defects, residuals) rather than Boolean answers. Is $\mathbf{CohFr}$'s internal cohomology a *predicatory-X structure* on framework-comparisons — i.e., is "compare frameworks" itself an instance of the predicatory-comparison schema, with the cohomology classifying the witness structure?

**5. Higher 2-categories of framework-2-categories.** $\mathbf{CohFr}$ itself sits in a larger landscape: it's *one* 2-category of cohomological frameworks; alternative axiomatizations (different choices of 0-cell, 1-cell, 2-cell) give other 2-categories. A *3-category* of 2-categories-of-frameworks would classify the choice of $\mathbf{CohFr}$ itself. Whether this tower is degenerate or rich is the natural follow-up.

## Why this matters

The four current agreement theorems give pairwise verdicts on framework-comparisons. They don't say *how much* $\mathbb{F}_3$ and $\mathbb{F}_4$ disagree, *in what direction* they disagree, or *what structurally would close the gap*. An internal cohomology of $\mathbf{CohFr}$ would type these into structured invariants — putting the disagreement-content on the same footing as the agreement-content.

If $H^1(N\mathbf{CohFr}; -)$ is non-trivial and the $\mathbb{F}_3 \leftrightarrow \mathbb{F}_4$ disagreement generates a specific class, the corpus gains *named* disagreement invariants — analogs of the [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) at the meta level, classifying how cohomology theories themselves disagree about the underlying objects they compute.

This connects to the [meta-classifier moduli](meta-classifier-moduli-of-moduli.md) program at a parallel level: that question is about a moduli of moduli; this is about cohomology of cohomologies.
