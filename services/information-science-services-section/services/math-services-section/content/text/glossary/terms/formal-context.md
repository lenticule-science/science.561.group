---

introduces: semantic-framework
description: "A triple (G, M, I) of objects, attributes, and an incidence relation — the input structure for formal concept analysis."
defines: formal-context
aliases: [formal context, formal contexts, cross table]
made-of: [objects, attributes, incidence-relation]
produces: concept-lattice
derivation-operators: galois-connection
fixed-points-are: formal-concept
is-a: chu-space
binary-version: "I: G × M → {0,1}"
many-valued-version: "I: G × M → L for residuated lattice L"
bilattice-valued-version: "I: G × M → {⊥, t, f, ⊤}"
inherits-residuation-when: "L is a residuated lattice (Belohlavek 2004)"
instances: [spreadsheet, yaml-frontmatter, database-table, rdf-dataset]
method: formal-concept-analysis
introduced-by: ganter-wille-1999
generalized-by: [pratt-1999, belohlavek-2004]
date-created: 2026-03-30
type: term

---

A formal context (Ganter & Wille 1999) is a triple $(G, M, I)$ where $G$ is a set of objects, $M$ is a set of attributes, and $I \subseteq G \times M$ (or $I: G \times M \to L$ for a many-valued context) is an incidence relation.

$I(g, m)$ states that object $g$ has attribute $m$. In the binary case, this is yes/no. In the many-valued case, $I(g, m)$ takes a value from a structured set $L$.

The derivation operators on a formal context define a Galois connection between subsets of objects and subsets of attributes. The fixed points of this connection — pairs $(A, B)$ with $A' = B$ and $B' = A$ — are the formal concepts. They form a [concept lattice](./concept-lattice.md).

A formal context is a Chu space over the value set (Pratt 1999). Binary formal contexts are Chu spaces over $\{0,1\}$.

Any collection of key-value records sharing attribute names is a formal context: records are objects, attribute names are attributes, values give the incidence. A repository of YAML files with frontmatter is a formal context where the files are objects and the frontmatter keys are attributes.

When the incidence is valued in a [residuated lattice](./residuated-lattice.md) $L$, the concept lattice inherits $L$'s residuated structure (Belohlavek 2004). When $L$ is the four-valued [bilattice](./bilattice.md), the concept lattice has [Lambek calculus](./lambek-calculus.md) structure.
