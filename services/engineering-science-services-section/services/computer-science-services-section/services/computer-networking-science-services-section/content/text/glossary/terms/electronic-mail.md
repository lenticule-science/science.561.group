---
description: Electronic mail is a store-and-forward messaging service in which a message, consisting of an envelope and content, moves from a sender's mail submission agent through zero or more relaying mail transfer agents to a recipient's mail delivery agent.
identity: electronic-mail
name: Electronic mail
date-created: 2026-09-08
references:
  klensin2008:
    authors:
      - John C. Klensin
    title: Simple Mail Transfer Protocol
    publication: RFC 5321
    publisher: IETF
    year: 2008
    url: https://www.rfc-editor.org/rfc/rfc5321.html
  resnickpartredge2008:
    authors:
      - Pete Resnick (ed.)
    title: Internet Message Format
    publication: RFC 5322
    publisher: IETF
    year: 2008
    url: https://www.rfc-editor.org/rfc/rfc5322.html
  crocker2009:
    authors:
      - Dave Crocker
    title: Internet Mail Architecture
    publication: RFC 5598
    publisher: IETF
    year: 2009
    url: https://www.rfc-editor.org/rfc/rfc5598.html
---
Electronic mail is a store-and-forward messaging service in which a message, consisting of an envelope and content, moves from a sender's mail submission agent through zero or more relaying mail transfer agents to a recipient's mail delivery agent. The envelope and transfer behavior are specified by the Simple Mail Transfer Protocol (RFC 5321); the message's own header and body syntax are specified separately by the Internet Message Format (RFC 5322); and the roles these specifications assume are named by [Crocker's reference architecture](../../documents/articles/bibliographies/crocker2009.md) (RFC 5598), most consequentially the Administrative Management Domain (ADMD) — the organization that operates one or more mail services under a single administrative authority.

Electronic mail differs from instant messaging in its delivery model: SMTP transfer is store-and-forward, so a message can sit queued at a relay and still arrive correctly hours later, while a live session is what instant messaging assumes instead. It differs from a mailing list in composition rather than transport, since a [mailing list](./mailing-list.md) is a redistribution service built on top of ordinary SMTP delivery rather than a distinct transport protocol; see also [instant messaging](./instant-messaging.md).

The ADMD boundary is where an operator's obligations attach: an ADMD that hosts mail for its members is the entity a receiving system holds accountable for message deliverability, and the entity a receiving system's abuse-handling process contacts when a member account sends unwanted mail. Losing administrative control of the ADMD's own domain, through a [domain name seizure](./domain-name-seizure.md) among other mechanisms, removes the boundary the whole architecture assumes an operator controls; see also [email-deliverability](./email-deliverability.md) and [abuse-handling](./abuse-handling.md).
