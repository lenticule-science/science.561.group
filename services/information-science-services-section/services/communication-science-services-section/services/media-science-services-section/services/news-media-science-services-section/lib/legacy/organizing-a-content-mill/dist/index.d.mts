import { type FromSchema, type Tm } from "@emsenn/relating";
import { type ContentViewCounts, type ContentViewEvent, type MillItem, type MillMasthead } from "@emsenn/producing-content/content-mill";
export * from "@emsenn/producing-content/content-mill";
export declare const ContentMillPublicationSchema: {
    readonly $id: "organizing/content-mill/publication";
    readonly title: "ContentMillPublication";
    readonly type: "object";
    readonly required: readonly ["kind", "title", "siteUrl", "feedUrl", "itemPath", "language", "itemCount", "publicItemCount"];
    readonly properties: {
        readonly kind: {
            readonly const: "organizing.content-mill.publication";
        };
        readonly title: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly siteUrl: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly feedUrl: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly itemPath: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly language: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly itemCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly publicItemCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
    };
    readonly additionalProperties: false;
};
export type ContentMillPublication = FromSchema<typeof ContentMillPublicationSchema>;
export declare const contentMillPublicationCarrier: import("@emsenn/relating").DataCarrier<{
    readonly kind: "organizing.content-mill.publication";
    readonly title: string;
    readonly siteUrl: string;
    readonly feedUrl: string;
    readonly itemPath: string;
    readonly language: string;
    readonly itemCount: number;
    readonly publicItemCount: number;
}>;
export declare function contentMillPublication(input: Readonly<{
    masthead: MillMasthead;
    items: readonly MillItem[];
}>): ContentMillPublication;
export declare function contentMillPublicationTerm(input: ContentMillPublication): Tm;
export declare const ContentMillPublicationCandidateStatusSchema: {
    readonly anyOf: readonly [{
        readonly const: "ready-to-publish";
    }, {
        readonly const: "editorial-hold";
    }, {
        readonly const: "one-click-repair";
    }, {
        readonly const: "copy-edit-required";
    }];
};
export declare const ContentMillPublicationCandidateSchema: {
    readonly $id: "organizing/content-mill/publication-candidate";
    readonly title: "ContentMillPublicationCandidate";
    readonly type: "object";
    readonly required: readonly ["slug", "title", "status", "publicationDistance", "nextAction", "nextActionLabel", "nextActionHref", "standardsHref", "standardsJsonHref", "publicHref", "editorialHold", "sourceCycleWarnings", "wordCount", "missingWords", "referenceCount", "errorCount", "warningCount", "findingCodes", "note"];
    readonly properties: {
        readonly slug: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly title: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly status: {
            readonly anyOf: readonly [{
                readonly const: "ready-to-publish";
            }, {
                readonly const: "editorial-hold";
            }, {
                readonly const: "one-click-repair";
            }, {
                readonly const: "copy-edit-required";
            }];
        };
        readonly publicationDistance: {
            readonly minimum: 0;
            readonly type: "number";
        };
        readonly nextAction: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly nextActionLabel: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly nextActionHref: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly standardsHref: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly standardsJsonHref: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly publicHref: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly editorialHold: {
            readonly type: "boolean";
        };
        readonly sourceCycleRepairHref: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly sourceCycleRepairJsonHref: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly sourceCycleTaskCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly sourceCycleHighestPriority: {
            readonly minimum: 0;
            readonly type: "number";
        };
        readonly sourceCycleWarnings: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
            };
        };
        readonly wordCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly missingWords: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly referenceCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly errorCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly warningCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly findingCodes: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
            };
        };
        readonly note: {
            readonly type: "string";
        };
    };
    readonly additionalProperties: false;
};
export declare const ContentMillPublicationCandidatesReadingSchema: {
    readonly $id: "organizing/content-mill/publication-candidates";
    readonly title: "ContentMillPublicationCandidatesReading";
    readonly type: "object";
    readonly required: readonly ["kind", "generatedAt", "draftCount", "publishableDraftCount", "editorialHoldCount", "oneClickRepairCount", "copyEditRequiredCount", "candidates", "policy"];
    readonly properties: {
        readonly kind: {
            readonly const: "organizing.content-mill.publication-candidates";
        };
        readonly generatedAt: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly draftCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly publishableDraftCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly editorialHoldCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly oneClickRepairCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly copyEditRequiredCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly candidates: {
            readonly type: "array";
            readonly items: {
                readonly $id: "organizing/content-mill/publication-candidate";
                readonly title: "ContentMillPublicationCandidate";
                readonly type: "object";
                readonly required: readonly ["slug", "title", "status", "publicationDistance", "nextAction", "nextActionLabel", "nextActionHref", "standardsHref", "standardsJsonHref", "publicHref", "editorialHold", "sourceCycleWarnings", "wordCount", "missingWords", "referenceCount", "errorCount", "warningCount", "findingCodes", "note"];
                readonly properties: {
                    readonly slug: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly title: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly status: {
                        readonly anyOf: readonly [{
                            readonly const: "ready-to-publish";
                        }, {
                            readonly const: "editorial-hold";
                        }, {
                            readonly const: "one-click-repair";
                        }, {
                            readonly const: "copy-edit-required";
                        }];
                    };
                    readonly publicationDistance: {
                        readonly minimum: 0;
                        readonly type: "number";
                    };
                    readonly nextAction: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly nextActionLabel: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly nextActionHref: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly standardsHref: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly standardsJsonHref: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly publicHref: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly editorialHold: {
                        readonly type: "boolean";
                    };
                    readonly sourceCycleRepairHref: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly sourceCycleRepairJsonHref: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly sourceCycleTaskCount: {
                        readonly minimum: 0;
                        readonly type: "integer";
                    };
                    readonly sourceCycleHighestPriority: {
                        readonly minimum: 0;
                        readonly type: "number";
                    };
                    readonly sourceCycleWarnings: {
                        readonly type: "array";
                        readonly items: {
                            readonly type: "string";
                        };
                    };
                    readonly wordCount: {
                        readonly minimum: 0;
                        readonly type: "integer";
                    };
                    readonly missingWords: {
                        readonly minimum: 0;
                        readonly type: "integer";
                    };
                    readonly referenceCount: {
                        readonly minimum: 0;
                        readonly type: "integer";
                    };
                    readonly errorCount: {
                        readonly minimum: 0;
                        readonly type: "integer";
                    };
                    readonly warningCount: {
                        readonly minimum: 0;
                        readonly type: "integer";
                    };
                    readonly findingCodes: {
                        readonly type: "array";
                        readonly items: {
                            readonly type: "string";
                        };
                    };
                    readonly note: {
                        readonly type: "string";
                    };
                };
                readonly additionalProperties: false;
            };
        };
        readonly policy: {
            readonly type: "array";
            readonly items: {
                readonly minLength: 1;
                readonly type: "string";
            };
        };
    };
    readonly additionalProperties: false;
};
export type ContentMillPublicationCandidateStatus = FromSchema<typeof ContentMillPublicationCandidateStatusSchema>;
export type ContentMillPublicationCandidate = FromSchema<typeof ContentMillPublicationCandidateSchema>;
export type ContentMillPublicationCandidatesReading = FromSchema<typeof ContentMillPublicationCandidatesReadingSchema>;
export declare const contentMillPublicationCandidateCarrier: import("@emsenn/relating").DataCarrier<{
    readonly title: string;
    readonly slug: string;
    readonly status: "ready-to-publish" | "editorial-hold" | "one-click-repair" | "copy-edit-required";
    readonly publicationDistance: number;
    readonly nextAction: string;
    readonly nextActionLabel: string;
    readonly nextActionHref: string;
    readonly standardsHref: string;
    readonly standardsJsonHref: string;
    readonly publicHref: string;
    readonly editorialHold: boolean;
    readonly sourceCycleWarnings: readonly string[];
    readonly wordCount: number;
    readonly missingWords: number;
    readonly referenceCount: number;
    readonly errorCount: number;
    readonly warningCount: number;
    readonly findingCodes: readonly string[];
    readonly note: string;
    readonly sourceCycleRepairHref?: string;
    readonly sourceCycleRepairJsonHref?: string;
    readonly sourceCycleTaskCount?: number;
    readonly sourceCycleHighestPriority?: number;
}>;
export declare const contentMillPublicationCandidatesReadingCarrier: import("@emsenn/relating").DataCarrier<{
    readonly kind: "organizing.content-mill.publication-candidates";
    readonly generatedAt: string;
    readonly draftCount: number;
    readonly publishableDraftCount: number;
    readonly editorialHoldCount: number;
    readonly oneClickRepairCount: number;
    readonly copyEditRequiredCount: number;
    readonly candidates: readonly {
        readonly title: string;
        readonly slug: string;
        readonly status: "ready-to-publish" | "editorial-hold" | "one-click-repair" | "copy-edit-required";
        readonly publicationDistance: number;
        readonly nextAction: string;
        readonly nextActionLabel: string;
        readonly nextActionHref: string;
        readonly standardsHref: string;
        readonly standardsJsonHref: string;
        readonly publicHref: string;
        readonly editorialHold: boolean;
        readonly sourceCycleWarnings: readonly string[];
        readonly wordCount: number;
        readonly missingWords: number;
        readonly referenceCount: number;
        readonly errorCount: number;
        readonly warningCount: number;
        readonly findingCodes: readonly string[];
        readonly note: string;
        readonly sourceCycleRepairHref?: string;
        readonly sourceCycleRepairJsonHref?: string;
        readonly sourceCycleTaskCount?: number;
        readonly sourceCycleHighestPriority?: number;
    }[];
    readonly policy: readonly string[];
}>;
export type ContentMillPublicationCandidateInput = Omit<ContentMillPublicationCandidate, "sourceCycleWarnings" | "findingCodes"> & Readonly<{
    sourceCycleWarnings: readonly string[];
    findingCodes: readonly string[];
}>;
export declare function contentMillPublicationCandidate(input: ContentMillPublicationCandidateInput): ContentMillPublicationCandidate;
export declare function contentMillPublicationCandidatesReading(input: Omit<ContentMillPublicationCandidatesReading, "kind" | "candidates" | "policy"> & Readonly<{
    candidates: readonly ContentMillPublicationCandidateInput[];
    policy: readonly string[];
}>): ContentMillPublicationCandidatesReading;
export declare function contentMillPublicationCandidateTerm(input: ContentMillPublicationCandidate): Tm;
export declare function contentMillPublicationCandidatesReadingTerm(input: ContentMillPublicationCandidatesReading): Tm;
export declare const ContentMillRunGateSchema: {
    readonly $id: "organizing/content-mill/run/gate";
    readonly title: "ContentMillRunGate";
    readonly type: "object";
    readonly properties: {
        readonly gate: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly charge: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly evidence: {
            readonly minLength: 1;
            readonly type: "string";
        };
    };
    readonly additionalProperties: false;
};
export declare const ContentMillRunUsageSchema: {
    readonly $id: "organizing/content-mill/run/usage";
    readonly title: "ContentMillRunUsage";
    readonly type: "object";
    readonly properties: {
        readonly calls: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly tokens: {
            readonly minimum: 0;
            readonly type: "integer";
        };
    };
    readonly additionalProperties: false;
};
export declare const ContentMillRunStorySchema: {
    readonly $id: "organizing/content-mill/run/story";
    readonly title: "ContentMillRunStory";
    readonly type: "object";
    readonly properties: {
        readonly title: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly url: {
            readonly minLength: 1;
            readonly type: "string";
        };
    };
    readonly additionalProperties: false;
};
export declare const ContentMillRunRecordSchema: {
    readonly $id: "organizing/content-mill/run/record";
    readonly title: "ContentMillRunRecord";
    readonly type: "object";
    readonly properties: {
        readonly term: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly beat: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly slug: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly shipped: {
            readonly type: "boolean";
        };
        readonly gates: {
            readonly type: "array";
            readonly items: {
                readonly $id: "organizing/content-mill/run/gate";
                readonly title: "ContentMillRunGate";
                readonly type: "object";
                readonly properties: {
                    readonly gate: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly charge: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly evidence: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                };
                readonly additionalProperties: false;
            };
        };
        readonly usage: {
            readonly $id: "organizing/content-mill/run/usage";
            readonly title: "ContentMillRunUsage";
            readonly type: "object";
            readonly properties: {
                readonly calls: {
                    readonly minimum: 0;
                    readonly type: "integer";
                };
                readonly tokens: {
                    readonly minimum: 0;
                    readonly type: "integer";
                };
            };
            readonly additionalProperties: false;
        };
        readonly t: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly obstruction: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly evidence: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly story: {
            readonly $id: "organizing/content-mill/run/story";
            readonly title: "ContentMillRunStory";
            readonly type: "object";
            readonly properties: {
                readonly title: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly url: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
            };
            readonly additionalProperties: false;
        };
    };
    readonly additionalProperties: true;
};
export declare const ContentMillRunTraceReadingSchema: {
    readonly $id: "organizing/content-mill/run/trace-reading";
    readonly title: "ContentMillRunTraceReading";
    readonly type: "object";
    readonly required: readonly ["kind", "path", "runCount", "runs"];
    readonly properties: {
        readonly kind: {
            readonly const: "organizing.content-mill.run-trace";
        };
        readonly path: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly runCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly runs: {
            readonly type: "array";
            readonly items: {
                readonly $id: "organizing/content-mill/run/record";
                readonly title: "ContentMillRunRecord";
                readonly type: "object";
                readonly properties: {
                    readonly term: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly beat: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly slug: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly shipped: {
                        readonly type: "boolean";
                    };
                    readonly gates: {
                        readonly type: "array";
                        readonly items: {
                            readonly $id: "organizing/content-mill/run/gate";
                            readonly title: "ContentMillRunGate";
                            readonly type: "object";
                            readonly properties: {
                                readonly gate: {
                                    readonly minLength: 1;
                                    readonly type: "string";
                                };
                                readonly charge: {
                                    readonly minLength: 1;
                                    readonly type: "string";
                                };
                                readonly evidence: {
                                    readonly minLength: 1;
                                    readonly type: "string";
                                };
                            };
                            readonly additionalProperties: false;
                        };
                    };
                    readonly usage: {
                        readonly $id: "organizing/content-mill/run/usage";
                        readonly title: "ContentMillRunUsage";
                        readonly type: "object";
                        readonly properties: {
                            readonly calls: {
                                readonly minimum: 0;
                                readonly type: "integer";
                            };
                            readonly tokens: {
                                readonly minimum: 0;
                                readonly type: "integer";
                            };
                        };
                        readonly additionalProperties: false;
                    };
                    readonly t: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly obstruction: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly evidence: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly story: {
                        readonly $id: "organizing/content-mill/run/story";
                        readonly title: "ContentMillRunStory";
                        readonly type: "object";
                        readonly properties: {
                            readonly title: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly url: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                        };
                        readonly additionalProperties: false;
                    };
                };
                readonly additionalProperties: true;
            };
        };
    };
    readonly additionalProperties: false;
};
export type ContentMillRunGate = FromSchema<typeof ContentMillRunGateSchema>;
export type ContentMillRunUsage = FromSchema<typeof ContentMillRunUsageSchema>;
export type ContentMillRunStory = FromSchema<typeof ContentMillRunStorySchema>;
export type ContentMillRunRecord = FromSchema<typeof ContentMillRunRecordSchema>;
export type ContentMillRunTraceReading = FromSchema<typeof ContentMillRunTraceReadingSchema>;
export declare const contentMillRunRecordCarrier: import("@emsenn/relating").DataCarrier<{
    readonly term?: string;
    readonly beat?: string;
    readonly slug?: string;
    readonly shipped?: boolean;
    readonly gates?: readonly {
        readonly gate?: string;
        readonly charge?: string;
        readonly evidence?: string;
    }[];
    readonly usage?: {
        readonly calls?: number;
        readonly tokens?: number;
    };
    readonly t?: string;
    readonly obstruction?: string;
    readonly evidence?: string;
    readonly story?: {
        readonly title?: string;
        readonly url?: string;
    };
}>;
export declare const contentMillRunTraceReadingCarrier: import("@emsenn/relating").DataCarrier<{
    readonly kind: "organizing.content-mill.run-trace";
    readonly path: string;
    readonly runCount: number;
    readonly runs: readonly {
        readonly term?: string;
        readonly beat?: string;
        readonly slug?: string;
        readonly shipped?: boolean;
        readonly gates?: readonly {
            readonly gate?: string;
            readonly charge?: string;
            readonly evidence?: string;
        }[];
        readonly usage?: {
            readonly calls?: number;
            readonly tokens?: number;
        };
        readonly t?: string;
        readonly obstruction?: string;
        readonly evidence?: string;
        readonly story?: {
            readonly title?: string;
            readonly url?: string;
        };
    }[];
}>;
export declare function contentMillRunRecord(input: Readonly<Record<string, unknown>>): ContentMillRunRecord;
export declare function contentMillRunTraceReading(input: Readonly<{
    path: string;
    runs: readonly Readonly<Record<string, unknown>>[];
}>): ContentMillRunTraceReading;
export declare function replayContentMillRuns(path: string): readonly ContentMillRunRecord[];
export declare function contentMillRunTraceReadingTerm(input: ContentMillRunTraceReading): Tm;
export declare const ContentMillViewTraceReadingSchema: {
    readonly $id: "organizing/content-mill/view-trace-reading";
    readonly title: "ContentMillViewTraceReading";
    readonly type: "object";
    readonly required: readonly ["kind", "path", "eventCount", "counts"];
    readonly properties: {
        readonly kind: {
            readonly const: "organizing.content-mill.view-trace";
        };
        readonly path: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly eventCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly counts: {
            readonly $id: "producing-content/content-mill/content-view-counts";
            readonly title: "ContentViewCounts";
            readonly additionalProperties: false;
            readonly type: "object";
            readonly required: readonly ["kind", "total", "byPath", "byReferrer", "byDay", "constraints"];
            readonly properties: {
                readonly kind: {
                    readonly const: "producing-content.content-view-counts";
                };
                readonly total: {
                    readonly minimum: 0;
                    readonly type: "integer";
                };
                readonly byPath: {
                    readonly type: "object";
                    readonly additionalProperties: {
                        readonly minimum: 0;
                        readonly type: "integer";
                    };
                };
                readonly byReferrer: {
                    readonly type: "object";
                    readonly additionalProperties: {
                        readonly minimum: 0;
                        readonly type: "integer";
                    };
                };
                readonly byDay: {
                    readonly type: "object";
                    readonly additionalProperties: {
                        readonly minimum: 0;
                        readonly type: "integer";
                    };
                };
                readonly constraints: {
                    readonly type: "array";
                    readonly items: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                };
            };
        };
    };
    readonly additionalProperties: false;
};
export type ContentMillViewTraceReading = FromSchema<typeof ContentMillViewTraceReadingSchema>;
export declare const contentMillViewTraceReadingCarrier: import("@emsenn/relating").DataCarrier<{
    readonly kind: "organizing.content-mill.view-trace";
    readonly path: string;
    readonly eventCount: number;
    readonly counts: {
        readonly kind: "producing-content.content-view-counts";
        readonly constraints: readonly string[];
        readonly total: number;
        readonly byPath: Record<string, unknown>;
        readonly byReferrer: Record<string, unknown>;
        readonly byDay: Record<string, unknown>;
    };
}>;
export declare function replayContentViewEvents(path: string): readonly ContentViewEvent[];
export declare function appendContentViewEvent(path: string, event: ContentViewEvent): void;
export declare function contentMillViewTraceReading(input: Readonly<{
    path: string;
    events: readonly ContentViewEvent[];
}>): ContentMillViewTraceReading;
export declare function readContentMillViewTrace(path: string): ContentMillViewTraceReading;
export declare function contentMillViewTraceReadingTerm(input: ContentMillViewTraceReading): Tm;
export declare class ContentMillViewTrace {
    readonly path: string;
    constructor(path: string);
    append(view: ContentViewEvent): void;
    replay(): readonly ContentViewEvent[];
    counts(): ContentViewCounts;
    reading(): ContentMillViewTraceReading;
}
//# sourceMappingURL=index.d.mts.map