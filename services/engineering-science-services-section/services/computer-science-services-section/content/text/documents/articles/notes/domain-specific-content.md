---
title: "Domain-Specific Content"
date-created: 2026-03-05T00:00:00
authors:
  - claude-opus-4-6
status: draft
aliases:
  - "Domain-Specific Content"
  - "domain-specific content"
keywords:
  - AgentialSemioverse
  - Repository
---

This document describes how an Agential Semioverse Repository accommodates domain-specific content types and relations. The general ASR defines types (`term`, `concept`, `text`, etc.) and relations (`defines`, `requires`, `cites`, etc.) that work across any discipline. Domain-specific ASR specifications extend these with types and relations that carry validity requirements particular to a knowledge domain.

Current domain-specific ASR specifications:
- [Mathematical ASR](../../../../mathematics/specifications/mathematical-agential-semioverse-repository/index.md) — provability-governed content (theorems, proofs, definitions, axioms)
- [Philosophical ASR](../../../../philosophy/specifications/philosophical-agential-semioverse-repository/index.md) — arguability-governed content (claims, arguments, objections, responses)
- [Educational ASR](../../../../education/specifications/educational-agential-semioverse-repository/index.md) — pedagogical-soundness-governed content (lessons, curricula, skills, schools, transmission modes)

## Relations carry their domain

The central design principle: typed relations belong to the domain that defines them. When a page uses a relation, the SHACL shapes governing that relation validate it — regardless of where the page lives in the directory hierarchy, what its `type:` is, or what other relations it uses.

`proven-by` is a mathematical relation. A page that uses it gets mathematical validation on that relation. `argued-by` is a philosophical relation. A page that uses it gets philosophical validation on that relation. A page that uses both gets both validations, independently.

This means a single page can participate in multiple domains without duplication. A concept like relational Flow can be one page with mathematical relations (linking it to its formal definition and proofs) and philosophical relations (linking it to the claims and arguments that motivate it). Each set of relations is validated by its own domain's shapes.

## How a page participates in a domain

A page participates in a domain by using that domain's relations. No explicit declaration is needed. The presence of `proven-by:` in frontmatter makes the page subject to mathematical validation for that relation. The absence of `proven-by:` means mathematical validation for that relation does not fire.

Directory subtrees have conventional domain associations — pages under `mathematics/` conventionally use mathematical relations, pages under `philosophy/` conventionally use philosophical ones. But these are conventions about what relations are EXPECTED, not restrictions on what relations are ALLOWED. A philosophy page that includes a formal proof can use `proven-by:`.

## Cross-domain coherence

When a page uses relations from multiple domains, the question arises: how do the domains' views of the same content cohere?

The [Interactive Semioverse](../../../../mathematics/objects/universes/interactive-semioverse/interactive-semioverse.md) provides the formal machinery for this:

**Fragments.** Different relations generate semantic content within different [fragments](../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/glossary/terms/fragment.md) of the Heyting algebra H. Mathematical relations contribute to mathematical fragments; philosophical relations contribute to philosophical fragments. Each fragment is a finitely generated modal-temporal subalgebra — a local context within which semantic content is evaluated.

**Sheaf semantics.** The IS defines a [fragment fibration](../../../../mathematics/objects/universes/interactive-semioverse/interactive-semioverse.md) (§15) with a sheaf condition: if local sections over different fragments agree on their overlaps, they glue to a unique global section. This means that if the mathematical and philosophical views of a concept share some semantic content (both reference the same definitions, both use the same `requires:` chain), they must be consistent on that shared content. The sheaf condition enforces this without requiring either view to reduce to the other.

**Handle co-reference.** The IS's [handle identity groupoid](../../../../mathematics/objects/universes/interactive-semioverse/interactive-semioverse.md) (§7) supports transport of interaction terms between co-referent handles. If two handles point to the same semantic seed, interaction terms transport coherently between them. This is the formal basis for "same concept, different interaction surfaces."

The IS does not currently annotate fragments with domain metadata. Its refinement directives (§14.1) are defined but the parameter space is left open — this is a natural extension point for domain-level constraints on fragment refinement. But the coherence machinery (sheaf gluing, handle transport) works without domain annotation.

## Correspondence relations

Correspondences map between domains. They are general ASR relations, not specific to any single domain, because they inherently cross disciplinary boundaries.

### Content type: correspondence

A formal mapping between two frameworks — mathematical structures, philosophical traditions, or any combination.

- MUST specify `maps-from:` identifying the source.
- MUST specify `maps-to:` identifying the target.
- MUST specify `correspondence-type:` identifying the nature of the mapping.
- MUST explain in the body what corresponds to what, concretely.
- SHOULD specify `preserves:` listing structural features maintained.
- SHOULD specify `loses:` listing structural features not maintained.
- MAY specify `proven-by:` if the correspondence has a formal proof.
- MAY specify `argued-by:` if supported by philosophical argument.

```yaml
type: correspondence
maps-from: /relationality/terms/togethering.md
maps-to: /mathematics/objects/lattices/terms/meet.md
correspondence-type: validation
preserves:
  - associativity
  - commutativity
  - idempotence
requires:
  - /mathematics/objects/lattices/terms/heyting-algebra.md
```

### Correspondence types

| Value | Meaning |
|---|---|
| `isomorphism` | Exact structural match in both directions |
| `homomorphism` | Structure-preserving map (may lose information) |
| `analogy` | Informal structural similarity |
| `validation` | The target formalizes or verifies the source |
| `instantiation` | The source is a specific case of the target |
| `generalization` | The source generalizes the target |
| `dual` | Systematic reversal (arrows, operations, perspectives) |

### Correspondence relation vocabulary

| Relation | Meaning | Maps to |
|---|---|---|
| `maps-from` | Source framework or concept | — |
| `maps-to` | Target framework or concept | — |
| `correspondence-type` | Nature of mapping | — |
| `preserves` | Structural features maintained | — |
| `loses` | Structural features not maintained | — |

### Why correspondences are first-class

Correspondences are often implicit — they exist in researchers' minds or in how content is organized, but are never stated. Making them explicit pages with typed relations makes them:

1. **Contestable.** An assumed mapping may not preserve what it claims to. Explicit correspondences can be objected to.
2. **Partial.** A mapping may preserve some structure but not all. `preserves:` and `loses:` make this visible.
3. **Composable.** If A corresponds to B and B corresponds to C, a derived correspondence from A to C may exist.

In a project that develops ideas philosophically and validates them mathematically, the correspondences ARE the argument that the philosophy and mathematics are talking about the same thing.

## Extending the system

New domain-specific ASR specifications can be created for any discipline by:

1. Creating a `specifications/{discipline}-agential-semioverse-repository/` directory under the discipline.
2. Defining content types with MUST/SHOULD validity requirements.
3. Defining typed relations that carry those requirements.
4. Writing SHACL shapes that validate the relations.
5. Writing an OWL ontology that defines the classes and properties.

The general ASR infrastructure (semantic frontmatter, directory organization, RDF generation) handles the rest. Domain-specific relations are validated by their own shapes; the IS's fragment and sheaf machinery handles cross-domain coherence.
