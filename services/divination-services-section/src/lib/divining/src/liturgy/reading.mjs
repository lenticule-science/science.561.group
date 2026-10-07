import { corroborating, refuting, settleReading } from "@lenticule-science/divining/reading";
import { lectionFor } from "@lenticule-science/divining/src/liturgy/lection.mjs";
import { romanDay } from "@lenticule-science/divining/src/liturgy/roman.mjs";
export function buildLectionPanel(iso){const panel=[]; const rcl=lectionFor(iso,"rcl"); const roman=lectionFor(iso,"roman"); if(rcl.outcome==="found")panel.push(corroborating("rcl",rcl.entry.name)); if(roman.outcome==="found")panel.push(corroborating("roman",roman.entry.name)); if(rcl.outcome==="found"&&roman.outcome==="found"&&rcl.entry.name!==roman.entry.name) panel.push(refuting("liturgy","cross-tradition-divergence")); const day=romanDay(iso); panel.push(corroborating("roman",day.season)); return Object.freeze(panel);}
export const readLections=(iso,question)=>settleReading(question,iso,buildLectionPanel(iso));
