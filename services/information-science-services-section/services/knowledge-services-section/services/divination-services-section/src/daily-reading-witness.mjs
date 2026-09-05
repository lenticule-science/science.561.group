import { Buffer } from "node:buffer";

import { seavt } from "@red-cup-engineering/witness-journal-entry-service";
import { appendSeavt } from "@red-cup-engineering/witness-journal-log-service";

function niSurface(role, token) {
  const match = /^ni:\/\/\/sha-256;([A-Za-z0-9_-]{43})$/u.exec(token);
  if (match === null) throw new TypeError(`${role} must be an ni:///sha-256 semantic-content token`);
  return `semantic-content.${role}.sha256.${Buffer.from(match[1], "base64url").toString("hex")}`;
}

export function appendDailyReadingWitness(root, at, values) {
  const entity = niSurface("completion", values.completion);
  const rows = [
    seavt(entity, "daily-reading:proposal", niSurface("proposal", values.proposal), at),
    seavt(entity, "daily-reading:completion", niSurface("completion", values.completion), at),
    seavt(entity, "daily-reading:evidence", niSurface("evidence", values.evidence), at),
    seavt(entity, "daily-reading:transition-witness", niSurface("transition-witness", values.witness), at),
    seavt(entity, "daily-reading:disposition", `daily-reading.disposition.${values.disposition}`, at),
  ];
  return appendSeavt(root, "divination.daily-reading", rows, at);
}
