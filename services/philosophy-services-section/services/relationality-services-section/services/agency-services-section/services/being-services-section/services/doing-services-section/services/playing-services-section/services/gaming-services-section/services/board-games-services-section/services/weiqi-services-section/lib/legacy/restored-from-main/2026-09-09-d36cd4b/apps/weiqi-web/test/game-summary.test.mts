// explainCaptureGoEnd: the post-game wedge (weiqi-meet-then-beat-record.json's
// proposedWedge) -- naming, in a finished Capture-Go game, the atari that
// set up the winning capture and the group that died. Games below are
// scripted move-by-move on a 5x5 board so the decisive atari/capture/
// group-killed events are exact and reproducible, not bot-chosen.
//
// Run with: node --test 'test/*.test.mts'

import { test } from "node:test";
import assert from "node:assert/strict";
import { Game } from "@lenticule-science/weiqi-kernel";
import * as kernel from "@lenticule-science/weiqi-kernel";
import { explainCaptureGoEnd } from "../public/js/game-summary.mjs";
import { wasCaptureMove } from "../public/js/bot.mjs";

const RULESET = "japanese"; // same ruleset play-app.mjs uses for capture-go

test("no decisive events before any capture has happened", () => {
  const game = new Game(5, RULESET);
  assert.equal(game.play("A1").ok, true);
  assert.deepEqual(explainCaptureGoEnd(game, kernel), []);
});

test("Black's lone stone dies: atari sentence then group-killed sentence, White captures", () => {
  const game = new Game(5, RULESET);
  assert.equal(game.play("C3").ok, true); // Black: the stone that will die
  assert.equal(game.play("B3").ok, true); // White
  assert.equal(game.play("A1").ok, true); // Black elsewhere
  assert.equal(game.play("D3").ok, true); // White
  assert.equal(game.play("A2").ok, true); // Black elsewhere
  const atariMove = game.play("C2"); // White: Black's C3 now in atari at C4
  assert.equal(atariMove.ok, true);
  assert.equal(game.play("A3").ok, true); // Black elsewhere, does not save C3
  const finalMove = game.play("C4"); // White: captures Black's C3
  assert.equal(finalMove.ok, true);
  assert.equal(finalMove.ok && wasCaptureMove(finalMove.events), true);

  const sentences = explainCaptureGoEnd(game, kernel);
  assert.equal(sentences.length, 2);

  assert.equal(sentences[0].term, "atari");
  assert.equal(sentences[0].termRef, "../../content/text/glossary/terms/atari.md");
  assert.match(sentences[0].text, /^Black's group was put in atari at C4/);

  assert.equal(sentences[1].term, "life-and-death");
  assert.match(sentences[1].text, /^Black's group of 1 stone\(s\) \(C3\) died: its last liberty at C4 was filled\.$/);
});

test("White's lone stone dies: colorName and decisive-atari matching both work for the other color", () => {
  const game = new Game(5, RULESET);
  assert.equal(game.play("A1").ok, true); // Black elsewhere
  assert.equal(game.play("C3").ok, true); // White: the stone that will die
  assert.equal(game.play("B3").ok, true); // Black
  assert.equal(game.play("A2").ok, true); // White elsewhere
  assert.equal(game.play("D3").ok, true); // Black
  assert.equal(game.play("A3").ok, true); // White elsewhere
  const atariMove = game.play("C2"); // Black: White's C3 now in atari at C4
  assert.equal(atariMove.ok, true);
  assert.equal(game.play("A4").ok, true); // White elsewhere, does not save C3
  const finalMove = game.play("C4"); // Black: captures White's C3
  assert.equal(finalMove.ok, true);
  assert.equal(finalMove.ok && wasCaptureMove(finalMove.events), true);

  const sentences = explainCaptureGoEnd(game, kernel);
  assert.equal(sentences.length, 2);
  assert.match(sentences[0].text, /^White's group was put in atari at C4/);
  assert.match(sentences[1].text, /^White's group of 1 stone\(s\) \(C3\) died:/);
});

test("a quiet (non-capturing) final move never produces decisive events", () => {
  const game = new Game(5, RULESET);
  assert.equal(game.play("A1").ok, true);
  assert.equal(game.play("E5").ok, true);
  const quiet = game.play("B1");
  assert.equal(quiet.ok, true);
  assert.equal(quiet.ok && wasCaptureMove(quiet.events), false);
  assert.deepEqual(explainCaptureGoEnd(game, kernel), []);
});
