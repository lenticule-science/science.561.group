// The scripted local Weiqi opponents.
// (weiqi-platform-plan.md, "Engines and AI": "scripted weak bots first
// (random-legal, greedy-capture, simple-heuristic)"). Four tiers now live
// here, in ascending order: random-legal ("Wandering"), greedy-capture
// ("Grabby"), a liberty-counting Defender ("Watchful"), and a simple
// influence heuristic ("Reaching") -- see BOT_TIERS at the bottom of this
// file for the one honest, shared description table, and the app README
// for why none of these carry a kyu/dan claim.
//
// Kernel-agnostic by design: this module never imports the kernel itself.
// Every function takes the kernel's module namespace as an explicit `kernel`
// argument instead, so the exact same code runs against the kernel's real
// .mts sources (Node, via relative import -- see test/smoke.test.mts) and
// against the browser's type-stripped .mjs copies (public/js/kernel/*.mjs,
// see public/js/play-app.mjs), without duplicating a single line of rules
// logic. All legality is delegated to `game.isLegal` / `game.play`; this
// module only *chooses* among moves the kernel has already certified legal.
//

/**
 * Every empty point's Go-notation coordinate on `game`'s board, in
 * row-major order.
 */
function emptyPointCoords(game, kernel) {
  const { board, width } = game.current;
  const coords = [];
  for (let point = 0; point < board.length; point++) {
    if (board[point] === kernel.EMPTY) coords.push(kernel.pointToCoord(width, point));
  }
  return coords;
}

/**
 * How many stones a legal move at `coord` would capture, without mutating
 * `game` -- a non-mutating preview built from the kernel's own pure
 * `applyStonePlacement` (public API), exactly as a UI's hover-ghost-stone
 * legality/capture preview would.
 */
function previewCaptureCount(game, kernel, coord) {
  const point = kernel.coordToPoint(game.size, game.size, coord);
  const placement = kernel.applyStonePlacement(game.current, point, game.ruleset);
  if (!placement.ok) return 0;
  return placement.captured.reduce((n, g) => n + g.stones.length, 0);
}

/** All currently-legal moves (coordinates only; "pass" is always legal but
 * deliberately excluded here -- these functions are move *choosers* for an
 * agent that always prefers placing a stone over passing while any legal
 * placement exists). */
function legalMoveCoords(game, kernel) {
  return emptyPointCoords(game, kernel).filter((coord) => game.isLegal(coord));
}

/**
 * Greedy-capture policy: among this turn's legal moves, prefer one that
 * captures the most stones; break ties (including the all-zero-captures
 * case, i.e. no capture available) uniformly at random. Returns "pass" only
 * when no legal placement exists at all.
 */
export function chooseGreedyCaptureMove(game, kernel, rng = Math.random) {
  const legal = legalMoveCoords(game, kernel);
  if (legal.length === 0) return "pass";
  const scored = legal.map((coord) => ({ coord, captured: previewCaptureCount(game, kernel, coord) }));
  const maxCaptured = Math.max(...scored.map((s) => s.captured));
  const best = maxCaptured > 0 ? scored.filter((s) => s.captured === maxCaptured) : scored;
  return best[Math.floor(rng() * best.length)].coord;
}

/** Uniformly-random legal-move policy -- the plan's "random-legal" bot, and
 * a convenient opponent for exercising the kernel under the smoke test. */
export function chooseRandomLegalMove(game, kernel, rng = Math.random) {
  const legal = legalMoveCoords(game, kernel);
  if (legal.length === 0) return "pass";
  return legal[Math.floor(rng() * legal.length)];
}

// -------------------------------------------------------------------------
// Bot ladder, rungs 3-4 (Experience Brief item 7 / task item 3): a
// liberty-counting "Defender" and a simple influence heuristic above
// random-legal/greedy-capture. Both remain kernel-agnostic and
// kernel-API-only, exactly like the two bots above: every decision reads
// off values the kernel itself computed (applyStonePlacement's preview,
// findGroup's liberties, neighbors' adjacency) -- neither function
// reimplements legality, capture resolution, or liberty counting; they only
// *choose* among kernel-certified-legal moves using the kernel's own
// numbers. Honest tier naming lives in BOT_TIERS below: "learns-with-you"
// labels, not kyu/dan claims -- see the app README for why, and for the
// plan's later server-side GnuGo/KataGo tier these are not a substitute
// for.
// -------------------------------------------------------------------------

/** Uniform tie-break among `candidates` (each `{ coord, ... }`), via `rng`. */
function pickBest(candidates, rng) {
  return candidates[Math.floor(rng() * candidates.length)].coord;
}

/**
 * Every stone belonging to a `color` group currently at exactly one
 * liberty (in atari), as a Set of point indices -- read straight off
 * `game.current.board` via the kernel's own `findGroup`.
 */
function colorAtariStones(game, kernel, color) {
  const { board, width } = game.current;
  const seen = new Set();
  const atariStones = new Set();
  for (let p = 0; p < board.length; p++) {
    if (board[p] === color && !seen.has(p)) {
      const g = kernel.findGroup(board, width, width, p);
      for (const s of g.stones) seen.add(s);
      if (g.liberties.size === 1) {
        for (const s of g.stones) atariStones.add(s);
      }
    }
  }
  return atariStones;
}

/**
 * The fewest liberties any single opponent group adjacent to `point` has,
 * in `position` (a post-placement preview) -- Infinity when no opponent
 * group is adjacent at all. This is the Defender's one "threat" signal.
 */
function minAdjacentEnemyLiberties(kernel, position, width, point, opp) {
  let min = Infinity;
  const seen = new Set();
  for (const n of kernel.neighbors(width, width, point)) {
    if (position.board[n] === opp && !seen.has(n)) {
      const g = kernel.findGroup(position.board, width, width, n);
      for (const s of g.stones) seen.add(s);
      min = Math.min(min, g.liberties.size);
    }
  }
  return min;
}

/**
 * "Watchful" -- the liberty-counting Defender. In priority order, entirely
 * over kernel-certified-legal moves:
 *   1. Take the biggest available capture (capture-go is decisive; every
 *      tier agrees a capture ends the game, so none of them ever pass one up).
 *   2. If one of the bot's own groups is currently in atari, play a legal
 *      move that actually rescues it (the played stone's resulting group
 *      includes one of those atari'd stones, and ends up with more than one
 *      liberty) -- preferring whichever rescue leaves the most liberties.
 *   3. Otherwise, prefer moves that do not leave the bot's own new stone in
 *      self-atari, when a non-self-atari legal move exists.
 *   4. Among the safe moves, prefer whichever leaves an adjacent enemy
 *      group with the fewest liberties (the most direct pressure this bot
 *      is capable of reading), tie-broken by the bot's own resulting
 *      liberties, then a uniform-random tie-break via `rng`.
 */
export function chooseLibertyCountingMove(game, kernel, rng = Math.random) {
  const legal = legalMoveCoords(game, kernel);
  if (legal.length === 0) return "pass";

  const color = game.current.toMove;
  const opp = color === kernel.BLACK ? kernel.WHITE : kernel.BLACK;
  const width = game.size;

  const scored = [];
  for (const coord of legal) {
    const point = kernel.coordToPoint(width, width, coord);
    const placement = kernel.applyStonePlacement(game.current, point, game.ruleset);
    if (!placement.ok) continue; // defensive only -- legalMoveCoords already filtered via game.isLegal
    const captured = placement.captured.reduce((n, g) => n + g.stones.length, 0);
    const ownGroup = kernel.findGroup(placement.position.board, width, width, point);
    scored.push({
      coord,
      captured,
      ownLiberties: ownGroup.liberties.size,
      ownStones: new Set(ownGroup.stones),
      pressure: minAdjacentEnemyLiberties(kernel, placement.position, width, point, opp),
    });
  }

  const maxCaptured = Math.max(...scored.map((s) => s.captured));
  if (maxCaptured > 0) {
    return pickBest(scored.filter((s) => s.captured === maxCaptured), rng);
  }

  const atariStones = colorAtariStones(game, kernel, color);
  if (atariStones.size > 0) {
    const rescues = scored.filter(
      (s) => s.ownLiberties > 1 && [...s.ownStones].some((st) => atariStones.has(st)),
    );
    if (rescues.length > 0) {
      const maxLib = Math.max(...rescues.map((s) => s.ownLiberties));
      return pickBest(rescues.filter((s) => s.ownLiberties === maxLib), rng);
    }
  }

  const safe = scored.filter((s) => s.ownLiberties > 1);
  const pool = safe.length > 0 ? safe : scored;
  const minPressure = Math.min(...pool.map((s) => s.pressure));
  const pressured = pool.filter((s) => s.pressure === minPressure);
  const maxLib = Math.max(...pressured.map((s) => s.ownLiberties));
  return pickBest(pressured.filter((s) => s.ownLiberties === maxLib), rng);
}

/**
 * A simple, deliberately explainable influence heuristic: each candidate
 * point scores +2 per own stone / -2 per opponent stone at Chebyshev
 * distance 1, +1/-1 at distance 2, plus a small flat bonus for proximity to
 * the board's own center point -- "build toward open space and your own
 * stones" in its entirety. No group reading, no look-ahead; this is one
 * static rung above Watchful, not a second engine.
 */
function influenceScore(board, width, point, color, opp) {
  const col = point % width;
  const row = Math.floor(point / width);
  let score = 0;
  for (let p = 0; p < board.length; p++) {
    if (board[p] === 0) continue;
    const pc = p % width;
    const pr = Math.floor(p / width);
    const dist = Math.max(Math.abs(pc - col), Math.abs(pr - row));
    if (dist === 0 || dist > 2) continue;
    const weight = dist === 1 ? 2 : 1;
    score += board[p] === color ? weight : -weight;
  }
  const center = (width - 1) / 2;
  const centerDist = Math.abs(col - center) + Math.abs(row - center);
  score += (width - centerDist) * 0.05;
  return score;
}

/**
 * "Reaching" -- Watchful's safety sense (captures first, then avoid
 * self-atari when avoidable) plus `influenceScore` as the tiebreak instead
 * of Watchful's adjacent-pressure reading. The plan's next AI rung
 * ("simple-heuristic," weiqi-platform-plan.md's Engines and AI section)
 * made concrete as a second, differently-shaped heuristic rather than a
 * strictly stronger one -- see the README for why two roughly-equal-strength
 * heuristic bots is the honest description, not "Reaching beats Watchful."
 */
export function chooseInfluenceMove(game, kernel, rng = Math.random) {
  const legal = legalMoveCoords(game, kernel);
  if (legal.length === 0) return "pass";

  const color = game.current.toMove;
  const opp = color === kernel.BLACK ? kernel.WHITE : kernel.BLACK;
  const width = game.size;
  const { board } = game.current;

  const scored = legal.map((coord) => {
    const point = kernel.coordToPoint(width, width, coord);
    const captured = previewCaptureCount(game, kernel, coord);
    const placement = kernel.applyStonePlacement(game.current, point, game.ruleset);
    const ownLiberties = placement.ok
      ? kernel.findGroup(placement.position.board, width, width, point).liberties.size
      : 0;
    return { coord, captured, ownLiberties, influence: influenceScore(board, width, point, color, opp) };
  });

  const maxCaptured = Math.max(...scored.map((s) => s.captured));
  if (maxCaptured > 0) {
    return pickBest(scored.filter((s) => s.captured === maxCaptured), rng);
  }

  const safe = scored.filter((s) => s.ownLiberties > 1);
  const pool = safe.length > 0 ? safe : scored;
  const maxInfluence = Math.max(...pool.map((s) => s.influence));
  return pickBest(pool.filter((s) => s.influence === maxInfluence), rng);
}

/**
 * The bot ladder, in ascending order, as one honest table -- the single
 * source both the ladder UI and the README's bot-ladder table read from,
 * so the two can never drift apart. `label` is deliberately NOT a kyu/dan
 * rank: none of these bots have been rated against anything, and claiming
 * a rank for a scripted heuristic would be exactly the kind of dishonest
 * strength claim the task's mandate rules out. `chooser` has the same
 * `(game, kernel, rng) => coord | "pass"` signature as every function
 * above.
 */
export const BOT_TIERS = Object.freeze([
  Object.freeze({
    id: "random",
    label: "Wandering",
    tagline: "Plays a uniformly random legal move.",
    description:
      "No plan and no memory of what just happened -- the baseline every other tier is measured against, not a beginner opponent to actually learn from.",
    chooser: chooseRandomLegalMove,
  }),
  Object.freeze({
    id: "greedy",
    label: "Grabby",
    tagline: "Always takes an available capture; otherwise wanders.",
    description:
      "Reactive, not anticipatory: it will take any capture in front of it but never sets one up, and never protects a group before it's already in atari.",
    chooser: chooseGreedyCaptureMove,
  }),
  Object.freeze({
    id: "liberty",
    label: "Watchful",
    tagline: "Counts liberties: rescues its own groups, avoids self-atari, leans on your weakest group.",
    description:
      "The first tier that defends itself on purpose -- it reads its own atari and the liberties of groups next to its candidate moves, using only the kernel's own liberty counts. Still no look-ahead beyond one move.",
    chooser: chooseLibertyCountingMove,
  }),
  Object.freeze({
    id: "influence",
    label: "Reaching",
    tagline: "Watchful's safety sense, aimed by a simple influence heuristic instead of direct pressure.",
    description:
      "Prefers points that build toward open space and its own stones over isolated jabs at yours. A different shape of one-move heuristic, not a deeper one -- see the README before assuming it's simply 'stronger than Watchful.'",
    chooser: chooseInfluenceMove,
  }),
]);
