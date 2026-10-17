import { isAbsolute } from "node:path";
import { semanticJsonId, semanticJsonRecord } from "./semantic-json.mjs";

export const ACTOR = "urn:ame:improvement-game-proposal-assay";
export const record = semanticJsonRecord;
const rootedAt = (path, root) => path === root || path.startsWith(`${root}/`);
const digest = (value) => typeof value === "string" && /^sha256:[0-9a-f]{64}$/u.test(value);
function problem(lot, proposal) {
  const residue = proposal?.proposedResidue, observation = lot?.sourceObservation, protectedPaths = new Set(residue?.acceptanceArtifacts?.map(({ path }) => path) ?? []);
  if (lot?.type !== "ImprovementGameDesignWorkLot" || proposal?.type !== "ImprovementGameProposal" || proposal.lot !== lot.id || proposal.verdict !== "propose-game" || proposal.customerMutation !== false) return "proposal-lot-binding";
  if (proposal.id !== semanticJsonId(Object.fromEntries(Object.entries(proposal).filter(([key]) => key !== "id")))) return "proposal-identity";
  if (residue?.type !== "ImprovementResidue" || residue.customer !== lot.consumer || residue.territory !== lot.gameTerms?.territory || !isAbsolute(residue.territory ?? "")) return "customer-territory-binding";
  if (!Array.isArray(residue.sourceDigests) || residue.sourceDigests.some((item) => !digest(item)) || observation.sourceDigests.some((item) => !residue.sourceDigests.includes(item))) return "source-binding";
  if (!Array.isArray(residue.ownedTargetRoots) || !residue.ownedTargetRoots.length || !Array.isArray(residue.acceptanceArtifacts) || !residue.acceptanceArtifacts.length || protectedPaths.size !== residue.acceptanceArtifacts.length) return "protected-oracle-absent";
  if (residue.acceptanceArtifacts.some(({ path, digest: value }) => typeof path !== "string" || !digest(value) || residue.ownedTargetRoots.some((root) => rootedAt(path, root)) || !residue.sourceDigests.includes(value))) return "supplier-writable-or-unbound-oracle";
  if (!Array.isArray(residue.acceptanceCommands) || !residue.acceptanceCommands.length || residue.acceptanceCommands.some((command) => command?.runner !== "node" || !Array.isArray(command.argv) || !command.argv.some((arg) => protectedPaths.has(arg))) || [...protectedPaths].some((path) => !residue.acceptanceCommands.some((command) => command.argv.includes(path)))) return "oracle-not-exercised";
  const baselineArtifacts = residue.economy?.baselineArtifacts;
  if (!Array.isArray(baselineArtifacts) || !baselineArtifacts.length || baselineArtifacts.some(({ path, digest: value }) => typeof path !== "string" || !digest(value) || residue.ownedTargetRoots.some((root) => rootedAt(path, root)) || !residue.sourceDigests.includes(value))) return "baseline-unprotected";
  const baseline = residue.economy?.baselinePerTick, ceiling = residue.economy?.maximumAcceptedPerTick, measured = observation.resourceObservation?.baselinePerTick;
  if (!baseline || !ceiling || baseline.unit !== measured?.unit || ceiling.unit !== baseline.unit || baseline.amount > measured.amount || ceiling.amount >= baseline.amount || residue.economy.expectedTicks > observation.resourceObservation.expectedTicks) return "inflated-or-vacuous-economy";
  return null;
}

export function assayImprovementGameProposal(request) {
  const issue = request?.type === "ImprovementGameProposalAssayRequest" ? problem(request.lot, request.proposal) : "exact-assay-request-required";
  return record({ type: "ImprovementGameReview", actor: ACTOR, proposal: request?.proposal?.id ?? null, accepted: issue === null, reason: issue ?? "deterministic source, territory, oracle, and economy relations are bounded", evidence: { assay: "improvement-game-proposal-assay/v1", inferenceCalls: 0, filesystemReads: 0 }, customerMutation: false });
}
