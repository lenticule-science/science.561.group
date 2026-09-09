import assert from "node:assert/strict";
import test from "node:test";
import { charge, chargeValue } from "@lenticule-science/articulating/predicating/positing";
import { corroborating, refuting, settleReading, signing } from "../dist/reading.mjs";

test("settles contradictory witnesses through the canonical FOUR charge", () => {
  const reading = settleReading("question", "2026-09-08", [corroborating("tarot", "Star"), refuting("runes", "Star")]);
  assert.equal(reading.value, "stable");
  assert.equal(reading.panel.length, 2);
});

test("keeps a practice-provided charge intact", () => {
  const reading = settleReading("question", "2026-09-08", [signing("iching", "changing line", charge(chargeValue("stable")))]);
  assert.equal(reading.value, "stable");
});
