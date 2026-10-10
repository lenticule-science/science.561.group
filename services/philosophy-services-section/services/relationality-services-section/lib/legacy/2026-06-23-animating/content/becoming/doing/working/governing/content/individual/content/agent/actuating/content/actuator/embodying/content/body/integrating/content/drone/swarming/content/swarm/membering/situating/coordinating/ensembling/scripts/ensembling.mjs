// ensembling: swarm → ensemble (a restricted forming + a governance theory + a coordinating office).
// ensemble = restricting(swarm), further restricted to a single governance theory with a recognized
// coordinating office — the unit that OPERATES. Composes the migrated restricting + governing. Per
// docs/ORCHESTRATION-GENEALOGY.md.

import restricting from "#script/restricting";
import governing from "#script/governing";

export default function ensembling(swarm, { governance = "orchestration", id } = {}) {
  const restricted = restricting(swarm, {
    to: "ensemble", forget: ["ungoverned-coordination", "membership-without-discipline"]
  });
  const gov = governing(governance, restricted);
  return { ...restricted, id: id ?? swarm?.id ?? "ensemble", governance: gov, coordinatorRole: gov.coordinatorRole };
}
