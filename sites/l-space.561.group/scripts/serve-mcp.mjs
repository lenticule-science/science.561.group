#!/usr/bin/env node

import { createInterface } from "node:readline";
import { drewMcpTools } from "@red-cup-engineering/drew/mcp";
import { glossaryProvenanceOf, observeLSpaceRelease, traverseLSpaceRoom } from "../src/release-observation.mjs";
import { openLSpaceReleaseGraph } from "../src/release-graph-reader.mjs";

let releaseGraphPromise = null;

function releaseGraph() {
  if (releaseGraphPromise === null) {
    releaseGraphPromise = openLSpaceReleaseGraph().catch((error) => {
      releaseGraphPromise = null;
      throw error;
    });
  }
  return releaseGraphPromise;
}

const pattern = Object.freeze({
  type: "object",
  required: Object.freeze(["s", "p", "o"]),
  properties: Object.freeze({ s: Object.freeze({}), p: Object.freeze({}), o: Object.freeze({}) }),
  additionalProperties: false,
});

const lSpaceGraphTools = Object.freeze([
  Object.freeze({
    name: "query_l_space_concept",
    description: "Read one concept from GEODE's live DREW-backed declared-relation index over the Lenticule Science corpus.",
    inputSchema: Object.freeze({ type: "object", required: Object.freeze(["name"]), properties: Object.freeze({ name: Object.freeze({ type: "string", minLength: 1 }) }), additionalProperties: false }),
  }),
  Object.freeze({
    name: "query_l_space_sparql_bgp",
    description: "Run a bounded structured SPARQL Basic Graph Pattern SELECT, ASK, or CONSTRUCT over GEODE's EAVT relation ledger. Variables are strings such as ?document. This is not a textual or standards-complete SPARQL endpoint.",
    inputSchema: Object.freeze({
      type: "object",
      required: Object.freeze(["type", "where"]),
      properties: Object.freeze({
        type: Object.freeze({ enum: Object.freeze(["select", "ask", "construct"]) }),
        select: Object.freeze({ type: "array", maxItems: 16, items: Object.freeze({ type: "string", pattern: "^[A-Za-z][A-Za-z0-9_]*$" }) }),
        where: Object.freeze({ type: "array", minItems: 1, maxItems: 4, items: pattern }),
        construct: Object.freeze({ type: "array", minItems: 1, maxItems: 4, items: pattern }),
        limit: Object.freeze({ type: "integer", minimum: 1, maximum: 500, default: 100 }),
      }),
      additionalProperties: false,
    }),
  }),
  Object.freeze({
    name: "observe_l_space_feltos",
    description: "Observe the admitted L-Space workspace through GEODE's FeltOS-native composition, with DREW occurrence identity and provenance.",
    inputSchema: Object.freeze({ type: "object", properties: Object.freeze({}), additionalProperties: false }),
  }),
  Object.freeze({
    name: "query_l_space_feltos_relations",
    description: "Query bounded FeltOS relations projected from GEODE's admitted L-Space Markdown graph.",
    inputSchema: Object.freeze({ type: "object", properties: Object.freeze({
      subject: Object.freeze({ type: "string" }), predicate: Object.freeze({ type: "string" }), object: Object.freeze({ type: "string" }),
      limit: Object.freeze({ type: "integer", minimum: 1, maximum: 500, default: 100 }),
    }), additionalProperties: false }),
  }),
  Object.freeze({
    name: "query_l_space_feltos_entity",
    description: "Read a bounded incoming/outgoing FeltOS neighborhood for one L-Space document or graph term.",
    inputSchema: Object.freeze({ type: "object", required: Object.freeze(["term"]), properties: Object.freeze({
      term: Object.freeze({ type: "string", minLength: 1 }), predicate: Object.freeze({ type: "string" }),
      direction: Object.freeze({ enum: Object.freeze(["incoming", "outgoing", "both"]), default: "both" }),
      limit: Object.freeze({ type: "integer", minimum: 1, maximum: 500, default: 100 }),
    }), additionalProperties: false }),
  }),
  Object.freeze({
    name: "observe_l_space_feltos_diagnostics",
    description: "Read bounded FeltOS/GEODE projection diagnostics without turning unresolved Markdown links into relations.",
    inputSchema: Object.freeze({ type: "object", properties: Object.freeze({ limit: Object.freeze({ type: "integer", minimum: 1, maximum: 500, default: 100 }) }), additionalProperties: false }),
  }),
]);

export const tools = Object.freeze([
  Object.freeze({
    name: "search_l_space",
    description: "Search the L-Space research corpus with ordinary words and return ranked document summaries.",
    inputSchema: Object.freeze({ type: "object", required: Object.freeze(["query"]), properties: Object.freeze({
      query: Object.freeze({ type: "string", minLength: 1 }),
      match: Object.freeze({ enum: Object.freeze(["any", "all"]), default: "any" }),
      collectionPrefix: Object.freeze({ type: "string" }),
      pathPrefix: Object.freeze({ type: "string" }),
      kind: Object.freeze({ type: "string", minLength: 1 }),
      kinds: Object.freeze({ type: "array", minItems: 1, maxItems: 32, items: Object.freeze({ type: "string", minLength: 1 }) }),
      limit: Object.freeze({ type: "integer", minimum: 1, maximum: 100, default: 20 }),
    }), additionalProperties: false }),
  }),
  Object.freeze({
    name: "observe_l_space_release",
    description: "Search the immutable L-Space release and return ranked document summaries.",
    inputSchema: Object.freeze({ type: "object", properties: Object.freeze({
      query: Object.freeze({ type: "string" }),
      match: Object.freeze({ enum: Object.freeze(["any", "all"]), default: "any" }),
      collectionPrefix: Object.freeze({ type: "string" }),
      pathPrefix: Object.freeze({ type: "string" }),
      kind: Object.freeze({ type: "string", minLength: 1 }),
      kinds: Object.freeze({ type: "array", minItems: 1, maxItems: 32, items: Object.freeze({ type: "string", minLength: 1 }) }),
      limit: Object.freeze({ type: "integer", minimum: 1, maximum: 100, default: 20 }),
    }), additionalProperties: false }),
  }),
  Object.freeze({
    name: "traverse_l_space_room",
    description: "Read one exact room from the immutable L-Space release and follow its admitted doors by one bounded step.",
    inputSchema: Object.freeze({ type: "object", required: ["roomId"], properties: Object.freeze({
      roomId: Object.freeze({ type: "string", minLength: 1 }),
      direction: Object.freeze({ enum: ["incoming", "outgoing", "both"], default: "both" }),
      limit: Object.freeze({ type: "integer", minimum: 1, maximum: 100, default: 25 }),
      bodyCharacterLimit: Object.freeze({ type: "integer", minimum: 1, maximum: 50000, default: 12000 }),
    }), additionalProperties: false }),
  }),
  ...lSpaceGraphTools,
  ...drewMcpTools,
]);

function toolResult(value) {
  return Object.freeze({ content: Object.freeze([{ type: "text", text: JSON.stringify(value, null, 2) }]), structuredContent: value });
}

function sparqlTerm(value) {
  if (typeof value === "string" && /^\?[A-Za-z][A-Za-z0-9_]*$/u.test(value)) {
    return Object.freeze({ kind: "knowing.sparql.variable", name: value.slice(1) });
  }
  return value;
}

function sparqlPatterns(values) {
  return Object.freeze((values ?? []).map(({ s, p, o }) => Object.freeze({ s: sparqlTerm(s), p: sparqlTerm(p), o: sparqlTerm(o) })));
}

export async function callTool(name, input = {}) {
  if (name === "search_l_space") return observeLSpaceRelease(input);
  if (name === "observe_l_space_release") return observeLSpaceRelease(input);
  if (name === "traverse_l_space_room") return traverseLSpaceRoom(input);
  const authoring = await releaseGraph();
  if (name === "query_l_space_concept") {
    const reading = await authoring.concept(input.name);
    return { ...reading, provenance: glossaryProvenanceOf(input.name) };
  }
  if (name === "query_l_space_sparql_bgp") {
    return authoring.sparql(Object.freeze({
      kind: "knowing.sparql.query",
      type: input.type,
      ...(input.select === undefined ? {} : { select: Object.freeze([...input.select]) }),
      where: sparqlPatterns(input.where),
      ...(input.construct === undefined ? {} : { construct: sparqlPatterns(input.construct) }),
    }), { limit: input.limit ?? 100 });
  }
  if (name === "observe_l_space_feltos") return authoring.feltosSummary();
  if (name === "query_l_space_feltos_relations") {
    const { limit = 100, ...relationPattern } = input;
    return authoring.feltosRelations(relationPattern, { limit });
  }
  if (name === "query_l_space_feltos_entity") {
    return authoring.feltosEntity(input.term, { predicate: input.predicate, direction: input.direction ?? "both", limit: input.limit ?? 100 });
  }
  if (name === "observe_l_space_feltos_diagnostics") return authoring.feltosDiagnostics({ limit: input.limit ?? 100 });
  if (drewMcpTools.some((tool) => tool.name === name)) return authoring.callGraphTool(name, input);
  throw new TypeError(`unknown L-Space MCP operation ${name}`);
}

export async function handleMcpRequest(request) {
  if (request?.method === "initialize") return { protocolVersion: request.params?.protocolVersion ?? "2025-06-18", capabilities: { tools: { listChanged: false } }, serverInfo: { name: "l-space", version: "1.0.0" } };
  if (request?.method === "tools/list") return { tools };
  if (request?.method === "tools/call") {
    const value = await callTool(request.params?.name, request.params?.arguments ?? {});
    return value?.content && value?.structuredContent ? value : toolResult(value);
  }
  if (request?.method === "ping") return {};
  throw new TypeError(`unsupported MCP method ${request?.method}`);
}

if (process.argv[1] === new URL(import.meta.url).pathname) {
  const lines = createInterface({ input: process.stdin, crlfDelay: Infinity });
  const pending = new Set();
  for await (const line of lines) {
    if (!line.trim()) continue;
    const running = (async () => {
      let request;
      try {
        request = JSON.parse(line);
        const result = await handleMcpRequest(request);
        if (request.id !== undefined) process.stdout.write(`${JSON.stringify({ jsonrpc: "2.0", id: request.id, result })}\n`);
      } catch (error) {
        if (request?.id !== undefined) process.stdout.write(`${JSON.stringify({ jsonrpc: "2.0", id: request.id, error: { code: -32602, message: error instanceof Error ? error.message : String(error) } })}\n`);
      }
    })();
    pending.add(running);
    running.finally(() => pending.delete(running));
  }
  await Promise.allSettled(pending);
}
