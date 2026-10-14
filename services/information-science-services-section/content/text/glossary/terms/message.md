---
name: "Message"
description: "An addressed communicative record carried through a channel, which may be interpreted or acted upon; its telling, delivery, authority, effect, and receiver acceptance are distinct."
date-created: 2020-12-22
date-modified: 2026-09-27
requires: [channel]
references:
  shannon1948:
    authors: [Claude E. Shannon]
    title: A Mathematical Theory of Communication
    publication: Bell System Technical Journal, 27(3)
    year: 1948
  hewitt1973:
    authors: [Carl Hewitt, Peter Bishop, Richard Steiger]
    title: A Universal Modular ACTOR Formalism for Artificial Intelligence
    publication: IJCAI
    year: 1973
  austin1962:
    authors: [J. L. Austin]
    title: How to Do Things with Words
    publication: Oxford University Press
    year: 1962
  jakobson1960:
    authors: [Roman Jakobson]
    title: "Closing Statement: Linguistics and Poetics"
    publication: "Style in Language, ed. T. A. Sebeok, MIT Press"
    year: 1960
---
A **message** is an addressable [record](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/terms/record.md) intended to be communicated through a [channel](channel.md) to a recipient. A recipient may be a person, software actor, institution, the sender in a later role, or a qualified receiver. The channel carries signals and can shape what arrives; a sender can truthfully attest to **sending** without establishing delivery, correct interpretation, authority, any promised side effect, or independent receipt. Message content is an utterance; the world-changing action, if any, requires a separately admitted and witnessed transition.

Four traditions give **complementary but non-equivalent** readings of a message; their information measures, actor state transitions, speech-act intentions and linguistic functions must not be silently equated:

**Information theory** (Shannon 1948). A message is a selection from a set of possible signals. Its information is how far it narrows the recipient's uncertainty: a message that tells you what you already know carries none, and the channel's capacity, bandwidth and noise bound which messages can pass.

**The actor model** (Hewitt, Bishop and Steiger 1973). [Actors](../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/actor.md) affect one another only by messages, never through shared state. An actor that receives a message can create actors, send further messages and fix how it will handle the next message. Sending is asynchronous: the sender does not wait for a reply.

**Speech acts** (Austin 1962). A message is an act as well as a report. What is said is the locutionary act; what is done in saying it (asserting, requesting, promising, declaring) is the illocutionary act; what it brings about in the recipient is the perlocutionary act. A message reading "status: completed" **asserts** completion; it cannot by that assertion alone settle a task or advance an authoritative plan. Only an admitted Work Arena action and the relevant independently witnessed goal/receiver condition can do so. See [speech act](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/terms/speech-act.md).

**Communication functions** (Jakobson 1960). Every message involves an addresser, an addressee, a context, a form, a contact (the channel) and a code, and each factor gives the message a function: emotive, conative, referential, poetic, phatic and metalingual. A frontmatter field is mainly referential; a directive is mainly conative.

A source-addressed sent message is preserved at its exact revision. A correction is a new attributed message referring to the earlier one; whether it retracts, supersedes, contradicts, or merely comments on an earlier **claim** is a separately typed interpretation. The history of messages is therefore evidence of tellings, not automatically the authoritative state transition or the receiver\'s accepted account. This distinction is a required assay in the [L-Space language/claim specification](https://github.com/lenticule-science/linguistics-services-section/blob/main/specifications/l-space-semantic-architecture.md), including source-scoped locution, FIVE speech-act forces and FOUR evidence polarities.

## Related

- [Channel](channel.md)
- [Record](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/terms/record.md)
- [Speech act](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/terms/speech-act.md)
