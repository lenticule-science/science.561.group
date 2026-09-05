import { readFileSync } from "node:fs";

import { action, jsonResource, type Action, type JsonValue } from "@emsenn/relating";

import { lakotaResearchObligations, type LakotaObligationMaturity } from "./obligations.mjs";

const maturityUrl = new URL("../data/maturity.json", import.meta.url);

export type LakotaMaturity = LakotaObligationMaturity;

export interface LakotaMaturityEntry {
  readonly id: string;
  readonly maturity: LakotaMaturity;
  readonly area: string;
  readonly summary: string;
  readonly evidence: string;
  readonly limits: string;
}

export interface LakotaProvenInLeanStatus {
  readonly status: "none-claimed";
  readonly evidence: string;
  readonly upgradeEvidence: string;
}

export interface LakotaMaturityData {
  readonly kind: "communicating-in-lakota.maturity";
  readonly entries: readonly LakotaMaturityEntry[];
  readonly provenInLean: LakotaProvenInLeanStatus;
}

export interface LakotaMaturityReport extends LakotaMaturityData {
  readonly maturityTags: readonly LakotaMaturity[];
  readonly roadmapObligations: readonly string[];
}

function parseMaturity(): LakotaMaturityData {
  return Object.freeze(JSON.parse(readFileSync(maturityUrl, "utf8")) as LakotaMaturityData);
}

export const lakotaMaturityData: LakotaMaturityData = parseMaturity();

export function readLakotaMaturity(): LakotaMaturityReport {
  return Object.freeze({
    ...lakotaMaturityData,
    maturityTags: Object.freeze(["Built+green", "Proven-in-Lean", "Research-grade", "Roadmap"] as const),
    roadmapObligations: Object.freeze(lakotaResearchObligations.map((obligation) => obligation.id)),
  });
}

export const readLakotaMaturityAction: Action = action({
  verb: "read-lakota-maturity",
  inputFormat: "json",
  outputFormat: "json",
  summary: "Read the maturity-graded computational Lakota capability report.",
  description: "Domain: ignored JSON input. Codomain: Built+green, Research-grade, Proven-in-Lean, and Roadmap status for package-local Lakota capabilities.",
  run: (): JsonValue => jsonResource(readLakotaMaturity(), "Lakota maturity report"),
});
