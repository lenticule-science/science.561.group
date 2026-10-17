---
type: morphism
class: structure-morphism
depends-on: [d-frame]
kind: morphism
---

# d-frame morphism

A **d-frame morphism** $f : \mathbb{L} \to \mathbb{L}'$ between two d-frames $\mathbb{L} = (L_+, L_-, \mathrm{con}, \mathrm{tot})$ and $\mathbb{L}' = (L'_+, L'_-, \mathrm{con}', \mathrm{tot}')$ is a pair $f = (f_+, f_-)$ of frame homomorphisms

$$f_+ : L_+ \to L'_+, \qquad f_- : L_- \to L'_-$$

(each preserving finite meets and arbitrary joins) that jointly preserve the relations:

- **Preserves consistency:** $(a, b) \in \mathrm{con} \Rightarrow (f_+(a), f_-(b)) \in \mathrm{con}'$.
- **Preserves totality:** $(a, b) \in \mathrm{tot} \Rightarrow (f_+(a), f_-(b)) \in \mathrm{tot}'$.

Composition is component-wise. The category $\mathbf{dFrm}$ has [d-frames](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/d-frame.md) as objects and these morphisms as 1-cells.

## Reading

A d-frame morphism transports a positive-and-negative-with-consistency-and-totality structure to another such structure, respecting all four pieces. It is the natural notion of structural map between d-frames and the morphism class used in defining sheaves valued in d-frames.

The bilattice and paired-Priestley charts have their own natural morphism classes ([bilattice homomorphism](bilattice-homomorphism.md), continuous order-preserving swap-equivariant maps); under [Jung–Rivieccio duality](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/references/jung-rivieccio-duality.md) and the bilattice ↔ d-frame correspondence ([@jakl2025] §4.1), d-frame morphisms correspond to bilattice homomorphisms and to paired-Priestley-space morphisms respectively.
