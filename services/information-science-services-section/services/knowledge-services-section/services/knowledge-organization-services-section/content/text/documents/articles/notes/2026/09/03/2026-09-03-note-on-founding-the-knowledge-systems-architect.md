---
title: "Note on founding the knowledge systems architect"
description: "Founding note for the knowledge-systems-architect office: its arena, incumbent portfolio, house evidence, and first MEET gaps."
date-created: 2026-09-03
type: note
---

## What the office is for

The knowledge-systems-architect office is seated at
`content/offices/knowledge-systems-architect.json` in this section, part of
`emsenn`, with jurisdiction over all of `science-services-section` (Lenticule
Science) and authority-scope over this section, the L-Space site
(`sites/l-space.561.group`), the relationality section's hand-authored
`ontology.ttl`/`shapes.ttl` records, and `bibliography-engineering-services-section`.
It replaces a generic "Principal AI Knowledge & Systems Architect" brief
another agent had drafted, per the founder's 2026-09-03 evening movement to
explore the four regimes of natural existence and make Lenticule Science and
L-Space machine-readable — proper OWL, good bibliographies, meet-then-beat
the standard science-on-a-computer tooling.

The office replaces the generic five-step "deconstruct/bottleneck/override/
interface/apply" brief with the house `meet-then-beat` skill's six steps
(bound the arena, select the incumbent portfolio, measure current evidence,
derive the MEET contract, form and try to falsify the BEAT hypothesis, ship
one receiver-visible wedge and remeasure).

## The arena, bounded in one sentence

Receiver: a future agent or human reading Lenticule Science as a research
program; job: find, cite, and machine-query the lab's theory, sources, and
section frames, the way they could with an ontology editor, a triple store,
a reference manager, or a science knowledge graph over any other formal
research corpus.

## Incumbent portfolio by class

- **Protégé** (`https://protege.stanford.edu`, current release documented as
  "Protégé 5.6.9" per its own docs site) — **same-job incumbent** for ontology
  authoring/editing: it is the tool a researcher would reach for instead of
  our own tooling to build and check an OWL ontology by hand. Included
  because it is the field's default ontology editor.
- **Apache Jena / TDB2** (`https://jena.apache.org/documentation/tdb2/`,
  Apache License 2.0) — **same-job incumbent** for RDF triple storage and
  SPARQL query (TDB2 "supports the full range of Jena APIs," including
  SPARQL SELECT/ASK/CONSTRUCT); also a **reference implementation** for what
  a standards-complete SPARQL endpoint over a large triple store looks like.
  Included as the reference open-source triple store/reasoner stack
  (the GraphDB/TerminusDB/RDFox class share this role).
- **Zotero** (`https://www.zotero.org`, free, open source, nonprofit) —
  **same-job incumbent** for reference management: it is what a researcher
  would use instead of our `references:`/bibliography-carrier model to
  collect, cite, and format sources (9,000+ citation styles per its own
  homepage). Included as the field's default reference manager
  (the CSL/BibTeX/Pandoc class of tooling it interoperates with).
- **OpenAlex** (`https://help.openalex.org`, entities: works, authors,
  concepts, institutions) — **same-job incumbent** for a science knowledge
  graph a reader could query instead of L-Space/GEODE for scholarly-entity
  relations, and a **reference implementation** for what a queryable science
  graph's entity model looks like. Included as the open, first-party-documented
  member of the ORKG/OpenAlex/Wikidata class; ORKG and Wikidata remain
  unmeasured (not-fetched this pass).
- **doc-gen4 / Verso** — **reference implementation** for formal-document
  toolchains that render a machine-checked development (Lean) as a browsable
  manual; not fetched this pass (Obsmetrologia's own ObsmetrologiaManual
  already uses this class, per the obsmetrologia-consultant office's
  jurisdiction, which this office does not own).

## The program this office serves

This office's vocabulary and bibliography work is not a freestanding
program: it is three lots of
`lib/emsenn/services/561-group/services/science-services-section/content/text/documents/articles/notes/2026/09/01/2026-09-01-the-lenticule-research-substrate-program.md`
("The Lenticule Research Substrate Program", 2026-09-01) — Lot 4, the
term-IRI vocabulary surface (doctrine D5's public cone-leg: dereferenceable
term IRIs, Turtle/JSON-LD generated live from the settled glossary, never
hand-declared); Lot 6, an EAVT-to-SEAVT lift for term-to-term relations
through `witness-journal-rdf-projection-service`'s existing `projectSeavtRdf`,
unmodified; and Lot 7, a citation-triple carrier and admission gate in
`bibliography-engineering-services-section` (papers, admission only —
nanopub/DOI deposit explicitly excluded). This office's own arena, MEET
gaps, and BEAT hypotheses below are read as that program's Lots 4/6/7,
not a rival program.

## House evidence read from disk

- **The relationality ontology** — `services/philosophy-services-section/services/relationality-services-section/data/records/ontology-records/ontology.ttl`
  and `shapes.ttl` are hand-authored OWL/SHACL Turtle, **source-only**: 10
  `owl:Class` declarations (`grep -c owl:Class ontology.ttl` = 10), with no
  projector that derives them from a section's ruled frontmatter, and no
  consumer that queries them through L-Space or GEODE.
- **The GEODE vocabulary surface** — GEODE 0.1.3
  (`sites/l-space.561.group/node_modules/@red-cup-engineering/geode/src/vocabulary.mjs`,
  source at the knowledge-vault-computer-system-services-section
  `apps/geode`) generates a dereferenceable vocabulary at
  `/ns/term/<identity>` and `/ns/predicate/<name>`: JSON-LD with an
  `@context` (`buildTermJsonLd`: `skos:Concept`, `rdfs:label`,
  `skos:definition`, `dcterms:subject`, per-predicate IRIs) and Turtle
  (`termTriples` via `triplesToTurtle` from `@red-cup-engineering/knowing`),
  computed live from the admitted glossary record, never from a
  hand-declared file (the module's own comment; doctrine D5 of the
  program carrier above). `sites/l-space.561.group/lib/cloudflare/src/worker.mjs`
  imports `handleGeodeVocabularyRequest` and routes `/ns/` anonymously
  (`vocabularyResponse`, line ~292): the surface is **wired**, not
  disconnected. It is **source-only and tested**, not deployed: `curl -sS
  -H "Accept: text/turtle" https://l-space.561.group/ns/predicate/declares-keyword`
  returned `HTTP 401 {"error":"access-required"}` (2026-09-04 UTC), and on
  cold-red-gate the running bundle `/home/emsenn/services/l-space/worker.mjs`
  (dated Aug 29, served by `l-space.service`) has `grep -c "ns/predicate"` =
  0. What it serves is SKOS per term plus `rdf:Property` per predicate;
  there is no `owl:Class` or `owl:ObjectProperty` layer, no ledger-level
  RDF dump, and no OWL for the four regimes of natural existence — that is
  the true OWL gap, not the absence of any export at all. Closing the
  deployment gap is a rebuild-and-redeploy of l-space
  (`npm run build:vps` then install on cold-red-gate), a procedure, not
  new code.
- **The bibliography engineering scripts** —
  `engineering-services-section/.../bibliography-engineering-services-section`
  is **source-only** tooling: `recognize-`/`render-`/`write-`/`read-bibliography.mjs`,
  `collect-set-of-references.mjs`, `reconcile-set-of-references.mjs`,
  `project-references-bibtex.mjs`, `project-references-csl.mjs`, a CSL-JSON
  codec, and the composed `apps/bibliography-cli.mjs`, none of them wired as
  a scheduled or CI-run reconciliation over any science section.
- **The natural-science bibliographies/sources holding one PDF** —
  `natural-science-services-section/content/text/documents/articles/bibliographies/sources/`
  holds exactly one file, `ghrist-riess2022.pdf`, confirmed by directory
  listing: depth-3 citation is barely started even where the depth-1/depth-2
  carriers exist elsewhere in the corpus.

## First MEET gaps

- **Deployment, not generation**: the term/predicate JSON-LD and Turtle
  surface is written, wired into GEODE's server routing and l-space's
  worker, and served by the l-space MCP — but the deployed bundle on
  cold-red-gate predates it (dated Aug 29, `grep -c "ns/predicate"` = 0
  against the running `worker.mjs`), and the live edge answers `/ns/`
  requests with `401 {"error":"access-required"}` rather than content. A
  reader with the outside tooling's expectations (Protégé, Jena) cannot
  reach the surface today even though the code exists.
- **An OWL class/property layer over the vocabulary**: GEODE's `/ns/`
  serves SKOS concepts and `rdf:Property` predicates, not `owl:Class` or
  `owl:ObjectProperty` declarations, and there is no ledger-level RDF dump
  (a bulk export of the whole declared-relation ledger as Turtle, the way
  a triple store would ingest it) and no OWL encoding of the four regimes
  of natural existence the founder's 2026-09-03 movement named as a
  research direction — the relationality `ontology.ttl` encodes the triadic
  kinds (Act/Condition/Structure) and Operator, but the four regimes remain
  unbuilt, not merely unmeasured.
- A reconciled bibliography per science section: the bibliography-engineering
  scripts exist and are tested in their own package, but no science section
  runs `reconcile-set-of-references.mjs` on a schedule or gate, so citation
  health (conflicts, duplicates, uncovered citekeys, orphan carriers) is
  unmeasured corpus-wide.
- **The L-Space MCP's concept index misses core theory terms**:
  `query_l_space_concept("settling")` returned `known: false` — the concept
  index covers only `content/text/glossary/terms/`, and the core theory
  terms (settling among them) live in the Verso corpus nodes, not as
  glossary terms. A reader querying the MCP for house theory the way they'd
  query Protégé for an ontology term hits a cold spot the glossary-only
  index cannot see past.

## Existing code to revive

Per the owner's 2026-09-03 ruling (discovery checks the other machines and
GitHub and revives rather than duplicates), this office's OWL and Linked
Data work has prior art already in house or one commit away, and its job
is to revive that, never to write a fourth ontology by hand:

- **`emsenn/2025-10-04-rdf-cms`** (GitHub) — `vocabularies/ontology.ttl`,
  `shapes.ttl`, a SHACL validator (`services/validator/validator.py`), and
  a SPARQL query UI. Three copies already sit vendored under `lib/legacy`
  in `web-services-section` and `semiotic-computer-system-services-section`
  (dated 2025-10-04, 2026-03-06, 2026-03-11) — revival inventory, not a
  graveyard, per `.claude/rules/org-layering.md` "Legacy is revival
  inventory."
- **`emsenn/infometrologia`**'s `src/integrations/http/triple-pattern-fragments-resource.mts`
  — its live descendant is `apps/metroplat/src/integrations/http/triple-pattern-fragments.mts`
  plus `triple-pattern-fragments-resource.mts` in
  `engineering-services-section/.../agent-computer-system-engineering-services-section/services/multi-agent-computer-system-engineering-services-section/services/multi-agent-computer-platform-engineering-services-section/services/agentic-enterprise-computer-platform-engineering-services-section`
  (Turtle, JSON-LD, JSON fragments with content negotiation): a Linked
  Data Fragments surface already exists in house, deployed in metroplat,
  absent in l-space.
- **`emsenn/content`**'s per-domain agential-semioverse-repository
  `ontology.ttl` + `shapes.ttl` (games, education, sociology, mathematics,
  philosophy).
- **cold-red-gate** `~/561-group/sites/research.561.group/data/taxonomies/{udc,lcc,msc,mesh,acm-ccs,arxiv,aat,taxonomies}.ttl`
  — SKOS ConceptSchemes of the standard science classifications (21,027
  lines total), a taxonomy registry with `owl:sameAs` to udcdata.info,
  already vendored twice in `lib/legacy`
  (`561-group-science-services-section/lib/legacy/2026-08-17-triage-dev-research.561.group`
  and
  `knowledge-vault-computer-system-services-section/lib/legacy/2026-06-28-research.561.group`).
- **`@red-cup-engineering/knowing`** exports `triplesToTurtle`, already the
  serializer GEODE's own vocabulary generator uses (see above) — any
  further Turtle serialization in this office's work goes through it, not
  a hand-rolled writer.

## A standing contradiction to resolve

The science topic section model
(`561-group-science-services-section/content/text/documents/articles/specifications/2026-08-30-science-topic-section-model.md`,
"Ontology" section) seats `data/ontology/<domain>/ontology.ttl` per science
section. That contradicts both the owner's data-trio law
(`data/logs/`, `data/records/`, `data/state/` only — no other
`data/<topic>/` name, `.claude/rules/working-discipline.md`) and this
program's own doctrine D5 (vocabulary is generated from the settled
glossary, never hand-declared). Five science sections already carry
`data/ontology/` directories under that contradictory model: philosophy,
sociology-science, education-science, gaming, and agential-semioverse
(admitted as friction task `friction-carrier-falsehood-…`, intent
`friction-report-2026-09-04-…`, on the rail this session). This office
names the contradiction; resolving it — retiring `data/ontology/` in
favor of a generated vocabulary surface per section, per D5 — is standing
work for this office, not resolved in this note.

## The five-custody thread

- **Science**: this section (`knowledge-organization-services-section`)
  carries the office and its theory basis.
- **Engineering**: `engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/computer-knowledge-systems-services-section/services/bibliography-engineering-services-section`
  (citation tooling) and `@red-cup-engineering/geode` (the declared-relation
  ledger and its consumers, including L-Space).
- **Operations**: unnamed — no operations section currently schedules
  ontology projection or bibliography reconciliation as a run.
- **561-group**: unnamed — no 561-group mirror section tracks this office's
  own machine-readability metrics as dated records yet.
- **Public**: `sites/l-space.561.group` is the public-facing thread-mate
  already live; a public OWL/JSON-LD export surface for it is unbuilt.
