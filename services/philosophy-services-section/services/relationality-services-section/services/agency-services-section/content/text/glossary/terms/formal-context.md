---
type: definition
class: substrate-object
status: stable
depends-on: []
see-also: [concept-lattice, derivation-operator]
name: Formal context
description: A formal context is a triple $\mathbb{K} = (G, M, I)$ where $G$ and $M$ are sets and $I \subseteq G \times M$.
---


A **formal context** is a triple $\mathbb{K} = (G, M, I)$ where $G$ and $M$ are sets and $I \subseteq G \times M$. Elements of $G$ are *objects*, elements of $M$ are *attributes*, $(g, m) \in I$ is read "$g$ has attribute $m$" and abbreviated $g \, I \, m$.

This object-level definition is the load-bearing structural commitment of FCA. The conceptual reading is in [concepts/formal-context](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/content/formal-context/teaching/explanations/formal-context.md); this entry records the bare structural data.

## Equality and isomorphism

- Two contexts $(G_1, M_1, I_1)$ and $(G_2, M_2, I_2)$ are **equal** when $G_1 = G_2$, $M_1 = M_2$, and $I_1 = I_2$.
- They are **isomorphic** when there exist bijections $\phi: G_1 \to G_2$ and $\psi: M_1 \to M_2$ such that $g \, I_1 \, m \iff \phi(g) \, I_2 \, \psi(m)$.
- They are **conceptually equivalent** when their concept lattices (per [concept-lattice](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/concept-lattice.md)) are isomorphic as ordered sets.

Conceptual equivalence is strictly weaker than isomorphism — a *clarified* and *reduced* context (Ganter & Wille 1999, §1.2) deletes redundant objects and attributes without changing the concept lattice.

## Standard derived constructions

From a formal context $\mathbb{K} = (G, M, I)$ the lineage derives:

- The **derivation operators** $({-})': \mathcal{P}(G) \to \mathcal{P}(M)$ and $({-})': \mathcal{P}(M) \to \mathcal{P}(G)$ (per [derivation-operator](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/content/formal-context/derivation-operator.md)).
- The **closure operator** $({-})''$ on $\mathcal{P}(G)$ (and dually on $\mathcal{P}(M)$).
- The **set of formal concepts** $\mathfrak{B}(\mathbb{K}) := \{(A, B) \in \mathcal{P}(G) \times \mathcal{P}(M) \mid A' = B, B' = A\}$.
- The **concept lattice** $(\mathfrak{B}(\mathbb{K}), \le)$ ordered by extent inclusion (per [concept-lattice](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/concept-lattice.md)).
- The **implication theory** $\mathrm{Imp}(\mathbb{K})$ and its [implication-base](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/content/formal-context/implication-base.md).

Each derived construction is a structural functor of the context. The basic theorem of FCA (per [theorems/basic-theorem-of-fca](../concepts/basic-theorem-of-fca.md)) characterises the concept lattices that arise this way.

## Generalisations

- The **dual context** $\mathbb{K}^d := (M, G, I^{-1})$ swaps the roles of $G$ and $M$. Concept lattices satisfy $\mathfrak{B}(\mathbb{K}^d) \cong \mathfrak{B}(\mathbb{K})^{\mathrm{op}}$ (the order-dual).
- The **complementary context** $\overline{\mathbb{K}} := (G, M, (G \times M) \setminus I)$ has the complementary incidence; its concept lattice is generally not derivable from $\mathfrak{B}(\mathbb{K})$ in a simple way.
- The **many-valued context** $(G, M, W, I)$ replaces $I$ by a partial function $G \times M \rightharpoonup W$; reduction to a binary context proceeds via [scale](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/content/formal-context/teaching/explanations/scale.md).
- The **residuated context** (per [residuated-context](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/content/formal-context/residuated-context.md)) replaces $I$ by an $\mathbf{L}$-valued function for $\mathbf{L}$ a complete residuated lattice.

## Substrate reading

The formal context is the FCA-internal name for what the predicated framing calls a substrate state restricted to one binary predicate `has-attribute`, with no closure rules beyond the Galois closure. See the companion subtheory's [concept-lattice-as-degenerate-fiber](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/predicated-knowledge-systems/objects/concept-lattice-as-degenerate-fiber.md).
