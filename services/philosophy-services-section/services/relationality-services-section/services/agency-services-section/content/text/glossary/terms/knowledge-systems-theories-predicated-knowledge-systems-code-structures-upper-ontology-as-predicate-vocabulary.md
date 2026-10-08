---
type: definition
class: predicate-category-schema
status: sketch
depends-on: [predicate-category, predicated-knowledge-system]
see-also: [four-group-register-as-fibration]
name: Upper ontology as predicate vocabulary
description: "An upper ontology (BFO, DOLCE, SUMO, Cyc) is, in the predicated framing, a predicate-category schema: a chosen partial structure on the predicate category $\\mathcal{C}$ of a predicated knowledge system, naming a small set of top-level…"
---


An **upper ontology** (BFO, DOLCE, SUMO, Cyc) is, in the predicated framing, a **predicate-category schema**: a chosen partial structure on the predicate category $\mathcal{C}$ of a [predicated knowledge system](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/predicated-knowledge-system.md), naming a small set of top-level predicate-strata together with a relation taxonomy that gives the morphism structure relating predicates across strata.

The translation is given in detail in [upper-ontologies-as-predicate-vocabularies](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/texts/upper-ontologies-as-predicate-vocabularies.md). For the structural definition:

- A **stratum** is a sub-category $\mathcal{C}_\alpha \subseteq \mathcal{C}$ corresponding to one of the upper ontology's top-level distinctions (e.g., BFO's `continuant` and `occurrent`; DOLCE's `endurant`, `perdurant`, `quality`, `abstract`).
- The upper ontology's **relation taxonomy** (`bfo:has_part`, `dolce:participates_in`, `sumo:located_at`, etc.) is the morphism structure of $\mathcal{C}$, including:
  - Within-stratum specialisation morphisms (`continuant_specialises_to_material_entity`)
  - Cross-stratum participation morphisms (`continuant_participates_in_occurrent`)
  - Inverse-pair morphisms (`has_part / part_of`)
  - Composition closures (transitivity of `part_of`)
- The upper ontology's **mid-level and domain vocabularies** are further refinements within each stratum, organised by the upper ontology's relation taxonomy.

## Structural commitment

Choosing an upper ontology *is* committing to:

- The top-level predicate-strata it names (and excluding others).
- The cross-stratum morphisms it admits (and excluding others).
- The closure rules implicit in its relation taxonomy (transitivity of `part_of`, irreflexivity of strict-`part_of`, asymmetry of `precedes`, etc.).

What an upper ontology does *not* commit to (but a predicated knowledge system can adopt independently):

- The value-domain (an upper ontology is value-domain-agnostic; the substrate's bilattice is one choice among several).
- The closure-rule language fragment (the upper ontology supplies *some* closure rules via its relation taxonomy; the predicated knowledge system can extend this with domain-specific rules).
- The scope discipline (the upper ontology is scope-agnostic; the substrate's scope structure is independent of the upper-ontology choice).

## Composition

Upper ontologies compose. A predicated knowledge system can stratify $\mathcal{C}$ by adopting BFO's continuant/occurrent split as the broadest stratification and refining each stratum by DOLCE's quality/abstract distinctions, with SUMO domain vocabulary populating the leaves. The composition is well-defined as long as the morphism structures are compatible (cross-ontology mappings exist, e.g., the BFO-DOLCE alignment work in the bioinformatics community).

The substrate guarantees that any upper-ontology choice is *just a parameterisation of $\mathcal{C}$*; the bilattice value-domain, the closure-driven settling, the four-regime classification, and the scope discipline all run invariant of the upper-ontology choice. This is the structural addition the predicated framing makes to the upper-ontology line: the substrate that lets multiple upper ontologies coexist on the same machine.
