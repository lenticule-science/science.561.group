---
type: definition
class: structural-operator
status: stable
depends-on: [formal-context]
see-also: [intent-extent-duality, concept-lattice]
title: Derivation operator
description: "The pair of operators $({-})': \\mathcal{P}(G) \\to \\mathcal{P}(M)$ and $({-})': \\mathcal{P}(M) \\to \\mathcal{P}(G)$ induced by a formal context $\\mathbb{K} = (G, M, I)$ via"
---

# Derivation operator

The pair of operators $({-})': \mathcal{P}(G) \to \mathcal{P}(M)$ and $({-})': \mathcal{P}(M) \to \mathcal{P}(G)$ induced by a formal context $\mathbb{K} = (G, M, I)$ via

$$A^{\uparrow} := \{m \in M \mid \forall g \in A.\ g \, I \, m\}, \qquad B^{\downarrow} := \{g \in G \mid \forall m \in B.\ g \, I \, m\}.$$

The lineage writes both operators as $({-})'$ and disambiguates from context; this entry uses the arrows for clarity but follows the lineage's $({-})'$ in subsequent entries.

## Structural facts

- **Antitone.** $A_1 \subseteq A_2 \implies A_2^{\uparrow} \subseteq A_1^{\uparrow}$, dually for $({-})^{\downarrow}$.
- **Galois adjunction.** $A \subseteq B^{\downarrow} \iff B \subseteq A^{\uparrow}$.
- **Closure operators.** $({-})^{\\uparrow\downarrow}: \mathcal{P}(G) \to \mathcal{P}(G)$ and $({-})^{\downarrow\uparrow}: \mathcal{P}(M) \to \mathcal{P}(M)$ are closure operators (extensive, monotone, idempotent).
- **Triple-prime collapse.** $A^{\uparrow\downarrow\uparrow} = A^{\uparrow}$ for every $A$, dually.

These properties are equivalent to the Galois adjunction; either characterisation suffices to define a Galois connection between two complete posets.

## The closed sets

The fixed points of $({-})^{\uparrow\downarrow}$ are exactly the **extents** of $\mathbb{K}$; the fixed points of $({-})^{\downarrow\uparrow}$ are exactly the **intents**. The pair $(A, A^{\uparrow})$ for $A$ an extent is exactly a formal concept of $\mathbb{K}$ (per [concepts/concept-as-closed-pair](../concepts/concept-as-closed-pair.md)).

The **extent system** $\mathrm{Ext}(\mathbb{K}) := \{A \subseteq G \mid A = A^{\uparrow\downarrow}\}$ is closed under arbitrary intersection (so it is a Moore family on $G$) and forms a complete lattice under inclusion. The **intent system** is dually structured.

## Generalisation to residuated values

For a residuated context $\mathbb{K} = (G, M, \mathbf{L}, I)$ with $I: G \times M \to \mathbf{L}$ and $\mathbf{L}$ a complete residuated lattice, Belohlavek (2004) defines

$$A^{\uparrow}(m) := \bigwedge_{g \in G} \big(A(g) \to_{\mathbf{L}} I(g, m)\big), \qquad B^{\downarrow}(g) := \bigwedge_{m \in M} \big(B(m) \to_{\mathbf{L}} I(g, m)\big)$$

for $A: G \to \mathbf{L}$, $B: M \to \mathbf{L}$, where $\to_{\mathbf{L}}$ is residuation in $\mathbf{L}$. The pair $({-})^{\uparrow}, ({-})^{\downarrow}$ is again a Galois connection, the closure operators are residuated-lattice-valued, and the basic theorem survives. See [residuated-context](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/residuated-context.md).
