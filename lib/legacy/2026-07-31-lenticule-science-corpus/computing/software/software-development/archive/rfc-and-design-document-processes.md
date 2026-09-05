---

title: "RFC and Design Document Processes"
date-created: 2026-03-07T00:00:00
keywords:
  - request-for-comments
  - design-documents
  - software-planning
  - technical-governance
description: "Research summary of Request for Comments (RFC) and design document processes used in open-source projects and technology companies to plan technical work."
references:
  - id: ref1
    type: document
    title: Winters, Titus, Tom Manshreck, and Hyrum Wright. Software Engineering at Google: Lessons Learned from Programming Over Time. O'Reilly Media, 2020.
  - id: ref2
    type: document
    title: Orosz, Gergely. 'Software Engineering RFC and Design Doc Examples and Templates.' The Pragmatic Engineer, 2023.
---

Requests for Comments (RFCs) and design documents are written
proposals that describe a planned technical change, solicit feedback
from stakeholders, and build consensus before implementation begins.
The practice originates with the Internet Engineering Task Force
(IETF), where Steve Crocker wrote the first RFC in April 1969 to
document the ARPANET's host software protocols. The IETF process
established the core pattern: write down the proposed change, invite
comment, iterate, and reach agreement before committing to code.

## Variants in practice

Several major organizations and open-source projects maintain RFC or
design document processes, each adapted to local needs:

**Google** uses internal "design docs" as a standard step before
building new systems or making changes to existing ones. Titus
Winters, Tom Manshreck, and Hyrum Wright describe this practice in
*Software Engineering at Google* (O'Reilly, 2020). A design doc at
Google typically covers the problem, proposed solution, alternatives
considered, and trade-offs.

**Rust** maintains an open RFC process for changes to the language,
its standard library, and its tooling. Rust's RFC 0002
(rust-lang/rfcs) defines the process: a contributor writes a proposal
using a standard template, submits it as a pull request, and the
relevant subteam shepherds it through review, a ten-day Final Comment
Period, and eventual acceptance or rejection. The process is public
and archived on GitHub.

**Python** uses Python Enhancement Proposals (PEPs), introduced by
Guido van Rossum in 2000. PEP 1 defines the process: a PEP describes
a new feature, collects community input, and documents design
decisions. PEPs are maintained as text files in a versioned repository,
so their revision history serves as a permanent record.

**Meta (Facebook)** and other large technology companies use internal
design document processes that resemble Google's, as documented by
Gergely Orosz in *The Pragmatic Engineer* newsletter (2023).

## Core planning mechanism

The RFC process separates design from implementation. A team writes
a document that describes what they intend to build and why, then
circulates it for review. The review period surfaces objections,
alternative approaches, and overlooked constraints before any code
is written. Once the RFC is accepted, it serves as a reference for
the implementing team and as a historical record for future
maintainers.

The mechanism relies on three properties: the proposal is written
(not verbal), the review is structured (with defined timelines and
decision-makers), and the outcome is recorded (accepted, rejected,
or withdrawn). These properties make the decision process auditable
and reproducible.

## Key citations

- Crocker, Steve. "RFC 1: Host Software." IETF, April 7, 1969.
- van Rossum, Guido, and Barry Warsaw. "PEP 1 -- PEP Purpose and
  Guidelines." Python.org, 2000.
- Rust Language Team. "RFC 0002: RFC Process." rust-lang/rfcs, GitHub.
- Winters, Titus, Tom Manshreck, and Hyrum Wright. *Software
  Engineering at Google: Lessons Learned from Programming Over Time.*
  O'Reilly Media, 2020.
- Orosz, Gergely. "Software Engineering RFC and Design Doc Examples
  and Templates." *The Pragmatic Engineer*, 2023.
