import { corroborating, refuting, settleReading } from "@lenticule-science/divining/reading";
import { reduceDate } from "@lenticule-science/divining/src/divination/numerology.mjs";
import { dailySpread } from "@lenticule-science/divining/src/divination/tarot.mjs";
export const buildSpreadPanel = (spread) => Object.freeze(spread.positions.map(({ card, orientation }) => orientation === "upright" ? corroborating("tarot", card.name) : refuting("tarot", card.name)));
export const buildReductionPanel = (reduction) => Object.freeze(reduction.steps.map((step) => corroborating("numerology", String(step))));
export function readSpread(input, question) { const spread = typeof input === "string" ? dailySpread(input) : input; return settleReading(question, spread.date, buildSpreadPanel(spread)); }
export function readReduction(input, question) { const reduction = reduceDate(String(input)); return settleReading(question, reduction.date, buildReductionPanel(reduction)); }
