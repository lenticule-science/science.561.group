// The capture-go onboarding ladder's state machine — pure data plus a pure
// transition function, no DOM and no kernel import. Everything this module
// needs to know about what actually happened on the board or in a
// kernel-bridge session arrives already-computed, as a plain `result`
// object handed to advance(); ui/tutorial.mjs is the only module that
// builds those objects, and the only one that touches a board or a
// session. That split is what lets this file's own tests simulate an
// entire stage — including a loss and the retry that follows it — with
// nothing but plain objects (see test/tutorial-flow.test.mjs).
//
// Each stage names its own win condition as a *string*, not a function:
// `winCheck` is resolved against the WIN_CHECKS registry below, at
// advance() time — exactly what the module-layout contract means by
// "data-described: event or predicate name resolved in tutorial-flow".
// A stage naming an unknown winCheck is a data bug, not a runtime
// condition to recover from, so resolving one throws.

/**
 * @typedef {object} StageDef
 * @property {string} slug
 * @property {string} title
 * @property {string} intro - guide prose for this stage. May embed
 *   `<span class="glossary-term" data-term="…">` markup (see
 *   ui/hover-card.mjs) — this is author-written HTML, never learner
 *   input, so ui/tutorial.mjs is free to set it as innerHTML directly.
 * @property {number} size - board size this stage is played on.
 * @property {'free-placement'|'scripted'|'capture-go'|'full-rules'} mode
 * @property {'random'|'greedy'} [bot] - which lib/bots.mjs export plays
 *   White; absent for the two stages with no opponent.
 * @property {number} [captureGoTarget] - only meaningful when mode is
 *   'capture-go'; passed straight through to kernel-bridge's createSession.
 * @property {string[]} [setup] - moves replayed, alternating colors from
 *   an empty board, before the learner's own turn begins; only meaningful
 *   when mode is 'scripted' — this is how a stage without a bot still
 *   opens on a specific position rather than an empty one.
 * @property {string} winCheck - a key of WIN_CHECKS, resolved at advance() time.
 * @property {string} hint - the stage's one persistent guidance string,
 *   shown on the status line whenever an intent does not advance the
 *   stage — legal-but-not-yet-there and outright illegal alike, since
 *   this module only ever hands the UI one hint per stage (see
 *   ui/tutorial.mjs's own handling, not this module's).
 * @property {string} onWin - shown on advancing past this stage. May embed
 *   `{blackScore}`/`{whiteScore}` placeholders, filled in by the caller
 *   from session.score() when present (only 'session-result' stages produce one).
 * @property {string} [onLoss] - shown when this stage's own game ends
 *   without the learner winning. Same placeholders as onWin. A stage
 *   whose winCheck can never report "loss" (see WIN_CHECKS) has no need
 *   of this field and DEFAULT_STAGES omits it there.
 */

/**
 * @typedef {object} AdvanceResult
 * @property {'won'|'lost'|'retry'|'no-change'|'complete'} outcome
 * @property {string|null} stage - the slug of the stage advance() was
 *   called against (the OLD stage on a 'won' transition — see
 *   createTutorial's own note on when the index actually moves).
 * @property {string} [text] - onWin/onLoss/hint text for the UI to show,
 *   present on every outcome except 'complete'.
 * @property {string|null} [next] - the next stage's slug, present only on 'won'.
 */

// ---------------------------------------------------------------------
// Win-check registry. Each predicate takes the plain `result` object
// advance() was called with and returns "win", "loss", or null (no
// verdict yet — stay on this stage). Only "session-result" can ever
// return "loss": the other two describe a single skills check with no
// opposing side to lose to.
// ---------------------------------------------------------------------

export const WIN_CHECKS = {
  // first-stones: `result` is {type: "placement", count} — count is the
  // learner's own running total of stones placed, computed by the UI
  // from session.history().length. Three placements, any colors, clears it.
  "stones-placed-3": (result) => {
    if (result?.type !== "placement") return null;
    return result.count >= 3 ? "win" : null;
  },

  // atari: `result` is {type: "event", event} — a single kernel semantic
  // event (or undefined), found by the caller among the learner's own
  // just-played move's own outcome.events. Every event in that list is
  // therefore already known to be a consequence of the learner's own
  // move; a non-self-capture "capture" event among them is exactly "the
  // White stone came off the board because Black removed its last
  // liberty" (there is deliberately no `by`/color check here — a kernel
  // SemanticEvent's `detail.by` is the kernel's own numeric Color code,
  // not a "black"/"white" string, and this module stays kernel-free per
  // its own header; the caller's own move-outcome scoping is what makes
  // color-checking unnecessary rather than merely inconvenient).
  "capture-white": (result) => {
    if (result?.type !== "event") return null;
    const event = result.event;
    if (event?.type === "capture" && !event.detail?.selfCapture) return "win";
    return null;
  },

  // capture-go-random, capture-go-greedy, real-go-9x9: `result` is
  // {type: "status", status} — a kernel-bridge session.status() snapshot,
  // checked after every single ply (learner's and bot's alike). A
  // capture-go win condition and an area-scoring win condition both
  // resolve to the same {phase: "ended", winner} shape, so one predicate
  // covers all three game-shaped stages: the learner is black, so
  // anything other than an outright black win (a white win, a draw, or a
  // stalemate with no winner at all) is a loss.
  "session-result": (result) => {
    if (result?.type !== "status") return null;
    const status = result.status;
    if (status?.phase !== "ended") return null;
    return status.winner === "black" ? "win" : "loss";
  },
};

function resolveWinCheck(name) {
  const check = WIN_CHECKS[name];
  if (!check) throw new Error(`tutorial-flow: unknown winCheck "${name}"`);
  return check;
}

// ---------------------------------------------------------------------
// The ladder itself, as data. The learner is always Black throughout —
// every winCheck above and every setup sequence below assumes it, and it
// is what lets "session-result" stay one predicate for three stages
// instead of three.
// ---------------------------------------------------------------------

const TERM = (name, label) => `<span class="glossary-term" data-term="${name}">${label}</span>`;

export const DEFAULT_STAGES = [
  {
    slug: "first-stones",
    title: "First Stones",
    intro:
      `A weiqi board is a grid of lines, and stones go on the points where lines cross, not inside the squares. ` +
      `Place a stone on the board below. It starts out with as many open neighboring points — its ${TERM("liberty", "liberties")} — ` +
      `as it has open lines running from it: four in the open middle, fewer on an edge, fewer still in a corner. Place three stones to continue.`,
    size: 7,
    mode: "free-placement",
    winCheck: "stones-placed-3",
    hint: "Play on an empty intersection — three stones will move you on.",
    onWin:
      "Three stones down. That's the whole vocabulary so far: a point, a stone, and the liberties around it. Next: watching a stone run out of liberties entirely.",
  },
  {
    slug: "atari",
    title: "Atari",
    intro:
      `White's stone at D4 is down to one ${TERM("liberty", "liberty")} — the empty point at E4. A stone or group with exactly one liberty left ` +
      `is in ${TERM("atari", "atari")}. Play the point that removes its last liberty to ${TERM("capture", "capture")} it.`,
    size: 7,
    mode: "scripted",
    setup: ["D3", "D4", "D5", "A1", "C4", "A2"],
    winCheck: "capture-white",
    hint: "White's D4 stone has only one open point left, at E4 — play there to capture it.",
    onWin:
      "Captured. That's the whole rhythm of the game in miniature: reduce a group's liberties to zero and it comes off the board. Next: a real game, shrunk down to just that.",
  },
  {
    slug: "capture-go-random",
    title: "Capture Go: First Blood",
    intro:
      `A real game, simplified to its core: ${TERM("capture", "capture")} one stone and you win — no ${TERM("territory", "territory")}, no scoring, ` +
      `just liberties and captures. You're Black; White plays at random. Watch for a stone you can put in ${TERM("atari", "atari")}, and finish it.`,
    size: 7,
    mode: "capture-go",
    bot: "random",
    captureGoTarget: 1,
    winCheck: "session-result",
    hint: "Look for a White stone with only one liberty, and take it before White stumbles into taking one of yours.",
    onWin: "First blood. Random moves are easy to punish once you're looking for atari — the next opponent won't be so careless.",
    onLoss: "White got there first this time. Random play lands a capture by accident sometimes — try again and look for the same opening before it does.",
  },
  {
    slug: "capture-go-greedy",
    title: "Capture Go: Greedy Opponent",
    intro:
      `Bigger board, sharper opponent, higher target: first to three captures wins. This White won't hand you one by accident — it takes a capture ` +
      `when it can, escapes ${TERM("atari", "atari")} when it must, and only plays quietly when neither applies. Reading one move ahead starts to matter.`,
    size: 9,
    mode: "capture-go",
    bot: "greedy",
    captureGoTarget: 3,
    winCheck: "session-result",
    hint: "Check whether any of your own groups are in atari before you go hunting for a capture — this White won't miss one.",
    onWin: "Three captures, against an opponent that was actually trying. Next: a full game, with territory, passing, and a real score at the end.",
    onLoss: "White reached three captures first. A greedy opponent punishes a stone left in atari immediately — defend your own groups before you reach for one of White's.",
  },
  {
    slug: "real-go-9x9",
    title: "A Full Game",
    intro:
      `The training wheels are off: full rules, 9x9, ${TERM("area-scoring", "area scoring")}. Captures still matter, but so does surrounding empty ` +
      `${TERM("territory", "territory")}. When neither side has a move left worth making, pass — two passes in a row ends the game, and it's scored as it sits.`,
    size: 9,
    mode: "full-rules",
    bot: "greedy",
    winCheck: "session-result",
    hint: "No move gains anything for either side? Passing is legal too — but only once you're sure there's nothing left worth fighting for.",
    onWin: `You won on ${TERM("area-scoring", "area score")}, {blackScore} to {whiteScore} — stones on the board plus the empty points you enclosed, all counted the same way. That's the whole game, played straight through.`,
    onLoss:
      `Final score: {blackScore} to {whiteScore}. This one didn't go your way, and that is the expected result close to half the time once a rank settles — a close loss ` +
      `against real play is evidence you're at the right level, not evidence you did something wrong. ${TERM("area-scoring", "Area score")} counts stones and enclosed territory the same; replay the game and see where the points went.`,
  },
];

// ---------------------------------------------------------------------
// The machine.
// ---------------------------------------------------------------------

/**
 * @param {StageDef[]} stageDefs
 * @returns {{
 *   stage(): (StageDef & {status: 'playing'|'lost'}) | null,
 *   advance(result: object): AdvanceResult,
 *   progress(): {index: number, total: number, complete: boolean, slugs: string[]},
 * }}
 */
export function createTutorial(stageDefs) {
  if (!Array.isArray(stageDefs) || stageDefs.length === 0) {
    throw new Error("tutorial-flow: createTutorial requires a non-empty stage list");
  }

  let index = 0;
  /** @type {'playing'|'lost'} */
  let status = "playing";

  function currentDef() {
    return stageDefs[index] ?? null;
  }

  function stage() {
    const def = currentDef();
    return def ? { ...def, status } : null;
  }

  function progress() {
    return {
      index,
      total: stageDefs.length,
      complete: index >= stageDefs.length,
      slugs: stageDefs.map((s) => s.slug),
    };
  }

  /**
   * @param {object} result - {type: "placement"|"event"|"status"|"retry", ...}
   *   the shape WIN_CHECKS[def.winCheck] expects, or {type: "retry"}.
   */
  function advance(result) {
    const def = currentDef();
    if (!def) return { outcome: "complete", stage: null };

    if (result?.type === "retry") {
      if (status !== "lost") return { outcome: "no-change", stage: def.slug, text: def.hint };
      status = "playing";
      return { outcome: "retry", stage: def.slug, text: def.hint };
    }

    if (status !== "playing") return { outcome: "no-change", stage: def.slug, text: def.hint };

    const verdict = resolveWinCheck(def.winCheck)(result);

    if (verdict === "win") {
      // The index moves here, immediately — `def` (this call's own
      // closed-over stage) is still the just-finished stage, so onWin
      // below is that stage's own text and `next` is genuinely the
      // stage after it. A caller that wants to keep showing the
      // just-finished stage's board until the learner is ready to move
      // on (see ui/tutorial.mjs) holds that presentation state itself;
      // this machine's own notion of "current stage" already reflects
      // the win the moment it happens.
      index += 1;
      return { outcome: "won", stage: def.slug, text: def.onWin, next: currentDef()?.slug ?? null };
    }
    if (verdict === "loss") {
      status = "lost";
      return { outcome: "lost", stage: def.slug, text: def.onLoss };
    }
    return { outcome: "no-change", stage: def.slug, text: def.hint };
  }

  return { stage, advance, progress };
}
