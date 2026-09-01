---
type: theorem
class: contemporary
status: established
depends-on:
  - teaching/explanations/knowledge-graph.md
  - ../morphisms/kg-completion.md
see-also: []
references:
  - references/hogan-knowledgegraphs2021.md
  - references/ji-survey-kg2021.md
---

# KG incompleteness

## Statement

**Real-world knowledge graphs are necessarily and
substantially incomplete.** No deployed KG (Wikidata,
Google KG, Freebase, DBpedia, enterprise KGs)
contains all true triples about its entities; many
contain only a small fraction.

Incompleteness is a *fundamental property* of large
KGs, not a temporary defect.

## Empirical evidence

Studies of major KGs:

- **Freebase.** Estimated 71% of person entities
  missing place-of-birth; 75% missing nationality;
  many other gaps.
- **DBpedia.** Wikipedia-derived; only contains
  facts in Wikipedia infoboxes.
- **Wikidata.** Crowdsourced; coverage uneven across
  domains and entities.
- **Enterprise KGs.** Coverage typically a small
  fraction of relevant facts.

Even for the most-studied entities, KGs are
incomplete.

## Why incompleteness is fundamental

- **Scale of facts.** Number of true facts is vast;
  any extraction misses some.
- **Long tail.** Most entities and relations are
  rare; expensive to extract.
- **New facts.** World changes; KGs lag.
- **Implicit knowledge.** Many facts are not
  stated explicitly anywhere.
- **Source limits.** KGs derive from sources; sources
  are themselves incomplete.

Incompleteness is structurally inevitable.

## Implications

- **Closed-world assumption fails for KGs.**
  Treating KG-absence as fact-absence is wrong.
- **Negative information is rare.** KGs rarely
  encode "X is not true"; most absences are
  *unknown* not *false*.
- **Query answering bounded by data.** "Find all X"
  queries return only known X, not all true X.
- **Completion is essential.** Per
  [kg-completion](../morphisms/kg-completion.md),
  predicting missing facts is a core task.
- **LLMs as complement.** Per
  [llms-as-implicit-kbs](teaching/explanations/llms-as-implicit-kbs.md),
  LLMs may compensate by encoding implicit knowledge.

## Quantifying incompleteness

Approaches to estimate incompleteness:

- **Sampled comparison.** Compare KG content to
  ground-truth sources for a sample.
- **Cross-KG comparison.** Comparing what different
  KGs cover for same entities.
- **Functional property analysis.** Properties that
  must hold (every person has one birthdate)
  reveal gaps.
- **External-source check.** Web search, ground-truth
  databases.

These give incompleteness estimates per relation and
domain.

## Selection bias in incompleteness

Incompleteness is not random:

- **Famous entities** are more complete than
  obscure ones.
- **Western, English-language entities** tend to
  be more complete.
- **Recent facts** tend to lag.
- **Sensitive facts** may be deliberately omitted.

This selection bias propagates to systems built on
KGs.

## Implications for ML on KGs

- **Training/test split must account for
  incompleteness.** Naive holdout produces
  optimistic evaluation.
- **Negative sampling assumptions.** Standard
  negative sampling assumes randomly-absent triples
  are negatives; under OWA they may be just
  unknown.
- **Inductive learning.** Methods that handle new
  entities are valuable.

## In contemporary AI

- **KG completion** is an active research area
  premised on this theorem.
- **LLM-KG hybrids** aim to combine KGs (precise
  but incomplete) with LLMs (broad but
  hallucinatory).
- **Production KG systems** invest heavily in
  continuous updating and quality.

## Limits of the result

- **Per-domain variation.** Some narrow KGs are
  near-complete (Gene Ontology for known genes).
- **Definitional issues.** What counts as "complete"
  depends on intended use.
- **Selection-bias dimensions.** Incompleteness
  varies by entity type, language, recency.

## Status

Established empirical regularity. Standard backdrop
for KG research. Drives much active work on
completion and quality.
