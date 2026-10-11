import { corroborating, settleReading } from "@lenticule-science/divining/reading";
import { aspectsInChart } from "@lenticule-science/divining/src/astrology/aspects.mjs";

export function buildChartPanel(chart){return Object.freeze(aspectsInChart(chart.bodies).map((hit)=>corroborating("astrology",`${hit.bodyA}-${hit.aspect.name}-${hit.bodyB}`)));}
export const readChart=(chart,question)=>settleReading(question,chart.time,buildChartPanel(chart));
