// governing: theory → governance (one object of the category Gov), bound over a collective.
// The discriminator is the LOCUS OF CONTROL. orchestration is ONE object (centralized; coordinator =
// conductor) — not a default; choreography / kyriarchical / kin-relational are siblings. orchestrating
// is governing restricted to the orchestration theory. Per docs/ORCHESTRATION-GENEALOGY.md.

import validating from "#validating";

const GOVERNANCE = "https://561.group/swarm-intelligence/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/stable-aperiodic-articulation-cell/governing/library/governance/governance.schema.json";

// The objects of Gov, discriminated by locus of control.
export const GOV_THEORIES = {
  orchestration: {
    locusOfControl: "centralized", coordinatorRole: "conductor", coordinatorIsSubject: true,
    tradeoff: "visibility over scalability (single-coordinator bottleneck risk)"
  },
  choreography: {
    locusOfControl: "distributed", coordinatorRole: null, coordinatorIsSubject: false,
    tradeoff: "scalability over visibility (no central locus; opacity risk)"
  },
  kyriarchical: {
    locusOfControl: "apex-captain", coordinatorRole: "captain", coordinatorIsSubject: true,
    tradeoff: "unified directional voice; revocable scope-bounded delegation; accountability non-transfer (H⁰-invariant)"
  },
  "kin-relational": {
    locusOfControl: "recognition-meet", coordinatorRole: "naca", coordinatorIsSubject: false,
    tradeoff: "authority = recognized conduct, bounded by right of withdrawal; 561 Group meta-governance (wolakȟota)"
  }
};

export default function governing(theory, over = null) {
  const t = GOV_THEORIES[theory];
  if (!t) throw new Error(`governing: unknown theory "${theory}". Known: ${Object.keys(GOV_THEORIES).join(", ")}`);
  return validating({ kind: "governance", theory, ...t, over: over?.id ?? over?.kind ?? over ?? null }, GOVERNANCE);
}
