---
type: narrative
status: current
discusses: [value-agnostic-void-cone, value-agnostic-void-cone-per-category, value-agnostic-void-cone-axiomatic, void-cone-cohomology, void-cone-associated-graded-direct, void-cone-via-filtration-ss]
---

# Value-agnostic void-cone: three proof paths

The corpus's [value-agnostic void-cone theorem](../theorems/value-agnostic-void-cone.md) — that the void-cone (co)homology pairing is structural, not specific to bilattice values — is established via three independent proof paths. Each illuminates a different aspect of the structural content. Together they make the theorem one of the corpus's most rigorously-grounded results, with redundant verification across distinct proof techniques.

## The three paths

**1. Original cross-category.** The [value-agnostic void-cone theorem](../theorems/value-agnostic-void-cone.md) abstracts over value categories ($\mathcal V$ a complete bilattice / quantale / Heyting frame / continuous-valued lattice) using ad-hoc structural assumptions tailored to each case. The proof handles the bilattice case directly, with extensions noted for other value categories.

**2. Per-category verification.** The [per-category proof](../theorems/value-agnostic-void-cone-per-category.md) verifies the theorem case-by-case for the four standard value categories the corpus uses (bilattice, quantale, continuous-valued lattice, Heyting frame). Each case has its own concrete computation; combined they cover the corpus's typical settings without requiring a unified abstract argument.

**3. Axiomatic minimal-axiom form.** The [axiomatic proof](../theorems/value-agnostic-void-cone-axiomatic.md) identifies the *minimal axiom set* (A1–A4) under which the theorem holds: the value category needs to support specific structural operations (closure-respecting, support-respecting, etc.). The theorem follows from these axioms alone, without case analysis. Future extensions to new value categories — MV-algebras, continuous Heyting algebras, fuzzy bilattices — inherit the void-cone structure automatically by verifying A1–A4.

The three are independent in the sense that none uses the others' arguments. The axiomatic form is the cleanest statement of *what structure is genuinely required*; the per-category form is the most computationally explicit; the original cross-category form is the historical first proof.

## Role of the support-respecting hypothesis

The minimal-axiom form clarifies the role of axiom A4 (support-respecting closure operators): it's needed for the *structural-unreachability* interpretation of $V_\infty$ (the cells permanently in the void), not for the descent or pairing themselves. Without A4, the cohomological pairing still goes through, but $V_\infty$ may underrepresent structurally-unreachable cells. The [non-support-respecting counterexample](../examples/non-support-respecting-spontaneous-rule.md) gives a concrete instance of this gap.

## Verdier-independence

Separately, the [void-cone-cohomology theorem](../theorems/void-cone-cohomology.md) — which gives the void cone's $H_1 \cong \mathrm{gr}(\mathrm{Void})$ identification — has its own three independent proof paths:

- The **Verdier-duality route** (through the [Verdier duality theorem](../theorems/verdier-duality-bitopological-site.md)). Now `proved` after the cellular extension plan completion.
- The **chain-level direct route** ([void-cone associated-graded direct](../theorems/void-cone-associated-graded-direct.md)). Verdier-independent; constructs the matching by direct firing-ordinal indexing.
- The **filtration spectral sequence route** ([void-cone via filtration spectral sequence](../theorems/void-cone-via-filtration-ss.md)). Computes via the SS of the void filtration directly, recovering the same answer through filtered-complex machinery.

All three give the same conclusion via different routes — chain-level bijection, spectral sequence, and derived equivalence respectively. The three together provide redundant verification.

## What this gives the corpus

The void-cone (co)homology theorem is therefore one of the most rigorously-grounded structural results in the chapter:

- *Value-agnostic*: three proof paths (original, per-category, axiomatic), with the axiomatic form identifying minimal structure required.
- *Verdier-independent*: three proof paths (Verdier, chain-level, spectral sequence), with the chain-level form not requiring Verdier.

Combined: the theorem stands even if any single proof path is later found to have a gap. The redundancy was developed deliberately as the chapter's risk-management strategy for its most load-bearing void/apex-duality result.

## Open downstream

- **Continuous coefficients**: when $\mathcal V$ is continuum-valued (e.g., $[0, 1]$), the firing set $L_{\mathrm{ns}}$ may itself be uncountable. The cohomology then has $\mathbb R$- or $\mathcal V$-valued generators, and the pairing structure refines. Open structural classification.
- **Void-cone $V_\infty$ as a value-category-agnostic dimension estimator**: the Lorentzian benchmark showed $|V_\infty|$ correlates with spatial extent. Whether this generalizes to other value categories (and what dimension means in each) is open.
- **Support-respecting as a definitional axiom**: whether *all* well-formed closure operators are support-respecting, or whether non-support-respecting closures form a structurally-distinct class, is an axiom-level question.
- **Cosheaf side standalone**: if the Verdier duality completion succeeds, the cosheaf-homology identification gains independent justification. Until then, the chain-level path is the rigorous alternative.
