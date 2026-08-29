---
id: curry-howard-lambek-tetrad
name: CurryHowardLambekTetrad
description: "The Curry-Howard-Lambek correspondence: types ~ propositions ~ objects ~ programs, extended by Scott to four columns, each naming the same mathematical content in a different register."
---

### Conjecture — The Curry-Howard-Lambek Tetrad {#curry-howard-lambek-tetrad}

The Curry-Howard correspondence (1934/1958/1969) identifies:
- **Types** in a type theory with **propositions** in a logic
- **Terms/programs** with **proofs**
- **Type inhabitation** with **provability**

Joachim Lambek (1969–1980) extended the correspondence to cartesian closed categories: a type theory, an intuitionistic propositional logic, and a cartesian closed category are three presentations of the same structure. Dana Scott's work on domain theory adds a fourth column: denotational semantics, where types denote domains and proofs denote elements.

| Type theory | Logic | Category theory | Domain theory |
|-------------|-------|-----------------|---------------|
| Type | Proposition | Object | Domain |
| Term | Proof | Morphism | Element |
| Function type | Implication | Exponential object | Function space |
| Product type | Conjunction | Product | Product domain |
| Computation/reduction | Normalization | Composition | Approximation |

#### Correspondence {#chl-tetrad-correspondence}

| CHL axis | Fourfold axis | Section in $R$ |
|----------|--------------|-----------------|
| Type theory (types, terms) | Object | §history-and-fiber-algebra |
| Logic (propositions, proofs) | Quality | §modal-calculus |
| Category theory (objects, morphisms) | Relation | §sheaf-construction |
| Domain theory (computation, approximation) | Act | §closure-and-self-generation |

In $R$: the fiber HA data IS the algebraic object; FiberNuclearLanguage IS the propositional logic of the fiber; the topos $R$ IS the categorical object that classifies this logic; the nuclei acting IS the computational dynamics (KZ monads, reduction to fixed points).

#### What This Illuminates {#chl-tetrad-illuminates}

The CHL correspondence is the most technically precise of the external tetrads. It shows that the nuclear quartet, at the language/algebra interface, is not a philosophical choice but a mathematical theorem: propositions are not just metadata about types, they ARE the same structure seen differently. In $R$, FiberNuclearLanguage propositions literally are elements of the fiber HA — the language section and the algebra section share objects; they are distinguished only by which axis of disclosure is foregrounded.

#### Limits of the Correspondence {#chl-tetrad-limits}

The CHL correspondence is proved for simply-typed lambda calculus and intuitionistic propositional logic. FiberNuclearLanguage is not simply typed (it is nuclear modal). The correspondence holds in spirit but requires adaptation for the specific nuclear structure of $R$.
