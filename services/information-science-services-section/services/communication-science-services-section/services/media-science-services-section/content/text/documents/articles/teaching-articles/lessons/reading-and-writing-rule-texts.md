---
title: "Reading and Writing Rule Texts"
type: "lesson"
date-created: 2026-03-01
description: "Audience: readers transitioning from players to teachers, editors, or designers."
---

Learning objectives

- rule text
- rule writing
- playtesting
- executable prose

Prerequisites

- /games/topics/card-games/curricula/variants-rulesets-and-house-rules.md

Table of contents

- [Rule text as executable prose](#rule-text-as-executable-prose)

- [The six-section structure](#the-six-section-structure)

- [Writing principles](#writing-principles)

- [Worked example: rewriting an ambiguous rule](#worked-example-rewriting-an-ambiguous-rule)

- [Playtesting for rule text](#playtesting-for-rule-text)

- [Version control](#version-control)

- [Exercises](#exercises)

- [Completing the sequence](#completing-the-sequence)

Audience: readers transitioning from [players](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/services/gaming-services-section/content/text/glossary/terms/player.md) to teachers, editors, or designers.

Learning goal: produce rule text that is unambiguous, testable, and teachable — and read existing rule texts critically enough to identify gaps before they cause confusion at the table.

Prerequisites: you should understand how variants and house rules modify gameplay ([Variants, Rulesets, and House Rules](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/services/gaming-services-section/services/card-games-services-section/content/text/documents/articles/teaching-articles/tutorials/variants-rulesets-and-house-rules.md)), because rule writing is the skill of expressing game design precisely enough that readers don&rsquo;t accidentally create unintended variants.

## Rule text as executable prose

A strong rule document is executable prose: a reader should be able to set up, [play](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/content/text/glossary/terms/play.md), and score a full round without asking for missing steps and without inventing rules to fill gaps. This is a high standard. Most published card game rules fail it — they rely on shared cultural knowledge (&ldquo;deal the cards&rdquo; assumes you know what dealing looks like), prior experience with similar games, or the presence of an experienced player to clarify ambiguities.

The goal of this lesson isn&rsquo;t to eliminate all ambiguity — natural language can&rsquo;t achieve that — but to develop the habit of noticing where ambiguity exists and deciding whether it matters. Some ambiguity is harmless (&ldquo;shuffle well&rdquo; is imprecise but functional). Some ambiguity is game-breaking (&ldquo;play continues until someone wins&rdquo; without defining what winning means).

## The six-section structure

A practical rule-text order that covers most [card games](../../research/2026/07/31/lenticule-import/library/arts/ludics/games/index.md):

- **Parts and player counts.** What materials are needed? How many players? Are there partnerships? This section answers: &ldquo;Can we play this game right now with what we have?&rdquo;

- **Setup.** How is the [deck](../../../../../../../../../../../philosophy-services-section/content/text/glossary/terms/deck.md) prepared? Are cards removed? How are cards distributed? Is there a [draw pile](../../../../../../../../../../../philosophy-services-section/content/text/glossary/terms/draw-pile.md)? A [discard pile](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/services/gaming-services-section/services/card-games-services-section/content/text/glossary/terms/discard-pile.md)? Who goes first? This section transforms a pile of materials into a ready-to-play [game state](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/services/gaming-services-section/content/text/glossary/terms/game-state.md).

- **Turn structure and legal actions.** What can a player do on their [turn](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/services/gaming-services-section/content/text/glossary/terms/turn.md)? In what order? What constraints apply (e.g., must [follow suit](../../../../../../../../../../../philosophy-services-section/content/text/glossary/terms/follow-suit.md))? When does a turn end? This is the core of the document — the section readers will reference most often during play.

- **Resolution rules for conflicts and edge cases.** Who wins a [trick](../../../../../../../../../../../philosophy-services-section/content/text/glossary/terms/trick.md)? What happens when two cards tie? What if a player can&rsquo;t make a legal move? What if someone plays illegally and it&rsquo;s discovered later? This section answers the questions that arise at the table when something unexpected happens.

- **Scoring and end conditions.** How are points calculated? When does a round end? When does the game end? How is a winner determined? This section defines the [win condition](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/services/gaming-services-section/content/text/glossary/terms/win-condition.md) and everything needed to evaluate it.

- **Optional variants.** Recognized modifications to the base rules, documented as patches (see [Variants, Rulesets, and House Rules](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/services/gaming-services-section/services/card-games-services-section/content/text/documents/articles/teaching-articles/tutorials/variants-rulesets-and-house-rules.md)). Separating variants from core rules prevents confusion about which rules are required and which are optional.

## Writing principles

**Prefer explicit verbs over implied intention.** &ldquo;Draw one card from the draw pile and add it to your hand&rdquo; is clearer than &ldquo;refresh your hand.&rdquo; &ldquo;The player to the dealer&rsquo;s left leads the first trick&rdquo; is clearer than &ldquo;someone starts.&rdquo;

**Name the actor.** Every procedural statement should identify who performs the action. &ldquo;The dealer shuffles the deck&rdquo; rather than &ldquo;the deck is shuffled.&rdquo; &ldquo;Each player, starting with the lead player and proceeding clockwise, plays one card&rdquo; rather than &ldquo;cards are played in turn.&rdquo;

**Define overloaded terms once.** If the game uses [trick](../../../../../../../../../../../philosophy-services-section/content/text/glossary/terms/trick.md), [trump](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/services/gaming-services-section/services/card-games-services-section/content/text/glossary/terms/trump.md), [meld](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/services/gaming-services-section/services/card-games-services-section/content/text/glossary/terms/meld.md), or any term with a specific local meaning, define it on first use and use it consistently thereafter. Do not alternate between &ldquo;trick&rdquo; and &ldquo;round&rdquo; if they mean different things.

**Specify timing.** When can an action be taken? &ldquo;Before the first trick&rdquo; is different from &ldquo;before your first turn&rdquo; is different from &ldquo;at the start of each round.&rdquo; Ambiguous timing is one of the most common sources of rule disputes.

## Worked example: rewriting an ambiguous rule

**Original**: &ldquo;If you can&rsquo;t follow suit, play whatever you want.&rdquo;

This is functional but imprecise. It doesn&rsquo;t specify: can you play [trump](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/services/gaming-services-section/services/card-games-services-section/content/text/glossary/terms/trump.md)? Must you play trump if you have it? Is there a penalty for not following suit?

**Revised**: &ldquo;If you hold no cards of the led [suit](../../../../../../../../../../../philosophy-services-section/content/text/glossary/terms/suit.md), you may play any card from your [hand](../../../../../../../../../../../philosophy-services-section/content/text/glossary/terms/hand.md), including a trump card. There is no requirement to play trump when void in the led suit, and no penalty for discarding an off-suit non-trump card.&rdquo;

The revision is longer but eliminates the ambiguity that commonly splits tables into two camps: those who think you *must* play trump when void, and those who think you may play anything. By explicitly stating both the permission (may play any card) and the non-requirements (no obligation to trump, no penalty for discarding), the rule text preempts the argument.

## Playtesting for rule text

Playtesting for rule text is different from playtesting for balance. Balance testing asks &ldquo;is this game fair and fun?&rdquo; Rule-text testing asks &ldquo;can a new reader run this game correctly from the document alone?&rdquo;

The method: give the document to readers who have never played the game. Watch them set up and play without answering questions. Note every moment where they:

- **Pause** — they are looking for information that isn&rsquo;t where they expect it.

- **Diverge** — two readers interpret the same rule differently.

- **Invent** — they fill a gap with a rule that isn&rsquo;t in the document.

Each of these moments reveals a defect in the text. Pauses suggest poor information architecture (the rule exists but is hard to find). Divergences reveal genuine ambiguity (the rule can be read two ways). Inventions reveal missing rules (a situation the document doesn&rsquo;t address).

Fix the text, not the players. If two careful readers interpret a rule differently, the rule is ambiguous — it doesn&rsquo;t matter which interpretation you intended.

## Version control

Maintain versioned revisions. When you change a rule, label the update and summarize what changed. This protects analysis notes from drift — if you wrote a strategy guide under version 1.2 of the rules, it remains valid for 1.2 even after 1.3 changes the scoring. Version control also makes variant documentation more precise: &ldquo;we play version 1.1 with the following patches&rdquo; is unambiguous.

## Exercises

- Find a rule text for a card game you know (a rulebook, a web page, a printed insert). Identify one rule that a new player would likely misinterpret. Rewrite it using the principles above: name the actor, specify the timing, and resolve the ambiguity.

- Write a complete rule text (all declared required sections) for a simple card game — War, Snap, or a game of your invention. Keep it under 500 words. Then give it to someone unfamiliar with the game and watch them play. Note where they pause, diverge, or invent.

## Completing the sequence

This lesson concludes the card games curriculum sequence. The six lessons have moved from orientation ([Card Games Overview](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/services/gaming-services-section/services/card-games-services-section/content/text/documents/articles/teaching-articles/tutorials/card-games-overview.md)), through mechanical analysis ([Core Mechanics](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/services/gaming-services-section/services/card-games-services-section/content/text/documents/articles/teaching-articles/tutorials/core-mechanics-and-turn-structure.md), [Hidden Information](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/services/gaming-services-section/services/card-games-services-section/content/text/documents/articles/teaching-articles/tutorials/hidden-information-and-inference.md), [Scoring](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/services/gaming-services-section/services/card-games-services-section/content/text/documents/articles/teaching-articles/tutorials/scoring-variants-and-game-balance.md)), to intervention ([Variants](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/services/gaming-services-section/services/card-games-services-section/content/text/documents/articles/teaching-articles/tutorials/variants-rulesets-and-house-rules.md)) and production (this lesson). The reference materials — [Card Games History](../../research/2026/07/31/lenticule-import/library/arts/ludics/games/archive/card-games-history.md) and [Card Games Genealogy](../../research/2026/07/31/lenticule-import/library/arts/ludics/games/archive/card-games-genealogy.md) — provide historical and genealogical context that enriches any of the analytical skills developed in the sequence.
