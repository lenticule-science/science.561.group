---
identity: capability-assertion
name: Capability assertion
description: An immutable journal record that a holder has been granted, attenuated, delegated, presented or denied authority over one designated move; standing over such records is four-valued.
date-created: 2026-10-09
provenance:
  authors:
    - bare-cedar-fog-claude (senior-scientist)
    - claude-sonnet-5-5
  sources:
    - lib/emsenn/services/561-group/services/science-services-section/services/engineering-science-services-section/services/computer-science-services-section/content/text/documents/articles/notes/2026/10/09/2026-10-09-note-on-capabilities-and-federation-between-metroplat-nodes.md
---

A capability assertion is a record of kind `capability.assertion` with an assertion kind (`grant`, `attenuate`, `delegate`, `revoke`, `present`), an issuer, a holder, a grant string `resource#action`, a time, and, for attenuation and delegation, a parent and the accountable party and allocation. It is admitted as a content-addressed witness in the journal feed `capability-assertions`.

A holder's standing for a grant is read from the assertions that concern it: granted if a grant, attenuation, delegation or presentation covers the grant, revoked if a revocation does. The standing is held when granted and not revoked, refused when revoked and not granted, contested when both, and unevidenced when neither. Unevidenced asks for more evidence, refused refuses, contested requires repair. The read is uncached and a malformed or unavailable feed yields no assertions, so authority fails closed.

An attenuation is admitted only when its grant lies within its parent's. A peer node or a peer actor is a holder, and its authority on a node is the standing the node's feed gives it.

See [object capabilities](object-capabilities.md) and [work peer](work-peer.md).
