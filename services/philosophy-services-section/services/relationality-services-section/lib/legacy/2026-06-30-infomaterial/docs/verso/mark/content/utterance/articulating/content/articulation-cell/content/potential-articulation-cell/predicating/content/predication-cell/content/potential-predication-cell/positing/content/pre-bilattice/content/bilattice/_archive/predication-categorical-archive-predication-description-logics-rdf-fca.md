---
type: narrative
discusses: [predication-settling, four-bilattice, closure-operator, predicate-category]
---

# predication settlings and existing knowledge-representation formalisms

Three classical knowledge-representation frameworks each correspond to a particular specialization of the predication-settling construction.

**RDF triple stores** ([@hayes-patelschneider2014]). An RDF graph is a two-valued predication settling: triples are either present or absent, positive only. The predication settling generalization to bilattice values lets the framework handle negative assertions, conflicts (encoded as $\top$), and partial information (encoded as $\bot$) natively — addressing the well-known limitations of RDF's monotone, positive-only semantics. The four states of [$\mathbf{FOUR}$](../../objects/four-bilattice.md) are exactly what RDF needs to express disagreement and gaps without closed-world workarounds.

**Description logics** ([@baader-et-al2003]). Classical DLs are two-valued. Paraconsistent DLs ([@ma-hitzler2009]; [@zhang-et-al2009]) extend DL semantics to $\mathbf{FOUR}$, but without developing the structural theory of the knowledge base as an object. predication settlings supply that structural theory: the [predicate category](../../objects/predicate-category.md) plays the role of the RBox; the [closure operator](../../morphisms/closure-operator.md) implements TBox inference; the settling evaluates ABox queries on the post-closure state. The semantic soundness of a "bilattice-valued OWL" follows directly from the [settling convergence](../../theorems/settling-convergence.md) and [modal finite model property](../../theorems/modal-finite-model-property.md) results.

**Formal Concept Analysis** ([@ganter-wille1999]. A formal context $(G, M, I)$ with $I \subseteq G \times M$ is a Chu space over $\mathbf{Set}$; the resulting concept lattice is the lattice of Galois-closed subsets. FCA is the Boolean-valued case; an settle-based "bilattice-valued FCA" generalizes to handle inconsistencies in formal contexts, retaining the Galois-closure machinery while admitting the four-valued state space.

In each case, the predication-settling construction reduces to the existing framework when restricted to a Boolean fiber and a discrete predicate category, while the bilattice and category structure provide native handling of the limitations the existing frameworks face — disagreement, partial information, and the need for compositional inference.
