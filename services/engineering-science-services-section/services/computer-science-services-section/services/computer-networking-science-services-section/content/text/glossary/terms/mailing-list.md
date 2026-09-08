---
description: A mailing list is a redistribution service, built on ordinary electronic mail, in which a message sent to one address is copied and forwarded to every subscribed member address.
identity: mailing-list
name: Mailing list
provenance:
  date-created: 2026-09-08
references:
  huitema2000:
    authors:
      - The IETF
    title: The Use of URLs as Meta-Syntax for Core Mail List Commands and their Transport through Message Header Fields
    publication: RFC 2369
    publisher: IETF
    year: 1998
    url: https://www.rfc-editor.org/rfc/rfc2369.html
  chandhok2000:
    authors:
      - Ronald Chandhok
      - Grant Wegrich
    title: "List-Id: A Structured Field and Namespace for the Identification of Mailing Lists"
    publication: RFC 2919
    publisher: IETF
    year: 2001
    url: https://www.rfc-editor.org/rfc/rfc2919.html
---
A mailing list is a redistribution service, built on ordinary electronic mail, in which a message sent to one address is copied and forwarded to every subscribed member address, together with the header fields RFC 2369 and RFC 2919 define so that a mail client can act on the list automatically. RFC 2369 defines the `List-Help`, `List-Subscribe`, `List-Unsubscribe`, `List-Post`, `List-Owner`, and `List-Archive` header fields, each carrying a URL a client can act on directly; RFC 2919 defines the separate `List-Id` field that identifies the list itself independent of its current posting address. See [electronic-mail](./electronic-mail.md).

A mailing list differs from a single email thread in that list membership, not the recipient list of one message, determines delivery, and it differs from a broadcast newsletter in that any member, not only the list operator, can typically post. The distinction matters operationally because list membership is the thing an operator administers over the list's lifetime, while a thread's recipient list is fixed at the moment one message is sent.

Because every subscriber's mail provider evaluates list mail under its own deliverability policy, a list with high complaint or bounce rates degrades the sending reputation of the list's own outbound domain, not just of the individual senders whose messages the list redistributes. List-management practice — bounce handling, unsubscribe honoring, and rate limiting — is therefore a direct input to [email-deliverability](./email-deliverability.md), and a list an operator cannot administer, through a lost domain per [domain-name-seizure](./domain-name-seizure.md), loses every subscriber's mail at once rather than one account at a time.
