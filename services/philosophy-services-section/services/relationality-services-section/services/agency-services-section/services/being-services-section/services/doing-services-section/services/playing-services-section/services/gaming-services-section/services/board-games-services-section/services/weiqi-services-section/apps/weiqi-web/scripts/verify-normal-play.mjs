// Receiver check for the exact browser kernel and normal-game surface that
// `wrangler deploy` publishes. This complements source tests with the
// release artifact's player-critical flow without requiring a browser or a
// network deployment.

import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import * as kernel from "../public/js/kernel/index.mjs";
import { chooseInfluenceMove } from "../public/js/bot.mjs";

const playHtml = await readFile(new URL("../public/play.html", import.meta.url), "utf8");
const playApp = await readFile(new URL("../public/js/play-app.mjs", import.meta.url), "utf8");

for (const requiredSurface of [
  "Play 9×9 Weiqi",
  "id=\"pass-btn\"",
  "id=\"resign-btn\"",
  "id=\"game-result\"",
  "src=\"js/play-app.mjs\"",
]) {
  assert.ok(playHtml.includes(requiredSurface), `normal-play page is missing ${requiredSurface}`);
}
assert.ok(!playHtml.includes("Capture Go"), "normal-play page still presents Capture Go");
assert.ok(playApp.includes("You resigned. White wins."), "resignation result is not wired into the public app");
assert.ok(playApp.includes("Provisional Chinese area count:"), "area-count result is not wired into the public app");

const replyGame = new kernel.Game(9, "chinese");
assert.equal(replyGame.play("E5").ok, true, "the player opening must be legal");
const aiReply = chooseInfluenceMove(replyGame, kernel, () => 0);
assert.notEqual(aiReply, "pass", "the selected local AI must reply while placements remain");
assert.equal(replyGame.isLegal(aiReply), true, "the selected local AI reply must be legal");
assert.equal(replyGame.play(aiReply).ok, true, "the selected local AI reply must apply");
assert.equal(replyGame.current.toMove, kernel.BLACK, "play returns to the player after the AI reply");

// Black surrounds and captures White D4. A normal Chinese-rules match must
// continue after that capture; Capture Go behavior is explicitly rejected.
const captureGame = new kernel.Game(9, "chinese");
for (const move of ["E4", "D4", "D3", "A1", "C4", "A2", "D5"]) {
  assert.equal(captureGame.play(move).ok, true, `${move} must be a legal setup move`);
}
assert.equal(captureGame.current.board[kernel.coordToPoint(9, 9, "D4")], kernel.EMPTY, "D4 must be captured");
assert.equal(captureGame.mainPhaseEnded, false, "a capture must not end a normal match");

const scoreGame = new kernel.Game(9, "chinese");
assert.equal(scoreGame.play("C3").ok, true);
assert.equal(scoreGame.play("D3").ok, true);
assert.equal(scoreGame.play("pass").ok, true);
const finalPass = scoreGame.play("pass");
assert.equal(finalPass.ok, true);
assert.equal(scoreGame.mainPhaseEnded, true, "two passes must end the match");
assert.ok(finalPass.events.some((event) => event.type === "game-ended"), "final pass must emit game-ended");
const score = kernel.scoreArea(scoreGame.current, scoreGame.ruleset);
assert.ok(Number.isFinite(score.blackScore) && Number.isFinite(score.whiteScore), "area count must be numeric");
assert.match(score.margin, /^(Black|White) by \d+(?:\.\d+)?$|^Draw$/, "area count must name a result");

console.log("normal-play release receiver check passed");
