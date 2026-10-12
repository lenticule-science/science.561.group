---
title: "Research"
role: true
component-of: roles
description: "An agent role that investigates topics, reads sources, and produces grounded knowledge artifacts (terms, texts, surveys) for the library — distinguished from the writing role by its accountability to cited evidence and from the analyst role by its production of new content rather than reports on existing content."
instance-of: agent-role
fills-office: researcher
produces: library-content
access-mode: read-primary
tools: [Read, Grep, Glob, Bash, WebSearch, WebFetch]
duty:
  - check-library-coverage-before-producing
  - cite-real-sources
  - ground-in-discipline-practice
  - produce-permanent-library-artifacts
prohibition:
  - fabricating-sources
  - duplicating-existing-terms
  - bulk-deleting-triage-content
privilege:
  - writing-new-term-and-text-files
  - enriching-existing-files-with-sources
  - using-web-search-for-external-sources
filled-by:
  - researcher
  - docs-lookup
  - graph-analyst
contrasts-with: [writing-role, analyst-role]
date-created: 2026-04-27
requires-capabilities:
  - read
  - path-corpus
  - markdown-search-workbench
  - term-intension
  - read-term-catalog
  - write
  - markdown-file-workbench
  - utter
  - articulate
  - predicate
  - posit
  - settle
  - admit-term
---

The **research role** is an agent role for investigating topics, reading sources, finding gaps, and producing knowledge — terms, texts, and surveys — that are grounded in real disciplinary theory and live as permanent artifacts in the library.

## What the role does

An agent operating in the research role does three things in sequence: it surveys what the library already contains on a topic (so it does not duplicate existing terms or restate what's already settled), it reads enough of the relevant external literature to ground its claims in real disciplinary practice (cited sources, named authors, published years), and it produces library artifacts — atomic term cards, multi-section texts, or annotated surveys — that other agents and the user can rely on. The role's outputs are *durable*: they are intended to remain in the library and be linked into the typed-relation graph.

## Three fillings

The role is filled at three different depths, depending on what the task requires.

**Researcher** is the full filling: reads external sources, writes new terms and texts, traverses the web for material the library does not yet contain. Use when the topic has not yet been covered, or when existing coverage is too thin to be a foundation for downstream work.

**Docs-lookup** is the fast filling: surveys what the library already contains on a topic and returns existing material rather than producing new. Use when the question is "what do we already say about X" rather than "what is X."

**Graph-analyst** is the structural filling: queries the [research graph](research) for patterns, connections, and gaps — which terms are heavily linked but missing, which predicates have low diversity, which subdomains have stub coverage. Use when the next move depends on understanding the shape of the corpus rather than its content.

## Procedure

A research question is measured before it is written. The measurement is a
source record kept in the owning section's `data/records/`, whose `$schema` is
`science-services-section/schemas/literature-measurement.schema.json`.
The registers it is measured against are data in
`science-services-section/data/registers/` (`europepmc.json`,
`clinicaltrials-gov.json`): each is a query and the CSL projection of its
results. Red Cup Engineering's bibliography CLI runs them:

```
bibliography record-search <record> <register.json> name=value...
bibliography record-read <record> <register.json> name=value...
bibliography record-check <record>
bibliography record-references <record> --write
```

1. **Recover.** Read what the library already holds on the question.
2. **Frame.** Write the record: its `$schema`, `question`, and `frame`
   (population, exposure in the literature's units, converting brand doses
   to the studied agent, comparator, outcomes). The frame decides which hits
   qualify.
3. **Search the registers, not the web.** Run every search through
   `record-search`; each run is a row whether or not it hits. Europe PMC
   (`query=`) covers PubMed, PMC and international journals. Use `ABSTRACT:`/
   `TITLE:`/`AUTH:` fields: bare terms match full text and flood the result.
   Search ClinicalTrials.gov (`query.term=`) for registered and non-US
   trials. Web search finds leads; a lead becomes evidence only once it is
   read from a register. Fill each search's `included`, and write its
   `reading` when nothing qualified: that row is what a statement that
   something has not been studied rests on.
4. **Read each source from its first-party surface.** `record-read` adds the
   row (a CSL-JSON item under a house citekey) and prints the abstract.
   Write `findings` with the source's own words in `exactSourceLanguage`,
   plus design, n, country and exposures. Set `readFrom` to what was read.
   A figure the abstract does not carry goes in `notFound` until the full
   text is read. A source known only through a review is cited as the
   review's finding.
5. **Write rows, then prose.** The note states only what the rows carry and
   cites each source by its house citation label ("Weyandt et al. 2018",
   "Horrigan & Barnhill 2000", "Kassim 2023"). Its frontmatter `references:`
   is derived by `record-references --write`.
6. **Check.** `record-check` blocks on schema violations, a prose author-year
   citation with no row, a cited row whose `readFrom` is
   `secondary-summary`, and `references:` that differ from the record. It
   warns on rows no note cites and on cited rows with no findings. A note
   ships at zero errors.

## Duties, prohibitions, privileges

The frontmatter encodes the role's normative profile by pointing at named entities, not by stating the rules in prose. Each [duty](../../../../../../library/domains/humanities/domains/sociology/domains/work/domains/governance/terms/duty.md), [prohibition](../../../../../services/information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/prohibition.md), and [privilege](../../../../../../library/domains/humanities/domains/sociology/domains/work/domains/governance/terms/privilege.md) is a slug that resolves to its own definition; the role file does not restate them. The intent is that an agent reading this file follows the slugs to learn what each obligation entails, rather than reading a bespoke summary that drifts from the canonical source.

## Distinction from adjacent roles

The research role differs from a *writing* role in its primary accountability: the writing role is accountable to the prose's clarity and rhetorical effect; the research role is accountable to the cited evidence and the disciplinary fit of its claims. Both produce artifacts, but they fail in different ways — writing fails when the text is unclear; research fails when the claims are unfounded.

The research role differs from an *analyst* role in what it produces: the analyst role produces reports on existing content (gap maps, dangling-reference lists, predicate-health surveys); the research role produces new content. Graph-analyst as a filling of the research role is the boundary case — it queries existing structure but to direct further research, not as the deliverable.

## See Also

- [research](../../../../../../library/domains/science/terms/research.md) — the practice the role enacts
- [researcher](../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/emsenn-archive-org/researcher.md) — the canonical filling
- [office](../../../../../../library/domains/humanities/domains/sociology/domains/work/domains/governance/terms/office.md) — the institutional position the role attaches to
- [role](../../../../../../library/domains/humanities/domains/sociology/domains/work/terms/role.md) — the general concept of an agent role
