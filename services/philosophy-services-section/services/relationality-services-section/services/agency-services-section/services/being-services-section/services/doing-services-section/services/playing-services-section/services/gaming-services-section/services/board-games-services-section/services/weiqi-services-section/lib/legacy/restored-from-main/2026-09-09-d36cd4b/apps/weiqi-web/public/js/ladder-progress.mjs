// Pure, DOM-free progress logic for the Capture Go onboarding ladder
// (play-app.mjs, Experience Brief item 2 / task item 2). Factored out
// specifically so the unlock rule is unit-testable without a DOM or
// localStorage -- the same pattern stone-variance.mjs, touch-gesture.mjs,
// and concept-tiers.mjs already use in this app (see the README).
//
// The rule: rungs unlock strictly in order. Rung 0 is always playable.
// Rung i (i > 0) is playable once every rung before it has been cleared --
// a player can't skip ahead by clearing rung 2 without rung 1 (that
// shouldn't be reachable through the UI either, since locked buttons are
// disabled, but the rule lives here once so both the UI and its tests
// agree on it).

export const LADDER_PROGRESS_KEY = "weiqi-ladder-progress";

/** How many rungs, counted from index 0, are cleared in unbroken order. */
export function unlockedCount(rungIds, clearedIds) {
  const cleared = new Set(clearedIds);
  let n = 0;
  while (n < rungIds.length && cleared.has(rungIds[n])) n++;
  return n;
}

/** Whether the rung at `index` is currently playable. */
export function isRungUnlocked(index, rungIds, clearedIds) {
  return index >= 0 && index <= unlockedCount(rungIds, clearedIds);
}

/** Add `rungId` to `clearedIds`, without duplicating an already-cleared id; returns a new array (never mutates the input). */
export function addClearedRung(clearedIds, rungId) {
  return clearedIds.includes(rungId) ? clearedIds : [...clearedIds, rungId];
}

/** Parse a raw localStorage value into a clean array of rung-id strings; any malformed/missing value degrades to "no progress" rather than throwing. */
export function parseClearedRungIds(raw) {
  try {
    const parsed = raw ? JSON.parse(raw) : [];
    return Array.isArray(parsed) ? parsed.filter((id) => typeof id === "string") : [];
  } catch {
    return [];
  }
}
