---
title: "Sub-theories of predicated computing"
component-of: predicated-computing
---

# theories/

The sub-theories of [predicated-computing](../_index.md) — each a substrate-platform that inherits the parent's predication-substrate commitments and specialises them to a particular engineering register.

The corpus's [theory-promotion morphism](../../../../../../../science/theories/information/theories/knowledge-systems/theories/markdown-vault-knowledge-system/theories/predicated-markdown-vault-knowledge-system/morphisms/theory-promotion.md) is what determines which directories under this one count as theories rather than staging-areas; every directory listed below has cleared that threshold.

## Sub-theories in this directory

- [agential-orchestration-platform/](agential-orchestration-platform/) — the substrate's account of agents, sessions, dispatch, runbooks, and governance. Lifted to the rubric ceiling in pass 3.
- [database-platform/](database-platform/) — query planning, indexes, materialised views, online schema change, transactional discipline.
- [distributed-coordination-platform/](distributed-coordination-platform/) — leader election, quorum, distributed locks, sharding, replica reconciliation.
- [functional-runtime-platform/](functional-runtime-platform/) — programs as substrate content; types, functions, effects, capabilities, evaluation. Lifted to the rubric ceiling in pass 2.
- [interactive-application-platform/](interactive-application-platform/) — accounts, documents, lists, forms, the user-facing application surface.
- [web-server-platform/](web-server-platform/) — HTTP / REST / GraphQL surface; the request-response register over the substrate.

Each sub-theory is itself a theory directory in the strict sense: it carries its own concepts, objects, morphisms, theorems, examples, narratives, questions, references, and the substrate-platform commitments that make its content load-bearing under the parent.

## Convention

Every sub-theory follows the spatiotemporal-knowledge research-directory convention: one entity per Markdown file, frontmatter declares the type, slugs are stable lower-kebab-case, the `_index.md` declares the theory's discipline. Sub-theories may themselves carry sub-sub-theories under their own `theories/` directories — the [flatfile-agentic-resource-system](agential-orchestration-platform/theories/flatfile-agentic-resource-system/) under AgOP is the canonical example.
