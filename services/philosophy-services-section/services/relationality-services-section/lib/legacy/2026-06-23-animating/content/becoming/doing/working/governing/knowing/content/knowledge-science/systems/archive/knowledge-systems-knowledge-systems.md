---
title: "Knowledge Systems"
component-of: information
description: "The branch of information theory that studies arrangements of artifacts and procedures by which a community produces, classifies, transmits, and uses knowledge — the 'knowledge theory' stratum of this corpus."
---

# Knowledge Systems

This directory carries what another corpus would call *knowledge theory*: how knowledge is structured, encoded, organized, transmitted, and refined. The corpus's working position is that knowledge theory and the theory of knowledge *systems* are the same investigation at different altitudes; whether a separate `knowledge-theory/` parent earns existence is held in [knowledge-theory-as-explicit-layer](theories/markdown-vault-knowledge-system/theories/predicated-markdown-vault-knowledge-system/questions/knowledge-theory-as-explicit-layer.md).

## Scope

A *knowledge system*, for the purposes of this directory, is anything that:

1. Holds knowledge claims as discrete artifacts (notes, records, files, statements).
2. Organizes those artifacts by some classificatory scheme (taxonomy, faceted scheme, graph, ontology).
3. Supports operations on the artifacts that preserve or refine their epistemic status (assertion, query, update, validation, citation, retraction).
4. Has a community of producers and consumers whose practices the system is built to support.

Libraries, archives, encyclopedias, scientific publication systems, knowledge bases, semantic wikis, ontology editors, terminology databases, and the markdown vault you are reading right now are all knowledge systems by this scope.

## What lives here

- [`concepts/`](concepts/_index.md) — the cross-subtheory shared vocabulary. Currently three concepts promoted from the parent's `terms/` glossary under the [term-to-typed-migration](theories/markdown-vault-knowledge-system/theories/predicated-markdown-vault-knowledge-system/morphisms/term-to-typed-migration.md) discipline: [domain-analysis](concepts/domain-analysis.md), [faceted-classification](concepts/faceted-classification.md), [integrative-levels](concepts/integrative-levels.md). These are the historical knowledge-organization anchors the predicated subtheory recasts in substrate terms.
- [`terms/`](terms/) — historical glossary entries. The three substantive terms have been promoted to typed concepts under `concepts/`; the term files remain as redirect stubs to preserve their aliases.

The current subtheories:

- **[`predicated-knowledge-systems/`](theories/predicated-knowledge-systems/)** — knowledge systems whose contents are explicitly modeled as predication structures (using [predication categories](../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md) and [predicated computing](../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/_index.md)). The general theory of *what predication buys a knowledge system*.
- **[`markdown-vault-knowledge-system/`](theories/markdown-vault-knowledge-system/)** — knowledge systems whose primary medium is a directory tree of markdown files with YAML frontmatter. The general theory of vault-shaped knowledge systems independent of any particular schema. Has its own subtheory [`predicated-markdown-vault-knowledge-system/`](theories/markdown-vault-knowledge-system/theories/predicated-markdown-vault-knowledge-system/), the intersection that this corpus itself instantiates.
- **[`formal-concept-analysis/`](theories/formal-concept-analysis/)** — the Galois-connection knowledge-representation lineage (Wille, Ganter, Belohlavek). Companion subtheory recovering the FCA tradition as a degenerate sub-substrate of the predicated framing.

