---
type: question
class: external
status: open
explores:
  - audience
  - pragmatic-register
  - note-type
  - genre
see-also:
  - ../../../../../../../../communication/_index.md
  - ../../../../../../../../linguistics/theories/semiotics/_index.md
  - ../../../../../../../../../humanities/theories/writing/theories/rhetoric-and-composition/_index.md
  - ../specifications/note-types/_index.md
  - teaching/explanations/audience.md
  - teaching/explanations/channel.md
  - teaching/explanations/pragmatic-register.md
title: Who is the audience for each note type, and what pragmatics do the conventions encode?
description: "Each note type in the typed vocabulary (concept, object, morphism, theorem, question, narrative, example, reference) implicitly addresses a different audience and operates under a different pragmatic register:"
---

# Who is the audience for each note type, and what pragmatics do the conventions encode?

Each note type in the typed vocabulary (`concept`, `object`, `morphism`, `theorem`, `question`, `narrative`, `example`, `reference`) implicitly addresses a different audience and operates under a different pragmatic register:

- A `concept` note addresses a reader who needs to know what role this anchor plays across the theory; its register is *expository*.
- An `object` (definition) note addresses a reader who needs the precise structure to check a proof or build a construction; its register is *terse and authoritative*.
- A `theorem` note addresses a reader who needs to know what is and is not proved; its register is *claim-and-evidence*.
- A `question` note addresses a future researcher (or self) who might attempt the question; its register is *position-and-stake*.
- A `narrative` note addresses a reader walking a path; its register is *rhetorical and ordering*.
- An `example` note addresses a reader who has the abstraction and needs an instance; its register is *concrete*.
- A `reference` note addresses a reader who needs to follow up the source; its register is *bibliographic*.

The current curation work makes these audience and register commitments *implicitly*. Most note-type specs say "this is what a `concept` note must contain" without saying *who is reading* or *what relationship the note assumes with that reader*. That is a gap. Communication theory says — and the user has flagged this gap explicitly — that a vault's pragmatic disorder is one of the largest sources of its overall disorder.

The question: what are the *explicit* audience and pragmatic-register commitments of each note type, and what do those commitments imply for what each note type's body must (and must not) contain?

## Why it matters

A `concept` note that drifts into theorem-style claim-and-evidence misleads readers who came for orientation. A `theorem` note that drifts into narrative recap loses the reader who came to check what is proved. A `question` note that drifts into expository concept-overview erases its position-and-stake.

Pragmatic mis-register is invisible to validators that check frontmatter and structure but not voice. It is the largest remaining source of corpus disorder that *cannot* be caught by FARS.

## Sub-questions

1. **Audience as concept or as object.** Should `audience` be a concept in the [communication theory](../../research/2026/07/31/lenticule-import/animating/content/becoming/communication) entry (with each note type's audience as a *realization*), or an object (with the audience structure formally defined)? See [concept-vs-object-disambiguation](concept-vs-object-disambiguation.md).
2. **Single-audience vs. multi-audience.** Some notes plausibly address two audiences in turn (a `theorem` that opens with motivation for a non-expert and ends with a proof for the specialist). Is multi-audience a permitted register, or does it indicate the note should be split into a `narrative` (motivation) plus a `theorem` (claim)?
3. **Register as frontmatter or as discipline.** Should the audience and register be declared in frontmatter (`audience: practitioner | specialist | future-self`, `register: expository | claim-and-evidence | ...`) so they are queryable, or should they live as a per-type discipline that contributors learn?
4. **What communication theory does this need.** This question cannot be cleanly answered without at least a stub `audience` concept and a stub `pragmatic-register` concept under [the communication theory](../../research/2026/07/31/lenticule-import/animating/content/becoming/communication). The fact that those are stubs is part of why this question is open.

## What an answer would look like

For each of the eight typed kinds, a one-paragraph specification of:
- **Implied audience.** Who is being addressed.
- **Pragmatic register.** What relationship the note assumes with the audience.
- **Body discipline.** What the body must and must not do, given the audience and register.

Plus a defended answer to whether audience/register are frontmatter or discipline.

## What is at stake in the wrong answer

If audience and register are never made explicit, the corpus drifts into voice-confusion: notes mix registers, readers cannot trust the type label to predict the reading experience, and contributors silently re-fork the conventions per-theory. If audience and register are made too rigid, contributors find them performative and ignore them, producing the same drift with extra friction.
