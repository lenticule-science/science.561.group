// orchestrating: ensemble → orchestration (governing restricted to the orchestration theory).
// orchestration is ONE object of Gov: centralized locus of control, a single coordinator (the
// conductor) is the agent-subject. If the ensemble's governance is not orchestration, this reports
// the actual theory rather than forcing it. Composes the migrated governing. Per docs/ORCHESTRATION-
// GENEALOGY.md.

import governing from "#script/governing";

export default function orchestrating(ensemble) {
  const gov = ensemble?.governance ?? governing("orchestration");
  if (gov.theory !== "orchestration") {
    return { theory: gov.theory, note: `not orchestration: coordinator is ${gov.coordinatorRole ?? "none"}`, governance: gov };
  }
  return { kind: "orchestration", theory: "orchestration", locusOfControl: "centralized", coordinatorRole: "conductor", governance: gov };
}
