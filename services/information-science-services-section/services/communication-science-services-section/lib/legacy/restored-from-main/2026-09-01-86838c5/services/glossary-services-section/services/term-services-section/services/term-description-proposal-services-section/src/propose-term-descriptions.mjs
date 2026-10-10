#!/usr/bin/env node

/**
 * Proposal-only term-description inference adapter.
 *
 * Reads one JSON request per stdin line and emits one JSON proposal/refusal per
 * stdout line. It has no term-directory argument and never changes a Markdown
 * carrier; --proposal-directory writes the same proposal records as JSON only.
 */

import { createInterface } from "node:readline";
import { mkdir, readFile, writeFile } from "node:fs/promises";
import { spawnSync } from "node:child_process";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const HERE = dirname(fileURLToPath(import.meta.url));
const DEFAULT_ENDPOINT = "https://integrate.api.nvidia.com/v1/chat/completions";
const DEFAULT_MODEL = "nvidia/nemotron-3-nano-30b-a3b";
const DEFAULT_TEMPLATE = resolve(HERE, "../content/templates/term-description.prompt.md.j2");
const GITHUB_MODELS_ENDPOINT = "https://models.github.ai/inference/chat/completions";
const COMMON_ABBREVIATIONS = new Set(["e.g.", "i.e.", "etc.", "vs.", "fig.", "eq.", "no.", "mr.", "mrs.", "ms.", "dr.", "prof.", "sr.", "jr.", "st."]);

function text(value, label) {
  if (typeof value !== "string" || value.trim() === "") throw new TypeError(`${label} must be nonempty text`);
  return value.replace(/\r\n?/gu, "\n").trim();
}

function optionalText(value, label) {
  return value === undefined ? "" : text(value, label);
}

export function normalizeTermDescriptionRequest(value) {
  if (!value || typeof value !== "object" || Array.isArray(value)) throw new TypeError("request must be a JSON object");
  const name = text(value.name, "name");
  if (value.aliases !== undefined && (!Array.isArray(value.aliases) || value.aliases.some((alias) => typeof alias !== "string" || alias.trim() === ""))) {
    throw new TypeError("aliases must be an array of nonempty strings when supplied");
  }
  return Object.freeze({
    name,
    aliases: Object.freeze((value.aliases ?? []).map((alias) => alias.replace(/\r\n?/gu, "\n").trim())),
    context: optionalText(value.context, "context"),
    ...(value.source === undefined ? {} : { source: text(value.source, "source") }),
  });
}

function templateValue(value) {
  // JSON is unambiguous to the model and prevents a name from silently becoming
  // prompt syntax. The template remains a transparent Jinja-like text carrier.
  return JSON.stringify(value);
}

export function renderTermDescriptionPrompt(template, request) {
  const values = { name: request.name, aliases: request.aliases, context: request.context };
  return template.replace(/\{\{\s*(name|aliases|context)\s*\}\}/gu, (_, key) => templateValue(values[key]));
}

export function sentencesIn(description) {
  const normalized = text(description, "description").replace(/\s+/gu, " ");
  const boundaries = [];
  for (let index = 0; index < normalized.length; index += 1) {
    const punctuation = normalized[index];
    if (!".!?".includes(punctuation)) continue;
    let after = index + 1;
    while (/["'\u201d\u2019)\]]/u.test(normalized[after] ?? "")) after += 1;
    if (after < normalized.length && !/\s/u.test(normalized[after])) continue;
    if (punctuation === "." && isAbbreviationPeriod(normalized, index, after)) continue;
    boundaries.push(after);
  }
  const sentences = [];
  let start = 0;
  for (const end of boundaries) {
    const sentence = normalized.slice(start, end).trim();
    if (sentence) sentences.push(sentence);
    start = end;
  }
  if (normalized.slice(start).trim()) sentences.push(normalized.slice(start).trim());
  return sentences;
}

function isAbbreviationPeriod(textValue, index, after) {
  const before = textValue.slice(0, index + 1);
  const following = textValue.slice(after).trimStart();
  const token = /([A-Za-z.]+)$/u.exec(before)?.[1]?.toLowerCase() ?? "";
  const initialism = /(?:[a-z]\.){2,}$/u.test(token);
  const singleInitial = /(?:^|\s)[A-Z]\.$/u.test(before);
  const abbreviation = initialism || singleInitial || COMMON_ABBREVIATIONS.has(token);
  if (!abbreviation) return /\d$/u.test(before.slice(0, -1)) && /^\d/u.test(following);
  if (following === "") return false; // An abbreviation can still end a sentence.
  if (COMMON_ABBREVIATIONS.has(token) || initialism) return /^[a-z]/u.test(following);
  // Initials in names (J. R. R. Tolkien) do not end sentences.
  return /^[A-Z]/u.test(following);
}

export function validateTermDescription(value) {
  const errors = [];
  if (!value || typeof value !== "object" || Array.isArray(value)) return Object.freeze(["model response must be a JSON object"]);
  if (Object.keys(value).length !== 1 || !("description" in value)) errors.push("model response must have exactly one key: description");
  if (typeof value.description !== "string" || value.description.trim() === "") return Object.freeze([...errors, "description must be nonempty text"]);
  const normalized = value.description.replace(/\r\n?/gu, "\n").trim().replace(/\s+/gu, " ");
  if (/```|(^|\s)#|(^|\s)[*-]\s/gu.test(normalized)) errors.push("description must be prose, not Markdown");
  const sentences = sentencesIn(normalized);
  if (sentences.length !== 2 || sentences.join(" ") !== normalized) errors.push("description must contain exactly two terminal-punctuated sentences");
  return Object.freeze(errors);
}

export function parseModelJson(output) {
  const source = text(output, "model output");
  const fenced = /```(?:json)?\s*([\s\S]*?)```/iu.exec(source)?.[1] ?? source;
  try {
    return { value: JSON.parse(fenced.trim()) };
  } catch (error) {
    return { error: `model output is not a JSON object: ${error.message}` };
  }
}

export function defaultProvider(env = process.env) {
  const apiKey = env.INFERENCE_OPENAI_COMPATIBLE_API_KEY ?? env.API_KEY_INFERENCE_NVIDIA;
  return Object.freeze({
    endpoint: env.INFERENCE_OPENAI_COMPATIBLE_ENDPOINT ?? env.INFERENCE_NVIDIA_ENDPOINT ?? DEFAULT_ENDPOINT,
    model: env.INFERENCE_OPENAI_COMPATIBLE_MODEL ?? env.INFERENCE_NVIDIA_MODEL ?? DEFAULT_MODEL,
    apiKey,
    apiKeyEnv: env.INFERENCE_OPENAI_COMPATIBLE_API_KEY ? "INFERENCE_OPENAI_COMPATIBLE_API_KEY" : "API_KEY_INFERENCE_NVIDIA",
  });
}

export class OpenAiCompatibleHttpError extends Error {
  constructor(status, body) {
    super(`OpenAI-compatible endpoint ${status}: ${body.slice(0, 500)}`);
    this.name = "OpenAiCompatibleHttpError";
    this.status = status;
  }
}

const transientStatus = new Set([408, 500, 502, 503, 504]);
const delay = (milliseconds) => new Promise((resolveDelay) => setTimeout(resolveDelay, milliseconds));

export async function openAiCompatibleActuate({ endpoint, model, apiKey, prompt, fetch = globalThis.fetch, maxRetries = 2, retryDelayMs = 250, sleep = delay, maxTokens = 350 }) {
  if (typeof apiKey !== "string" || apiKey === "") throw new TypeError("an inference API key is required");
  if (!Number.isInteger(maxRetries) || maxRetries < 0) throw new TypeError("maxRetries must be a nonnegative integer");
  if (!Number.isInteger(retryDelayMs) || retryDelayMs < 0) throw new TypeError("retryDelayMs must be a nonnegative integer");
  if (!Number.isInteger(maxTokens) || maxTokens < 1) throw new TypeError("maxTokens must be a positive integer");
  for (let attempt = 0; ; attempt += 1) {
    try {
      const response = await fetch(endpoint, {
        method: "POST",
        headers: { authorization: `Bearer ${apiKey}`, "content-type": "application/json" },
        body: JSON.stringify({ model, messages: [{ role: "user", content: prompt }], temperature: 0.2, max_tokens: maxTokens }),
      });
      if (!response.ok) throw new OpenAiCompatibleHttpError(response.status, await response.text());
      const payload = await response.json();
      const output = payload.choices?.[0]?.message?.content;
      if (typeof output !== "string" || output.trim() === "") throw new Error("OpenAI-compatible endpoint returned no choices[0].message.content text");
      return output;
    } catch (error) {
      // 429 is deliberately excluded: quota/rate refusal is a real result, not
      // a transient network mishap to conceal by hammering the provider.
      const retryable = error instanceof OpenAiCompatibleHttpError ? transientStatus.has(error.status) : error instanceof TypeError;
      if (!retryable || attempt >= maxRetries) throw error;
      await sleep(retryDelayMs * (2 ** attempt));
    }
  }
}

function repairPrompt(errors) {
  return `The prior response was refused for these deterministic reasons:\n${errors.map((error) => `- ${error}`).join("\n")}\nReturn the corrected JSON object only.`;
}

function proposalRecord(request, provider, fuel, attempts, description) {
  return Object.freeze({
    schema: "term-description-proposal.v1",
    disposition: description === undefined ? "refused" : "proposed",
    request,
    ...(description === undefined ? {} : { proposal: Object.freeze({ description: description.replace(/\s+/gu, " ").trim() }) }),
    provider: Object.freeze({ endpoint: provider.endpoint, model: provider.model }),
    fuel: Object.freeze({ cap: fuel, spent: attempts.length }),
    attempts: Object.freeze(attempts),
  });
}

export async function proposeTermDescription(input, options = {}) {
  const request = normalizeTermDescriptionRequest(input);
  const provider = options.provider ?? defaultProvider(options.env);
  const template = options.template ?? await readFile(options.templateFile ?? DEFAULT_TEMPLATE, "utf8");
  const fuel = options.fuel ?? 3;
  if (!Number.isInteger(fuel) || fuel < 1) throw new TypeError("fuel must be a positive integer");
  const actuate = options.actuate ?? ((prompt) => openAiCompatibleActuate({ ...provider, prompt, fetch: options.fetch, maxRetries: options.maxRetries, retryDelayMs: options.retryDelayMs, sleep: options.sleep }));
  const messages = [renderTermDescriptionPrompt(template, request)];
  const attempts = [];

  for (let attempt = 1; attempt <= fuel; attempt += 1) {
    let raw;
    try {
      raw = await actuate(messages.join("\n\n"));
    } catch (error) {
      attempts.push({ attempt, valid: false, errors: [`actuation failed: ${error.message}`] });
      break;
    }
    const parsed = parseModelJson(raw);
    const errors = parsed.error ? [parsed.error] : validateTermDescription(parsed.value);
    attempts.push({ attempt, valid: errors.length === 0, errors });
    if (errors.length === 0) {
      return proposalRecord(request, provider, fuel, attempts, parsed.value.description);
    }
    messages.push(`Prior response:\n${raw}`, repairPrompt(errors));
  }
  return proposalRecord(request, provider, fuel, attempts);
}

function batchPrompt(requests) {
  return [
    "Produce public glossary descriptions for every requested term.",
    "Return only one JSON object with exactly one key, descriptions.",
    "descriptions must be an array containing exactly one object for each request, keyed by its index; each object has exactly index and description.",
    "Every description must be exactly two ordinary prose sentences: definition first, public-Web context second. No Markdown or unsupported facts.",
    "Requests:", JSON.stringify(requests.map((request, index) => ({ index, name: request.name, aliases: request.aliases, context: request.context })), null, 2),
  ].join("\n\n");
}

function validateBatchResponse(value, length) {
  if (!value || typeof value !== "object" || Array.isArray(value) || Object.keys(value).length !== 1 || !Array.isArray(value.descriptions)) return { errors: ["batch response must be an object with exactly one descriptions array"], descriptions: [] };
  const errors = [];
  const descriptions = new Array(length);
  if (value.descriptions.length !== length) errors.push(`batch response must contain exactly ${length} descriptions`);
  for (const item of value.descriptions) {
    if (!item || typeof item !== "object" || Array.isArray(item) || Object.keys(item).length !== 2 || !Number.isInteger(item.index) || !("description" in item)) { errors.push("each batch description must have exactly integer index and description"); continue; }
    if (item.index < 0 || item.index >= length || descriptions[item.index] !== undefined) { errors.push(`batch description index ${item.index} is missing, out of range, or duplicated`); continue; }
    const itemErrors = validateTermDescription({ description: item.description });
    if (itemErrors.length) errors.push(`description ${item.index}: ${itemErrors.join("; ")}`);
    else descriptions[item.index] = item.description;
  }
  if (descriptions.some((description) => description === undefined)) errors.push("batch response must supply one valid description for every requested index");
  return { errors, descriptions };
}

export async function proposeTermDescriptionBatch(inputs, options = {}) {
  if (!Array.isArray(inputs) || inputs.length === 0) throw new TypeError("batch must contain at least one term request");
  if (inputs.length === 1) return [await proposeTermDescription(inputs[0], options)];
  const requests = inputs.map(normalizeTermDescriptionRequest);
  const provider = options.provider ?? defaultProvider(options.env);
  const fuel = options.fuel ?? 3;
  if (!Number.isInteger(fuel) || fuel < 1) throw new TypeError("fuel must be a positive integer");
  const actuate = options.actuate ?? ((prompt) => openAiCompatibleActuate({ ...provider, prompt, fetch: options.fetch, maxRetries: options.maxRetries, retryDelayMs: options.retryDelayMs, sleep: options.sleep, maxTokens: Math.max(350, inputs.length * 120) }));
  const messages = [batchPrompt(requests)];
  const attempts = [];
  for (let attempt = 1; attempt <= fuel; attempt += 1) {
    let raw;
    try { raw = await actuate(messages.join("\n\n")); }
    catch (error) { attempts.push({ attempt, valid: false, errors: [`actuation failed: ${error.message}`] }); break; }
    const parsed = parseModelJson(raw);
    const verdict = parsed.error ? { errors: [parsed.error], descriptions: [] } : validateBatchResponse(parsed.value, requests.length);
    attempts.push({ attempt, valid: verdict.errors.length === 0, errors: verdict.errors });
    if (verdict.errors.length === 0) return requests.map((request, index) => proposalRecord(request, provider, fuel, attempts, verdict.descriptions[index]));
    messages.push(`Prior response:\n${raw}`, repairPrompt(verdict.errors));
  }
  return requests.map((request) => proposalRecord(request, provider, fuel, attempts));
}

function argumentValue(argv, flag) {
  const index = argv.indexOf(flag);
  return index < 0 ? undefined : argv[index + 1];
}

function githubToken(env) {
  if (env.GITHUB_TOKEN) return env.GITHUB_TOKEN;
  const result = spawnSync("gh", ["auth", "token"], { encoding: "utf8" });
  if (result.status === 0 && result.stdout.trim()) return result.stdout.trim();
  return undefined;
}

export function cliOptions(argv, env) {
  const allowed = new Set(["--endpoint", "--model", "--api-key-env", "--fuel", "--concurrency", "--batch-size", "--max-retries", "--retry-delay-ms", "--proposal-directory", "--template", "--github-models", "--help"]);
  for (const argument of argv) if (argument.startsWith("--") && !allowed.has(argument)) throw new TypeError(`unknown option: ${argument}`);
  if (argv.includes("--help")) return { help: true };
  const apiKeyEnv = argumentValue(argv, "--api-key-env");
  const inherited = defaultProvider(env);
  const fuel = Number(argumentValue(argv, "--fuel") ?? 3);
  const githubModels = argv.includes("--github-models");
  const model = argumentValue(argv, "--model") ?? (githubModels ? env.GITHUB_MODELS_MODEL : inherited.model);
  return {
    fuel,
    concurrency: Number(argumentValue(argv, "--concurrency") ?? 1),
    batchSize: argumentValue(argv, "--batch-size") === undefined ? undefined : Number(argumentValue(argv, "--batch-size")),
    maxRetries: Number(argumentValue(argv, "--max-retries") ?? 2),
    retryDelayMs: Number(argumentValue(argv, "--retry-delay-ms") ?? 250),
    templateFile: argumentValue(argv, "--template"),
    proposalDirectory: argumentValue(argv, "--proposal-directory"),
    provider: { endpoint: argumentValue(argv, "--endpoint") ?? (githubModels ? GITHUB_MODELS_ENDPOINT : inherited.endpoint), model, apiKey: apiKeyEnv ? env[apiKeyEnv] : (githubModels ? githubToken(env) : inherited.apiKey), apiKeyEnv: apiKeyEnv ?? (githubModels ? "GITHUB_TOKEN or gh auth token" : inherited.apiKeyEnv) },
  };
}

function proposalFileStem(name) {
  return name.normalize("NFKD").replace(/[\u0300-\u036f]/gu, "").toLowerCase().replace(/[^a-z0-9]+/gu, "-").replace(/^-+|-+$/gu, "") || "term";
}

async function writeProposal(directory, proposal, index) {
  await mkdir(directory, { recursive: true });
  const path = resolve(directory, `${String(index).padStart(6, "0")}-${proposalFileStem(proposal.request.name)}.json`);
  await writeFile(path, `${JSON.stringify(proposal, null, 2)}\n`, "utf8");
  return path;
}

export async function runCli({ input = process.stdin, output = process.stdout, argv = process.argv.slice(2), env = process.env } = {}) {
  const options = cliOptions(argv, env);
  if (options.help) {
    output.write("Usage: propose-term-descriptions [--endpoint URL] [--model ID] [--api-key-env NAME] [--github-models] [--fuel N] [--concurrency N] [--batch-size N] [--max-retries N] [--retry-delay-ms N] [--template FILE] [--proposal-directory DIR] < requests.ndjson\n");
    return 0;
  }
  if (!options.provider.apiKey) throw new TypeError(`missing ${options.provider.apiKeyEnv}; refusing to call inference unauthenticated`);
  for (const [label, value] of [["fuel", options.fuel], ["concurrency", options.concurrency], ["max-retries", options.maxRetries], ["retry-delay-ms", options.retryDelayMs]]) {
    if (!Number.isInteger(value) || value < (label === "max-retries" || label === "retry-delay-ms" ? 0 : 1)) throw new TypeError(`${label} must be a ${label === "max-retries" || label === "retry-delay-ms" ? "nonnegative" : "positive"} integer`);
  }
  if (typeof options.provider.model !== "string" || options.provider.model.trim() === "") throw new TypeError("model is required; supply --model or GITHUB_MODELS_MODEL");
  const lines = [];
  for await (const line of createInterface({ input, crlfDelay: Infinity })) {
    if (line.trim() !== "") lines.push(line);
  }
  const batchSize = options.batchSize ?? (lines.length > 1 ? 20 : 1);
  if (!Number.isInteger(batchSize) || batchSize < 1) throw new TypeError("batch-size must be a positive integer");
  const batches = [];
  for (let index = 0; index < lines.length; index += batchSize) batches.push(lines.slice(index, index + batchSize));
  const resolvedBatches = await mapConcurrent(batches, options.concurrency, async (batch) => {
    try { return await proposeTermDescriptionBatch(batch.map(JSON.parse), options); }
    catch (error) { return batch.map(() => ({ schema: "term-description-proposal.v1", disposition: "refused", request: null, attempts: [{ attempt: 0, valid: false, errors: [error.message] }] })); }
  });
  const proposals = resolvedBatches.flat();
  let refusals = 0;
  for (let index = 0; index < proposals.length; index += 1) {
    let proposal = proposals[index];
    if (options.proposalDirectory) proposal = { ...proposal, output: await writeProposal(options.proposalDirectory, proposal, index + 1) };
    output.write(`${JSON.stringify(proposal)}\n`);
    if (proposal.disposition !== "proposed") refusals += 1;
  }
  return refusals === 0 ? 0 : 1;
}

export async function mapConcurrent(values, concurrency, mapper) {
  const results = new Array(values.length);
  let cursor = 0;
  async function worker() {
    for (;;) {
      const index = cursor;
      cursor += 1;
      if (index >= values.length) return;
      results[index] = await mapper(values[index], index);
    }
  }
  await Promise.all(Array.from({ length: Math.min(concurrency, values.length) }, worker));
  return results;
}

const isMain = process.argv[1] && resolve(process.argv[1]) === resolve(fileURLToPath(import.meta.url));
if (isMain) {
  runCli().then((code) => { process.exitCode = code; }).catch((error) => { process.stderr.write(`propose-term-descriptions: ${error.message}\n`); process.exitCode = 1; });
}
