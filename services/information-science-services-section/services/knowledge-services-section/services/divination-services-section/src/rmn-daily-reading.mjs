import { computeChart, signPlacement, aspectsInChart, lunationOf, BODIES } from "@lenticule-science/divining/dist/astrology/index.mjs";
import { lectionFor } from "@lenticule-science/divining/dist/liturgy/index.mjs";

const MARK = Object.freeze(["base"]);
const UNIT = Object.freeze(["unit"]);

function productType(...members) {
  if (members.length < 2) throw new Error("an RMN product requires at least two members");
  return members.slice(0, -1).reduceRight((right, left) => ["prod", left, right], members.at(-1));
}

function productTerm(...members) {
  if (members.length < 2) throw new Error("an RMN product term requires at least two members");
  return members.slice(0, -1).reduceRight((right, left) => ["pair", left, right], members.at(-1));
}

function mark(value) { return ["mark", String(value)]; }
function decimal(value, field) {
  if (typeof value !== "number" || !Number.isFinite(value)) throw new Error(`${field} is not a finite measured value`);
  return mark(value.toString());
}
function listTerm(values, elementType) {
  return values.reduceRight((tail, head) => ["cons", head, tail], ["nil", elementType]);
}

export const OPTIONAL_MARK_TYPE = Object.freeze(["sum", UNIT, MARK]);
export const SIGN_PLACEMENT_TYPE = Object.freeze(productType(MARK, MARK));
export const LUNATION_TYPE = Object.freeze(productType(MARK, MARK, MARK));
export const ASPECT_TYPE = Object.freeze(productType(MARK, MARK, MARK, MARK, MARK, MARK));
export const PROVENANCE_TYPE = Object.freeze(productType(MARK, MARK));
export const LECTIONARY_READING_TYPE = Object.freeze(productType(MARK, MARK, OPTIONAL_MARK_TYPE, OPTIONAL_MARK_TYPE));
export const LECTIONARY_ENTRY_TYPE = Object.freeze(productType(MARK, MARK, MARK, MARK, MARK, ["list", LECTIONARY_READING_TYPE], MARK));
export const LECTIONARY_ABSENCE_TYPE = Object.freeze(productType(MARK, MARK, MARK));
export const LECTION_TYPE = Object.freeze(["sum", LECTIONARY_ENTRY_TYPE, LECTIONARY_ABSENCE_TYPE]);
export const DAILY_READING_TYPE = Object.freeze(productType(
  MARK,
  SIGN_PLACEMENT_TYPE,
  SIGN_PLACEMENT_TYPE,
  LUNATION_TYPE,
  ["list", ASPECT_TYPE],
  PROVENANCE_TYPE,
  LECTION_TYPE,
));

function optionalMark(value) {
  return value === undefined ? ["left", ["star"], MARK] : ["right", UNIT, mark(value)];
}

function signTerm(placement) {
  return productTerm(mark(placement.sign.name), decimal(placement.degreeInSign, "degreeInSign"));
}

function aspectTerm(hit) {
  return productTerm(
    mark(hit.bodyA),
    mark(hit.bodyB),
    mark(hit.aspect.name),
    decimal(hit.separation, "aspect separation"),
    decimal(hit.offset, "aspect offset"),
    mark(hit.phase),
  );
}

function lectionTerm(lection) {
  if (lection.outcome === "found") {
    const entry = lection.entry;
    const readings = entry.readings.map((reading) => productTerm(
      mark(reading.role), mark(reading.citation), optionalMark(reading.track), optionalMark(reading.alternativeCitation),
    ));
    const value = productTerm(
      mark(entry.tradition), mark(entry.service), mark(entry.date), mark(entry.cycle), mark(entry.name),
      listTerm(readings, LECTIONARY_READING_TYPE), mark(entry.provenance),
    );
    return ["left", value, LECTIONARY_ABSENCE_TYPE];
  }
  if (lection.outcome === "no-entry-recorded") {
    return ["right", LECTIONARY_ENTRY_TYPE, productTerm(mark(lection.date), mark(lection.tradition), mark(lection.note))];
  }
  throw new Error(`unknown lection outcome ${String(lection.outcome)}`);
}

export function computeDailyReadingTerm(date, tradition) {
  if (typeof date !== "string" || !/^\d{4}-\d{2}-\d{2}$/u.test(date)) throw new Error("date must be an ISO calendar date");
  const instant = `${date}T00:00:00.000Z`;
  if (new Date(instant).toISOString().slice(0, 10) !== date) throw new Error("date must be a real ISO calendar date");
  if (!["rcl", "roman"].includes(tradition)) throw new Error("tradition must be rcl or roman");
  const chart = computeChart(instant);
  const sun = signPlacement(chart.bodies.sun.longitude);
  const moon = signPlacement(chart.bodies.moon.longitude);
  const lunation = lunationOf({ sun: chart.bodies.sun, moon: chart.bodies.moon });
  const chartStates = {};
  for (const body of BODIES) chartStates[body] = chart.bodies[body];
  const aspects = aspectsInChart(chartStates).map(aspectTerm);
  return productTerm(
    mark(instant),
    signTerm(sun),
    signTerm(moon),
    productTerm(mark(lunation.phase), decimal(lunation.illuminatedFraction, "illuminated fraction"), mark(lunation.trend)),
    listTerm(aspects, ASPECT_TYPE),
    productTerm(mark(chart.provenance.algorithm), mark(chart.provenance.accuracy)),
    lectionTerm(lectionFor(date, tradition)),
  );
}
