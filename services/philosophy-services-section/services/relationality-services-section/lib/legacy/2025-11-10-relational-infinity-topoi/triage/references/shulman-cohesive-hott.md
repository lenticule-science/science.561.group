---
type: reference
class: bibliographic-entry
authors: [Shulman, Michael]
year: 2018
name: shulman-cohesive-hott
venue: "Mathematical Structures in Computer Science 28(6), 856–941; arXiv:1509.07584"
---

## Full citation

M. Shulman. *Brouwer's fixed-point theorem in real-cohesive homotopy type theory.* Math. Struct. Comput. Sci. 28(6) (2018), 856–941. arXiv:1509.07584.

## Status

Standard reference for cohesive homotopy type theory.

## Annotation

Develops the homotopy-type-theoretic counterpart of [Schreiber 2013](schreiber-2013.md)'s cohesive ∞-topos: the modal operators $\Box, \Diamond$ are taken as type-theoretic primitives, and the cohesive quadruple is realized internally as an adjoint structure on the universe of types.

**Relevance to this subtheory:**

- The HoTT formulation of cohesion is the natural target for the formal-Lean side of the relational program. This subtheory's [`lean/`](../lean/) project is at present a stub; a full Lean realization would use Shulman's modal-HoTT formalization as its template.
- The fixed-point theorem proven in this paper is structurally related to the [recursive realization theorem](../theorems/recursive-realization-theorem.md)'s fixed-point statement; both use the lax-idempotence of the cohesive structure to obtain canonical termination.

Cited at training-knowledge level — no specific theorem of this subtheory currently depends on Shulman's results; the reference scaffolds the future-direction Lean work.
