---
title: Classification and Labeling
date-created: 2026-03-01 00:00:00
lesson:
- classification
- labeling
required-knowledge:
- foundations-of-information-architecture
references:
  spencer_CardSorting_2009:
    title: 'Card Sorting: Designing Usable Categories'
    authors:
    - Spencer
    year: 2009
  morville_InformationArchitectureWorldWideWeb_2006:
    title: Information Architecture for the World Wide Web
    authors:
    - Morville
    year: 2006
  ranganathan_ProlegomenaLibraryClassification_1967:
    title: Prolegomena to Library Classification
    authors:
    - Ranganathan
    year: 1967
  bowker_SortingThingsOut_1999:
    title: 'Sorting Things Out: Classification and Its Consequences'
    authors:
    - Bowker
    year: 1999
  bates_DesignBrowsingBerrypicking_1989:
    title: "The Design of Browsing and Berrypicking Techniques for the Online Search Interface"
    authors:
    - Bates
    year: 1989
---

## The problem of classification

To organize anything, you must decide what goes with what. Classification is the act of drawing boundaries: this item belongs in this group, not that one. Every classification system privileges some similarities and ignores others. Grouping plants by medicinal use produces a different system than grouping them by evolutionary lineage, which produces a different system than grouping them by the ecosystem they inhabit.

[Bowker](../../../../../../../lib/legacy/2026-06-17-archive-emsenn-net/content/emsenn-archive-org/gibwodgit/archive/flowif/library/references/people/geoffrey-bowker.md) and [Star](../../../../../../../lib/legacy/2026-06-17-archive-emsenn-net/content/emsenn-archive-org/gibwodgit/archive/flowif/library/references/people/susan-leigh-star.md), in *Sorting Things Out* [@bowker_SortingThingsOut_1999], demonstrated that classification systems are not discovered but made — and that they carry moral and political weight. The International Classification of Diseases affects what counts as a medical condition and who receives treatment. Racial classification systems shaped (and continue to shape) access to citizenship, [property](../../../../../../../lib/legacy/2026-06-17-archive-emsenn-net/content/emsenn-archive-org/gibwodgit/archive/flowif/library/theories/humanities/theories/philosophy/terms/property.md), and rights. Library classification systems determined for over a century what was treated as serious scholarship and what was filed under "folklore."

This does not mean classification is avoidable. Any organized collection of information requires categories. The point is that the choice of categories is a design decision with consequences, and responsible practice makes those decisions explicit.

## Approaches to classification

### Exact classification

Items are sorted by a single, unambiguous attribute: alphabetical order, chronological order, geographic location. These schemes are easy to maintain and hard to get wrong, but they only help users who already know the specific attribute they are looking for. An alphabetical list of articles helps you find "[Heyting algebra](../../../../../../../lib/legacy/2026-06-17-archive-emsenn-net/content/emsenn-archive-org/gibwodgit/archive/flowif/library/theories/engineering/theories/mathematics/concepts/heyting-algebra/index.md)" only if you already know the name.

### Topical classification

Items are sorted by subject matter. This is the dominant scheme in libraries, textbooks, and knowledge bases. Its challenge is that subjects overlap and boundaries are contested. Is a lesson on Kripke semantics filed under logic, model theory, or philosophy of language? The answer depends on who is asking and why.

Strategies for managing overlap:

- **Primary placement with cross-references.** File the item where it fits best and link to it from other relevant categories.
- **[Faceted classification](../../glossary/terms/faceted-classification.md).** Assign multiple independent attributes instead of a single category. See [Ranganathan](../../../../../../../lib/legacy/2026-06-17-archive-emsenn-net/content/emsenn-archive-org/gibwodgit/archive/flowif/library/references/people/sr-ranganathan.md)'s Colon Classification [@ranganathan_ProlegomenaLibraryClassification_1967] and its modern descendants.
- **Tagging.** Allow multiple informal labels per item. Tags are cheaper than formal categories but harder to maintain consistently.

### Task-based classification

Items are sorted by what the user wants to do: "Get started," "Troubleshoot," "Reference." This scheme works well for documentation and help systems. Its challenge is that the same content may serve multiple tasks.

### Audience-based classification

Items are sorted by who the user is: "For beginners," "For developers," "For researchers." This scheme works when audiences have distinct needs. Its risk is that users may not identify with the provided categories, or may have needs that cross audience boundaries.

## Labeling

A label is the name given to a category, a link, a navigation item, or a heading. Labels are the primary interface between the organizational structure and the person using it. A category with a misleading label is worse than no category at all — it creates false expectations.

### Principles of good labeling

- **Use the audience's language.** If users call it "settings," do not label it "preferences." If users call it "wastewater," do not label it "effluent." Card sorting (asking users to group items and name the groups) reveals what language people actually use [@morville_InformationArchitectureWorldWideWeb_2006].
- **Be specific.** "Resources" is too vague to be useful. "Research papers," "Data sets," and "Teaching materials" tell the user what to expect.
- **Be consistent.** If one section is labeled "Terms" and another "Glossary" and a third "Definitions," users cannot tell whether these are the same kind of thing. Pick a label and use it throughout.
- **Avoid jargon unless the audience shares it.** Technical terms are appropriate when writing for specialists. For general audiences, they create barriers.

### Labels and power

Labels carry assumptions. Calling a category "primitive art" asserts a hierarchy of cultural production. Calling a navigation section "non-Western philosophy" defines Western philosophy as the default. Calling a community "stakeholders" frames their relationship to a project in economic terms.

These are not merely questions of politeness. Labels shape how people understand the material they contain. A knowledge system that uses the label "traditional ecological knowledge" positions Indigenous ecological practices as a distinct (and implicitly secondary) category alongside unmarked "science." An alternative is to organize ecological knowledge by subject matter and let the [epistemological](../../../../../../../lib/legacy/2026-06-17-archive-emsenn-net/content/emsenn-archive-org/gibwodgit/archive/flowif/library/theories/humanities/theories/philosophy/theories/western/theories/epistemology/terms/epistemology.md) traditions coexist within the same structure.

## Classification in practice

### Card sorting

Card sorting is a research method for discovering how users conceptualize a set of items [@spencer_CardSorting_2009]. Participants are given cards (each representing a content item) and asked to sort them into groups and name the groups. The results reveal:

- What groupings feel natural to the target audience.
- What labels people use for those groupings.
- Where disagreements arise (items that different participants place in different groups).

Card sorting does not produce a final architecture — it produces data about user expectations that informs design decisions. Combined with research on how people actually search for information [@bates_DesignBrowsingBerrypicking_1989], card sorting data helps information architects design systems that match real behavior.

### Tree testing

Tree testing validates an existing hierarchy. Participants are given tasks ("Find the lesson on [intuitionistic logic](../../../../../../../../science-services-section/services/information-science-services-section/services/math-services-section/services/logic-services-section/content/documents/notes/2026-03-01-note-on-intuitionistic-logic.md)") and asked to navigate a text-only tree structure (no content, just labels and hierarchy). Success rates and navigation paths reveal where the structure confuses people.

### [Controlled vocabularies](../../glossary/terms/controlled-vocabulary.md) and thesauri

For large or long-lived collections, a [controlled vocabulary](../../glossary/terms/controlled-vocabulary.md) prevents drift: the same concept should always be labeled the same way. A thesaurus adds relationships between terms:

- **Broader term (BT)**: "mathematics" is broader than "logic."
- **Narrower term (NT)**: "[intuitionistic logic](../../../../../../../../science-services-section/services/information-science-services-section/services/math-services-section/services/logic-services-section/content/documents/notes/2026-03-01-note-on-intuitionistic-logic.md)" is narrower than "logic."
- **Related term (RT)**: "[Heyting algebra](../../../../../../../lib/legacy/2026-06-17-archive-emsenn-net/content/emsenn-archive-org/gibwodgit/archive/flowif/library/theories/engineering/theories/mathematics/concepts/heyting-algebra/index.md)" is related to "[intuitionistic logic](../../../../../../../../science-services-section/services/information-science-services-section/services/math-services-section/services/logic-services-section/content/documents/notes/2026-03-01-note-on-intuitionistic-logic.md)."
- **Use for (UF)**: "constructive logic" → use "[intuitionistic logic](../../../../../../../../science-services-section/services/information-science-services-section/services/math-services-section/services/logic-services-section/content/documents/notes/2026-03-01-note-on-intuitionistic-logic.md)."

Maintaining a controlled vocabulary is ongoing work. Terms are added, deprecated, and reclassified as the collection grows and the field evolves.

