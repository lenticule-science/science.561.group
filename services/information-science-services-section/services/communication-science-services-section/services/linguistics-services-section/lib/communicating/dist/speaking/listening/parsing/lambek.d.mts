/**
 * parsing/lambek - type-logical proof carriers over charged parse forests.
 *
 * This is the second layer after parse forests: it does not search a complete
 * grammar calculus. It reads each settled forest reading as a Lambek-style
 * sequent, records lexical hypotheses and dependency-licensed proof steps, and
 * attaches the finite Lambek law witness owned by @red-cup-engineering/relating.
 */
import { type ChargeValueName } from "@red-cup-engineering/relating";
import type { ParseForest } from "./types.mjs";
export type LambekProofRule = "lexical" | "left-residual-application" | "right-residual-application" | "sentence-introduction" | "obstruction";
export interface LambekHypothesis {
    readonly wordId: string;
    readonly text: string;
    readonly category: string;
    readonly charge: ChargeValueName;
}
export interface LambekProofStep {
    readonly rule: LambekProofRule;
    readonly premises: readonly string[];
    readonly conclusion: string;
    readonly charge: ChargeValueName;
    readonly evidence: string;
}
export interface LambekSequent {
    readonly antecedent: readonly string[];
    readonly succedent: string;
}
export interface LambekForestReadingProof {
    readonly kind: "communicating.lambek.reading-proof";
    readonly readingId: string;
    readonly sequent: LambekSequent;
    readonly hypotheses: readonly LambekHypothesis[];
    readonly steps: readonly LambekProofStep[];
    readonly conclusion: string;
    readonly charge: ChargeValueName;
    readonly proven: boolean;
    readonly obstructions: readonly string[];
}
export interface LambekForestProof {
    readonly kind: "communicating.lambek.forest-proof";
    readonly text: string;
    readonly proofs: readonly LambekForestReadingProof[];
    readonly charge: ChargeValueName;
    readonly proven: boolean;
    readonly laws: unknown;
}
export declare const lambekForestReadingProofSchema: {
    readonly $id: "communicating/parsing/lambek-reading-proof";
    readonly type: "object";
    readonly required: readonly ["kind", "readingId", "sequent", "hypotheses", "steps", "conclusion", "charge", "proven", "obstructions"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.lambek.reading-proof";
        };
        readonly readingId: {
            readonly type: "string";
            readonly minLength: 1;
        };
        readonly sequent: {
            readonly type: "object";
            readonly required: readonly ["antecedent", "succedent"];
            readonly additionalProperties: false;
            readonly properties: {
                readonly antecedent: {
                    readonly type: "array";
                    readonly items: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                };
                readonly succedent: {
                    readonly type: "string";
                    readonly minLength: 1;
                };
            };
        };
        readonly hypotheses: {
            readonly type: "array";
            readonly items: {
                readonly type: "object";
                readonly required: readonly ["wordId", "text", "category", "charge"];
                readonly additionalProperties: false;
                readonly properties: {
                    readonly wordId: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly text: {
                        readonly type: "string";
                    };
                    readonly category: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly charge: {
                        readonly enum: readonly ["absurd", "potential", "active", "stable"];
                    };
                };
            };
        };
        readonly steps: {
            readonly type: "array";
            readonly items: {
                readonly type: "object";
                readonly required: readonly ["rule", "premises", "conclusion", "charge", "evidence"];
                readonly additionalProperties: false;
                readonly properties: {
                    readonly rule: {
                        readonly enum: readonly ["lexical", "left-residual-application", "right-residual-application", "sentence-introduction", "obstruction"];
                    };
                    readonly premises: {
                        readonly type: "array";
                        readonly items: {
                            readonly type: "string";
                        };
                    };
                    readonly conclusion: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly charge: {
                        readonly enum: readonly ["absurd", "potential", "active", "stable"];
                    };
                    readonly evidence: {
                        readonly type: "string";
                    };
                };
            };
        };
        readonly conclusion: {
            readonly type: "string";
            readonly minLength: 1;
        };
        readonly charge: {
            readonly enum: readonly ["absurd", "potential", "active", "stable"];
        };
        readonly proven: {
            readonly type: "boolean";
        };
        readonly obstructions: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
            };
        };
    };
};
export declare const lambekForestProofSchema: {
    readonly $id: "communicating/parsing/lambek-forest-proof";
    readonly type: "object";
    readonly required: readonly ["kind", "text", "proofs", "charge", "proven", "laws"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.lambek.forest-proof";
        };
        readonly text: {
            readonly type: "string";
        };
        readonly proofs: {
            readonly type: "array";
            readonly items: {
                readonly $id: "communicating/parsing/lambek-reading-proof";
                readonly type: "object";
                readonly required: readonly ["kind", "readingId", "sequent", "hypotheses", "steps", "conclusion", "charge", "proven", "obstructions"];
                readonly additionalProperties: false;
                readonly properties: {
                    readonly kind: {
                        readonly const: "communicating.lambek.reading-proof";
                    };
                    readonly readingId: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly sequent: {
                        readonly type: "object";
                        readonly required: readonly ["antecedent", "succedent"];
                        readonly additionalProperties: false;
                        readonly properties: {
                            readonly antecedent: {
                                readonly type: "array";
                                readonly items: {
                                    readonly type: "string";
                                    readonly minLength: 1;
                                };
                            };
                            readonly succedent: {
                                readonly type: "string";
                                readonly minLength: 1;
                            };
                        };
                    };
                    readonly hypotheses: {
                        readonly type: "array";
                        readonly items: {
                            readonly type: "object";
                            readonly required: readonly ["wordId", "text", "category", "charge"];
                            readonly additionalProperties: false;
                            readonly properties: {
                                readonly wordId: {
                                    readonly type: "string";
                                    readonly minLength: 1;
                                };
                                readonly text: {
                                    readonly type: "string";
                                };
                                readonly category: {
                                    readonly type: "string";
                                    readonly minLength: 1;
                                };
                                readonly charge: {
                                    readonly enum: readonly ["absurd", "potential", "active", "stable"];
                                };
                            };
                        };
                    };
                    readonly steps: {
                        readonly type: "array";
                        readonly items: {
                            readonly type: "object";
                            readonly required: readonly ["rule", "premises", "conclusion", "charge", "evidence"];
                            readonly additionalProperties: false;
                            readonly properties: {
                                readonly rule: {
                                    readonly enum: readonly ["lexical", "left-residual-application", "right-residual-application", "sentence-introduction", "obstruction"];
                                };
                                readonly premises: {
                                    readonly type: "array";
                                    readonly items: {
                                        readonly type: "string";
                                    };
                                };
                                readonly conclusion: {
                                    readonly type: "string";
                                    readonly minLength: 1;
                                };
                                readonly charge: {
                                    readonly enum: readonly ["absurd", "potential", "active", "stable"];
                                };
                                readonly evidence: {
                                    readonly type: "string";
                                };
                            };
                        };
                    };
                    readonly conclusion: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly charge: {
                        readonly enum: readonly ["absurd", "potential", "active", "stable"];
                    };
                    readonly proven: {
                        readonly type: "boolean";
                    };
                    readonly obstructions: {
                        readonly type: "array";
                        readonly items: {
                            readonly type: "string";
                        };
                    };
                };
            };
        };
        readonly charge: {
            readonly enum: readonly ["absurd", "potential", "active", "stable"];
        };
        readonly proven: {
            readonly type: "boolean";
        };
        readonly laws: {
            readonly type: "object";
            readonly additionalProperties: true;
        };
    };
};
export declare const lambekForestReadingProofCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.lambek.reading-proof";
    readonly charge: "potential" | "active" | "stable" | "absurd";
    readonly obstructions: readonly string[];
    readonly conclusion: string;
    readonly readingId: string;
    readonly sequent: {
        readonly antecedent: readonly string[];
        readonly succedent: string;
    };
    readonly hypotheses: readonly {
        readonly text: string;
        readonly charge: "potential" | "active" | "stable" | "absurd";
        readonly wordId: string;
        readonly category: string;
    }[];
    readonly steps: readonly {
        readonly charge: "potential" | "active" | "stable" | "absurd";
        readonly rule: "lexical" | "left-residual-application" | "right-residual-application" | "sentence-introduction" | "obstruction";
        readonly premises: readonly string[];
        readonly conclusion: string;
        readonly evidence: string;
    }[];
    readonly proven: boolean;
}>;
export declare const lambekForestProofCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.lambek.forest-proof";
    readonly text: string;
    readonly laws: Record<string, unknown>;
    readonly charge: "potential" | "active" | "stable" | "absurd";
    readonly proven: boolean;
    readonly proofs: readonly {
        readonly kind: "communicating.lambek.reading-proof";
        readonly charge: "potential" | "active" | "stable" | "absurd";
        readonly obstructions: readonly string[];
        readonly conclusion: string;
        readonly readingId: string;
        readonly sequent: {
            readonly antecedent: readonly string[];
            readonly succedent: string;
        };
        readonly hypotheses: readonly {
            readonly text: string;
            readonly charge: "potential" | "active" | "stable" | "absurd";
            readonly wordId: string;
            readonly category: string;
        }[];
        readonly steps: readonly {
            readonly charge: "potential" | "active" | "stable" | "absurd";
            readonly rule: "lexical" | "left-residual-application" | "right-residual-application" | "sentence-introduction" | "obstruction";
            readonly premises: readonly string[];
            readonly conclusion: string;
            readonly evidence: string;
        }[];
        readonly proven: boolean;
    }[];
}>;
export declare function lambekProofOfForest(forest: ParseForest): LambekForestProof;
//# sourceMappingURL=lambek.d.mts.map