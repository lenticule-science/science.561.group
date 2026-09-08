---
description: Email deliverability is whether a message a sender transmits actually reaches a recipient's inbox, as distinct from being accepted, dropped silently, or routed to a spam folder by the receiving system.
identity: email-deliverability
name: Email deliverability
provenance:
  date-created: 2026-09-08
references:
  kitterman2014:
    authors:
      - Scott Kitterman
    title: Sender Policy Framework (SPF) for Authorizing Use of Domains in Email, Version 1
    publication: RFC 7208
    publisher: IETF
    year: 2014
    url: https://www.rfc-editor.org/rfc/rfc7208.html
  crockerhansenkucherawy2011:
    authors:
      - D. Crocker
      - T. Hansen
      - M. Kucherawy
    title: DomainKeys Identified Mail (DKIM) Signatures
    publication: RFC 6376
    publisher: IETF
    year: 2011
    url: https://www.rfc-editor.org/rfc/rfc6376.html
  kucherawyzwicky2015:
    authors:
      - M. Kucherawy (ed.)
      - E. Zwicky (ed.)
    title: Domain-based Message Authentication, Reporting, and Conformance (DMARC)
    publication: RFC 7489
    publisher: IETF
    year: 2015
    url: https://www.rfc-editor.org/rfc/rfc7489.html
---
Email deliverability is whether a message a sender transmits actually reaches a recipient's inbox, as distinct from being accepted, dropped silently, or routed to a spam folder by the receiving system, and it is determined jointly by three authentication mechanisms and the sending domain's accumulated reputation. Sender Policy Framework (RFC 7208) lets a domain publish, in DNS, the hosts authorized to send mail using that domain in the SMTP envelope; DomainKeys Identified Mail (RFC 6376) lets the sending domain cryptographically sign a message so a receiver can verify the signing domain and that the signed content was not altered; and Domain-based Message Authentication, Reporting and Conformance (RFC 7489) ties the two together against the domain in the visible `From:` header and states what a receiver should do with mail that fails alignment.

Deliverability differs from delivery: SMTP delivery succeeds when a receiving server accepts a message during the SMTP transaction, which a spam-folder placement or a silent post-acceptance drop does not undo, so an operator can have perfect delivery and poor deliverability at the same time. It differs from spam filtering narrowly construed, because SPF, DKIM, and DMARC authenticate who sent a message and whether it was altered, not whether its content is unwanted; content filtering is a separate, per-provider judgment layered on top of authentication. See [abuse-handling](./abuse-handling.md).

A newly established sending domain, or one that has recently changed its outbound infrastructure, carries no reputation history with the mailbox providers it sends to, so its mail is deliverability-fragile regardless of correct SPF, DKIM, and DMARC configuration until that history accumulates. A communication collective that loses its established sending domain, whether through [domain-name-seizure](./domain-name-seizure.md) or a forced migration, does not merely lose the domain; it loses the accumulated reputation that made its [electronic-mail](./electronic-mail.md) deliverable, and starts the reputation-building process over on whatever domain replaces it.
