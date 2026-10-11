// conducting: character × ensemble → { conductor, operate }.
// A conductor is NOT primitive: conductor = restricting(character) to the orchestrator office of an
// orchestration-governed ensemble. operate = the conductor running one cycle: centralized dispatch +
// reconcile the contributed observer charges. Reconciliation is the REAL knowledge-join (joinK) over
// bilattice-value cells — the conductor's central accumulation; sheafing is its topology-aware
// refinement (consensus + H1 obstruction). Composes the migrated restricting + orchestrating + the
// real joinK. Per docs/ORCHESTRATION-GENEALOGY.md.

import restricting from "#script/restricting";
import orchestrating from "#script/orchestrating";
import { joinK } from "#script/positing";

export default function conducting(character, ensemble) {
  if (character?.kind !== "character") throw new Error("conducting: first arg must be a character");
  const orch = orchestrating(ensemble);
  const conductor = restricting(character, { to: "conductor", keep: "orchestrator-office" });
  conductor.office = "orchestrator";
  conductor.ensemble = ensemble?.id ?? null;
  conductor.governanceTheory = orch.theory;
  // operate: dispatch the enactors and reconcile their contributed charges by the real knowledge-join
  // (charges are bilattice-value cells sharing a carrier; the fold accumulates committed charge).
  const operate = (charges = []) => {
    const reconciled = charges.length ? charges.reduce((a, b) => joinK(a, b)) : null;
    return {
      coordinator: conductor.persona ?? "conductor",
      theory: orch.theory,
      reconciled,
      dispatched: (ensemble?.participants ?? []).length
    };
  };
  return { conductor, operate };
}
