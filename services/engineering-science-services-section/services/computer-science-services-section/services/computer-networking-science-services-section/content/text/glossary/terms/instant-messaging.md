---
description: Instant messaging is real-time, session-based communication between two or more concurrently connected parties, exchanged as discrete messages over a persistent connection rather than relayed and queued the way electronic mail is.
identity: instant-messaging
name: Instant messaging
date-created: 2026-09-08
references:
  saintandre2011:
    authors:
      - P. Saint-Andre
    title: "Extensible Messaging and Presence Protocol (XMPP): Core"
    publication: RFC 6120
    publisher: IETF
    year: 2011
    url: https://www.rfc-editor.org/rfc/rfc6120.html
  matrixorg2026:
    authors:
      - The Matrix.org Foundation
    title: "Matrix Specification: Server-Server API"
    publisher: Matrix.org Foundation
    year: 2026
    url: https://spec.matrix.org/latest/server-server-api/
---
Instant messaging is real-time, session-based text (and, in extended protocols, voice and video) communication between two or more parties who are concurrently connected to a messaging service, exchanged as discrete messages over a persistent connection rather than relayed and queued the way electronic mail is. XMPP (RFC 6120) specifies one architecture: an XML stream between a client and its home server, carrying `<message/>`, `<presence/>`, and `<iq/>` primitives, with servers federating directly server-to-server over the same core protocol. Matrix specifies a different architecture: a room's history is a directed acyclic graph of cryptographically signed events, independently resolved by every homeserver participating in that room via a deterministic state-resolution algorithm, rather than held authoritatively by one server.

Instant messaging differs from electronic mail in delivery assumption, since a live session between concurrently connected parties is what instant-messaging protocols are built around, while electronic mail's store-and-forward relay model assumes no such concurrency. XMPP's server-to-server federation and Matrix's event-graph federation also differ from each other in failure mode: an XMPP room's state lives on whichever server is authoritative for it, while a Matrix room's state is independently re-derivable by every participating server from the signed event graph alone, which changes what a server rejoining after an outage needs to recover state. See [electronic-mail](./electronic-mail.md).

A federated instant-messaging deployment inherits a federation-partner exposure electronic mail does not have in the same form: a server operator choosing to federate is extending real-time service guarantees to every other server's users its protocol connects to, and a server that goes offline or is administratively removed drops its users from every room or conversation they were joined to, not merely delays their mail. This is the operational reason end-to-end encryption for group conversation, such as Matrix's Olm/Megolm built on the same double-ratchet design Signal specifies, is harder to retrofit onto a federated multi-server room than onto a two-party session; see [end-to-end-encryption](./end-to-end-encryption.md).
