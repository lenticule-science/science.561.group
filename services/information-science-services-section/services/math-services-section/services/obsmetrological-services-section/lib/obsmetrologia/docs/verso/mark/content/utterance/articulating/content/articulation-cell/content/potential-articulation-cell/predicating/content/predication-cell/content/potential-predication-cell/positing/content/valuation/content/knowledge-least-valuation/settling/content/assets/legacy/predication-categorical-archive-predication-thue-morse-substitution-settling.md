---
type: example
status: verified
depends-on: [aperiodic-settling, four-regime-dichotomy, closure-rule, fibonacci-substitution-settling, aperiodic-settling-sketch, step-n-and-bilattice-correspondence]
instantiates: [aperiodic-settling]
lineage: 5
---

# Thue-Morse substitution settling

Anchor of **sub-lineage 5b** — the Thue-Morse substitution $\sigma : 0 \mapsto 01, 1 \mapsto 10$ encoded as a closure rule. Chosen for its clean d-frame compatibility under the labeling $0 \leftrightarrow \mathbf{f}, 1 \leftrightarrow \mathbf{t}$, and — uniquely among predication categories' named step-$n$ substitutions — for exhibiting **substitution-rule self-duality**: the substitution matrix commutes with bilattice negation under this labeling.

## Setup

- $\mathbf{L} = \mathbf{2}$.
- Entity set $E = \omega_1$.
- Predicate set $\Pi = \{P\}$ — single binary-on-diagonal predicate. Cell $(\alpha, \alpha)$ encodes "position $\alpha$ has tile-value, where $\mathbf{t}$ means '1' and $\mathbf{f}$ means '0'."
- Closure rule encoding the substitution: each cell at substitution stage $n$ produces two cells at stage $n+1$ via the substitution rule.

The Thue-Morse settling reaches closure ordinal $\kappa = \omega_1$ for the same reason as Fibonacci. **Aperiodic regime.**

## d-frame structure

Distinctive feature of the Thue-Morse encoding: at each substitution step, *both* truth-positive and falsity-positive content are produced (since the substitution alternates $0 \leftrightarrow 1$). The settling has substantive *both-sided* content, where Fibonacci was truth-only.

The d-frame stalk at the limit has both $L_+$ (truth-positive cells, "1" positions) and $L_-$ (falsity-positive cells, "0" positions) non-trivial, with each rank uncountable (both have $|L_{\mathrm{ns}}|$ contributions).

## Substitution-rule self-duality

Distinctive structural property of Thue-Morse: its substitution matrix $M = [[1,1],[1,1]]$ commutes with the alphabet swap $0 \leftrightarrow 1$. Under the labeling $0 \leftrightarrow \mathbf{f}, 1 \leftrightarrow \mathbf{t}$, this swap *is* bilattice negation, so $\sigma \circ \neg = \neg \circ \sigma$ at the substitution-matrix level. Per the [step-$n$ / bilattice cardinality coincidence theorem](../../aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-and-bilattice-correspondence.md), this is predication categories' only verified positive case of structural negation correspondence among named step-$n$ substitutions.

## Note on cohomology

Thue-Morse's substitution matrix is **singular** ($\det M = 0$), placing it outside the [step-$n$ cohomological rank theorem](../../aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-cohomological-rank-theorem.md)'s standard hypothesis. The actual cohomological rank is 1 (not $n = 2$): $\check{H}^1(\Omega_{\mathrm{TM}}) \cong \mathbb{Z}[1/2]$, the dyadic rationals. See [thue-morse-classifying-invariant](thue-morse-classifying-invariant.md) and [benchmark 2](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/benchmark-2-thue-morse.md) for details.

## Position in Lineage 5b

The L5b anchor. With both evidence sides in play AND substitution-rule self-duality, the Thue-Morse settling is the natural site for d-frame computations where the bilattice structure has substantive content. Pairs forward with [thue-morse-d-frame-cohomology](thue-morse-d-frame-cohomology.md), [thue-morse-classifying-invariant](thue-morse-classifying-invariant.md), and [benchmark 2](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/benchmark-2-thue-morse.md).
