import { readFileSync } from "node:fs";

import { action, jsonResource, type Action, type JsonValue } from "@emsenn/relating";

const obligationsUrl = new URL("../data/research-obligations.json", import.meta.url);

export type LakotaObligationMaturity = "Built+green" | "Proven-in-Lean" | "Research-grade" | "Roadmap";

export interface LakotaResearchObligation {
  readonly id: string;
  readonly maturity: LakotaObligationMaturity;
  readonly area: string;
  readonly summary: string;
  readonly currentEvidence: string;
  readonly upgradeEvidence: string;
}

export interface LakotaResearchObligationReport {
  readonly kind: "communicating-in-lakota.research-obligations";
  readonly maturityTags: readonly LakotaObligationMaturity[];
  readonly obligations: readonly LakotaResearchObligation[];
}

function parseObligations(): readonly LakotaResearchObligation[] {
  return Object.freeze(JSON.parse(readFileSync(obligationsUrl, "utf8")) as LakotaResearchObligation[]);
}

export const lakotaResearchObligations: readonly LakotaResearchObligation[] = parseObligations();

export function readLakotaResearchObligations(): LakotaResearchObligationReport {
  return Object.freeze({
    kind: "communicating-in-lakota.research-obligations" as const,
    maturityTags: Object.freeze(["Built+green", "Proven-in-Lean", "Research-grade", "Roadmap"] as const),
    obligations: lakotaResearchObligations,
  });
}

export const readLakotaResearchObligationsAction: Action = action({
  verb: "read-lakota-research-obligations",
  inputFormat: "json",
  outputFormat: "json",
  summary: "Read remaining computational Lakota research obligations.",
  description: "Domain: ignored JSON input. Codomain: package-local obligations with maturity tags, current evidence, and upgrade evidence.",
  run: (): JsonValue =>
    jsonResource(readLakotaResearchObligations(), "Lakota research obligations"),
});
