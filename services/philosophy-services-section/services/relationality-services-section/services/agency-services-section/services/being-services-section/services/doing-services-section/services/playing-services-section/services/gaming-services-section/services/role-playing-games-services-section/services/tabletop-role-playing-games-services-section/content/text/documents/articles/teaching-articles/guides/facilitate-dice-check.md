---
title: "Facilitate Dice Check"
description: Facilitate a dice check by setting stakes, choosing a mechanic, and resolving outcomes. Use during tabletop play.
date-created: 2026-01-01
locates: topic
tags: []
runtime:
  invocation: inference
  tool: human
region:
  reads: ["content/games/topics/role-playing-games/tabletop-role-playing-games/"]
  writes: ["content/games/topics/role-playing-games/tabletop-role-playing-games/"]
dependencies:
- /games/topics/role-playing-games/tabletop-role-playing-games/curricula/dice-and-resolution.md
- /games/topics/role-playing-games/tabletop-role-playing-games/terms/index.md
part-of: games/topics/role-playing-games/tabletop-role-playing-games
name: facilitate-dice-check
id: facilitate-dice-check
authors:
- gpt-5.2-codex
type: topic
---

Use this skill during tabletop play whenever a [character](../../../../../../../../content/text/glossary/terms/character.md) tries an action with uncertain outcome. The goal is to resolve the uncertainty through the game's [dice mechanic](../../../../glossary/terms/dice-mechanic.md) in a way that is fair, clear, and narratively productive.

## Inputs

- A declared character action with uncertain outcome.
- The game's resolution system (e.g., [Brave Old World](../../../../../../../../../../content/text/documents/articles/teaching-articles/references/reference-on-brave-old-world.md)'s 2d6 bands).
- Relevant character skills or [modifiers](../../../../glossary/terms/modifier.md).

## Steps

1. **Confirm the fictional action.** Make sure everyone understands what the character is trying and why it's risky. Ask clarifying questions if needed: "How are you doing this? What are you trying to achieve?"

2. **State the stakes.** Before dice are rolled, the [game master](../../../../../../../../content/text/glossary/terms/game-master.md) should communicate (at least to themselves, often aloud) what success and failure look like. In Brave Old World, the three-band system (10+, 7–9, 6−) means you also need a "success with a cost" option. Stating stakes in advance prevents retroactive narration that feels arbitrary.

3. **Identify modifiers.** Find which character skills, situational factors, or equipment apply. In Brave Old World, skills contribute −2, −1, +1, or +2. If the applicable modifier is ambiguous, resolve it through group [consensus](../../../../../../../../../../content/text/documents/articles/teaching-articles/references/reference-on-brave-old-world.md) before rolling.

4. **Roll and calculate.** The player rolls the dice, adds the modifier, and announces the total. In Brave Old World: roll 2d6 + modifier.

5. **Interpret the result.** Apply the result to the appropriate band or compare to the target number. In Brave Old World:
   - **10+**: clean success. The character achieves their goal.
   - **7–9**: success with a cost. The character achieves their goal, but something else changes — a complication, a resource spent, a new threat revealed.
   - **6−**: failure with consequences. The character doesn't achieve their goal, and the situation worsens.

6. **Narrate the outcome.** The GM describes what happens in the fiction based on the result. The narration should change the [game state](../../../../../../../../../../content/text/glossary/terms/game-state.md) in a way that creates a new situation — even failure should push the fiction forward rather than simply blocking the action.

## Outputs

- A resolved action with a narrated consequence.
- A changed fictional situation that creates new choices.

## Common pitfalls

- **Rolling when the outcome isn't uncertain.** If the character's success is guaranteed or failure is impossible, don't roll — just narrate the result. Dice resolve uncertainty, not every action.
- **Forgetting to state stakes.** If the GM doesn't know what failure looks like before the roll, the post-roll narration may feel arbitrary or punitive.
- **Narrating failure as a dead end.** "You fail" stops the fiction. "You fail and the guards are alerted" pushes the fiction forward. Failure should create new problems, not remove all options.
