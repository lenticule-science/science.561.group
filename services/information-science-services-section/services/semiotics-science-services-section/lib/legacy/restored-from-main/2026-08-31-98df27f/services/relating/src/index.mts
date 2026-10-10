export type { JsonRecord, JsonValue } from "@red-cup-engineering/json-codec-service";
export { canonical, jsonResource, requireJsonValue, parse as parseJson } from "@red-cup-engineering/json-codec-service";
export { tm } from "@red-cup-engineering/relation-model-notation";
export type { Tm } from "@red-cup-engineering/relation-model-notation/types";
export { evaluateRunTerm } from "@red-cup-engineering/relation-model-notation-eval";
export { arrayTerm, objectTerm, stringTerm } from "@red-cup-engineering/relation-model-notation-json-codec";

export { Mark, Token, Claim, mark, token, claim, articulate, utterance } from "@lenticule-science/articulating";
export type { ArticulationCell, UtteranceCarrier } from "@lenticule-science/articulating";
export { cell, predicateOfClaim } from "@lenticule-science/articulating/predicating";
export type { Cell, PredicationPredicate, PredicationTerm } from "@lenticule-science/articulating/predicating";
export {
  bottom, charge, chargeValue, chargeValueName, chargeValueNames, fourCensus,
  joinKnowledge, joinKnowledgeValue, joinTruth, knowledgeLeq, leqTruth, meetTruth,
  meme, negate, negateValue, sameChargeValue, truthAggregateOfCensus, truthLeq,
  valueOf, witnessedPotential,
} from "@lenticule-science/articulating/predicating/positing";
export type { ChargeCarrier, ChargeValue, ChargeValueName, Meme } from "@lenticule-science/articulating/predicating/positing";
export { cohomologyLaplacianOfCells } from "@lenticule-science/articulating/predicating/positing/settling";
import * as analysisProvider from "@lenticule-science/articulating/predicating/positing/settling/analysis";
import * as geometryProvider from "@lenticule-science/articulating/predicating/positing/settling/geometry/temporal";
export const analysis = analysisProvider;
export const geometry = geometryProvider;
export const lambek = analysisProvider.lambek;
export const sofic = analysisProvider.sofic;
export const coordinationCohomology = analysisProvider.coordinationCohomology;

export { action } from "./action.mjs";
export type { Action, ActionSpec } from "./action.mjs";
export { carrierFrom } from "./carrier.mjs";
export type { Carrier, FromSchema } from "./carrier.mjs";
import { carrierFrom } from "./carrier.mjs";
import { utteranceSchema, articulationCellSchema } from "@lenticule-science/articulating";
import { memeSchema } from "@lenticule-science/articulating/predicating/positing";
export const utteranceCarrier = carrierFrom(utteranceSchema);
export const articulationCellCarrier = carrierFrom(articulationCellSchema);
export const memeCarrier = carrierFrom(memeSchema);
export { chu, cohomologyTerms } from "./catalogs.mjs";
