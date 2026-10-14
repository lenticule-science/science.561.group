---
title: Weiqi Market Teardown
description: "Competitive teardown of 2025-2026 mobile and browser Go apps (BadukPop, GoMagic, Tsumego Pro, OGS, Fox/Yike, AI Sensei, EasyGo, PlayGo.gg) with a feature-parity checklist for the browser-first weiqi platform. Audience: the 561 Group board and implementing agents."
date-created: 2026-08-19
date-updated: 2026-10-14
type: research
authors:
  - claude-fable-5
keywords: ["weiqi", "market-research", "platform"]
date: 2026-08-19
---


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

## 2026-09-04 remeasurement and MEET contract

Measured 2026-09-04 by the meet-then-beat procedure: six arenas, each read from the incumbents' live first-party surfaces and the house's live property, with an adversarial verifier per house-gap claim (89 incumbent rows, 54 confirmed gaps, 11 refuted; the identity arena's verifiers died on a session limit, so its rows stand unverified). The rows are the derived record `ni:///sha-256;c6wU9ZBVbeCLXh09H13-EfJYN-KV8lKukvtK0z_cwUs` (category `weiqi-meet-then-beat-measurement`, `data/logs/2026/09/04/`); this section states the contract the rows imply.

| arena | incumbent baseline (live) | house evidence | acceptance assay | owner and next gap |
|---|---|---|---|---|
| learn while playing | GoMagic 36 courses and 10,178 puzzles behind an account; BadukPop and Tsumego Pro paywalled, reviews ask for explanations the apps do not give; PlayGo.gg the modern benchmark | **deployed**: concept recognition at move time, no incumbent has it (re-confirmed against PlayGo.gg and BadukPop); SRS tsumego glossary-grounded; free, no account. Behind on depth: 1 of 4 lessons interactive, small tsumego set, no full-board play flow | a new player completes one interactive lesson and a full-board game with concepts named as they occur, on the live site, no account | weiqi-web: interactive lessons for the remaining three, a curated tsumego set with a stated count, full-board play against the bot |
| play, live and correspondence | OGS (Glicko-2, tournaments, ladders, 2,092,283 accounts), Fox, KGS, Pandanet, Tygem, GoQuest, PlayGo.gg all clear live, correspondence, matchmaking, ratings | **absent**: Capture Go against a scripted bot only; Play face "declared, not admitted" | two humans complete a rated 9×9 game in browsers with a kept SGF | weiqi-platform-play-service, unbuilt; the largest gap in the product and the one that keeps it out of this arena entirely |
| analysis and review | AI Sensei (free tier 10 playouts, paid tiers), KaTrain (free, local), OGS review (paid tier), Sabaki with KataGo: every one reports numbers or heatmaps, none names a mistake in words | **tested, source-only**: the Go engine client with FOUR-charged readouts, live-verified against KataGo from Guix; no review page anywhere in weiqi-web | a player uploads an SGF and receives per-move readouts with mistakes named in glossary terms, on the live site | a review face over the engine client; the beat surface no incumbent occupies |
| records, library, community | Sensei's Library 26,696 pages with position search and discussion; Waltheri pattern search over pro games; OGS library, replay, forum; GoKibitz replay and commentary | **deployed, small**: 20 compiled glossary terms with 80 links live; no game library, no replay viewer, no SGF import or export, no share links, no discussion | a player imports an SGF, replays it, and shares it by link | weiqi-web: SGF import, replay, share links over the kernel's SGF round trip; pattern search and community are later classes |
| mobile and store presence | BadukPop 4.4 stars, over a million installs, IAP; GoQuest ads; SmartGo IAP to $99; four of seven play offline | **deployed, partial**: 392 KB static, free, no account, tested touch gestures; not installable (no manifest, no service worker), no offline play | the site installs to a home screen and a puzzle completes offline in under a minute | weiqi-web: web app manifest, service worker, offline study content |
| identity, mascot, lineages | no incumbent has a mascot that teaches during play (BadukPop's Aji is decorative), none has lineages or styles as a feature, none recognizes a player's style (unverified this pass) | **source-only**: Keya, the opponent cast, the lineage graph, lineages as signatures, the Lakota hypothesis, all specified; nothing on the live site | Keya names a concept during play; a lineage recruits a player from their measured signature | weiqi-web and the signature instrument; depends on games existing (the play arena) |

BEAT hypotheses after this pass: concept recognition at move time holds (re-confirmed, deployed); concept-named review holds as an unoccupied surface (source-only); lineages as measured signatures holds against every surface checked (unverified pass, no product exists). The wedge that completes a real handoff and makes the beat more testable is the review face: SGF in, engine readouts through the FOUR envelope, mistakes named by the kernel's semantic events, on the live site. It is the smallest gap closure that no incumbent can copy without a glossary the engine executes, and it is the same instrument the research program needs for the cycle-space experiment.

## 2026-10-14 source, market and micro-earnings remeasurement

**Authority and observation level.** This revision separates **verified GitHub source**, vendor-reported market capabilities, **unmeasured player demand**, forecast hypotheses, and externally accepted customer effects. Source evidence: [current Weiqi app](https://github.com/red-cup-engineering/computer-engineering-services-section/tree/main/services/computer-systems-engineering-services-section/services/computer-game-system-services-section/services/go-engine-services-section/apps/weiqi-web), including `wrangler.jsonc`, `package.json`, `public/index.html`, `scripts/public-release-contract.mjs`, `test/play-accept-count.test.mjs`, and the upstream [weiqi-engine](https://github.com/red-cup-engineering/computer-engineering-services-section/tree/main/services/computer-systems-engineering-services-section/services/computer-game-system-services-section/services/weiqi-engine). The September 4 measured-gap table above is historical: its “no normal play,” “no replay,” and “not installable” source assessments must **not** be copied as the October state. This pass observed normal 9/13/19 local play, 5 local bot tiers, SGF/replay, a 44-problem SRS tutor, keyboard/mobile gestures and an installable static PWA **in source**. Their production health and usage are not implied.

The real static Worker defines `weiqi.561.group`; on 2026-10-14 Red Cup source added the requested `weiqi.play.561.group` as a second custom domain, with independent public-release probes for both. The old origin remains. The [Worker custom-domain contract](https://developers.cloudflare.com/workers/configuration/routing/custom-domains/) permits multiple hostnames when the zone and existing DNS permit, but source change is not DNS issuance, deployment or a successful player session. A standalone online-match Worker exists only in a separate unpublished configuration. No live WebSocket match, account, rating, award ledger or ZBD account was established by this investigation.

### Market requirements, segmented by job

| Market/job | Externally evidenced alternative | Minimum *meet* experiment | Defensible *beat* experiment |
|---|---|---|---|
| New Go learner | [BadukPop](https://badukpop.com/), [GoMagic](https://gomagic.org/), [Tsumego Pro](https://apps.apple.com/us/app/tsumego-pro-go-problems/id892041876) | Eligible first-time players discover and finish a rules-valid 9×9 game and a graded puzzle without an account | Randomized comparison of concept-linked feedback against simple correct/incorrect feedback: actual comprehension, return visit and transfer to a fresh puzzle |
| Returning Go player | [Online Go Server](https://online-go.com/), [GoQuest](https://apps.apple.com/us/app/goquest/id834841918), [PlayGo.gg](https://www.playgo.gg/) | Correct SGF import/export, resume, timed board interaction and an independently completed human–human 9×9 match | Lower verified abandonment, lower illegal/mis-touch move rate, superior explainable review at equal browser and inference cost |
| Idle/casual player | Real idle games and reward-supported casual games compete for session time; their value proposition is not the rules of Go | Disclose optional passive progression and a user-controlled pause; do not count a passive tick as an earned legal move or a player victory | Validated learning or useful independently consented computation during idle cycles at lower time/battery/network cost than the alternatives |
| Eligible micro-earner | [ZBD Earn](https://zbdpay.com/blog/zbd-earn-boosting-ltv-with-embedded-rewards) offers game-native real-value rewards to supported studios | Show explicit sponsor funding, cash value, rate/limit/eligibility, then independently reconcile one sandbox accrued award through an adverse duplicate and withdrawal scenario | Among consenting eligible people, more **net** reliably delivered value with lower confusing claims, payout failure, abuse and player time than comparator rewarded games |
| Creator/host | ZBD's [2026-08-24 embedded financial stack](https://zbdpay.com/blog/introducing-zbds-embedded-financial-infrastructure-for-games) names accounts, pay-ins, payouts, marketplace/creator payments; availability is conditional | One verifiable rights-cleared paid tournament, lesson, tutoring session or commissioned game analysis, with funded payer and identified recipient | Lower transaction/support cost, higher repeat value and dependable fulfillment than paid lessons or prize-only engagement |

**Recheck rather than inherit assertions.** The August feature table predates several competitor and house releases, and vendor marketing is not a blinded usability trial. In particular the 2026-08-29 addendum itself says PlayGo.gg advertises spaced repetition, contrary to the original table. The claims that *no* incumbent offers a given concept feature and that any category is “validated open” must be treated as falsifiable competitor-survey hypotheses. ZBD reports 60+ game integrations and a TapNation *Idle Bank* case study with 142% relative D14 retention uplift and 44.4% ARPDAU uplift [in its own announcement](https://zbdpay.com/blog/introducing-zbds-embedded-financial-infrastructure-for-games); these are provider-reported observations from another title, **not** demand forecasts or causal effects for Weiqi. The zero-denominator state for our measured active users, revenue and cashouts remains **unknown**, not zero and not a forecast.

### Observation protocol for market demand and forecasting

A **market requirement** has a provenance-linked external job, buyer, circumstance and acceptance test. A **demand observation** requires a real qualified person or sponsor taking a costly/committal action, with a denominator; clicks alone are attention, not demand. A **forecast** is a dated prediction made with only data available before its target window. Record separately and without personal identifiers by default: served/usable public-host encounters, newcomer task attempts and completions, seven-day eligible return cohorts, normal-game completions, SGF exports, concept-understanding checks, idle opt-ins/pauses, explicit purchase or sponsor quotes, eligible payout commitments and independently confirmed settlements. Decline invasive tracking when player consent is absent; make anonymous on-device progress useful without network transfer.

For each segment, predeclare a daily/weekly cohort window, eligible exposure denominator, geographic/provider-eligible share, seasonality, opt-out share and first-party observation provenance. Score one-step and multi-step forecasts against (a) a no-growth/base-rate model and (b) a cohort-seasonal model before accepting extra predictors. For retention and conversion, use calibrated probabilities and Brier/log scoring on chronological holdouts; for revenue and payout liability, use absolute error and predictive interval coverage; for cohorts with few events, report wide uncertainty or “insufficient evidence,” not a spurious precision estimate. Reject leakage from later game/payout events into earlier forecasts. Independently reproduce at least one held-out forecast with its exact as-of dataset and loss calculation. Distinguish *prediction* from randomized intervention effect for a reward.

Two different economic outcomes must be forecast rather than conflated:

- **Enterprise incremental contribution** per measured cohort: actual collectible incremental sales, ads where separately consented, sponsoring and paid work **minus** rewards earned, provider/network fees, compute, identity/anti-abuse, infrastructure, support, taxes/charges and unresolved liability. The minimum acceptable lower confidence/prediction bound and operating stop-loss are declared *before* spending. No forced ad attention or inflation of game skill.
- **Player actual net earnings**: received transferable value minus unavoidable payout charges, conversion effects, privacy cost where material and required time/attention. The earned balance is a liability until legitimately discharged; no “earn BTC” claim from client state, test balances, points, pending claims or screenshots.

### BTC Lightning, ZBD and upstream conformance

Read [ZBD's official integration guide](https://zbd.dev/rewards/knowledge-base/rewarded-play/integrating), [API authentication and sandbox](https://zbd.dev/api-reference/introduction), and [2026 embedded-finance product conditions](https://zbdpay.com/blog/introducing-zbds-embedded-financial-infrastructure-for-games) before selecting a provider operation. The vendor requires project keys and unwithdrawn player balances on the server, not in browser state. Available countries, ages, identity verification, product-specific licensing and access to still-limited products are gates, not assumptions. ZBD may perform payment-side diligence, but publisher duties arising from game mechanics still apply. Lightning network settlement, provider-held player balance, an internal award ledger, an in-game score, and the source of an economic obligation are **different things**.

Apply the existing typed game session/Cartridge event and economic/ledger machinery rather than a second game's private wallet or localStorage claim. Proposed event chain: rule-valid accomplishment → verified *distinct* person/actor or contracted contributor → uniquely identified earning entitlement backed by authorized money → reserved liability → authorized server-side provider request → provider acceptance → settled transaction/transfer → beneficiary receipt → account and treasury reconciliation; every transition idempotent with explicit reversal/failure states. Device/game telemetry cannot supply identity or creditor authority. Keep private keys only in a secrets-capable server boundary, use exact Bitcoin units (integer millisatoshis where specified), reject duplicate/replayed events and stale eligibility, and enforce daily and lifetime loss limits. Sandbox proves only integration behavior, never funded player receipt.

The present static, accountless Weiqi PWA can provide **honest Go play and study without reward issuance**. Introduce funded micro-earning only through a qualified existing organizational server and provider contract with verified eligibility, permitted data rights, capital source, agreed mechanics, abuse tests and independent receiving. An idle-mode experiment can first be nonmonetary and voluntary; introducing a balance or extra mechanics is not a substitute for demonstrated incremental player or enterprise value.

**Demand-led admission order:** (1) independently receive the requested public hostname and a completed accessible legal game; (2) measure cohorts and compare the strongest incumbent onboarding/review task; (3) run an optional idle-learning task with cost and comprehension measurement; (4) obtain supplier/merchant eligibility and funded sponsor demand for ZBD/Lightning; (5) qualify award idempotency, reserves and sandbox/payout failure cases; (6) trial one capped real transaction with independent payer and recipient settlement evidence; (7) scale only where a preregistered lower-bound contribution and player-value requirement is met. Each rung is a consumer acceptance claim, not a code-completion status.

