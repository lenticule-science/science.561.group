// divination-topology: the divination domain as mathematics.
//
// The tarot deck and spreads (tarot), numerological reduction (numerology),
// and the daily-indicators carrier (indicators). Ported into Divination
// with typed readings settled through the shared Articulating FOUR algebra.

export {
  TAROT_DECK,
  SEEDED_DRAW_METHOD,
  drawCards,
  dailySpread,

} from "@lenticule-science/divining/src/divination/tarot.mjs";

export { MASTER_NUMBERS, reduceDate } from "@lenticule-science/divining/src/divination/numerology.mjs";
export { buildSpreadPanel, buildReductionPanel, readSpread, readReduction } from "@lenticule-science/divining/src/divination/reading.mjs";

export {

} from "@lenticule-science/divining/src/divination/indicators.mjs";
