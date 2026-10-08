---
type: theorem
status: proved
depends-on: [idealization-morphism, resource-deficit, invisible-automorphism-subgroup, visible-automorphism-quotient, settling-automorphism-1-truncation, predication-settling-preorder-morphism, knowledge-order]
see-also: [resource-quality-decomposition, settling-automorphism-decomposition]
title: Improvement is not automorphic
description: Let $v^R$ be a resource settling with non-empty deficiency $\mathrm{De}(v^R, T) \neq \emptyset$.
---

# Improvement is not automorphic

Let $v^R$ be a resource settling with non-empty deficiency $\mathrm{De}(v^R, T) \neq \emptyset$. The [idealization morphism](../../research/2026/07/31/lenticule-import/morphisms/idealization-morphism.md) $\eta^T_R : v^R \to v^R_{T,\infty}$ is not in the settling-automorphism group $\mathrm{Aut}^\simeq(v^R)$. In particular, no element of the [invisible automorphism subgroup](../../../../glossary/concepts/invisible-automorphism-subgroup.md) $N(v^R)$ or the [visible quotient](../../../../../../../relationality-services-section/services/agency-services-section/content/text/glossary/concepts/visible-automorphism-quotient.md) can realize an improvement.

## Proof

Elements of $\mathrm{Aut}^\simeq(v^R)$ are invertible [settling-morphisms](../../research/2026/07/31/lenticule-import/morphisms/settling-morphism.md), which by definition require state *equality* with ordinal shift: $\phi_{q,\tau}(v^R_\tau(q)) = v^R_{T,\infty,\tau+\delta}(q)$ for every predicate $q$ and ordinal $\tau$.

The [idealization morphism](../../research/2026/07/31/lenticule-import/morphisms/idealization-morphism.md) $\eta^T_R$ is a [predication-settling preorder morphism](../../research/2026/07/31/lenticule-import/morphisms/predication-settling-preorder-morphism.md), not a settling-morphism: it satisfies only $v^R(c) \leq_k v^R_{T,\infty}(c)$ pointwise, not state equality. Since a settling-automorphism must be a settling-morphism, and $\eta^T_R$ is not a settling-morphism, $\eta^T_R \notin \mathrm{Aut}^\simeq(v^R)$.

More concretely: if $\eta^T_R$ were an automorphism, its inverse $\psi$ would be a settling-morphism $v^R_{T,\infty} \to v^R$ with state equality, implying $v^R_{T,\infty}(c) = \psi_{p,\tau}(v^R_{T,\infty,\tau}(p)) = v^R_{\tau-\delta}(p)$ up to ordinal shift. But $\mathrm{De}(v^R, T) \neq \emptyset$ gives a cell $c$ with $v^R(c) <_k v^R_{T,\infty}(c)$ — strict inequality — which is incompatible with equality up to a bilattice-automorphism.

Both $N(v^R)$ and $\mathrm{Aut}^{\mathrm{vis}}(v^R)$ are subgroups of $\mathrm{Aut}^\simeq(v^R)$, so $\eta^T_R$ is in neither. $\square$

## Why this matters

The [settling automorphism decomposition](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-automorphism-decomposition.md) classifies all automorphisms of a settling into invisible (refactoring) and visible (restructuring). The present theorem establishes that IMPROVEMENT — movement toward the theory-relative ideal — is categorically outside this decomposition.

This gives a complete two-axis taxonomy of resource transformations:

| Transformation | Changes knowledge? | Changes $v^R_{T,\infty}$? | In $\mathrm{Aut}^\simeq$? |
|---|---|---|---|
| Improvement ($\eta^T_R$ when $\mathrm{De} \neq \emptyset$) | Yes (up $\leq_k$) | No | No |
| Invisible automorphism (refactoring) | No | No | Yes (in $N(v)$) |
| Visible automorphism (restructuring) | No | Possibly | Yes (in $\mathrm{Aut}^{\mathrm{vis}}$) |
| Contradiction resolution | Yes (removes $\perp_k$) | No | No |
| Theory extension (absorbing excess) | No to $v^R$; Yes to $T$ | Yes | Context-dependent |

Improvement and automorphism are orthogonal: every non-trivial idealization morphism is outside the automorphism group, and every automorphism is outside the idealization relation (when the resource is already theory-ideal, the idealization morphism is identity).

## Consequence for "improvement" in practice

A change to a resource that preserves all observable behavior (all witness-language cells — the refactoring condition) while also filling deficient cells relative to the theory is not a refactoring. It is an improvement, even if it looks like "just adding content." The categorical distinction is sharp: refactoring is in $N_W(v^R)$; improvement is not.

This rules out the informal confusion between "it didn't change any tests" and "it's a refactoring." A change that fills theory-prescribed deficiencies is an improvement, full stop, regardless of whether tests pass.
