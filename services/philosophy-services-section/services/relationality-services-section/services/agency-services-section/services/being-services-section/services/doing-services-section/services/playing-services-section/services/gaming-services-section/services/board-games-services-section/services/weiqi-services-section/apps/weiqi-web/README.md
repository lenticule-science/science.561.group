# weiqi-web

`@lenticule-science/weiqi-web` — the web face for `weiqi-services-section`: **Play** (a normal 9x9
game against a local heuristic AI), **Tsumego** (a graded,
kernel-verified problem trainer with spaced-repetition review), **Learn** (an interactive lesson
player), **Read** (the compiled glossary). Static and client-side, with one exact-pinned rules
owner, per
[the Weiqi Platform Plan](../../content/text/documents/articles/notes/weiqi-platform-plan.md) —
"no accounts, no server state, deployable exactly like 561.group." All rules authority stays with
[`@red-cup-engineering/weiqi-engine`](../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/computer-game-system-services-section/services/weiqi-engine/README.md); this app renders what the engine
computes and never reimplements legality, scoring, or event recognition.

The local game is an ordered, versioned engine session rather than page-owned
mutable board state. Play can download that session as standard SGF, so a game
started here has a portable record for replay or analysis elsewhere.

Phase 1 shipped correctness (the complete Capture Go / lesson / glossary slice). A first Polish
pass then shipped real stone presence and board texture, a misclick-resistant touch model with a
magnified drag preview, synthesized sound, and a live concept-recognition toast strip. **This
build is the "give the experience something to play" pass** per the owner's 2026-08-19 mandate —
"we really are looking to meet or beat real games... that sort of polish, once we get our engines
and interfaces done right, is CHEAP": a real tsumego trainer with 44 kernel-verified problems and
vendored SRS scheduling, the onboarding ladder turned into an actual ladder (rungs, saved progress,
per-rung intro copy from this section's own corpus, celebration on clearing one), and two new honest
bot tiers (liberty-counting, simple-influence) above the existing random/greedy pair — closing gaps
the [market teardown](../../content/text/documents/articles/notes/weiqi-market-teardown.md) (the
misclick complaints, live concept recognition confirmed unclaimed by any competitor, SRS +
personalized problems near-unclaimed) and the
[platform plan](../../content/text/documents/articles/notes/weiqi-platform-plan.md)'s phase ladder
identified, without adding a single dependency.

## Running it

```
npm run build   # run the kernel's browser projection -> public/js/kernel/*.mjs, compile glossary markdown -> public/data/glossary.json
npm run check   # check-mts.mjs: a real TS+JS syntax gate for test/*.test.mts (see its own doc comment)
npm run serve   # node scripts/serve.mjs -- static file server over ./public, http://localhost:8080/
npm test        # npm run check, then node --test 'test/*.test.mts'
```

Run `npm run build` once before the first `npm run serve`, and again after updating the
exact-pinned kernel or when `../../content/text/glossary/terms/*.md` changes — both
`public/js/kernel/` and `public/data/glossary.json` are build products, not hand-edited source.
Everything else in `public/` is served as-is; there is no bundler and no other build step.

## Deploy

weiqi-web is its own Cloudflare Worker (`wrangler.jsonc` in this directory), serving
`public/` straight off disk via a Workers static-assets binding -- no Cloud Run origin,
no proxy through the shared `cloudflare-router` (per the 2026-08-31 GCP exit ruling: GCP
billing is permanently off, and the Cloud Run game fleet is migration inventory, not
outage). `.assetsignore` excludes everything that is not `public/` (source, tests,
scripts, package files, this README).

```
npm run build     # regenerate public/js/kernel/ and public/data/glossary.json first
npm run deploy    # wrangler deploy
```

`custom_domain: true` in `wrangler.jsonc` attaches `weiqi.561.group` and provisions its
DNS record. `npm run dev` runs `wrangler dev` for a local preview of the deployed shape.
`npm run serve` (`scripts/serve.mjs`) remains a plain `node:http` dev/test convenience
only; it is never what production serves.

## File tree

```
apps/weiqi-web/
  package.json           @lenticule-science/weiqi-web, scripts: build / check / test / serve /
                          deploy / dev
  wrangler.jsonc          own Cloudflare Worker: assets.directory ./public, custom_domain route
                          for weiqi.561.group (see "Deploy" above)
  .assetsignore           excludes everything under this directory that is not public/ from the
                          deployed Worker's static-assets upload
  check-mts.mjs           vendored verbatim from flickering-delve-service/check-mts.mjs (house
                          doctrine: vendor a copy, not a live cross-service import) -- a real
                          TS-syntax + JS-syntax gate for .mts files that `node --check` alone
                          leaves open; see the file's own doc comment for why
  README.md               this file
  scripts/
    build-kernel.mjs       invokes the exact-pinned kernel's browser projection -> public/js/kernel/
    build-glossary.mjs     compiles ../../content/text/glossary/terms/*.md -> public/data/glossary.json
                            (title, definition, elaboration, related terms) -- a small targeted
                            frontmatter/markdown extraction, not a general parser
    serve.mjs              node:http static file server over public/, sandboxed to that directory
  test/
    smoke.test.mts          node --test: imports the exact-pinned kernel and the bot
                            (../public/js/bot.mjs), plays 100 capture-go
                            self-play games (random-legal Black vs. greedy-capture White),
                            asserting the kernel never rejects a bot-chosen move
    stone-variance.test.mts DOM-free rendering-purity coverage: deterministic-hash.mjs and
                            stone-variance.mjs are pure functions of board position, tested
                            directly -- the "same position -> same bytes" guarantee board.mjs's
                            stone jitter/shadow/sheen rendering depends on
    touch-gesture.test.mts  the touch state machine (touch-gesture.mjs), driven directly with
                            synthetic coordinate/insideBoard sequences -- no browser, no DOM
    concept-tiers.test.mts  the event-toast tier-filtering rule (concept-tiers.mjs) against the
                            kernel's real SemanticEventType union
    bot-ladder.test.mts     the two new bot tiers (Watchful/liberty-counting, Reaching/influence),
                            driven against the real kernel across 800 seeded self-play games total
                            (200 each x 4 pairings/sizes) asserting no move is ever rejected, plus
                            two hand-built positions checking Watchful's actual priority order
    srs-parity.test.mts     srs.mjs against its own published-constant derivations (FACTOR from
                            DECAY, the R(t=S)=0.9 identity, determinism, monotonicity, STAGE_CUTS)
    tsumego-data.test.mts   machine verification of public/data/tsumego.json against the real
                            kernel -- every problem's accept line replays legally and actually
                            achieves its stated goal (see "Tsumego trainer" below)
    ladder-progress.test.mts  the onboarding ladder's unlock rule (ladder-progress.mjs), pure
    tsumego-deck.test.mts   the tsumego trainer's deck-filter and SRS due-selection logic
                            (tsumego-deck.mjs), pure
  public/                  everything here is exactly what gets served/deployed
    index.html              the four-face landing page (Play / Learn / Tsumego / Read)
    play.html               the Capture Go onboarding ladder
    tsumego.html             the tsumego trainer
    learn.html               the lesson player
    glossary.html            the Read face
    css/
      theme.css              page + board theme, CSS custom properties throughout; also owns the
                              board's animation keyframes, magnifier, concept-toast, ladder, and
                              tsumego-trainer styling -- game-owned craft per house doctrine
      shelf-chrome.css        vendored verbatim from sites/play.561.group/chrome/shelf-chrome.css
                              (byte-identical body, diffed against the source this build);
                              this build also corrected the shelf-mark SVG markup in all five pages'
                              header+footer (index/play/tsumego/learn/glossary.html), which still
                              carried a stale pre-Cowrie glyph (a rounded-rect "PB" shape) instead
                              of the current cowrie-shell mark (ellipse + toothed aperture line) --
                              the CSS file itself was already correct, only the HTML markup was stale
    data/
      glossary.json           BUILD PRODUCT (see build-glossary.mjs)
      lesson-weiqi-overview.json   hand-authored step data for the Weiqi Overview lesson
      ladder-rungs.json       the onboarding ladder's rung table: board size + bot tier id + a
                              verbatim intro-copy excerpt from this section's own lesson/glossary
                              corpus per rung (see "Capture Go ladder" below)
      tsumego.json            44 hand-authored, kernel-verified tsumego problems (see "Tsumego
                              trainer" below) -- BUILD-ADJACENT: hand-authored, but every problem
                              in it is re-verified by test/tsumego-data.test.mts on every test run
    js/
      board.mjs               the SVG board component (ES module, no custom-element registration)
      stone-variance.mjs       pure, DOM-free: deterministic per-stone visual jitter/sheen, seeded
                                from (col, row, size) -- no Math.random anywhere in rendering
      deterministic-hash.mjs   the pure integer hash stone-variance.mjs (and sound.mjs's pitch
                                wobble) are built on
      touch-gesture.mjs        pure, DOM-free: the touch input state machine (drag-to-place with
                                magnifier, or tap-then-confirm) -- board.mjs is its only DOM caller
      concept-tiers.mjs        pure, DOM-free: which semantic events toast, at which settings tier
      sound.mjs                WebAudio-synthesized stone click / capture clatter / atari alert /
                                game-end chime / byo-yomi tick (scaffolding); zero sample files
      concept-toast.mjs        the on-board toast strip (DOM layer over concept-tiers.mjs's rule)
      bot.mjs                  the four-tier bot ladder (see "Bot ladder" below), kernel-agnostic
      srs.mjs                  FSRS-lite scheduler, vendored verbatim from lantern-service's
                                srs.mts (see the file's own provenance header)
      ladder-progress.mjs      pure, DOM-free: the onboarding ladder's unlock rule
      tsumego-deck.mjs         pure, DOM-free: tsumego deck filtering + SRS due-card selection
      hover-card.mjs           the shared glossary hover-card component
      play-app.mjs             page glue for play.html (the onboarding ladder)
      tsumego-app.mjs          page glue for tsumego.html (the trainer)
      learn-app.mjs            page glue for learn.html
      glossary-app.mjs         page glue for glossary.html
      kernel/                  BUILD PRODUCT (from the exact-pinned kernel's shared browser projection)
```

## The board component (`public/js/board.mjs`)

A pure SVG renderer plus input-gesture recognizer; it imports nothing from the kernel and knows
nothing about game rules — callers hand it a `Uint8Array` board (the kernel's own `Position.board`
layout works directly) and a legality-checker callback. It imports two sibling presentation
helpers, `stone-variance.mjs` and `touch-gesture.mjs`, factored out specifically so their logic is
unit-testable without a DOM; neither knows anything about SVG, the kernel, or rules.

**Board beauty** (Experience Brief item 1):

- **Dimensional stones**: each stone is a radial-gradient-filled circle (a "slate" gradient for
  Black, a "shell" gradient for White) plus a blurred contact shadow and a rotated glossy sheen
  highlight — three visual layers per stone, all through one shared gradient/filter definition per
  color (not per stone), so a full 19x19 board's 361 stones cost two gradients and one shadow
  filter, not 722.
- **Deterministic per-stone variance**: position jitter, size variation, and sheen-highlight angle
  are all seeded from `(col, row, size)` via `stone-variance.mjs`'s pure hash — never
  `Math.random`. The same board position renders to the same variance every time (see
  `test/stone-variance.test.mts`), which is what makes "same position → same bytes" a real,
  checked guarantee rather than an aspiration.
- **Board ground**: a warm kaya-toned field with deterministic wood-grain texture (SVG
  `feTurbulence` with a fixed `seed` — the SVG spec's own reference algorithm, reproducible, not
  random) tinted to the board's own `--board-wood-line` color, plus a soft vignette for depth.
  Traditional stone/cell proportions are unchanged (stone diameter ≈ 92% of cell spacing).
- **Placement + capture animation**: `setPosition` diffs against the previously rendered board
  (not a full `innerHTML` wipe) so only stones that actually changed animate — new stones
  scale+fade in, captured stones lift+fade out. `prefers-reduced-motion` is honored (no CSS
  animation runs; changes apply instantly). A stone captured while its own placement animation is
  still in flight has that animation cleared first, so two CSS animations never compete for the
  same properties on one element.
- **Last-move + ko markers**: the last-move square outline is unchanged; a new ko marker (a
  diamond outline — a distinct SHAPE, not a recolored square) renders at the kernel's
  `activeKoPoint` when a caller sets it via `setKoPoint(coord)`, with a gentle pulse
  (reduced-motion gated).
- **Territory shading**: `setTerritory(map)` renders translucent black/white squares for a scoring
  view. Built and tested as a rendering capability, but **not wired into any page** — capture-go
  never reaches scoring (Phase 1 scope), so there is no scoring view yet to call it from. A future
  Phase 2/3 scoring UI calls into this rather than building its own overlay.

**Touch model** (Experience Brief item 2 — the teardown's #1 competitor weakness, OGS misclicks):

- **Drag-to-place with a magnifier** (default): press and drag across the board; a magnified
  preview (an SVG `<use>` live-mirroring the same board content, not a second render pass) follows
  above the finger, offset so the fingertip never hides the point it's about to place. Release
  *inside* the board commits at the nearest intersection; release *outside* (or a pointercancel)
  cancels with nothing played — the actual fix for a fat-finger overshoot, not just a bigger hit
  target.
- **Tap-then-confirm** (explicit toggle, for the cautious): the original gesture, now with a
  visible **Cancel** control — previously the only way out of a pending tap was tapping elsewhere
  to move the preview; there was no way to simply back out.
- **Pinch-zoom + pan** on boards ≥13×13: two fingers scale/pan a CSS transform on the board SVG;
  `#nearestPoint`'s hit-testing already reads the live (post-transform) bounding rect, so placement
  accuracy is unaffected by zoom level. While zoomed, a single finger pans; a small-movement single
  touch is still treated as a precise tap-to-place.
- **Hit targets**: `#nearestPoint` always snaps to the *nearest* board intersection regardless of
  exact contact position — this is the effective hit-target guarantee (generous and constant
  regardless of visual stone size at any zoom level), stronger than a fixed-radius invisible circle
  per point would be on a crowded 19x19. Interactive controls (Cancel, Reset zoom) are ≥44×44 CSS
  px per mobile guidance.
- **Both gesture models are unit-tested as a pure state machine** — `touch-gesture.mjs`, driven
  directly with synthetic coordinate sequences in `test/touch-gesture.test.mts`, no DOM.
- **Keyboard navigation** is unchanged and complete: arrow keys move a focus cursor, Enter/Space
  places a stone.

**Other existing board behavior, unchanged**: sizes 7/9/13/19 via symmetry-derived star points;
hover ghost stone on desktop pointer devices (semi-transparent preview, or a dashed
forbidden-ring-with-slash when illegal — shape-coded, not color-only); semantic-event badge layer
(glyph+color+hoverable `<title>` per event, exported as `EVENT_GLYPHS`/`getEventGlyph` so
play-app.mjs's toast strip draws from the same table, not a second copy); theme entirely via CSS
custom properties; screen-reader `aria-live` announcements for moves, cursor position, illegal
attempts, and touch state; no color-only signals anywhere.

## Sound (`public/js/sound.mjs`) — Experience Brief item 3

Zero-dep, WebAudio-synthesized, no sample files: a short percussive stone click (triangle
oscillator + filtered noise burst, pitch wobble seeded from the played coordinate), a capture
"clatter" (a scattered run of clicks, one per captured stone, capped at 7), a soft two-tone atari
alert, a closing three-note chime at game end, and a low countdown-tick primitive
(`playTick(urgent)`) scaffolded for byo-yomi timing but not yet wired to any UI, since byo-yomi
itself doesn't exist yet. Muting is persisted in `localStorage`; the very first run on a device
that has never set a preference here defaults muted if `prefers-reduced-motion: reduce` is set —
this app has no way to distinguish "reduced motion" from "reduced everything" without asking, and
treats the one signal it has as covering both until the user explicitly toggles sound in Settings.

## Live concept recognition (`public/js/concept-toast.mjs` + `concept-tiers.mjs`) — item 4

The confirmed, still-unclaimed differentiator (market teardown finding #1): as `Game.play()`
fires real semantic events, a calm, non-blocking toast strip names the concept — same wording as
the event log, same hoverable glossary term (`[data-term]`, wired through the shared
`GlossaryHoverCard`) — near the board, auto-dismissing after ~4.8s or on hover/focus pause. Three
settings tiers, persisted in `localStorage`:

- **Beginner** (default): every toastable event.
- **Intermediate**: only the "rare," structurally-interesting events (ko, connection, eye
  formation) — an intermediate player already recognizes atari/capture on sight, so those are
  dropped to avoid nagging.
- **Off**: no toasts. Board badges and the event log are unaffected by this setting.

`pass`/`game-ended` are never toasted at any tier (too frequent to be a "concept moment"), and
`group-killed` is folded into its accompanying `capture` toast rather than doubling up on the same
move. The tier rule itself is pure, DOM-free logic (`concept-tiers.mjs`), tested directly in
`test/concept-tiers.test.mts` against the kernel's real `SemanticEventType` union — a regression
test fails loudly if the kernel ever adds an event type this module hasn't made a deliberate
toast/no-toast decision about.

**Honest scope, unchanged from Phase 1**: this is still proven only in the narrowest slice —
7×7 capture-go, where atari/capture are common and ko/connection/eye-formed are structurally rare
or impossible (the game ends at first capture). There is still no post-game concept-event
timeline (the data already exists per-move via `game.moveEvents`; building the view is future
work, not blocked on anything). `cut`, `false-eye`, `seki`, and `group-settled` remain
deliberately unimplemented in the kernel (see `events.mts`'s own doc comment) — this app never
implies coverage those events don't have.

## Capture Go ladder (`public/js/play-app.mjs` + `public/data/ladder-rungs.json`)

`japanese` ruleset (simple ko, illegal suicide — komi/scoring are irrelevant, since the game ends
the instant either side captures). Black is always the human player. What was a single fixed 7×7
game against the greedy-capture bot is now a **four-rung onboarding ladder**, each rung pairing a
board size with one tier from the bot ladder below:

| # | Rung | Board | Bot | Cleared by |
| - | --- | --- | --- | --- |
| 1 | First Captures | 7×7 | Wandering (random-legal) | beating it once |
| 2 | Taking What's Offered | 7×7 | Grabby (greedy-capture) | beating it once |
| 3 | Wider Board | 9×9 | Reaching (influence heuristic) | beating it once |
| 4 | Mind Your Liberties | 9×9 | Watchful (liberty-counting) | beating it once |

**Order verified, not assumed**: a 240-game round-robin across all four tiers (20 games/pair,
colors alternated, `japanese` ruleset, 9×9 — see the polish-pass verification session) found
Watchful beats Reaching in roughly 39 of 40 head-to-head games, robustly across 7×7/9×9/13×13, not
the other way around — the two tiers were originally ordered the other way (Watchful at rung 3,
Reaching at rung 4), which meant the "final," hardest-implied rung was actually a measurably
*weaker* opponent than the one before it, contradicting this file's own "gets smarter each rung"
line above. Watchful and Reaching swapped rungs (and Mind Your Liberties moved to 9×9, so board
size stays non-decreasing across the ladder) to make the ladder's difficulty order match what the
bots actually do against each other, not just their code-comment ordering in `bot.mjs`. The full
verified strength order is `random < greedy < influence < liberty` — `bot.mjs`'s own `BOT_TIERS`
array keeps its original `random`/`greedy`/`liberty`/`influence` order (an id-keyed lookup table,
order-independent for `play-app.mjs`'s `BOT_TIERS.find(...)`) and its own doc comments already
hedge against reading that array as a calibrated strength ladder; the ladder's *play order* is what
actually needed to change.

- **Progress persistence**: clearing a rung (winning it as Black) saves that rung's id to
  `localStorage` (`weiqi-ladder-progress`) via `ladder-progress.mjs` — pure unlock-rule logic, unit
  tested (`test/ladder-progress.test.mts`), imported by both the reader (which rungs render
  unlocked) and the writer (marking a new clear) so they can never disagree. Rungs unlock strictly
  in order; nothing already unlocked is ever re-locked, and replaying an already-cleared rung is
  always allowed.
- **Per-rung intro copy**: each rung's intro panel is a **verbatim excerpt** from this section's own
  lesson/glossary corpus (`weiqi-overview.md`, `atari.md`, `capture.md`, `liberty.md` — see
  `ladder-rungs.json`'s own `introSource` field per rung), not invented UI copy, plus one honest
  sentence naming the actual bot tier and its tagline.
- **Celebration moments**: clearing a rung shows that rung's own hand-written celebration line
  (e.g. the final rung's "You cleared the ladder! Watchful counts liberties and rescues its own
  groups on purpose...") and, the first time it happens, names the newly-unlocked next rung.
  Replaying an already-cleared rung still congratulates without re-announcing an unlock.
- Everything from the prior build is unchanged underneath: every kernel `SemanticEvent` from each
  move still renders as an on-board badge, a hoverable event-log entry, a tier-gated toast, and a
  sound; the kernel's `activeKoPoint` still drives the board's ko marker directly; the Settings
  panel (sound mute, concept-toast tier, touch mode) is unaffected by which rung is active.

### Bot ladder (`public/js/bot.mjs`)

Four tiers, kernel-agnostic and kernel-API-only (every decision reads off values the kernel itself
computed — `applyStonePlacement`'s capture preview, `findGroup`'s liberties, `neighbors`'
adjacency — never a second copy of legality/capture logic), in ascending order:

| Tier | Label | What it actually does |
| --- | --- | --- |
| `random` | Wandering | Uniformly random legal move. No plan, no memory — the baseline, not a beginner opponent to learn from. |
| `greedy` | Grabby | Always takes an available capture; otherwise wanders. Reactive, never anticipatory. |
| `liberty` | Watchful | Counts liberties: takes an available capture, rescues its own groups from atari when possible, otherwise avoids self-atari and leans on whichever adjacent enemy group has the fewest liberties. First tier that defends itself on purpose. |
| `influence` | Reaching | Watchful's same capture/self-atari safety sense, but aimed by a simple `+2`/`-2`-per-neighbor influence heuristic (plus a small center bonus) instead of direct pressure — a different shape of one-move heuristic, not a deeper one. |

**Labels are deliberately not kyu/dan ranks.** None of these bots have been rated against anything
real, and a scripted heuristic claiming a rank would be exactly the dishonest strength claim the
task's mandate rules out (`test/bot-ladder.test.mts` even asserts no tier's label/description
matches a `\d+\s*(kyu|dan)` pattern). They're described honestly as "learns-with-you" tiers: each
one is a genuinely different, slightly more attentive opponent than the last, not a calibrated
strength ladder. **GnuGo/KataGo remain the platform plan's later server-side engine tier** — this
bot ladder is the "scripted weak bots first" rung the plan itself names, not a substitute for real
engine play, and nothing here claims otherwise.

**Legality, exhaustively checked**: `test/bot-ladder.test.mts` runs Watchful and Reaching through
800 total seeded self-play games (200 each) across four pairings/board sizes — Watchful vs.
Wandering on 7×7, Reaching vs. Wandering on 9×9, and Watchful vs. Reaching both colors on 9×9 —
asserting the kernel never rejects a bot-chosen move in any of them, the same discipline
`smoke.test.mts` already applied to the original random/greedy pair (100 games there). Two more
tests build exact hand-checked positions confirming Watchful's actual priority order (take an
available capture; failing that, rescue your own atari'd group).

## Tsumego trainer (`public/js/tsumego-app.mjs` + `public/data/tsumego.json`)

A graded problem player: every answer is checked by actually calling `game.play()` against the
real kernel and comparing the result to the problem's authored `accept` moves — there is no second,
separate notion of "correct" anywhere in this file. Problems are data (`public/data/tsumego.json`),
not code.

- **Content**: **44 problems** across the three graded categories the task named, spanning all
  three difficulty bands:

  | Category | Count | Bands |
  | --- | --- | --- |
  | Capture Go Basics | 16 | introductory, developing |
  | Ladders & Nets | 14 | developing, challenging |
  | Life & Death Fundamentals | 14 | introductory, developing, challenging |
  | **Total** | **44** | 18 introductory · 18 developing · 8 challenging |

  Goal types: `capture` (remove the target group), `escape` (get your own atari'd group to more
  than one liberty), `live` (form two real eyes, checked by the same diagonal-control rule
  `false-eye.md` describes and the kernel's own `isLegal` already enforces for true single-point
  eyes), and `kill` (capture an already-doomed invader). 6 problems cite a real classical shape
  (`source: "traditional-shape:straight-three-corner"`, `bent-three-corner`, `straight-four-edge` —
  public-domain Go vocabulary, not a reproduction of any single copyrighted book's diagram); the
  other 38 are original positions constructed for this trainer, marked `source: "original"`. Every
  problem carries a hand-written `failNote` explaining *why* the wrong answer fails, not just that
  it does.
- **Author → verify → keep (the Equivo discipline the task named)**: every problem's `accept` move
  and its full `lines[accept]` continuation is replayed through the real kernel by
  `test/tsumego-data.test.mts` on every test run — not just at authoring time. A problem is only
  ever in `tsumego.json` because that exact replay already passed: every move in the line is
  legality-checked (`game.isLegal`) before being played, and the stated `goalType` is verified
  against the actual resulting position (the target's board cell for capture/kill, the group's
  liberty count for escape, a real two-eye count via the same diagonal-control helper the test file
  reimplements independently rather than trusting the trainer's own runtime code).
- **SRS scheduling**: `public/js/srs.mjs`, vendored verbatim from
  `lantern-service/src/srs.mts` (FSRS-lite: the published `R(t,S) = (1 + FACTOR·t/S)^DECAY`
  forgetting curve, `DECAY`/`FACTOR` at their published defaults, one fixed constant set rather
  than a full per-user fit — see the file's own header for exactly what's a disclosed
  simplification). Review state persists per problem id to `localStorage`
  (`weiqi-tsumego-srs`) in the exact `CardState` shape `reviewCard` produces and expects — no
  adapter layer. `test/srs-parity.test.mts` checks this vendored copy against the curve's own
  published structural identities (the `R(t=S)=0.9` identity, `STAGE_CUTS` matching lantern's
  published cut points, determinism, monotonicity) independently of `test/tsumego-deck.test.mts`,
  which checks the *due-selection* logic built on top of it.
- **Grading**: after solving (or seeing the solution), Again/Hard/Good/Easy map directly to
  `srs.mjs`'s 1–4 grade scale — no relabeling in between.
- **Wrong answers show the solution, not yet a refutation of the specific mistake**: a wrong-but-legal
  try is actually played on the board (so its consequence is visible, not just silently rejected),
  the problem's `failNote` runs alongside it, and then the board resets to the starting diagram and
  replays the real solution — the exact same kernel-verified `accept` + `lines` sequence a correct
  answer would have triggered. Verified honestly (polish-pass verification session, driving wrong
  answers through the real trainer wiring): `failNote` is one fixed string per problem in
  `tsumego.json`, independent of which wrong coordinate the player actually tried, and there is no
  authored per-wrong-move punishment line — so this is accurately "here's the solution and a general
  hint," not the market teardown's "right/wrong, no why" complaint fully answered. A real refutation
  (playing out *why the specific tried move loses*, e.g. the opponent's punishing reply) would need
  per-wrong-move continuation data this trainer does not have yet; the UI copy used to call this
  "the refutation," which overclaimed — it now says "the solution." Authoring real per-mistake
  refutation lines is real future content work, tracked below with the content-scale honesty note,
  not something to fake procedurally.
- **Deck picker**: filter by category and/or band, plus a "due for review only" toggle (default on)
  built on `tsumego-deck.mjs`'s pure `buildQueue` — new (never-reviewed) problems always sort
  first, then already-reviewed-and-due problems most-overdue-first, independent of `dueOnly`'s
  category/band filtering, which composes with it rather than replacing it.
- **Content-scale honesty**: 44 problems is a real, fully-verified starting set across the graded
  progression the task specified, not a token handful — but competitors named in the market
  teardown ship thousands (BadukPop 4,000–5,000+, GoMagic 5,877, PlayGo.gg 20,000+). This trainer
  is built to scale — adding problem #45 is "append a verified JSON object," not new engineering —
  and growing the content set is real authoring work tracked as its own backlog item, the same way
  the lesson corpus's remaining three documents are, not something this build claims to have closed.

## The lesson player (`public/js/learn-app.mjs`)

Renders `public/data/lesson-weiqi-overview.json`, hand-authored from
[`weiqi-overview.md`](../../content/text/documents/articles/teaching-articles/tutorials/weiqi-overview.md) per the house
lesson template ported to an interactive widget. Unchanged by this build's own code, but a direct
beneficiary of it: because `board.mjs`'s `setPosition` now diffs and animates rather than hard-
cutting, stepping forward/backward through the lesson now animates stones appearing/disappearing
between steps for free — closing a gap the Experience Brief noted (`renderStep` used to be a hard
cut) without any change to `learn-app.mjs` itself. `{{term}}` / `{{term:custom label}}` tokens
still expand into the same hoverable glossary spans used everywhere else in the app. One lesson,
hand-authored to prove the pattern — scaling to the section's other three lesson documents
(`living-groups-and-eyes.md`, `komi-and-handicap.md`, `weiqi-history.md`) is real authoring work,
not a wiring gap, and is not part of this build.

## The glossary (`public/js/glossary-app.mjs` + `scripts/build-glossary.mjs`)

Unchanged by this build. Every term in `content/text/glossary/terms/*.md` (20 files) compiles to
`public/data/glossary.json` and renders as one page, cross-linked by `#slug` anchors and reusing
the same hover-card component every other face uses. No definition text is hardcoded anywhere in
this app.

## Rendering performance — honest numbers

Measured with a headless Chromium 122-class build (Playwright's bundled browser, software
rasterizer — no GPU compositor in this sandbox, so these numbers are a **conservative floor**, not
an optimistic best case; a real device with hardware-accelerated compositing should do at least as
well) at the board's default 19×19 sizing, via a temporary perf harness (not shipped — built,
measured, and deleted as part of this work; not part of `public/`):

| Measurement | Result |
| --- | --- |
| Idle fps, full 19x19 board (361 rendered stones, static, no changes) | ~59–61 fps |
| Single-stone commit (diff + DOM update + animation-class start), mean | ~0.08–0.11 ms |
| Single-stone commit, p95 | ~0.3–0.5 ms |
| Single-stone commit, worst observed | ~0.7–0.8 ms |
| Full-board simultaneous placement (all 361 stones in one commit) | ~23–31 ms (one-time; a real game never does this — worst-case bound only) |
| Full-board simultaneous capture (all 361 stones in one commit) | ~4–9 ms |
| Sustained fps under a synthetic worst-case stress loop (toggle the *entire* board full↔empty every 4 animation frames, continuously, for 3s) | ~13–19 fps |

**Reading these honestly**: a real game changes 1 point per move (occasionally a handful on a
multi-stone capture), never the whole board at once. The number that actually matters for "does
this feel like 60fps," the single-stone commit cost, has roughly 20-30x headroom under a 16.7ms
frame budget even on this unaccelerated sandbox renderer — SVG did not need to be switched to
canvas to hit 60fps on a full 19x19, per the task's own instruction to measure before switching.
The stress-loop number (~13–19fps) is a deliberately extreme synthetic case included for honesty,
not a claim about real gameplay — no human or the current bot ladder ever recreates the entire
board every 60-70ms. If a future feature (e.g., a fast-forward SGF replay scrubber) ever *did*
need to hit that pattern, that would be the trigger to revisit canvas for the stone layer, per the
task's own instruction — not before.

## Test counts

- `@red-cup-engineering/weiqi-engine`: the exact-pinned rules and replay dependency; this app
  imports it but does not duplicate legality, scoring, or event recognition.
- `apps/weiqi-web`: **168/168** passing (`npm test` — `check-mts.mjs` against every
  `test/*.test.mts` file, then `node --test 'test/*.test.mts'`, ~15–20s, dominated by the 800
  seeded self-play games in `bot-ladder.test.mts`):
  - 3 in `smoke.test.mts` — the original 100-game random-vs-greedy self-play suite, unchanged.
  - 9 in `stone-variance.test.mts` — the deterministic hash and per-stone variance are pure,
    stable, bounded, and reproduce byte-identically across repeated renders of the same position.
  - 16 in `touch-gesture.test.mts` — both touch modes' full transition table: commit, cancel,
    overshoot recovery, mode switching, idle no-ops.
  - 10 in `concept-tiers.test.mts` — the toast tier-gating rule against every kernel event type, at
    every tier, including the deliberately-excluded types.
  - **7 in `bot-ladder.test.mts`** (new) — 800 total seeded self-play games across four
    tier/board-size pairings asserting the kernel never rejects a bot-chosen move, plus two
    hand-built positions checking Watchful's real priority order.
  - **11 in `srs-parity.test.mts`** (new) — the vendored FSRS-lite scheduler against its own
    published-constant derivations and structural identities.
  - **90 in `tsumego-data.test.mts`** (new) — every one of the 44 problems' structural fields, plus
    a full kernel replay of every accept line proving its stated goal (2 tests/problem, x44, + 2
    suite-level tests: >=40 problems, unique ids).
  - **11 in `ladder-progress.test.mts`** (new) — the onboarding ladder's unlock rule, including a
    sanity check against the real `ladder-rungs.json` data file.
  - **11 in `tsumego-deck.test.mts`** (new) — the tsumego trainer's due-selection and deck-filter
    logic, including real `srs.mjs` round trips (not a mock scheduler).
- Section-wide `node scripts/check-links.mts` (run from the section root): unaffected by this app,
  since it lives under `apps/`, not `content/`.
- **Not covered by `node --test`, by design (consistent with the existing smoke-test philosophy of
  testing pure logic, not DOM)**: `board.mjs`, `sound.mjs`, `concept-toast.mjs`, `play-app.mjs`,
  and `tsumego-app.mjs` themselves are DOM-touching. The board/sound/toast modules were verified by
  hand in a real headless-Chromium session during the prior Polish build (screenshots, synthetic
  `PointerEvent` drag round trips, settings-panel wiring, zero console errors — see that build's own
  notes). **This build's DOM-touching additions (the ladder UI in `play-app.mjs`, the whole of
  `tsumego-app.mjs`) were syntax-checked (`node --check`) and reviewed carefully, but not exercised
  in a live browser this session** — said plainly rather than reusing the prior build's "verified
  by hand" language for work that wasn't. Every judgment call either module depends on
  (the ladder unlock rule, deck/due-selection, the tsumego content itself) is pulled out into a
  pure, DOM-free sibling and covered by `node --test`, which is what actually has logic worth
  getting wrong in it; the DOM glue on top is straight-line wiring with no branching logic of its
  own beyond what's already tested. A follow-on pass with real browser access should still run
  through both pages by hand before calling that gap closed.

## What this app does not do

No accounts, no server-side game state, no live/correspondence play, no ratings, no SGF
export/import UI, no ownership/territory *scoring UI* (Capture Go never reaches scoring — the
board's `setTerritory` rendering capability exists and is built for this, but nothing calls it
yet), no GnuGo/KataGo integration (the platform plan's own later, server-side engine tier — the bot
ladder above is deliberately not a substitute for it and never claims to be). The tsumego content
set (44 problems) is a real, machine-verified starting deck across the task's own graded
progression, not a stub — but it is nowhere near competitive scale (thousands, per the market
teardown); growing it is tracked as its own ongoing content-authoring backlog item, not something
this build claims to have finished. All of the above is deliberately out of scope for this build,
not an oversight.

## A note on a parallel build

At the time this app was built, `weiqi-services-section/services/weiqi-platform/apps/weiqi-learn/`
already existed as a separate, independently-authored Learn face (with its own constitution record
naming it, not this app, as the section's licensed home for exactly this responsibility). This app
was built at the path its own task specified (`apps/weiqi-web`) without modifying, depending on, or
deleting that other app — both exist in the section side by side. Reconciling the two (which one
the section actually serves, whether one should be retired) is a decision for whoever owns the
section next, not something this build resolved unilaterally.
