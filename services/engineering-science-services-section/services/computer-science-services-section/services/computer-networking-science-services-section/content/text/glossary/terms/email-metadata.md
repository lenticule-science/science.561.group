---
description: Email metadata is the information a message and its transfer produce about the communication event itself, as distinct from the message's encrypted or unencrypted content.
identity: email-metadata
name: Email metadata
date-created: 2026-09-08
references:
  danezisdiaz2008:
    authors:
      - George Danezis
      - Claudia Diaz
    title: A Survey of Anonymous Communication Channels
    publication: Microsoft Research Technical Report MSR-TR-2008-35
    publisher: Microsoft Research
    year: 2008
    url: https://www.microsoft.com/en-us/research/publication/a-survey-of-anonymous-communication-channels/
---
Email metadata is the information a message and its transfer produce about the communication event itself — sender and recipient addresses, timestamps, subject-line text, message size, and the sequence of relaying servers a message passed through — as distinct from the message's encrypted or unencrypted content. [Danezis and Diaz's survey](../../documents/articles/bibliographies/danezisdiaz2008.md) of anonymous-communication design states the general form of the problem: an adversary positioned to observe network traffic can learn who communicates with whom, how often, and when, from routing and timing metadata alone, independent of whether the content itself is readable.

Email metadata differs from end-to-end content encryption in what it exposes: encrypting a message's body and subject under a scheme such as OpenPGP protects content from a party who intercepts or stores the message, but the SMTP envelope, the `To`/`From`/`Date` headers, and the `Received` header chain every relaying server adds remain visible to every server the message passes through and to anyone who can observe or subpoena those servers. This is the distinction that separates this term from [end-to-end-encryption](./end-to-end-encryption.md), which secures content and, in some protocol designs, some metadata, but not the routing information SMTP relaying inherently exposes.

An operator that promises confidential communication to its users but has not separately addressed metadata exposure has secured content while leaving traffic analysis — who contacted whom, when, and how often — available to any party positioned to observe the operator's own servers or compelled to produce their logs. Retention policy for connection logs, `Received` headers, and delivery records is therefore a design decision with the same stakes as the choice of encryption, and is the reason a service under legal compulsion is asked for logs rather than for message content it may not hold at all.
