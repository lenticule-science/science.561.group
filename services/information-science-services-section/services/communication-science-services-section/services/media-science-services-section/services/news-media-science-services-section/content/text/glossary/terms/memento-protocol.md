---
name: "Memento Protocol"
description: "The Memento protocol, specified in RFC 7089 (Van de Sompel, Nelson & Sanderson, IETF Informational, December 2013), defines HTTP datetime negotiation and TimeMaps for retrieving a prior state (a Memento) of a resource as it existed at a given time, supplying the version-access piece a correction-propagation substrate needs that push and archive protocols do not provide on their own."
aliases:
  - "Memento"
  - "Memento protocol"
  - "RFC 7089"
date-created: 2026-08-22
instance-of: ietf-standard
---

The Memento protocol is specified in RFC 7089, "HTTP Framework for Time-Based Access to Resource States — Memento," by H. Van de Sompel, M. Nelson, and R. Sanderson, published December 2013 as an IETF Informational document (not Standards Track): [rfc-editor.org/rfc/rfc7089](https://www.rfc-editor.org/rfc/rfc7089.html).

Memento defines two mechanisms. Datetime negotiation extends HTTP content negotiation so a client can request a representation as it existed at a preferred datetime rather than a preferred media type. A TimeMap is a list enumerating the URIs of a resource's prior states — its Mementos — across time, letting a client discover and retrieve exactly the state that held at a given moment.

For correction propagation, Memento supplies the piece [WebSub](./websub.md) push and [archived-feed](./link-rot.md) replay do not: a standard way to ask what a claim's state looked like at time T, independent of what the current live representation shows, which is exactly what auditing a correction history requires.

See [Study of Syndication and Propagation Protocols](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-syndication-and-propagation-protocols.md), section 5.
