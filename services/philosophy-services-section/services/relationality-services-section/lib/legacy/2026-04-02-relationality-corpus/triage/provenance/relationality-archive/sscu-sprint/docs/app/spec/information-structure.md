---
name: information-structure
layer: spec
keywords:
  - linguistics
  - information-structure
part-of: relational-computer
description: "Models topic and focus so the system can see what is presented as given versus new or emphasized."
---

Model topic and focus so the system can see what’s being presented as “given”
vs “new” or emphasized in an utterance.

## 1. Core recognitions

- `TopicRecognition`
  - what an utterance is taken to be “about” in context.
  - fields: links to entities/recognitions being topicalized.

- `FocusRecognition`
  - the part of an utterance that carries new/contrastive information.
  - fields: contrasted set, prosodic/syntactic marking.

- `GivenNewPartitionRecognition`
  - partitioning of content into given vs new vs presupposed.

## 2. Measurement and topology

- Topology:
  - how different sources/texts topicalize the same event differently,
  - focus shifts across a conversation or news cycle.

- Measurement:
  - which recognitions repeatedly appear as topic vs focus,
  - bias in what is consistently de-focused or backgrounded.

## 3. Runbooks and uses (prospective)

- `annotate_information_structure(text_slice)`,
- `compare_topicalization(event_id, sources)`,
- `help_agent_choose_focus(goal, audience)`.

This meshes with frames, critical lenses, and newsfeed analysis.
