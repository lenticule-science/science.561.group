// Ephemeris Tracking Team — the sellable pay-per-calculation product. Deterministic
// geocentric ecliptic-of-date (tropical, apparent) planetary positions for any
// instant in the validated 1800-2050 window, each response carrying the engine's
// own provenance. No LLM, no network: the moat is that these positions are
// computed and honest, which a base model cannot do. This is the "ephemeris-json"
// endpoint; natural-language / multi-language readings layer on top of it later.
//
// Accuracy is independently audited against astronomy-engine (VSOP87/ELP): every
// body is within its stated bound across 1800-2050. The regression test freezes
// audited positions so accuracy can never silently drift.
import {
  ASPECTS,
  aspectsInChart,
  computeChart,
  lunationOf,
  motionOf,
  signPlacement,
} from "@lenticule-science/divining/astrology";

export const EPHEMERIS_RANGE = Object.freeze({ minYear: 1800, maxYear: 2050 });

export const BODIES = Object.freeze([
  "sun", "moon", "mercury", "venus", "mars",
  "jupiter", "saturn", "uranus", "neptune", "pluto",
]);

// Per-body accuracy bounds in degrees — conservative upper bounds measured by an
// independent audit of this engine against astronomy-engine (VSOP87/ELP) across
// 1800-2050. Surfaced in every response so a buyer knows exactly what they bought.
export const ACCURACY_DEGREES = Object.freeze({
  sun: 0.02, moon: 0.02, mercury: 0.03, venus: 0.02, mars: 0.03,
  jupiter: 0.10, saturn: 0.18, uranus: 0.03, neptune: 0.02, pluto: 0.02,
});

const MAJOR_ASPECTS = Object.freeze(ASPECTS.filter((aspect) => aspect.rank === "major"));

// Validate + normalize an input date to an ISO instant inside the accuracy window.
// Throws TypeError on unparseable input, RangeError outside the validated range —
// the gateway maps these to HTTP 422 rather than serving a number we can't stand behind.
export function normalizeInstant(date) {
  const s = String(date ?? "").trim();
  if (!s) throw new TypeError("date is required (ISO-8601, e.g. 2026-07-18 or 2026-07-18T12:00:00Z)");
  const iso = s.includes("T") ? s : `${s}T00:00:00.000Z`;
  const ms = Date.parse(iso);
  if (Number.isNaN(ms)) throw new TypeError(`invalid date ${JSON.stringify(date)} (expected ISO-8601, e.g. 2026-07-18)`);
  const year = new Date(ms).getUTCFullYear();
  if (year < EPHEMERIS_RANGE.minYear || year > EPHEMERIS_RANGE.maxYear) {
    throw new RangeError(`date out of validated range ${EPHEMERIS_RANGE.minYear}-${EPHEMERIS_RANGE.maxYear} (got year ${year}); ephemeris accuracy is only guaranteed inside this window`);
  }
  return new Date(ms).toISOString();
}

// The product: positions (+ optional aspects) for one instant, with provenance.
export function computeEphemeris(date, { aspects = true } = {}) {
  const time = normalizeInstant(date);
  const chart = computeChart(time);
  const bodies = {};
  for (const body of BODIES) {
    const st = chart.bodies[body];
    if (!st) continue;
    const placement = signPlacement(st.longitude);
    bodies[body] = {
      longitude: Number(st.longitude.toFixed(4)),
      latitude: Number(st.latitude.toFixed(4)),
      speed: Number(st.speed.toFixed(5)),
      sign: placement.sign.name,
      signGlyph: placement.sign.glyph,
      degreeInSign: Number(placement.degreeInSign.toFixed(4)),
      element: placement.sign.element,
      modality: placement.sign.modality,
      motion: motionOf(st),
      retrograde: st.speed < 0,
    };
  }
  const result = {
    tier: "moment-essentials",
    time,
    frame: "geocentric ecliptic-of-date, tropical, apparent",
    semanticLayers: {
      astronomy: {
        facts: ["epoch", "coordinate-frame", "body-longitude", "body-latitude", "angular-speed", "lunar-illumination"],
        status: "computed measurements with stated accuracy and provenance",
      },
      astrology: {
        interpretations: ["tropical-sign", "element", "modality", "motion-state", "lunar-phase", "major-aspect"],
        tradition: "modern Western tropical defaults",
      },
    },
    bodies,
    lunarPhase: (() => {
      const phase = lunationOf(chart.bodies);
      return {
        name: phase.phase,
        elongation: Number(phase.elongation.toFixed(4)),
        illuminatedFraction: Number(phase.illuminatedFraction.toFixed(6)),
        trend: phase.trend,
      };
    })(),
    provenance: chart.provenance,
    accuracy: {
      perBodyDegrees: ACCURACY_DEGREES,
      method: "independently audited against astronomy-engine (VSOP87/ELP)",
      validRange: `${EPHEMERIS_RANGE.minYear}-${EPHEMERIS_RANGE.maxYear}`,
    },
  };
  if (aspects) {
    result.aspects = aspectsInChart(chart.bodies, { aspects: MAJOR_ASPECTS }).map((a) => ({
      bodyA: a.bodyA,
      bodyB: a.bodyB,
      name: a.aspect.name,
      glyph: a.aspect.glyph,
      angle: a.aspect.angle,
      rank: a.aspect.rank,
      allowedOrb: a.aspect.orb,
      separation: Number(a.separation.toFixed(4)),
      offset: Number(a.offset.toFixed(4)),
      phase: a.phase,
    }));
  }
  return result;
}
