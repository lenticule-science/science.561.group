---
type: definition
class: generalised-substrate
status: stable
depends-on: [formal-context, derivation-operator]
see-also: [belohlavek-bridge, concept-lattice]
name: Residuated context
description: "A residuated (or $\\mathbf{L}$-valued) formal context is a quadruple $\\mathbb{K} = (G, M, \\mathbf{L}, I)$ where $G$ and $M$ are sets, $\\mathbf{L}$ is a complete residuated lattice $(\\mathbf{L}, \\wedge, \\vee, \\otimes, \\to, 0, 1)$, and $I: G…"
---


A **residuated (or $\mathbf{L}$-valued) formal context** is a quadruple $\mathbb{K} = (G, M, \mathbf{L}, I)$ where $G$ and $M$ are sets, $\mathbf{L}$ is a complete residuated lattice $(\mathbf{L}, \wedge, \vee, \otimes, \to, 0, 1)$, and $I: G \times M \to \mathbf{L}$ assigns each object–attribute pair a *truth degree* in $\mathbf{L}$.

The classical binary context is the special case $\mathbf{L} = \mathbf{2} = \{0, 1\}$ (the two-element Boolean residuated lattice). Belohlavek (2004) developed the residuated-context framework as the unifying generalisation that absorbs both classical FCA and the various "fuzzy FCA" formulations into a single residuated-lattice-valued construction.

## Derivation operators

The derivation operators (per [derivation-operator](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/derivation-operator.md)) generalise to residuated $\mathbf{L}$-fuzzy sets $A: G \to \mathbf{L}$ and $B: M \to \mathbf{L}$:

$$A^{\uparrow}(m) := \bigwedge_{g \in G} \big(A(g) \to_{\mathbf{L}} I(g, m)\big), \qquad B^{\downarrow}(g) := \bigwedge_{m \in M} \big(B(m) \to_{\mathbf{L}} I(g, m)\big),$$

with $\to_{\mathbf{L}}$ the residuum of $\otimes$ in $\mathbf{L}$. The pair $(({-})^{\uparrow}, ({-})^{\downarrow})$ is again a Galois connection (the *isotone* Galois connection in Belohlavek's formulation), and the closure operators $({-})^{\uparrow\downarrow}$, $({-})^{\downarrow\uparrow}$ are again closures of $\mathbf{L}$-valued sets.

## Concept lattice generalises

A **residuated formal concept** is a pair $(A, B)$ of $\mathbf{L}$-valued sets with $A^{\uparrow} = B$ and $B^{\downarrow} = A$. The set of residuated formal concepts ordered by $\mathbf{L}$-valued inclusion forms a complete $\mathbf{L}$-lattice; Belohlavek's basic theorem (Belohlavek 2004, Theorem 13) is the residuated counterpart of Wille's basic theorem (per [basic-theorem-of-fca](../concepts/basic-theorem-of-fca.md)).

## Why residuated rather than fuzzy

The residuated framework is more general than the various "fuzzy FCA" formulations because:

- The choice of $\mathbf{L}$ is parametric, not fixed at $[0, 1]$. Boolean FCA, $[0, 1]$-fuzzy FCA, finite-chain fuzzy FCA, and product-of-chains fuzzy FCA are all cases of the same construction at different choices of $\mathbf{L}$.
- The choice of $\otimes$ (the residuated operation) is parametric, not fixed at minimum or product. Łukasiewicz, Gödel, and product residuations are all admissible.
- The Galois-connection presentation is uniform: the same proof of the basic theorem works for every choice of $\mathbf{L}$.

This parametricity is what makes the residuated framework the right bridge to the predicated framing (per [theorems/belohlavek-bridge](../concepts/belohlavek-bridge.md)): the substrate's bilattice value-domain $\mathbf{2} \otimes \mathbf{2}$ is one specific choice of residuated lattice, and the substrate's predication-fiber-algebra is the residuated-context construction at that choice.

## Limits of the generalisation

The residuated-context framework retains FCA's characteristic structural choices:

- **Single binary "incidence" predicate.** $I$ is one $\mathbf{L}$-valued binary relation; the framework does not natively admit a structured predicate vocabulary.
- **No closure-rule system beyond the Galois closure.** Domain-specific closure rules require external machinery (typically a separate logic-programming layer).
- **Single global scope.** The framework does not natively admit community-relative subcontexts.

These three limits are exactly the dimensions along which the predicated framing extends FCA. The residuated framework relaxes the value-domain restriction; the predicated framing relaxes the predicate-vocabulary, closure-rule-system, and scope restrictions as well. See [theorems/belohlavek-bridge](../concepts/belohlavek-bridge.md) for the structural correspondence.
