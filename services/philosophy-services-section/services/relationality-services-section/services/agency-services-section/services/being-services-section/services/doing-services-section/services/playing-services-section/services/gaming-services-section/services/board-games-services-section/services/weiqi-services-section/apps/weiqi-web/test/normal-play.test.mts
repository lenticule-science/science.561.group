import { test } from "node:test";
import assert from "node:assert/strict";
import { Game } from "@red-cup-engineering/weiqi-engine";
import * as kernel from "@red-cup-engineering/weiqi-engine";
import { chooseInfluenceMove } from "../public/js/bot.mjs";

test("the public opponent makes a legal White reply in a normal 9x9 game", () => {
  const game = new Game(9, "chinese");
  const humanMove = game.play("E5");
  assert.equal(humanMove.ok, true);
  assert.equal(game.mainPhaseEnded, false);

  const aiMove = chooseInfluenceMove(game, kernel, () => 0);
  assert.notEqual(aiMove, "pass");
  assert.equal(game.isLegal(aiMove), true);
  const reply = game.play(aiMove);
  assert.equal(reply.ok, true);
  assert.equal(game.current.toMove, kernel.BLACK);
  assert.equal(game.history.length, 3);
});

test("two passes, rather than a capture, end a normal match", () => {
  const game = new Game(9, "chinese");
  assert.equal(game.play("C3").ok, true);
  assert.equal(game.play("D3").ok, true);
  assert.equal(game.play("C4").ok, true);
  assert.equal(game.play("D4").ok, true);
  assert.equal(game.play("pass").ok, true);
  const finalPass = game.play("pass");
  assert.equal(finalPass.ok, true);
  assert.equal(game.mainPhaseEnded, true);
  if (finalPass.ok) assert.ok(finalPass.events.some((event) => event.type === "game-ended"));
});
