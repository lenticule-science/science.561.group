// astrology-topology: the astrology domain as mathematics.
//
// The zodiac circle and its quotients (zodiac), the chart carrier (chart),
// angular relations witnessed within orbs (aspects), the Sun-Moon elongation
// circle (lunation), zero-crossing machinery (events), time scales (time),
// and the ephemeris itself (ephemeris) -- time -> chart with stated provenance.
//
// Ported into Divination without the settling-core reading layer: see
// ../../../../content/text/documents/sign-reading-as-settling.md for what was left behind.

export {
  ZODIAC_SIGNS,
  normalizeDegrees,
  signedArc,
  angularSeparation,
  signPlacement,

} from "@lenticule-science/divining/src/astrology/zodiac.mjs";

export {
  BODIES, BODY_GLYPHS, STATIONARY_BAND, motionOf,

  J2000, julianDayFromIso, isoFromJulianDay, deltaTSeconds, terrestrialJulianDay, julianCenturies,
  EPHEMERIS_PROVENANCE, computeChart, bodyLongitude, findStations, findExactAspects, findLunationQuarters,
} from "@lenticule-science/astronomy-services-section";

export {
  ASPECTS,
  aspectsInChart,

} from "@lenticule-science/divining/src/astrology/aspects.mjs";

export { LUNAR_PHASES, lunationOf } from "@lenticule-science/divining/src/astrology/lunation.mjs";

export { findIngresses } from "@lenticule-science/divining/src/astrology/events.mjs";
export { buildChartPanel, readChart } from "@lenticule-science/divining/src/astrology/reading.mjs";
