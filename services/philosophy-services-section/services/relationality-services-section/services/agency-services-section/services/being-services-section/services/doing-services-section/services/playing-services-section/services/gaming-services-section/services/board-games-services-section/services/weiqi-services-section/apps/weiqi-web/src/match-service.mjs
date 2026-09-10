// Pure admission binding for the multiplayer effect shell.  Rules, replay,
// versions, and idempotency remain exclusively owned by weiqi-engine/match.
import { admitWeiqiMatchCommand, createWeiqiMatch } from "@red-cup-engineering/weiqi-engine/match";

function isNonEmptyString(value) {
  return typeof value === "string" && value.length > 0;
}

export function createStoredMatch({ config, black, white }) {
  if (!isNonEmptyString(black?.principal) || !isNonEmptyString(black?.capability)
    || !isNonEmptyString(white?.principal) || !isNonEmptyString(white?.capability)) {
    throw new TypeError("Each match player needs a principal and a capability");
  }
  const match = createWeiqiMatch(config, { black: black.principal, white: white.principal });
  return Object.freeze({ match, capabilities: Object.freeze({ black: black.capability, white: white.capability }) });
}

export function admitStoredMatchCommand(stored, { principal, capability, idempotencyKey, expectedVersion, command }, receivedAt) {
  const player = stored.match.players.black === principal ? "black" : stored.match.players.white === principal ? "white" : null;
  if (!player || stored.capabilities[player] !== capability) {
    return Object.freeze({ status: 401, body: Object.freeze({ ok: false, reason: "unauthorized" }) });
  }
  const admission = admitWeiqiMatchCommand(stored.match, { principal, idempotencyKey, expectedVersion, command }, receivedAt);
  if (!admission.ok) return Object.freeze({ status: admission.reason === "version-mismatch" ? 409 : 422, body: admission });
  return Object.freeze({
    status: 200,
    stored: admission.duplicate ? stored : Object.freeze({ ...stored, match: admission.match }),
    body: Object.freeze({ ok: true, duplicate: admission.duplicate, version: admission.match.session.version, stateHash: admission.match.stateHash, events: admission.events }),
  });
}
