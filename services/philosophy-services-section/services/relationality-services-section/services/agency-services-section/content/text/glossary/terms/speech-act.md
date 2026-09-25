---
type: definition
class: formal-model
status: settled
depends-on:
  - teaching/explanations/pragmatics.md
realizes:
  - teaching/explanations/pragmatics.md
see-also:
  - teaching/explanations/audience.md
  - teaching/explanations/register.md
  - common-ground.md
  - rhetorical-situation.md
references:
  - references/grice1975.md
title: Speech act
description: The speech act is the foundational formal model of saying-as-doing, due to J.
---

# Speech act

The **speech act** is the foundational formal model of saying-as-doing, due to J. L. Austin (1962, *How to Do Things with Words*) and elaborated by John Searle (1969, *Speech Acts*). The model formalises an utterance as a typed triple of acts performed simultaneously: a *locutionary* act (uttering meaningful words with a particular sense and reference), an *illocutionary* act (the act performed *in* uttering — asserting, promising, requesting, declaring), and a *perlocutionary* act (the effect produced *by* uttering — convincing, persuading, alarming, amusing).

## Definition

A **speech act** is a tuple $a = (L, I, P)$ where:

- $L$ is the **locutionary** content: a triple $(\phi, \mathit{sense}, \mathit{ref})$ of a phonetic/orthographic form $\phi$, a sense (the conventional linguistic meaning), and a reference (the entities the form picks out in context).
- $I$ is the **illocutionary** force: a tuple $(F, p)$ where $F$ is one of a small closed family of illocutionary types (Searle's taxonomy: *assertive*, *directive*, *commissive*, *expressive*, *declaration*) and $p$ is the propositional content the force is applied to.
- $P$ is the **perlocutionary** effect: an outcome on the hearer's beliefs, desires, intentions, or actions that the locution causes (or is intended to cause).

The same locution can perform different illocutionary acts in different contexts ("It's cold in here" can be an assertion, a request to close the window, or a complaint), and different locutions can perform the same illocutionary act ("I promise to call" and "Count on a call from me" both commit the speaker to calling).

## Felicity conditions

Searle's central technical contribution: each illocutionary type has **felicity conditions** — preparatory conditions, sincerity conditions, and essential conditions — that determine when the act has been validly performed. A promise is *felicitous* iff (i) the speaker can do the promised act, (ii) the hearer wants it done, (iii) the speaker intends to do it, and (iv) the speaker takes on an obligation by uttering. Violations of felicity conditions yield characteristic *infelicities* (insincere promises, void declarations, misfired requests).

The felicity-condition framework is what makes the speech act a *formal* model rather than just a vocabulary: each illocutionary type is fully characterised by its felicity conditions, and the model can predict when an utterance will succeed or fail as the act it purports to be.

## Searle's five-fold taxonomy

The illocutionary force $F$ ranges over five exhaustive classes (Searle 1979):

- **Assertive.** Commits speaker to the truth of $p$. Direction of fit: word-to-world.
- **Directive.** Attempts to get hearer to act so as to make $p$ true. Direction of fit: world-to-word.
- **Commissive.** Commits speaker to act so as to make $p$ true. Direction of fit: world-to-word.
- **Expressive.** Expresses speaker's psychological state about $p$. Direction of fit: none (presupposes truth of $p$).
- **Declaration.** Brings about the truth of $p$ by the utterance itself, in virtue of speaker's institutional authority. Direction of fit: word-to-world *and* world-to-word simultaneously.

The classes are mutually exclusive and jointly exhaust the illocutionary force space. The taxonomy is the model's structural commitment.

## Why this object load-bears

Speech act is the foundational formal model the [pragmatics](../concepts/pragmatics.md) concept is built around. Without it, [pragmatics](../concepts/pragmatics.md) cites the literature but has no co-located object the literature is *about*. With it, downstream theories citing pragmatics can also cite this object directly when they need the structural triple $(L, I, P)$ rather than the broader concept.

The model also load-bears on [audience](../concepts/audience.md) (different audiences make different perlocutionary effects available) and on [register](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/communicating/content/communication/archive/code/structures/teaching/explanations/register.md) (registers conventionalise which illocutionary forces are available for which propositional contents).

## Limits of the model

Several developments diverge from or extend the Austin-Searle model:

- **Indirect speech acts.** Searle (1975) treats indirect speech acts (a directive performed via an apparent assertion) as a layered illocutionary structure, with one act performed *by means of* another. The layered structure complicates the simple triple.
- **Performatives.** Austin's original distinction between performatives (utterances that *do* what they say) and constatives (utterances that *describe*) was abandoned in *How to Do Things with Words*'s second half in favour of treating all utterances as having illocutionary force. The history is itself instructive about the model's scope.
- **Conventionalist vs. intentionalist accounts.** Strawson (1964) argued illocutionary force is fixed by speaker intention, not by convention; Searle defended a partial convention-plus-intention account. The dispute remains live.
