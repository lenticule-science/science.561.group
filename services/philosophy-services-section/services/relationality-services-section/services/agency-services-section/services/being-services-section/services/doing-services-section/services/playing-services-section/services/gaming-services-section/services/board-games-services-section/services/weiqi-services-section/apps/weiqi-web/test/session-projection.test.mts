import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";
import * as kernel from "../public/js/kernel/index.mjs";

test("the browser projection admits versioned play and exports its shared session as SGF", () => {
  const initial = kernel.createWeiqiGameSession({ size: 9, ruleset: "chinese" });
  const admitted = kernel.admitWeiqiGameCommand(initial, initial.version, {
    kind: "play",
    move: "C3",
  });

  assert.equal(admitted.ok, true);
  if (!admitted.ok) return;
  assert.equal(admitted.session.version, 1);
  assert.match(
    kernel.gameRecordToSgf(kernel.weiqiSessionToSgfRecord(admitted.session)),
    /;B\[cc\]/u,
  );
});

test("Play hands its admitted session to Study Replay without another game model", async () => {
  const [page, app] = await Promise.all([
    readFile(new URL("../public/play.html", import.meta.url), "utf8"),
    readFile(new URL("../public/js/play-app.mjs", import.meta.url), "utf8"),
  ]);

  assert.match(page, /id="study-game-btn"/u);
  assert.match(app, /history\.pushState\(\{ weiqiSession: session \}, "", "review\.html"\)/u);
});
