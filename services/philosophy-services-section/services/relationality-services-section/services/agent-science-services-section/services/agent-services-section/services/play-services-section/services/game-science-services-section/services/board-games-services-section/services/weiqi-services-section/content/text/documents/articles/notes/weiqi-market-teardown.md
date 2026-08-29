---
title: Weiqi Market Teardown
description: "Competitive teardown of 2025-2026 mobile and browser Go apps (BadukPop, GoMagic, Tsumego Pro, OGS, Fox/Yike, AI Sensei, EasyGo, PlayGo.gg) with a feature-parity checklist for the browser-first weiqi platform. Audience: the 561 Group board and implementing agents."
date-created: 2026-08-19
date-updated: 2026-08-29
type: research
authors:
  - claude-fable-5
keywords: ["weiqi", "market-research", "platform"]
---

# Weiqi Market Teardown

Research provenance: compiled 2026-08-19 by a web-research agent; sourced with URLs inline. Companion to the Weiqi Platform Plan — this document is the Phase 2 (parity) feature spec's evidence base.

## Headline findings

1. **The differentiator is validated open territory.** No incumbent — including PlayGo.gg, the ambitious chess.com-for-Go entrant launched February 2026 — links live gameplay to contextual concept teaching. Every glossary found (Sensei's Library, GoMagic's term pages, PlayGo.gg's terms page) is a static reference the player must leave the board to consult. Glossary-linked play (the kernel recognizes atari/ko/seki as they occur and surfaces the definition in place) is claimed by nobody.
2. **The most repeated complaint across the market is "right/wrong, no why"** — tsumego apps mark answers without explaining the concept. The semantic-event layer answers this complaint by construction.
3. **Fragmentation is the opening.** OGS is play-only (AI review paywalled), GoMagic is curriculum-only (play "coming soon"), AI Sensei is analysis-only, Tsumego Pro is puzzles-only. Nobody unifies play + graded curriculum + contextual explanation + review in one browser product.
4. **Two features are near-unclaimed:** spaced repetition (only EasyGo, a niche power-user app) and personalized problems generated from your own game mistakes (only AI Sensei).
5. **OGS's mobile ergonomics are the incumbent browser weakness to not repeat:** confirm/pass button below the fold causing misclicks, no zoom/precision placement aid, no onboarding skill assessment.

## App-by-app profiles

### BadukPop (CorePlane Inc. — iOS/Android)
- **Play**: automatch online, correspondence, 9x9/13x13/19x19, spectating. **Bots**: personality AIs, 20 kyu to 7+ dan. **Tsumego**: 4,000–5,000+ pro-curated; rated + practice modes; dailies. **Lessons**: interactive, rules through tesuji. **Review**: auto AI scoring only. **Monetization**: Pro $6.99 one-time or $49.99/yr; coin packs $0.99–$39.99.
- **Complaints**: puzzle explanations don't say *why*; AI sometimes appears to violate rules it just taught; matchmaking mismatches; narrow tsumego variety (liberty-shortage-heavy).
- [App Store](https://apps.apple.com/us/app/badukpop-go/id1472684271) · [Google Play](https://play.google.com/store/apps/details?id=com.coreplane.badukpop.prod&hl=en_CA) · [negative reviews](https://appgrooves.com/app/badukpop-go-weiqi-game-by-badukpop-go-coreplane-inc/negative)

### GoMagic (gomagic.org — web + Android TWA)
- **Play**: none — "coming soon." **Tsumego**: 5,877-puzzle Skill Tree, coin gamification, daily free problem. **Lessons**: 29 interactive courses, 278 videos (~50h), rank-banded (25–15k / 12–2k / 5k–5d) — the strongest curriculum in the field. **Review**: upcoming, not shipped. **Monetization**: subs $9.90–$33.30/mo + à la carte courses $19.90–$149.90. **Glossary**: static term pages only.
- [GoMagic](https://gomagic.org/) · [Google Play](https://play.google.com/store/apps/details?id=org.gomagic.twa&hl=en_US) · [Trustpilot](https://www.trustpilot.com/review/gomagic.org)

### Tsumego Pro (LR Studios — iOS/Android)
- **Pure problems app**: 6 free daily problems, adaptive Progress mode, offline packs (a real differentiator), hints, all-valid-answer display. **No explanations** — the persistent multi-year complaint: right/wrong but never *why* (no seki/ko/life explanation); accepts only one of several valid solutions; beginner-hostile terminology.
- [App Store](https://apps.apple.com/us/app/tsumego-pro-go-problems/id892041876) · [negative reviews](https://appgrooves.com/app/tsumego-pro-go-problems-by-emmanuel-mathis/negative?load_all=1)

### OGS — online-go.com (the browser incumbent)
- **Play**: live/blitz/correspondence, all board sizes, multiple rulesets, tournaments, ladders, groups. **Bots**: ~30 graded. **Puzzles**: community-submitted, uneven curation. **Lessons**: none in-house. **Review**: KataGo AI review paywalled behind Supporter (~$10/mo historically). **Rating**: Glicko-2, respected. **Mobile**: responsive web only; PWA installability unconfirmed.
- **Complaints (the "what to beat" list)**: misclicks on phones — confirm button below the fold forces scrolling that re-selects intersections ([thread](https://forums.online-go.com/t/misclick-on-phone/30202), [thread](https://forums.online-go.com/t/problems-using-ogs-on-mobile/49128)); no zoom aid for precise placement; no onboarding skill assessment ([thread](https://forums.online-go.com/t/new-player-ogs-user-experience/38482)); confusing layout for newcomers; free tier gets weak/no AI review.
- [Support](https://online-go.com/support) · [Supporter](https://online-go.com/supporter) · [Glicko-2](https://forums.online-go.com/t/ogs-has-a-new-glicko-2-based-rating-system-2017/13058) · [goratings](https://github.com/online-go/goratings/blob/master/RatingsV6.md)

### Fox Weiqi / Yike Weiqi (China-centric incumbents)
- **Play**: 40,000+ concurrent claimed (pros included), live pro tournaments with human+AI commentary. **Unique**: photo-to-digitized-record analysis (camera at physical board) — no Western competitor has it. **Tsumego**: tens of thousands. **But**: China-region-locked in practice; heavy aggressive ads (auto-redirects, unskippable, even for paying members); iOS stability complaints.
- [Fox International](https://play.google.com/store/apps/details?id=com.foxwq.yhwqgl&hl=en_US) · [Yike](https://apps.apple.com/app/id988682022)

### AI Sensei (browser analysis service)
- **Core**: upload/import SGF → KataGo review, mistake navigation, quiz mode; **turns your own mistakes into custom practice problems** (distinctive). **Tiers by KataGo depth**: Free (10 playouts) → Basic $5.95 → Dan $11.95 → Pro $27.95/mo. **Bots**: humanlike 30k–9d. **PWA-installable** — the one incumbent doing installable-web adequately. No curriculum, no ladder.
- [AI Sensei](https://ai-sensei.com/) · [FAQ](https://ai-sensei.com/faq)

### KataGo-trainer tier (KaTrain, EasyGo, AI KataGo Tsumego)
- **KaTrain** (desktop): weakened/styled KataGo bots, costliest-mistake review with retry — the reference UX for "AI that teaches while it plays." [GitHub](https://github.com/sanderland/katrain)
- **EasyGo** (mobile): **on-device offline KataGo**, calibrated human-style ranks, 2,400+ problems, **real spaced repetition** (Fail/Hard/Easy scheduling) — the clearest SRS in any Go app. [Google Play](https://play.google.com/store/apps/details?id=com.jiaxiang.easygo)
- **AI KataGo Go: Tsumego**: 27,000+ problems. [Google Play](https://play.google.com/store/apps/details?id=com.navibarda.katago&hl=en_US)

### PlayGo.gg (launched Feb 2026 — the competitor to watch)
- Chess.com-for-Go positioning: fast matchmaking, Puzzle Run (20,000+ puzzles, boss puzzles), AI review + coaching, pro lessons, weekly cash-prize pro tournaments, rewards store; human-move heatmaps ("what would a human play here") — novel and worth matching. Static glossary with lesson links but **no live in-game concept recognition**. Experimenting with luck-based mechanics (randomized starts, powerups) that risk alienating traditional players. Web + Google Play; multilingual.
- [PlayGo.gg](https://www.playgo.gg/) · [AGA launch coverage](https://www.usgo.org/content.aspx?page_id=5&club_id=454497&item_id=131609) · [glossary](https://www.playgo.gg/learn/terms)

### Also noted
- **GoQuest**: fast 9x9/13x13 matchmaking; complaints: unskippable audio ads, fixed komi/time presets. [App Store](https://apps.apple.com/us/app/goquest/id834841918)
- **Omoyo**: AI personalities, live winrate graph, "intelligent solver" that *responds* to wrong tsumego answers in real time rather than showing the solution — a UX idea worth studying. [Omoyo](https://omoyo.app/)
- **Sensei's Library**: 26,000+ page wiki, zero play integration — confirming the open differentiator. [senseis.xmp.net](https://senseis.xmp.net/)

## Feature-parity checklist

Legend: ✅ has it · ➖ partial/weak · ❌ absent · — n/a

| Feature | BadukPop | GoMagic | Tsumego Pro | OGS | Fox/Yike | AI Sensei | EasyGo | PlayGo.gg | Classification |
|---|---|---|---|---|---|---|---|---|---|
| Live online play (matchmaking) | ✅ | ❌ | — | ✅ | ✅ | ➖ | ➖ | ✅ | **MUST-HAVE** |
| Async/correspondence play | ✅ | ❌ | — | ✅ | ➖ | ❌ | ❌ | ➖ | MUST-HAVE |
| AI bots, graded strength range | ✅ | ❌ | — | ✅ | ✅ | ✅ | ✅ | ✅ | MUST-HAVE |
| Curated graded tsumego library | ✅ | ✅ | ✅ | ➖ | ✅ | ➖ | ✅ | ✅ | MUST-HAVE |
| Structured lessons/courses | ✅ | ✅ | ❌ | ❌ | ➖ | ❌ | ➖ | ✅ | MUST-HAVE |
| AI post-game review | ➖ | ❌ | — | ✅(paywalled) | ✅ | ✅ | ✅ | ✅ | MUST-HAVE |
| Personalized problems from own mistakes | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ | ❌ | ➖ | **DIFFERENTIATOR** |
| Spaced repetition (SRS) | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ | ❌ | **DIFFERENTIATOR** |
| Streaks/dailies/gamified rewards | ➖ | ➖ | ➖ | ❌ | ➖ | ❌ | ❌ | ✅ | DIFFERENTIATOR |
| Rank/rating system | ✅ | ➖ | ✅ | ✅ | ✅ | ❌ | ✅ | ✅ | MUST-HAVE |
| Glossary / terminology reference | ❌ | ✅(static) | ❌ | ❌ | ❌ | ❌ | ❌ | ✅(static) | MUST-HAVE (baseline) |
| **Live in-game concept recognition + contextual surfacing** | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | **THE DIFFERENTIATOR — nobody has this** |
| Offline play/study | ➖ | ❌ | ✅ | ❌ | ❌ | ❌ | ✅ | ❌ | DIFFERENTIATOR |
| PWA / installable web app | ❌ | ➖ | — | ➖ | ❌ | ✅ | — | ➖ | MUST-HAVE |
| Photo/OCR of physical board | ❌ | ❌ | ❌ | ❌ | ✅ | ❌ | ❌ | ❌ | SKIP (niche for browser-first education product) |
| Tournaments/ladders | ➖ | ❌ | — | ✅ | ✅ | ❌ | — | ✅ | DIFFERENTIATOR |
| Ad-supported free tier | ➖ | ❌ | ➖ | ➖ | ✅(heavy) | ❌ | ❌ | ❌ | SKIP — ads are a top complaint everywhere |
| Multi-language / i18n | ✅ | ✅ | — | ✅ | ➖ | ➖ | ➖ | ✅ | MUST-HAVE |
| Human coaching/teacher access | ❌ | ➖ | ❌ | ❌ | ✅ | ❌ | ❌ | ✅ | DIFFERENTIATOR |
| Human-move heatmap (vs pure winrate) | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ | DIFFERENTIATOR — worth matching |

## Incumbent weaknesses (evidenced)

1. **"Right/wrong, no why"** — the single most repeated complaint (BadukPop, Tsumego Pro, and by omission everywhere). A glossary-linked engine names the concept (seki, ko threat, false eye) *at the moment of the mistake*.
2. **Mobile touch ergonomics** — OGS's below-the-fold confirm button causes misclicks; no zoom/precision aid. Browser UX debt a new platform must simply not repeat.
3. **Matchmaking/rating mismatch frustration** (BadukPop); fixed komi/time presets (GoQuest).
4. **Ads as friction** — Fox/Yike's auto-redirecting unskippable ads even for payers; GoQuest's audio ads. Avoid importing this complaint pattern.
5. **Play/learn/analyze fragmentation** — the biggest structural opening; nobody unifies all three.
6. **Paywalling exactly what helps you improve** — OGS/AI Sensei/GoMagic all gate the teaching. Free always-on contextual teaching (concept recognition, not deep KataGo search) sidesteps this resentment even if deep review is paid.
7. **China lock-out** — Fox/Yike are inaccessible/unreliable outside China, leaving the "best mainstream Go app" seat only partially filled in the West.
8. **No SRS almost anywhere** — well-understood Duolingo/Anki-style mechanics, essentially unclaimed.

## What "beat them in-browser" concretely requires

**Performance targets**: FCP < 1.8s, Speed Index < 3.4s as floor ([PWA guide](https://www.digitalapplied.com/blog/progressive-web-apps-2026-pwa-performance-guide)); sub-100ms input-to-paint on stone placement (the interaction repeated hundreds of times per session); full Lighthouse Installable + PWA-Optimized pass (HTTPS, manifest, service worker) — table stakes that most of the field fails, so passing is itself differentiating.

**Mobile-web UX**: persistent thumb-reachable action bar (never below-the-fold confirm); magnifier-on-touch / snap-to-nearest-intersection placement preview; onboarding skill assessment; offline-cached study content (tsumego, lessons, glossary) even though live play needs connectivity.

**What native still genuinely wins (architect around, don't deny)**: reliable background push (iOS web push requires home-screen install, still less reliable — correspondence "your turn" notifications will lag native); background compute (run KataGo review server-side with completion notification, never client-background); on-device offline AI at strength (offer a weaker WASM offline bot honestly rather than promising full-strength offline); OS deep integration (camera board digitization, widgets, haptics); app-store discovery (substitute SEO + streamer/pro partnerships, as PlayGo.gg does).

## Net positioning

The differentiator is confirmed open: recognize concepts live on the board and teach in place, free and always-on. But it only wins if the table stakes are also cleared — live play, graded bots, curated tsumego, Glicko-2 ratings, real PWA installability, and mobile touch ergonomics that fix what OGS visibly broke. The unclaimed adjacencies worth taking early: spaced repetition over the concept graph (the ontology already models it) and personalized problems from the player's own semantic-event history (our kernel emits exactly the evidence needed).

## 2026-08-29 Addendum

Research provenance: compiled 2026-08-29 by a web-research subagent of that day's working session, re-surveying the market ten days on. Sourced with URLs inline; the full study this addendum summarizes — every per-platform profile, quote, and source — is [Weiqi/Go App Landscape](2026-08-29-note-on-go-app-landscape.md). Findings below refine, and in places supersede on freshness, the 2026-08-19 profiles above; where the two disagree in emphasis, prefer this addendum's dates.

**PlayGo.gg is now the modern benchmark, not just a competitor to watch.** Ten days on, it remains the most ambitious rebuild-from-scratch entrant: 9/13/19 live multiplayer plus AI opponents, "Puzzle Run" (roguelike puzzle-racing with boss puzzles), move heatmaps showing most-likely human replies (marketed as unmatched elsewhere), 20,000+ puzzles with spaced repetition, daily puzzles, interactive video lessons, AI coaching, weekly cash-prize pro tournaments, an anti-cheat system, and a rewards-exchange economy. It is explicitly positioned against "the traditional way the game is presented" being "slow and inaccessible." Its gamification direction (luck-based elements live; randomized starts and variants in development) is a distinct lane from this platform's — see the Net positioning section above and this addendum's ranked list below.

**The named-unsolved gap is confirmed independently, in the practitioner community's own words.** A 2026 podcast episode (*All Things Go*, with Prof. Marius Lindhauer) is framed explicitly around "Why Creating a Great AI Go Teacher Isn't So Easy," naming human-centered AI, style-aware recommendation, and "understandable variations" as open problems. Every AI analysis tool surveyed (AI Sensei, KaTrain, Kaya, Golaxy, 321Go, Baduk AI, AhQ Go) is numeric/engine-analysis only — win-rate graphs, move suggestions, blunder flags — and **none translate KataGo-class output into natural-language, glossary-linked conceptual explanation.** This is the same differentiator the 2026-08-19 teardown identified as validated open territory; this addendum confirms it is still open and names it as an acknowledged-unsolved problem in the field's own discourse, not merely an unadvertised feature.

**Beginner-calibration pain is the single most-repeated specific complaint found across this research, on both survey passes.** OGS drops new accounts into a provisional rank (commonly ~12k/6k) with no placement question, producing years of forum threads about discouraged beginners; puzzle feedback across the market is typically bare "Incorrect" with no explanation. KaTrain and Sabaki are technical-user-only by design; BadukPop's tsumego review doesn't pause for study after solving. No incumbent surveyed pairs accurate placement with a "why" explanation tied to the glossary.

**Ratings remain fragmented with no interoperability.** A player's rank on OGS, KGS, Fox, Tygem, WBaduk, Go Quest, BadukPop, and Legend of Baduk are all separate numbers; there is no "one true rank" anywhere in the market, and nothing surveyed imports or normalizes across servers.

**Reliability is itself an underexploited differentiator.** A large share of the specific, named complaints in this pass are not about game design but about basic software reliability: Go Quest loses game state on backgrounding; Surround (OGS's iOS client) has reconnect/login/session bugs after reinstall; BadukPop has paid-but-locked-out subscription bugs with no support contact. A platform that is simply durable — sessions that survive backgrounding, no dark-pattern paywalls, correspondence games that don't die on reconnect — competes on execution quality against a field that visibly, repeatedly trips over it.

**Ranked differentiator list (this addendum's synthesis, ordered by defensibility):**

1. Unified rules-kernel + concept-graph + curriculum as one executable system — a structural moat no incumbent's architecture shares, PlayGo.gg included.
2. Glossary-grounded natural-language explanation of engine analysis — named-open, not crowded.
3. Non-punitive, accurately-calibrated beginner onboarding — answers the most-repeated complaint found in either research pass.
4. Concept-mastery progress tracking as an alternative or complement to ladder rating — sidesteps the fragmented-rating problem rather than competing with OGS/Fox network effects head-on.
5. Reliability as a feature — cheap relative to the incumbents' visible QA bar.
6. Single lightweight artifact, no install, no GPU, no Java — a distribution-friction advantage over KaTrain/Sabaki/Kaya (desktop/Electron) and KGS (Java), paired with actual play unlike AI Sensei's analysis-only zero-install model.
7. Honest, non-dark-pattern monetization — paywall friction is cited specifically and repeatedly, not as a generic "too expensive" complaint.
8. A coherent point of view distinct from both PlayGo.gg's gamification lane and AI Sensei/KaTrain's raw-numeric-analysis lane: teaching Go as Go, rigorously, through a legible glossary/curriculum fused with play.
