import assert from "node:assert/strict";
import test from "node:test";

import * as calendar from "../dist/calendar/index.mjs";
import * as divination from "../dist/divination/index.mjs";
import * as geomancy from "../dist/geomancy/index.mjs";
import * as iching from "../dist/iching/index.mjs";
import * as ifa from "../dist/ifa/index.mjs";
import * as liturgy from "../dist/liturgy/index.mjs";
import * as numogram from "../dist/numogram/index.mjs";
import * as runes from "../dist/runes/index.mjs";
import * as starknowledge from "../dist/starknowledge/index.mjs";

test("each non-astrology family exports and performs its deterministic domain operation", () => {
  assert.equal(calendar.easterDate(2026), "2026-04-05");
  assert.equal(divination.dailySpread("2026-09-08").positions.length, 1);
  assert.equal(liturgy.romanDay("2026-09-08").cycles.sunday, "A");
  assert.equal(geomancy.castShield("tunesday").mothers.length, 4);
  assert.equal(iching.castIChing("tunesday").lines.length, 6);
  assert.equal(ifa.castOpele("tunesday").marks.length, 8);
  assert.equal(runes.castRunes("tunesday").drawn.length, 3);
  assert.equal(numogram.castNumogram("tunesday").kind, "numogram.cast");
  assert.equal(starknowledge.seasonalPosition("2026-09-08").season, "blokétu (summer)");
});
