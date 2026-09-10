import assert from "node:assert/strict";
import test from "node:test";
import * as kernel from "../public/js/kernel/index.mjs";
import { buildStudyReplay, describeRulesObservation } from "../public/js/review-app.mjs";

function admittedSession(commands: Array<{ kind: "play"; move: string } | { kind: "pass" }>) {
  let session = kernel.createWeiqiGameSession({ size: 9, ruleset: "chinese" });
  for (const command of commands) {
    const outcome = kernel.admitWeiqiGameCommand(session, session.version, command);
    assert.equal(outcome.ok, true);
    if (!outcome.ok) throw new Error(outcome.reason);
    session = outcome.session;
  }
  return session;
}

test("Study Replay derives every board frame and observation from the accepted versioned session", () => {
  const session = admittedSession([
    { kind: "play", move: "C3" }, { kind: "play", move: "C4" },
    { kind: "play", move: "B4" }, { kind: "play", move: "A1" },
    { kind: "play", move: "D4" }, { kind: "play", move: "A2" },
    { kind: "play", move: "C5" },
  ]);
  const study = buildStudyReplay(session);

  assert.equal(study.version, session.version);
  assert.equal(study.frames.length, session.version + 1);
  assert.equal(study.frames[0].version, 0);
  assert.deepEqual(study.frames.at(-1)?.board, [...kernel.materializeWeiqiGame(session).current.board]);
  assert.equal(study.frames.at(-1)?.events.some((event) => event.type === "capture"), true);
});

test("Study Replay refuses a session whose command history is not replayable", () => {
  const session = admittedSession([{ kind: "play", move: "C3" }]);
  const invalid = { ...session, version: 2 };
  assert.throws(() => buildStudyReplay(invalid), /version/u);
});

test("rules observations are never labeled as engine analysis or move judgment", () => {
  assert.equal(describeRulesObservation({ type: "atari-given" }), "Rules observation: atari given.");
  assert.doesNotMatch(describeRulesObservation({ type: "capture" }), /engine|good|bad|best|mistake/ui);
});
