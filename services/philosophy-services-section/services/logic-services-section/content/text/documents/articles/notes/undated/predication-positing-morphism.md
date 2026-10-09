---
type: morphism
class: operator
symbol: "\\mathrm{posit}_{(\\phi,\\, q)}"
status: draft
depends-on: [predication-settling-category, predication-settling, predication-valuation, predication-cell, predication-cell-set, knowledge-order, four-bilattice, predication-fibration]
see-also: [closure-operator, closure-2-monad, positing-realizable-factorization, positing-naturality, belnap-speech-act-partition, temporally-bounded-positing, channel-theoretic-speech-acts]
title: Positing morphism
description: Fix base parameters $(\mathbf{L}, \mathcal{C}, E)$.
---

# Positing morphism

Fix base parameters $(\mathbf{L}, \mathcal{C}, E)$. The **positing morphism** at cell $\phi = (s, p, o) \in \Phi$ with datum $q \in \mathbf{L}^\bowtie$ is the [predication settling category](../../research/2026/07/31/lenticule-import/objects/predication-settling-category.md) morphism

$$\mathrm{posit}_{(\phi,\, q)} : v \longmapsto v \vee_k \delta_{\phi,\, q}$$

where $\delta_{\phi,\, q}$ is the indicator valuation placing $q$ at cell $\phi$ and $\bot$ elsewhere:

$$\delta_{\phi,\, q}(p')(s', o') = \begin{cases} q & \text{if } (s', p', o') = \phi \\ \bot & \text{otherwise.}\end{cases}$$

This is always a valid $\mathbf{PS}$-morphism: $v \leq_k v \vee_k \delta_{\phi, q}$ by construction (join is above each component).

## Four speech-act classes

By the [Belnap speech-act partition theorem](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/belnap-speech-act-partition.md), positing morphisms on $\mathbf{FOUR}$ fall into four classes according to the truth-order class of the datum $q$:

| Datum $q$ | Class | Morphism |
|---|---|---|
| $\bot$ | Abstaining | Identity at $\phi$ — no act |
| $\mathbf{t}$ | Asserting | [Assertive positing morphism](../../research/2026/07/31/lenticule-import/from-predicate-category/assertive-positing-morphism.md) |
| $\mathbf{f}$ | Denying | [Denial positing morphism](../../research/2026/07/31/lenticule-import/from-predicate-category/denial-positing-morphism.md) |
| $\top$ | Contesting | [Contestation positing morphism](../../research/2026/07/31/lenticule-import/from-predicate-category/contestation-positing-morphism.md) |

The four classes are pairwise disjoint and exhaustive on $\mathbf{FOUR}$.

## 2-cell status

By the [positing naturality theorem](../../research/2026/07/31/lenticule-import/theorems/positing-naturality.md), positing is natural under predicate-category reindexing: for any $f : p' \to p$ in $\mathcal{C}$,

$$f^*\!\left(\mathrm{posit}_{(\phi,\, q)}(v)\right) = \mathrm{posit}_{(f^*(\phi),\, q)}\!\left(f^*(v)\right).$$

This upgrades positing from a $\mathbf{PS}$-morphism to a 2-cell in the 2-category $\mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$.

## Role in settling dynamics

A positing morphism is the **evidence-injection** step of the settling. It corresponds to the illocutionary level of a speech act: the communicative act of assigning a bilattice value at a cell. The subsequent closure step $\mathrm{cl}$ is the perlocutionary level: deriving the consequences of the injected evidence.

By the [operationally-realizable factorization theorem](../../research/2026/07/31/lenticule-import/theorems/positing-realizable-factorization.md), every operationally-realizable $\mathbf{PS}$-morphism $v_0 \to v_1$ (one of the form $v_1 = \mathrm{cl}(v_0 \vee_k W)$) factors as a finite composite of positing morphisms followed by exactly one closure morphism.

## Composition

Two positing morphisms at the same cell compose as $\leq_k$-join of their data:

$$\mathrm{posit}_{(\phi,\, q_2)} \circ \mathrm{posit}_{(\phi,\, q_1)} = \mathrm{posit}_{(\phi,\, q_1 \vee_k q_2)}.$$

Positing morphisms at distinct cells $\phi \neq \phi'$ commute:

$$\mathrm{posit}_{(\phi',\, q')} \circ \mathrm{posit}_{(\phi,\, q)} = \mathrm{posit}_{(\phi,\, q)} \circ \mathrm{posit}_{(\phi',\, q')}.$$

The composite of finitely many positing morphisms is a **batch positing morphism** $\mathrm{posit}_W : v \mapsto v \vee_k W$ for the positing collection $W = \bigsqcup_i \delta_{\phi_i, q_i}$.

## Relation to the closure operator

The positing morphism and the [closure operator](../../research/2026/07/31/lenticule-import/from-predicate-category/closure-operator.md) $\mathrm{cl}$ interact without commuting in general:

$$\mathrm{cl}(\mathrm{posit}_{(\phi,\, q)}(v)) \neq \mathrm{posit}_{(\phi,\, q)}(\mathrm{cl}(v))$$

in general, because $\mathrm{cl}$ may derive additional content at $\phi$ from other cells after the posit, while $\mathrm{posit}_{(\phi,q)}(\mathrm{cl}(v))$ adds $q$ to an already-closed state. The ordering — posit first, then close — is the operationally correct one: evidence injection before consequence derivation.

## Relation to the bilattice-stabilization nucleus

The [bilattice-stabilization nucleus](../../research/2026/07/31/lenticule-import/objects/bilattice-stabilization-nucleus.md) $T_a^*$ and the positing morphism are complementary operators: the nucleus is a cell-local closure (applies closure rules within a single cell's value space given a background); positing is a cell-targeted evidence injection (adds a datum to a single cell's value without closing). Together they implement the $\sigma$/$\Delta$-pass decomposition of the substrate's settlement engine.
