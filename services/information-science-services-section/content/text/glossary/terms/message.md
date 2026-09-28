---
name: "Message"
description: "A record made to be given to someone other than its maker: a selection from possible signals carried through a channel, which acts on its recipient as well as informing it."
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
A **message** is a [record](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/terms/record.md) made to be given to a different [person](../../../../../philosophy-services-section/content/text/glossary/terms/person.md) than the one who made it. It travels through a [channel](channel.md), which shapes what arrives without creating it, and it can change the state of whoever receives it.

Four traditions say what a message is, and they agree:

**Information theory** (Shannon 1948). A message is a selection from a set of possible signals. Its information is how far it narrows the recipient's uncertainty: a message that tells you what you already know carries none, and the channel's capacity, bandwidth and noise bound which messages can pass.

**The actor model** (Hewitt, Bishop and Steiger 1973). [Actors](../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/actor.md) affect one another only by messages, never through shared state. An actor that receives a message can create actors, send further messages and fix how it will handle the next message. Sending is asynchronous: the sender does not wait for a reply.

**Speech acts** (Austin 1962). A message is an act as well as a report. What is said is the locutionary act; what is done in saying it (asserting, requesting, promising, declaring) is the illocutionary act; what it brings about in the recipient is the perlocutionary act. A message reading "status: completed" asserts, and by asserting may advance a plan. See [speech act](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/terms/speech-act.md).

**Communication functions** (Jakobson 1960). Every message involves an addresser, an addressee, a context, a form, a contact (the channel) and a code, and each factor gives the message a function: emotive, conative, referential, poetic, phatic and metalingual. A frontmatter field is mainly referential; a directive is mainly conative.

A sent message does not change. A correction is a new message that refers to the one it corrects, so the sequence of messages is itself the history of the exchange: in an actor system, in an event log, in a conversation.

## Related

- [Channel](channel.md)
- [Record](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/terms/record.md)
- [Speech act](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/terms/speech-act.md)
