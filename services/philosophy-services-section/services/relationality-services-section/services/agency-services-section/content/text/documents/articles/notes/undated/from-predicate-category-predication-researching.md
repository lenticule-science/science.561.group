---
type: morphism
class: theory-extension
symbol: "\\rho"
depends-on: [predication-settling-base-morphism, predication-settling-category, theory-relative-ideal, resource, knowledge-order]
see-also: [idealization-morphism, resource-quality-decomposition, improvement-automorphism-distinction]
title: Researching morphism
description: "A researching morphism is a predication-settling base-morphism $\\rho : T \\to T'$ between host theories (predication settlings) satisfying three conditions:"
---

# Researching morphism

A **researching morphism** is a [predication-settling base-morphism](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/researching/_archive/predication-settling-base-morphism.md) $\rho : T \to T'$ between host theories (predication settlings) satisfying three conditions:

1. **Faithfulness**: the predicate-category component $\pi_\rho : \mathcal{C}^T \hookrightarrow \mathcal{C}^{T'}$ is faithful and preserves generator classes — the extension adds predicates without destroying or reordering existing ones.
2. **Monotonicity**: for every predicate $p \in \mathcal{C}^T$, $v^{T'}_\infty(\pi_\rho(p)) \geq_k v^T_\infty(p)$ in the [knowledge order](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/researching/_archive/teaching/explanations/knowledge-order.md) — the extended theory's settled state is at least as informed as the original on all shared predicates.
3. **Strict advance**: there exists a [resource](../../../../../../../../../../../information-science-services-section/content/text/glossary/terms/resource.md) $(v^R, \iota, T)$ such that $v^R_{T',\infty} >_k v^R_{T,\infty}$ strictly — the extended theory prescribes a genuinely more informed ideal for at least one placed settling.

Given a researching morphism $\rho : T \to T'$ and a resource $(v^R, \iota, T)$, the composition $\iota' := \pi_\rho \circ \iota : \mathcal{C}^R \hookrightarrow \mathcal{C}^{T'}$ makes $(v^R, \iota', T')$ a resource in the extended theory. The inequality $v^R_{T',\infty} \geq_k v^R_{T,\infty}$ is the functoriality result of [resource-quality-decomposition](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/researching/theorems/resource-quality-decomposition.md); the strict advance condition singles out those theory extensions that produce genuinely new ideal content for some resource.

## Contrast with the idealization morphism

| Morphism | Acts on | Changes theory? | Changes resource settling? |
|---|---|---|---|
| Idealization $\eta^T_R : v^R \to v^R_{T,\infty}$ | resource settling | No | Yes (up in $\leq_k$) |
| Researching $\rho : T \to T'$ | host theory | Yes | No (directly) |
| Refactoring (automorphism of $v^R$) | resource settling | No | No (lateral) |

The idealization morphism moves a resource settling toward a fixed ideal, within a fixed theory. The researching morphism moves the ideal itself — it changes $v^T_\infty$, which changes $v^R_{T,\infty} = \iota^*(v^T_\infty)$ for every resource in $T$ simultaneously. The resource settling $v^R$ is unchanged by $\rho$; what changes is the standard against which it is measured.

Immediately after a researching morphism $\rho : T \to T'$: the deficit $\mathrm{De}(v^R, T')$ is at least as large as $\mathrm{De}(v^R, T)$ (the more settled theory demands more), and for resources where the strict advance holds, it is strictly larger. New deficiencies appear in settled resources without any change to those resources. This is the mechanism by which advancing a theory reveals new work.

## The non-free character

In a resource-theoretic reading of predication category theory, the "free" operations on resources are those that do not advance their position in the knowledge order: refactorings (invisible automorphisms) and restructurings (visible automorphisms). The [idealization morphism](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/researching/_archive/idealization-morphism.md) is non-free for resources — it requires the settling to genuinely change.

The researching morphism is non-free at the THEORY level: to produce $\rho : T \to T'$, the theory must settle new predicates — $v^{T'}_\infty$ must know things $v^T_\infty$ did not. This is not achievable by automorphisms of $T$ alone. A researching morphism produces new ideal content but requires genuine new discovery; it is the "costly" operation in the category of host theories.

## Relationship to the idealization morphism

Research and idealization are complementary but operate at different levels:

- **Idealization** fills the gap between a resource and its current ideal, within a fixed theory.
- **Researching** moves the ideal, creating new gaps across all resources, within no fixed theory.

The two can compose: $\rho : T \to T'$ creates new deficiencies in $(v^R, \iota', T')$; then $\eta^{T'}_R : v^R \to v^R_{T',\infty}$ (if it exists) fills them. The cycle of researching followed by idealization is the basic unit of theory-driven knowledge production.
