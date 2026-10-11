---
title: "Note on Measuring Protocols, Law, and Chains with the Literature Record"
description: "How the house research procedure (literature-measurement records, registers, record-check) was adapted on 2026-10-08 to measure smart-contract protocols, statutes and court opinions, and live chain state, with the registers, schema values, CSL item types and pitfalls that make it work"
date-created: 2026-10-08
keywords:
  - research-method
  - literature-measurement
  - registers
  - smart-contracts
  - law
  - on-chain-measurement
authors:
  - claude-sonnet-5-5
type: text
---

The house research procedure measures a question before it writes about it. A source record in the owning section's `data/records/` carries every source as it was read (a CSL-JSON item under a house citekey plus what was read from it) and every search as it was run; a note cites rows by their house citation label and its `references:` is derived from the record. The procedure was built for medicine, where Europe PMC and ClinicalTrials.gov are the registers. On 2026-10-08 it was adapted for a field whose evidence is source code, deployed contracts, statutes, court opinions, regulator guidance, dashboards and academic economics. This note records what was added and how to use it. The procedure itself is in `science-services-section/lib/agency/skills/research.md`; the schema is `science-services-section/schemas/literature-measurement.schema.json`.

## What a record asserts, and why it still applies

A record asserts three things: that each row was read from the surface it names (`readFrom`), that each search was run (`searches[]`, with `count` and `included`), and that a statement of absence ("not found") rests on a search row whose `included` is empty and whose `reading` says so. None of that depends on the evidence being a journal article. A contract's source file at a named commit is a row read from `source-code`; a view call on a deployed contract at a named block is a row read from `on-chain-read`; a statute section is a row read from `legal-text`. What changes is the register and the vocabulary.

## Registers added

A register is a pair `{ query, item }` in `science-services-section/data/registers/`: a JSON API query and the CSL projection of its results, run by `bibliography record-search`. Four were added.

- `openalex.json`: `https://api.openalex.org/works`, variables `search`, `filter`, `per_page`, `sort`, `mailto`. Results at `/results`, count at `/meta/count`. Authors project from `authorships[].author.display_name` as literal names; the id is the DOI.
- `crossref.json`: `https://api.crossref.org/works`, variables `query`, `query.bibliographic`, `query.author`, `filter`, `rows`, `sort`, `order`, `select`, `mailto`. Results at `/message/items`, count at `/message/total-results`. The issued year projects from `issued.date-parts[]`; the abstract is carried when Crossref has one.
- `github-repositories.json`: `https://api.github.com/search/repositories`, variable `q` (for example `org:BreadchainCoop`). Each repository projects as a CSL `software` item whose author is the owner and whose issued date is the last push. GitHub's REST budget is shared across every session on one token; a search spends from it, and clones and `raw.githubusercontent.com` reads do not.
- The two medical registers are unchanged.

RFC 6570 variable names cannot contain a hyphen, so the OpenAlex page-size variable is `per_page`, not `per-page`. OpenAlex ranks by text relevance; a bare phrase can return thousands of loose hits, so the record's `reading` states which hits qualified and why. A search that returned nothing on the subject is recorded with `included: []`; that row is what a statement such as "no peer-reviewed evaluation of Breadchain exists" rests on.

Non-register reads are recorded with `register` set to a free string: `web`, `github-api`, `gnosis-rpc`, `gnosis-blockscout`, `defillama-api`, `stellar-expert-api`, `first-party-repositories`. The schema allows any string there. The convention in the records is the name of the surface actually queried.

## Schema values added

The schema's `design` enum was clinical. These values were added; the existing ones are kept, so the pharmacology record still passes: `protocol-source-code`, `protocol-documentation`, `on-chain-measurement`, `dashboard-measurement`, `governance-record`, `audit-report`, `statute`, `regulatory-guidance`, `court-decision`, `theoretical`, `historical-case-study`, `field-experiment`, `simulation`, `empirical-study`, `book`, `primary-text`.

The `readFrom` enum gained `source-code`, `on-chain-read`, `api-read`, `first-party-docs`, `legal-text`, `forum-post`. `secondary-summary` remains uncitable: a note may not rest a figure on it.

## CSL item types for non-bibliographic sources

The row's `item` is CSL-JSON with `id`, `type`, `title`, `author`, `issued`. Hand-written rows use these types.

| Source | CSL `type` | Author field | `design` | `readFrom` |
|---|---|---|---|---|
| a repository at a commit | `software` | the organisation as a literal name | `protocol-source-code` | `source-code` |
| a protocol's documentation site | `webpage` | the protocol's docs as a literal name | `protocol-documentation` | `first-party-docs` |
| view calls on deployed contracts at a block | `dataset` | a descriptive literal such as "Bread Gnosis Chain State" | `on-chain-measurement` | `on-chain-read` |
| an event log | `dataset` | descriptive literal | `on-chain-measurement` | `on-chain-read` |
| a dashboard or API record | `dataset` | the dashboard as a literal | `dashboard-measurement` | `api-read` |
| a statute or bill | `legislation` | the enacting body | `statute` | `legal-text` |
| a court opinion | `legal_case` | the court | `court-decision` | `legal-text` |
| agency guidance, a rule, a no-action letter | `report` or `legislation` | the agency | `regulatory-guidance` | `legal-text` |
| a forum thread or governance post | `post-weblog` or `webpage` | the poster | `governance-record` | `forum-post` |
| an audit report | `report` | the auditor | `audit-report` | `first-party-docs` |

The row's `findings` carry addresses, numbers, dates, and quoted source lines. Quote the exact line in `exactSourceLanguage` whenever a claim rests on a particular line of code or statute.

## Citation labels and the checks

`formatCitationLabel` produces "Family 2019", "A & B 2019", "A et al. 2019", or, for a single literal author, the literal followed by the year. A note must cite each row it relies on by that label. Use a distinct literal author per row (for example "Breadchain Token Source" and "Breadchain Fund Source") so that two rows from one organisation in one year do not share a label. `record-check` then blocks on schema violations, on a prose author-year citation with no row (the "&" and "et al." forms are errors), on a cited row whose `readFrom` is `secondary-summary`, and on `references:` that differ from the record. It warns on rows no note cites and cited rows with no findings.

Pitfalls found in use:

- Any capitalised word directly before a year is read as a citation: "On 2026", "By 2026", "October 2026" each produce a warning. Write dates in ISO form (2026-10-08) or "as of 2026-10-08".
- Never write "X & Y 2024" in prose unless it is the label of a row.
- The derived `references:` block must be regenerated after every edit that adds or removes a citation: `bibliography record-references <record> --write`.
- A record's `notes` paths are relative to the record file, and its `$schema` path is relative too. Compute both with `realpath --relative-to`.
- The note's own date patterns inside table cells are scanned too.

## Reading each kind of source

- **Source code.** Shallow-clone into the scratchpad, read the contract, record the commit date and the file. Where the contract is deployed and verified, compare the deployed source to the repository (Blockscout and Sourcify both return verified sources); a mismatch is itself a finding. Delete the clone when done.
- **Deployed state.** Use `cast call` against a public RPC, record the block number and timestamp, and give the function signature in the finding. Proxy implementation and admin sit at the EIP-1967 slots; an owner address with no code is an externally owned account, and one with a Safe's `getThreshold()` and `getOwners()` is a multisig. Public RPCs are rate-limited and sometimes fail TLS from `cast`; a small Python JSON-RPC helper works as a fallback.
- **Numbers.** DeFiLlama (`api.llama.fi/protocol/<slug>`, `yields.llama.fi/pools`) gives dated TVL and APY; event logs from Blockscout (`/api?module=logs&action=getLogs`) give flows that the dashboard does not. Report the figure with its date and where it came from; a ratio of two sources is a derived figure and is labelled so.
- **Law.** Read the statute from the Government Publishing Office, congress.gov, a state's official code or its public-law mirror; quote the operative sentence with the section number. A press report of a verdict is a lead until the court's own document is read.
- **Academic economics.** Search OpenAlex and Crossref, read the abstract or full text, and fill `n`, `design`, `country` and `exposures` as the source states them. A source known only through a review is cited as the review's finding.

## What the method does not do

It does not grade evidence and it does not hedge. It states what the source establishes and states where something was looked for and not found, with the search row that backs the statement. It does not treat a dashboard as a first-party surface for a protocol's mechanism: the mechanism is read from the contract. It does not substitute for engineering: a note names a primitive and a number; whether the house builds on the primitive is decided downstream.

## Where the first records using this method are

The records of 2026-10-08 under `science-services-section/services/social-science-services-section/services/economics-and-business-science-services-section/` are the worked examples: the Breadchain teardown, the Base and Gnosis primitive surveys, the yield-donation, public-goods, treasury and conviction-voting protocol surveys, the mutual-credit and streaming surveys, the law records, and the theory records. The synthesis note `2026-10-08-note-on-the-external-field-for-tidepool.md` in the finance section ties them together.
