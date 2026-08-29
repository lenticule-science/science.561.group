---
title: Living Web Frontier and Engineering Program
date-created: 2026-08-26
tags:
- living-web
- web-standards
- research-program
- tufte
- victor
- conformance
- benchmarking
---

# Living Web Frontier and Engineering Program

## Finding

The Living Web is a useful 561 Group research object, not the name of a W3C
working group. Its object is distributed across institutions and timescales:
WHATWG maintains continuously revised Living Standards; W3C publishes
Recommendations and hosts working, interest, and community groups; IETF
publishes protocol RFCs; browser engines determine interoperable implementation;
and independent communities operate publishing and social protocols in the
field. No single source states the condition of the web.

The section therefore studies a moving relation among four things:

1. **specified** — what a normative document currently requires;
2. **implemented** — what interoperates across current user agents and servers;
3. **deployed** — what real publishers, readers, crawlers, and federated systems
   actually exchange;
4. **experienced** — whether people can perceive, navigate, trust, preserve, and
   respond to the resulting information.

A feature is not at the public frontier merely because it is specified. A
feature becomes an engineering target only when its maturity, implementation,
use, and cost are evidenced separately.

## Confirmed public frontier on 2026-08-26

- WHATWG explicitly defines its work as interoperable Living Standards and
  maintains HTML as one of them. HTML conformance is therefore a moving target,
  not a version badge. Sources: [WHATWG principles](https://whatwg.org/principles),
  [HTML Living Standard](https://html.spec.whatwg.org/).
- Cross-browser availability is now described by the WebDX `web-features`
  catalog and Baseline statuses. Baseline distinguishes newly available from
  widely available; it is evidence about implementation reach, not a substitute
  for the specifications. Sources: [Baseline](https://web-platform-dx.github.io/web-features/web-features/),
  [web-features project](https://web-platform-dx.github.io/web-features-project/).
- WCAG 2.2 remains the W3C-recommended accessibility baseline. ARIA in HTML is a
  W3C Recommendation dated 2026-04-15, and its native-semantics-first discipline
  constrains TUFTE and VICTOR directly. Sources: [WCAG 2.2](https://www.w3.org/TR/WCAG22/),
  [ARIA in HTML](https://www.w3.org/TR/html-aria/),
  [Using ARIA](https://www.w3.org/TR/using-aria/).
- The social web is a family rather than a single stack. ActivityPub supplies
  client-to-server and server-to-server federation; Micropub supplies publishing;
  Webmention supplies link notification; WebSub supplies subscription and
  delivery. The proposed 2025 Social Web Working Group charter treats maintenance
  of these specifications as renewed work, which is evidence that their future
  movement must be tracked rather than presumed. Sources:
  [Social Web Protocols](https://www.w3.org/TR/social-web-protocols/),
  [proposed Social Web Working Group charter](https://www.w3.org/2025/11/proposed-socialwg-charter.html).
- Web sustainability has entered the standards-adjacent frontier through the
  W3C Sustainable Web Interest Group and Web Sustainability Guidelines. It joins
  accessibility, internationalization, privacy, security, resilience, and
  resource cost as a condition of a web artifact's long life. Source:
  [Web Sustainability Guidelines](https://www.w3.org/TR/web-sustainability-guidelines/).

## Research instruments

The section should grow four maintained instruments rather than accumulate an
undifferentiated survey.

### 1. Standards ledger

One dated record per tracked specification or registry: canonical URL, issuing
body, maturity, retrieved revision, normative surface, known implementation
evidence, engineering consumers, and change since the previous observation.
An undated statement such as “current standard” is inadmissible. The incorrect
2026-08-11 date previously copied for ARIA in HTML demonstrates the need.

### 2. Interoperability observatory

Track Baseline status, browser-engine support, Web Platform Tests where
applicable, protocol test suites, and small cross-implementation probes. The
observatory distinguishes specification conformance from interoperability and
records absent evidence rather than converting it to failure.

### 3. Publishing-system assay

Continuously compare VICTOR with the real systems whose work it claims to meet
or beat: at minimum a mature static generator, a JavaScript content framework, a
large CMS, a digital-garden publisher, and a federated publisher. Use the same
content fixture and score observable results: build and incremental time,
artifact bytes, dependency and client-JavaScript weight, valid HTML, accessible
page anatomy, link and redirect integrity, structured-data coherence, feeds,
search and discovery, revision/correction handling, static/live parity,
deployment complexity, and recovery from malformed input.

TUFTE receives a parallel interface assay against a component framework, a
server-driven HTML system, a Web Components system, and a dashboard/grid system.
Its fixture measures semantic and visual order, keyboard and screen-reader
behavior, no-CSS/no-JavaScript survival, patch correctness, focus preservation,
interaction latency, bytes, authoring effort, print, and failure legibility.

“Beat” means a published result on a named axis. It never means globally better.

### 4. Field protocol probes

Operate small public fixtures that send and receive Webmention, publish feeds,
negotiate RDF and HTML, expose ActivityPub documents, and are crawled from their
declared discovery surfaces. Preserve requests, responses, versions, and dates.
The purpose is to learn what deployed peers accept, not merely what the specs
permit.

## House theory as hypotheses

The house mathematics and philosophy give the program distinctive hypotheses,
not exemptions from comparison.

- **One catalog, many projections** is a sheaf-style coherence hypothesis:
  locally useful HTML, RDF, feeds, indexes, and tile views should glue to one
  catalog without contradictory claims. VICTOR must test that agreement rather
  than invoke sheaves decoratively.
- **Belnap information order** predicts a better report than pass/fail: evidence
  for conformance, evidence against it, both, or neither remain distinguishable.
  “Not tested” must not collapse into “failed,” and conflicting validators must
  remain visible.
- **Jiangshi diagnosis** predicts that rigid global ontology will age worse than
  soft, local, revisable typing. Schema mappings should be versioned and
  reversible, with disagreement recorded rather than forced into one worldview.
- **Orientation before interpretation** predicts that readers understand and
  navigate relation-rich pages faster when identity, location, neighborhood,
  and possible next moves are present before explanatory prose. This is a user
  study question as well as a template rule.
- **Tuftean integrity** predicts that confidence, lifecycle, correction, and
  provenance signals improve judgment only when their salience is proportional
  to evidence. TUFTE's vocabulary requires perceptual and accessibility tests,
  not only DOM snapshots.
- **Content addressing plus stable names** predicts reproducible revisions
  without sacrificing humane URLs. VICTOR must test rename, correction,
  archival, and link-rot behavior against existing publishers.

Each hypothesis needs a possible falsifier and a named fallback. A house concept
that cannot change an assay, explain a result, or be contradicted does not yet
belong in the product architecture.

## Science-to-engineering contract

Living Web Science owns observations, sources, maturity judgments, comparison
fixtures, assay results, and dated recommendations. TUFTE and VICTOR own their
APIs, closed vocabularies, compatibility promises, and releases.

The handoff unit is an evidence packet:

- observed capability or failure;
- source or reproducible fixture;
- date and relevant version;
- affected user or operator;
- proposed acceptance test;
- maturity and uncertainty;
- smallest reversible engineering response.

This keeps science capable of revising its account while preventing engineering
from chasing every draft feature.

## First program increment

1. Establish the standards ledger with HTML, ARIA in HTML, WCAG 2.2, Baseline,
   Webmention, Micropub, WebSub, ActivityPub, feeds, sitemaps, and well-known
   URIs.
2. Build one shared adversarial content fixture and expected semantic model.
3. Run the fixture through VICTOR and two established publishers; publish the
   first axis-by-axis assay.
4. Render the fixture's atlas and neighborhood through TUFTE and compare its
   accessibility, resilience, patching, and weight with two interface systems.
5. Convert demonstrated gaps into evidence packets. The already documented
   TUFTE needs—native semantics, default vocabulary styles, non-color `side`,
   and disclosure—are suitable first candidates, followed by VICTOR's tile and
   discovery projections.

VICTOR's expansion should remain revisable while this work clarifies its true
center. Naming it after mechanisms before the assays identify its durable
comparative advantage would be premature closure.
