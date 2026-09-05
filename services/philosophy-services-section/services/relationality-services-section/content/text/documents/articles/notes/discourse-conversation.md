---
title: Discourse & Conversation Structure
status: someday
keywords:
  - idea
  - discourse
  - conversation
---
# Idea: Discourse & Conversation Structure

Represent speech acts, discourse relations, and conversation structure so the
system can see what people are *doing* with language.

## 1. Core recognitions

- `SpeechActRecognition`
  - labeling utterances as asserting, questioning, promising, requesting,
    joking, threatening, etc.

- `PresuppositionRecognition`
  - content taken for granted by an utterance.

- `ImplicatureRecognition`
  - what is implied but not stated.

- `TurnRecognition`
  - individual turns in a conversation, linked in adjacency pairs
    (question–answer, offer–accept/refuse).

- `DiscourseRelationRecognition`
  - relations like cause, contrast, elaboration, concession between spans
    (RST-like).

- `ConversationRecognition`
  - a conversation as a whole: participants, topics, phases (opening, body,
    closing), norms.

## 2. Measurement and topology

- Topology:
  - who responds to whom, who gets interrupted, who is ignored,
  - structure of debates, negotiations, support conversations.

- Measurement:
  - balance of speech acts (who asserts vs asks),
  - repair/acknowledgment patterns (how conflicts resolve vs freeze).

## 3. Runbooks and uses

- `annotate_conversation(log)`: produce turns, speech acts, discourse relations.
- `analyze_conversation_dynamics(slice)`: surface who holds floor, who repairs,
  where breakdowns occur.

This directly supports interpersonal communication analysis, governance,
support/care, and agent dialogue behavior.
