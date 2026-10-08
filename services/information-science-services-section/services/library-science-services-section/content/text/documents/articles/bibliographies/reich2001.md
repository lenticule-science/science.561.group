---
type: bibliography
key: reich2001
reference-type: article
authors:
- Reich, Vicky
- Rosenthal, David S. H.
year: 2001
title: 'LOCKSS: A Permanent Web Publishing and Access System'
publication: 'D-Lib Magazine 7(6)'
url: 'https://www.dlib.org/dlib/june01/reich/06reich.html'
description: Read at the D-Lib Magazine URL above, 2026-09-08; corroborated against LOCKSS's current "Preservation Principles" page (https://www.lockss.org/about/preservation-principles, read the same day).
---

# Reich & Rosenthal 2001 — LOCKSS

Read at the D-Lib Magazine URL above, 2026-09-08; corroborated against
LOCKSS's current "Preservation Principles" page
(https://www.lockss.org/about/preservation-principles, read the same day).

## Why this is central

States the LOCKSS name and mechanism plainly: "LOCKSS (Lots Of Copies Keep
Stuff Safe) is a tool designed for libraries to use to ensure their
community's continued access to web-published scientific journals."
[lots-of-copies-keep-stuff-safe](../../../glossary/terms/lots-of-copies-keep-stuff-safe.md)
carries this definition and the distinction the paper and the current site
both press: content held under LOCKSS "is in constant use, under constant
scrutiny, and undergoing continual repair" through caches that "cooperate
in a peer-to-peer network to detect and repair damaged or missing pages."
The current site sharpens the anti-backup argument: "a single software
instance, a hardware platform, an organization, or personnel with
administrative control over all distributed copies threatens the integrity
of all of the copies simultaneously" — the reason LOCKSS insists on many
independently administered copies rather than one operator's backup,
however many snapshots that operator keeps.

## What it does not settle

The 2001 paper is scoped to web-published journals under a fixed set of
participating libraries with a shared trust model (each library's cache
polls its peers and repairs from a quorum); it does not address a corpus
with anonymous public contribution, nor a corpus whose canonical copy is a
single operator's git repository — the situation amusewiki/TAL's own git
backend sits in, and a genuine open question for how a house library's
mirrors would establish LOCKSS's peer-quorum trust model rather than
simple git clones with one canonical origin.

## Bridges

- To [lots-of-copies-keep-stuff-safe](../../../glossary/terms/lots-of-copies-keep-stuff-safe.md).
- To [mirror-site](../../../glossary/terms/mirror-site.md) — a mirror is a
  precondition for LOCKSS-style repair but is not itself the repair
  protocol; see that term's distinction.
