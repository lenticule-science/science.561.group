// Teaching-opponent bots, both pure functions of a kernel-bridge session:
// no state of their own, no kernel import — everything they know about
// legality and consequence comes through session.legalMoves()/preview().

/**
 * @typedef {import("./kernel-bridge.mjs").PreviewResult} PreviewResult
 */

/** Uniformly random among the currently legal board points; "pass" only when none remain. */
export function randomBot({ session }) {
  const candidates = session.legalMoves();
  if (candidates.length === 0) return "pass";
  return candidates[Math.floor(Math.random() * candidates.length)];
}

// Ranks a candidate's preview() events: capturing beats escaping atari
// beats giving atari beats a quiet move — the order the contract names,
// each rank strictly better than the ones after it.
function rank(events) {
  let escapes = false;
  let gives = false;
  for (const event of events) {
    if (event.type === "capture" && !event.detail.selfCapture) return 0;
    if (event.type === "atari-escaped") escapes = true;
    else if (event.type === "atari-given") gives = true;
  }
  if (escapes) return 1;
  if (gives) return 2;
  return 3;
}

/** Prefers a capturing move, then an atari-escaping one, then an atari-giving one, then any legal move. */
export function greedyCaptureBot({ session }) {
  const candidates = session.legalMoves();
  if (candidates.length === 0) return "pass";

  let bestRank = Infinity;
  let bestMoves = [];
  for (const move of candidates) {
    const preview = session.preview(move);
    // Every candidate came from legalMoves(), so preview() should always
    // report legal:true; a disagreement is treated as the worst rank
    // rather than trusted, since a quiet-move fallback stays safe either way.
    const moveRank = preview.legal ? rank(preview.events) : 4;
    if (moveRank < bestRank) {
      bestRank = moveRank;
      bestMoves = [move];
    } else if (moveRank === bestRank) {
      bestMoves.push(move);
    }
  }
  return bestMoves[Math.floor(Math.random() * bestMoves.length)];
}
