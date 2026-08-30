#!/usr/bin/env node

import { createInterface } from "node:readline";
import { observeLSpaceRelease, traverseLSpaceRoom } from "../src/release-observation.mjs";

export const tools = Object.freeze([
  Object.freeze({
    name: "observe_l_space_release",
    description: "Search the immutable L-Space release and return bounded room summaries.",
    inputSchema: Object.freeze({ type: "object", properties: Object.freeze({
      query: Object.freeze({ type: "string" }),
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
]);

export function callTool(name, input = {}) {
  if (name === "observe_l_space_release") return observeLSpaceRelease(input);
  if (name === "traverse_l_space_room") return traverseLSpaceRoom(input);
  throw new TypeError(`unknown L-Space MCP operation ${name}`);
}

export function handleMcpRequest(request) {
  if (request?.method === "initialize") return { protocolVersion: request.params?.protocolVersion ?? "2025-06-18", capabilities: { tools: { listChanged: false } }, serverInfo: { name: "l-space", version: "1.0.0" } };
  if (request?.method === "tools/list") return { tools };
  if (request?.method === "tools/call") return { content: [{ type: "text", text: JSON.stringify(callTool(request.params?.name, request.params?.arguments ?? {})) }] };
  if (request?.method === "ping") return {};
  throw new TypeError(`unsupported MCP method ${request?.method}`);
}

if (process.argv[1] === new URL(import.meta.url).pathname) {
  const lines = createInterface({ input: process.stdin, crlfDelay: Infinity });
  for await (const line of lines) {
    if (!line.trim()) continue;
    let request;
    try {
      request = JSON.parse(line);
      const result = handleMcpRequest(request);
      if (request.id !== undefined) process.stdout.write(`${JSON.stringify({ jsonrpc: "2.0", id: request.id, result })}\n`);
    } catch (error) {
      if (request?.id !== undefined) process.stdout.write(`${JSON.stringify({ jsonrpc: "2.0", id: request.id, error: { code: -32602, message: error instanceof Error ? error.message : String(error) } })}\n`);
    }
  }
}
