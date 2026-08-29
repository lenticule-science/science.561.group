---
type: theorem
status: sketch
depends-on: [predication-settling-category, predication-settling, predication-cell, closure-operator, speech-act, predication-fibration]
see-also: [positing-realizable-factorization, ps-morphism-em-factorization, positing-morphism, positing-universal-property, channel-theoretic-speech-acts]
---

# Every operationally-realizable settling step decomposes as locution × illocution × perlocution

Austin's tripartite speech-act analysis — locution (what is said), illocution (the communicative force), perlocution (the downstream effect) — corresponds exactly to the three-factor decomposition of any operationally-realizable [predication settling](../objects/predication-settling.md) step: cell selection (locution), a positing morphism (illocution), and a closure step (perlocution). This is a categorical factorization in the cell-indexed settling category $\mathbf{PS}_\Phi$.

## Statement

**The cell-indexed settling category $\mathbf{PS}_\Phi$.** Define $\mathbf{PS}_\Phi$ as the Grothendieck construction $\int_\Phi \mathbf{PS}$ where:
- Objects: pairs $(v, \phi)$ of a settling $v$ and a target cell $\phi \in \Phi$.
- Morphisms $(v, \phi) \to (v', \phi')$: pairs $(f, c)$ where $f : v \to v'$ is a $\mathbf{PS}$-morphism ($f$ is a $\leq_k$-increase) and $c : \phi \to \phi'$ is a cell-translation (a morphism in the predicate category between the predicates of $\phi$ and $\phi'$).

The forgetful functor $\pi : \mathbf{PS}_\Phi \to \Phi$ (forgetting the settling) is the **locution projection**: it extracts which cell is being targeted. The fiber of $\pi$ over a cell $\phi$ is the slice $\mathbf{PS}_{/\phi}$ of $\mathbf{PS}$-morphisms that target cell $\phi$.

**Three-factor decomposition theorem.** Every single-cell operationally-realizable $\mathbf{PS}$-morphism $v_0 \to v_1 = \mathrm{cl}(v_0 \vee_k \delta_{\phi, q})$ (for some cell $\phi$ and datum $q$) decomposes in $\mathbf{PS}_\Phi$ as:

$$\underbrace{(v_0,\ \phi) \xrightarrow{(\mathrm{id},\ \phi)}}_{{\rm locution:\ select\ cell\ }\phi}
\underbrace{(v_0,\ \phi) \xrightarrow{(\mathrm{posit}_{(\phi,q)},\ \phi)}}_{{\rm illocution:\ posit\ }q{\rm\ at\ }\phi}
\underbrace{(v_0 \vee_k \delta_{\phi,q},\ \phi) \xrightarrow{(\mathrm{cl},\ \phi)}}_{{\rm perlocution:\ closure\ step}}
(v_1,\ \phi).$$

The locution factor selects $\phi$ as the target cell (without yet changing any settling value). The illocution factor applies the positing morphism $\mathrm{posit}_{(\phi, q)}$ at the selected cell, injecting datum $q$. The perlocution factor applies the closure operator $\mathrm{cl}$, deriving all consequences of the injected evidence.

**Multi-cell generalization.** For a batch positing morphism $\mathrm{posit}_W$ targeting cells $\{\phi_1, \ldots, \phi_n\}$, the decomposition extends:

$$\underbrace{(v_0,\ W)}_{{\rm locution:\ select\ }W}
\xrightarrow{(\mathrm{posit}_W,\ W)}
\underbrace{(v_0 \vee_k W,\ W)}_{{\rm illocution:\ batch\ posit}}
\xrightarrow{(\mathrm{cl},\ W)}
\underbrace{(v_1,\ W)}_{{\rm perlocution:\ closure}}$$

where $W$ is treated as the "multi-cell locution" — the set of targeted cells. The batch positing step (illocution) is a joint speech act; the closure step (perlocution) is the settling's deterministic inference from all the evidence just injected.

## Proof

The existence of the decomposition follows directly from the [positing-realizable-factorization theorem](positing-realizable-factorization.md): every operationally-realizable morphism $v_0 \to v_1$ can be written as $\mathrm{posit}_{(\phi, q)}$ followed by $\mathrm{cl}$ (by definition of operational realizability). The locution factor is the metalinguistic cell-selection, formalized in $\mathbf{PS}_\Phi$ as the choice of $\phi \in \Phi$ as the object component of the pair. $\square$

**Uniqueness.** Given $v_0$ and $v_1 = \mathrm{cl}(v_0 \vee_k \delta_{\phi, q})$, the decomposition is not unique if multiple cells and data can produce the same $v_1$. The decomposition is unique up to: (a) choice of $\phi$ and $q$ (the minimal positing collection $W_{\min}$ is unique; see [positing-realizable-factorization](positing-realizable-factorization.md)), and (b) commutativity of independent positing steps at distinct cells.

## The illocution as pre-unit preparation

From [positing-universal-property](positing-universal-property.md): the positing step $\mathrm{posit}_{(\phi, q)}$ is followed by the closure unit $\eta_{v_0 \vee_k \delta_{\phi,q}}$ (the unit of the closure 2-monad $\mathbb{T}$ at the post-positing settling). The two-factor decomposition (illocution; perlocution) is therefore:

$$v_0 \xrightarrow{\mathrm{posit}_{(\phi, q)}} v_0 \vee_k \delta_{\phi, q} \xrightarrow{\eta} \mathrm{cl}(v_0 \vee_k \delta_{\phi, q}) = v_1$$

where $\eta$ is the monad unit at the intermediate settling. The illocution $\mathrm{posit}_{(\phi, q)}$ prepares the settling for closure; the perlocution $\eta$ is the monad unit that closes it. This identification makes the three-factor decomposition a categorical structure: (locution, choosing the slice) × (illocution, pre-unit positing) × (perlocution, monad unit).

## What the locution factor is not

In $\mathbf{PS}$ alone, there is no "cell-selection morphism" — every morphism is a $\leq_k$-increase across all cells simultaneously; selecting a single cell to target is metalinguistic. The extension to $\mathbf{PS}_\Phi$ internalizes this selection by pairing each settling with its target cell. The locution factor is thus the **projection to $\Phi$**: the act of choosing which cell to address, prior to any evidence injection.

This categorical picture clarifies why Austin's locution is *not* itself an illocutionary act: it is the prior selection of the semantic domain (which cell) in which the illocutionary act will take place. In $\mathbf{PS}_\Phi$, the locution is the fiber-selection step in the Grothendieck construction; the illocution is the morphism within the selected fiber.

## Perlocutionary determinism

Austin's perlocution includes unintended downstream effects (the listener is persuaded, alarmed, offended). In PredCat, the closure operator is deterministic: it derives exactly what the rules say, no more, no less. The perlocutionary step $\mathrm{cl}$ is therefore **rule-governed** and predictable — no unintended effects. This is a deliberate idealization of the speech-act model, applicable to formal systems (databases, knowledge bases, institutional rule systems) where the inference rules are fixed and mechanistic. In natural language, unintended perlocutionary effects would require a more general (non-deterministic or probabilistic) closure operator.
