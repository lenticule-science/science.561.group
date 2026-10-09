---
type: question
class: internal
status: open
explores:
  - non-scott-continuous-firing-ordinal
  - aperiodic-classifying-invariant
  - aperiodic-regime-cohomology-via-direct-limit
  - transfinite-bounded-regime-h1-generators
  - strong-mld-via-composed-duality
---

# Firing-dependency graph structure on $L_{\mathrm{ns}}$ for aperiodic and transfinite-bounded settlings

For an aperiodic or transfinite-bounded settling, the [non-Scott-continuous firing ordinals](../../settling-continuity/content/non-scott-continuous-firing-ordinal/non-scott-continuous-firing-ordinal.md) $L_{\mathrm{ns}}(\kappa) \subseteq \kappa$ index the cells whose firing requires content from earlier stages that does not arise as a directed-colimit of finite predecessors. Each $\mu \in L_{\mathrm{ns}}$ contributes an independent generator to the [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) $H^1(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_v)$ per the [aperiodic-regime cohomology via direct limit theorem](../../aperiodic-settling/references/aperiodic-regime-cohomology-via-direct-limit.md).

The set $L_{\mathrm{ns}}$ has the discrete-ordinal order from $\kappa$. Open: it also carries a finer structure — a **firing-dependency graph** — recording which earlier firings $\mu_2 < \mu_1$ are essentially required for $\mu_1$'s firing-content (versus those $\mu_2$ whose content can be substituted away).

This question develops the firing-dependency-graph as a corpus-internal structural object on $L_{\mathrm{ns}}$, refining the discrete-ordinal order with cell-content-dependency information.

## What the corpus has

- The [non-Scott-continuous firing ordinal object](../../settling-continuity/content/non-scott-continuous-firing-ordinal/non-scott-continuous-firing-ordinal.md): each $\mu \in L_{\mathrm{ns}}(\kappa)$ records a stage where the closure operator fails to commute with directed joins at some cell.
- The [aperiodic-regime cohomology via direct limit theorem](../../aperiodic-settling/references/aperiodic-regime-cohomology-via-direct-limit.md): $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_v) \cong \bigoplus_{\mu \in L_{\mathrm{ns}}(\omega_1)} \mathbb{Z}$ — one generator per NSC firing.
- The [transfinite-bounded regime $H^1$-generators theorem](../theorems/transfinite-bounded-regime-h1-generators.md): one $H^1$-generator per NSC firing, finite-or-countable in this regime.
- The [strong-MLD via composed-duality theorem](../theorems/strong-mld-via-composed-duality.md): the orbit-type classification refining MLD-equivalence; the firing-pattern-self-duality structure on $L_{\mathrm{ns}}$ is part of the orbit-type data.

## The question

For an aperiodic or transfinite-bounded settling $v$, define the **firing-dependency graph** $\Gamma_v$ on $L_{\mathrm{ns}}$ as follows: for $\mu_1, \mu_2 \in L_{\mathrm{ns}}$ with $\mu_2 < \mu_1$, draw an edge $\mu_2 \to \mu_1$ iff $\mu_1$'s firing antecedent (the cell-set requiring $\mu_1$ as a non-Scott-continuous step) essentially uses content from $\mu_2$'s firing — i.e., the antecedent's value is not preserved under substituting the $\mu_2$-firing's content with a directed-colimit replacement.

What is the structure of $\Gamma_v$? Specifically:

1. **Is $\Gamma_v$ a partial order refining the discrete-ordinal order on $L_{\mathrm{ns}}$?** If so, what additional structural properties does it have (well-founded, locally-finite, geometric)?

2. **What corpus-internal classification of settlings does $\Gamma_v$ produce?** Two settlings with isomorphic $\Gamma_v$ should be equivalent in some refinement of MLD; settlings with non-isomorphic $\Gamma_v$ should be MLD-distinguishable.

3. **How does $\Gamma_v$ interact with the [strong-MLD orbit-type](../theorems/strong-mld-via-composed-duality.md)?** Conjecturally, the strong-MLD orbit-type stratification on the moduli of aperiodic settlings refines further by the isomorphism type of $\Gamma_v$.

4. **For substitution-recurrence settlings, is $\Gamma_v$ determined by the substitution rule?** For Fibonacci, Padovan, etc., the substitution rule generates $L_{\mathrm{ns}}$ in a recursive pattern — does this pattern determine $\Gamma_v$ as a structural invariant of the substitution rule?

## What would settle the question

Three graduated deliverables:

1. **Definition of $\Gamma_v$** as a corpus-internal object, with proof that the "essential dependency" relation is well-defined (settling-stage-stable, MLD-invariant). Recorded as a new object `objects/firing-dependency-graph.md`.

2. **Structural properties theorem**: $\Gamma_v$ is a well-founded partial order on $L_{\mathrm{ns}}$ refining the discrete-ordinal order. Cardinality bounds for $\Gamma_v$ in each regime.

3. **Classification refinement theorem**: $\Gamma_v$-isomorphism is a corpus-internal equivalence on aperiodic settlings strictly refining MLD-equivalence. Worked example on a substitution-recurrence settling (Fibonacci) showing the explicit $\Gamma_v$ structure.

## Why this question

The aperiodic-regime classifying invariant $H^1$ records a free-abelian-group generator per NSC firing, with no further structure between generators. But the firings themselves are not independent — later firings depend on earlier firings' content via the closure-rule recursion. The firing-dependency graph captures this dependency structure as a corpus-internal object, refining the unstructured generator-set into a structured generator-graph.

If the firing-dependency graph turns out to be a substantive structural invariant — distinguishing settlings that the unstructured $L_{\mathrm{ns}}$ cardinality cannot — it gives the corpus a new layer of classification machinery, internal to the framework's own settling-dynamics.

## Position in predication categories

This question is the structural-internal companion to the bridge question [four-regimes-as-stability-hierarchy](four-regimes-as-stability-hierarchy.md), which connects the regime stratification to Morley's model-theoretic stability hierarchy. The firing-dependency graph is the corpus-internal structure that the model-theoretic *forking* notion would correspond to under that bridge — but $\Gamma_v$ is a corpus-internal object regardless of whether the Morley correspondence is settled.

It interlocks with:

- The [strong-MLD classification question](strong-mld-classification.md) — the orbit-type classification that $\Gamma_v$ would refine.
- The [aperiodic classifying invariant object](../objects/aperiodic-classifying-invariant.md) — the generator-set $\Gamma_v$ structures.
- The [step-$n$ classifying invariant object](../objects/step-n-classifying-invariant.md) — for substitution-recurrence settlings, the rank-$n$ generator-set $\Gamma_v$ would refine the substitution-shape orbit data.

Concrete entry point: compute $\Gamma_v$ for the Fibonacci substitution settling (one of the corpus's benchmark settlings). The firing-dependency structure should be derivable from the substitution recursion's generator pattern.
