---
title: WeiqIdol Product Vision
description: "Audience: the 561 Group board and future implementing agents. Owner-originated product vision from the 2026-08-29 working session, transcribed faithfully: Keya the mascot, the WeiqIdol wuxia-idol fiction layer with its AI-idol sect-recruitment mechanic, the Reigns-style noodle-bar hub loop, and the ticket-arcade idle lane with its owner-stated hard boundary. Vision and direction, not yet built or constitutionally admitted."
date-created: 2026-08-29
date-updated: 2026-08-29
type: text
authors:
  - claude-sonnet-5
keywords: ["weiqi", "product-vision", "weiqidol", "fiction-layer", "owner-direction"]
---


Provenance: this note records product vision **originated by the owner (Morgan)**, relayed verbally during the 2026-08-29 working session and transcribed here faithfully in substance by this session's agent. None of the ideas below originate with any agent; this note's authorship credit is for the transcription only. Nothing here is built, and nothing here is constitutionally admitted — it is direction for the corpus to hold, not a decision this note makes. Read alongside [Reframe and Standards](2026-08-29-note-on-reframe-and-standards.md), whose full-feature-web frame (rich AI games as first-class peers, not just "an AI opponent") this vision concretizes, and the [Weiqi Market Teardown](weiqi-market-teardown.md)'s 2026-08-29 addendum, whose ranked differentiator list is referenced by number below.

## Keya (mascot)

A turtle named Keya (Lakota: *kéya* = turtle) with a go board for a shell. Two cosmological resonances were noted in session, deliberately both held rather than one chosen: Lakota/Turtle Island (the world resting on the turtle's back) and the Chinese Luoshu (the magic-square diagram said to appear on a turtle's shell from the Luo River; oracle-bone divination was historically performed on turtle plastrons). The relationality program this section sits under is Lakota-grounded; the game itself is Chinese; the turtle image is read as belonging to both rather than as a choice between them.

Keya's role is learn-track companion and teacher, with a deliberately anti-Duolingo voice — patient, ancient, glad-you-came, no streak-shaming. "Turtle pace" is meant to describe the pedagogy, not just the character. A mascot-science research note has been commissioned separately (in the game-science section, not this one) to carry cultural-care flags for public use of a Lakota-derived name — that research is to **report** those flags, not resolve them; this note does not attempt to resolve them either.

## WeiqIdol (fiction layer over the competitive ladder)

The name was verified unclaimed in app stores and on the web as of 2026-08-29. The concept: a wuxia martial world meets idol culture, where a player's real play feeds an idol persona's renown in a jianghu fiction. Named precedents from the session: *Hikaru no Go* (Sai as a channeled idol figure, with a documented real youth-Go revival attributed to the series), Jin Yong's Go-master tropes, and VTuber/idol-media mechanics generally.

**The owner's core mechanic, recorded as stated:** a player's *play style* gets them solicited and recruited by AI idols representing different playstyle sects — the rivals scout the player, not the other way around. The engineering basis for this already exists in outline: the kernel's semantic event stream (atari, capture, connection, eye events) plus engine statistics (aggression, territory-vs-influence balance, fighting frequency) yields a style profile; sects are style archetypes (fighting/power, territorial/calm, light/fast, thick/patient, and so on); recruitment is a personalized solicitation by a named agent idol whose sect matches — or deliberately opposes — the player's profile.

AI idols are conceived as agent-peers, using the same pattern named in [Upstream Integration](2026-08-29-note-on-upstream-integration.md) for durante's `entrantKind: human | agent` distinction: named rivals with LLM voices, persistent memory of the player's games, and glossary-grounded in-character commentary — not a special-cased bot tier bolted onto a human-only game. Titles and progression are concept-mastery based (the [Weiqi Market Teardown](weiqi-market-teardown.md) addendum's ranked differentiator #4 — concept-mastery progress tracking as an alternative to ladder rating), styled in-fiction as sect ranks and techniques rather than as a bare numeric ladder. Tournament arcs run on `footing`'s daily-tournament plumbing (see [Upstream Integration](2026-08-29-note-on-upstream-integration.md)); spectating carries fan-cheering mechanics.

## The noodle bar (Reigns-style hub loop) — owner direction, "down the line"

A later addition to the same session's vision, staged as a longer-term direction rather than immediate work: the player sits at a table in a noodle bar, and opportunities arrive as cards — challenges from NPCs, invitations, events — which the player swipes left or right to deny or accept, in the manner of the game *Reigns*. Normal gameplay (actual Go) happens **outside** this loop; the noodle bar is the frame around it, not a replacement for it.

The owner's concrete recruitment-flow staging, recorded as given: the AI watches the player's style; an idol representing the house or sect that matches that style comes to the player's table in person — *"we're seeing how you play! We want you to play a match against [this other NPC]."* Recruitment and match proposals are delivered diegetically, as visitors arriving at the table, never as menu notifications or system toasts.

A session observation worth recording alongside the direction itself: the noodle bar could in principle absorb the platform's entire lobby surface — matchmaking offers, daily tournament reminders (`footing`), correspondence "your opponent moved" notices, SRS tsumego reviews coming due (delivered by Keya), arcade ticket prompts — with every system event rendered as a character arriving at the table rather than as UI chrome. The swipe interaction is native to mobile-first design, consistent with the [Weiqi Market Teardown](weiqi-market-teardown.md) addendum's table-stakes note on mobile-responsive play.

## Ticket arcade ("go-slots" idle lane) — owner direction, with an owner-stated hard boundary

A lower-effort, social-casino-style side lane: near-slot-machine-simple Go problems as idle gaming. Tickets gate play in this lane; tickets recharge over time or can be purchased.

**Hard boundary, in the owner's own words in substance: real gameplay is never gated behind tickets or purchases.** The arcade is explicitly a side lane, aimed at the — described as large — audience overlap between Go players and social-slots players, not a monetization layer over the core game. There is house precedent for this genre: the fleet already runs `gambling-trainer`, and a `gambling-services-section` exists, so this is not the organization's first contact with slot-style mechanics.

The session's guardrail for this whole vision, retained explicitly: the fiction and arcade layers are opt-in, sitting atop the serious platform rather than replacing or gating it, with transparent, non-dark-pattern monetization throughout — the [Weiqi Market Teardown](weiqi-market-teardown.md) addendum's ranked differentiator #7. This boundary is the one piece of this note that reads as a constraint rather than a feature idea, and it should be treated that way by whoever eventually implements any of the above: the ticket arcade may be built, expanded, or dropped, but it may not be built in a way that puts real gameplay behind it.
