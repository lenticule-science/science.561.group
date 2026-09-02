import { type FromSchema } from "@red-cup-engineering/relating";
import type { RawBundle, CompiledBundle } from "./fiber.mjs";
import "./profile.mjs";
export declare const languageManifestSchema: {
    readonly $id: "communicating/language/manifest";
    readonly type: "object";
    readonly required: readonly ["kind", "bundle"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.language-manifest";
        };
        readonly bundle: {
            readonly type: "object";
            readonly required: readonly ["meta", "lexicon", "morphology", "reference", "wordOrder", "attachment", "segmentation"];
            readonly properties: {
                readonly meta: {
                    readonly type: "object";
                    readonly required: readonly ["name", "code", "script", "direction"];
                    readonly additionalProperties: false;
                    readonly properties: {
                        readonly name: {
                            readonly type: "string";
                            readonly minLength: 1;
                        };
                        readonly code: {
                            readonly type: "string";
                            readonly minLength: 1;
                        };
                        readonly script: {
                            readonly type: "string";
                            readonly minLength: 1;
                        };
                        readonly direction: {
                            readonly enum: readonly ["ltr", "rtl"];
                        };
                    };
                };
                readonly lexicon: {
                    readonly type: "object";
                    readonly required: readonly ["determiners", "prepositions", "pronouns", "conjunctions", "auxiliaries", "copula"];
                    readonly additionalProperties: false;
                    readonly properties: {
                        readonly determiners: {
                            readonly type: "array";
                            readonly items: {
                                readonly type: "string";
                            };
                        };
                        readonly prepositions: {
                            readonly type: "array";
                            readonly items: {
                                readonly type: "string";
                            };
                        };
                        readonly pronouns: {
                            readonly type: "array";
                            readonly items: {
                                readonly type: "string";
                            };
                        };
                        readonly conjunctions: {
                            readonly type: "array";
                            readonly items: {
                                readonly type: "string";
                            };
                        };
                        readonly auxiliaries: {
                            readonly type: "array";
                            readonly items: {
                                readonly type: "string";
                            };
                        };
                        readonly copula: {
                            readonly type: "array";
                            readonly items: {
                                readonly type: "string";
                            };
                        };
                    };
                };
                readonly morphology: {
                    readonly type: "object";
                    readonly required: readonly ["suffixRules", "numberSuffixPattern", "verbFormRules", "numberWords"];
                    readonly properties: {
                        readonly suffixRules: {
                            readonly type: "array";
                            readonly items: {
                                readonly type: "object";
                                readonly required: readonly ["pattern", "tag"];
                                readonly properties: {
                                    readonly pattern: {
                                        readonly type: "string";
                                        readonly minLength: 1;
                                    };
                                    readonly tag: {
                                        readonly type: "string";
                                        readonly minLength: 1;
                                    };
                                };
                            };
                        };
                        readonly featureRules: {
                            readonly type: "array";
                            readonly items: {
                                readonly type: "object";
                                readonly required: readonly ["pattern", "tag"];
                                readonly properties: {
                                    readonly pattern: {
                                        readonly type: "string";
                                        readonly minLength: 1;
                                    };
                                    readonly tag: {
                                        readonly type: "string";
                                        readonly minLength: 1;
                                    };
                                };
                            };
                        };
                        readonly rootPatternRules: {
                            readonly type: "array";
                            readonly items: {
                                readonly $ref: "communicating/language/morphotactic-pattern-rule";
                            };
                        };
                        readonly numberSuffixPattern: {
                            readonly type: "string";
                        };
                        readonly verbFormRules: {
                            readonly type: "array";
                            readonly items: {
                                readonly type: "object";
                                readonly required: readonly ["pattern", "tag"];
                                readonly properties: {
                                    readonly pattern: {
                                        readonly type: "string";
                                        readonly minLength: 1;
                                    };
                                    readonly tag: {
                                        readonly type: "string";
                                        readonly minLength: 1;
                                    };
                                };
                            };
                        };
                        readonly numberWords: {
                            readonly type: "array";
                            readonly items: {
                                readonly type: "string";
                            };
                        };
                        readonly irregularPlurals: {
                            readonly type: "object";
                        };
                        readonly irregularVerbs: {
                            readonly type: "object";
                        };
                        readonly verbStems: {
                            readonly type: "array";
                            readonly items: {
                                readonly type: "string";
                            };
                        };
                    };
                };
                readonly reference: {
                    readonly type: "object";
                    readonly required: readonly ["pronouns"];
                    readonly properties: {
                        readonly pronouns: {
                            readonly type: "object";
                        };
                        readonly nameGender: {
                            readonly type: "object";
                        };
                    };
                };
                readonly wordOrder: {
                    readonly enum: readonly ["SVO", "SOV", "VSO", "VOS", "OVS", "OSV", "free", "topic-comment"];
                };
                readonly roleBy: {
                    readonly enum: readonly ["case"];
                };
                readonly grammar: {
                    readonly $ref: "communicating/language/grammar-profile";
                };
                readonly registerFiber: {
                    readonly type: "object";
                    readonly additionalProperties: false;
                    readonly properties: {
                        readonly register: {
                            readonly type: "array";
                            readonly items: {
                                readonly type: "string";
                                readonly minLength: 1;
                            };
                        };
                        readonly style: {
                            readonly type: "array";
                            readonly items: {
                                readonly type: "string";
                                readonly minLength: 1;
                            };
                        };
                        readonly evidentiality: {
                            readonly type: "array";
                            readonly items: {
                                readonly type: "string";
                                readonly minLength: 1;
                            };
                        };
                        readonly politeness: {
                            readonly type: "array";
                            readonly items: {
                                readonly type: "string";
                                readonly minLength: 1;
                            };
                        };
                        readonly genre: {
                            readonly type: "array";
                            readonly items: {
                                readonly type: "string";
                                readonly minLength: 1;
                            };
                        };
                    };
                };
                readonly attachment: {
                    readonly type: "object";
                    readonly required: readonly ["determiner", "adjective", "subject", "object"];
                    readonly additionalProperties: false;
                    readonly properties: {
                        readonly determiner: {
                            readonly enum: readonly ["left", "right"];
                        };
                        readonly adjective: {
                            readonly enum: readonly ["left", "right"];
                        };
                        readonly subject: {
                            readonly enum: readonly ["left", "right"];
                        };
                        readonly object: {
                            readonly enum: readonly ["left", "right"];
                        };
                    };
                };
                readonly segmentation: {
                    readonly type: "object";
                    readonly required: readonly ["sentenceTerminatorPattern", "abbreviations"];
                    readonly additionalProperties: false;
                    readonly properties: {
                        readonly sentenceTerminatorPattern: {
                            readonly type: "string";
                        };
                        readonly abbreviations: {
                            readonly type: "array";
                            readonly items: {
                                readonly type: "string";
                            };
                        };
                    };
                };
            };
        };
        readonly witnessJournal: {
            readonly type: "array";
            readonly items: {
                readonly type: "object";
                readonly required: readonly ["entity", "attribute", "value"];
                readonly additionalProperties: false;
                readonly properties: {
                    readonly entity: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly attribute: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly value: {};
                    readonly time: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly witness: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                };
            };
        };
        readonly rmn: {
            readonly type: "array";
            readonly items: {
                readonly type: "object";
            };
        };
        readonly lambek: {
            readonly type: "object";
            readonly properties: {
                readonly categories: {
                    readonly type: "array";
                    readonly items: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                };
                readonly judgments: {
                    readonly type: "array";
                    readonly items: {
                        readonly type: "object";
                    };
                };
            };
        };
        readonly sofic: {
            readonly type: "object";
            readonly properties: {
                readonly alphabet: {
                    readonly type: "array";
                    readonly items: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                };
                readonly graph: {
                    readonly type: "array";
                    readonly items: {
                        readonly type: "array";
                        readonly items: {
                            readonly type: "boolean";
                        };
                    };
                };
                readonly factor: {
                    readonly type: "array";
                    readonly items: {
                        readonly type: "integer";
                        readonly minimum: 0;
                    };
                };
                readonly sample: {
                    readonly type: "array";
                    readonly items: {
                        readonly type: "integer";
                        readonly minimum: 0;
                    };
                };
                readonly note: {
                    readonly type: "string";
                };
            };
        };
        readonly chu: {
            readonly type: "object";
            readonly properties: {
                readonly pts: {
                    readonly type: "array";
                    readonly items: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                };
                readonly sts: {
                    readonly type: "array";
                    readonly items: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                };
                readonly matrix: {
                    readonly type: "array";
                    readonly items: {
                        readonly type: "object";
                    };
                };
            };
        };
        readonly discourseCover: {
            readonly type: "object";
            readonly required: readonly ["entities", "cells", "components"];
            readonly additionalProperties: false;
            readonly properties: {
                readonly entities: {
                    readonly type: "integer";
                    readonly minimum: 0;
                };
                readonly cells: {
                    readonly type: "integer";
                    readonly minimum: 0;
                };
                readonly components: {
                    readonly type: "integer";
                    readonly minimum: 0;
                };
                readonly note: {
                    readonly type: "string";
                };
            };
        };
    };
};
export type LanguageManifestCarrier = FromSchema<typeof languageManifestSchema>;
export declare const languageManifestCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.language-manifest";
    readonly bundle: {
        readonly wordOrder: "SVO" | "SOV" | "VSO" | "VOS" | "OVS" | "OSV" | "free" | "topic-comment";
        readonly morphology: {
            readonly suffixRules: readonly {
                readonly pattern: string;
                readonly tag: string;
            }[];
            readonly numberSuffixPattern: string;
            readonly verbFormRules: readonly {
                readonly pattern: string;
                readonly tag: string;
            }[];
            readonly numberWords: readonly string[];
            readonly featureRules?: readonly {
                readonly pattern: string;
                readonly tag: string;
            }[];
            readonly rootPatternRules?: readonly unknown[];
            readonly irregularPlurals?: Record<string, unknown>;
            readonly irregularVerbs?: Record<string, unknown>;
            readonly verbStems?: readonly string[];
        };
        readonly segmentation: {
            readonly sentenceTerminatorPattern: string;
            readonly abbreviations: readonly string[];
        };
        readonly lexicon: {
            readonly determiners: readonly string[];
            readonly prepositions: readonly string[];
            readonly pronouns: readonly string[];
            readonly conjunctions: readonly string[];
            readonly auxiliaries: readonly string[];
            readonly copula: readonly string[];
        };
        readonly reference: {
            readonly pronouns: Record<string, unknown>;
            readonly nameGender?: Record<string, unknown>;
        };
        readonly meta: {
            readonly script: string;
            readonly direction: "ltr" | "rtl";
            readonly name: string;
            readonly code: string;
        };
        readonly attachment: {
            readonly object: "left" | "right";
            readonly determiner: "left" | "right";
            readonly adjective: "left" | "right";
            readonly subject: "left" | "right";
        };
        readonly roleBy?: "case";
        readonly grammar?: unknown;
        readonly registerFiber?: {
            readonly register?: readonly string[];
            readonly style?: readonly string[];
            readonly evidentiality?: readonly string[];
            readonly politeness?: readonly string[];
            readonly genre?: readonly string[];
        };
    };
    readonly witnessJournal?: readonly {
        readonly value: unknown;
        readonly entity: string;
        readonly attribute: string;
        readonly witness?: string;
        readonly time?: string;
    }[];
    readonly rmn?: readonly Record<string, unknown>[];
    readonly lambek?: {
        readonly categories?: readonly string[];
        readonly judgments?: readonly Record<string, unknown>[];
    };
    readonly sofic?: {
        readonly alphabet?: readonly string[];
        readonly graph?: readonly (readonly boolean[])[];
        readonly factor?: readonly number[];
        readonly sample?: readonly number[];
        readonly note?: string;
    };
    readonly chu?: {
        readonly pts?: readonly string[];
        readonly sts?: readonly string[];
        readonly matrix?: readonly Record<string, unknown>[];
    };
    readonly discourseCover?: {
        readonly entities: number;
        readonly cells: number;
        readonly components: number;
        readonly note?: string;
    };
}>;
export interface WitnessJournalLiteral {
    readonly entity: string;
    readonly attribute: string;
    readonly value: unknown;
    readonly time?: string;
    readonly witness?: string;
}
export interface LambekManifest {
    readonly categories?: readonly string[];
    readonly judgments?: readonly Record<string, unknown>[];
}
export interface SoficManifest {
    readonly alphabet?: readonly string[];
    readonly graph?: readonly (readonly boolean[])[];
    readonly factor?: readonly number[];
    readonly sample?: readonly number[];
    readonly note?: string;
}
export interface ChuManifest {
    readonly pts?: readonly string[];
    readonly sts?: readonly string[];
    readonly matrix?: readonly Record<string, unknown>[];
}
export interface DiscourseCoverManifest {
    readonly entities: number;
    readonly cells: number;
    readonly components: number;
    readonly note?: string;
}
export interface LanguageManifest extends Omit<LanguageManifestCarrier, "bundle" | "witnessJournal" | "lambek" | "sofic" | "chu" | "discourseCover"> {
    readonly bundle: RawBundle;
    readonly witnessJournal?: readonly WitnessJournalLiteral[];
    readonly lambek?: LambekManifest;
    readonly sofic?: SoficManifest;
    readonly chu?: ChuManifest;
    readonly discourseCover?: DiscourseCoverManifest;
}
export interface LanguageManifestReceipt {
    readonly kind: "communicating.language-manifest.receipts";
    readonly language: string;
    readonly witnessJournal: readonly WitnessJournalLiteral[];
    readonly lambek: unknown;
    readonly sofic: unknown;
    readonly chu: unknown;
    readonly discourseCover: unknown;
}
export declare function loadLanguageManifest(value: unknown, context?: string): LanguageManifest;
export declare function loadLanguageManifestFile(url: URL, context?: string): LanguageManifest;
export declare const bundleFromLanguageManifest: (manifest: LanguageManifest) => RawBundle;
export declare const compiledBundleFromLanguageManifest: (manifest: LanguageManifest) => CompiledBundle;
export declare function languageManifestWitnessJournalRows(manifest: LanguageManifest): readonly WitnessJournalLiteral[];
export declare function lambekManifestReceipt(manifest: LanguageManifest): unknown;
export declare function soficManifestReceipt(manifest: LanguageManifest): unknown;
export declare function chuManifestReceipt(manifest: LanguageManifest): unknown;
export declare function discourseCoverManifestReceipt(manifest: LanguageManifest): unknown;
export declare function languageManifestReceipts(manifest: LanguageManifest): LanguageManifestReceipt;
//# sourceMappingURL=manifest.d.mts.map