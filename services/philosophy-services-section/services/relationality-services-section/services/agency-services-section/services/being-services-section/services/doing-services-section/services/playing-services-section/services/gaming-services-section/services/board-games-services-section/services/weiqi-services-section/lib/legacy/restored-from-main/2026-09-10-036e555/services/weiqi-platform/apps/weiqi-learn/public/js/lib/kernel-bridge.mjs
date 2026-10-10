// Bridges the pure Weiqi engine Game to what this app needs and the
// kernel deliberately does not provide (see the kernel's own doctrine:
// Game.isLegal() is legal-or-not only, and there is no capture-go
// ruleset — capture-go is a teaching *session* shape, not a rules
// vocabulary entry alongside chinese/japanese/aga/newzealand/ing).
//
// createSessionFactory(kernel) takes the kernel module as a parameter so
// tests can inject the .mts kernel directly (native type stripping, no
// build step) while the browser gets the built .mjs tree at
// public/lib/kernel/. The default export is the browser-bound
// convenience: it lazily imports that built tree and delegates.

/**
 * @typedef {"black"|"white"} SessionColor
 * @typedef {{type: string, term: string, termRef: string, detail: Record<string, unknown>}} SemanticEvent
 * @typedef {{ok: true, events: SemanticEvent[], captures: string[]} | {ok: false, reason: string}} PlayResult
 * @typedef {{legal: true, events: SemanticEvent[], captures: string[]} | {legal: false, reason: string, events: [], captures: []}} PreviewResult
 * @typedef {{phase: "playing"} | {phase: "ended", winner?: SessionColor, method: string}} SessionStatus
 */

// capture-go borrows its move-legality rules wholesale from japanese
// (suicide illegal, simple ko) rather than defining a sixth entry in
// rulesets.mts's RULESETS table: capture-go is not a scoring/komi/ko
// *variant* in that table's sense, it is the same legality rules wrapped
// in a different win condition and pass constraint, both of which are
// enforced here, above the kernel, not inside it.
const CAPTURE_GO_BASE_RULESET = "japanese";

function baseRulesetName(ruleset) {
  return ruleset === "capture-go" ? CAPTURE_GO_BASE_RULESET : ruleset;
}

/** All board-point (non-pass) moves currently legal for `game`, as coordinate strings. */
function legalPlacements(kernel, game) {
  const out = [];
  const n = game.size * game.size;
  for (let i = 0; i < n; i++) {
    const coord = kernel.pointToCoord(game.size, i);
    if (game.isLegal(coord)) out.push(coord);
  }
  return out;
}

/** Coordinate strings of every stone removed by a move, from its own semantic events — capture and self-capture alike. */
function extractCaptures(events) {
  const points = [];
  for (const event of events) {
    if (event.type === "group-killed") points.push(...event.detail.stones);
  }
  return points;
}

export function createSessionFactory(kernel) {
  const { Game } = kernel;

  /**
   * @param {{size: number, ruleset: string, captureGoTarget?: number}} opts
   */
  function createSession({ size, ruleset, captureGoTarget = 1 }) {
    const isCaptureGo = ruleset === "capture-go";
    const game = new Game(size, baseRulesetName(ruleset));
    // Moves played so far, in order — the source of truth preview()
    // replays from (see module header) and toSgf() reads from. The
    // kernel's own Game keeps positions, not the moves that produced
    // them, so this list is this bridge's to own.
    const moves = [];

    function computeScore() {
      const rs = game.ruleset;
      // area_or_territory (aga) has no single "the" score under this
      // simplified contract's score(); this reports the area count,
      // documented here rather than silently picked.
      return rs.scoring === "territory" ? kernel.scoreTerritory(game.current, rs) : kernel.scoreArea(game.current, rs);
    }

    function status() {
      if (isCaptureGo) {
        const pos = game.current;
        if (pos.capturedWhiteStones >= captureGoTarget) return { phase: "ended", winner: "black", method: "capture" };
        if (pos.capturedBlackStones >= captureGoTarget) return { phase: "ended", winner: "white", method: "capture" };
        // Reachable only if the board fills without either side ever
        // reaching target — teach-by-constraint (see evaluateMove) makes
        // this the sole way capture-go can end without a capture.
        if (game.mainPhaseEnded) return { phase: "ended", method: "stalemate" };
        return { phase: "playing" };
      }
      if (!game.mainPhaseEnded) return { phase: "playing" };
      const result = computeScore();
      const ended = { phase: "ended", method: "score" };
      if (result.blackScore !== result.whiteScore) {
        ended.winner = result.blackScore > result.whiteScore ? "black" : "white";
      }
      return ended;
    }

    /**
     * The one place both play() and preview() go through: attempts `move`
     * on Game instance `g` (either the live session game or a scratch
     * replay), enforcing capture-go's pass constraint above the kernel's
     * own always-legal-pass rule before delegating to g.play().
     */
    function evaluateMove(g, move) {
      if (isCaptureGo && move === "pass" && legalPlacements(kernel, g).length > 0) {
        return { legal: false, reason: "pass-forbidden", events: [], captures: [] };
      }
      const outcome = g.play(move);
      if (!outcome.ok) return { legal: false, reason: outcome.reason, events: [], captures: [] };
      return { legal: true, events: outcome.events, captures: extractCaptures(outcome.events) };
    }

    /** A fresh Game, replayed from this session's own move list — preview()'s non-mutating stand-in for `game`. */
    function scratchGameAtCurrent() {
      const scratch = new Game(size, baseRulesetName(ruleset));
      for (const mv of moves) {
        const outcome = scratch.play(mv);
        if (!outcome.ok) {
          throw new Error(`kernel-bridge: replaying own history move "${mv}" failed (${outcome.reason})`);
        }
      }
      return scratch;
    }

    function play(move) {
      if (status().phase === "ended") return { ok: false, reason: "game-ended" };
      const result = evaluateMove(game, move);
      if (!result.legal) return { ok: false, reason: result.reason };
      moves.push(move);
      return { ok: true, events: result.events, captures: result.captures };
    }

    /** Non-mutating: never touches `game` or `moves`, only a disposable replay of them. */
    function preview(move) {
      if (status().phase === "ended") return { legal: false, reason: "game-ended", events: [], captures: [] };
      return evaluateMove(scratchGameAtCurrent(), move);
    }

    function legalMoves() {
      if (status().phase === "ended") return [];
      return legalPlacements(kernel, game);
    }

    function stones() {
      const pos = game.current;
      const out = [];
      for (let i = 0; i < pos.board.length; i++) {
        const cell = pos.board[i];
        if (cell === kernel.BLACK) out.push({ pt: kernel.pointToCoord(size, i), color: "black" });
        else if (cell === kernel.WHITE) out.push({ pt: kernel.pointToCoord(size, i), color: "white" });
      }
      return out;
    }

    function toMove() {
      return game.current.toMove === kernel.BLACK ? "black" : "white";
    }

    function lastMove() {
      return moves.length > 0 ? moves[moves.length - 1] : null;
    }

    function score() {
      return isCaptureGo ? null : computeScore();
    }

    function history() {
      return moves.slice();
    }

    function toSgf() {
      const sgfMoves = moves.map((mv, i) => ({
        color: i % 2 === 0 ? kernel.BLACK : kernel.WHITE,
        point: mv === "pass" ? "pass" : kernel.coordToPoint(size, size, mv),
      }));
      return kernel.gameRecordToSgf({ size, ruleset, komi: game.ruleset.komi, moves: sgfMoves });
    }

    return { play, preview, legalMoves, stones, toMove, lastMove, status, score, history, toSgf };
  }

  return createSession;
}

/** @type {(opts: {size: number, ruleset: string, captureGoTarget?: number}) => Promise<ReturnType<ReturnType<typeof createSessionFactory>>>} */
export default async function createSession(opts) {
  const kernel = await import("../../lib/kernel/index.mjs");
  return createSessionFactory(kernel)(opts);
}
