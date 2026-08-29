import { action, jsonResource, type Action, type JsonValue } from "@emsenn/relating";

import { corpus, type LakotaCorpusSource } from "./corpus.mjs";
import { lakotaOrthographyRules } from "./orthography.mjs";

export interface LakotaParadigmRequest {
  readonly root?: string;
}

export interface LakotaParadigmCell {
  readonly surface: string;
  readonly normalizedSurface: string;
  readonly variants: readonly string[];
  readonly root: string;
  readonly template: string | null;
  readonly agreement: string | null;
  readonly features: readonly string[];
  readonly corpusEntry: string;
  readonly maturity: "Built+green" | "Research-grade" | "Roadmap";
  readonly source: LakotaCorpusSource;
}

export interface LakotaParadigm {
  readonly root: string;
  readonly cells: readonly LakotaParadigmCell[];
  readonly certainty: "witnessed-finite";
}

export interface LakotaParadigmResult {
  readonly kind: "communicating-in-lakota.paradigms";
  readonly query: LakotaParadigmRequest;
  readonly paradigms: readonly LakotaParadigm[];
}

function featureValue(features: readonly string[], prefix: string): string | null {
  const found = features.find((feature) => feature.startsWith(prefix));
  return found === undefined ? null : found.slice(prefix.length);
}

function variantsFor(surface: string): readonly string[] {
  const rule = lakotaOrthographyRules.find((candidate) => candidate.normalized === surface);
  return Object.freeze(rule?.variants ?? [surface]);
}

function cellFromCorpusEntry(entry: (typeof corpus)[number]): LakotaParadigmCell | null {
  const generation = entry.expect.generation;
  if (generation === undefined) return null;
  return Object.freeze({
    surface: generation.surface,
    normalizedSurface: generation.surface,
    variants: variantsFor(generation.surface),
    root: generation.root,
    template: featureValue(generation.features, "template:"),
    agreement: featureValue(generation.features, "agreement:"),
    features: generation.features,
    corpusEntry: entry.id,
    maturity: entry.maturity,
    source: entry.source,
  });
}

function asParadigmRequest(input: unknown): LakotaParadigmRequest {
  if (typeof input !== "object" || input === null) return {};
  const record = input as Record<string, unknown>;
  return Object.freeze({
    ...(typeof record["root"] === "string" ? { root: record["root"] } : {}),
  });
}

export function generateLakotaParadigms(input: LakotaParadigmRequest = {}): LakotaParadigmResult {
  const cells = corpus
    .map(cellFromCorpusEntry)
    .filter((cell): cell is LakotaParadigmCell => cell !== null)
    .filter((cell) => input.root === undefined || cell.root === input.root);

  const byRoot = new Map<string, LakotaParadigmCell[]>();
  for (const cell of cells) {
    const bucket = byRoot.get(cell.root) ?? [];
    bucket.push(cell);
    byRoot.set(cell.root, bucket);
  }

  const paradigms = [...byRoot.entries()].map(([root, rootCells]) => Object.freeze({
    root,
    cells: Object.freeze(rootCells),
    certainty: "witnessed-finite" as const,
  }));

  return Object.freeze({
    kind: "communicating-in-lakota.paradigms" as const,
    query: Object.freeze({
      ...(input.root === undefined ? {} : { root: input.root }),
    }),
    paradigms: Object.freeze(paradigms),
  });
}

export const generateLakotaParadigmAction: Action = action({
  verb: "generate-lakota-paradigm",
  inputFormat: "json",
  outputFormat: "json",
  summary: "Generate finite witnessed Lakota verb paradigms.",
  description: "Domain: JSON with optional root. Codomain: corpus-backed finite paradigm cells with variant-preserving surfaces; this is witnessed paradigm readback, not productive conjugation.",
  run: (input: unknown): JsonValue =>
    jsonResource(generateLakotaParadigms(asParadigmRequest(input)), "Lakota witnessed paradigms"),
});
