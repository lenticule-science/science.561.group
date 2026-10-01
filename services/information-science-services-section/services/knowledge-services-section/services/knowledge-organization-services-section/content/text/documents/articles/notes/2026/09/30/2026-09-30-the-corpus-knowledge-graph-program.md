---
title: "The corpus knowledge graph program"
description: "Program carrier for turning the whole 561 Group corpus, not only its glossaries, into one admitted, linked, cited, dereferenceable and searchable knowledge graph, run as the house's first autonomic MAPE-K loop. It sets measured baselines, gated targets, four waves in dependency order, and the owning office for each workstream."
date-created: 2026-09-30
type: note
name: 2026-09-30-the-corpus-knowledge-graph-program
authors:
  - emsenn
  - claude-opus-5-5
status: active-program
keywords: ["knowledge-graph", "admission-ledger", "glossary", "bibliography", "linked-data", "skos", "dcat", "mape-k", "authorship-demand", "retrieval"]
tags: []
---

## Why a new program carrier

The Lenticule Research Substrate Program
(`science-services-section/content/text/documents/articles/notes/2026/09/01/2026-09-01-the-lenticule-research-substrate-program.md`)
holds the doctrine (D1–D6) and the ten-lot build order. This carrier keeps that doctrine
unchanged and widens its engineering from one content type to the whole corpus.

The diagnosis, measured 2026-09-30 by four read-only surveys of the repository:
the house's theory of knowledge is deep, but its engineering covers about a quarter of the corpus.
Glossary terms are the only content type admitted end to end, and they are 9,469 of the 36,980 tracked
Markdown files. Everything else is read as an untyped room.

A professional knowledge organization in 2026 has one schema authority, one identity scheme,
one admission ledger over everything it carries, links that resolve, citations that resolve,
dereferenceable IRIs, a dump and catalog, a hybrid retrieval surface for agents, and quality
metrics that drive the work queue. The house has the parts of most of these and the whole of none.

## Baseline (2026-09-30, survey measurements; the ledger re-measures them in Wave 1)

| Measure | Now |
|---|---|
| Tracked `.md` / `.org` files under `lib/emsenn/services/561-group/` | 36,980 / 3,737 |
| Glossary term carriers admitted | 4,744 of 9,469 (2,982 empty-bodied stubs) |
| Glossary terms public | 149 |
| Non-glossary carriers with any enforced schema | 0 (`note.schema.json` exists, nothing enforces it) |
| Undated notes stating a `type` | 929 of 4,192 |
| Relative Markdown links that resolve | 80,628 of 125,248 (44,620 broken, 36%) |
| Wikilink occurrences that resolve | 10,545 of 19,510 (46% unresolved) |
| Distinct pandoc citekeys that resolve to a source | 1,754 of 3,037 (58%) |
| Science carriers citing nothing (provenance census) | 8,804 of 10,453 |
| Filename stems carried more than once (excluding README-like) | 2,929 stems, 7,123 files |
| Glossary identities carried by more than one section | 404 |
| Term-to-RDF builders | 2, disagreeing (`glossary-skos.mjs`, CAIRN `vocabulary.mjs#buildTermJsonLd`) |
| Corpus walkers | about 6 |
| Concept IRIs that dereference (`https://561.group/knowledge/…`) | 0 |
| Embedding or hybrid index over the corpus | none (FTS5 over revisions only) |
| Hand-declared ontologies under `data/ontology/` (violates D5 and the data trio) | 23 `.ttl` files |

## Decisions

These are settled for this program, from house theory first and published standards second.

1. **Every carrier is a subject.**
   A tracked Markdown or Org file under a section's `content/` is one subject.
   Its frontmatter keys are predicates, and their values are objects (the program's `[file: [key: value]]` reading).
   Admission is by rule only (D6). A carrier that fails admission becomes a typed refusal row and is never dropped.
2. **Identity is scheme-qualified.**
   A subject's identity is `<scheme>/<stem>`, where the scheme is the owning section path with the `services/` connectors dropped.
   This is the rule `schemeIriPath` already applies to glossary terms; it extends to every carrier kind.
   The IRI is `https://561.group/knowledge/<scheme>/<stem>`.
   A bare stem such as `/ns/term/<stem>` that names more than one subject answers `300 Multiple Choices` listing every candidate, never the first match.
3. **One schema authority, generated outward.**
   The science section's JSON Schemas are canonical for carrier kinds.
   OWL classes and properties and SHACL shapes are generated from them by the house's `json-schema-to-owl-shacl-service`.
   That is the house equivalent of LinkML, so LinkML is not adopted.
   The 23 hand-declared `data/ontology/*.ttl` files are retired once their classes exist in the generated layer (D5: generated, never hand-declared).
4. **The relation predicate registry is data, and it carries semantics.**
   `relation-predicates.json` gains, per predicate: `inverse`, a SKOS mapping (`broader`, `narrower`, `related`, `exactMatch`, `closeMatch`), an optional CiTO or PROV mapping, and `subPropertyOf`.
   The hard-coded `BROADER` and `NARROWER` sets in `glossary-skos.mjs` move into that data.
   The registry then publishes each predicate as an OWL object property at `/ns/predicate/<name>`.
   Declared inverses are the converse-predicate ledger that ks-05 (contested cells) lacks.
5. **Kind comes from the artifact-role directory before it comes from a key.**
   `documents/articles/<kind>/`, `glossary/<kind>/` and `logs/<kind>/` already state each file's kind.
   A carrier's `type` is admitted when it agrees with its directory's kind. A carrier whose `type` disagrees, or that has none, is a refusal row, not a guess.
6. **Folds, not rewrites.**
   Legacy key families are folded into admitted slots by byte-preserving, revision-guarded plans.
   The glossary fold (`foldLegacyTermKeys`, commit `49816588d9d`) is the pattern.
   The corpus-wide families are `kind`→`type`, `author`→`authors`, `date`→`date-created`, and inline `references:` entries → citekey carriers.
   A value that disagrees with what the carrier already states stays in place for a person (D2: nothing is overwritten).
7. **Citations are claims.**
   Every `[@key]` resolves to one `<citekey>.md` carrier in the bibliography schema, holding CSL-JSON.
   A citation from a carrier to a source is an admitted relation with a CiTO intent (`cito:citesAsEvidence`, `cito:disputes`, …) and a locator.
   This is Lot 7's citation-triple (carrier, world, evidence), and its predicate list is checked against CiTO before any predicate is coined.
8. **Authorship demand is a ranked queue.**
   D1's backward leg ships first as the queue a professional wiki calls "wanted pages".
   Its items are unresolved link targets, empty stubs, unresolved citekeys, refused carriers and contested cells, ranked by inbound demand over repair cost (D4).
   This is Lot 5's seam with its simplest real implementation.
9. **Public stays opt-in.**
   Nothing becomes public by migration. The program produces a publication-candidate queue (admitted, cited, linked, with no `consent-status`).
   The founder's one move flips `visibility: public` per batch.
10. **Model drafts are candidates, never substrate.**
   Agent-drafted bodies for stubs enter with `status: draft`, the model among the `authors`, and the write contract's `semanticEvidence` excerpts quoted from carriers that already exist.
   They are admitted to the authenticated graph and never to the public surface until a person promotes them.
   That keeps D6 true: no extracted claim enters as settled.
11. **One read path, from the release.**
    VaultMaze, GEODE, `/ns/` and `/mcp` all read the same release checkout through one walker and one ledger.
    The live authoring tree is for authoring, not serving.

## Waves, in dependency order (data → code → networking → systems)

Each workstream lands as MetroPlat work items with machine-checked goals.
A goal is a ledger measurement crossing a threshold, never a green test suite.
Sections are independent, so most workstreams fan out one work item per owning section (about 250 glossaries, more content roots); that is the shape that uses many agents and machines at once.

### Wave 0: the rail

- Restore the MetroPlat entrance; it refused connections on 2026-09-30.
  Every later wave is dispatched through it, and nothing is dispatched around it.
- Owner: `561-group-operations-services-section`.
- Gate: `/healthz` answers, the MCP connects, and one `codex-task` round trip is receipted.

### Wave 1: data

1. **Corpus admission ledger** (owner: knowledge-systems-architect; built in `computer-knowledge-systems-services-section`).
   One walker, generalizing the glossary census, emits one row per carrier with these fields:
   - path, scheme, identity, kind, git blob sha;
   - admitted or refused, with rule findings;
   - outgoing links with each one resolved or unresolved;
   - citekeys with each one resolved or unresolved;
   - visibility.
   The rows are EAVT-compatible, so Lot 6 lifts them unmodified. The dated ledger and its census land in `561-group-services-section/data/records/knowledge/`.
   Gate: 100% of tracked `content/**/*.md` and `*.org` carriers have a row, and two runs over the same commit are byte-identical.
2. **Carrier-kind schema family** (owner: the science schema sections).
   Schemas for `note`, `reference`, `question`, `theorem`, `person`, `place`, `event` and `log-entry`, beside `term`.
   These are the kinds the corpus already states most often: theorem 757, personal-log-entry 642, note 542 and 247, reference 489, question 372, place 283, person 263, event 197.
   Gate: OWL plus SHACL generated for each schema, with no hand-written Turtle.
3. **Predicate registry semantics**, as in Decision 4.
   Gate: every registered predicate states its SKOS mapping and its inverse or `inverse: null`. `glossary-skos.mjs` reads them and has no hard-coded sets.
4. **Identity policy in code**, as in Decision 2.
   Gate: `/ns/term/<stem>` returns 300 for each of the 404 shared identities.

### Wave 2: code (bulk repair; this is where agent scale goes)

1. **Link repair.** A deterministic resolver per section:
   - follow git rename history (`git log --follow --name-status`) to the file's current path;
   - otherwise match the stem within the scheme, then across the nearest schemes (the same nearest-section rule as SKOS resolution);
   - rewrite only when there is exactly one candidate.
   Every other target becomes an authorship-demand item.
   Gate: broken relative links fall from 44,620 to under 2,000, and every survivor is a queued demand item.
2. **Key normalization**, the corpus-wide folds in Decision 6.
   Gate: `type`/`kind`, `author`/`authors` and `date`/`date-created` each have one spelling across all admitted carriers.
3. **Citations into one library** (owner: `bibliography-engineering-services-section`).
   - Extract the 4,970 inline `references:` entries and the 17 `.bib` files (1,212 entries) into `<citekey>.md` carriers.
   - Reconcile them against CrossRef and OpenAlex with the existing lookups, then project to CSL-JSON.
   - Restore the README's missing scripts or remove their claims.
   Gate: citekey resolution rises from 58% to 95%, and the unfilled `@citekey` placeholder (67 uses) is gone.
4. **Glossary completion**, continuing this week's fold.
   - Fold or register the remaining keys: `index`, `author`, `field`, `subject`, `node-relations`, `mathematical-object`, `hanzi`/`pinyin`, `org-properties`, top-level `sources`, and `dg-permalink`.
   - Repair the 58 carriers with malformed YAML.
   - Draft stubs from the demand queue under Decision 10, in demand order.
   Gate: every non-stub refusal is cleared; the admitted count climbs as each stub gains a body.
5. **Org carriers.** Of the 3,737 `.org` files, 1,512 are a parallel glossary in `emsenn-services-section`.
   - Convert each with pandoc into a Markdown carrier where no Markdown twin exists.
   - Where a twin exists, fold the differences into it.
   Gate: no `.org` carrier is the only copy of an assertion.
6. **One builder, one walker.**
   - CAIRN's `buildTermJsonLd` is replaced by the shared `definedTermJsonLd`.
   - The unused `termToThingJsonLd` and `termToCollectionPageJsonLd` are retired.
   - Every corpus walker delegates to the ledger's walker.
   - Dead code is retired: `note-contract.mjs`, `research-document-metadata-admission-service` and `medical-glossary-delivery-service`, unless a consumer is named.
   - The missing exports are fixed (`static-site-publisher/workspace-graph`, GEODE's `check`).
   - The stale READMEs are corrected (L-Space, VaultMaze, bibliography, section).
   Gate: one JSON-LD term shape, one walker, no export pointing at a missing file.
7. **Lost theory restored.** The PKS and markdown-vault theory links point at `research/2026/07/31/lenticule-import/`, and the topic-section model at `2026-08-30-science-topic-section-model.md`.
   Restore both from git history if they ever existed; otherwise repoint or retire every citation of them.
   Gate: no theory carrier cites a missing file.

### Wave 3: networking (publication and retrieval)

1. **Dereferenceable IRIs** (owner: `561-group-operations-services-section`, L-Space).
   - `https://561.group/knowledge/<scheme>/<stem>` serves HTML with a JSON-LD island, and `.jsonld`, `.ttl` and `.md` twins by suffix and by `Accept`, with `Link: rel="alternate"`.
   - Authenticated carriers answer 401 to anonymous callers, never 404, so their existence is honest and their content gated.
   - This finishes Lot 4: rebuild and redeploy.
   Gate: a sampled 100% of public concepts dereference in all four forms.
2. **Discovery files.**
   - `sitemap.xml` over public carriers only, with `lastmod` from git.
   - `robots.txt` with a per-bot AI policy.
   - `llms.txt` and `.md` twins.
   - A DCAT 3 catalog at `/knowledge/catalog.jsonld` naming every distribution.
   Gate: each file validates, and the sitemap names no non-public carrier.
3. **Dumps.** Each release writes a versioned public dump (N-Quads, JSON-LD and a SQLite table) and a quarterly RO-Crate snapshot deposited to Zenodo for a DOI.
   This is the papers lane the program already names (ORCID, Zenodo).
   Gate: the dump hash is recorded in the DCAT, and the DOI resolves.
4. **Agent retrieval** (owner: CAIRN). Its `search` and `fetch` MCP tools are upgraded, not replaced:
   - BM25 (FTS5) plus dense embeddings (sqlite-vec, embedded by zero-cash local inference) over heading-sized chunks, each prefixed with its title, IRI and scheme;
   - reciprocal-rank fusion;
   - one or two hops of expansion over admitted relations.
   Answers carry IRIs and blob shas so they can be cited.
   Gate: recall@10 ≥ 0.85 on a 150-question evaluation set with gold carriers, re-run each release.
5. **Reconciliation outward.** Public concepts are matched to Wikidata QIDs by rule plus review and published as `skos:exactMatch` or `skos:closeMatch`.
   Gate: the match rate is reported; no match is asserted without review.

### Wave 4: systems (the autonomic loop)

The knowledge graph becomes the house's first running MAPE-K node:

- **Monitor:** the ledger, per release.
- **Analyze:** completeness, consistency (SHACL violations, `broader` cycles, ⊤ contested cells), connectivity (orphans, components, mean degree), link rot, citation coverage, freshness.
- **Plan:** the authorship-demand queue, ranked by D4's metabolic rule.
- **Execute:** queue items dispatched as MetroPlat work items to outside agents and zero-cash workers.
- **Knowledge:** the corpus, which only grows (D2).

Lot 8 (`settle-corpus`) runs this loop by hand first. Lot 10's vertical slice proves one carrier admitted, settled, served, dereferenced and receipted.
Gate: the loop runs on a schedule, and each run writes a dated quality record and closes demand items it did not open by hand.

## Targets

| Measure | Now | Gate |
|---|---|---|
| Carriers with a ledger row | glossary only | 100% |
| Carriers admitted under a kind schema | 4,744 | ≥ 80% of the ledger |
| Broken relative Markdown links | 44,620 | < 2,000, all queued |
| Citekey resolution | 58% | 95% |
| Science carriers citing nothing | 84% | measured and queued; falling every release |
| Shared identities served as first match | 404 | 0 (all 300) |
| Term-to-RDF builders | 2 | 1 |
| Corpus walkers | ~6 | 1 |
| Public concepts dereferenceable | 0 | 100% |
| Agent retrieval recall@10 | unmeasured | ≥ 0.85 |
| Hand-declared ontology files | 23 | 0 |

## Mapping onto the substrate lots

| Lot | Here |
|---|---|
| Lot 4, vocabulary surface | Wave 3.1 |
| Lot 5, backward seam | Decision 8, the demand queue |
| Lot 6, EAVT→SEAVT lift | Wave 1.1 ledger rows, lifted unmodified |
| Lot 7, citation triple | Decision 7, Wave 2.3 |
| Lot 8, settle-corpus | Wave 4 |
| Lot 9, σ/Δ extraction | unchanged, still deliberately late |
| Lot 10, vertical slice | Wave 4 gate |

## Open questions (filed, not assumed)

1. Whether `consent-status` gains a value vocabulary. Lot 2's rule stands: grep first, coin nothing.
2. Whether `/ns/` graduates from l-space to `561.group` before external dereference signal exists. This program needs `561.group/knowledge/` to resolve, so the two are decided together in Wave 3.1.
3. Whether the deep `recovered/` (1,632), `legacy/` (3,916) and `obsmetrologia` (1,847) trees are carriers or archives.
   Until decided, the ledger rows them as `kind: archive` and excludes them from targets.
4. The three-theories rule for predicates versus 94 registered predicates.
   The registry's new SKOS mapping makes every predicate's meaning explicit; whether to prune is decided from usage counts the ledger reports.
