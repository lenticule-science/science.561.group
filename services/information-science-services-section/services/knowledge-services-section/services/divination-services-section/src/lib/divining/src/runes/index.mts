// runes-topology: the Elder Futhark domain as mathematics.
//
// The 24-rune ordered futhark and its invertibility structure plus the seeded
// deterministic cast. Ported into Divination without the settling-core
// reading layer.

export {
  FUTHARK,
  NON_INVERTIBLE,
  SEEDED_CAST_METHOD,
  DEFAULT_RUNE_COUNT,
  isInvertible,
  drawRunes,
  castRunes,
  type RuneName,
  type Orientation,
  type DrawnRune,
  type DrawProvenance,
  type Cast,
} from "./runes.mts";
export * from "./reading.mts";
