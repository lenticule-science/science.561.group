import { corroborating, settleReading } from "@lenticule-science/divining/reading";
import { seasonalPosition } from "@lenticule-science/divining/src/starknowledge/starknowledge.mjs";
export function buildSkyPanel(date){const sky=seasonalPosition(date);const panel=[corroborating("starknowledge",sky.season)];if(sky.threshold)panel.push(corroborating("starknowledge",sky.threshold));if(sky.journey)panel.push(corroborating("starknowledge",sky.journey.constellation));return Object.freeze(panel);}
export const readSky=(date,question)=>settleReading(question,date,buildSkyPanel(date));
