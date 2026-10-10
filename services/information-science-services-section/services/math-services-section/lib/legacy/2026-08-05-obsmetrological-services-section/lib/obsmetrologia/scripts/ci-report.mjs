#!/usr/bin/env node

import { spawn } from "node:child_process";
import { appendFileSync } from "node:fs";

const marker = process.argv.indexOf("--");
const nameFlag = process.argv.indexOf("--name");
const name =
  nameFlag >= 0 && process.argv[nameFlag + 1]
    ? process.argv[nameFlag + 1]
    : "CI command";

if (marker < 0 || marker === process.argv.length - 1) {
  console.error("usage: node scripts/ci-report.mjs --name <name> -- <command> [args...]");
  process.exit(2);
}

const command = process.argv[marker + 1];
const args = process.argv.slice(marker + 2);
const chunks = [];

function record(stream, chunk) {
  const text = chunk.toString();
  chunks.push(text);
  stream.write(text);
}

const child = spawn(command, args, {
  cwd: process.cwd(),
  env: process.env,
  shell: false,
});

child.stdout.on("data", (chunk) => record(process.stdout, chunk));
child.stderr.on("data", (chunk) => record(process.stderr, chunk));

child.on("error", (error) => {
  const message = `${command}: ${error.message}`;
  console.error(message);
  writeFailureSummary(127, message);
  process.exit(127);
});

child.on("close", (code, signal) => {
  const status = signal ? 128 : code ?? 1;
  if (status !== 0) {
    writeFailureSummary(status, signal ? `terminated by ${signal}` : null);
  }
  process.exit(status);
});

function escapeCommandValue(value) {
  return value
    .replaceAll("%", "%25")
    .replaceAll("\r", "%0D")
    .replaceAll("\n", "%0A")
    .replaceAll(":", "%3A")
    .replaceAll(",", "%2C");
}

function stripAnsi(text) {
  return text.replace(/\u001b\[[0-9;]*m/g, "");
}

function parseFindings(text) {
  const findings = [];
  const lines = stripAnsi(text).split(/\r?\n/);
  const leanRe = /\b(error|warning): ([^:\s][^:]*):(\d+):(\d+): (.*)$/;
  const genericRe = /^([^:\s][^:]*):(\d+)(?::(\d+))?: (.*)$/;

  for (let i = 0; i < lines.length; i += 1) {
    const line = lines[i];
    let match = line.match(leanRe);
    if (match) {
      findings.push({
        severity: match[1],
        file: match[2],
        line: Number(match[3]),
        col: Number(match[4]),
        message: collectMessage(lines, i, match[5]),
      });
      continue;
    }

    match = line.match(genericRe);
    if (match && /(?:error|failed|violation|finding)/i.test(match[4])) {
      findings.push({
        severity: "error",
        file: match[1],
        line: Number(match[2]),
        col: match[3] ? Number(match[3]) : undefined,
        message: collectMessage(lines, i, match[4]),
      });
    }
  }

  return findings.slice(0, 12);
}

function collectMessage(lines, start, firstLine) {
  const details = [firstLine.trim()];
  for (let i = start + 1; i < Math.min(lines.length, start + 8); i += 1) {
    const line = lines[i];
    if (!line.trim()) break;
    if (/^\S.*\b(error|warning):\s/.test(line)) break;
    if (/^\s*(trace:|info:|warning:|error:)/.test(line)) break;
    details.push(line.trim());
  }
  return details.join(" ").replace(/\s+/g, " ").slice(0, 900);
}

function emitAnnotation(finding) {
  const params = [
    `file=${escapeCommandValue(finding.file)}`,
    `line=${finding.line}`,
  ];
  if (finding.col != null) params.push(`col=${finding.col}`);
  params.push(`title=${escapeCommandValue(name)}`);
  const level = finding.severity === "warning" ? "warning" : "error";
  console.log(`::${level} ${params.join(",")}::${escapeCommandValue(finding.message)}`);
}

function tailLines(text, count) {
  const lines = stripAnsi(text).trimEnd().split(/\r?\n/);
  return lines.slice(Math.max(0, lines.length - count)).join("\n");
}

function writeFailureSummary(status, extra) {
  const output = chunks.join("");
  const findings = parseFindings(output);
  for (const finding of findings) emitAnnotation(finding);

  const summary = [
    `## ${name} failed`,
    "",
    `- Command: \`${[command, ...args].join(" ")}\``,
    `- Exit status: \`${status}\``,
    ...(extra ? [`- Note: ${extra}`] : []),
    "",
    "### Primary findings",
    "",
    ...(findings.length === 0
      ? ["No file/line diagnostic was recognized. The tail below is the best available clue."]
      : findings.map((finding) => {
          const loc =
            finding.col == null
              ? `${finding.file}:${finding.line}`
              : `${finding.file}:${finding.line}:${finding.col}`;
          return `- ${loc}: ${finding.message}`;
        })),
    "",
    "### Output tail",
    "",
    "```text",
    tailLines(output, 80),
    "```",
    "",
  ].join("\n");

  if (process.env.GITHUB_STEP_SUMMARY) {
    appendFileSync(process.env.GITHUB_STEP_SUMMARY, summary, "utf8");
  }

  console.error(`\n${summary}`);
}
