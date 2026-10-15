---
name: World-indexed term sense
description: "A lexical item's explicitly governed intension relative to a specified semantic world/context; equal spelling does not imply equal meaning, reference or authority."
date-created: 2026-10-15
see-also: [l-space, frontmatter-presentation, token-occurrence, intension, primary-intension, secondary-intension]
---

# World-indexed term sense — lexical semantics

A **world-indexed term sense** is an *identified reading* of one lexical spelling under a **named interpretive world**: a declared vocabulary, formal theory or discourse domain, relevant time and source revision, allowed reference-fixing and interpretation conditions. It is not the spelling itself. The term “world” here describes the **specified semantic/model context**; it need not be a physically real universe or one of the accessible worlds in a Kripke model.

The reading should identify: **surface form**, **sense identifier**, **owning vocabulary/world**, **intension (application rule)**, **type and reference conditions**, **sources and status**, **valid transformations**, **explicit exclusions**, and **independently checked relationships** to other senses. A glossary page with one meaning is not authorized to absorb every use of that word; a relation between two meanings must be justified, not asserted as \`owl:sameAs\` because their labels match.

## A concrete non-synonym pair

\`Possible\` in the March 28 relationality inquiry means a candidate continuation opened by relating a given. \`◇φ\` in modal logic means \`φ\` is satisfied in some accessible world of a specified model. They have **one English surface spelling but different intensions, admissibility conditions, and tests**. They have separate entries, [relational Possible](https://github.com/lenticule-science/science-services-section/blob/main/services/philosophy-services-section/services/relationality-services-section/content/text/glossary/terms/possible.md) and [modal possibility](https://github.com/lenticule-science/science-services-section/blob/main/services/philosophy-services-section/services/logic-services-section/content/text/glossary/terms/logic-terms-possibility.md). \`Necessary\` is similarly split between conditional inquiry requirements and modal \`□\`; neither automatically creates an institutional obligation.

\`Absurd\` in the personal inquiry is a locally taken premise; \`⊥ₖ\` in FOUR is **neither-for-nor-against evidential standing**. The terms are **not synonyms**, even if older glossaries equated them.

## Secondary intension is a more specific technical claim

In two-dimensional semantics, a **secondary intension** is a function assigning an extension to a counterfactual world *with the actual-world referent/reference-fixing held fixed*. A difference between two lexical uses in two corpora is **not by itself evidence of two secondary intensions**. First identify each sense, how its reference is fixed and which worlds supply the counterfactual domain. Only then can that precise semantic model be claimed. See [intension](intension.md), [primary intension](primary-intension.md) and [secondary intension](secondary-intension.md) in the owning Language Science glossary.

## Consequences for curation and queries

Keep distinct source-term identities whenever their testable application rules differ; the glossary should state the source/authority of each meaning and falsifiers of proposed equivalence. A parser encountering an unqualified word in an ambiguous context should return **multiple candidate senses or a refusal to disambiguate**, rather than choose the most familiar training-data meaning. A SPARQL/RDF label lookup is not an identity proof. Never automatically mint \`skos:exactMatch\`, \`owl:sameAs\`, an alias, an incumbent or a legal duty between world-specific terms because their spellings collide.

The source owns the definition. Engineering owns the code that admits/interprets it. Operations supplies declarative procedure parameters; the specific Group/Public actor and receiving state decide whether a qualified interpretation authorizes any effect. The March 28 personal blog supplies a **historical inquiry**, not a public grant of corporate ontology ownership.
