---
title: Register, Style, and Sociolect
status: someday
keywords:
  - idea
  - register
  - style
  - sociolect
---
# Idea: Register, Style, and Sociolect

Capture how language varies across contexts and groups so agents can adapt
voices and you can see how you shift across domains.

## 1. Core recognitions

- `RegisterRecognition`
  - varieties like formal, informal, technical, intimate, bureaucratic,
    shitpost, poetic, etc.

- `SociolectRecognition`
  - characteristic patterns of a group (community, server, discipline).

- `StyleProfileRecognition`
  - features for a particular voice (author, agent persona, friend):
    - lexical choices, sentence rhythms, levels of hedging, etc.

## 2. Measurement and topology

- Topology:
  - links between registers, sociolects, and domains (news, MUD, lab, therapy).

- Measurement:
  - how your own style/register mix shifts across contexts,
  - convergence/divergence between participants over time.

## 3. Runbooks and uses

- `annotate_register(text_or_conversation)`: assign registers and sociolects.
- `derive_style_profile(subject_slice)`: build/update a style profile.
- `generate_in_style(agent_id, style_profile_id)`: have agents write in a
  specific, grounded voice.

These recognitions support your author agents, MUD personas, social integrations
and any part of the system that “speaks.”

