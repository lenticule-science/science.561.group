---
title: "Communication objects"
component-of: communication
---

# Objects

Formal models the science-side communication theory commits to. Each object pairs a concept-level anchor with a structural triple/tuple that downstream theories can `depends-on:` directly when they need the structure rather than the concept alone.

## Currently carried

The four objects together cover the source-channel-receiver tradition (Shannon-channel) and the three load-bearing pragmatic/rhetorical anchors:

- **[shannon-channel](shannon-channel.md)** — the foundational source-channel-receiver formalisation: a triple $(X, Y, p)$ of input alphabet, output alphabet, and transition probability, characterised by capacity. Realises [channel](teaching/explanations/channel.md). Underwrites the mathematical/cybernetic tradition.

- **[speech-act](speech-act.md)** — the locutionary/illocutionary/perlocutionary triple of Austin and Searle, with felicity conditions as constitutive rules and Searle's five-fold illocutionary taxonomy. Realises [pragmatics](teaching/explanations/pragmatics.md). Underwrites the linguistic-pragmatic tradition.

- **[rhetorical-situation](rhetorical-situation.md)** — the exigence/audience/constraints triple of Bitzer, with fittingness as the normative notion. Realises [audience](teaching/explanations/audience.md). Underwrites the social-rhetorical tradition.

- **[common-ground](common-ground.md)** — the accumulating shared-substrate model of Stalnaker (semantic update) and Clark (grounding processes, communal vs. personal layers). Realises [pragmatics](teaching/explanations/pragmatics.md). The pragmatic-substrate the speech-act unit operates against.

## Structural complementarity

The three pragmatic/rhetorical objects fill complementary roles:

- **speech-act** is the *unit* of communicative action.
- **common-ground** is the *internal substrate* the unit operates against.
- **rhetorical-situation** is the *external conditions* that determine which units are appropriate against which substrate.

Together they characterise communicative action as a triple of (act-on-substrate-in-situation), with each object supplying one of the three components.

## Open work

Per the [unify-or-federate question](questions/unify-or-federate-with-humanities-communication.md) and the parent [`_index.md`](../_index.md), several further objects are anticipated:

- A *conversation-as-game* object from the dialogue-systems tradition (Lewis on signalling games; the dynamic-semantics game-theoretic accounts; Stalnaker's later work).
- A *dialogue-act* object generalising speech-act to multi-turn structure (the dialogue-act tagging literature in computational linguistics).
- A *topos-of-discourse* object capturing what a discourse domain treats as inhabitable by its discourse moves (after the topoï tradition in argumentation theory).

These remain genuinely open and are not pre-specified — captured here so that contributors who reach for them know they would land here.
