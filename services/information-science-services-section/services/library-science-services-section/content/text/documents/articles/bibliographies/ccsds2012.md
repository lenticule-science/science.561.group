---
type: bibliography
key: ccsds2012
reference-type: report
authors:
- Consultative Committee for Space Data Systems
year: 2012
title: 'Reference Model for an Open Archival Information System (OAIS)'
publisher: 'CCSDS 650.0-M-2 (Magenta Book); also published as ISO 14721:2012'
url: 'https://ccsds.org/Pubs/650x0m2.pdf'
---

# CCSDS 2012 — OAIS Reference Model

Read at the CCSDS URL above via a text-extraction pass, 2026-09-08 (the PDF
did not decode directly; wording should get one further human check
against the primary PDF before a pull-quote is treated as final). A third
edition (CCSDS 650.0-M-3 / ISO 14721:2025) supersedes this one; the 2012
edition is what is cited here and is still the edition most secondary
literature references.

## Why this is central

Names the archive-as-obligation and the three information packages
[digital-preservation](../../../glossary/terms/digital-preservation.md)
carries:

- **OAIS**: "An Archive, consisting of an organization, which may be part
  of a larger organization, of people and systems, that has accepted the
  responsibility to preserve information and make it available for a
  Designated Community."
- **SIP** (Submission Information Package): "An Information Package that is
  delivered by the Producer to the OAIS for use in the construction or
  update of one or more AIPs and/or the associated Descriptive
  Information."
- **AIP** (Archival Information Package): "An Information Package,
  consisting of the Content Information and the associated Preservation
  Description Information (PDI), which is preserved within an OAIS."
- **DIP** (Dissemination Information Package): "An Information Package,
  derived from one or more AIPs, and sent by Archives to the Consumer in
  response to a request to the OAIS."

## What it does not settle

OAIS is a reference model, not an implementation profile: it does not
specify a file format, a checksum scheme, or a replication count. It
answers "what must an archive be responsible for and what packages does it
move," not "how many independent copies" (that is LOCKSS's question) or
"how does a reader discover a package" (OPDS's question).

## Bridges

- To [digital-preservation](../../../glossary/terms/digital-preservation.md).
- To [lots-of-copies-keep-stuff-safe](../../../glossary/terms/lots-of-copies-keep-stuff-safe.md)
  — LOCKSS is one mechanism a Designated Community's Archive could use to
  discharge OAIS's preservation responsibility; OAIS does not itself
  require LOCKSS's specific peer-repair mechanism.
