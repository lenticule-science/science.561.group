---
title: Weiqi/Go App Landscape
description: "Audience: the 561 Group board and future implementing agents. The full 2026 competitive-landscape study of Go/Weiqi/Baduk platforms (OGS, KGS, Fox/Tygem/WBaduk, BadukPop, Go Quest, AI Sensei, KaTrain, Sabaki/Kaya, GoMagic, PlayGo.gg, Legend of Baduk) with per-platform evidence and sources, the cross-platform pain-point analysis, the AI-era openings, and the ranked differentiator list this session's Weiqi Market Teardown addendum summarizes. This note is the full study; the addendum is the summary."
date-created: 2026-08-29
date-updated: 2026-08-29
type: research
authors:
  - claude-sonnet-5
keywords: ["weiqi", "market-research", "platform", "competitive-landscape"]
---


Research provenance: compiled 2026-08-29 by a web-research subagent of this working session (search and fetch queried live 2026-08-29; citations inline where a specific claim traces to a specific source). This is the full study behind the [Weiqi Market Teardown](weiqi-market-teardown.md)'s 2026-08-29 addendum, which summarizes it; this note carries every platform profile, quote, and source the addendum condenses. See also [Reframe and Standards](2026-08-29-note-on-reframe-and-standards.md) for how this research's ranked differentiators feed the owner's full-feature-web direction, and [Go-Science History](2026-08-29-note-on-goscience-history.md) §6 for how the platform's own concept-recognition claim was independently re-checked against this same market.

---

## 1. Platform-by-platform notes

### OGS — online-go.com
- **Platform**: Web (responsive), 3rd-party iOS client "Surround," Android via wrapped web/PWA.
- **Play modes**: Live, correspondence (asynchronous, many-simultaneous-games), vs-AI (KataGo-backed bots), 9/13/19 boards, handicap, custom rulesets (Japanese/Chinese/AGA/etc.), variants.
- **Rating**: Glicko-2-based rating system (introduced 2017), converted to kyu/dan display. New accounts start **provisional at ~12k/6k** which is a recurring beginner complaint (see pain points).
- **Teaching/curriculum**: Built-in puzzle collection, joseki explorer (OGS Joseki), groups, ladders, tournaments; no structured curriculum — mostly community-run classes/groups.
- **AI analysis**: KataGo integrated directly into the game review UI (free, rate-limited); this is one of OGS's strongest features — analysis without leaving the site.
- **Price**: Free with ads; "Supporter" subscription ~**$60/year** (or monthly) removes ads and raises AI-review limits. [forums.online-go.com]
- **Reputation/pain points**:
  - Largest, most active English-speaking server ("very similar to chess.com for chess enthusiasts") — network effect is its core moat. [alternativeto.net]
  - Long-running forum threads: *"A compendium of beginners getting discouraged and confused by OGS's new accounts are 12k design"* and *"New player OGS user experience"* — new players are dropped into a provisional rank with no calibration question, then get stomped or become confused about why a move was "Incorrect" in a puzzle without explanation. [forums.online-go.com]
  - Rating-system disputes are a perennial forum topic (handicap miscalculation history, volatility complaints).
  - Surround (iOS client) reviews: reconnection/loading bugs, AI-opponent access buried behind "add as friend," push notifications gated behind a paywall despite being the core value-prop for correspondence players, login/session bugs after reinstall — but praised for clean design otherwise. [App Store reviews via forums.online-go.com/GitHub]

### KGS — gokgs.com
- **Platform**: Java client only (major friction point in 2026 — Java is essentially dead on consumer machines) — no modern mobile app.
- **Play modes**: Live, some correspondence, ranked/unranked, teaching-game and review rooms historically strong.
- **Rating**: Long-standing, well-respected rank system (pre-dates Glicko adoption elsewhere) but stagnant.
- **Teaching/curriculum**: Historically excellent (organized teaching ladder, pro reviews, "Teaching Ladder"), but this ecosystem has faded as population declined.
- **AI analysis**: None built-in.
- **Price**: Free; owned/operated by the American Go Foundation (nonprofit) since 2017.
- **Reputation/pain points**: Described on its own forums as **"frozen in time... no growth, no effort from AGF to fix that, and a slowly (or not so slowly) evaporating user base."** Population decline traces back to ~2016, after the AlphaGo interest spike faded. Java requirement is explicitly cited as a barrier — new/casual users "get frustrated trying to get Java to let them play." Western beginners now default to OGS; strong players default to Tygem/WBaduk; KGS is left without a clear audience. [lifein19x19.com, forums.online-go.com]

### Fox Weiqi (弈城) / Tygem / WBaduk
- **Platform**: Native desktop clients (Windows-first — WBaduk's official client is Windows-only), mobile apps in native languages; **WeiqiHub** and **miniFox** are notable 3rd-party cross-platform clients (Mac/Windows/Linux/iOS/Android) that wrap Fox/Tygem/OGS into one modern UI. [weiqi.soumyak4.in, Medium/denverscrub]
- **Play modes**: Live (fast matchmaking — ~10 sec queue at 6k as of 2025), ranked ladders, some correspondence.
- **Rating**: Server-internal ranks, generally considered "harder"/more accurately calibrated than Western servers because of huge East-Asian populations at all levels.
- **Teaching/curriculum**: WBaduk noted for an extensive life-and-death (tsumego) problem library; otherwise minimal built-in teaching.
- **AI analysis**: Limited/none natively; done via 3rd-party tools.
- **Price**: Mostly free to play; some premium/VIP tiers on the Korean/Chinese originals.
- **Reputation/pain points**: **Fox and Tygem are described as "the only servers with a significant player base"** for competitive/strong play in 2025 — i.e., much of the rest of the ecosystem is a long tail around these two. WBaduk's interface is called "outdated and not very intuitive." Language barrier (Korean/Chinese-first UI) is the main friction for Western players; third-party clients exist specifically to paper over this. [Medium/denverscrub, gomagic.org]

### BadukPop
- **Platform**: iOS + Android (mobile-first, gamified/cartoon art style).
- **Play modes**: vs-AI (20 kyu to 7+ dan, including a "full-power neural-network AI"), online multiplayer.
- **Rating**: Internal kyu/dan progression tied to app rank, not interoperable with other servers.
- **Teaching/curriculum**: Its strongest feature — structured interactive lessons beginner→advanced, 4,000–5,000+ curated tsumego problems from pro players, explicit concept lessons (eye shapes, ko, tactics).
- **AI analysis**: Built-in AI opponents across strength levels; not a general game-review/analysis tool in the AI Sensei/KataGo sense.
- **Price**: Freemium — core content free, subscription for full content; 4.8/5 rating, 900K+ downloads.
- **Reputation/pain points**: Generally well-reviewed for onboarding/tutorial quality and puzzle depth, but recurring complaints: subscription paid-but-locked-out bugs (Apple confirms active subscription, app won't unlock; "restore purchase" broken, no support contact), board only occupies ~2/3 of screen (cramped mobile UI), tsumego review doesn't give time to study the position after solving, and subscription pricing seen as steep by some users. [AppGrooves, App Store reviews]

### Go Quest
- **Platform**: iOS + Android + web.
- **Play modes**: Live only (fast, "quick games"), 9/13/19 boards, spectate live games, "Tsumego Challenge" — auto-leveled puzzle stream with a scored solving mode.
- **Rating**: Internal, tuned for fast casual matchmaking.
- **Teaching/curriculum**: Minimal beyond the tsumego challenge mode; not a lesson platform.
- **AI analysis**: None notable.
- **Price**: Entirely free — "all features are available for free," no monetization friction (unusual among mobile competitors).
- **Reputation/pain points**: Praised as "addicting" and a good re-entry point for lapsed players and total beginners (one reviewer "learned to play Go after knowing nothing" via the app). But recurring, fairly serious bug: **games/state reset if you background or exit the app mid-session**, i.e. poor app-lifecycle handling — a persistent complaint as of 2026. [Google Play reviews]

### AI Sensei
- **Platform**: Browser-based (works on any device, no install, no local GPU needed — server-side KataGo).
- **Play modes**: Not a play server — pure post-game analysis/review + training tool. Imports SGF or games directly from Pandanet, Tygem, WBaduk, OGS.
- **Rating**: N/A (no ladder); reports player level based on analysis accuracy needs.
- **Teaching/curriculum**: "Training Mode" — save mistake positions and drill them with spaced-repetition scheduling ("flashcards for Go"); Quiz Mode, Challenge Mode. Mistake-driven, not a structured beginner curriculum.
- **AI analysis**: Core product. Runs KataGo (upgraded to KataGo's transformer-large network) server-side; highlights blunders, suggests better moves, shows variations.
- **Price**: 4 tiers — Free (10 playouts/~4-move variations, can misread complex life-and-death), **Basic $5.95/mo**, **Dan $11.95/mo**, **Pro $27.95/mo** (4,000 playouts, ~18-move variations). [ai-sensei.com/faq]
- **Reputation/pain points**: Sparse public review base; what exists is thin/mixed and hard to generalize from (search results conflated with an unrelated "Sensei AI" interview-coaching product — sign that its brand/SEO footprint is still small). Functionally well-regarded within the Go community as the default free/cheap KataGo-review tool, competing directly with self-hosted KaTrain for people who don't want to install anything.

### KaTrain (KataGo-based desktop tool)
- **Platform**: Desktop (Windows/Mac/Linux), installer bundles KataGo so no separate download needed; also `pipx install katrain`.
- **Play modes**: vs-AI only, with **deliberately weakened bot personalities/styles** (not just full-strength KataGo) so players can play at their level; immediate move-by-move feedback on mistakes during play (not just post-game).
- **Rating**: N/A — local tool, no ladder.
- **Teaching/curriculum**: Auto-generates focused SGF reviews highlighting the biggest mistakes; positions itself as the easiest on-ramp to serious AI-assisted improvement for non-technical users.
- **AI analysis**: Full KataGo integration, most configurable of the consumer tools (network selection, visit count, etc.).
- **Price**: Free, open source (github.com/sanderland/katrain).
- **Reputation/pain points**: Considered the gold-standard free tool for serious self-study; still requires an install and is desktop-only (no official mobile/web version), which is the main adoption barrier relative to AI Sensei's zero-install browser approach.

### Sabaki / Kaya (open-source SGF editors with engine hookup)
- Sabaki: Electron-based, free/open-source SGF editor; acts as a GTP front-end for any engine (KataGo, Leela Zero) — powerful but requires manual engine setup, aimed at technical users.
- Kaya: newer, free/open-source, cross-platform (incl. web), built-in KataGo-via-ONNX analysis (live win rate, move suggestions, full-game review) plus **board recognition from photos** — notable feature not common elsewhere.
- Both are "bring your own understanding" tools — raw analysis, zero pedagogy/curriculum layer.

### GoMagic (gomagic.org) — learn-Go site
- **Platform**: Web + Android app (Play Store since Jan 2025).
- **Play modes**: Not a play server (has a small internal "league" but focus is learning); links out to OGS etc. for play.
- **Rating**: N/A / league-based, not a full Elo ladder.
- **Teaching/curriculum**: Its core product — structured step-by-step interactive courses (17 courses), short video lessons + quizzes ("skill checks"), problem sets, articles, plus **live 1:1 lessons with a human instructor**.
- **AI analysis**: Publishes guides on installing KataGo/Leela Zero yourself; not a first-party AI review tool.
- **Price**: Freemium — basics free; **Premium $9.90–$33.30/mo**, **Gold ~$55 for 3 months / full 17-course access**, individual lessons **$50/90 min**; 30-day money-back guarantee.
- **Reputation/pain points**: Positive reviews for lesson clarity and pacing ("enjoyable... easy to understand concepts and skill checks"), but price is clearly premium-positioned relative to free competitors (BadukPop, AI Sensei free tier, Go Quest) — a paywall-heavy structured-curriculum product in a market full of free alternatives.

### AI-era newcomers

- **PlayGo.gg** — launched Feb 2025 (initial JP/KR focus, per one source; a separate source says official global launch Feb 9 2026 — dates conflict across sources, treat launch as "2025–2026"). Most ambitious attempt found in this research to rebuild a Go platform from scratch around modern game-design + AI. Features: 9/13/19 live multiplayer + AI opponents, **"Puzzle Run"** (roguelike puzzle-racing mode with full-board "boss" puzzles and random bonuses), **move heatmaps showing most-likely human moves** (explicitly marketed as a feature "no other Go platform offers"), 20,000+ puzzles with spaced repetition, daily puzzles, interactive video lessons, AI coaching/personalized learning recommendations, weekly pro tournaments with cash prizes, anti-cheat detection, a rewards-exchange economy (points → books/lessons/tournament entries), gamification mechanics (luck-based elements live; randomized starting positions and new variants in development), founded by Matthew & Nathan Harwit (Go players) + Kevin Wang (AI/software engineer). Explicitly positions itself against "the traditional way the game is presented" being "slow and inaccessible to new audiences." [usgo.org, playgo.gg] This is the single most direct incumbent-disruption competitor for a new platform to benchmark against.
- **Legend of Baduk** (Korea Baduk Association, official body) — mobile app (iOS/Android), gamified beginner path: 80 levels from 30 kyu→15 kyu, "real-time capturing" arcade-like variant instead of turn-based-only, Training Grounds, Tower of Trials, avatar/board cosmetics, beginner-tuned AI bots. Reviews positive on engagement but note an uneven difficulty curve (timed challenges get hard fast; AI jumps from random to sophisticated quickly). Notable as an official national-federation-backed gamified beginner product, validating that direction.
- **LLM-based teaching/commentary**: Despite extensive searching, **no mature, widely-adopted LLM-based natural-language Go commentary/teaching product was found as of August 2026.** The clearest evidence of the gap: a podcast (*All Things Go*, episode with Prof. Marius Lindhauer) is *explicitly framed around* "Why Creating a Great AI Go Teacher Isn't So Easy" — discussing human-centered AI, style-aware recommendation, and "understandable variations" as unsolved problems, i.e., practitioners are actively naming this as an open, unsolved space rather than a shipped feature. Existing "AI" teaching tools (AI Sensei, KaTrain, BadukPop, Golaxy, 321Go, Baduk AI, AhQ Go) are all **numeric/engine-analysis tools** (win-rate graphs, move suggestions, blunder flags) — none translate KataGo output into natural-language conceptual explanation tied to a glossary/curriculum. This is a real, currently-open gap. [allthingsgogame.alitu.com]
- Chinese AI training tool **Golaxy** (web + Android) is popular in the Chinese-speaking market for AI training but has near-zero footprint in English-language discourse — a language/UX localization gap for Western users.

---

## 2. Synthesis

### A. TABLE-STAKES (the "meet" bar — every serious 2026 platform has these)
1. **9×13×19 board sizes**, standard rulesets (Chinese/Japanese/AGA scoring), handicap & komi configuration.
2. **SGF import/export** and a reviewable game record / move tree.
3. **A numeric rating system** (Glicko-2 or equivalent) mapped to familiar kyu/dan labels, with live and/or correspondence ladders.
4. **Live + correspondence (async) play**, since correspondence is how most adult hobbyists sustain multiple games around work/life.
5. **vs-AI play at multiple strength levels** (not just full-strength engine — genuinely weakened/styled bots for realistic practice).
6. **Mobile-responsive or native mobile board UI** — anything web-only-desktop is now a competitive disadvantage.
7. **Basic puzzle/tsumego library.**
8. **Spectating / observing live games.**
9. **Free tier that's actually usable** — every platform in this space that gates *core* play behind a paywall gets punished in reviews; monetization has converged on ad-supported-or-subscription-for-extras, not pay-to-play.
10. **Some engine-based post-game analysis**, even if bolted on via KataGo — users now expect a "review this game" button somewhere in the ecosystem (if not first-party, they'll route through AI Sensei/KaTrain).

### B. WIDESPREAD PAIN POINTS (cross-platform complaint patterns)
1. **Broken/absent beginner calibration.** OGS drops new accounts into a provisional rank with zero placement question, producing years of forum threads about discouraged beginners getting crushed or confused by unexplained "Incorrect" puzzle feedback. This is the single most-repeated specific complaint found in this research.
2. **Fragmented, non-portable identity/rating.** A player's rank on OGS, KGS, Fox, Tygem, WBaduk, Go Quest, BadukPop, and Legend of Baduk are all separate numbers with no interop — there is no "one true rank," which especially confuses newcomers trying to gauge their own level.
3. **Aging, undermaintained platforms with no innovation velocity.** KGS is the extreme case — literally "frozen in time," Java-gated, population "evaporating" — but it illustrates the fate of any Go platform that stops shipping: strong-player-only servers (Fox/Tygem/WBaduk) survive on raw population/liquidity despite dated, non-English-first UIs; nothing else has kept up with modern web/mobile UX expectations.
4. **Monetization friction disproportionate to value delivered.** Recurring pattern across BadukPop (paid-but-locked-out subscription bugs, no support contact), Surround/OGS (push notifications — the literal core value prop of correspondence play — gated behind a separate paywall), GoMagic (premium-priced structured курс in a market full of free competitors). Users are willing to pay for real teaching/analysis value but are repeatedly burned by subscription bugs or value-misaligned paywalls (cosmetics fine, core mechanics/notifications not fine).
5. **Mobile app fragility / state loss.** Go Quest loses game state on backgrounding; Surround has reconnect/login/session bugs. Async, session-based games are especially punished by this class of bug because a lost session can mean a lost multi-day correspondence game.
6. **Numeric-only "AI help" that doesn't teach.** Every AI analysis tool (AI Sensei, KaTrain, Kaya, Golaxy, 321Go) surfaces win-rate/score/variation — none translate that into conceptual, glossary-linked natural-language explanation. Practitioners in the space (see the *All Things Go* podcast framing) explicitly acknowledge this as unsolved, not just under-marketed.
7. **Language/localization silos.** The strongest competitive populations (Fox, Tygem, WBaduk, Golaxy) are Korean/Chinese-first, spawning a cottage industry of third-party wrapper clients (WeiqiHub, miniFox) just to make them usable for English speakers — a persistent, unresolved friction rather than a solved problem.
8. **Curriculum without curated depth-of-progression, or depth without curriculum.** Structured-lesson products (BadukPop, GoMagic, Legend of Baduk) are pedagogically strong but disconnected from live play/rating and from deep engine analysis; deep-analysis tools (AI Sensei, KaTrain) have no curriculum at all. Nobody has unified "learn the concept" → "see the concept graded by the engine" → "play/drill it live" into one loop.

### C. AI-ERA OPENINGS (where KataGo-class engines + LLMs create room incumbents haven't filled)
1. **Engine output translated into a persistent, structured glossary rather than ephemeral win-rate numbers.** Today's tools (AI Sensei, KaTrain, Kaya) treat every review as a one-off: numbers appear, you close the tab, nothing is retained as reusable *concept* vocabulary. No incumbent treats "this was a bad shape because it's a variant of concept X" as a first-class, cross-referenceable object.
2. **A rules kernel that *is* the pedagogy, not a bolt-on.** Every current teaching product (BadukPop, GoMagic, Legend of Baduk) hand-authors lesson content separately from the actual rules/scoring engine, and every analysis tool (AI Sensei, KaTrain) runs a rules engine with zero pedagogical awareness. Nobody has unified these — which is exactly the gap a "the engine is the executable form of the glossary" doctrine targets. This is architecturally distinct from "add explanations to KataGo output" (which is the closest existing approximation, e.g. what AI Sensei/KaTrain could theoretically add) — it means the concept graph and the rules kernel share one source of truth, so a lesson, a puzzle, and a live-game annotation can never drift out of sync with each other, something no incumbent's architecture guarantees.
3. **LLM-mediated natural-language explanation of engine analysis is explicitly an open, unsolved problem in the community's own words** (the *All Things Go* podcast frames it as "why creating a great AI Go teacher isn't so easy"), not a crowded feature. A platform that ships even a modest, glossary-grounded natural-language layer over KataGo output — rather than raw score/winrate — is filling a named gap, not competing head-on with a mature incumbent feature.
4. **Beginner calibration and non-punitive onboarding.** Given how consistently "confusing/discouraging beginner experience" recurs (OGS's provisional-rank problem, KaTrain/Sabaki's technical-user-only framing, BadukPop's cramped-mobile/broken-tsumego-review complaints), an onboarding flow that actually places a new player correctly and explains *why* a move was wrong (glossary-linked) rather than emitting bare "Incorrect" is a clear, evidenced opening — not a guess.
5. **Portable, interoperable identity/rating** — nobody has solved the fragmented-rating problem; a platform that either imports/normalizes ratings from OGS/KGS/Fox or that de-emphasizes ladder-rank in favor of concept-mastery tracking (a legible alternative to Elo/Glicko that ties directly to the glossary/curriculum) sidesteps a problem every incumbent has left unsolved.
6. **Reliable, boring engineering** as a differentiator. Given how many complaints in this research are *not* about game-design (state loss on backgrounding, paywalled-but-broken subscriptions, reconnect bugs, login bugs) but about basic software reliability, a platform that is simply solid — offline-tolerant correspondence play, no dark-pattern paywalls, sessions that don't die — competes on execution quality against a field that visibly struggles with it, independent of any AI story.
7. **Zero-dependency, self-contained architecture** as both a technical and trust differentiator: most incumbents rely on either server-side heavyweight engines (AI Sensei), Java runtimes (KGS), Electron bundles (Sabaki/Kaya), or native per-OS clients (WBaduk) — a genuinely lightweight, no-install, no-GPU, single-artifact web platform is differentiated on distribution friction alone, on top of whatever pedagogy it offers.

### D. RANKED DIFFERENTIATORS a small zero-dep web platform could realistically win on
1. **Unified rules-kernel + concept-graph + curriculum as one executable system** (the core doctrine) — no incumbent's architecture does this; it's a structural moat, not a feature that can be bolted onto AI Sensei or BadukPop without a rewrite.
2. **Glossary-grounded natural-language explanation of engine analysis** — take KataGo-class output and connect it to named, cross-referenced concepts instead of bare win-rate deltas; explicitly named as unsolved by practitioners, not a crowded space.
3. **Non-punitive, accurately-calibrated beginner onboarding** — placement instead of provisional-12k-and-pray; "why" explanations instead of bare Correct/Incorrect — directly answers the most-repeated specific complaint found across OGS forums and BadukPop reviews.
4. **Concept-mastery progress tracking as an alternative (or complement) to ladder rating** — sidesteps the fragmented-rating-across-servers problem entirely rather than trying to compete with OGS/Fox network effects on raw ladder liquidity, which a new small platform cannot win head-on anyway.
5. **Reliability as a feature**: durable correspondence sessions, no reconnect/login bugs, no paywalled-but-broken subscriptions — cheap to achieve relative to the incumbents' apparent QA bar, and it's a bar competitors have repeatedly tripped over publicly (BadukPop, Surround, Go Quest all have open, specific bug complaints of exactly this kind).
6. **Single lightweight artifact, no install, no GPU, no Java** — distribution-friction advantage over KaTrain/Sabaki/Kaya (desktop/Electron) and KGS (Java), competitive with AI Sensei's zero-install browser model but pairing it with play (not just review), which AI Sensei doesn't offer.
7. **Honest, non-dark-pattern monetization** — given how frequently paywall friction is cited as a specific pain point (not "too expensive" in the abstract, but "paid and still locked out," "the one feature I need is behind an extra paywall"), a transparent free-core / clearly-scoped-paid-extras model is itself a reputational differentiator in this market.
8. **A coherent point of view / voice**, differentiating from both the "gamify everything" direction PlayGo.gg is pursuing (roguelike puzzle runs, luck mechanics, cosmetics economy) and the "raw numeric analysis" direction of AI Sensei/KaTrain — a platform that teaches Go *as Go*, rigorously, through a legible glossary/curriculum, is a distinct third lane neither major 2025–2026 mover (PlayGo.gg = gamification, AI Sensei = raw analysis) occupies.

This ranked list is what the [Weiqi Market Teardown](weiqi-market-teardown.md)'s 2026-08-29 addendum reproduces in summary form as its own "ranked differentiator list"; the two are the same eight items, cross-referenced from [WeiqIdol Product Vision](2026-08-29-note-on-weiqidol-product-vision.md) by number (#4 concept-mastery, #7 honest monetization) for that vision's own use of this research.

---

## Sources consulted (non-exhaustive; queried via web search/fetch 2026-08-29)
- forums.online-go.com (multiple threads: rating system, beginner experience, KGS status, Surround client)
- online-go.com / online-go.com/supporter
- gokgs.com, lifein19x19.com (KGS discussion)
- Medium (@denverscrub — Fox/Tygem/WBaduk 2025 firsthand account; @gomagic — Top-7 servers, course reviews)
- weiqi.soumyak4.in (Weiqi/Baduk Online Resources 2026 roadmap; AI for Go/Baduk/Weiqi roadmap)
- gomagic.org (Online Go Servers guide, KataGo/Leela Zero install guide, lessons/pricing pages)
- ai-sensei.com (homepage, FAQ, news)
- github.com/sanderland/katrain (README), forums.online-go.com KaTrain thread
- sabaki.yichuanshen.de, github.com/SabakiHQ/Sabaki, kayago.app
- badukpop.com, App Store / Google Play listings and reviews, AppGrooves negative-reviews aggregator
- play.google.com (Go Quest / GoQuest listing and reviews), appbrain.com
- apps.apple.com (Surround, Legend of Baduk listings)
- usgo.org (American Go Association coverage of PlayGo.gg launch, Legend of Baduk English release)
- playgo.gg (homepage, blog nav)
- allthingsgogame.alitu.com (podcast episode framing "why a great AI Go teacher isn't easy")
- toolerific.ai, github.com/kaya-go/kaya (Kaya tool)
