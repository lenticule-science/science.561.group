---
type: question
status: open
explores: [semantic-conformation, ontology-reuse, ontological-lock-in, linked-data, closure-rule-system]
depends-on: [predication-cell, predication-settling, closure-rule-system, predicate-category]
grounds:
  - is-the-semantic-web-a-prion-system-for-human-knowledge
source-triage:
  - work/triage/engineering-archive/library/triage/from-research-bucket-2/semantic-web-as-prion-system.md
---

# When does semantic conformation become lock-in?

This question grounds [is-the-semantic-web-a-prion-system-for-human-knowledge](is-the-semantic-web-a-prion-system-for-human-knowledge.md). It does not replace that question. It asks for the substrate condition under which ontology reuse becomes prion-like semantic conversion rather than ordinary interoperability.

## The question

Given a knowledge system whose entities include vocabularies, predicates, datasets, documents, tools, applications, and institutions, can repeated reuse and alignment of ontology terms be represented as closure-driven predication settling in which predicate configurations become stable semantic conformations?

If so, when does that stability become lock-in?

## Predication restatement

A semantic conformation is the practical shape a knowledge system takes when it settles around a vocabulary. It is not only the formal definition of a term. It includes the term's documentation, examples, validation rules, inference behavior, software support, institutional trust, search visibility, and accumulated reuse.

A conformation becomes lock-in when future knowledge production is easier, cheaper, more visible, or more legitimate when it conforms to the settled vocabulary than when it preserves local distinctions.

In predication terms, the lock-in condition is a closure condition: adopting a vocabulary causes further predications to be generated, validated, inferred, indexed, or recognized in ways that reinforce the adopted vocabulary's predicate category.

## Candidate formal condition

A semantic conformation is locked in when all four conditions hold:

1. A vocabulary or ontology supplies a stable predicate configuration.
2. Adoption of that configuration increases the probability or cost-advantage of further adoption.
3. Local deviations are either erased, translated lossily, penalized, or made invisible by tooling and institutions.
4. The resulting settling becomes harder to refold than to extend.

This distinguishes lock-in from ordinary reuse. Ordinary reuse may increase shared expressive capacity. Lock-in increases reuse by making alternatives structurally difficult to maintain.

## Answer-enabling subquestions

What is the carrier of semantic conformation? Candidate carriers include URI, class, property, ontology document, JSON-LD context, SHACL shape, validation rule, API contract, software library, search index, institutional dataset, and citation practice.

What is the conformation? It may be a formal axiom set, a usage convention, a practical documentation ecology, a constraint profile, or a community's settled interpretation of what the vocabulary makes sayable.

What counts as conversion? Candidate conversions include adopting a dominant class hierarchy, declaring `owl:sameAs`, mapping local predicates into global predicates, replacing local categories with schema.org categories, or making institutional reporting fit an external standard.

What is lost under conversion? Possible losses include suppressed distinctions, forced equivalence, relation erasure, context collapse, collapsed provenance, flattened accountability, and inability to express local or Indigenous categories without translation into external predicate systems.

What would refolding mean? Refolding may require versioning, plural ontologies, non-equivalence markers, reversible mappings, namespace refusal, local extensions, or explicit preservation of incompatible predicate categories.

## What would resolution require

A minimal resolution would describe one vocabulary-adoption event before and after conversion. It should identify the local predicate category, the adopted predicate category, the closure rules that encourage adoption, and the distinctions lost or preserved.

A stronger resolution would define a measure of semantic lock-in: for example, the increasing cost of maintaining local predicates, the decreasing visibility of nonconforming records, or the growth of closure paths that route through the dominant vocabulary.

A critical resolution would distinguish three cases:

1. interoperability without lock-in;
2. lock-in without pathology;
3. pathological semantic conversion that reduces a community's ability to represent what it knows.

## Relation to the larger question

If semantic conformation lock-in can be modeled as closure-driven settling, then the Semantic Web prion-system question becomes formally approachable: prion-like propagation would be the special case where stable semantic conformations template conversion across neighboring knowledge systems.

If lock-in cannot be distinguished from ordinary reuse, then the larger prion analogy remains rhetorically suggestive but not yet structurally grounded.