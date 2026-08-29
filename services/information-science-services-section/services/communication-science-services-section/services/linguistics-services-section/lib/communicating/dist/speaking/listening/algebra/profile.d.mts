import { type FromSchema } from "@red-cup-engineering/relating";
export declare const languageGrammarProfileSchema: {
    readonly $id: "communicating/language/grammar-profile";
    readonly type: "object";
    readonly required: readonly ["kind", "wordOrder", "alignment", "headDirectionality", "roleStrategies", "morphology", "segmentation"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.language-grammar-profile";
        };
        readonly wordOrder: {
            readonly enum: readonly ["SVO", "SOV", "VSO", "VOS", "OVS", "OSV", "free", "topic-comment"];
        };
        readonly alignment: {
            readonly enum: readonly ["nominative-accusative", "ergative-absolutive", "active-stative", "semantic-particle", "topic-comment", "underdetermined"];
        };
        readonly headDirectionality: {
            readonly type: "object";
            readonly required: readonly ["determiner", "adjective", "subject", "object", "adposition"];
            readonly additionalProperties: false;
            readonly properties: {
                readonly determiner: {
                    readonly enum: readonly ["left", "right", "mixed"];
                };
                readonly adjective: {
                    readonly enum: readonly ["left", "right", "mixed"];
                };
                readonly subject: {
                    readonly enum: readonly ["left", "right", "mixed"];
                };
                readonly object: {
                    readonly enum: readonly ["left", "right", "mixed"];
                };
                readonly adposition: {
                    readonly enum: readonly ["left", "right", "mixed"];
                };
            };
        };
        readonly roleStrategies: {
            readonly type: "array";
            readonly items: {
                readonly type: "object";
                readonly required: readonly ["relation", "by"];
                readonly additionalProperties: false;
                readonly properties: {
                    readonly relation: {
                        readonly enum: readonly ["nsubj", "dobj", "det", "amod", "advmod", "prep", "pobj", "obl", "case", "discourse", "topic", "focus", "contrast", "repair", "ccomp", "mark"];
                    };
                    readonly by: {
                        readonly enum: readonly ["position", "case", "particle", "nearest"];
                    };
                    readonly direction: {
                        readonly enum: readonly ["left", "right", "any"];
                    };
                    readonly distance: {
                        readonly enum: readonly ["nearest", "farthest"];
                    };
                    readonly caseFeature: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly marker: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly markerPosition: {
                        readonly enum: readonly ["before", "after"];
                    };
                    readonly note: {
                        readonly type: "string";
                    };
                };
            };
        };
        readonly morphology: {
            readonly type: "object";
            readonly required: readonly ["type", "caseMarking", "agreement"];
            readonly additionalProperties: false;
            readonly properties: {
                readonly type: {
                    readonly enum: readonly ["isolating", "agglutinative", "fusional", "polysynthetic", "mixed"];
                };
                readonly caseMarking: {
                    readonly enum: readonly ["none", "suffix", "particle", "mixed"];
                };
                readonly agreement: {
                    readonly enum: readonly ["none", "weak", "rich", "pronominal"];
                };
            };
        };
        readonly segmentation: {
            readonly type: "object";
            readonly required: readonly ["sentenceBoundary", "wordBoundary"];
            readonly additionalProperties: false;
            readonly properties: {
                readonly sentenceBoundary: {
                    readonly enum: readonly ["punctuation", "particle", "line", "mixed"];
                };
                readonly wordBoundary: {
                    readonly enum: readonly ["space", "script", "morpheme", "mixed"];
                };
            };
        };
        readonly notes: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
            };
        };
    };
};
export type LanguageGrammarProfile = FromSchema<typeof languageGrammarProfileSchema>;
export declare const languageGrammarProfileCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.language-grammar-profile";
    readonly wordOrder: "SVO" | "SOV" | "VSO" | "VOS" | "OVS" | "OSV" | "free" | "topic-comment";
    readonly alignment: "topic-comment" | "nominative-accusative" | "ergative-absolutive" | "active-stative" | "semantic-particle" | "underdetermined";
    readonly headDirectionality: {
        readonly object: "left" | "right" | "mixed";
        readonly determiner: "left" | "right" | "mixed";
        readonly adjective: "left" | "right" | "mixed";
        readonly subject: "left" | "right" | "mixed";
        readonly adposition: "left" | "right" | "mixed";
    };
    readonly roleStrategies: readonly {
        readonly relation: "mark" | "nsubj" | "dobj" | "det" | "amod" | "advmod" | "prep" | "pobj" | "obl" | "case" | "discourse" | "topic" | "focus" | "contrast" | "repair" | "ccomp";
        readonly by: "case" | "position" | "particle" | "nearest";
        readonly direction?: "left" | "right" | "any";
        readonly caseFeature?: string;
        readonly distance?: "nearest" | "farthest";
        readonly marker?: string;
        readonly markerPosition?: "before" | "after";
        readonly note?: string;
    }[];
    readonly morphology: {
        readonly type: "mixed" | "isolating" | "agglutinative" | "fusional" | "polysynthetic";
        readonly caseMarking: "mixed" | "particle" | "none" | "suffix";
        readonly agreement: "none" | "weak" | "rich" | "pronominal";
    };
    readonly segmentation: {
        readonly sentenceBoundary: "mixed" | "particle" | "punctuation" | "line";
        readonly wordBoundary: "mixed" | "space" | "script" | "morpheme";
    };
    readonly notes?: readonly string[];
}>;
export declare const morphotacticPatternRuleSchema: {
    readonly $id: "communicating/language/morphotactic-pattern-rule";
    readonly type: "object";
    readonly required: readonly ["pattern", "tag"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly pattern: {
            readonly type: "string";
            readonly minLength: 1;
            readonly description: "A Unicode regular expression over the surface token.";
        };
        readonly tag: {
            readonly type: "string";
            readonly minLength: 1;
            readonly description: "The syntactic tag admitted when the surface matches the pattern.";
        };
        readonly root: {
            readonly type: "string";
            readonly minLength: 1;
            readonly description: "Optional consonantal/root witness read from a non-concatenative template.";
        };
        readonly template: {
            readonly type: "string";
            readonly minLength: 1;
            readonly description: "Optional template or stem-pattern witness.";
        };
        readonly features: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
                readonly minLength: 1;
            };
        };
    };
};
export type MorphotacticPatternRule = FromSchema<typeof morphotacticPatternRuleSchema>;
export declare const morphotacticPatternRuleCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly pattern: string;
    readonly tag: string;
    readonly root?: string;
    readonly template?: string;
    readonly features?: readonly string[];
}>;
export declare function grammarProfileFromLegacyBundle(raw: {
    readonly wordOrder: "SVO" | "SOV" | "VSO" | "VOS" | "OVS" | "OSV" | "free" | "topic-comment";
    readonly roleBy?: "case";
    readonly attachment: {
        readonly determiner: "left" | "right";
        readonly adjective: "left" | "right";
        readonly subject: "left" | "right";
        readonly object: "left" | "right";
    };
}): LanguageGrammarProfile;
//# sourceMappingURL=profile.d.mts.map