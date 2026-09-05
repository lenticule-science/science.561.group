/**
 * understanding/discourse-information - information readings of discourse state.
 *
 * This layer does not parse or resolve discourse again. It reads the finite
 * discourse-state carrier as empirical distributions: topic entropy, commitment
 * entropy, repair entropy, topic surprisal, redundancy, semantic cohesion, and
 * a commitment/topic channel.
 */
import { type ChargeValueName } from "@red-cup-engineering/relating";
import type { DiscourseState } from "./discourse-state.mjs";
export interface DiscourseSurprisal {
    readonly outcome: string;
    readonly count: number;
    readonly probability: number;
    readonly surprisal: number;
}
export interface DiscourseInformationChannel {
    readonly kind: "communicating.discourse-information.channel";
    readonly samples: number;
    readonly commitmentEntropy: number;
    readonly topicEntropy: number;
    readonly jointEntropy: number;
    readonly mutualInformation: number;
}
export interface DiscourseInformation {
    readonly kind: "communicating.discourse-information";
    readonly text: string;
    readonly stateCharge: ChargeValueName;
    readonly samples: number;
    readonly topicEntropy: number;
    readonly commitmentEntropy: number;
    readonly repairEntropy: number;
    readonly meanSurprisal: number;
    readonly redundancy: number;
    readonly semanticCohesion: number;
    readonly surprisals: readonly DiscourseSurprisal[];
    readonly channel: DiscourseInformationChannel;
}
export declare const discourseInformationSchema: {
    readonly $id: "communicating/understanding/discourse-information";
    readonly type: "object";
    readonly required: readonly ["kind", "text", "stateCharge", "samples", "topicEntropy", "commitmentEntropy", "repairEntropy", "meanSurprisal", "redundancy", "semanticCohesion", "surprisals", "channel"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.discourse-information";
        };
        readonly text: {
            readonly type: "string";
        };
        readonly stateCharge: {
            readonly enum: readonly ["absurd", "potential", "active", "stable"];
        };
        readonly samples: {
            readonly type: "integer";
            readonly minimum: 0;
        };
        readonly topicEntropy: {
            readonly type: "number";
            readonly minimum: 0;
        };
        readonly commitmentEntropy: {
            readonly type: "number";
            readonly minimum: 0;
        };
        readonly repairEntropy: {
            readonly type: "number";
            readonly minimum: 0;
        };
        readonly meanSurprisal: {
            readonly type: "number";
            readonly minimum: 0;
        };
        readonly redundancy: {
            readonly type: "number";
            readonly minimum: 0;
            readonly maximum: 1;
        };
        readonly semanticCohesion: {
            readonly type: "number";
            readonly minimum: 0;
            readonly maximum: 1;
        };
        readonly surprisals: {
            readonly type: "array";
            readonly items: {
                readonly type: "object";
                readonly required: readonly ["outcome", "count", "probability", "surprisal"];
                readonly additionalProperties: false;
                readonly properties: {
                    readonly outcome: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly count: {
                        readonly type: "integer";
                        readonly minimum: 1;
                    };
                    readonly probability: {
                        readonly type: "number";
                        readonly minimum: 0;
                    };
                    readonly surprisal: {
                        readonly type: "number";
                        readonly minimum: 0;
                    };
                };
            };
        };
        readonly channel: {
            readonly type: "object";
            readonly required: readonly ["kind", "samples", "commitmentEntropy", "topicEntropy", "jointEntropy", "mutualInformation"];
            readonly additionalProperties: false;
            readonly properties: {
                readonly kind: {
                    readonly const: "communicating.discourse-information.channel";
                };
                readonly samples: {
                    readonly type: "integer";
                    readonly minimum: 0;
                };
                readonly commitmentEntropy: {
                    readonly type: "number";
                    readonly minimum: 0;
                };
                readonly topicEntropy: {
                    readonly type: "number";
                    readonly minimum: 0;
                };
                readonly jointEntropy: {
                    readonly type: "number";
                    readonly minimum: 0;
                };
                readonly mutualInformation: {
                    readonly type: "number";
                    readonly minimum: 0;
                };
            };
        };
    };
};
export declare const discourseInformationCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.discourse-information";
    readonly text: string;
    readonly channel: {
        readonly kind: "communicating.discourse-information.channel";
        readonly jointEntropy: number;
        readonly mutualInformation: number;
        readonly samples: number;
        readonly commitmentEntropy: number;
        readonly topicEntropy: number;
    };
    readonly samples: number;
    readonly commitmentEntropy: number;
    readonly topicEntropy: number;
    readonly stateCharge: "potential" | "active" | "stable" | "absurd";
    readonly repairEntropy: number;
    readonly meanSurprisal: number;
    readonly redundancy: number;
    readonly semanticCohesion: number;
    readonly surprisals: readonly {
        readonly count: number;
        readonly outcome: string;
        readonly probability: number;
        readonly surprisal: number;
    }[];
}>;
export declare function discourseInformationOfState(state: DiscourseState): DiscourseInformation;
//# sourceMappingURL=discourse-information.d.mts.map