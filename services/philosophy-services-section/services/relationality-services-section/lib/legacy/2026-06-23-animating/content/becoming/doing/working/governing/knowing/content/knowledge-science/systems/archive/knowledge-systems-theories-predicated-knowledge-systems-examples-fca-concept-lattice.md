---
type: example
status: instance
depends-on: [concept-lattice-as-degenerate-fiber, predicated-knowledge-system]
see-also: []
---

# FCA concept lattice as a predicated knowledge system

A formal concept analysis (Ganter & Wille 1999) of a small formal context, read as a predicated knowledge system per [concept-lattice-as-degenerate-fiber](../objects/concept-lattice-as-degenerate-fiber.md).

## A worked formal context

Consider the formal context $(G, M, I)$ with objects $G = \{\text{lion}, \text{eagle}, \text{salmon}, \text{frog}\}$ and attributes $M = \{\text{has-fur}, \text{has-feathers}, \text{has-scales}, \text{lives-in-water}, \text{lives-on-land}, \text{can-fly}\}$. The incidence relation:

| | has-fur | has-feathers | has-scales | lives-in-water | lives-on-land | can-fly |
|---|---|---|---|---|---|---|
| lion | × | | | | × | |
| eagle | | × | | | × | × |
| salmon | | | × | × | | |
| frog | | | | × | × | |

The Galois closure of this context produces the concept lattice with concepts including: $\langle \{\text{lion, eagle, frog}\}, \{\text{lives-on-land}\} \rangle$, $\langle \{\text{salmon, frog}\}, \{\text{lives-in-water}\} \rangle$, $\langle \{\text{eagle}\}, \{\text{has-feathers, lives-on-land, can-fly}\} \rangle$, etc.

## The substrate reading

Per the degenerate-fiber framing:

- $\mathbf{L} = \mathbf{2}$
- $\mathcal{C}$ = the trivial predicate category with one binary predicate, `has-attribute`
- $E$ = $\{\text{lion}, \text{eagle}, \text{salmon}, \text{frog}, \text{has-fur}, \text{has-feathers}, \text{has-scales}, \text{lives-in-water}, \text{lives-on-land}, \text{can-fly}\}$ (objects and attributes both)
- $\mathcal{S}$ = the Galois-closure closure-rule system
- $\Sigma$ = the trivial single-scope family

The substrate cells are: `(lion, has-attribute, has-fur)` valued $t$, `(lion, has-attribute, lives-on-land)` valued $t$, ..., `(salmon, has-attribute, has-scales)` valued $t$, etc. The substrate's settling under $\mathcal{S}$ produces the closed pairs of the Galois closure as substrate-level fixpoints; the lattice ordering is the specialisation ordering on the fixpoints.

## What is lost relative to a non-degenerate reading

If the same context were extended to a non-degenerate predicated knowledge system:

- **$\mathbf{L} = \mathbf{2} \otimes \mathbf{2}$**: separate sources could attest each cell with positive evidence; conflicting sources would produce $\top$ rather than silent overwrite. The example is too small to show this gain; a larger context with multiple zoologists' classifications would.
- **Richer $\mathcal{C}$**: the attribute set could be structured by the predicate-category morphisms (`has-fur` and `has-feathers` both specialise `has-body-covering`; `lives-in-water` and `lives-on-land` are mutually-exclusive sibling specialisations of `has-habitat`). The substrate's specialisation morphisms would propagate evidence across the structure. FCA does not natively carry this; it requires pre-processing or a separate ontology layer.
- **Domain-specific closure rules**: a rule "if $g$ has-attribute lives-in-water and $g$ has-attribute lives-on-land then $g$ is amphibious" can be added to the closure-rule system, deriving a new attribute. FCA does not natively admit such rules; they require extending FCA to many-valued contexts with logic-programming rule layers.

## What is preserved

Even at the degenerate level, FCA is a *legitimate* predicated knowledge system. Its concept-lattice extraction is a substrate-level operation; its concept-as-Galois-closed-pair definition is a substrate-level fixpoint. The structural account of FCA is not lost by the substrate reading — it is *recovered* as a special case, with the substrate machinery available as an extension path.
