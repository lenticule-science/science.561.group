---
authors:
  - Dave Crocker
publication: RFC 5598
key: crocker2009
reference-type: standard
title: "Internet Mail Architecture"
year: 2009
---

RFC 5598, IETF, July 2009.

## Why this is central

RFC 5598 is the reference architecture this section's `electronic-mail`
term rests on. It states no wire format — SMTP (RFC 5321) and the
Internet Message Format (RFC 5322) do that — but names the functional
roles (Author, Mediator, Recipient) and, decisively for a communication
collective, the Administrative Management Domain (ADMD): the
organization that operates one or more mail services under a single
administrative authority, and the trust boundary at which
deliverability policy, abuse handling, and legal process attach. A
collective running mail for its members is one ADMD; the mail systems
it exchanges with are other ADMDs it has no authority over.

## What it does not settle

The architecture document names the roles and boundaries; it makes no
claim about which deliverability mechanisms (SPF, DKIM, DMARC) an ADMD
should deploy, and no claim about abuse-handling practice, both of
which are separate specifications this section cites separately.

## Bridges

- To [electronic-mail](../../../glossary/terms/electronic-mail.md), which
  states the ADMD boundary as the term's engineering consequence.
- To [email-deliverability](../../../glossary/terms/email-deliverability.md)
  and [abuse-handling](../../../glossary/terms/abuse-handling.md), the
  policy layers an ADMD operates within the architecture this document
  names.
