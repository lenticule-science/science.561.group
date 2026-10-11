// forming: characters → formed-collective (parallel composition ∥).
// Composes characters (or persona/role-slug references) into a general collective with no governance
// and no coordinating office yet. swarm and ensemble are restricted formings (forming then
// restricting). Per docs/ORCHESTRATION-GENEALOGY.md. Variance: extension.

import validating from "#validating";

const FORMED_COLLECTIVE = "https://561.group/swarm-intelligence/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/stable-aperiodic-articulation-cell/forming/library/formed-collective/formed-collective.schema.json";

export default function forming(characters, { id = "collective" } = {}) {
  const participants = (Array.isArray(characters) ? characters : []).map((c) =>
    typeof c === "string" ? c : (c.persona ?? c.role?.slug ?? "anon"));
  return validating({ kind: "formed-collective", id, participants, arena: "parallel-composition(∥)" }, FORMED_COLLECTIVE);
}
