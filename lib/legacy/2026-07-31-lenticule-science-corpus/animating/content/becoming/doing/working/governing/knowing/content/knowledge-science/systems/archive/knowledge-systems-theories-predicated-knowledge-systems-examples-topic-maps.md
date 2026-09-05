---
type: example
status: instance
depends-on: [predicated-knowledge-system, topic-maps-as-degenerate-predication-system]
see-also: [aboutness]
---

# Topic Maps as a predicated knowledge system

ISO/IEC 13250 Topic Maps is a predicated knowledge system under the degenerate-value-domain reading developed in [topic-maps-as-degenerate-predication-system](../theorems/topic-maps-as-degenerate-predication-system.md). This example walks one concrete Topic Map and the substrate operations its standard mechanisms perform.

## A worked Topic Map

A Topic Map about a research community might contain:

- **Topics**: `topic_alice`, `topic_bob`, `topic_neural-networks`, `topic_paper_xyz`, with subject identifiers (IRIs naming what each topic is about).
- **Associations**: `(co-authored, [topic_alice, topic_bob, topic_paper_xyz])`, `(topic-of, [topic_paper_xyz, topic_neural-networks])`, `(supervises, [topic_alice, topic_bob])`.
- **Occurrences**: `(homepage, topic_alice, "https://alice.example/")`, `(pdf, topic_paper_xyz, "https://repo.example/xyz.pdf")`.

## The substrate reading

Per the [theorem](../theorems/topic-maps-as-degenerate-predication-system.md), this is the predicated knowledge system:

- $E$ = $\{$alice, bob, neural-networks, paper_xyz, alice-homepage, paper-pdf$\}$ (the topics and the documents).
- $\mathcal{C}$ contains the predicates `co-authored` (3-ary), `topic-of` (binary), `supervises` (binary), `homepage` (binary), `pdf` (binary), `subject-identifier` (binary). The 3-ary `co-authored` is an [n-ary predication](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/n-ary-predication.md) cell.
- The substrate cells are: `(alice, co-authored, [bob, paper_xyz])` valued $t$, `(paper_xyz, topic-of, neural-networks)` valued $t$, `(alice, supervises, bob)` valued $t$, plus the occurrence and subject-identifier cells.
- $\mathcal{S}$ = the strict-regime closure rules: subject-identifier merge ("topics with shared subject identifier are the same entity"), association-arity check, occurrence-document linkage.

## What substrate operations correspond to Topic Maps operations

| Topic Maps operation | Substrate operation |
|---|---|
| Create topic with subject identifier | [Assert](../morphisms/assert.md) `(topic, subject-identifier, IRI)` predication |
| Add association | Assert n-ary predication cell |
| Add occurrence | Assert binary occurrence-predication |
| Merge two Topic Maps | [Federate](../morphisms/federate.md) under shared subject identifiers |
| Query "what is topic X about?" | Substrate aboutness traversal (per [aboutness](teaching/explanations/aboutness.md)) |
| Identify two topics as the same subject | Assert identity-predication; substrate's identity-by-relations discipline merges them |

## What is gained by the substrate reading

The substrate reading exposes Topic Maps' implicit commitments to checkability:

- **Multi-source merge integrity**: when two Topic Maps both assert `(alice, supervises, bob)` and `(alice, supervises, charlie)`, the substrate's bilattice would record contestation explicitly if the value-domain were lifted from $\mathbf{2}$ to $\mathbf{2} \otimes \mathbf{2}$. The standard Topic Maps merge silently produces both, losing the source-disagreement information that contestation tracking would preserve.
- **Cross-map identity discipline**: the substrate's identity-by-relations gives a precise account of what Topic-Maps merge does and what it does not do — it does not derive that two topics are the same subject when they have *different* subject identifiers but obviously co-refer; that derivation requires explicit substrate-level identity predications.
- **Closure regime classification**: Topic Maps' merge discipline lands in the strict regime; queries terminate quickly. This is a substrate-level fact about Topic Maps that Topic Maps' specification does not name explicitly.
