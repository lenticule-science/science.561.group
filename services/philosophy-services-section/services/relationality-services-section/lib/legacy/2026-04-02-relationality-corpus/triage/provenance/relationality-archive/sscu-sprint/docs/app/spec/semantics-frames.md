---
name: semantics-frames
keywords:
  - idea
  - semantics
  - frames
part-of: relational-computer
description: "Models lexical senses and semantic frames so the system recognizes what's happening in utterances."
---

Model lexical senses and semantic frames so the system can recognize “what’s
going on” in an utterance beyond surface words.

## 1. Core recognitions

- `LexicalSenseRecognition`
  - specific senses of a word/lexeme.
  - fields: gloss, examples, domain tags.

- `FrameRecognition`
  - semantic frames (e.g., buying, illness, journey, argument).
  - fields: roles (agent, patient, instrument, goal, etc.).

- `FrameFillingRecognition`
  - a particular utterance instantiating a frame:
    - which tokens/recognitions fill which roles.

## 2. Topology and measurement

- Topology:
  - linking frames to domains (finance, health, ecology, MUD),
  - mapping how the same event is framed differently across texts.

- Measurement:
  - which frames dominate a topic (e.g., crime vs health framing),
  - how often frames shift in a conversation or over time.

## 3. Runbooks and uses

- `annotate_frames(text_slice)`: identify frames and role fillers.
- `compare_framings(event_id)`: see competing framings across sources.

Frames connect directly to semiosis, critical lenses, and policy/governance
analysis.

