---
type: theorem
status: established
depends-on: [residuated-context, concept-lattice]
see-also: [basic-theorem-of-fca]
references:
  - id: belohlavek2004
    type: document
    title: Belohlavek, Concept Lattices and Order in Fuzzy Logic (2004)
---

# Belohlavek's bridge: from binary to residuated FCA

The structural theorem extending the basic theorem of FCA to residuated-lattice-valued contexts. It is the technical bridge between classical FCA and the predicated framing's bilattice value-domain.

## Statement

**Theorem (Belohlavek 2004, Theorem 13).** Let $\mathbb{K} = (G, M, \mathbf{L}, I)$ be a residuated context (per [residuated-context](../objects/residuated-context.md)), $\mathbf{L}$ a complete residuated lattice. Then the set $\mathfrak{B}(\mathbb{K})$ of $\mathbf{L}$-valued formal concepts $(A, B)$ with $A^{\uparrow} = B$, $B^{\downarrow} = A$, ordered by $\mathbf{L}$-valued extent inclusion, is a complete $\mathbf{L}$-lattice.

Conversely, every complete $\mathbf{L}$-lattice arises (up to $\mathbf{L}$-isomorphism) as $\mathfrak{B}(\mathbb{K})$ for some residuated context $\mathbb{K}$ with that value-lattice.

## Proof sketch

The proof structure mirrors the binary basic theorem (per [basic-theorem-of-fca](basic-theorem-of-fca.md)) with residuated suprema and infima replacing the Boolean ones, and the residuated implication $\to_{\mathbf{L}}$ replacing the Boolean implication. The key adjustment: the universal quantifier in the derivation operator becomes the residuated infimum $\bigwedge_{g \in G}(A(g) \to_{\mathbf{L}} I(g, m))$, and the closure operator $({-})^{\uparrow\downarrow}$ remains a closure of $\mathbf{L}$-valued sets (extensive, monotone, idempotent in the residuated sense).

The completeness of $\mathfrak{B}(\mathbb{K})$ as an $\mathbf{L}$-lattice and the converse representation follow by direct generalisation of the Boolean argument, with all set operations replaced by their residuated counterparts.

## Specialisations

- **$\mathbf{L} = \mathbf{2}$** (the two-element Boolean residuated lattice): recovers the classical Wille basic theorem (per [basic-theorem-of-fca](basic-theorem-of-fca.md)).
- **$\mathbf{L} = [0, 1]$ with Łukasiewicz residuation**: recovers Belohlavek's earlier Łukasiewicz-FCA construction.
- **$\mathbf{L} = $ a finite Heyting algebra**: recovers the intuitionistic-FCA case studied by Pollandt and others.
- **$\mathbf{L} = \mathbf{2} \otimes \mathbf{2}$ (the Belnap bilattice viewed as a residuated structure on its truth-order)**: this is the bridge to the predicated framing; see below.

## Bridge to the predicated framing

When $\mathbf{L}$ is the truth-order projection of the bilattice $\mathbf{2} \otimes \mathbf{2}$ used by the [predicated-knowledge-systems](../../predicated-knowledge-systems/) substrate, Belohlavek's residuated-FCA construction *embeds* into the substrate's [knowledge-fiber-algebra](../../predicated-knowledge-systems/objects/knowledge-fiber-algebra.md) as the fiber over the trivial single-predicate vocabulary $\{`\mathrm{has\text{-}attribute}`\}$, with the closure-rule system fixed at the residuated Galois closure.

Concretely, the embedding sends a residuated context $\mathbb{K} = (G, M, \mathbf{L}, I)$ to the predicated knowledge system

$$\mathcal{E}_{\mathrm{rFCA}}(\mathbb{K}) := (\mathbf{L}, \mathcal{C}_{\mathrm{trivial}}, G \cup M, \mathcal{S}_{\mathrm{Galois}}, \Sigma_0)$$

— the substrate over the fiber-value-lattice $\mathbf{L}$, with the trivial single-binary-predicate category, with substrate entities the disjoint union of objects and attributes, with the Galois closure-rule system, and with the trivial single scope. The embedding's image is exactly the substrate's restricted sub-substrate corresponding to the FCA-degeneration; the rest of the substrate's machinery (the non-trivial predicate vocabulary, additional closure rules, scope structure, witness reification) is what the predicated framing adds beyond residuated FCA.

This is the precise sense in which "FCA is a degenerate predicated knowledge system" (per the companion subtheory's [concept-lattice-as-degenerate-fiber](../../predicated-knowledge-systems/objects/concept-lattice-as-degenerate-fiber.md)). Belohlavek's theorem is the technical guarantee that the embedding preserves the FCA-internal structure; the predicated framing's additions are conservative over the FCA fragment.
