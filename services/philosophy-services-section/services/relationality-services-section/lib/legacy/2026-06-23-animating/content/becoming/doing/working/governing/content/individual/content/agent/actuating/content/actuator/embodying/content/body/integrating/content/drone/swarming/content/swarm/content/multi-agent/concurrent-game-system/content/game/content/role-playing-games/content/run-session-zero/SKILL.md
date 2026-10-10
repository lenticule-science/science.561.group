---
name: run-session-zero
id: run-session-zero
description: Run a session zero to align expectations, tone, and boundaries. Use
  when starting a new role-playing campaign.
authors:
- gpt-5.2-codex
date-created: 2026-01-01
type: topic
tags: []
runtime:
  invocation: inference
  tool: human
region:
  reads: ["content/games/topics/role-playing-games/"]
  writes: ["content/games/topics/role-playing-games/"]
dependencies:
- /games/topics/role-playing-games/curricula/safety-and-consent.md
- /games/topics/role-playing-games/terms/index.md
part-of: games/topics/role-playing-games
---

# Run Session Zero

Use this skill when starting a new [campaign](../../terms/campaign.md) or introducing new players to an existing group.
The goal is to align the group on tone, boundaries, characters, and logistics *before* play begins.

## Inputs

- A group of 2–6 people who want to play a [role-playing game](../../index.md) together.
- A chosen [system](../../terms/system.md) (e.g., [Brave Old World](../../../../texts/brave-old-world.md)).
- 60–120 minutes of scheduled time.

## Steps

1. **Introductions and logistics** (5–10 min): confirm who is present, agree on scheduling (frequency, duration, location), and choose a between-session communication channel.

2. **Safety setup** (10–15 min): explain the group's chosen [safety tools](../../terms/safety-tool.md).
  At minimum, set up lines and veils — each player names topics that are off-limits (lines) or that may be referenced but not depicted in detail (veils).
  Record them.
  State the Open Door policy.
  See [Safety and Consent](../../curricula/safety-and-consent.md) for tool descriptions.

3. **Tone and genre negotiation** (10–15 min): the [game master](../../terms/game-master.md) proposes a premise or setting.
  The group discusses what excites them and what they would modify.
  Agree on the genre, the emotional register (grim, lighthearted, serious, absurd), and the kinds of stories the group wants to tell.

4. **Collaborative [character creation](../../curricula/character-creation.md)** (20–40 min): each player creates a [character](../../terms/character.md) — concept, narrative elements, and mechanical elements as the system requires.
  Do this together at the table so players can build connections between characters, avoid redundancy, and check that all characters fit the agreed tone.

5. **Rules orientation** (5–15 min): explain core [mechanics](../../../../terms/mechanic.md).
  For a minimal system like Brave Old World, this means the 2d6 resolution and the consensus rule.
  For heavier systems, cover the most common rolls and actions.
  A practice roll helps.

6. **Questions and closing** (5–10 min): address unresolved concerns.
  Preview the first session.
  Confirm the next meeting date.

## Outputs

- A shared understanding of tone, genre, and boundaries.
- A recorded list of lines and veils.
- A party of characters with reasons to be together.
- Logistics confirmed (schedule, location, communication).

## Verification

The session zero was successful if every player can answer: "What kind of stories are we telling?
What topics are off-limits?
Why is my character with this group?
When do we play next?"
