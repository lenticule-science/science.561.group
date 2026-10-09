---
title: Upstream Integration
description: "Audience: the 561 Group board and future implementing agents. A catalog of reusable, already-built infrastructure elsewhere in the repository (cartridge, qwzspace, footing, energy-bank, oauth, replay-spectacle, TUFTE, durante's agent-peer pattern, a2a-*) with what each offers a Go platform build, and the six specific gaps nothing upstream currently fills."
date-created: 2026-08-29
date-updated: 2026-08-29
type: text
authors:
  - claude-sonnet-5
keywords: ["weiqi", "platform", "infrastructure", "upstream", "reuse"]
---


Session provenance: this note reports the findings of a 2026-08-29 infrastructure survey run by a subagent of this working session, which read the deployment chain and surveyed the wider repository (primarily the `@red-cup-engineering` scope) for reusable pieces relevant to the full feature web named in [Reframe and Standards](2026-08-29-note-on-reframe-and-standards.md). See [Platform State](2026-08-29-note-on-platform-state.md) for this section's own current apps and deployment chain; this note covers infrastructure *outside* this section that a fuller platform build would draw on.

## Reusable upstream catalog

Paths below are given relative to `lib/emsenn/services/561-group/services/` and elided with `...` through the section-nesting scaffolding, matching this session's own survey notation, since this section's own filesystem shape does not extend to these locations (out of scope for this section's link checker).

- **cartridge** (`.../computer-game-system-services-section/services/cartridge`). A manifest schema plus an intent-log/replay contract: seed → deterministic engine → intent log → server-side replay verification. This is the trust primitive a real human-v-human Play mode needs — `weiqi-kernel` is already the right shape (deterministic, event-emitting) to plug into it.
- **qwzspace** (`.../computer-game-system-services-section/services/qwzspace-services-section`). A realtime engine: fixed-tick transaction boundary over an append-only trace, first-class rooms with provenance-bound intent logging, reconnection-with-resume, replay-verifiable rooms, both browser and Node clients, tick-locked rendering. In production on aletheon, farstone, and tidepool. **Known bug**: the Node client (`client-node`) cannot do `wss://` — it only does a plaintext HTTP upgrade, so it silently hangs against TLS origins including Cloud Run; tidepool worked around this locally rather than fixing it upstream. This bug must be fixed or worked around before qwzspace can carry live human-v-human weiqi traffic over the same Cloud Run + Cloudflare chain this section already deploys through.
- **footing** (`.../computer-game-system-services-section/services/footing`). Daily-tournament plumbing, proven live on ruinfold and durante: UTC date arithmetic, submission guards, an append-only run/score/scored-lock store (file + GCS), and leaderboard ranking. Directly reusable for a daily Go puzzle or ladder feature.
- **energy-bank** (`.../computer-game-system-services-section/services/energy-bank`). Shared identity (guest + durable accounts) plus a double-entry ledger, transfer/pooling, and pluggable settlement. The closest thing to an accounts system anywhere upstream — but it has no session/cookie auth layer of its own.
- **oauth-services-section** and **google-oauth-services-section** (under the sibling `web-services-section`). A real OAuth 2.0 authorization server (dynamic client registration, PKCE, bearer validation, RFC 8414/9728 compliance) plus a Google IdP adapter. Nothing currently wires this to any game; every deployed game on the fleet, weiqi included, is anonymous/guest-only.
- **replay-spectacle**. Turns a verified `(seed, move-log)` into a single self-contained HTML replay page via TUFTE (vendored engines include ruinfold and crucible). A drop-in pattern for a Go "share this game" / SGF-viewer page.
- **web-tufte-gui-services-section (TUFTE)**. The house server-first HTML tile renderer, used by the storefront and by replay-spectacle. A document/tile renderer, not a component framework — useful for a game-record/SGF viewer page, not for the live board itself.
- **durante's `entrantKind` pattern**. durante (a MUD, part of the arnold/daleske/tsander/wheatstone terminal-framework family) exposes an agent-native `POST /runs` intent-log API alongside its human terminal, distinguishing entrants by `entrantKind: human | agent`. This is the concrete precedent for "rich AI games with AI opponents as first-class peers" named in the reframe note — not a special-cased bot, but an entrant of a different kind through the same intent-log interface a human uses.
- **a2a-* services** (roughly fifteen packages). An Agent2Agent protocol layer — agent cards, task submission, task-state custody. Not wired into any game yet; relevant if AI opponents are eventually addressed as agents in their own right rather than as an in-process bot tier.
- **card-table and parlor-kernel**. A prior kernel-plus-thin-face pattern precedent elsewhere on the fleet: a shared game-rules kernel with one or more thin presentation "faces" built against it, the same architectural shape `weiqi-kernel` plus `weiqi-web`/`weiqi-learn` already follows, independently arrived at. Worth reading before designing any new weiqi face, since the fleet has already worked through the kernel/face boundary question once.
- **Dead ends, noted so they aren't re-investigated**: `@emsenn/emsenn-web-game-services-section` and `@red-cup-engineering/web-game-services-section` are EVE Online scaffolding wrappers, not useful for weiqi.

## Gaps (nothing upstream currently provides)

1. **No production-safe realtime browser transport over TLS.** qwzspace's Node client cannot speak `wss://` — the specific bug named above.
2. **No login/session layer bridging identity to any game.** `oauth-services-section` provides real OAuth; `energy-bank` provides identity; nothing connects either to a game's session.
3. **No matchmaking/lobby primitive anywhere.** qwzspace gives rooms and ticks; footing gives daily scheduling; a pairing/queue/invite primitive does not exist upstream.
4. **No skill-rating system.** footing's leaderboards are score-based, not Elo/Glicko/kyu-dan; nothing upstream computes a rating.
5. **No reference integration of identity + realtime + ledger.** qwzspace, energy-bank, and oauth have never been wired together in one live service — unlike footing's daily-tournament pattern, which is proven twice (ruinfold, durante). A weiqi Play build integrating all three would be the first such integration in the repository, not a repeat of an existing pattern.
6. **A documented incident-class to expect.** The farstone/aletheon runbook incident log records OOM crash-loops, GCS read races, and 429 pileups under concurrent load on this same fleet pattern. Any stateful realtime weiqi addition should expect this bug class and budget for it, not treat it as novel risk specific to Go.
