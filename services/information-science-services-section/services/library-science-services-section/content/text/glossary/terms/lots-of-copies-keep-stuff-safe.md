---
description: "The LOCKSS principle: content held in many independently administered, actively repairing caches survives failure better than content held in one place (Reich and Rosenthal 2001)."
identity: lots-of-copies-keep-stuff-safe
name: Lots Of Copies Keep Stuff Safe
date-created: 2026-09-08
references:
  reich2001:
    authors:
      - Vicky Reich
      - David S. H. Rosenthal
    title: "LOCKSS: A Permanent Web Publishing and Access System"
    publication: D-Lib Magazine 7(6)
    year: 2001
    url: https://www.dlib.org/dlib/june01/reich/06reich.html
relations:
  requires:
    - mirror-site
---
Lots Of Copies Keep Stuff Safe (LOCKSS) is a tool designed for libraries to use to ensure their community's continued access to web-published scientific journals, built on the principle that content held in many independently administered caches survives failure, and loss, better than content held in one place (Reich and Rosenthal 2001). Under LOCKSS, content is in constant use, under constant scrutiny, and undergoing continual repair: participating caches cooperate in a peer-to-peer network to detect and repair damaged or missing pages, rather than sitting untouched until a restore is needed.

LOCKSS is distinguished from an ordinary backup by exactly this constant, cooperative repair: a backup is a static copy, held by one operator, checked only when something has already gone wrong and a restore is attempted; a single software instance, a hardware platform, an organization, or personnel with administrative control over all distributed copies threatens the integrity of all of the copies simultaneously, which is precisely the failure mode a set of ordinary backups under one operator's control does not protect against. LOCKSS instead requires several independently administered mirror copies, each routinely polled and repaired against its peers.

Because LOCKSS's guarantee depends on independent administration, not merely on copy count, a corpus with many copies under one operator's account, one hosting provider, or one canonical git remote is not yet LOCKSS-safe even if it is well mirrored: the operator, provider, or remote is itself the single point of control the LOCKSS principle exists to remove.
