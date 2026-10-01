---
type: definition
realizes: [truth-order, knowledge-order, settling-quiescence]
class: settling
symbol: "\\hat{v}"
depends-on: [predication-settling, closure-operator, predication-fiber-algebra, truth-order, settling-bound, settling-quiescence]
see-also: [modeling-morphism, predication-settling-category]
name: Predication model
description: "A predication model over $(\\mathbf{L}, \\mathcal{C}, E, \\lambda)$ is a predication settling $\\hat{v}$ that is quiescent at some $\\tau^ < \\lambda$ and whose quiescent value is a closure fixpoint: for all $p \\in \\mathcal{C}$,"
---


A **predication model** over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ is a [predication settling](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/predication-settling.md) $\hat{v}$ that is [quiescent](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-quiescence/settling-quiescence.md) at some $\tau^* < \lambda$ and whose quiescent value is a closure fixpoint: for all $p \in \mathcal{C}$,

$$\mathrm{cl}_p(\hat{v}_{\tau^*}(p)) = \hat{v}_{\tau^*}(p).$$

A predication settling is a predication model iff it has fully absorbed its own inference rules — no further closure step changes its truth assignments at or after $\tau^*$.

## Relation to settling-quiescence

Every predication model is [quiescent](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-quiescence/settling-quiescence.md), by definition. For closure-driven settlings — where $\hat{v}_{\tau+1}(p) = \mathrm{cl}_p(\hat{v}_\tau(p))$ — the two conditions coincide: quiescence at $\tau^*$ forces $\hat{v}_{\tau^*+1}(p) = \mathrm{cl}_p(\hat{v}_{\tau^*}(p)) = \hat{v}_{\tau^*}(p)$, so the fixpoint condition is automatic. For settlings that also receive external increments, quiescence may arrive before the closure has fully propagated — the increment sequence stops but $\mathrm{cl}_p$ could still add. The predication model condition explicitly requires both: quiescence and closure-saturation.

## The model class of a source settling

Given any predication settling $v_0$ over the same base, the **model class** of $v_0$ is the collection

$$\mathrm{Mod}(v_0) := \{\hat{v} \text{ predication model} : v_0 \models \hat{v}\}$$

of predication models that $v_0$ [models into](../../documents/articles/notes/undated/modeling-morphism.md) via the truth order. The model class captures which closed worlds are reachable from $v_0$ by truth-order refinement.

## Canonical predication model

The **all-$\top$ settling** $v_\top$, assigning $\top$ (the $\leq_k$-maximum of $\mathbf{L}^\bowtie$) at every cell and step, is a predication model for every [closure operator](../../documents/articles/research/2026/07/31/lenticule-import/morphisms/closure-operator.md): since $\mathrm{cl}_p$ is $\leq_k$-inflatory and $\top$ is the $\leq_k$-maximum, $\mathrm{cl}_p(\top) \geq_k \top$ and $\mathrm{cl}_p(\top) \leq_k \top$ together force $\mathrm{cl}_p(\top) = \top$. It is the $\leq_k$-maximum predication model.

Whether constant settlings at $\mathbf{f}$, $\bot$, or $\mathbf{t}$ are predication models depends on the specific closure: a closure rule with no antecedents (a zero-premise rule) will fire even from the $\bot$-state, making $v_\bot$ non-quiescent. The $\leq_t$-minimal and $\leq_t$-maximal predication models are therefore closure-specific, not canonical.

## Reading

A predication model is the settling-theoretic counterpart of a classical model in first-order logic: it is a world that fully satisfies its own inference rules, with no pending entailments. The [settling convergence theorem](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/settling-convergence.md) guarantees that every closure-driven settling with finite $\mathbf{L}$, $E$, and $\mathcal{C}$ eventually produces a predication model. For infinite or aperiodic settlings, the predication model may only be reached at a limit ordinal and need not be quiescent at any isolated step.
