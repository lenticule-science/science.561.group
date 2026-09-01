---
name: semiosis
keywords:
  - idea
  - semiosis
  - signs
part-of: relational-computer
description: "Represents sign processes explicitly so the computer reasons about how things mean."
---

Represent sign processes explicitly so the relational computer can reason about
how things mean, not just what they refer to.

## 1. Core recognitions

- `SignRecognition`
  - a concrete sign token: a word, image, gesture, emoji, meme instance.
  - fields: medium, content, context (where/when/by whom), domain tags.

- `SignifierRecognition` / `SignifiedRecognition`
  - optional decomposition:
    - signifier: the form (text, sound, icon),
    - signified: the concept/idea as currently understood in a context.

- `InterpretantRecognition`
  - Peircean interpretant: the effect/reading a sign has for some subject in
    some context.
  - fields: subject, inferred meaning, affect, subsequent actions.

- `SemioticChainRecognition`
  - sequences where an interpretant becomes a new sign:
    - sign → interpretant → new sign → …

## 2. Topology and measurement

- Topology:
  - sign networks (which signs co-occur, substitute, or respond to others),
  - chains of interpretants across domains (news → MUD → dreams).

- Measurement:
  - stability vs drift of signifieds over time,
  - how often a sign leads to certain interpretants/actions,
  - polysemy/ambiguity (number and diversity of interpretants).

## 3. Runbooks and uses

- `annotate_signs(text_or_stream)`: detect signs, link to known signifiers.
- `track_sign_meaning(sign_id)`: see how interpretants shift over time or
  across contexts.
- `compare_semiosis_across_domains(sign_id, domains)`: e.g., how “nature” is
  used in news vs MUD vs papers.

Semiosis recognitions link to:

- personal symbols, myths, astrology, dreams,
- critical lenses (which signs a lens foregrounds or questions),
- MUD/worldbuilding (how in-game signs relate to real-world ones).

