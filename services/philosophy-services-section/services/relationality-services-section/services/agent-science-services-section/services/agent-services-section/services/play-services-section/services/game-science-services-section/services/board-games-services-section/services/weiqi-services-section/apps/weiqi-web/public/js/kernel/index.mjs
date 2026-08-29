// Public entry point for @lenticule-science/weiqi-kernel.

export * from "./board.mjs";
export * from "./zobrist.mjs";
export * from "./position.mjs";
export * from "./rulesets.mjs";
export * from "./events.mjs";
// Named, not `export *`: game.mts also exports checkKoViolation under the
// test-only alias _checkKoViolationForTests (see game.mts), which test/
// reaches by importing "../src/game.mts" directly and which has no
// business appearing in this package's public surface.
export { Game,                                      } from "./game.mjs";
export * from "./scoring.mjs";
export * from "./sgf.mjs";
