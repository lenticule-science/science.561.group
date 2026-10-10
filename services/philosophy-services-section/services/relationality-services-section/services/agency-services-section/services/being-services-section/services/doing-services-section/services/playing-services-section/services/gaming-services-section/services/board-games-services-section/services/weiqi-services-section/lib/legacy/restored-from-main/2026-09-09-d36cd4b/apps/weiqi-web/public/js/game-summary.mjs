// Capture-go's post-game explanation, read off the kernel's own semantic
// events (events.mts) the same way bot.mjs's wasCaptureMove reads them --
// never re-derives legality/capture/atari. Kernel-agnostic like bot.mjs:
// takes `kernel` as an explicit argument, so this runs against both the
// Node .mts kernel (tests) and the browser's stripped .mjs copy.

/** @param {1 | 2} color @param {{ BLACK: 1, WHITE: 2 }} kernel @returns {"Black" | "White"} */
function colorName(color, kernel) {
  return color === kernel.BLACK ? "Black" : "White";
}

// A group's one liberty only moves by capture or atari-escaped (both
// supersede it -- see events.mts), so the most recent prior atari-given
// at the same liberty point is the one this capture resolves.
/**
 * @param {{ moveEvents: Array<Array<{ type: string, term: string, termRef: string, detail: Record<string, unknown> }>> }} game
 * @param {string} capturePoint
 * @param {number} beforeMoveIndex - exclusive upper bound (the capturing move's own index)
 * @returns {{ type: string, term: string, termRef: string, detail: Record<string, unknown> } | null}
 */
function findDecisiveAtari(game, capturePoint, beforeMoveIndex) {
  for (let i = beforeMoveIndex - 1; i >= 0; i--) {
    const hit = game.moveEvents[i].find((ev) => ev.type === "atari-given" && ev.detail.point === capturePoint);
    if (hit) return hit;
  }
  return null;
}

// One glossary-grounded sentence per decisive event in a finished
// Capture-Go game: the atari that set up the capture, then each group the
// final move killed. Returns [] when the last move was not a capture.
/**
 * @param {{ moveEvents: Array<Array<{ type: string, term: string, termRef: string, detail: Record<string, unknown> }>> }} game - finished game; moveEvents/history intact after the winning move
 * @param {{ BLACK: 1, WHITE: 2 }} kernel
 * @returns {{ term: string, termRef: string, text: string }[]}
 */
export function explainCaptureGoEnd(game, kernel) {
  const finalIndex = game.moveEvents.length - 1;
  const finalEvents = finalIndex >= 0 ? game.moveEvents[finalIndex] : [];
  const captureEvent = finalEvents.find((ev) => ev.type === "capture");
  const killedEvents = finalEvents.filter((ev) => ev.type === "group-killed");
  if (!captureEvent || killedEvents.length === 0) return [];

  const sentences = [];
  const atariEvent = findDecisiveAtari(game, captureEvent.detail.point, finalIndex);
  if (atariEvent) {
    sentences.push({
      term: atariEvent.term,
      termRef: atariEvent.termRef,
      text: `${colorName(atariEvent.detail.color, kernel)}'s group was put in atari at ${atariEvent.detail.point} — down to one liberty.`,
    });
  }

  for (const killed of killedEvents) {
    const stones = Array.isArray(killed.detail.stones) ? killed.detail.stones.join(", ") : "";
    // Self-capture is unreachable under capture-go's japanese ruleset (suicide illegal); guarded defensively, not exercised by any assay.
    const cause = killed.detail.selfCapture
      ? "it was played into its own last liberty (a self-capture)"
      : `its last liberty at ${captureEvent.detail.point} was filled`;
    sentences.push({
      term: killed.term,
      termRef: killed.termRef,
      text: `${colorName(killed.detail.color, kernel)}'s group of ${killed.detail.groupSize} stone(s)${stones ? ` (${stones})` : ""} died: ${cause}.`,
    });
  }

  return sentences;
}
