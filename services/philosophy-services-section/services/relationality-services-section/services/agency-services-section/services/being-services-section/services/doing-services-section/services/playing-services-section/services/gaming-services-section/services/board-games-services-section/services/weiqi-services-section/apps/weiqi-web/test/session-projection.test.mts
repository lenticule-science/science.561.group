import assert from "node:assert/strict";
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
