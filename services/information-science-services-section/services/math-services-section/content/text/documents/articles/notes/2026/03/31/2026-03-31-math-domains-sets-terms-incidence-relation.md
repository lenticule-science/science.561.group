---
title: "emsenn.net"
type: "relation"
date-created: 2026-03-31
description: A relation between objects and attributes recording which objects have which attributes.
---

A relation between objects and attributes recording which objects have which attributes. The data of a formal context.

An incidence relation II between a set of objects GG and a set of attributes MM records which objects have which attributes.

In the binary case, I⊆G×MI \subseteq G \times M: either object gg has attribute mm or it does not. A checkmark in a spreadsheet cell. A key present or absent in a YAML frontmatter block.

In the many-valued case, I:G×M→LI: G \times M \to L for some value set LL: each object-attribute pair carries a value from LL. When LL is the four-valued [bilattice](../../../../research/2026/07/31/algebra/terms/bilattice.md) {⊥,t,f,⊤}\{\bot, t, f, \top\}, the incidence records the [epistemic state](../../../../../../../../../../content/text/glossary/terms/epistemic-state.md) of each assertion — unattested, affirmed, denied, or contested.

An incidence relation is the data of a [formal context](../../../../research/2026/07/31/logic/terms/formal-context.md) (G,M,I)(G, M, I). The [Galois connection](../../../../../../glossary/terms/galois-connection.md) derived from II extracts the [concept lattice](../../../../../../glossary/terms/concept-lattice.md): the formal concepts and their hierarchy.

A [Chu space](../../../../../../glossary/terms/chu-space.md) (Pratt 1999) is a generalization: a triple (A,r,X)(A, r, X) where r:A×X→Lr: A \times X \to L is the evaluation function. A formal context with incidence I:G×M→LI: G \times M \to L is a Chu space with A=GA = G, X=MX = M, r=Ir = I.
