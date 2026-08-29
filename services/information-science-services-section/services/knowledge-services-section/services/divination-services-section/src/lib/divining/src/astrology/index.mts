// astrology-topology: the astrology domain as mathematics.
//
// The zodiac circle and its quotients (zodiac), the chart carrier (chart),
// angular relations witnessed within orbs (aspects), the Sun-Moon elongation
// circle (lunation), zero-crossing machinery (events), time scales (time),
// and the ephemeris itself (ephemeris) -- time -> chart with stated provenance.
//
// Ported into Divination without the settling-core reading layer: see
// ../../../../content/documents/sign-reading-as-settling.md for what was left behind.

export {
  ZODIAC_SIGNS,
  normalizeDegrees,
  signedArc,
  angularSeparation,
  signPlacement,
  type ZodiacSign,
  type ZodiacElement,
  type ZodiacModality,
  type SignPlacement,
} from "./zodiac.mts";

export {
  BODIES,
  BODY_GLYPHS,
  STATIONARY_BAND,
  motionOf,
  type Body,
  type BodyState,
  type Motion,
  type Chart,
  type ChartProvenance,
} from "./chart.mts";

export {
  ASPECTS,
  aspectsInChart,
  type Aspect,
  type AspectName,
  type AspectHit,
  type AspectSearchOptions,
} from "./aspects.mts";

export { LUNAR_PHASES, lunationOf, type Lunation, type LunarPhaseName } from "./lunation.mts";

export {
  findZeroCrossings,
  findCircleCrossings,
  type Crossing,
  type CrossingDirection,
  type ScanOptions,
} from "./events.mts";

export {
  J2000,
  julianDayFromIso,
  isoFromJulianDay,
  deltaTSeconds,
  terrestrialJulianDay,
  julianCenturies,
} from "./time.mts";

export {
  EPHEMERIS_PROVENANCE,
  computeChart,
  bodyLongitude,
  findIngresses,
  findStations,
  findExactAspects,
  findLunationQuarters,
  type IngressEvent,
  type StationEvent,
  type ExactAspectEvent,
  type LunationQuarterEvent,
} from "./ephemeris.mts";
