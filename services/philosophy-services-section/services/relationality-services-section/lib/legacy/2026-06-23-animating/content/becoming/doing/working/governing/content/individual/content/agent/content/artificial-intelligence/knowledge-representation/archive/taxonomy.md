---
type: object
class: foundational
status: active
depends-on: []
see-also:
  - teaching/explanations/ontology.md
references:
  - references/sowa-knowledge2000.md
---

# Taxonomy

A **taxonomy** is a hierarchical classification — a
tree (or DAG) of categories where edges denote *is-a*
relationships. The simplest substantial form of
structured knowledge representation.

## Structure

A taxonomy comprises:

- **Categories** (nodes).
- **Subcategory relations** (edges; child is-a
  parent).
- **Often: terminal instances** at leaves.

Examples:
- Linnaean biological taxonomy: Animal → Vertebrate
  → Mammal → Carnivore → Canid → Wolf.
- Library classification: Dewey Decimal, Library of
  Congress.
- Product categorization: Electronics → Computers →
  Laptops → Gaming Laptops.

## Why "simplest substantial"

A taxonomy is more than a list (has structure) but
less than a full ontology (only one relation type).
This makes taxonomies:

- **Easy to construct.** Just classify items
  hierarchically.
- **Easy to traverse.** Tree navigation.
- **Easy to extend.** Add subcategories.
- **Limited in expressiveness.** Cannot represent
  attributes, multiple relations, axioms.

Taxonomies suffice for many practical needs;
ontologies extend them with additional structure.

## Tree vs DAG

- **Tree.** Each category has at most one parent
  (single inheritance).
- **DAG.** Categories can have multiple parents
  (multiple inheritance).

DAG taxonomies are more expressive but harder to
maintain (path ambiguity, inheritance conflicts).

## Construction approaches

- **Top-down.** Start with high-level categories;
  refine.
- **Bottom-up.** Start with items; cluster into
  categories.
- **Mixed.** Both directions.
- **Automatic.** Cluster items by similarity;
  derive taxonomy.

Real taxonomies often combine; manual curation
remains common.

## Use cases

- **Web directories** (Yahoo, DMOZ historically).
- **Product catalogs** (Amazon categories).
- **Research classification** (ACM Computing
  Classification, AMS Mathematics Subject
  Classification).
- **Biology** (Linnaean taxonomy and modern
  cladograms).
- **Library science** (LCSH, Dewey).

These show taxonomy at production scale across
domains.

## Taxonomies vs ontologies vs folksonomies

A spectrum:

- **Folksonomy.** User tags without enforced
  structure (del.icio.us, Flickr historically).
- **Taxonomy.** Hierarchical structure, single
  relation.
- **Thesaurus.** Hierarchy + synonyms + related
  terms.
- **Ontology.** Multiple relations, axioms, full
  semantics.

Each occupies a different precision/cost point.

## In contemporary AI

- **Wikipedia categories.** Crowdsourced taxonomy
  of articles.
- **WordNet hyponymy.** Lexical taxonomy.
- **Product / content taxonomies.** Across most
  e-commerce and content platforms.
- **LLM categorization.** LLMs can be used to
  generate or extend taxonomies.

## Limits

- **Single-relation limit.** Can't represent
  attributes, distinctions beyond hierarchy.
- **Rigidity.** Fixed hierarchy may not suit all
  uses (multiple legitimate hierarchies).
- **Maintenance.** Large taxonomies drift.
- **Edge cases.** Items may not fit any clean
  category.

## Status

Standard form of structured knowledge across domains.
Often the appropriate tool when full ontology
overkill. The base layer of richer KR systems.
