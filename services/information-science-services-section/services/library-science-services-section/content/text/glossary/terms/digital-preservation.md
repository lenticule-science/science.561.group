---
description: The accepted, ongoing organizational responsibility to keep information available to a Designated Community, per the OAIS reference model (ISO 14721:2012).
identity: digital-preservation
name: Digital Preservation
date-created: 2026-09-08
references:
  ccsds2012:
    authors:
      - Consultative Committee for Space Data Systems
    title: Reference Model for an Open Archival Information System (OAIS)
    publisher: CCSDS 650.0-M-2; also ISO 14721:2012
    year: 2012
    url: https://ccsds.org/Pubs/650x0m2.pdf
relations:
  requires:
    - bibliographic-metadata
---
Digital preservation, per the Open Archival Information System (OAIS) reference model, is the responsibility an archive accepts: an OAIS is 'an Archive, consisting of an organization, which may be part of a larger organization, of people and systems, that has accepted the responsibility to preserve information and make it available for a Designated Community' (CCSDS 2012). OAIS names the packages that move through that responsibility: a Submission Information Package (SIP) is delivered by a producer for use in building or updating the archive's holdings; an Archival Information Package (AIP) is what the archive actually preserves, pairing the content itself with Preservation Description Information; and a Dissemination Information Package (DIP) is derived from one or more AIPs and sent to a consumer in response to a request.

Digital preservation is distinguished from mere storage by this accepted, ongoing responsibility to a named community: a file sitting on a disk with no organization accountable for its continued readability, format migration, or availability is stored, but it is not preserved in the OAIS sense, because no Designated Community has been named and no archive has accepted responsibility for serving it.

Because OAIS states a responsibility and a package model rather than a mechanism, an archive can discharge that responsibility through different concrete strategies — LOCKSS's many-copy peer repair is one such strategy, a single well-run institutional repository with format-migration staff is another — and stating that a corpus is preserved requires naming which mechanism actually discharges the OAIS responsibility, not merely that a copy exists somewhere.
