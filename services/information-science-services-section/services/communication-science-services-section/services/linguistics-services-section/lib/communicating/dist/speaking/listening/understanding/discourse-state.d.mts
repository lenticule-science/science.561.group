/**
 * understanding/discourse-state - dynamic discourse state over parse forests.
 *
 * This layer lifts local parse readings into a finite discourse state: entities,
 * references, presuppositions, topics, commitments, and repairs. It consumes the
 * parse forest and Lambek proof carriers; it does not parse text again and it
 * does not add a dependency beyond @red-cup-engineering/relating.
 */
import { type ChargeValueName } from "@red-cup-engineering/relating";
import { type LambekForestProof, type ParseForest } from "../parsing/index.mjs";
export type DiscourseRepairKind = "unresolved-reference" | "ambiguous-reference" | "presupposition-accommodation" | "parse-obstruction" | "grammar-obstruction";
export interface DiscourseEntity {
    readonly id: string;
    readonly label: string;
    readonly mentions: readonly string[];
    readonly charge: ChargeValueName;
}
export interface DiscourseReference {
    readonly anaphor: string;
    readonly status: "resolved" | "ambiguous" | "void";
    readonly antecedent: string | null;
    readonly candidates: readonly string[];
    readonly readingId: string;
}
export interface DiscoursePresupposition {
    readonly trigger: string;
    readonly presupposed: string;
    readonly status: ChargeValueName;
    readonly readingId: string;
}
export interface DiscourseTopic {
    readonly id: string;
    readonly label: string;
    readonly mentions: readonly string[];
    readonly charge: ChargeValueName;
}
export interface DiscourseCommitment {
    readonly id: string;
    readonly proposition: string;
    readonly readingId: string;
    readonly charge: ChargeValueName;
    readonly basis: "assertion" | "denial" | "ambiguous" | "unproved";
}
export interface DiscourseRepair {
    readonly kind: DiscourseRepairKind;
    readonly target: string;
    readonly readingId: string;
    readonly charge: ChargeValueName;
    readonly note: string;
}
export interface DiscourseState {
    readonly kind: "communicating.discourse-state";
    readonly text: string;
    readonly entities: readonly DiscourseEntity[];
    readonly references: readonly DiscourseReference[];
    readonly presuppositions: readonly DiscoursePresupposition[];
    readonly topics: readonly DiscourseTopic[];
    readonly commitments: readonly DiscourseCommitment[];
    readonly repairs: readonly DiscourseRepair[];
    readonly charge: ChargeValueName;
}
export declare const discourseStateSchema: {
    readonly $id: "communicating/understanding/discourse-state";
    readonly type: "object";
    readonly required: readonly ["kind", "text", "entities", "references", "presuppositions", "topics", "commitments", "repairs", "charge"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.discourse-state";
        };
        readonly text: {
            readonly type: "string";
        };
        readonly entities: {
            readonly type: "array";
            readonly items: {
                readonly type: "object";
                readonly required: readonly ["id", "label", "mentions", "charge"];
                readonly additionalProperties: false;
                readonly properties: {
                    readonly id: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly label: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly mentions: {
                        readonly type: "array";
                        readonly items: {
                            readonly type: "string";
                        };
                    };
                    readonly charge: {
                        readonly enum: readonly ["absurd", "potential", "active", "stable"];
                    };
                };
            };
        };
        readonly references: {
            readonly type: "array";
            readonly items: {
                readonly type: "object";
                readonly required: readonly ["anaphor", "status", "antecedent", "candidates", "readingId"];
                readonly additionalProperties: false;
                readonly properties: {
                    readonly anaphor: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly status: {
                        readonly enum: readonly ["resolved", "ambiguous", "void"];
                    };
                    readonly antecedent: {
                        readonly anyOf: readonly [{
                            readonly type: "string";
                        }, {
                            readonly type: "null";
                        }];
                    };
                    readonly candidates: {
                        readonly type: "array";
                        readonly items: {
                            readonly type: "string";
                        };
                    };
                    readonly readingId: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                };
            };
        };
        readonly presuppositions: {
            readonly type: "array";
            readonly items: {
                readonly type: "object";
                readonly required: readonly ["trigger", "presupposed", "status", "readingId"];
                readonly additionalProperties: false;
                readonly properties: {
                    readonly trigger: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly presupposed: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly status: {
                        readonly enum: readonly ["absurd", "potential", "active", "stable"];
                    };
                    readonly readingId: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                };
            };
        };
        readonly topics: {
            readonly type: "array";
            readonly items: {
                readonly type: "object";
                readonly required: readonly ["id", "label", "mentions", "charge"];
                readonly additionalProperties: false;
                readonly properties: {
                    readonly id: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly label: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly mentions: {
                        readonly type: "array";
                        readonly items: {
                            readonly type: "string";
                        };
                    };
                    readonly charge: {
                        readonly enum: readonly ["absurd", "potential", "active", "stable"];
                    };
                };
            };
        };
        readonly commitments: {
            readonly type: "array";
            readonly items: {
                readonly type: "object";
                readonly required: readonly ["id", "proposition", "readingId", "charge", "basis"];
                readonly additionalProperties: false;
                readonly properties: {
                    readonly id: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly proposition: {
                        readonly type: "string";
                    };
                    readonly readingId: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly charge: {
                        readonly enum: readonly ["absurd", "potential", "active", "stable"];
                    };
                    readonly basis: {
                        readonly enum: readonly ["assertion", "denial", "ambiguous", "unproved"];
                    };
                };
            };
        };
        readonly repairs: {
            readonly type: "array";
            readonly items: {
                readonly type: "object";
                readonly required: readonly ["kind", "target", "readingId", "charge", "note"];
                readonly additionalProperties: false;
                readonly properties: {
                    readonly kind: {
                        readonly enum: readonly ["unresolved-reference", "ambiguous-reference", "presupposition-accommodation", "parse-obstruction", "grammar-obstruction"];
                    };
                    readonly target: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly readingId: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly charge: {
                        readonly enum: readonly ["absurd", "potential", "active", "stable"];
                    };
                    readonly note: {
                        readonly type: "string";
                    };
                };
            };
        };
        readonly charge: {
            readonly enum: readonly ["absurd", "potential", "active", "stable"];
        };
    };
};
export declare const discourseStateCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.discourse-state";
    readonly text: string;
    readonly entities: readonly {
        readonly charge: "potential" | "active" | "stable" | "absurd";
        readonly label: string;
        readonly id: string;
        readonly mentions: readonly string[];
    }[];
    readonly charge: "potential" | "active" | "stable" | "absurd";
    readonly topics: readonly {
        readonly charge: "potential" | "active" | "stable" | "absurd";
        readonly label: string;
        readonly id: string;
        readonly mentions: readonly string[];
    }[];
    readonly references: readonly {
        readonly status: "ambiguous" | "void" | "resolved";
        readonly antecedent: string | null;
        readonly readingId: string;
        readonly anaphor: string;
        readonly candidates: readonly string[];
    }[];
    readonly presuppositions: readonly {
        readonly status: "potential" | "active" | "stable" | "absurd";
        readonly readingId: string;
        readonly trigger: string;
        readonly presupposed: string;
    }[];
    readonly commitments: readonly {
        readonly charge: "potential" | "active" | "stable" | "absurd";
        readonly id: string;
        readonly readingId: string;
        readonly basis: "ambiguous" | "unproved" | "assertion" | "denial";
        readonly proposition: string;
    }[];
    readonly repairs: readonly {
        readonly kind: "unresolved-reference" | "ambiguous-reference" | "presupposition-accommodation" | "parse-obstruction" | "grammar-obstruction";
        readonly note: string;
        readonly charge: "potential" | "active" | "stable" | "absurd";
        readonly target: string;
        readonly readingId: string;
    }[];
}>;
export declare function discourseStateOfForest(forest: ParseForest, proof?: LambekForestProof): DiscourseState;
//# sourceMappingURL=discourse-state.d.mts.map