---
title: Note on the book "ActivityPub++ and the Semioverse"
date-created: 2026-09-27
type: note
authors: [claude-opus-5-5]
keywords:
  - living-web
  - activitypub
  - activitypub-plus-plus
  - semioverse
  - a2a
  - cloudevents
  - x402
  - book
description: "The plan for the Group's second public book, on ActivityPub++ and the Semioverse as a Living Web: its reader, its claim, a chapter plan in which each chapter names the corpus notes and specification clauses it is written from, and the research the manuscript still needs."
---

# Note on the book "ActivityPub++ and the Semioverse"

Paths below are relative to `lib/emsenn/services/561-group/services/`.

This note is the hand-off from research to writing for the Group's second
public book. The book is the second carrier of the method in the engineering
note on the book and specification publishing systems
(`engineering-services-section/content/text/documents/articles/notes/2026/09/27/2026-09-27-note-on-the-book-and-specification-publishing-systems.md`).
The first carrier was *The x402 Economy*.

The book follows its specification, and the specification now exists. It is
`engineering-services-section/services/computer-engineering-services-section/services/computer-networking-engineering-services-section/services/activitypub-services-section/content/text/documents/articles/specifications/2026-09-27-specification-of-activitypub-plus-plus.md`,
with its record and Internet-Draft beside it. Every technical claim the book
makes about the protocol is a clause there first.

## Where the book lives

The manuscript goes in this section, at
`content/books/activitypub-plus-plus-and-the-semioverse/`. The founder names
the subject "a Living Web Semioverse", and this section owns the Living Web.
The section's founding position is that conformance to living standards is a
continuous process, not a badge. That position is also the book's position on
ActivityPub++.

## The reader

Two groups:

- **people who use or run Fediverse software** and have heard that AI agents
  and payments are coming to it;
- **developers deciding what an agent-capable, federated service should
  speak.**

The book assumes it has been preceded by *The x402 Economy* and refers to it
for payments rather than repeating it. It assumes no knowledge of the house
mathematics, and uses none of it as argument.

**Semioverse is the network, not the mathematics.** The glossary term warns
that "Semioverse" is not the *agential semioverse* or *emsemioverse*
hierarchy. The book never uses the network's name for the mathematics, or the
reverse.

## The claim

The Fediverse solved cross-server social delivery. The 2026-08-20 research
memo on what the Fediverse does better and worse than adjacent systems lists
what it did not solve:

- identity portability;
- discovery;
- moderation legitimacy;
- media economics;
- privacy;
- "capital and labor": who pays for hosting, moderation and the rest.

ActivityPub++ addresses two of these with existing open standards, without a
new platform:

- **agents hiring agents**, by carrying an A2A message inside an ActivityPub
  activity;
- **paying for work**, by carrying an x402 exchange inside that message.

Content addressing supplies what the Fediverse never had: a way to know that
the thing referred to is the thing received. The book's argument is that a
network of such nodes is a Living Web in the Living Web program's sense. Each
node's conformance is checked continuously. Each claim about the network
separates specified, implemented, deployed and experienced.

The book must also say plainly what is true on 2026-09-27: **no node runs the
profile as one server.** The specification's Implementation Status says so.

## Chapter plan

Each chapter names what it is written from. Where it says "spec", it means
the ActivityPub++ specification's clauses.

| # | chapter | written from |
|---|---|---|
| 1 | The Living Web | this section's 2026-08-26 initiative note and frontier program: living standards, the four states, evidence over badges |
| 2 | What the Fediverse solved, and what it left | the 2026-08-20 research memos in `science-services-section/content/text/documents/articles/notes/2026/08/20/`: the ActivityPub-conformant web as protocol and ecology, what the Fediverse does better and worse, Fediverse topology |
| 3 | Four protocols, one carrier | `engineering-services-section/content/text/glossary/terms/semioverse.md`; spec topics One Public Face, The Activity, The Envelope, The Agent Message |
| 4 | Naming things by their bytes | spec clauses `object-document`, `data-uri-digest`, `ce-id`, `a2a-part-ni`; RFC 6920; the semiotic content address specification (`engineering-services-section/services/computer-engineering-services-section/services/computer-data-engineering-services-section/services/computer-content-engineering-services-section/content/text/documents/articles/specifications/2026-09-23-specification-of-the-semiotic-content-address.md`) |
| 5 | Agents on the Fediverse | spec The Agent Message; the 2026-06-25 WMAP note and codecs-on-faces note (`science-services-section/services/engineering-science-services-section/services/computer-science-services-section/content/text/documents/articles/notes/2026/06/25/`): ActivityPub's client-to-server and server-to-server split as the line between one agent and a federation of agents |
| 6 | Paying across the network | spec Authority and Payment; *The x402 Economy* chapters 2, 6 and 9; the A2A x402 extension |
| 7 | Authority without accounts | the 2026-06-25 notes on UCAN as capability and CapTP as playing; the object-capability and UCAN networking sections; spec `no-sibling-labels`, `payment-not-authority` |
| 8 | The node | the 2026-09-23 note on the software ecosystem (MOOSE, FeltOS, MARSH, MetroPlat); the `moose.md` and `marsh.md` terms; the one-server-per-machine rule; the spec's Implementation Status |
| 9 | Safety, privacy and consent | the 2026-08-20 research-ethics memo on Fediverse safety, privacy and future agents; spec Security Considerations |
| 10 | Governing a semioverse | the Fediverse moderation and defederation governance note (`science-services-section/services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/governance.md`); the Living Web program's evidence packets |
| 11 | What is open | the spec's Open Issues, each stated as a condition with something observable to watch, as *The x402 Economy* ends |
| A | The specification | the specification's rendered Markdown, reprinted |

## What the manuscript still needs

These are research gaps, to fill before writing the chapters that depend on
them:

- **A2A 1.0.** The specification cites A2A 1.0 (April 2026, Linux Foundation;
  signed Agent Cards). The corpus's A2A term predates 1.0. A dated source
  record of the 1.0 changes is needed for chapter 5.
- **The social web's standards process.** The Living Web program cites the
  proposed 2025 Social Web Working Group charter. Chapter 11 needs its status
  on 2026-09-27, and the Fediverse Enhancement Proposal process, which the
  corpus does not cover.
- **Deployed signature schemes.** The specification's last open issue asks
  which inbound signatures a node must accept. Chapter 9 needs the answer from
  a field probe of deployed peers (the Living Web "field protocol probes"),
  not from the specifications alone.
- **Adoption of CloudEvents outside cloud tooling.** Chapter 3 claims the
  envelope choice interoperates. It needs evidence of who else carries
  CloudEvents across organizational boundaries.

## Publishing the specification

The specification follows the same method as the book. Its phases are:

- **Rendered**: the specification section's `renderSpecificationRfcXml` wrote
  `draft-emsenn-activitypub-plus-plus-00.xml` on 2026-09-27.
- **Submitted**: not yet. Posting an Internet-Draft is public and permanent,
  names its authors, and needs a Datatracker account. It is the founder's act.
  The independent stream fits a document that no IETF working group has
  adopted.
- **Adopted**: for a Fediverse profile, the nearer venues are a Fediverse
  Enhancement Proposal and the W3C Social Web community. Which venue
  "the standards are the product" is aimed at is not settled in the corpus.
