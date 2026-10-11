// characterizing: role → character (a stable articulation bearing a χ-nucleus disposition).
// A character carries a nucleus χ on its behavioral fiber — idempotent, monotone, inflationary —
// χ(S) = S ∪ endorse, Fix(χ) = behavior sets ⊇ endorse. role = capability-signature (what it MAY do,
// external references); persona = the bearer. The produced character is serializable (role/persona/
// endorse); the nucleus is reconstructed by chiOf/inCharacter, not stored. Per docs/ORCHESTRATION-
// GENEALOGY.md; grounded in the lab agentic-characters survey. Variance: restriction.

import validating from "#validating";

const CHARACTER = "https://561.group/swarm-intelligence/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/stable-aperiodic-articulation-cell/characterizing/library/character/character.schema.json";

export default function characterizing(role, { endorse = [], persona = null } = {}) {
  return validating({
    kind: "character",
    role: { slug: Array.isArray(role) ? role.join(",") : role, capabilitySignature: Array.isArray(role) ? role : [role] },
    persona,
    endorse: [...new Set(endorse)]
  }, CHARACTER);
}

// the disposition nucleus, reconstructed from the character's endorsed set:
// χ(behaviors) = behaviors ∪ endorse — inflationary (S ⊆ χS), monotone, idempotent (χχ = χ).
export const chiOf = (character) => (behaviors) => [...new Set([...(behaviors || []), ...(character.endorse || [])])];
// acting-in-character test: Fix(χ) membership (the behaviors already contain every endorsed behavior).
export const inCharacter = (character, behaviors) => (character.endorse || []).every((b) => (behaviors || []).includes(b));
