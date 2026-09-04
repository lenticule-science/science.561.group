---
title: Reframe and Standards
description: "Audience: the 561 Group board and future implementing agents. Records the owner's 2026-08-29 course correction (the attention-collapse diagnosis and the full-feature-web reframe) and the standards decisions made under it, so neither is lost to the next session that reads the platform plan or the constitutions without this context."
date-created: 2026-08-29
date-updated: 2026-08-29
type: text
authors:
  - claude-sonnet-5
keywords: ["weiqi", "platform", "governance", "standards", "reframe"]
---


Session provenance: this note records a 2026-08-29 owner directive, relayed to and synthesized by this working session with subagent research support. It is a companion to [Platform State](2026-08-29-note-on-platform-state.md) and [Upstream Integration](2026-08-29-note-on-upstream-integration.md), written the same day from the same session.

## The attention-collapse correction

The owner's framing, binding for this note and for how the [Weiqi Platform Plan](weiqi-platform-plan.md), the constitutions, and prior session transcripts should now be read: this section's current "documentation first" center of gravity — the corpus, the glossary, the lesson curriculum, the doctrine checker, and the constitutions written about all of the above — is an artifact of AI attention budget, not a considered product decision. One exemplary feature strand got mistaken for the product itself.

The founding insight survives this correction: "the engine is the executable form of the glossary." But it survives as one strand in a full feature web, not as the definition of the platform. Readers of the plan, the constitutions, or the board-decision gates should treat those documents as written from inside the collapsed frame. They are not thereby wrong, and they are not to be silently overridden either — they are to be re-evaluated against the full-product frame below, with disagreements flagged rather than resolved unilaterally by whichever agent next touches this section.

## The full feature web (the product)

The product this section is building toward is not a Learn app with a rules kernel underneath. It is the following, as one web, none of it optional by default:

- **Human-v-human play**, both live/real-time and correspondence (asynchronous), with matchmaking and ratings.
- **Rich AI games** — multiple engine strengths, distinct styles/personalities, and teaching modes, not merely "an AI opponent" at one fixed strength.
- **AI analysis/review**, KataGo-class, both post-game and in-study.
- **The learn track and glossary concept graph**, fused with play — the strand that already exists, now understood as serving the game rather than replacing it as the product.
- **Game records**: an SGF library, sharing, and a replay/viewer.
- **9/13/19 boards**, mobile-friendly play, and the full table-stakes bar identified by this session's competitive-landscape research (see the [Weiqi Market Teardown](weiqi-market-teardown.md) and its 2026-08-29 addendum).

The goal remains unchanged in kind: meet, then beat, the current store Go apps. What changes is that "meet" now names a much wider bar than the Phase-1 Learn slice this section has so far built.

## Consequence for existing gates

The constitutions and the platform plan's "board decisions requested" gates (see [Platform State](2026-08-29-note-on-platform-state.md), "Open decision gates") were written from inside the collapsed frame. They are not treated as immovable by this note. In particular:

- **Education-first sequencing** (the plan's gate 5, "Phase 1 [Learn] before multiplayer [Play]") is recorded here as **superseded by owner direction, pending board ratification.** The plan's own Phase-2 Play admission gate — "must refuse to admit the Play face until Phase 1 has shipped and the board has separately authorized Phase 2" — is the specific mechanism this supersession targets; no board ratification of the supersession has yet been recorded, so the constitutional gate itself is unchanged pending that ratification. This note documents the direction, not a completed amendment.
- The kernel constitution, the platform constitution, and the Learn and LSP constitutions are not otherwise touched by this note. They stand as written; this note only flags that their framing should be read against the full-feature-web frame above when a future session next revises them.

## Standards decided this session

RMN is the house's universal weiqi language (the house never adopts one
canonical format unless it is a core house protocol, and RMN is one such
protocol — `.claude/skills/build-the-semiotic-language-model/SKILL.md`,
"RMN is one language, not a compatibility brand"): house weiqi notation —
this corpus's diagram fences, `expected:` blocks, and any future notation —
is RMN, and round-trips through it. SGF FF[4], GTP (Go Text Protocol), and
the KataGo JSON analysis protocol are outside formats, read and written for
interchange with the world's engines and servers — SGF at the position-
interchange boundary, GTP at the engine-play boundary, KataGo's JSON at the
analysis boundary — none of them canonical; a position, a move, or an
analysis result crossing one of those boundaries round-trips through RMN.

## weiqi-lsp refit direction (proposed, not yet authorized)

`apps/weiqi-lsp` is, as built and as specified, a doctrine/content checker for this section's own corpus — diagram legality, `expected:` blocks, SGF-block, link, frontmatter, and app-data conformance against the kernel — mislabeled by its package name as a Go language server. See [Platform State](2026-08-29-note-on-platform-state.md) for the verified detail of what it actually does.

The direction proposed this session, **gated on review and amendment of the [Weiqi LSP Constitution](weiqi-lsp-constitution.md)** and not yet authorized: refit `weiqi-lsp` toward a real language server for SGF and the house diagram notation — diagnostics driven by kernel legality, hover/go-to-definition driven by the glossary concept graph, the way an actual LSP serves an actual data language. The existing checker core is not discarded under this direction; it survives as a rule family within the refit server, or is renamed to something honest about what it is (e.g. `weiqi-doctrine-check`) if it is kept as a separate tool. This is a proposal recorded for the constitution's own amendment process to take up, applying the reframe in this note's first section — not a decision this note makes unilaterally.
