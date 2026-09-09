import type { CommunicatingCarrier } from "./carrier.mjs";
import type { ArticulateResult, CompiledBundle, ParseForest, Span } from "./types.mjs";
export declare const parseForestReadingSchema: {
    readonly $id: "communicating/parsing/parse-forest-reading";
    readonly type: "object";
    readonly required: readonly ["kind", "id", "span", "parse", "charge", "glued", "complete", "ambiguity", "obstructions"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.parse-forest.reading";
        };
        readonly id: {
            readonly type: "string";
            readonly minLength: 1;
        };
        readonly span: {
            readonly type: "object";
            readonly required: readonly ["tier", "start", "end", "text"];
            readonly additionalProperties: false;
            readonly properties: {
                readonly tier: {
                    readonly enum: readonly ["document", "block", "sentence", "clause", "word", "quote", "rule"];
                };
                readonly start: {
                    readonly anyOf: readonly [{
                        readonly type: "integer";
                        readonly minimum: 0;
                    }, {
                        readonly type: "null";
                    }];
                };
                readonly end: {
                    readonly anyOf: readonly [{
                        readonly type: "integer";
                        readonly minimum: 0;
                    }, {
                        readonly type: "null";
                    }];
                };
                readonly text: {
                    readonly type: "string";
                };
                readonly numeric: {
                    readonly type: "boolean";
                };
            };
        };
        readonly parse: {
            readonly type: "object";
            readonly additionalProperties: true;
        };
        readonly charge: {
            readonly enum: readonly ["absurd", "potential", "active", "stable"];
        };
        readonly glued: {
            readonly type: "boolean";
        };
        readonly complete: {
            readonly type: "boolean";
        };
        readonly ambiguity: {
            readonly type: "integer";
            readonly minimum: 0;
        };
        readonly obstructions: {
            readonly type: "array";
            readonly items: {
                readonly type: "object";
                readonly required: readonly ["kind", "label", "on", "value"];
                readonly additionalProperties: false;
                readonly properties: {
                    readonly kind: {
                        readonly enum: readonly ["conflict", "void"];
                    };
                    readonly label: {
                        readonly type: "string";
                    };
                    readonly on: {
                        readonly type: "string";
                    };
                    readonly value: {
                        readonly enum: readonly ["absurd", "potential", "active", "stable"];
                    };
                };
            };
        };
        readonly quotes: {
            readonly type: "array";
            readonly items: {
                readonly type: "object";
                readonly required: readonly ["tier", "start", "end", "text"];
                readonly additionalProperties: false;
                readonly properties: {
                    readonly tier: {
                        readonly enum: readonly ["document", "block", "sentence", "clause", "word", "quote", "rule"];
                    };
                    readonly start: {
                        readonly anyOf: readonly [{
                            readonly type: "integer";
                            readonly minimum: 0;
                        }, {
                            readonly type: "null";
                        }];
                    };
                    readonly end: {
                        readonly anyOf: readonly [{
                            readonly type: "integer";
                            readonly minimum: 0;
                        }, {
                            readonly type: "null";
                        }];
                    };
                    readonly text: {
                        readonly type: "string";
                    };
                    readonly numeric: {
                        readonly type: "boolean";
                    };
                };
            };
        };
        readonly numericTokens: {
            readonly type: "array";
            readonly items: {
                readonly type: "object";
                readonly required: readonly ["tier", "start", "end", "text"];
                readonly additionalProperties: false;
                readonly properties: {
                    readonly tier: {
                        readonly enum: readonly ["document", "block", "sentence", "clause", "word", "quote", "rule"];
                    };
                    readonly start: {
                        readonly anyOf: readonly [{
                            readonly type: "integer";
                            readonly minimum: 0;
                        }, {
                            readonly type: "null";
                        }];
                    };
                    readonly end: {
                        readonly anyOf: readonly [{
                            readonly type: "integer";
                            readonly minimum: 0;
                        }, {
                            readonly type: "null";
                        }];
                    };
                    readonly text: {
                        readonly type: "string";
                    };
                    readonly numeric: {
                        readonly type: "boolean";
                    };
                };
            };
        };
    };
};
export declare const parseForestSchema: {
    readonly $id: "communicating/parsing/parse-forest";
    readonly type: "object";
    readonly required: readonly ["kind", "text", "readings", "charge", "glued", "complete", "ambiguity", "obstructions"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.parse-forest";
        };
        readonly text: {
            readonly type: "string";
        };
        readonly readings: {
            readonly type: "array";
            readonly items: {
                readonly $id: "communicating/parsing/parse-forest-reading";
                readonly type: "object";
                readonly required: readonly ["kind", "id", "span", "parse", "charge", "glued", "complete", "ambiguity", "obstructions"];
                readonly additionalProperties: false;
                readonly properties: {
                    readonly kind: {
                        readonly const: "communicating.parse-forest.reading";
                    };
                    readonly id: {
                        readonly type: "string";
                        readonly minLength: 1;
                    };
                    readonly span: {
                        readonly type: "object";
                        readonly required: readonly ["tier", "start", "end", "text"];
                        readonly additionalProperties: false;
                        readonly properties: {
                            readonly tier: {
                                readonly enum: readonly ["document", "block", "sentence", "clause", "word", "quote", "rule"];
                            };
                            readonly start: {
                                readonly anyOf: readonly [{
                                    readonly type: "integer";
                                    readonly minimum: 0;
                                }, {
                                    readonly type: "null";
                                }];
                            };
                            readonly end: {
                                readonly anyOf: readonly [{
                                    readonly type: "integer";
                                    readonly minimum: 0;
                                }, {
                                    readonly type: "null";
                                }];
                            };
                            readonly text: {
                                readonly type: "string";
                            };
                            readonly numeric: {
                                readonly type: "boolean";
                            };
                        };
                    };
                    readonly parse: {
                        readonly type: "object";
                        readonly additionalProperties: true;
                    };
                    readonly charge: {
                        readonly enum: readonly ["absurd", "potential", "active", "stable"];
                    };
                    readonly glued: {
                        readonly type: "boolean";
                    };
                    readonly complete: {
                        readonly type: "boolean";
                    };
                    readonly ambiguity: {
                        readonly type: "integer";
                        readonly minimum: 0;
                    };
                    readonly obstructions: {
                        readonly type: "array";
                        readonly items: {
                            readonly type: "object";
                            readonly required: readonly ["kind", "label", "on", "value"];
                            readonly additionalProperties: false;
                            readonly properties: {
                                readonly kind: {
                                    readonly enum: readonly ["conflict", "void"];
                                };
                                readonly label: {
                                    readonly type: "string";
                                };
                                readonly on: {
                                    readonly type: "string";
                                };
                                readonly value: {
                                    readonly enum: readonly ["absurd", "potential", "active", "stable"];
                                };
                            };
                        };
                    };
                    readonly quotes: {
                        readonly type: "array";
                        readonly items: {
                            readonly type: "object";
                            readonly required: readonly ["tier", "start", "end", "text"];
                            readonly additionalProperties: false;
                            readonly properties: {
                                readonly tier: {
                                    readonly enum: readonly ["document", "block", "sentence", "clause", "word", "quote", "rule"];
                                };
                                readonly start: {
                                    readonly anyOf: readonly [{
                                        readonly type: "integer";
                                        readonly minimum: 0;
                                    }, {
                                        readonly type: "null";
                                    }];
                                };
                                readonly end: {
                                    readonly anyOf: readonly [{
                                        readonly type: "integer";
                                        readonly minimum: 0;
                                    }, {
                                        readonly type: "null";
                                    }];
                                };
                                readonly text: {
                                    readonly type: "string";
                                };
                                readonly numeric: {
                                    readonly type: "boolean";
                                };
                            };
                        };
                    };
                    readonly numericTokens: {
                        readonly type: "array";
                        readonly items: {
                            readonly type: "object";
                            readonly required: readonly ["tier", "start", "end", "text"];
                            readonly additionalProperties: false;
                            readonly properties: {
                                readonly tier: {
                                    readonly enum: readonly ["document", "block", "sentence", "clause", "word", "quote", "rule"];
                                };
                                readonly start: {
                                    readonly anyOf: readonly [{
                                        readonly type: "integer";
                                        readonly minimum: 0;
                                    }, {
                                        readonly type: "null";
                                    }];
                                };
                                readonly end: {
                                    readonly anyOf: readonly [{
                                        readonly type: "integer";
                                        readonly minimum: 0;
                                    }, {
                                        readonly type: "null";
                                    }];
                                };
                                readonly text: {
                                    readonly type: "string";
                                };
                                readonly numeric: {
                                    readonly type: "boolean";
                                };
                            };
                        };
                    };
                };
            };
        };
        readonly charge: {
            readonly enum: readonly ["absurd", "potential", "active", "stable"];
        };
        readonly glued: {
            readonly type: "boolean";
        };
        readonly complete: {
            readonly type: "boolean";
        };
        readonly ambiguity: {
            readonly type: "integer";
            readonly minimum: 0;
        };
        readonly obstructions: {
            readonly type: "array";
            readonly items: {
                readonly type: "object";
                readonly required: readonly ["kind", "label", "on", "value"];
                readonly additionalProperties: false;
                readonly properties: {
                    readonly kind: {
                        readonly enum: readonly ["conflict", "void"];
                    };
                    readonly label: {
                        readonly type: "string";
                    };
                    readonly on: {
                        readonly type: "string";
                    };
                    readonly value: {
                        readonly enum: readonly ["absurd", "potential", "active", "stable"];
                    };
                };
            };
        };
    };
};
export declare const parseForestReadingCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.parse-forest.reading";
    readonly charge: "potential" | "active" | "stable" | "absurd";
    readonly id: string;
    readonly span: {
        readonly text: string;
        readonly tier: "document" | "block" | "sentence" | "clause" | "word" | "quote" | "rule";
        readonly start: number | null;
        readonly end: number | null;
        readonly numeric?: boolean;
    };
    readonly parse: Record<string, unknown>;
    readonly glued: boolean;
    readonly complete: boolean;
    readonly ambiguity: number;
    readonly obstructions: readonly {
        readonly kind: "void" | "conflict";
        readonly value: "potential" | "active" | "stable" | "absurd";
        readonly on: string;
        readonly label: string;
    }[];
    readonly quotes?: readonly {
        readonly text: string;
        readonly tier: "document" | "block" | "sentence" | "clause" | "word" | "quote" | "rule";
        readonly start: number | null;
        readonly end: number | null;
        readonly numeric?: boolean;
    }[];
    readonly numericTokens?: readonly {
        readonly text: string;
        readonly tier: "document" | "block" | "sentence" | "clause" | "word" | "quote" | "rule";
        readonly start: number | null;
        readonly end: number | null;
        readonly numeric?: boolean;
    }[];
}>;
export declare const parseForestCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.parse-forest";
    readonly text: string;
    readonly charge: "potential" | "active" | "stable" | "absurd";
    readonly glued: boolean;
    readonly complete: boolean;
    readonly ambiguity: number;
    readonly obstructions: readonly {
        readonly kind: "void" | "conflict";
        readonly value: "potential" | "active" | "stable" | "absurd";
        readonly on: string;
        readonly label: string;
    }[];
    readonly readings: readonly {
        readonly kind: "communicating.parse-forest.reading";
        readonly charge: "potential" | "active" | "stable" | "absurd";
        readonly id: string;
        readonly span: {
            readonly text: string;
            readonly tier: "document" | "block" | "sentence" | "clause" | "word" | "quote" | "rule";
            readonly start: number | null;
            readonly end: number | null;
            readonly numeric?: boolean;
        };
        readonly parse: Record<string, unknown>;
        readonly glued: boolean;
        readonly complete: boolean;
        readonly ambiguity: number;
        readonly obstructions: readonly {
            readonly kind: "void" | "conflict";
            readonly value: "potential" | "active" | "stable" | "absurd";
            readonly on: string;
            readonly label: string;
        }[];
        readonly quotes?: readonly {
            readonly text: string;
            readonly tier: "document" | "block" | "sentence" | "clause" | "word" | "quote" | "rule";
            readonly start: number | null;
            readonly end: number | null;
            readonly numeric?: boolean;
        }[];
        readonly numericTokens?: readonly {
            readonly text: string;
            readonly tier: "document" | "block" | "sentence" | "clause" | "word" | "quote" | "rule";
            readonly start: number | null;
            readonly end: number | null;
            readonly numeric?: boolean;
        }[];
    }[];
}>;
export declare function parseForestFromArticulation(base: ArticulateResult, bundle: CompiledBundle): ParseForest;
export declare function parseForest(sentenceSpan: Span, base: ArticulateResult, bundle: CompiledBundle): ParseForest;
export declare function parseCommunicationForest(carrier: CommunicatingCarrier, bundle: CompiledBundle): ParseForest;
//# sourceMappingURL=forest.d.mts.map