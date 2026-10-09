---
title: "Privacy-Preserving Communication Services"
description: "The bounded area gathering the protocols, mechanisms, and operational practices a communication service composes to give its users confidentiality, deliverability, and resilience against network- and naming-layer pressure."
contains: [electronic-mail, mailing-list, email-deliverability, email-metadata, end-to-end-encryption, instant-messaging, onion-service, virtual-private-network, web-hosting, content-delivery-network, domain-name-seizure, abuse-handling]
---

This topic gathers the terms a communication service composes when it
promises its users privacy: the message protocols themselves
([electronic-mail](../terms/electronic-mail.md),
[mailing-list](../terms/mailing-list.md),
[instant-messaging](../terms/instant-messaging.md)); the layer that
determines whether a promised message actually reaches its recipient
([email-deliverability](../terms/email-deliverability.md)); the
cryptographic and topological mechanisms that state what an adversary
positioned on the network can and cannot learn
([end-to-end-encryption](../terms/end-to-end-encryption.md),
[email-metadata](../terms/email-metadata.md),
[onion-service](../terms/onion-service.md),
[virtual-private-network](../terms/virtual-private-network.md)); and
the infrastructure and operational layers where the service is
physically hosted and can be administratively or legally reached
([web-hosting](../terms/web-hosting.md),
[content-delivery-network](../terms/content-delivery-network.md),
[domain-name-seizure](../terms/domain-name-seizure.md),
[abuse-handling](../terms/abuse-handling.md)).

The topic sits at this level, under
`computer-networking-science-services-section`'s glossary rather than
under any one protocol's own subsection, because no single term in the
set states what a communication collective actually provides: a
collective's service portfolio is a composition across every layer at
once, and a promise made at one layer (content secrecy, from
end-to-end encryption) does not carry to another layer (routing
metadata exposure, or reachability under a domain seizure) unless the
composition is stated explicitly. The terms this topic gathers are the
vocabulary a capability portfolio is composed from; the 2026-09-08
[note on the service portfolio of a radical server
collective](../../documents/articles/notes/2026/09/08/2026-09-08-note-on-the-service-portfolio-of-a-radical-server-collective.md)
performs that composition against several first-party examples.
