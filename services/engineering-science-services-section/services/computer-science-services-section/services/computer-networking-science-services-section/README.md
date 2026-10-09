# Computer Networking Science Services Section

This section holds the science of networked communication services: the
protocols that carry a message between parties, the mechanisms that
determine whether a message is delivered or dropped, the metadata a
network produces as a side effect of carrying traffic, and the
operational load — abuse, moderation, hosting, seizure — that running a
communication service at any scale generates. It sits as a sibling of
[`computer-systems-science-services-section`](../computer-systems-science-services-section/content/text/glossary/terms/networked-computing.md),
which holds the science of a single networked computer's operating
environment; this section holds the science of what happens between
computers. It mirrors, on the science side of the house, the custody the
engineering tree already draws around
[`computer-networking-engineering-services-section`](../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-networking-engineering-services-section/README.md) —
that section owns the reusable protocol implementations (HTTP, XMPP,
ActivityPub, OAuth, web-mesh) the Group runs; this section owns the
theory of why those protocols and the services built on them behave as
they do, so an engineering choice can be traced to a stated mechanism
rather than asserted.

The research spine runs from the wire to the institution: a protocol's
architecture (who the parties are and what they exchange) sets what a
service can promise; deliverability and metadata determine what a
promise is worth once the message leaves the sender's control;
end-to-end cryptography and anonymity design state what an adversary
positioned on the network can and cannot learn; hosting and content
delivery state where the bytes physically sit and who can be compelled
to act on them; and abuse handling and domain administration state the
operational and legal points at which a service can be pressured,
degraded, or removed. A capability portfolio — the services a
communication collective actually runs — is the composition of terms
from each layer, never a single term standing in for the whole.

## Services

None yet. Narrower subtopics (a transport-security services section, a
federation services section) are added here when a term's own weight
warrants a child section, following this README's shape.

## Glossary

`content/text/glossary/terms/` holds primitive terms: `electronic-mail`,
`mailing-list`, `email-deliverability`, `email-metadata`,
`end-to-end-encryption`, `instant-messaging`, `onion-service`,
`virtual-private-network`, `web-hosting`, `content-delivery-network`,
`domain-name-seizure`, `abuse-handling`. `content/text/glossary/topics/`
holds `privacy-preserving-communication-services.md`, which gathers the
terms above into one bounded area.

## Notes

`content/text/documents/articles/notes/` holds dated research notes,
including the 2026-09-08 note on the service portfolio of a radical
server collective, which generalizes several first-party collectives'
published service lists into the capability classes this glossary
names.
