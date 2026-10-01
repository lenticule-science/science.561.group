---
title: "The corpus knowledge graph program"
description: "Program carrier for turning the whole 561 Group corpus, not only its glossaries, into one admitted, linked, cited, dereferenceable and searchable knowledge graph, run as the Monitor and Knowledge of the house's corpus MAPE-K loop. It sets ledger-measured baselines, a debt ratchet at integration, ledger-derived work signals per section that section micro-enterprises take, gated targets, four waves in dependency order, and the owning office for each workstream."
date-created: 2026-09-30
date-updated: 2026-09-30
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

## Ledger measurement (2026-09-30, commit `b42d6bf5c28`)

Wave 1.1 landed as `corpus-census-service` (bin `census-corpus`), and these are its first readings.
Its dated census record and wanted queue live in `561-group-services-section/data/records/knowledge/corpus/`.
The per-carrier rows are a derived payload Git ignores; the record names their count and SHA-256, so a re-derivation at the commit is checkable.
It reads the commit, not the working tree, and counts link and citekey occurrences, so its figures differ from the survey's above, which counted distinct keys over the working tree.
Where the two disagree, the ledger's figure is the one later waves gate on.

| Measure | Live | Archive |
|---|---|---|
| Carriers (`.md` / `.org`) | 28,904 (27,088 / 1,816) | 11,703 (9,788 / 1,915) |
| Markdown carriers without frontmatter / with malformed frontmatter | 1,250 / 195 | 2,142 / 260 |
| Public carriers (`visibility: public`, no `consent-status`) | 594 | 13 |
| Term carriers admitted / refused | 4,744 / 4,725 | not schema-read |
| Bibliography carriers admitted / refused | 187 / 388 | not schema-read |
| Carriers under no schema | 18,860 | 11,703 |
| Relative links resolved / broken / escaping the root | 68,865 / 36,999 (35%) / 435 | 11,103 / 19,986 / 43 |
| Wikilinks resolved / unresolved / ambiguous | 2,892 / 3,265 (48%) / 534 | 3,391 / 3,669 / 848 |
| Citekey occurrences in the citing carrier's map / known elsewhere / unknown | 1,597 / 1,553 / 3,537 (53%) | 8 / 909 / 109 |
| Identities (`<section>/<stem>`) / ambiguous / carriers behind them | 28,281 / 454 / 1,077 | — |

The live demand queue (`wanted.json`) has three parts.

- 1,638 wanted pages (479 named by two or more carriers).
  The top ones are `induce` (51 referrers), `relational expression` (27), `postulate` (23) and `constrain` (22), and links into the retired `zeds/` and `triage/` trees.
- 1,080 wanted references (384 cited by two or more carriers), led by the writing sections' canon: `flowerhayes1981` (22), `redish2012` and `williams2006` (18), `schriver1997` (16).
- 17,617 broken path targets.
  1,617 are named by three or more carriers and listed; the rest are counted.

`science/philosophy` alone holds 20,288 of the 36,999 live broken links.

## What the ledger changed

The first readings overturn four assumptions this program started with.

1. **Broken links are mostly misplacement and demand, not rot.**
   Over the 12,409 listed broken-link occurrences, measured against every rename Git recorded in 2026 (755,478 paths):
   - Rename history repairs 2.5% (310). Re-resolving from the source carrier's earlier paths repairs 1.8% (222).
   - The content librarian's resolution rule is "nearest by filesystem distance, neighbours or upward, never downward".
     Under it, one carrier in the referrer's own, sibling or ancestor section bears the name in 38.7% (4,794).
   - Several such carriers tie in 9.4% (1,163). Polysemy across sections is correct, so these are borders, not damage.
   - Only a descendant section carries the name in 29.1% (3,615). Rewriting would resolve downward, which the rule forbids.
   - Nothing tracked carries the name in 22.9% (2,837). These are pages someone linked and nobody wrote.

   So the repair is a scope resolver, not history replay, and it can repair under two-fifths of these occurrences by rule.
   The rest is demand: pages owed at the scope that named them.
   A path link to an unwritten page is a red link, which a wiki treats as legitimate demand, not as an error.
2. **The corpus barely cites, and most of what it cites breaks the citation law.**
   Only 1,070 of 28,904 live carriers (3.7%) cite anything with `[@key]`. Of 2,432 claim-kind carriers (research, essay, theory, concept, teaching), 95 do.
   14,783 live carriers (51%) carry no link or wikilink at all.
   The science topic-section model permits inline `[@key]` "only when the key exists in that file's `references:` map".
   So the ledger's 1,553 `covered` occurrences break the law just as the 3,537 `unknown` ones do. Only 1,597 of 6,687 occurrences (24%) are lawful.
   The binding constraint is coverage and lawful depth-1 citation, not a bigger library.
3. **Nine kinds cover 86% of the unschematized corpus.**
   Of the 18,860 live carriers under no schema:

   | Kind | Carriers |
   |---|---|
   | note | 10,869 |
   | term (the Org parallel glossary) | 1,569 |
   | concept | 795 |
   | log | 643 |
   | readme | 588 |
   | research | 532 |
   | essay | 454 |
   | topic | 414 |
   | teaching-article | 403 |

   One `note` schema admits more than half of them.
4. **Debt is concentrated.**
   Debt here is broken links, unresolved wikilinks, unknown citekeys, refusals and unschematized carriers. 821 owning sections hold live carriers.
   The ten most indebted hold 68% of the measured debt, the top 50 hold 90%, and the top 100 hold 94%.
   Five sections lead: `emsenn` (personal), `relationality`, `relationality/agency`, `philosophy` itself, and `logic`.
   A 50-item fan-out reaches nine-tenths of the work.

## Decisions

These are settled for this program, from house theory first and published standards second.

1. **Every carrier is a subject; its rows are the knowledge.**
   A tracked Markdown or Org file is one subject.
   The owner's ruling of 2026-09-03 stands: "Frontmatter remains a carrier format for prose". The knowledge representation is RMN cells in SEAVT rows.
   So the ledger's rows are level-0, append-only rows (D3), and the frontmatter is what they are read from.
   Lot 6's EAVT→SEAVT lift moves forward into Wave 1, because every later wave reads rows, not files.
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
   The topic-section model gave `data/ontology/` a seat. D5 and the data-trio law are later and govern: the seat holds generated output.
4. **The relation predicate registry is data, and it carries semantics.**
   `relation-predicates.json` gains, per predicate: `inverse`, a SKOS mapping (`broader`, `narrower`, `related`, `exactMatch`, `closeMatch`), an optional CiTO or PROV mapping, and `subPropertyOf`.
   The hard-coded `BROADER` and `NARROWER` sets in `glossary-skos.mjs` move into that data.
   The registry then publishes each predicate as an OWL object property at `/ns/predicate/<name>`.
   Declared inverses are the converse-predicate ledger that ks-05 (contested cells) lacks. With them, contested cells stop reading as zero.
   The registry also states, per predicate:
   - its relation class: ordering, cross-reference, classifier or verification (`lean:`);
   - which of the four predicate generators produced it: specialization, converse, subject-projection or object-projection.

   A `depends-on` cycle is a soundness diagnostic.
   A local predicate is lifted into the registry once it recurs in three theories, which answers the pruning question by rule.
5. **Kind comes from the artifact-role directory before it comes from a key.**
   `documents/articles/<kind>/`, `glossary/<kind>/` and `logs/<kind>/` already state each file's kind.
   A carrier's `type` is admitted when it agrees with its directory's kind. A carrier whose `type` disagrees, or that has none, is a refusal row, not a guess.
6. **Folds, not rewrites.**
   Legacy key families are folded into admitted slots by byte-preserving, revision-guarded plans.
   The glossary fold (`foldLegacyTermKeys`, commit `49816588d9d`) is the pattern.
   The corpus-wide families are `kind`→`type`, `author`→`authors` and `date`→`date-created`.
   The citation fold is a fourth: a cited key known elsewhere is copied into the citing carrier's own `references:` map.
   A value that disagrees with what the carrier already states stays in place for a person (D2: nothing is overwritten).
7. **Citations are claims, at the depth the source earns.**
   The science topic-section model's three depths govern. It is recoverable from history (Wave 2.7).
   - **Depth 1.** The citing carrier's `references:` map holds CSL-JSON per key, and inline `[@key]` is lawful only for keys in that map.
     A depth-1-only citation is healthy.
   - **Depth 2.** A `<citekey>.md` bibliography carrier exists only when a source "deserves more than a citation". Its body says why the source is central, what it does not settle, and what it bridges.
   - **`.bib` files.** They are projections, "never a second source of truth".

   A citation is an admitted relation with a CiTO intent (`cito:citesAsEvidence`, `cito:disputes`, …) and a locator.
   This is Lot 7's citation-triple (carrier, world, evidence), and its predicate list is checked against CiTO before any predicate is coined.
8. **Authorship demand is a ranked, priced queue.**
   D1's backward leg ships first as the queue a professional wiki calls "wanted pages".
   Its items are:
   - unresolved link targets and red links;
   - empty stubs;
   - unlawful citekeys;
   - claim-kind carriers citing nothing;
   - refused carriers.

   An item is discharged only when D4's priced yield exceeds discovery-plus-repair cost. Inbound demand is the first yield estimate, and repair cost comes from the item's class.
   Contested cells are not demand items: "contradiction is data, never a defect by default".
   This is Lot 5's seam with its simplest real implementation.
9. **Public stays opt-in, and consent filters every claim.**
   Nothing becomes public by migration. The program produces a publication-candidate queue (admitted, cited, linked, with no `consent-status`).
   The founder's one move flips `visibility: public` per batch.
   Consent is a first-class admitted field (D6). Every surface (pages, dumps, `/mcp`, retrieval) filters per claim, not only per carrier, so a public carrier never serves a withheld claim.
10. **Model drafts are candidates, never substrate.**
   Agent-drafted bodies for stubs enter with `status: draft`, the model among the `authors`, and the write contract's `semanticEvidence` excerpts quoted from carriers that already exist.
   They are admitted to the authenticated graph and never to the public surface until a person promotes them.
   "A writer cannot accept its own manuscript".
   A draft's receiver is never the drafting office, and a model judge is never the sole gate when judge and drafter share model lineage.
   That keeps D6 true: no extracted claim enters as settled. Extraction proposes and never commits.
11. **One read path, from the release.**
    VaultMaze, GEODE, `/ns/` and `/mcp` all read the same release checkout through one walker and one ledger.
    The live authoring tree is for authoring, not serving.
12. **The ledger is the integration gate, and it only ratchets.**
    No integration may raise, in any section, the live count of:
    - broken path links;
    - unresolved wikilinks;
    - unlawful citekeys (any key outside the citing carrier's own map);
    - schema refusals.

    `census-corpus` compares the candidate commit with its base, and `duty-worktree-check` runs it beside the changed packages' checks.
    Every section is compared, not only the touched ones, because deleting a carrier breaks the links to it from sections the change never touched.
    A moved carrier keeps its debt in the section it left, so a move is refused only for the damage it does.
    This is Wikidata's constraint-report loop moved before the write.
    It stops new debt from every agent at once, which no amount of bulk repair can do while agents keep writing.
    A refusal is database-proof execution: a write without a derivation witness changes nothing. It is a refusal, not an action, so the knowledge plane still selects no actions.
13. **Every work item is a ledger predicate.**
    A work item's acceptance is a `census-corpus` assertion over one section, such as live broken path links ≤ 0 or carriers under no schema ≤ n.
    The assertion runs as a command, so it is the rail's `deterministicExecution` with `command-exit-status: 0`.
    Sections are micro-enterprises ([micro-enterprises hold their own work](../../../../../../../../../../../../../../../561-group-services-section/content/text/documents/articles/notes/2026/09/30/2026-09-30-note-on-micro-enterprises-holding-their-own-work.md)), so the ledger posts work and never allocates it.
    A deriver turns the ledger into one open signal per indebted section, posted by the `corpus-knowledge-ledger` node micro-enterprise, which is also the signal's assayer:
    - the endeavor is this program, and its campaign is the ratchet's debt;
    - one project, plan and task per section;
    - one `work-item:` per debt the section's own carriers carry.

    Whichever micro-enterprise's taking policy admits a signal takes it into its own root. Ranking by D4's priced yield becomes the signal's offer, never an assignment.
    Nobody writes work items by hand. The ledger writes them, and the ledger closes them: a section measured clear has its resulted signal accepted, or its untaken signal withdrawn.
    Coordination freedom is proved, not assumed. One signal's write set is its own section's live carriers, so signals commute and their fan-out is order-independent.
    The debts within one section share that write set, so the deriver names every pair of them in the rail's `conflicts`.
    A fold that would write into another section is split at the border.
14. **Sections are micro-enterprises with a knowledge account.**
    Each owning section's ledger rollup is its scorecard:
    - demand it owes (wanted items in its scheme);
    - debt it carries (broken, unresolved, refused, unschematized);
    - product it ships (admitted, cited, public, retrieved).

    The scorecard is published per release beside the census.
    The section, not the founder, owns its numbers, and its office takes its work from them.
    Micro-enterprises are relations, not production stages, so the scorecard also counts what other sections' carriers resolve into this one: research is common capital, valued by the relations it enabled.
    The knowledge offices keep their custody:
    - **Chief knowledge officer.** Coordinates without taking the specialist custody below.
    - **Knowledge-systems architect.** Holds the ledger, the ratchet and the deriver. It measures incumbents before claiming meet-or-beat.
    - **Content librarian.** Holds resolution scope, completeness stated as a count, and "the glossary does not define".
    - **Bibliography engineering.** Holds the citation depths.
    - **Each section's office.** Holds its own repairs.
15. **Claims are paraconsistent, content-addressed bundles.**
    - **The bundle.** An admitted citation, `broader` edge or contested cell is a claim in nanopublication shape: an assertion, its provenance (the citing carrier and the evidence it quotes) and its publication info.
    - **Identity.** A claim's content address is an RFC 6920 `ni:` SHA-256 over its typed envelope, taken in the order admit → type → normalize → settle → envelope → encode → digest.
      Normalization is not settlement.
      The address names the content, never the entity: a subject's IRI and its claims' addresses stay distinct, as do actor and content identity.
    - **The log.** Bundles append to a bitemporal log, and each release publishes its Merkle head (a transparency log).
      Retraction is another event.
    - **The value.** Each claim's four-valued cell (t, f, both, neither) is computed from its supporting and disputing edges (`cito:supports`, `cito:disputes`), never stated.
      Absence is *neither*, never false.
      *Both* is data. It is reported and served as contested, and never repaired by averaging (borders are never discharged).
      No published standard represents Belnap values in RDF, so the cell is a house predicate in the registry.
      It carries provenance, scope, time and authority beside it, because FOUR alone supplies none of them.
    - **The serialization.** Named graphs carry claims until RDF 1.2 triple terms reach Recommendation; RDF 1.2 Concepts has been a Candidate Recommendation since 2026-04-07.
      Attribution is never collapsed into assertion.
16. **Retrieval is graph-native, vocabulary-spined and model-free at index time.**
    - **Index.** Three channels are fused by reciprocal rank and reranked by a local cross-encoder:
      - the SKOS label spine (preferred, alternative and hidden labels, including outsiders' words);
      - BM25 (FTS5);
      - local dense vectors (Qwen3-Embedding-0.6B or EmbeddingGemma, zero-cash).

      Dense-only search is unsafe, so the spine comes first.
      Personalized PageRank then runs over the admitted relation graph.
      That is HippoRAG 2's shape without its model-extracted triples. The house graph already exists, and D6 forbids extracted ones.
    - **What is skipped.** GraphRAG and LightRAG cost 10–100× the indexing tokens for task-dependent gains, so they are not adopted *on cost*.
      ks-11's meet-then-beat still measures them, with LlamaIndex, on the same gold set before this design claims to beat them.
    - **Chunk prefixes.** Each chunk's prefix is its title, IRI, scheme and heading path: contextual retrieval by rule, with no model call.
    - **Witnesses.** An embedding is the provenance-forgetting projection, so every served hit re-attaches its witnesses: IRI, blob SHA, claim addresses and four-valued cells.
      Groundedness is bounded by recall, so recall is the gate.
    - **Gold set.** It is derived by rule:
      - every identity's title and aliases must retrieve its own carrier;
      - every resolved link's sentence must retrieve its target.

      That gives tens of thousands of free positives. A 150-question hand-checked set anchors them, with outsider-worded queries among them.
      Each run reports recall, the zero-result rate, and which channel found each hit.
17. **External evidence is captured, not trusted.**
    Every external URL a live carrier cites gets a capture record: the Wayback snapshot, and the SHA-256 of the bytes retrieved, held by the content-addressed storage service.
    Link rot is then a fold that adds the capture beside the claim, never an edit of the claim (D2).
18. **Standards in their current state, not their hoped state.**
    - **Adopt now.** SHACL 1.0, the Recommendation (1.2 Core is a Working Draft as of 2026-08-03).
      DCAT 3, a Recommendation since 2024-08-22. SKOS, and schema.org `DefinedTerm`.
      RO-Crate 1.2 for evidence packages. Static dumps instead of a SPARQL endpoint.
    - **Publish but do not count on.** `llms.txt`: 97% of such files drew no requests in May 2026, and a 300,000-domain study found no citation lift.
      Agents are served through `/mcp`.

## Waves, in dependency order (data → code → networking → systems)

Each workstream lands as MetroPlat work items with machine-checked goals.
A goal is a ledger measurement crossing a threshold, never a green test suite.
Sections are independent, so most workstreams fan out one work item per owning section.
There are 821 such sections, and the top 50 hold 90% of the debt.
This is the shape that uses many agents and machines at once. The deriver (Wave 1.6) writes the fan-out, so its size follows the ledger, not a plan.

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
   **Landed 2026-09-30** (`corpus-census-service`).
   Rows cover every tracked `.md` and `.org` file, not only `content/`, so READMEs and package documents are subjects too.
   Both gate conditions hold at `b42d6bf5c28`.
   Decision 8's queue ships with it: wanted pages, wanted references and wanted paths.
   Stubs, refusals and contested cells join the queue in later waves.
2. **Carrier-kind schema family** (owner: the science schema sections).
   The order is by directory kind, as the ledger measured it. The first schema is `note` (10,869), then `concept`, `log`, `readme`, `research`, `essay`, `topic` and `teaching-article`.
   Those eight, plus the Org glossary's conversion in Wave 2.5, cover 86% of unschematized live carriers.
   The stated `type` values (`theorem`, `reference`, `question`, `person`, `place`, `event`) become subtypes of the directory kinds that carry them, not rival kinds.
   Gate: OWL plus SHACL generated for each schema, with no hand-written Turtle. Live carriers under no schema fall from 18,860 to under 2,700.
   **`note` landed 2026-09-30.**
   - The canonical schema is knowledge organization's `data/records/schema/carriers/note.schema.json` (`$id` `carriers/note`).
     It replaces the knowledge-system server's `vault/note`, the app-held copy the note contract compiled.
   - `json-schema-to-owl-shacl-service` now reads `$ref` as JSON Schema does: a pointer fragment reuses that subschema in place, and a reference schema resolves `$ref`s without minting a class.
     It generates `data/ontology/carriers/{ontology,shapes}.ttl`, with the term schema as the reference.
   - `carrier-kind-engineering-services-section` projects the schema, tests it equal to science, and admits frontmatter by kind.
     It also holds the path-to-kind rule the census uses, and the note repair planners from the retired contract.
   - Measured at `89827a11d0d`: live carriers under no schema fall from 18,862 to 8,043.
     Of 10,819 notes, 3,649 are admitted and 7,170 refused.
     The refusals are the repair queue: `required:date-created` 6,194, `required:description` 1,013, `type:references` 610, `required:title` 237 and `pattern:keywords` 235.
     The first is the `date`→`date-created` key fold of Decision 6, with the dated path as its second source.
   - The ratchet is unchanged by the new law, because base and candidate are both read under it. A new note with no frontmatter is new refusal debt in its section.

   `concept` is next.
3. **Predicate registry semantics**, as in Decision 4.
   Gate: every registered predicate states its SKOS mapping and its inverse or `inverse: null`. `glossary-skos.mjs` reads them and has no hard-coded sets.
4. **Identity policy in code**, as in Decision 2.
   Gate: `/ns/term/<stem>` returns 300 for each of the 404 shared identities.
5. **Ledger assertions and the ratchet** (owner: knowledge-systems-architect), as in Decision 12.
   - `census-corpus` gains `--section <scheme>` and `--assert <measure><op><n>`; a failed assertion exits non-zero.
   - It also gains `--base <rev>`, which compares the touched sections' rollups between two commits and exits non-zero on any rise.
   - The census must fit a gate. A full run costs about 90 s and 1.2 GB today, so the comparison reuses the base's rows by blob SHA and re-reads only the changed carriers.

   `duty-worktree-check` calls it.
   This is the next bite, because every later work item's acceptance is one of these commands.
   Gate: the ratchet refuses a fixture commit that adds one broken link to a section, admits one that removes one, and runs in under 10 s on a one-section change.
   **Landed 2026-09-30** (`corpus-census-service`'s `corpus-ledger.mjs`, wired into the code development engine's `duty-worktree-check`).
   - The fixture gate holds: a commit adding a broken link exits 1 naming the section's rise, and one removing a link exits 0 with the fall.
   - The comparison reuses carrier facts by blob, not whole rows. Resolution depends on what else exists, so it runs again over every carrier.
     The facts live in a per-user store keyed by blob, extension, schema and filename, and by the digest of the code that reads them.
     It is cold once (about 45 s) and warm after that: 6.6–8.7 s and 0.9 GB for a worktree check of the full house corpus against `origin/main`.
   - `--worktree` checks the tree as `git add -A` would commit it, so a duty is held to the ratchet before it commits.
     The check fails the duty when any section rises, and lists each rise.
   - The ledger adds `unlawfulCitekeys` to the rows (5,090 live at the fork), and `--section` with `--assert` gives Wave 1.6 its acceptance commands.
6. **The work-signal deriver** (owner: knowledge-systems-architect), as in Decision 13.
   The first plan was one ecosystem-wide intent admitted centrally and allocated to section offices.
   That is the one work bucket the micro-enterprise note retires, so the deriver posts signals instead.
   `deriveKnowledgeWorkSignals` reads the census rows and writes one signal per live section whose own carriers carry ratchet debt:
   - each signal is a `metroplat.work.structured-intent` built with the board's `signalOf`, tagged `knowledge-debt`, `section:<path>` and its debts;
   - each `work-item:` carries `work` (link repair, lawful citation or schema admission) and `deterministicExecution` running `census-corpus --section <s> --only --assert <measure><=0`;
   - a signal is addressed by what it asks, not the counts, so it stays the same signal while the debt persists, and the counts travel beside it.

   Each census run writes `signals.json` beside `wanted.json`.
   `reconcileKnowledgeSignals` plans the ledger's standing on the board: post what is new, accept what a taker repaired, withdraw what nobody needs.
   Gate: the signals cover the sections holding 90% of measured debt, and every item's acceptance command fails at the commit it was derived from.
   That failure is what proves each item names real work.
   **Landed 2026-09-30** (`corpus-census-service`'s `knowledge-work-signals.mjs`; poster record `knowledge-organization-services-section/lib/agency/enterprises/corpus-knowledge-ledger.json`).
   - At `25688e24e2f`: 343 signals carrying 536 work items and 50,467 debt. The 33 most indebted sections hold 90% of it, so the 50-section gate is met.
   - The acceptance commands sampled at the largest, median and smallest signal all exit 1 at that commit.
   - The census run that writes them takes 34 s and 1.2 GB.
   - Posting waits on the MetroPlat entrance (Wave 0): the ledger applies its reconciliation through `signal-post`, `signal-accept` and `signal-withdraw` under its own identity.
7. **The section scorecard**, as in Decision 14.
   Each scorecard also carries its FORD/ANZSRC facet, the only enforced classification, so every scorecard can be rolled up by field.
   The census record gains one scorecard per owning section (demand owed, debt carried, product shipped). The rendered site shows them as a table per release.
   Gate: all 821 owning sections have a scorecard, and the release diff shows which moved.

8. **The SEAVT lift** (Lot 6, moved forward by Decision 1).
   The ledger's per-carrier rows are lifted into level-0 SEAVT rows, one row per frontmatter cell, append-only and keyed by blob SHA.
   σ and Δ stay separate passes over them (D3).
   Gate: every admitted cell of every live carrier is a row, and re-lifting at the same commit adds none.

### Wave 2: code (bulk repair; this is where agent scale goes)

1. **Link repair.** One deterministic scope resolver, shared by the census, the fold and the authoring tools.
   The resolver applies the content librarian's rule: nearest by filesystem distance, neighbours or upward, never downward.
   Measured rates over the listed occurrences are in parentheses. Rename history is consulted last, because it explains under 3%.
   - **Damage** (38.7%). One carrier in the referrer's own, sibling or ancestor section bears the name: rewrite to it.
   - **Unwritten** (22.9%). Nothing carries the name. The path link becomes a wikilink to the wanted page (a red link), so it is demand, not an error, and it joins `wanted.pages`.
   - **Borders** (9.4%). Several in-scope carriers tie, so the link stays as written. A candidate row names every candidate, and the owning office settles them in one batch decision per section.
     Polysemy is correct, so the office may instead answer with a disambiguating page.
   - **Downward only** (29.1%). Only a descendant section carries the name.
     The resolver never guesses downward. The office either writes the page at the referring scope or rewrites the link explicitly into the descendant.

   The fold is byte-preserving and revision-guarded (Decision 6), and each pass emits D4's settling receipts.
   The same resolver runs at write time in the house Markdown tools, so new links resolve before the ratchet sees them.
   Gate:
   - The rule fold (damage plus red links) removes about three-fifths of the 36,999 live broken links at `b42d6bf5c28`, measured on the fold itself.
   - Every survivor is a border or downward candidate row in its section's queue.
   - Zero live broken path links remain once the offices settle their candidates.
2. **Key normalization**, the corpus-wide folds in Decision 6.
   Gate: `type`/`kind`, `author`/`authors` and `date`/`date-created` each have one spelling across all admitted carriers.
3. **Lawful depth-1 citation** (owner: `bibliography-engineering-services-section`), as in Decision 7.
   - **Fold covered keys.** A key the citing carrier uses but another carrier's map, a bibliography carrier or a `.bib` entry knows is copied as CSL-JSON into the citing carrier's own `references:` map. That covers 1,553 live occurrences at `b42d6bf5c28`.
   - **Queue unknown keys.** A key nothing knows becomes a wanted reference.
     Agents propose CSL-JSON from CrossRef and OpenAlex as candidates under Decision 10.
     A DOI or ISBN that resolves to the stated title is the admitting rule.
   - **Depth 2 only when earned.** No bulk extraction into `<citekey>.md` carriers.
     A source cited by three or more carriers across two or more sections is a depth-2 *candidate*, and it gets a carrier only with the body the topic model requires.
   - **`.bib` files.** The 17 files (1,212 entries) are regenerated from the maps, never read as truth.
   - **The README.** Restore its missing scripts or remove their claims.

   Gate: lawful citekey occurrences rise from 24% (1,597 of 6,687) to 95%. Every survivor is a wanted reference. The unfilled `@citekey` placeholder (67 uses) is gone.
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
   - Dead code is retired: `research-document-metadata-admission-service` and `medical-glossary-delivery-service`, unless a consumer is named.
     `note-contract.mjs` was retired by Wave 1.2; its repair planners live on in `carrier-kind-engineering-services-section`.
   - The missing exports are fixed (`static-site-publisher/workspace-graph`, GEODE's `check`).
   - The stale READMEs are corrected (L-Space, VaultMaze, bibliography, section).
   Gate: one JSON-LD term shape, one walker, no export pointing at a missing file.
7. **Lost theory restored.**
   - **The science topic-section model.** It was deleted on 2026-09-23 and still governs citation depth (Decision 7). It is recoverable at `47074d50270^:…/561-group-science-services-section/content/text/documents/articles/specifications/2026-08-30-science-topic-section-model.md`.
     Restore it to the science section, minus the `data/ontology/` seat that D5 overrides.
   - **The PKS and markdown-vault theory.** Its links point at `research/2026/07/31/lenticule-import/`. Restore it from Git history if it ever existed; otherwise repoint or retire every citation of it.

   Gate: no theory carrier cites a missing file.
8. **Citation coverage** (owner: `bibliography-engineering-services-section` with each section's office).
   A live carrier whose kind makes claims (`research`, `research-article`, `essay`, `teaching-article`, `theory`, `concept`) and that cites nothing becomes a `citation-wanted` demand item: Wikipedia's "citation needed", queued instead of inlined.
   Agents draft candidate citations under Decision 10. A candidate is admitted only when its quoted span is found verbatim in captured, hashed evidence (Decision 17).
   Gate: the share of claim-kind carriers citing anything is measured per release and rises every release. The first gate is 25%, up from 95 of 2,432 (3.9%) at `b42d6bf5c28`.
9. **Evidence capture**, as in Decision 17.
   Gate: every external URL in a live public carrier has a capture record. Authenticated carriers follow in demand order.
10. **Archive stratum retired from targets.**
    The 11,703 archive carriers (`lib`, `legacy`, `triage`, `recovered`, `_archive`, `lenticule-import`) are evidence for D3's strata, not subjects.
    They keep their rows and are never edited (D2). Live links into them count as resolved evidence links, not as live subjects.
    Live links that name archive paths that do not exist (the `triage/404.md` family alone has 556 occurrences) are repaired like any other.
    Gate: no live target counts an archive carrier, and no live work item names one.

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
4. **Agent retrieval** (owner: CAIRN), as in Decision 16. Its `search` and `fetch` MCP tools are upgraded, not replaced:
   - BM25 (FTS5) plus dense embeddings (sqlite-vec, embedded by zero-cash local inference) over heading-sized chunks, each prefixed with its title, IRI, scheme and heading path;
   - reciprocal-rank fusion, then a local cross-encoder rerank;
   - Personalized PageRank over the admitted relation graph, seeded by the fused hits.

   Answers carry IRIs and blob SHAs so they can be cited. Each answer also carries its claims' four-valued cells, so a contested claim reads as contested.
   At 30,000 carriers (about 100,000 to 300,000 chunks), brute-force sqlite-vec answers in milliseconds, so no ANN service is needed.
   Gate: recall@10 ≥ 0.90 on the rule-derived self-retrieval set and ≥ 0.85 on the 150-question hand-checked set, re-run each release.
   A regression blocks the release.
5. **Reconciliation outward.** Public concepts are matched to Wikidata QIDs by rule plus review and published as `skos:exactMatch` or `skos:closeMatch`.
   Gate: the match rate is reported; no match is asserted without review.

### Wave 4: systems (the autonomic loop)

The house already runs knowledge loops: the Web-signal MAPE-K loop, and the corpus-management service's `project-corpus-knowledge-mape`.
This wave does not add a rival. The corpus ledger becomes that loop's Monitor and its Knowledge, and the loop keeps its closure rules:
- contradictions remain explicit;
- analysis selects no action;
- execution emits advice and never writes customer territory.

In the knowledge plane, outputs are evidence and models, not actions. Actions run on the rail, under offices and receivers.

- **Monitor:** the ledger, at every integration (the ratchet) and every release (the census).
- **Analyze:** each SHACL shape reports its violation ratio per section, as Wikidata's constraint reports do. The other measures are:
  - completeness;
  - consistency (`broader` and `depends-on` cycles);
  - contest, the count of claims whose cell is *both*, reported as data and never as a defect;
  - connectivity (orphans, components, mean degree);
  - capture freshness, citation coverage and retrieval recall;
  - Diátaxis coverage, the share of terms, concepts and topics carrying all four surfaces.

  Every settling pass emits D4's H⁰/H¹/χ receipts. Their index balance is the run-integrity check.
  A refused merge carries its obstruction quantity rather than being averaged away.
- **Plan:** the deriver posts one open signal per indebted section from the scorecards and the demand queue, with D4's price as its offer.
  A signal is advice: demand any micro-enterprise may take.
- **Execute:** the loop does not admit or allocate. A section's micro-enterprise, or any whose taking policy admits the signal, takes it into its own root, where its own offices, outside agents and zero-cash workers run it.
  The item is discharged when its ledger assertion exits 0 and the ledger, as assayer and not the writer, accepts the result.
- **Knowledge:** the SEAVT rows and claim bundles, which only grow (D2).

Self-improvement changes the loop's rules, never its authority. A changed resolver, ranking or schema is a versioned rule revision that must:
- pass its authority and regression checks;
- improve a held measure on evidence, not self-report;
- roll back by address.

A human intervention in the loop is recorded as a cause-coded incident, which is how the loop learns what it cannot yet do.

Lot 8 (`settle-corpus`) runs this loop by hand first. Lot 10's vertical slice proves one carrier admitted, settled, served, dereferenced and receipted.
Gate: the loop runs on a schedule. Each run writes a dated census, scorecards, settling receipts and the derived signals, reconciled on the board.
Over four consecutive runs it closes more demand than it opens, with no work item written by hand and the incident count falling.

## Schedule

Agent scale sets the pace, not one author's hours. Each date is a gate measured by the ledger, not a promise of effort.

| By | Gate |
|---|---|
| 2026-10-03 | Wave 0 holds. Wave 1.5 (assertions and ratchet, landed 2026-09-30) and 1.6 (signal deriver, landed 2026-09-30) land. The first derived signals cover the 50 most indebted sections. |
| 2026-10-10 | Wave 1 complete: `note` and the next seven kind schemas generated, predicate semantics registered, identity 300s served, scorecards published, SEAVT rows lifted; the topic-section model restored. |
| 2026-10-24 | Wave 2's rule repairs complete: link fold, key folds, Org conversion. Broken path links under 2,000, and every tie is filed for decision. |
| 2026-11-07 | Citations in one library, external evidence captured for public carriers, one walker and one builder. Wave 3.1–3.3 serve and dump. |
| 2026-11-21 | Retrieval at its recall gates. Claim bundles carry four-valued cells. |
| 2026-11-30 | The MAPE-K loop runs on a schedule and closes more than it opens. |

## Targets

| Measure | Now | Gate |
|---|---|---|
| Carriers with a ledger row | 100% (40,607 at `b42d6bf5c28`) | 100%, met |
| Integrations that raise a touched section's debt | unguarded | 0 (the ratchet refuses them) |
| Work items written by hand for this program | all | 0 (derived from the ledger, closed by its assertions) |
| Owning sections with a scorecard | 0 of 821 | 821 |
| Live carriers under no schema | 8,043 (18,860 before the `note` schema) | < 2,700 |
| Live carriers admitted under a kind schema | 8,580 (terms, bibliographies and notes) | ≥ 90% of live carriers |
| Broken path links (live) | 36,999 | ~3/5 removed by the rule fold; 0 once offices settle border and downward candidates |
| Live carriers with no link or wikilink | 14,783 (51%) | measured per kind; falling every release |
| Lawful citekey occurrences (key in the citing carrier's own map) | 1,597 of 6,687 (24%) | ≥ 95%, every survivor a wanted reference |
| Claim-kind carriers citing anything | 95 of 2,432 (3.9%) | ≥ 25%, then rising each release |
| External URLs with a capture record | 0 | 100% of public, then demand order |
| Shared identities served as first match | 404 | 0 (all 300) |
| Term-to-RDF builders | 2 | 1 |
| Corpus walkers | ~6 | 1 |
| Public concepts dereferenceable | 0 | 100% |
| Agent retrieval recall@10 (self-retrieval / hand-checked) | unmeasured | ≥ 0.90 / ≥ 0.85, regression blocks release |
| Hand-declared ontology files | 23 | 0 |
| Contested claims (cell *both*) served as contested | unmeasured (no converse ledger) | 100%; counted, never driven to zero |
| Terms, concepts and topics with all four Diátaxis surfaces | unmeasured | measured per release; rising |

## Mapping onto the substrate lots

| Lot | Here |
|---|---|
| Lot 4, vocabulary surface | Wave 3.1 |
| Lot 5, backward seam | Decision 8, the demand queue |
| Lot 6, EAVT→SEAVT lift | Wave 1.8, moved forward; reads Wave 1.1 rows |
| Lot 7, citation triple | Decision 7, Wave 2.3 |
| Lot 8, settle-corpus | Wave 4 |
| Lot 9, σ/Δ extraction | unchanged, still deliberately late |
| Lot 10, vertical slice | Wave 4 gate |

## Open questions (filed, not assumed)

1. Whether `consent-status` gains a value vocabulary. Lot 2's rule stands: grep first, coin nothing.
2. Whether `/ns/` graduates from l-space to `561.group` before external dereference signal exists. This program needs `561.group/knowledge/` to resolve, so the two are decided together in Wave 3.1.
3. ~~Whether the deep `recovered/`, `legacy/` and `obsmetrologia` trees are carriers or archives.~~
   Decided in Wave 2.10: the archive stratum is evidence, rowed and never targeted.
   A carrier leaves the archive only by being folded into a live carrier, which then cites it.
4. ~~The three-theories rule for predicates versus 94 registered predicates.~~
   Decided in Decision 4: a predicate stays registered when it recurs in three theories or is generated from one that does; the ledger's usage counts apply the rule.
5. Whether D4's priced yield can be estimated before the first settling receipts exist.
   Until it can, inbound demand stands in for yield and the item class for cost, and the deriver records that the price is provisional.
