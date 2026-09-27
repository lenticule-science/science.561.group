---
title: Clear Prose and the Paramedic Method
aliases:
- Clear Prose and the Paramedic Method
- clear prose and the paramedic method
date-created: 2026-03-06
description: "How to revise technical prose for clarity at the sentence level — identifying and fixing the patterns that make institutional writing hard to read."
tags:
- writing
- technical-writing
requires:
- "/writing/disciplines/technical-writing/curricula/information-architecture-for-documents.md"
teaches:
- How to identify the Official Style and its characteristic patterns
- How to apply the Paramedic Method to revise sentences
- "How Williams's principles of characters, actions, and cohesion produce clear prose"
- How to balance clarity with precision in technical contexts
type: lesson
keywords:
  - writing
  - technical-writing
---

## Assumed audience

- Reading level: comfortable writing documentation; has completed "Audience and Task Analysis" and "Information Architecture for Documents."
- Background: understands audience analysis and document structure.
- Goal: learn to revise prose at the sentence level so that documentation is not just well-organized but well-written.

## The Official Style

[Richard Lanham](../../../../../../../../../../knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/richard-lanham.md) named the [Official Style](../../../../../../../../../../../../social-science-services-section/content/text/glossary/terms/official-style.md): the bloated, nominalized prose characteristic of bureaucracies, institutions, and academia [@lanham2006]. Its hallmarks are:

- **Nominalizations**: turning verbs into nouns. *Implement* becomes *the implementation of*. *Decide* becomes *the decision was made to*. The action disappears into an abstraction.
- **Prepositional pile-up**: chains of *of*, *in*, *for*, *by*, *with* phrases. "The implementation of the configuration of the settings for the management of user access" — five prepositions, zero clarity.
- **Passive voice without purpose**: "The system was configured" rather than "We configured the system." Passive voice has legitimate uses (when the agent is unknown or irrelevant), but in the Official Style it serves to hide who did what.
- **Throat-clearing**: "It is important to note that," "There are several factors that should be taken into consideration," "It should be pointed out that." These delay the sentence's content without adding meaning.

The Official Style is not a deliberate choice. It is the default register of institutional writing — the way people write when they're writing as a role (engineer, manager, academic) rather than as a person communicating with another person.

## The Paramedic Method

Lanham's [Paramedic Method](../../../../../../plain-language-services-section/content/text/glossary/terms/paramedic-method.md) is a systematic procedure for revising Official Style prose [@lanham2006]:

1. **Circle the prepositions.** Count them. More than two per sentence is a warning sign.
2. **Circle the "is/was/are/were" forms.** These "to be" verbs often indicate that the real action is hiding somewhere else.
3. **Find the action.** Ask: who is doing what to whom? The answer is often buried in a nominalization.
4. **Put the action in a strong verb.** "The implementation of the system" → "we implemented the system." "The analysis of the data revealed" → "we analyzed the data and found."
5. **Put the agent in the subject.** The person or thing performing the action should be the grammatical subject.
6. **Start fast.** Cut throat-clearing openers.

### Worked example

**Before**: "It is the recommendation of this committee that consideration be given to the implementation of a revised workflow for the processing of incoming support requests."

Step 1 — prepositions: *of* (×3), *to*, *of*, *for*, *of* — seven prepositions.
Step 2 — "to be": "It is."
Step 3 — action: someone should revise a workflow for processing support requests.
Step 4 — strong verb: *revise*, *process*.
Step 5 — agent: the committee.

**After**: "The committee recommends revising how we process incoming support requests."

From 26 words to 11. The meaning is identical. The revision is clearer because the reader can see who is doing what.

## Williams's principles

[Joseph Williams](../../../../../../../../../../knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/joseph-williams.md) approached sentence clarity through a different framework — one based on reader expectations rather than writer habits [@williams2006]:

**Characters as subjects.** Readers expect the sentence's main character (the agent, the thing the sentence is about) to appear as the grammatical subject. When the subject is an abstraction ("The utilization of the system"), the reader has to work to find the real character.

**Actions as verbs.** Readers expect the main action to appear as the verb. When the action is nominalized ("made a determination" instead of "determined"), the reader processes two words where one would do.

**Old before new.** Sentences are easier to read when they begin with information the reader already knows (from the previous sentence or from context) and end with new information. This creates cohesion — each sentence builds on the last.

**Short to long.** Within a sentence, shorter elements before longer ones. Readers can hold a short phrase in memory while processing a longer one, but not the reverse.

These principles are not rules to follow mechanically. They are diagnostic tools: when a sentence feels hard to read, checking it against Williams's principles usually reveals why.

## Clarity versus precision

Technical writing sometimes requires precision that conflicts with simplicity. A legal document, a specification, or an API reference may need qualifications, conditions, and exact terminology that make sentences longer and denser.

The solution is not to choose clarity over precision or precision over clarity. It is to be clear about what requires precision and what doesn't:

- **Terms of art** — use them when writing for readers who know them. Define them when writing for readers who don't. Don't replace precise terminology with vague approximations.
- **Qualifications** — include them when they change the meaning. Cut them when they don't. "In most cases, the system will respond within 5 seconds" is different from "The system responds within 5 seconds." If the qualification matters, keep it. If it's hedging, cut it.
- **Sentence structure** — even complex ideas can be expressed in sentences with clear subjects and active verbs. Complexity of thought does not require complexity of syntax.

## Guidance

- Apply the Paramedic Method to one paragraph of your current draft. Count the prepositions, find the buried actions, and revise. The difference is usually striking.
- Read your prose aloud. Where you run out of breath or lose the thread, the sentence is too long or too convoluted.
- Check that each sentence's subject is a real character (a person, a system, a component) rather than an abstraction (a process, a requirement, an implementation).
- After revising for clarity, check that you haven't sacrificed precision. The goal is both — not one at the other's expense.

## Related terms

- [Paramedic Method](../../../../../../plain-language-services-section/content/text/glossary/terms/paramedic-method.md)
- [Official Style](../../../../../../../../../../../../social-science-services-section/content/text/glossary/terms/official-style.md)
- [revision](../../../../../../essay-writing-services-section/content/text/glossary/terms/revision.md)
- [voice](../../../../../../rhetoric-and-composition-services-section/content/text/glossary/terms/voice.md)
- [style](../../../../../../../../../../../../social-science-services-section/content/text/glossary/terms/style.md)
- [cognitive load](../../../../../../plain-language-services-section/content/text/glossary/terms/cognitive-load.md)
