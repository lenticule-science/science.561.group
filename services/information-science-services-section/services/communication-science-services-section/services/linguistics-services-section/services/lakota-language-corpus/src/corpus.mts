import { readFileSync } from "node:fs";

import { action, jsonResource, type Action, type JsonValue } from "@emsenn/relating";

const corpusUrl = new URL("../data/corpus.jsonl", import.meta.url);

export interface LakotaCorpusSource {
  readonly label: string;
  readonly url?: string;
  readonly locator?: string;
}

export interface LakotaExpectedWord {
  readonly text: string;
  readonly tags: readonly string[];
  readonly features: readonly string[];
}

export interface LakotaExpectedGeneration {
  readonly root: string;
  readonly features: readonly string[];
  readonly surface: string;
}

export interface LakotaCorpusEntry {
  readonly kind: "communicating-in-lakota.corpus-entry";
  readonly id: string;
  readonly maturity: "Built+green" | "Research-grade" | "Roadmap";
  readonly text: string;
  readonly source: LakotaCorpusSource;
  readonly expect: {
    readonly words: readonly LakotaExpectedWord[];
    readonly arcs?: readonly unknown[];
    readonly generation?: LakotaExpectedGeneration;
  };
}

export interface LakotaGenerationRequest {
  readonly root?: string;
  readonly features?: readonly string[];
  readonly template?: string;
}

export interface LakotaGenerationResult {
  readonly kind: "communicating-in-lakota.generation";
  readonly query: LakotaGenerationRequest;
  readonly candidates: readonly {
    readonly surface: string;
    readonly root: string;
    readonly features: readonly string[];
    readonly source: LakotaCorpusSource;
    readonly corpusEntry: string;
  }[];
}

function parseCorpus(): readonly LakotaCorpusEntry[] {
  const text = readFileSync(corpusUrl, "utf8").trim();
  if (text === "") return Object.freeze([]);
  return Object.freeze(text.split(/\r?\n/u).map((line) =>
    Object.freeze(JSON.parse(line) as LakotaCorpusEntry)));
}

function hasAll(candidate: readonly string[], expected: readonly string[]): boolean {
  return expected.every((feature) => candidate.includes(feature));
}

function generationOf(entry: LakotaCorpusEntry): LakotaGenerationResult["candidates"][number] | null {
  const generation = entry.expect.generation;
  if (generation === undefined) return null;
  return Object.freeze({
    surface: generation.surface,
    root: generation.root,
    features: generation.features,
    source: entry.source,
    corpusEntry: entry.id,
  });
}

export const corpus: readonly LakotaCorpusEntry[] = parseCorpus();

export function generateLakotaForm(input: LakotaGenerationRequest): LakotaGenerationResult {
  const requestedFeatures = input.features ?? [];
  const candidates = corpus
    .map(generationOf)
    .filter((candidate): candidate is NonNullable<ReturnType<typeof generationOf>> => candidate !== null)
    .filter((candidate) => input.root === undefined || candidate.root === input.root)
    .filter((candidate) => input.template === undefined || candidate.features.includes(`template:${input.template}`))
    .filter((candidate) => hasAll(candidate.features, requestedFeatures));

  return Object.freeze({
    kind: "communicating-in-lakota.generation" as const,
    query: Object.freeze({
      ...(input.root === undefined ? {} : { root: input.root }),
      ...(input.features === undefined ? {} : { features: [...input.features] }),
      ...(input.template === undefined ? {} : { template: input.template }),
    }),
    candidates: Object.freeze(candidates),
  });
}

function asGenerationRequest(input: unknown): LakotaGenerationRequest {
  if (typeof input !== "object" || input === null) return {};
  const record = input as Record<string, unknown>;
  const features = Array.isArray(record["features"])
    ? record["features"].filter((feature): feature is string => typeof feature === "string")
    : undefined;
  return Object.freeze({
    ...(typeof record["root"] === "string" ? { root: record["root"] } : {}),
    ...(features === undefined ? {} : { features }),
    ...(typeof record["template"] === "string" ? { template: record["template"] } : {}),
  });
}

export const readLakotaCorpusAction: Action = action({
  verb: "read-lakota-corpus",
  inputFormat: "json",
  outputFormat: "json",
  summary: "Read the witnessed Lakota computational corpus.",
  description: "Domain: ignored JSON input. Codomain: package-local witnessed forms with expected parse features and finite generation targets.",
  run: (): JsonValue => jsonResource(corpus, "Lakota corpus"),
});

export const generateLakotaFormAction: Action = action({
  verb: "generate-lakota-form",
  inputFormat: "json",
  outputFormat: "json",
  summary: "Generate finite witnessed Lakota forms from root and feature constraints.",
  description: "Domain: JSON with optional root, template, and features. Codomain: matching package-local corpus forms; this is finite corpus readback, not a full Lakota generator.",
  run: (input: unknown): JsonValue =>
    jsonResource(generateLakotaForm(asGenerationRequest(input)), "Lakota generated form candidates"),
});
