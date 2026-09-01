#!/usr/bin/env node
import { readFileSync } from "node:fs";
import { basename } from "node:path";
import { deriveTermFilename, readTermMarkdown, recognizeTermMarkdown, renderTermMarkdown } from "../src/term-markdown.mjs";

const operations = Object.freeze({
  "derive-term-filename": ({ name }) => deriveTermFilename(name),
  "read-term-markdown": ({ text }) => readTermMarkdown(text),
  "recognize-term-markdown": (request) => recognizeTermMarkdown(request),
  "render-term-markdown": (request) => renderTermMarkdown(request)
});

/** Invoke one canonical term-Markdown operation with its JSON request. */
export function invokeTermMarkdownOperation(operation, request) {
  if (typeof operation !== "string" || !(operation in operations)) throw new TypeError(`unknown term Markdown operation ${operation}`);
  if (request === null || typeof request !== "object" || Array.isArray(request)) throw new TypeError("request must be a JSON object");
  return operations[operation](request);
}

const operation = basename(process.argv[1] ?? "").replace(/\.mjs$/u, "");
if (operation in operations) process.stdout.write(`${JSON.stringify(invokeTermMarkdownOperation(operation, JSON.parse(readFileSync(0, "utf8"))))}\n`);
