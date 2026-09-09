import assert from "node:assert/strict";
import test from "node:test";
import { astrology, calendar, divination, geomancy, iching, ifa, liturgy, numogram, runes, starknowledge } from "../dist/index.mjs";
import { settleReading } from "../dist/reading.mjs";

test("every restored reader executes through canonical settlement", () => {
  assert.equal(calendar.readDate("2026-01-02", "q").value, "absurd");
  assert.ok(divination.readSpread("2026-09-08", "q").panel.length > 0);
  assert.ok(geomancy.readShield("q", "q").panel.length === 7);
  assert.ok(iching.read("q", "q").panel.length === 6);
  assert.equal(ifa.readCast("q", "q").panel.length, 9);
  assert.ok(runes.readCast("q", "q").panel.length > 0);
  assert.ok(numogram.read("q", "q").panel.length >= 3);
  assert.ok(liturgy.readLections("2026-09-08", "q").panel.length > 0);
  assert.ok(starknowledge.readSky("2026-03-20", "q").panel.length > 0);
  assert.ok(astrology.readChart(astrology.computeChart("2026-09-08T00:00:00Z"), "q").cut.includes("2026"));
});

test("the restored readers retain their practice-specific evidence laws", () => {
  // Calendar and sky observation keep an absent optional marker silent.
  assert.equal(calendar.readDate("2026-01-02", "no marker").value, "absurd");

  // A neutral geomantic figure is explicit both-sided evidence, rather than an
  // omitted or one-polarity sign.
  const neutralShield = {
    mothers: [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]],
    rightWitness: [1, 1, 1, 1], leftWitness: [1, 1, 1, 1], judge: [1, 1, 1, 1],
  };
  assert.equal(geomancy.readShield("neutral", "q").panel.length, 7);
  assert.equal(
    settleReading("q", "neutral", geomancy.buildShieldPanel(neutralShield)).value,
    "stable",
  );

  // Old (6/9) I Ching lines retain their changing/both charge.
  const changingCast = {
    label: "changing", lines: [6, 7, 8, 9, 7, 8].map((value, index) => ({
      position: index + 1, value, polarity: value === 7 || value === 9 ? "yang" : "yin",
      kind: value === 6 || value === 9 ? "old" : "young", changing: value === 6 || value === 9,
    })),
  };
  assert.equal(
    settleReading("q", "changing", iching.buildCastPanel(changingCast)).value,
    "stable",
  );

  // Ifa exposes only eight public binary marks plus an Odu parity marker.
  const ifaPanel = ifa.buildPanelFromCast({ marks: [1, 0, 1, 0, 1, 0, 1, 0], compound: "public-odu" });
  assert.equal(ifaPanel.length, 9);
  assert.deepEqual(ifaPanel.map(({ label }) => label), ["pos0", "pos1", "pos2", "pos3", "pos4", "pos5", "pos6", "pos7", "odu:public-odu"]);

  // A non-invertible rune remains upright even when a hand-supplied cast says
  // otherwise; orientation still decides an invertible rune's charge.
  const runePanel = runes.buildCastPanel({ date: "runes", drawn: [
    { rune: "Gebo", orientation: "upright" }, { rune: "Fehu", orientation: "reversed" },
  ] });
  assert.deepEqual(runePanel.map(({ label }) => label), ["Gebo", "Fehu"]);
  assert.equal(settleReading("q", "runes", runePanel).value, "stable");

  // The chart reads only present astronomy-derived aspect facts and preserves its instant.
  const chart = astrology.computeChart("2026-09-08T00:00:00Z");
  const chartReading = astrology.readChart(chart, "chart");
  assert.equal(chartReading.cut, chart.time);
  assert.deepEqual(chartReading.panel.map(({ source }) => source), Array(chartReading.panel.length).fill("astrology"));
});
