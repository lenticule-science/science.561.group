---
title: "Set Theory"
description: "The extensional theory of sets, membership, relations, and the constructions that make sets a foundation for mathematics."
date-created: 2026-06-19
type: explanation
article-kind: overview
status: canonical
source-snapshot: 2026-08-17-windows-561-group
source-corpus: set-theory
---

# Set theory

Set theory treats a set as the extension of a predicate: the collection of exactly those objects for which membership holds. The primitive relation is $x \in S$. Extensionality says that two sets are equal precisely when they have the same members. In ZFC, the formation axioms restrict which predicates determine sets, avoiding unrestricted-comprehension paradoxes such as Russell's.

The basic constructions form a dependency chain. Elements and membership support subsets; ordered pairs are encoded as sets (for example, by Kuratowski's construction); binary relations are subsets of Cartesian products; and a function is a relation with exactly one output for each domain element. Domain and codomain are part of a function's identity, while its image is the subset of the codomain that is actually reached. Union and intersection are the join and meet of the inclusion-ordered power set, and the power set itself is the canonical Boolean algebra.

The set-theoretic language generalizes categorically: a global element of an object is an arrow from the terminal object, a subset becomes a subobject, and a relation becomes a morphism into a subobject classifier. Those analogies preserve the structural role of membership without pretending that every category has literal elements.

## Canonicalization ledger

The 62 files in the 2026-08-17 Windows snapshot were one corpus, not 62 independent documents. Three rendered HTML families and several Markdown families repeated the same eleven elementary entries (ten glossary terms plus the `element` concept: binary relation, codomain, domain, element, equivalence relation, incidence relation, intersection, ordered pair, set, subset, and union). They are retained as provenance in the destination legacy bundle; they do not become parallel live pages.

The live canonical homes are:

- Terms: `content/text/glossary/terms/{binary-relation,codomain,domain,equivalence-relation,incidence-relation,intersection,ordered-pair,set,subset,union}.md`.
- Concept: `content/text/glossary/terms/element.md`; the `member` spelling is an alias, not a second term.
- Relation metadata: the specialized `element-of` entry remains the mathematics section's positional relation term at `math-services-section/content/text/glossary/terms/element-of.md`; it is not conflated with ordinary set membership.
- Overview notes: `content/text/documents/articles/notes/2025-12-26-note-on-sets.md` and `content/text/documents/articles/notes/2025-12-26-note-on-relations-functions.md` retain the entry-level lessons.
- Formalization note: `math-services-section/content/text/documents/articles/notes/proof-of-banach-tarski-invalidity.md` retains the Agda/proof-status source and its explicit unfillable hole; it is not promoted to a valid classical Banach–Tarski proof.

The source families map as follows:

| Snapshot family | Canonical treatment |
| --- | --- |
| `from-research-set-theory-terms-*` (11 term pages plus 1 index) | Merge into the ten glossary terms and the `element` concept; the HTML index is an index duplicate. |
| `math-domains-sets-terms-*` (11 term pages plus 1 index) | Merge into the same ten terms and `element` concept; the HTML index is an index duplicate. |
| `set-theory-terms-*` (10 Markdown terms plus the `member` Org note) | Merge into the same terms/concept, with `member` retained as the `element` alias. |
| `set-theory-code-structures-*` and `set-theory-code-transformers-*` (10 pages) | Treat as alternate generated representations of the same term definitions; no code-shaped duplicate pages. |
| `domain.md`, `math-terms-domain.html`, `element-of.md`, `math-terms-element-of.html` | Merge into the domain term and the distinct positional `element-of` relation term. |
| `set-theory-concepts-element.md` | Merge into the single `element` concept page. |
| `*-texts-*`, `*-prose-teaching-*` (10 teaching/index pages) | Merge into the two existing overview notes; rendered indexes remain provenance only. |
| `set-theory.md` | This canonical overview note. |
| `set-theory-src-agda-relational-banach-tarski-proof-of-banach-tarski-invalidity-001336.md` | Existing formalization note, preserving its constructive scope and unfilled proof hole. |

No source claim is discarded merely because a filename was flattened. Unique explanations, formulas, distinctions, dates, and proof-status caveats are represented in the live pages above. The redundant Windows snapshot was removed after this canonicalization; it is available through Git history rather than a live legacy subtree.
