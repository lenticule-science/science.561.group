// Replays a tsumego attempt against a problem's own accept/lines answer key,
// via the kernel — a move is never compared as a bare string without first
// confirming, through the kernel, what actually happens when it's played.
//
// Imports the built kernel tree directly (public/lib/kernel/, per the house
// rule that app code never reaches the .mts source). Unlike
// kernel-bridge.mjs's session, a Game here is seeded from an arbitrary
// *diagram* (createPositionFromCells) rather than built up move by move from
// an empty board — that's what a tsumego problem's `stones` field is, and
// bridge.mjs's createSession has no way to start from one.

import { Game, createPositionFromCells, BLACK, WHITE, EMPTY, coordToPoint, pointToCoord } from "../../lib/kernel/index.mjs";

const RULESET = "chinese"; // arbitrary but fixed to match tsumego-data.test.mjs, which verified every problem under it

/**
 * @typedef {object} TsumegoProblem
 * @property {string} id
 * @property {string} set
 * @property {string} title
 * @property {number} size
 * @property {'black'|'white'} toPlay
 * @property {Array<{pt: string, color: 'black'|'white'}>} stones
 * @property {string} goal
 * @property {string[]} accept
 * @property {Record<string, Array<{move: string, reply: string, note: string}>>} lines
 * @property {string} failNote
 */

/**
 * @typedef {object} CheckResult
 * @property {boolean} solved
 * @property {{move: string, expected?: string, reason?: string, note?: string}} [refutation] -
 *   present only when the attempt has gone definitely wrong (an illegal
 *   move, or a legal move that isn't the answer key's next step); absent
 *   while the attempt is still a valid, unfinished prefix of a solution.
 * @property {Array<{pt: string, color: 'black'|'white'}>} stones - the board
 *   after everything replayed so far (own moves and auto-played scripted
 *   replies alike), for the caller to render without duplicating the replay.
 * @property {string|null} lastMove - the most recently played point, or
 *   `null` before the attempt's first move.
 */

function colorOf(name) {
  return name === "black" ? BLACK : WHITE;
}

function startingGame(problem) {
  const cells = new Array(problem.size * problem.size).fill(EMPTY);
  for (const { pt, color } of problem.stones) {
    cells[coordToPoint(problem.size, problem.size, pt)] = colorOf(color);
  }
  const position = createPositionFromCells(problem.size, problem.size, cells, colorOf(problem.toPlay));
  return new Game(problem.size, RULESET, position);
}

function stonesOf(game) {
  const { board, width } = game.current;
  const out = [];
  for (let i = 0; i < board.length; i++) {
    if (board[i] === BLACK) out.push({ pt: pointToCoord(width, i), color: "black" });
    else if (board[i] === WHITE) out.push({ pt: pointToCoord(width, i), color: "white" });
  }
  return out;
}

/**
 * Replay `moves` — the solver's own moves only, in order — against
 * `problem.accept` and `problem.lines`. The opponent's scripted reply at
 * each line step is auto-played between the solver's moves, exactly as
 * tsumego-data.test.mjs already proved legal and goal-proving for every
 * problem in tsumego.json.
 *
 * @param {TsumegoProblem} problem
 * @param {string[]} moves
 * @returns {CheckResult}
 */
export function checkAttempt(problem, moves) {
  const game = startingGame(problem);
  let lastMove = null;

  if (moves.length === 0) {
    return { solved: false, stones: stonesOf(game), lastMove };
  }

  const first = moves[0];
  if (!problem.accept.includes(first)) {
    const refutation = game.isLegal(first)
      ? { move: first, note: problem.failNote }
      : { move: first, reason: "illegal", note: problem.failNote };
    return { solved: false, refutation, stones: stonesOf(game), lastMove };
  }
  game.play(first);
  lastMove = first;

  const line = problem.lines[first] ?? [];
  for (let i = 0; i < line.length; i++) {
    const step = line[i];
    game.play(step.move); // the scripted opponent attempt — always legal here, by tsumego-data.test.mjs
    lastMove = step.move;

    const studentMove = moves[i + 1];
    if (studentMove === undefined) {
      return { solved: false, stones: stonesOf(game), lastMove };
    }
    if (studentMove !== step.reply) {
      const refutation = { move: studentMove, expected: step.reply, note: step.note };
      return { solved: false, refutation, stones: stonesOf(game), lastMove };
    }
    game.play(studentMove);
    lastMove = studentMove;
  }

  return { solved: true, stones: stonesOf(game), lastMove };
}
