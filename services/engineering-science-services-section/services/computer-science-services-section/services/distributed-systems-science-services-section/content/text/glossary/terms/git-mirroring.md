---
description: Replicating a git repository's full content-addressed commit history to an independent host, inheriting git's own hash-chained tamper-evidence without a separately bolted-on integrity mechanism, extendable to a citable cross-forge identifier via the Software Heritage SWHID.
identity: git-mirroring
name: Git Mirroring
provenance:
  date-created: 2026-09-08
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/science-services-section/services/engineering-science-services-section/services/computer-science-services-section/services/distributed-systems-science-services-section/content/text/documents/articles/notes/2026/09/08/2026-09-08-note-on-the-study-of-distributed-and-content-addressed-storage-for-censorship-resistance.md
references:
  dicosmo2020:
    authors:
      - Roberto Di Cosmo
      - Morane Gruenpeter
      - Stefano Zacchiroli
    title: "Referencing Source Code Artifacts: a Separate Concern in Software Citation"
    publication: Computing in Science & Engineering
    year: 2020
    url: https://arxiv.org/abs/2004.00514
---
Git mirroring is replicating a git repository's full history — every commit, tree, and blob, each named by the hash of its own bytes plus the hashes of what it references — to an independent host, so two independent mirrors of the same history are byte-identical and self-verifying. This differs from a generic file backup, which copies bytes without any built-in mechanism for a consumer to verify that what was copied matches what was originally committed; git's own [content addressing](./content-addressing.md) makes that verification automatic rather than requiring a separately bolted-on checksum scheme, per the tree's own prior study of git as a provenance structure.

Roberto Di Cosmo, Morane Gruenpeter, and Stefano Zacchiroli's ["Referencing Source Code Artifacts: a Separate Concern in Software Citation"](https://arxiv.org/abs/2004.00514) (Computing in Science & Engineering, 2020) describes the Software Heritage Identifier (SWHID) built on exactly this property: an intrinsic identifier derived from an archived object's own content hash, issued for every file, directory, revision, release, and snapshot the Software Heritage archive has crawled from source-code forges. The SWHID format reached ISO/IEC international standard status as ISO/IEC 18670 in 2025.

The consequence is that a plain `git clone --mirror` to an independent host already gives a corpus kept in git the tamper-evidence property censorship resistance needs — a mirror cannot be silently altered without changing its root commit hash, so any two mirrors can be compared directly rather than trusted on say-so — and the SWHID adds a citable, resolvable identifier for an archived artifact independent of whether the original forge or repository still exists, since Software Heritage's own archive mirrors what it crawls to its own independently operated storage rather than merely indexing a live copy elsewhere.
