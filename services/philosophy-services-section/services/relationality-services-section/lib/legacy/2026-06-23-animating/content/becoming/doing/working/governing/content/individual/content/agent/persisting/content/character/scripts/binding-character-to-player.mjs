// binding-character-to-player: (character, bindingParams) → modeled-player
// Variance: extension. Adds local-settling reference, CGS profile, handedness
// bounds, capabilities, and governance to the character's bearer evidence to
// produce the modeled-player tuple. Preserves character.skills via the
// modeled-player.capabilities array (skills become capabilities when bound).

/**
 * @param {{slug: string, skills: string[], identityKey: string}} character
 * @param {{
 *   playerId: string,
 *   externalPlayerRef: string,
 *   inbox: string,
 *   outbox: string,
 *   localSettling: string,
 *   cgsProfile: string,
 *   handedness: {recv: string, send: string, actuate: string, observe: string},
 *   governance: string,
 *   extraCapabilities?: string[]
 * }} bindingParams
 * @returns {object}
 */
export default function bindingCharacterToPlayer(character, bindingParams) {
  if (!character || typeof character !== "object") {
    throw new Error("binding-character-to-player: character must be an object");
  }
  if (!bindingParams || typeof bindingParams !== "object") {
    throw new Error("binding-character-to-player: bindingParams must be an object");
  }
  const required = ["playerId", "externalPlayerRef", "inbox", "outbox", "localSettling", "cgsProfile", "handedness", "governance"];
  for (const key of required) {
    if (!(key in bindingParams)) {
      throw new Error(`binding-character-to-player: bindingParams.${key} required`);
    }
  }
  const h = bindingParams.handedness;
  for (const k of ["recv", "send", "actuate", "observe"]) {
    if (typeof h?.[k] !== "string" || h[k].length === 0) {
      throw new Error(`binding-character-to-player: handedness.${k} must be non-empty string`);
    }
  }
  const skills = Array.isArray(character.skills) ? character.skills : [];
  const extras = Array.isArray(bindingParams.extraCapabilities) ? bindingParams.extraCapabilities : [];
  const capabilities = [...new Set([...skills, ...extras])];
  return {
    playerId: bindingParams.playerId,
    character: character.slug,
    externalPlayerRef: bindingParams.externalPlayerRef,
    inbox: bindingParams.inbox,
    outbox: bindingParams.outbox,
    localSettling: bindingParams.localSettling,
    cgsProfile: bindingParams.cgsProfile,
    handedness: { ...h },
    capabilities,
    governance: bindingParams.governance,
    evidence: [
      `bound from character:${character.slug}`,
      `identity-key:${character.identityKey ?? "<unknown>"}`,
      "PLAYER-CHARACTER-BOUNDARY §6: identifierKeyInboxOutboxInsufficient — full binding includes localSettling, cgsProfile, handedness"
    ]
  };
}
