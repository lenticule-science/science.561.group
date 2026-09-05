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
export { bottom, charge, chargeValue, chargeValueName, chargeValueNames, fourCensus, joinKnowledge, joinKnowledgeValue, joinTruth, knowledgeLeq, leqTruth, meetTruth, meme, negate, negateValue, sameChargeValue, truthAggregateOfCensus, truthLeq, valueOf, witnessedPotential, } from "@lenticule-science/articulating/predicating/positing";
export type { ChargeCarrier, ChargeValue, ChargeValueName, Meme } from "@lenticule-science/articulating/predicating/positing";
export { cohomologyLaplacianOfCells } from "@lenticule-science/articulating/predicating/positing/settling";
import * as analysisProvider from "@lenticule-science/articulating/predicating/positing/settling/analysis";
import * as geometryProvider from "@lenticule-science/articulating/predicating/positing/settling/geometry/temporal";
export declare const analysis: typeof analysisProvider;
export declare const geometry: typeof geometryProvider;
export declare const lambek: typeof analysisProvider.lambek;
export declare const sofic: typeof analysisProvider.sofic;
export declare const coordinationCohomology: typeof analysisProvider.coordinationCohomology;
export { action } from "./action.mjs";
export type { Action, ActionSpec } from "./action.mjs";
export { carrierFrom } from "./carrier.mjs";
export type { Carrier, FromSchema } from "./carrier.mjs";
export declare const utteranceCarrier: import("./carrier.mjs").Carrier<{
    readonly kind: string;
    readonly token: {
        readonly kind: "utterance.token";
        readonly hand: "left";
        readonly mark: {
            readonly kind: "utterance.mark";
            readonly value: unknown;
        };
    };
    readonly claim: {
        readonly kind: "utterance.claim";
        readonly hand: "right";
        readonly mark: {
            readonly kind: "utterance.mark";
            readonly value: unknown;
        };
    };
}>;
export declare const articulationCellCarrier: import("./carrier.mjs").Carrier<{
    readonly kind: string;
    readonly potentialAperiodicArticulationCell: unknown;
}>;
export declare const memeCarrier: import("./carrier.mjs").Carrier<{
    readonly kind: string;
    readonly charge: {
        readonly kind: "bilattice-charge.carrier";
        readonly value: readonly unknown[];
        readonly evidence: readonly unknown[];
    };
    readonly cell: {
        readonly object: {
            readonly kind: "utterance.token";
            readonly hand: "left";
            readonly mark: {
                readonly kind: "utterance.mark";
                readonly value: unknown;
            };
        };
        readonly subject: {
            readonly kind: "utterance.token";
            readonly hand: "left";
            readonly mark: {
                readonly kind: "utterance.mark";
                readonly value: unknown;
            };
        };
        readonly predicate: {
            readonly kind: "predication.predicate";
            readonly claim: {
                readonly kind: "utterance.claim";
                readonly hand: "right";
                readonly mark: {
                    readonly kind: "utterance.mark";
                    readonly value: unknown;
                };
            };
            readonly mark: {
                readonly kind: "utterance.mark";
                readonly value: unknown;
            };
        };
    };
}>;
export { chu, cohomologyTerms } from "./catalogs.mjs";
//# sourceMappingURL=index.d.mts.map