import { type FromSchema, type Tm } from "@emsenn/relating";
import { type Catalog, type KnowledgeVaultRigging, type KnowledgeVaultRoot } from "@emsenn/organizing-a-knowledge-vault";
import { type ContentFarmConfig, type CreateDraftManuscriptInput, type FarmCycle, type FarmProperty, type FarmCycleReading, type FrontMatterDocument, type NewsClaimSet, type SourceCycleCandidateDraftInternalLinkGuidance, type SourceCycleCandidateReferenceNormalization, type SourceCycleCandidateWriteCollision } from "@emsenn/producing-content/content-farm";
import type { IngestResult, SourceRollReading } from "@emsenn/organizing-a-newscable";
export * from "@emsenn/producing-content/content-farm";
export { catalogCorpus, corpusBoundary, knowledgeVaultNewscableRig, knowledgeVaultRigging, organizeCorpus, type Catalog, type CatalogCorpusOptions, type CorpusDocument, type CorpusNode, type Frontier, type OrganizeCorpusOptions, type Organization, type Resource, type KnowledgeVaultRigging, type SocialBoundary, } from "@emsenn/organizing-a-knowledge-vault";
export { sourceRollReading, sourceRollTerm, type SourceRollReading, type SourceRollSource, type SourceRollWire, } from "@emsenn/organizing-a-newscable";
export declare const ContentFarmCorpusSchema: {
    readonly $id: "organizing/content-farm/corpus";
    readonly title: "ContentFarmCorpus";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["kind", "property", "contentDir", "dataDir", "corpusPath", "catalogTotal", "newscableConfigPath", "wireCount", "sourceCount", "seedCount"];
    readonly properties: {
        readonly kind: {
            readonly const: "organizing.content-farm.corpus";
        };
        readonly property: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly contentDir: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly dataDir: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly corpusPath: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly catalogTotal: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly newscableConfigPath: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly wireCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly sourceCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly seedCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
    };
};
export type ContentFarmCorpus = FromSchema<typeof ContentFarmCorpusSchema>;
export declare const contentFarmCorpusCarrier: import("@emsenn/relating").DataCarrier<{
    readonly kind: "organizing.content-farm.corpus";
    readonly property: string;
    readonly contentDir: string;
    readonly dataDir: string;
    readonly corpusPath: string;
    readonly catalogTotal: number;
    readonly newscableConfigPath: string;
    readonly wireCount: number;
    readonly sourceCount: number;
    readonly seedCount: number;
}>;
export declare function contentFarmCorpus(input: Readonly<{
    property: FarmProperty;
    corpus: Catalog;
    newscable: SourceRollReading;
}>): ContentFarmCorpus;
export declare function contentFarmCorpusTerm(input: ContentFarmCorpus): Tm;
export declare const CorpusRootPathSchema: {
    readonly $id: "organizing/content-farm/corpus/root-path";
    readonly title: "CorpusRootPath";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["path", "description", "present"];
    readonly properties: {
        readonly path: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly description: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly present: {
            readonly type: "boolean";
        };
    };
};
export declare const ContentFarmCorpusRootSchema: {
    readonly $id: "organizing/content-farm/corpus-root";
    readonly title: "ContentFarmCorpusRoot";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["kind", "property", "root", "expectedPaths", "stablePrefixes", "observedPrefixes", "missingPaths", "allowedPrefixes", "farmCorpus", "rigging"];
    readonly properties: {
        readonly kind: {
            readonly const: "organizing.content-farm.corpus-root";
        };
        readonly property: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly root: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly expectedPaths: {
            readonly type: "array";
            readonly items: {
                readonly $id: "organizing/content-farm/corpus/root-path";
                readonly title: "CorpusRootPath";
                readonly additionalProperties: false;
                readonly type: "object";
                readonly required: readonly ["path", "description", "present"];
                readonly properties: {
                    readonly path: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly description: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly present: {
                        readonly type: "boolean";
                    };
                };
            };
        };
        readonly stablePrefixes: {
            readonly type: "array";
            readonly items: {
                readonly minLength: 1;
                readonly type: "string";
            };
        };
        readonly observedPrefixes: {
            readonly type: "array";
            readonly items: {
                readonly minLength: 1;
                readonly type: "string";
            };
        };
        readonly missingPaths: {
            readonly type: "array";
            readonly items: {
                readonly minLength: 1;
                readonly type: "string";
            };
        };
        readonly allowedPrefixes: {
            readonly type: "array";
            readonly items: {
                readonly minLength: 1;
                readonly type: "string";
            };
        };
        readonly farmCorpus: {
            readonly $id: "organizing/content-farm/corpus";
            readonly title: "ContentFarmCorpus";
            readonly additionalProperties: false;
            readonly type: "object";
            readonly required: readonly ["kind", "property", "contentDir", "dataDir", "corpusPath", "catalogTotal", "newscableConfigPath", "wireCount", "sourceCount", "seedCount"];
            readonly properties: {
                readonly kind: {
                    readonly const: "organizing.content-farm.corpus";
                };
                readonly property: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly contentDir: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly dataDir: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly corpusPath: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly catalogTotal: {
                    readonly minimum: 0;
                    readonly type: "integer";
                };
                readonly newscableConfigPath: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly wireCount: {
                    readonly minimum: 0;
                    readonly type: "integer";
                };
                readonly sourceCount: {
                    readonly minimum: 0;
                    readonly type: "integer";
                };
                readonly seedCount: {
                    readonly minimum: 0;
                    readonly type: "integer";
                };
            };
        };
        readonly rigging: {
            readonly title: "KnowledgeVaultRiggingValue";
            readonly additionalProperties: false;
            readonly type: "object";
            readonly required: readonly ["kind", "root", "rigCount", "rigs"];
            readonly properties: {
                readonly kind: {
                    readonly const: "organizing.knowledge-vault.corpus.rigging";
                };
                readonly root: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly rigCount: {
                    readonly minimum: 0;
                    readonly type: "integer";
                };
                readonly rigs: {
                    readonly type: "array";
                    readonly items: {
                        readonly title: "KnowledgeVaultRigValue";
                        readonly additionalProperties: false;
                        readonly type: "object";
                        readonly required: readonly ["kind", "inputKind", "name", "mount"];
                        readonly properties: {
                            readonly kind: {
                                readonly const: "organizing.knowledge-vault.corpus.rig";
                            };
                            readonly inputKind: {
                                readonly anyOf: readonly [{
                                    readonly const: "newswire";
                                }, {
                                    readonly const: "newscable";
                                }];
                            };
                            readonly name: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly mount: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly configPath: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly href: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly wireCount: {
                                readonly minimum: 0;
                                readonly type: "integer";
                            };
                            readonly sourceCount: {
                                readonly minimum: 0;
                                readonly type: "integer";
                            };
                        };
                    };
                };
            };
        };
    };
};
export type CorpusRootPath = FromSchema<typeof CorpusRootPathSchema>;
export type ContentFarmCorpusRoot = FromSchema<typeof ContentFarmCorpusRootSchema>;
export declare const contentFarmCorpusRootCarrier: import("@emsenn/relating").DataCarrier<{
    readonly kind: "organizing.content-farm.corpus-root";
    readonly property: string;
    readonly root: string;
    readonly expectedPaths: readonly {
        readonly path: string;
        readonly description: string;
        readonly present: boolean;
    }[];
    readonly stablePrefixes: readonly string[];
    readonly observedPrefixes: readonly string[];
    readonly missingPaths: readonly string[];
    readonly allowedPrefixes: readonly string[];
    readonly farmCorpus: {
        readonly kind: "organizing.content-farm.corpus";
        readonly property: string;
        readonly contentDir: string;
        readonly dataDir: string;
        readonly corpusPath: string;
        readonly catalogTotal: number;
        readonly newscableConfigPath: string;
        readonly wireCount: number;
        readonly sourceCount: number;
        readonly seedCount: number;
    };
    readonly rigging: {
        readonly kind: "organizing.knowledge-vault.corpus.rigging";
        readonly root: string;
        readonly rigCount: number;
        readonly rigs: readonly {
            readonly kind: "organizing.knowledge-vault.corpus.rig";
            readonly name: string;
            readonly inputKind: "newscable" | "newswire";
            readonly mount: string;
            readonly wireCount?: number;
            readonly sourceCount?: number;
            readonly configPath?: string;
            readonly href?: string;
        }[];
    };
}>;
export declare function contentFarmCorpusRoot(input: Readonly<{
    property: FarmProperty;
    root: KnowledgeVaultRoot;
    rigging: KnowledgeVaultRigging;
    farmCorpus: ContentFarmCorpus;
}>): ContentFarmCorpusRoot;
export declare function contentFarmCorpusRootTerm(input: ContentFarmCorpusRoot): Tm;
export declare const ContentFarmTaxonomyKindSchema: {
    readonly anyOf: readonly [{
        readonly const: "section";
    }, {
        readonly const: "tag";
    }];
};
export declare const ContentFarmTaxonomyReadingSchema: {
    readonly $id: "organizing/content-farm/taxonomy/reading";
    readonly title: "ContentFarmTaxonomyReading";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["kind", "taxonomy", "slug", "title", "description", "editorialFrame", "relatedBeats", "seedTerms", "count", "url"];
    readonly properties: {
        readonly kind: {
            readonly const: "organizing.content-farm.taxonomy";
        };
        readonly taxonomy: {
            readonly anyOf: readonly [{
                readonly const: "section";
            }, {
                readonly const: "tag";
            }];
        };
        readonly slug: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly title: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly description: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly editorialFrame: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly beat: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly relatedBeats: {
            readonly type: "array";
            readonly items: {
                readonly minLength: 1;
                readonly type: "string";
            };
        };
        readonly seedTerms: {
            readonly type: "array";
            readonly items: {
                readonly minLength: 1;
                readonly type: "string";
            };
        };
        readonly count: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly latestPublished: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly url: {
            readonly minLength: 1;
            readonly type: "string";
        };
    };
};
export type ContentFarmTaxonomyKind = FromSchema<typeof ContentFarmTaxonomyKindSchema>;
export type ContentFarmTaxonomyReading = FromSchema<typeof ContentFarmTaxonomyReadingSchema>;
export declare const contentFarmTaxonomyReadingCarrier: import("@emsenn/relating").DataCarrier<{
    readonly kind: "organizing.content-farm.taxonomy";
    readonly description: string;
    readonly taxonomy: "section" | "tag";
    readonly slug: string;
    readonly title: string;
    readonly editorialFrame: string;
    readonly relatedBeats: readonly string[];
    readonly seedTerms: readonly string[];
    readonly count: number;
    readonly url: string;
    readonly beat?: string;
    readonly latestPublished?: string;
}>;
export declare function contentFarmTaxonomyReading(input: Omit<ContentFarmTaxonomyReading, "kind">): ContentFarmTaxonomyReading;
export declare function contentFarmTaxonomyReadingTerm(input: ContentFarmTaxonomyReading): Tm;
export type IrrigatedContentFarmOptions = Readonly<{
    property: FarmProperty;
    newscableConfigPath: string;
    corpusRoot?: string;
    corpusPath?: string;
    now?: () => string;
}>;
export declare function irrigatedContentFarmCorpus(options: IrrigatedContentFarmOptions): ContentFarmCorpus;
export declare function irrigatedContentFarmCorpusRoot(options: IrrigatedContentFarmOptions): ContentFarmCorpusRoot;
export declare const ContentFarmSourceCycleWirePlanSchema: {
    readonly $id: "organizing/content-farm/source-cycle/wire-plan";
    readonly title: "ContentFarmSourceCycleWirePlan";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["name", "sourceCount", "sources"];
    readonly properties: {
        readonly name: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly sourceCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly sources: {
            readonly type: "array";
            readonly items: {
                readonly minLength: 1;
                readonly type: "string";
            };
        };
    };
};
export declare const ContentFarmSourceCycleCablePlanSchema: {
    readonly $id: "organizing/content-farm/source-cycle/cable-plan";
    readonly title: "ContentFarmSourceCycleCablePlan";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["title", "domain", "port", "wireCount", "sourceCount", "wires"];
    readonly properties: {
        readonly title: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly domain: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly port: {
            readonly anyOf: readonly [{
                readonly minimum: 0;
                readonly type: "integer";
            }, {
                readonly type: "null";
            }];
        };
        readonly wireCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly sourceCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly wires: {
            readonly type: "array";
            readonly items: {
                readonly $id: "organizing/content-farm/source-cycle/wire-plan";
                readonly title: "ContentFarmSourceCycleWirePlan";
                readonly additionalProperties: false;
                readonly type: "object";
                readonly required: readonly ["name", "sourceCount", "sources"];
                readonly properties: {
                    readonly name: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly sourceCount: {
                        readonly minimum: 0;
                        readonly type: "integer";
                    };
                    readonly sources: {
                        readonly type: "array";
                        readonly items: {
                            readonly minLength: 1;
                            readonly type: "string";
                        };
                    };
                };
            };
        };
    };
};
export declare const ContentFarmSourceCyclePropertyPlanSchema: {
    readonly $id: "organizing/content-farm/source-cycle/property-plan";
    readonly title: "ContentFarmSourceCyclePropertyPlan";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["name", "contentDir", "dataDir", "beatCount", "beats", "seedCount"];
    readonly properties: {
        readonly name: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly contentDir: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly dataDir: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly beatCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly beats: {
            readonly type: "array";
            readonly items: {
                readonly minLength: 1;
                readonly type: "string";
            };
        };
        readonly seedCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
    };
};
export declare const ContentFarmSourceCycleFarmPlanSchema: {
    readonly $id: "organizing/content-farm/source-cycle/farm-plan";
    readonly title: "ContentFarmSourceCycleFarmPlan";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["name", "port", "propertyCount", "properties"];
    readonly properties: {
        readonly name: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly port: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly propertyCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly properties: {
            readonly type: "array";
            readonly items: {
                readonly $id: "organizing/content-farm/source-cycle/property-plan";
                readonly title: "ContentFarmSourceCyclePropertyPlan";
                readonly additionalProperties: false;
                readonly type: "object";
                readonly required: readonly ["name", "contentDir", "dataDir", "beatCount", "beats", "seedCount"];
                readonly properties: {
                    readonly name: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly contentDir: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly dataDir: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly beatCount: {
                        readonly minimum: 0;
                        readonly type: "integer";
                    };
                    readonly beats: {
                        readonly type: "array";
                        readonly items: {
                            readonly minLength: 1;
                            readonly type: "string";
                        };
                    };
                    readonly seedCount: {
                        readonly minimum: 0;
                        readonly type: "integer";
                    };
                };
            };
        };
    };
};
export declare const ContentFarmSourceCycleOperatorPlanSchema: {
    readonly $id: "organizing/content-farm/source-cycle/operator-plan";
    readonly title: "ContentFarmSourceCycleOperatorPlan";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["planUrl", "runUrl", "publicationGate"];
    readonly properties: {
        readonly planUrl: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly runUrl: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly publicationGate: {
            readonly minLength: 1;
            readonly type: "string";
        };
    };
};
export declare const ContentFarmSourceCyclePlanSchema: {
    readonly $id: "organizing/content-farm/source-cycle/plan";
    readonly title: "ContentFarmSourceCyclePlan";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["kind", "configPath", "cable", "farm", "operator"];
    readonly properties: {
        readonly kind: {
            readonly const: "organizing.content-farm.source-cycle.plan";
        };
        readonly configPath: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly cable: {
            readonly $id: "organizing/content-farm/source-cycle/cable-plan";
            readonly title: "ContentFarmSourceCycleCablePlan";
            readonly additionalProperties: false;
            readonly type: "object";
            readonly required: readonly ["title", "domain", "port", "wireCount", "sourceCount", "wires"];
            readonly properties: {
                readonly title: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly domain: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly port: {
                    readonly anyOf: readonly [{
                        readonly minimum: 0;
                        readonly type: "integer";
                    }, {
                        readonly type: "null";
                    }];
                };
                readonly wireCount: {
                    readonly minimum: 0;
                    readonly type: "integer";
                };
                readonly sourceCount: {
                    readonly minimum: 0;
                    readonly type: "integer";
                };
                readonly wires: {
                    readonly type: "array";
                    readonly items: {
                        readonly $id: "organizing/content-farm/source-cycle/wire-plan";
                        readonly title: "ContentFarmSourceCycleWirePlan";
                        readonly additionalProperties: false;
                        readonly type: "object";
                        readonly required: readonly ["name", "sourceCount", "sources"];
                        readonly properties: {
                            readonly name: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly sourceCount: {
                                readonly minimum: 0;
                                readonly type: "integer";
                            };
                            readonly sources: {
                                readonly type: "array";
                                readonly items: {
                                    readonly minLength: 1;
                                    readonly type: "string";
                                };
                            };
                        };
                    };
                };
            };
        };
        readonly farm: {
            readonly $id: "organizing/content-farm/source-cycle/farm-plan";
            readonly title: "ContentFarmSourceCycleFarmPlan";
            readonly additionalProperties: false;
            readonly type: "object";
            readonly required: readonly ["name", "port", "propertyCount", "properties"];
            readonly properties: {
                readonly name: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly port: {
                    readonly minimum: 0;
                    readonly type: "integer";
                };
                readonly propertyCount: {
                    readonly minimum: 0;
                    readonly type: "integer";
                };
                readonly properties: {
                    readonly type: "array";
                    readonly items: {
                        readonly $id: "organizing/content-farm/source-cycle/property-plan";
                        readonly title: "ContentFarmSourceCyclePropertyPlan";
                        readonly additionalProperties: false;
                        readonly type: "object";
                        readonly required: readonly ["name", "contentDir", "dataDir", "beatCount", "beats", "seedCount"];
                        readonly properties: {
                            readonly name: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly contentDir: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly dataDir: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly beatCount: {
                                readonly minimum: 0;
                                readonly type: "integer";
                            };
                            readonly beats: {
                                readonly type: "array";
                                readonly items: {
                                    readonly minLength: 1;
                                    readonly type: "string";
                                };
                            };
                            readonly seedCount: {
                                readonly minimum: 0;
                                readonly type: "integer";
                            };
                        };
                    };
                };
            };
        };
        readonly operator: {
            readonly $id: "organizing/content-farm/source-cycle/operator-plan";
            readonly title: "ContentFarmSourceCycleOperatorPlan";
            readonly additionalProperties: false;
            readonly type: "object";
            readonly required: readonly ["planUrl", "runUrl", "publicationGate"];
            readonly properties: {
                readonly planUrl: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly runUrl: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly publicationGate: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
            };
        };
    };
};
export type ContentFarmSourceCycleWirePlan = FromSchema<typeof ContentFarmSourceCycleWirePlanSchema>;
export type ContentFarmSourceCycleCablePlan = FromSchema<typeof ContentFarmSourceCycleCablePlanSchema>;
export type ContentFarmSourceCyclePropertyPlan = FromSchema<typeof ContentFarmSourceCyclePropertyPlanSchema>;
export type ContentFarmSourceCycleFarmPlan = FromSchema<typeof ContentFarmSourceCycleFarmPlanSchema>;
export type ContentFarmSourceCycleOperatorPlan = FromSchema<typeof ContentFarmSourceCycleOperatorPlanSchema>;
export type ContentFarmSourceCyclePlan = FromSchema<typeof ContentFarmSourceCyclePlanSchema>;
export declare function readContentFarmConfigDocument(configPath: string): unknown;
export declare function readContentFarmConfig(configPath: string): ContentFarmConfig;
export declare function readContentFarmProperty(configPath: string, index?: number): FarmProperty;
export declare const contentFarmSourceCyclePlanCarrier: import("@emsenn/relating").DataCarrier<{
    readonly kind: "organizing.content-farm.source-cycle.plan";
    readonly configPath: string;
    readonly cable: {
        readonly wireCount: number;
        readonly sourceCount: number;
        readonly wires: readonly {
            readonly sourceCount: number;
            readonly name: string;
            readonly sources: readonly string[];
        }[];
        readonly title: string;
        readonly domain: string;
        readonly port: number | null;
    };
    readonly farm: {
        readonly name: string;
        readonly port: number;
        readonly propertyCount: number;
        readonly properties: readonly {
            readonly contentDir: string;
            readonly dataDir: string;
            readonly seedCount: number;
            readonly name: string;
            readonly beatCount: number;
            readonly beats: readonly string[];
        }[];
    };
    readonly operator: {
        readonly planUrl: string;
        readonly runUrl: string;
        readonly publicationGate: string;
    };
}>;
export declare function contentFarmSourceCyclePlan(input: Omit<ContentFarmSourceCyclePlan, "kind">): ContentFarmSourceCyclePlan;
export declare function contentFarmSourceCycleWirePlans(document: unknown): readonly ContentFarmSourceCycleWirePlan[];
export declare function contentFarmSourceCycleCablePlanFromDocument(document: unknown): ContentFarmSourceCycleCablePlan;
export declare function contentFarmSourceCycleFarmPlanFromConfig(config: ContentFarmConfig): ContentFarmSourceCycleFarmPlan;
export declare function contentFarmSourceCyclePlanFromDocument(input: Readonly<{
    configPath: string;
    document: unknown;
    operator: ContentFarmSourceCycleOperatorPlan;
}>): ContentFarmSourceCyclePlan;
export declare function contentFarmSourceCyclePlanTerm(input: ContentFarmSourceCyclePlan): Tm;
export declare const ContentFarmSourceCycleIngestResultSchema: {
    readonly $id: "organizing/content-farm/source-cycle/ingest-result";
    readonly title: "ContentFarmSourceCycleIngestResult";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["wire", "storeDir", "written", "skipped", "errors"];
    readonly properties: {
        readonly wire: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly storeDir: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly written: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly skipped: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly errors: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
            };
        };
    };
};
export declare const ContentFarmSourceCycleCableReadingSchema: {
    readonly $id: "organizing/content-farm/source-cycle/cable-reading";
    readonly title: "ContentFarmSourceCycleCableReading";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["wireCount", "written", "skipped", "errorCount", "results", "skippedMessages"];
    readonly properties: {
        readonly wireCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly written: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly skipped: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly errorCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly results: {
            readonly type: "array";
            readonly items: {
                readonly $id: "organizing/content-farm/source-cycle/ingest-result";
                readonly title: "ContentFarmSourceCycleIngestResult";
                readonly additionalProperties: false;
                readonly type: "object";
                readonly required: readonly ["wire", "storeDir", "written", "skipped", "errors"];
                readonly properties: {
                    readonly wire: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly storeDir: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly written: {
                        readonly minimum: 0;
                        readonly type: "integer";
                    };
                    readonly skipped: {
                        readonly minimum: 0;
                        readonly type: "integer";
                    };
                    readonly errors: {
                        readonly type: "array";
                        readonly items: {
                            readonly type: "string";
                        };
                    };
                };
            };
        };
        readonly skippedMessages: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
            };
        };
    };
};
export declare const ContentFarmSourceCycleEditorialPolicySchema: {
    readonly $id: "organizing/content-farm/source-cycle/editorial-policy";
    readonly title: "ContentFarmSourceCycleEditorialPolicy";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["record", "publication", "note"];
    readonly properties: {
        readonly record: {
            readonly const: "draft-candidate";
        };
        readonly publication: {
            readonly const: "manual-standards-gate";
        };
        readonly note: {
            readonly minLength: 1;
            readonly type: "string";
        };
    };
};
export declare const ContentFarmSourceCycleReadingSchema: {
    readonly $id: "organizing/content-farm/source-cycle/reading";
    readonly title: "ContentFarmSourceCycleReading";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["kind", "generatedAt", "plan", "cable", "farm", "candidateWriteCollisions", "candidateReferences", "candidateDraftInternalLinkGuidance", "editorialPolicy"];
    readonly properties: {
        readonly kind: {
            readonly const: "organizing.content-farm.source-cycle";
        };
        readonly generatedAt: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly plan: {
            readonly $id: "organizing/content-farm/source-cycle/plan";
            readonly title: "ContentFarmSourceCyclePlan";
            readonly additionalProperties: false;
            readonly type: "object";
            readonly required: readonly ["kind", "configPath", "cable", "farm", "operator"];
            readonly properties: {
                readonly kind: {
                    readonly const: "organizing.content-farm.source-cycle.plan";
                };
                readonly configPath: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly cable: {
                    readonly $id: "organizing/content-farm/source-cycle/cable-plan";
                    readonly title: "ContentFarmSourceCycleCablePlan";
                    readonly additionalProperties: false;
                    readonly type: "object";
                    readonly required: readonly ["title", "domain", "port", "wireCount", "sourceCount", "wires"];
                    readonly properties: {
                        readonly title: {
                            readonly minLength: 1;
                            readonly type: "string";
                        };
                        readonly domain: {
                            readonly minLength: 1;
                            readonly type: "string";
                        };
                        readonly port: {
                            readonly anyOf: readonly [{
                                readonly minimum: 0;
                                readonly type: "integer";
                            }, {
                                readonly type: "null";
                            }];
                        };
                        readonly wireCount: {
                            readonly minimum: 0;
                            readonly type: "integer";
                        };
                        readonly sourceCount: {
                            readonly minimum: 0;
                            readonly type: "integer";
                        };
                        readonly wires: {
                            readonly type: "array";
                            readonly items: {
                                readonly $id: "organizing/content-farm/source-cycle/wire-plan";
                                readonly title: "ContentFarmSourceCycleWirePlan";
                                readonly additionalProperties: false;
                                readonly type: "object";
                                readonly required: readonly ["name", "sourceCount", "sources"];
                                readonly properties: {
                                    readonly name: {
                                        readonly minLength: 1;
                                        readonly type: "string";
                                    };
                                    readonly sourceCount: {
                                        readonly minimum: 0;
                                        readonly type: "integer";
                                    };
                                    readonly sources: {
                                        readonly type: "array";
                                        readonly items: {
                                            readonly minLength: 1;
                                            readonly type: "string";
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
                readonly farm: {
                    readonly $id: "organizing/content-farm/source-cycle/farm-plan";
                    readonly title: "ContentFarmSourceCycleFarmPlan";
                    readonly additionalProperties: false;
                    readonly type: "object";
                    readonly required: readonly ["name", "port", "propertyCount", "properties"];
                    readonly properties: {
                        readonly name: {
                            readonly minLength: 1;
                            readonly type: "string";
                        };
                        readonly port: {
                            readonly minimum: 0;
                            readonly type: "integer";
                        };
                        readonly propertyCount: {
                            readonly minimum: 0;
                            readonly type: "integer";
                        };
                        readonly properties: {
                            readonly type: "array";
                            readonly items: {
                                readonly $id: "organizing/content-farm/source-cycle/property-plan";
                                readonly title: "ContentFarmSourceCyclePropertyPlan";
                                readonly additionalProperties: false;
                                readonly type: "object";
                                readonly required: readonly ["name", "contentDir", "dataDir", "beatCount", "beats", "seedCount"];
                                readonly properties: {
                                    readonly name: {
                                        readonly minLength: 1;
                                        readonly type: "string";
                                    };
                                    readonly contentDir: {
                                        readonly minLength: 1;
                                        readonly type: "string";
                                    };
                                    readonly dataDir: {
                                        readonly minLength: 1;
                                        readonly type: "string";
                                    };
                                    readonly beatCount: {
                                        readonly minimum: 0;
                                        readonly type: "integer";
                                    };
                                    readonly beats: {
                                        readonly type: "array";
                                        readonly items: {
                                            readonly minLength: 1;
                                            readonly type: "string";
                                        };
                                    };
                                    readonly seedCount: {
                                        readonly minimum: 0;
                                        readonly type: "integer";
                                    };
                                };
                            };
                        };
                    };
                };
                readonly operator: {
                    readonly $id: "organizing/content-farm/source-cycle/operator-plan";
                    readonly title: "ContentFarmSourceCycleOperatorPlan";
                    readonly additionalProperties: false;
                    readonly type: "object";
                    readonly required: readonly ["planUrl", "runUrl", "publicationGate"];
                    readonly properties: {
                        readonly planUrl: {
                            readonly minLength: 1;
                            readonly type: "string";
                        };
                        readonly runUrl: {
                            readonly minLength: 1;
                            readonly type: "string";
                        };
                        readonly publicationGate: {
                            readonly minLength: 1;
                            readonly type: "string";
                        };
                    };
                };
            };
        };
        readonly cable: {
            readonly $id: "organizing/content-farm/source-cycle/cable-reading";
            readonly title: "ContentFarmSourceCycleCableReading";
            readonly additionalProperties: false;
            readonly type: "object";
            readonly required: readonly ["wireCount", "written", "skipped", "errorCount", "results", "skippedMessages"];
            readonly properties: {
                readonly wireCount: {
                    readonly minimum: 0;
                    readonly type: "integer";
                };
                readonly written: {
                    readonly minimum: 0;
                    readonly type: "integer";
                };
                readonly skipped: {
                    readonly minimum: 0;
                    readonly type: "integer";
                };
                readonly errorCount: {
                    readonly minimum: 0;
                    readonly type: "integer";
                };
                readonly results: {
                    readonly type: "array";
                    readonly items: {
                        readonly $id: "organizing/content-farm/source-cycle/ingest-result";
                        readonly title: "ContentFarmSourceCycleIngestResult";
                        readonly additionalProperties: false;
                        readonly type: "object";
                        readonly required: readonly ["wire", "storeDir", "written", "skipped", "errors"];
                        readonly properties: {
                            readonly wire: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly storeDir: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly written: {
                                readonly minimum: 0;
                                readonly type: "integer";
                            };
                            readonly skipped: {
                                readonly minimum: 0;
                                readonly type: "integer";
                            };
                            readonly errors: {
                                readonly type: "array";
                                readonly items: {
                                    readonly type: "string";
                                };
                            };
                        };
                    };
                };
                readonly skippedMessages: {
                    readonly type: "array";
                    readonly items: {
                        readonly type: "string";
                    };
                };
            };
        };
        readonly farm: {};
        readonly candidateWriteCollisions: {
            readonly type: "array";
            readonly items: {
                readonly $id: "producing-content/content-farm/source-cycle/candidate-write-collision";
                readonly title: "SourceCycleCandidateWriteCollision";
                readonly additionalProperties: false;
                readonly type: "object";
                readonly required: readonly ["kind", "slug", "path", "existingDraft", "restored", "instruction"];
                readonly properties: {
                    readonly kind: {
                        readonly const: "producing-content.source-cycle.candidate-write-collision";
                    };
                    readonly slug: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly path: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly existingDraft: {
                        readonly type: "boolean";
                    };
                    readonly existingTitle: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly runTitle: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly restored: {
                        readonly type: "boolean";
                    };
                    readonly instruction: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                };
            };
        };
        readonly candidateReferences: {
            readonly type: "array";
            readonly items: {
                readonly $id: "producing-content/content-farm/source-cycle/references";
                readonly title: "SourceCycleCandidateReferenceNormalization";
                readonly additionalProperties: false;
                readonly type: "object";
                readonly required: readonly ["kind", "slug", "path", "changed", "sourceUrlCount", "referenceCount"];
                readonly properties: {
                    readonly kind: {
                        readonly const: "producing-content.source-cycle.references";
                    };
                    readonly slug: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly path: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly changed: {
                        readonly type: "boolean";
                    };
                    readonly sourceUrlCount: {
                        readonly minimum: 0;
                        readonly type: "number";
                    };
                    readonly referenceCount: {
                        readonly minimum: 0;
                        readonly type: "number";
                    };
                };
            };
        };
        readonly candidateDraftInternalLinkGuidance: {
            readonly type: "array";
            readonly items: {
                readonly $id: "producing-content/content-farm/source-cycle/draft-internal-link-guidance";
                readonly title: "SourceCycleCandidateDraftInternalLinkGuidance";
                readonly additionalProperties: false;
                readonly type: "object";
                readonly required: readonly ["kind", "slug", "path", "changed", "suggestionCount", "suggestions"];
                readonly properties: {
                    readonly kind: {
                        readonly const: "producing-content.source-cycle.draft-internal-link-guidance";
                    };
                    readonly slug: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly path: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly changed: {
                        readonly type: "boolean";
                    };
                    readonly suggestionCount: {
                        readonly minimum: 0;
                        readonly type: "number";
                    };
                    readonly suggestions: {
                        readonly type: "array";
                        readonly items: {
                            readonly $id: "producing-content/content-farm/source-cycle/draft-internal-link-suggestion";
                            readonly title: "SourceCycleDraftInternalLinkSuggestion";
                            readonly additionalProperties: false;
                            readonly type: "object";
                            readonly required: readonly ["targetSlug", "targetPath", "targetHeadline", "matchedTerms", "confidence", "markdownLink", "writingGuidance"];
                            readonly properties: {
                                readonly targetSlug: {
                                    readonly minLength: 1;
                                    readonly type: "string";
                                };
                                readonly targetPath: {
                                    readonly minLength: 1;
                                    readonly type: "string";
                                };
                                readonly targetHeadline: {
                                    readonly minLength: 1;
                                    readonly type: "string";
                                };
                                readonly matchedTerms: {
                                    readonly type: "array";
                                    readonly items: {
                                        readonly type: "string";
                                    };
                                };
                                readonly confidence: {
                                    readonly minimum: 0;
                                    readonly maximum: 1;
                                    readonly type: "number";
                                };
                                readonly markdownLink: {
                                    readonly minLength: 1;
                                    readonly type: "string";
                                };
                                readonly writingGuidance: {
                                    readonly minLength: 1;
                                    readonly type: "string";
                                };
                            };
                        };
                    };
                };
            };
        };
        readonly editorialPolicy: {
            readonly $id: "organizing/content-farm/source-cycle/editorial-policy";
            readonly title: "ContentFarmSourceCycleEditorialPolicy";
            readonly additionalProperties: false;
            readonly type: "object";
            readonly required: readonly ["record", "publication", "note"];
            readonly properties: {
                readonly record: {
                    readonly const: "draft-candidate";
                };
                readonly publication: {
                    readonly const: "manual-standards-gate";
                };
                readonly note: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
            };
        };
    };
};
export type ContentFarmSourceCycleIngestResult = FromSchema<typeof ContentFarmSourceCycleIngestResultSchema>;
export type ContentFarmSourceCycleCableReading = FromSchema<typeof ContentFarmSourceCycleCableReadingSchema>;
export type ContentFarmSourceCycleEditorialPolicy = FromSchema<typeof ContentFarmSourceCycleEditorialPolicySchema>;
export type ContentFarmSourceCycleReading = Omit<FromSchema<typeof ContentFarmSourceCycleReadingSchema>, "farm"> & Readonly<{
    farm: FarmCycleReading;
}>;
export declare const contentFarmSourceCycleReadingCarrier: import("@emsenn/relating").DataCarrier<{
    readonly kind: "organizing.content-farm.source-cycle";
    readonly generatedAt: string;
    readonly cable: {
        readonly wireCount: number;
        readonly written: number;
        readonly skipped: number;
        readonly errorCount: number;
        readonly results: readonly {
            readonly wire: string;
            readonly storeDir: string;
            readonly written: number;
            readonly skipped: number;
            readonly errors: readonly string[];
        }[];
        readonly skippedMessages: readonly string[];
    };
    readonly farm: unknown;
    readonly plan: {
        readonly kind: "organizing.content-farm.source-cycle.plan";
        readonly configPath: string;
        readonly cable: {
            readonly wireCount: number;
            readonly sourceCount: number;
            readonly wires: readonly {
                readonly sourceCount: number;
                readonly name: string;
                readonly sources: readonly string[];
            }[];
            readonly title: string;
            readonly domain: string;
            readonly port: number | null;
        };
        readonly farm: {
            readonly name: string;
            readonly port: number;
            readonly propertyCount: number;
            readonly properties: readonly {
                readonly contentDir: string;
                readonly dataDir: string;
                readonly seedCount: number;
                readonly name: string;
                readonly beatCount: number;
                readonly beats: readonly string[];
            }[];
        };
        readonly operator: {
            readonly planUrl: string;
            readonly runUrl: string;
            readonly publicationGate: string;
        };
    };
    readonly candidateWriteCollisions: readonly {
        readonly kind: "producing-content.source-cycle.candidate-write-collision";
        readonly path: string;
        readonly slug: string;
        readonly existingDraft: boolean;
        readonly restored: boolean;
        readonly instruction: string;
        readonly existingTitle?: string;
        readonly runTitle?: string;
    }[];
    readonly candidateReferences: readonly {
        readonly kind: "producing-content.source-cycle.references";
        readonly path: string;
        readonly slug: string;
        readonly changed: boolean;
        readonly sourceUrlCount: number;
        readonly referenceCount: number;
    }[];
    readonly candidateDraftInternalLinkGuidance: readonly {
        readonly kind: "producing-content.source-cycle.draft-internal-link-guidance";
        readonly path: string;
        readonly slug: string;
        readonly changed: boolean;
        readonly suggestionCount: number;
        readonly suggestions: readonly {
            readonly targetSlug: string;
            readonly targetPath: string;
            readonly targetHeadline: string;
            readonly matchedTerms: readonly string[];
            readonly confidence: number;
            readonly markdownLink: string;
            readonly writingGuidance: string;
        }[];
    }[];
    readonly editorialPolicy: {
        readonly record: "draft-candidate";
        readonly publication: "manual-standards-gate";
        readonly note: string;
    };
}>;
export declare function contentFarmSourceCycleReading(input: Omit<ContentFarmSourceCycleReading, "kind" | "cable" | "candidateWriteCollisions" | "candidateReferences" | "candidateDraftInternalLinkGuidance"> & Readonly<{
    cable: Omit<ContentFarmSourceCycleCableReading, "results" | "skippedMessages"> & Readonly<{
        results: readonly IngestResult[];
        skippedMessages: readonly string[];
    }>;
    candidateWriteCollisions: readonly SourceCycleCandidateWriteCollision[];
    candidateReferences: readonly SourceCycleCandidateReferenceNormalization[];
    candidateDraftInternalLinkGuidance: readonly SourceCycleCandidateDraftInternalLinkGuidance[];
}>): ContentFarmSourceCycleReading;
export declare function contentFarmSourceCycleReadingTerm(input: ContentFarmSourceCycleReading): Tm;
export declare const ContentFarmCandidateSnapshotSchema: {
    readonly $id: "organizing/content-farm/candidate-snapshot";
    readonly title: "ContentFarmCandidateSnapshot";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["kind", "path", "text", "slug", "draft"];
    readonly properties: {
        readonly kind: {
            readonly const: "organizing.content-farm.candidate-snapshot";
        };
        readonly path: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly text: {
            readonly type: "string";
        };
        readonly slug: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly draft: {
            readonly type: "boolean";
        };
        readonly title: {
            readonly minLength: 1;
            readonly type: "string";
        };
    };
};
export type ContentFarmCandidateSnapshot = FromSchema<typeof ContentFarmCandidateSnapshotSchema>;
export declare const contentFarmCandidateSnapshotCarrier: import("@emsenn/relating").DataCarrier<{
    readonly kind: "organizing.content-farm.candidate-snapshot";
    readonly path: string;
    readonly slug: string;
    readonly text: string;
    readonly draft: boolean;
    readonly title?: string;
}>;
export declare function contentFarmCandidateSnapshot(input: Omit<ContentFarmCandidateSnapshot, "kind">): ContentFarmCandidateSnapshot;
export declare function contentFarmCandidateSnapshots(config: ContentFarmConfig): readonly ContentFarmCandidateSnapshot[];
export declare function contentFarmCollisionPathSet(collisions: readonly SourceCycleCandidateWriteCollision[]): ReadonlySet<string>;
export declare function restoreContentFarmCandidateWriteCollisions(cycle: FarmCycle, snapshots: readonly ContentFarmCandidateSnapshot[], options?: Readonly<{
    instruction?: string;
}>): readonly SourceCycleCandidateWriteCollision[];
export declare function contentFarmCandidateSnapshotTerm(input: ContentFarmCandidateSnapshot): Tm;
export type NormalizeContentFarmCandidateReferencesOptions = Readonly<{
    path: string;
    license: string;
    licenseUrl: string;
    syndicationRights: string;
}>;
export declare function normalizeContentFarmCandidateReferences(options: NormalizeContentFarmCandidateReferencesOptions): SourceCycleCandidateReferenceNormalization;
export declare const ContentFarmDraftManuscriptWriteSchema: {
    readonly $id: "organizing/content-farm/draft-manuscript/write";
    readonly title: "ContentFarmDraftManuscriptWrite";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["kind", "contentDir", "slug", "path", "result"];
    readonly properties: {
        readonly kind: {
            readonly const: "organizing.content-farm.draft-manuscript.write";
        };
        readonly contentDir: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly slug: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly path: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly result: {
            readonly $id: "producing-content/content-farm/draft-manuscript/created";
            readonly title: "CreateDraftManuscriptResult";
            readonly additionalProperties: false;
            readonly type: "object";
            readonly required: readonly ["kind", "slug", "path", "draft", "title", "wordCount", "referenceCount", "license", "licenseUrl", "syndicationRights"];
            readonly properties: {
                readonly kind: {
                    readonly const: "producing-content.draft-manuscript.created";
                };
                readonly slug: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly path: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly draft: {
                    readonly const: true;
                };
                readonly title: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly wordCount: {
                    readonly minimum: 0;
                    readonly type: "number";
                };
                readonly referenceCount: {
                    readonly minimum: 0;
                    readonly type: "number";
                };
                readonly license: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly licenseUrl: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly syndicationRights: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
            };
        };
    };
};
export type ContentFarmDraftManuscriptWrite = FromSchema<typeof ContentFarmDraftManuscriptWriteSchema>;
export declare const contentFarmDraftManuscriptWriteCarrier: import("@emsenn/relating").DataCarrier<{
    readonly kind: "organizing.content-farm.draft-manuscript.write";
    readonly contentDir: string;
    readonly path: string;
    readonly slug: string;
    readonly result: {
        readonly kind: "producing-content.draft-manuscript.created";
        readonly path: string;
        readonly slug: string;
        readonly title: string;
        readonly referenceCount: number;
        readonly draft: true;
        readonly license: string;
        readonly licenseUrl: string;
        readonly syndicationRights: string;
        readonly wordCount: number;
    };
}>;
export type WriteContentFarmDraftManuscriptOptions = Readonly<{
    contentDir: string;
    input: CreateDraftManuscriptInput;
    author: string;
    license: string;
    licenseUrl: string;
    syndicationRights: string;
    category?: string;
    extraFrontMatter?: Readonly<Record<string, unknown>>;
    slugWordLimit?: number;
    now?: () => string;
}>;
export declare function writeContentFarmDraftManuscript(options: WriteContentFarmDraftManuscriptOptions): ContentFarmDraftManuscriptWrite;
export declare function contentFarmDraftManuscriptWriteTerm(input: ContentFarmDraftManuscriptWrite): Tm;
export declare const ContentFarmPostClaimSchema: {
    readonly $id: "organizing/content-farm/post/claim";
    readonly title: "ContentFarmPostClaim";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["predicate", "object"];
    readonly properties: {
        readonly predicate: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly object: {};
        readonly citation: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly claimedBy: {
            readonly anyOf: readonly [{
                readonly minLength: 1;
                readonly type: "string";
            }, {
                readonly type: "array";
                readonly items: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
            }];
        };
        readonly contraryClaimedBy: {
            readonly anyOf: readonly [{
                readonly minLength: 1;
                readonly type: "string";
            }, {
                readonly type: "array";
                readonly items: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
            }];
        };
    };
};
export declare const ContentFarmPostClaimSetSchema: {
    readonly $id: "organizing/content-farm/post/claim-set";
    readonly title: "ContentFarmPostClaimSet";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["subject"];
    readonly properties: {
        readonly subject: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly potential: {
            readonly type: "array";
            readonly items: {
                readonly $id: "organizing/content-farm/post/claim";
                readonly title: "ContentFarmPostClaim";
                readonly additionalProperties: false;
                readonly type: "object";
                readonly required: readonly ["predicate", "object"];
                readonly properties: {
                    readonly predicate: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly object: {};
                    readonly citation: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly claimedBy: {
                        readonly anyOf: readonly [{
                            readonly minLength: 1;
                            readonly type: "string";
                        }, {
                            readonly type: "array";
                            readonly items: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                        }];
                    };
                    readonly contraryClaimedBy: {
                        readonly anyOf: readonly [{
                            readonly minLength: 1;
                            readonly type: "string";
                        }, {
                            readonly type: "array";
                            readonly items: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                        }];
                    };
                };
            };
        };
        readonly active: {
            readonly type: "array";
            readonly items: {
                readonly $id: "organizing/content-farm/post/claim";
                readonly title: "ContentFarmPostClaim";
                readonly additionalProperties: false;
                readonly type: "object";
                readonly required: readonly ["predicate", "object"];
                readonly properties: {
                    readonly predicate: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly object: {};
                    readonly citation: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly claimedBy: {
                        readonly anyOf: readonly [{
                            readonly minLength: 1;
                            readonly type: "string";
                        }, {
                            readonly type: "array";
                            readonly items: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                        }];
                    };
                    readonly contraryClaimedBy: {
                        readonly anyOf: readonly [{
                            readonly minLength: 1;
                            readonly type: "string";
                        }, {
                            readonly type: "array";
                            readonly items: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                        }];
                    };
                };
            };
        };
        readonly stable: {
            readonly type: "array";
            readonly items: {
                readonly $id: "organizing/content-farm/post/claim";
                readonly title: "ContentFarmPostClaim";
                readonly additionalProperties: false;
                readonly type: "object";
                readonly required: readonly ["predicate", "object"];
                readonly properties: {
                    readonly predicate: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly object: {};
                    readonly citation: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly claimedBy: {
                        readonly anyOf: readonly [{
                            readonly minLength: 1;
                            readonly type: "string";
                        }, {
                            readonly type: "array";
                            readonly items: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                        }];
                    };
                    readonly contraryClaimedBy: {
                        readonly anyOf: readonly [{
                            readonly minLength: 1;
                            readonly type: "string";
                        }, {
                            readonly type: "array";
                            readonly items: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                        }];
                    };
                };
            };
        };
    };
};
export declare const ContentFarmPostClaimsReadingSchema: {
    readonly $id: "organizing/content-farm/post/claims-reading";
    readonly title: "ContentFarmPostClaimsReading";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["kind", "slug", "citation", "shipped", "claimSet"];
    readonly properties: {
        readonly kind: {
            readonly const: "organizing.content-farm.post.claims";
        };
        readonly slug: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly citation: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly shipped: {
            readonly type: "boolean";
        };
        readonly claimSet: {
            readonly $id: "organizing/content-farm/post/claim-set";
            readonly title: "ContentFarmPostClaimSet";
            readonly additionalProperties: false;
            readonly type: "object";
            readonly required: readonly ["subject"];
            readonly properties: {
                readonly subject: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly potential: {
                    readonly type: "array";
                    readonly items: {
                        readonly $id: "organizing/content-farm/post/claim";
                        readonly title: "ContentFarmPostClaim";
                        readonly additionalProperties: false;
                        readonly type: "object";
                        readonly required: readonly ["predicate", "object"];
                        readonly properties: {
                            readonly predicate: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly object: {};
                            readonly citation: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly claimedBy: {
                                readonly anyOf: readonly [{
                                    readonly minLength: 1;
                                    readonly type: "string";
                                }, {
                                    readonly type: "array";
                                    readonly items: {
                                        readonly minLength: 1;
                                        readonly type: "string";
                                    };
                                }];
                            };
                            readonly contraryClaimedBy: {
                                readonly anyOf: readonly [{
                                    readonly minLength: 1;
                                    readonly type: "string";
                                }, {
                                    readonly type: "array";
                                    readonly items: {
                                        readonly minLength: 1;
                                        readonly type: "string";
                                    };
                                }];
                            };
                        };
                    };
                };
                readonly active: {
                    readonly type: "array";
                    readonly items: {
                        readonly $id: "organizing/content-farm/post/claim";
                        readonly title: "ContentFarmPostClaim";
                        readonly additionalProperties: false;
                        readonly type: "object";
                        readonly required: readonly ["predicate", "object"];
                        readonly properties: {
                            readonly predicate: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly object: {};
                            readonly citation: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly claimedBy: {
                                readonly anyOf: readonly [{
                                    readonly minLength: 1;
                                    readonly type: "string";
                                }, {
                                    readonly type: "array";
                                    readonly items: {
                                        readonly minLength: 1;
                                        readonly type: "string";
                                    };
                                }];
                            };
                            readonly contraryClaimedBy: {
                                readonly anyOf: readonly [{
                                    readonly minLength: 1;
                                    readonly type: "string";
                                }, {
                                    readonly type: "array";
                                    readonly items: {
                                        readonly minLength: 1;
                                        readonly type: "string";
                                    };
                                }];
                            };
                        };
                    };
                };
                readonly stable: {
                    readonly type: "array";
                    readonly items: {
                        readonly $id: "organizing/content-farm/post/claim";
                        readonly title: "ContentFarmPostClaim";
                        readonly additionalProperties: false;
                        readonly type: "object";
                        readonly required: readonly ["predicate", "object"];
                        readonly properties: {
                            readonly predicate: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly object: {};
                            readonly citation: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly claimedBy: {
                                readonly anyOf: readonly [{
                                    readonly minLength: 1;
                                    readonly type: "string";
                                }, {
                                    readonly type: "array";
                                    readonly items: {
                                        readonly minLength: 1;
                                        readonly type: "string";
                                    };
                                }];
                            };
                            readonly contraryClaimedBy: {
                                readonly anyOf: readonly [{
                                    readonly minLength: 1;
                                    readonly type: "string";
                                }, {
                                    readonly type: "array";
                                    readonly items: {
                                        readonly minLength: 1;
                                        readonly type: "string";
                                    };
                                }];
                            };
                        };
                    };
                };
            };
        };
    };
};
export type ContentFarmPostClaim = FromSchema<typeof ContentFarmPostClaimSchema>;
export type ContentFarmPostClaimSet = FromSchema<typeof ContentFarmPostClaimSetSchema>;
export type ContentFarmPostClaimsReading = FromSchema<typeof ContentFarmPostClaimsReadingSchema>;
export declare const contentFarmPostClaimCarrier: import("@emsenn/relating").DataCarrier<{
    readonly object: unknown;
    readonly predicate: string;
    readonly citation?: string;
    readonly claimedBy?: string | readonly string[];
    readonly contraryClaimedBy?: string | readonly string[];
}>;
export declare const contentFarmPostClaimSetCarrier: import("@emsenn/relating").DataCarrier<{
    readonly subject: string;
    readonly potential?: readonly {
        readonly object: unknown;
        readonly predicate: string;
        readonly citation?: string;
        readonly claimedBy?: string | readonly string[];
        readonly contraryClaimedBy?: string | readonly string[];
    }[];
    readonly active?: readonly {
        readonly object: unknown;
        readonly predicate: string;
        readonly citation?: string;
        readonly claimedBy?: string | readonly string[];
        readonly contraryClaimedBy?: string | readonly string[];
    }[];
    readonly stable?: readonly {
        readonly object: unknown;
        readonly predicate: string;
        readonly citation?: string;
        readonly claimedBy?: string | readonly string[];
        readonly contraryClaimedBy?: string | readonly string[];
    }[];
}>;
export declare const contentFarmPostClaimsReadingCarrier: import("@emsenn/relating").DataCarrier<{
    readonly kind: "organizing.content-farm.post.claims";
    readonly slug: string;
    readonly shipped: boolean;
    readonly citation: string;
    readonly claimSet: {
        readonly subject: string;
        readonly potential?: readonly {
            readonly object: unknown;
            readonly predicate: string;
            readonly citation?: string;
            readonly claimedBy?: string | readonly string[];
            readonly contraryClaimedBy?: string | readonly string[];
        }[];
        readonly active?: readonly {
            readonly object: unknown;
            readonly predicate: string;
            readonly citation?: string;
            readonly claimedBy?: string | readonly string[];
            readonly contraryClaimedBy?: string | readonly string[];
        }[];
        readonly stable?: readonly {
            readonly object: unknown;
            readonly predicate: string;
            readonly citation?: string;
            readonly claimedBy?: string | readonly string[];
            readonly contraryClaimedBy?: string | readonly string[];
        }[];
    };
}>;
export type ContentFarmPostClaimsInput = Readonly<{
    slug: string;
    document: FrontMatterDocument;
    fallbackCitation?: string;
}>;
export declare function contentFarmPostClaimsReading(input: ContentFarmPostClaimsInput): ContentFarmPostClaimsReading;
export declare function contentFarmPostClaimSet(input: ContentFarmPostClaimsInput): NewsClaimSet;
export declare function contentFarmPostClaimsReadingTerm(input: ContentFarmPostClaimsReading): Tm;
export declare const ContentFarmPostFileReadingSchema: {
    readonly $id: "organizing/content-farm/post/file-reading";
    readonly title: "ContentFarmPostFileReading";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["kind", "path", "slug", "document", "claims"];
    readonly properties: {
        readonly kind: {
            readonly const: "organizing.content-farm.post.file-reading";
        };
        readonly path: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly slug: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly document: {};
        readonly claims: {
            readonly $id: "organizing/content-farm/post/claims-reading";
            readonly title: "ContentFarmPostClaimsReading";
            readonly additionalProperties: false;
            readonly type: "object";
            readonly required: readonly ["kind", "slug", "citation", "shipped", "claimSet"];
            readonly properties: {
                readonly kind: {
                    readonly const: "organizing.content-farm.post.claims";
                };
                readonly slug: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly citation: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly shipped: {
                    readonly type: "boolean";
                };
                readonly claimSet: {
                    readonly $id: "organizing/content-farm/post/claim-set";
                    readonly title: "ContentFarmPostClaimSet";
                    readonly additionalProperties: false;
                    readonly type: "object";
                    readonly required: readonly ["subject"];
                    readonly properties: {
                        readonly subject: {
                            readonly minLength: 1;
                            readonly type: "string";
                        };
                        readonly potential: {
                            readonly type: "array";
                            readonly items: {
                                readonly $id: "organizing/content-farm/post/claim";
                                readonly title: "ContentFarmPostClaim";
                                readonly additionalProperties: false;
                                readonly type: "object";
                                readonly required: readonly ["predicate", "object"];
                                readonly properties: {
                                    readonly predicate: {
                                        readonly minLength: 1;
                                        readonly type: "string";
                                    };
                                    readonly object: {};
                                    readonly citation: {
                                        readonly minLength: 1;
                                        readonly type: "string";
                                    };
                                    readonly claimedBy: {
                                        readonly anyOf: readonly [{
                                            readonly minLength: 1;
                                            readonly type: "string";
                                        }, {
                                            readonly type: "array";
                                            readonly items: {
                                                readonly minLength: 1;
                                                readonly type: "string";
                                            };
                                        }];
                                    };
                                    readonly contraryClaimedBy: {
                                        readonly anyOf: readonly [{
                                            readonly minLength: 1;
                                            readonly type: "string";
                                        }, {
                                            readonly type: "array";
                                            readonly items: {
                                                readonly minLength: 1;
                                                readonly type: "string";
                                            };
                                        }];
                                    };
                                };
                            };
                        };
                        readonly active: {
                            readonly type: "array";
                            readonly items: {
                                readonly $id: "organizing/content-farm/post/claim";
                                readonly title: "ContentFarmPostClaim";
                                readonly additionalProperties: false;
                                readonly type: "object";
                                readonly required: readonly ["predicate", "object"];
                                readonly properties: {
                                    readonly predicate: {
                                        readonly minLength: 1;
                                        readonly type: "string";
                                    };
                                    readonly object: {};
                                    readonly citation: {
                                        readonly minLength: 1;
                                        readonly type: "string";
                                    };
                                    readonly claimedBy: {
                                        readonly anyOf: readonly [{
                                            readonly minLength: 1;
                                            readonly type: "string";
                                        }, {
                                            readonly type: "array";
                                            readonly items: {
                                                readonly minLength: 1;
                                                readonly type: "string";
                                            };
                                        }];
                                    };
                                    readonly contraryClaimedBy: {
                                        readonly anyOf: readonly [{
                                            readonly minLength: 1;
                                            readonly type: "string";
                                        }, {
                                            readonly type: "array";
                                            readonly items: {
                                                readonly minLength: 1;
                                                readonly type: "string";
                                            };
                                        }];
                                    };
                                };
                            };
                        };
                        readonly stable: {
                            readonly type: "array";
                            readonly items: {
                                readonly $id: "organizing/content-farm/post/claim";
                                readonly title: "ContentFarmPostClaim";
                                readonly additionalProperties: false;
                                readonly type: "object";
                                readonly required: readonly ["predicate", "object"];
                                readonly properties: {
                                    readonly predicate: {
                                        readonly minLength: 1;
                                        readonly type: "string";
                                    };
                                    readonly object: {};
                                    readonly citation: {
                                        readonly minLength: 1;
                                        readonly type: "string";
                                    };
                                    readonly claimedBy: {
                                        readonly anyOf: readonly [{
                                            readonly minLength: 1;
                                            readonly type: "string";
                                        }, {
                                            readonly type: "array";
                                            readonly items: {
                                                readonly minLength: 1;
                                                readonly type: "string";
                                            };
                                        }];
                                    };
                                    readonly contraryClaimedBy: {
                                        readonly anyOf: readonly [{
                                            readonly minLength: 1;
                                            readonly type: "string";
                                        }, {
                                            readonly type: "array";
                                            readonly items: {
                                                readonly minLength: 1;
                                                readonly type: "string";
                                            };
                                        }];
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
};
export type ContentFarmPostFileReading = Omit<FromSchema<typeof ContentFarmPostFileReadingSchema>, "document" | "claims"> & Readonly<{
    document: FrontMatterDocument;
    claims: ContentFarmPostClaimsReading;
}>;
export declare const contentFarmPostFileReadingCarrier: import("@emsenn/relating").DataCarrier<{
    readonly kind: "organizing.content-farm.post.file-reading";
    readonly path: string;
    readonly slug: string;
    readonly document: unknown;
    readonly claims: {
        readonly kind: "organizing.content-farm.post.claims";
        readonly slug: string;
        readonly shipped: boolean;
        readonly citation: string;
        readonly claimSet: {
            readonly subject: string;
            readonly potential?: readonly {
                readonly object: unknown;
                readonly predicate: string;
                readonly citation?: string;
                readonly claimedBy?: string | readonly string[];
                readonly contraryClaimedBy?: string | readonly string[];
            }[];
            readonly active?: readonly {
                readonly object: unknown;
                readonly predicate: string;
                readonly citation?: string;
                readonly claimedBy?: string | readonly string[];
                readonly contraryClaimedBy?: string | readonly string[];
            }[];
            readonly stable?: readonly {
                readonly object: unknown;
                readonly predicate: string;
                readonly citation?: string;
                readonly claimedBy?: string | readonly string[];
                readonly contraryClaimedBy?: string | readonly string[];
            }[];
        };
    };
}>;
export type ReadContentFarmPostFileOptions = Readonly<{
    fallbackCitation?: string | ((slug: string) => string);
}>;
export declare function readContentFarmPostFile(path: string, options?: ReadContentFarmPostFileOptions): ContentFarmPostFileReading;
export declare function readContentFarmPostFiles(contentDir: string, options?: ReadContentFarmPostFileOptions): readonly ContentFarmPostFileReading[];
export declare function contentFarmPostFileReadingTerm(input: ContentFarmPostFileReading): Tm;
export declare const BeatSourceReadingSchema: {
    readonly $id: "organizing/content-farm/sourcing/beat-source";
    readonly title: "BeatSourceReading";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["beat", "sourceCount", "sources", "seedTerms"];
    readonly properties: {
        readonly beat: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly sourceCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly sources: {
            readonly type: "array";
            readonly items: {
                readonly minLength: 1;
                readonly type: "string";
            };
        };
        readonly seedTerms: {
            readonly type: "array";
            readonly items: {
                readonly minLength: 1;
                readonly type: "string";
            };
        };
    };
};
export declare const SourcingPolicySchema: {
    readonly $id: "organizing/content-farm/sourcing/policy";
    readonly title: "SourcingPolicy";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["route", "note"];
    readonly properties: {
        readonly route: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly note: {
            readonly minLength: 1;
            readonly type: "string";
        };
    };
};
export declare const ResearchPacketPolicySchema: {
    readonly $id: "organizing/content-farm/sourcing/research-packet-policy";
    readonly title: "ResearchPacketPolicy";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["route", "assignmentRoute", "note"];
    readonly properties: {
        readonly route: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly assignmentRoute: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly note: {
            readonly minLength: 1;
            readonly type: "string";
        };
    };
};
export declare const ContentFarmSourcingDepartmentSchema: {
    readonly $id: "organizing/content-farm/sourcing/department";
    readonly title: "ContentFarmSourcingDepartment";
    readonly additionalProperties: false;
    readonly type: "object";
    readonly required: readonly ["department", "property", "farmCorpus", "farmCorpusRoot", "beats", "sourceRoll", "researchPacketPolicy", "submissionDesk", "sourceCount", "seedCount"];
    readonly properties: {
        readonly department: {
            readonly const: "organizing.content-farm.sourcing";
        };
        readonly property: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly farmCorpus: {
            readonly $id: "organizing/content-farm/corpus";
            readonly title: "ContentFarmCorpus";
            readonly additionalProperties: false;
            readonly type: "object";
            readonly required: readonly ["kind", "property", "contentDir", "dataDir", "corpusPath", "catalogTotal", "newscableConfigPath", "wireCount", "sourceCount", "seedCount"];
            readonly properties: {
                readonly kind: {
                    readonly const: "organizing.content-farm.corpus";
                };
                readonly property: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly contentDir: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly dataDir: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly corpusPath: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly catalogTotal: {
                    readonly minimum: 0;
                    readonly type: "integer";
                };
                readonly newscableConfigPath: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly wireCount: {
                    readonly minimum: 0;
                    readonly type: "integer";
                };
                readonly sourceCount: {
                    readonly minimum: 0;
                    readonly type: "integer";
                };
                readonly seedCount: {
                    readonly minimum: 0;
                    readonly type: "integer";
                };
            };
        };
        readonly farmCorpusRoot: {
            readonly $id: "organizing/content-farm/corpus-root";
            readonly title: "ContentFarmCorpusRoot";
            readonly additionalProperties: false;
            readonly type: "object";
            readonly required: readonly ["kind", "property", "root", "expectedPaths", "stablePrefixes", "observedPrefixes", "missingPaths", "allowedPrefixes", "farmCorpus", "rigging"];
            readonly properties: {
                readonly kind: {
                    readonly const: "organizing.content-farm.corpus-root";
                };
                readonly property: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly root: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly expectedPaths: {
                    readonly type: "array";
                    readonly items: {
                        readonly $id: "organizing/content-farm/corpus/root-path";
                        readonly title: "CorpusRootPath";
                        readonly additionalProperties: false;
                        readonly type: "object";
                        readonly required: readonly ["path", "description", "present"];
                        readonly properties: {
                            readonly path: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly description: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly present: {
                                readonly type: "boolean";
                            };
                        };
                    };
                };
                readonly stablePrefixes: {
                    readonly type: "array";
                    readonly items: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                };
                readonly observedPrefixes: {
                    readonly type: "array";
                    readonly items: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                };
                readonly missingPaths: {
                    readonly type: "array";
                    readonly items: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                };
                readonly allowedPrefixes: {
                    readonly type: "array";
                    readonly items: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                };
                readonly farmCorpus: {
                    readonly $id: "organizing/content-farm/corpus";
                    readonly title: "ContentFarmCorpus";
                    readonly additionalProperties: false;
                    readonly type: "object";
                    readonly required: readonly ["kind", "property", "contentDir", "dataDir", "corpusPath", "catalogTotal", "newscableConfigPath", "wireCount", "sourceCount", "seedCount"];
                    readonly properties: {
                        readonly kind: {
                            readonly const: "organizing.content-farm.corpus";
                        };
                        readonly property: {
                            readonly minLength: 1;
                            readonly type: "string";
                        };
                        readonly contentDir: {
                            readonly minLength: 1;
                            readonly type: "string";
                        };
                        readonly dataDir: {
                            readonly minLength: 1;
                            readonly type: "string";
                        };
                        readonly corpusPath: {
                            readonly minLength: 1;
                            readonly type: "string";
                        };
                        readonly catalogTotal: {
                            readonly minimum: 0;
                            readonly type: "integer";
                        };
                        readonly newscableConfigPath: {
                            readonly minLength: 1;
                            readonly type: "string";
                        };
                        readonly wireCount: {
                            readonly minimum: 0;
                            readonly type: "integer";
                        };
                        readonly sourceCount: {
                            readonly minimum: 0;
                            readonly type: "integer";
                        };
                        readonly seedCount: {
                            readonly minimum: 0;
                            readonly type: "integer";
                        };
                    };
                };
                readonly rigging: {
                    readonly title: "KnowledgeVaultRiggingValue";
                    readonly additionalProperties: false;
                    readonly type: "object";
                    readonly required: readonly ["kind", "root", "rigCount", "rigs"];
                    readonly properties: {
                        readonly kind: {
                            readonly const: "organizing.knowledge-vault.corpus.rigging";
                        };
                        readonly root: {
                            readonly minLength: 1;
                            readonly type: "string";
                        };
                        readonly rigCount: {
                            readonly minimum: 0;
                            readonly type: "integer";
                        };
                        readonly rigs: {
                            readonly type: "array";
                            readonly items: {
                                readonly title: "KnowledgeVaultRigValue";
                                readonly additionalProperties: false;
                                readonly type: "object";
                                readonly required: readonly ["kind", "inputKind", "name", "mount"];
                                readonly properties: {
                                    readonly kind: {
                                        readonly const: "organizing.knowledge-vault.corpus.rig";
                                    };
                                    readonly inputKind: {
                                        readonly anyOf: readonly [{
                                            readonly const: "newswire";
                                        }, {
                                            readonly const: "newscable";
                                        }];
                                    };
                                    readonly name: {
                                        readonly minLength: 1;
                                        readonly type: "string";
                                    };
                                    readonly mount: {
                                        readonly minLength: 1;
                                        readonly type: "string";
                                    };
                                    readonly configPath: {
                                        readonly minLength: 1;
                                        readonly type: "string";
                                    };
                                    readonly href: {
                                        readonly minLength: 1;
                                        readonly type: "string";
                                    };
                                    readonly wireCount: {
                                        readonly minimum: 0;
                                        readonly type: "integer";
                                    };
                                    readonly sourceCount: {
                                        readonly minimum: 0;
                                        readonly type: "integer";
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
        readonly beats: {
            readonly type: "array";
            readonly items: {
                readonly $id: "organizing/content-farm/sourcing/beat-source";
                readonly title: "BeatSourceReading";
                readonly additionalProperties: false;
                readonly type: "object";
                readonly required: readonly ["beat", "sourceCount", "sources", "seedTerms"];
                readonly properties: {
                    readonly beat: {
                        readonly minLength: 1;
                        readonly type: "string";
                    };
                    readonly sourceCount: {
                        readonly minimum: 0;
                        readonly type: "integer";
                    };
                    readonly sources: {
                        readonly type: "array";
                        readonly items: {
                            readonly minLength: 1;
                            readonly type: "string";
                        };
                    };
                    readonly seedTerms: {
                        readonly type: "array";
                        readonly items: {
                            readonly minLength: 1;
                            readonly type: "string";
                        };
                    };
                };
            };
        };
        readonly sourceRoll: {
            readonly $id: "producing-content/cable/source-roll";
            readonly title: "CableSourceRoll";
            readonly additionalProperties: false;
            readonly type: "object";
            readonly required: readonly ["kind", "configPath", "generatedAt", "wireCount", "sourceCount", "wireItemCount", "wires", "byClass", "bySourceKind", "constraints"];
            readonly properties: {
                readonly kind: {
                    readonly const: "producing-content.source-roll";
                };
                readonly configPath: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly generatedAt: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly wireCount: {
                    readonly type: "number";
                };
                readonly sourceCount: {
                    readonly type: "number";
                };
                readonly wireItemCount: {
                    readonly type: "number";
                };
                readonly wires: {
                    readonly type: "array";
                    readonly items: {
                        readonly $id: "producing-content/cable/source-roll/wire";
                        readonly title: "SourceRollWire";
                        readonly additionalProperties: false;
                        readonly type: "object";
                        readonly required: readonly ["kind", "name", "title", "sourceCount", "wireItemCount", "sources"];
                        readonly properties: {
                            readonly kind: {
                                readonly const: "producing-content.source-roll.wire";
                            };
                            readonly name: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly title: {
                                readonly minLength: 1;
                                readonly type: "string";
                            };
                            readonly description: {
                                readonly type: "string";
                            };
                            readonly sourceCount: {
                                readonly type: "number";
                            };
                            readonly wireItemCount: {
                                readonly type: "number";
                            };
                            readonly latestWireItemAt: {
                                readonly type: "string";
                            };
                            readonly sources: {
                                readonly type: "array";
                                readonly items: {
                                    readonly $id: "producing-content/cable/source-roll/source";
                                    readonly title: "SourceRollSource";
                                    readonly additionalProperties: false;
                                    readonly type: "object";
                                    readonly required: readonly ["kind", "wire", "beat", "adapter", "sourceKind", "sourceClass", "editorialRole", "wireItemCount"];
                                    readonly properties: {
                                        readonly kind: {
                                            readonly const: "producing-content.source-roll.source";
                                        };
                                        readonly wire: {
                                            readonly minLength: 1;
                                            readonly type: "string";
                                        };
                                        readonly beat: {
                                            readonly minLength: 1;
                                            readonly type: "string";
                                        };
                                        readonly adapter: {
                                            readonly minLength: 1;
                                            readonly type: "string";
                                        };
                                        readonly url: {
                                            readonly type: "string";
                                        };
                                        readonly query: {
                                            readonly type: "string";
                                        };
                                        readonly domain: {
                                            readonly type: "string";
                                        };
                                        readonly max: {
                                            readonly type: "number";
                                        };
                                        readonly sourceKind: {
                                            readonly minLength: 1;
                                            readonly type: "string";
                                        };
                                        readonly sourceClass: {
                                            readonly minLength: 1;
                                            readonly type: "string";
                                        };
                                        readonly editorialRole: {
                                            readonly minLength: 1;
                                            readonly type: "string";
                                        };
                                        readonly wireItemCount: {
                                            readonly type: "number";
                                        };
                                        readonly latestWireItemAt: {
                                            readonly type: "string";
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
                readonly byClass: {
                    readonly type: "object";
                    readonly additionalProperties: {
                        readonly type: "number";
                    };
                };
                readonly bySourceKind: {
                    readonly type: "object";
                    readonly additionalProperties: {
                        readonly type: "number";
                    };
                };
                readonly constraints: {
                    readonly type: "array";
                    readonly items: {
                        readonly type: "string";
                    };
                };
            };
        };
        readonly researchPacketPolicy: {
            readonly $id: "organizing/content-farm/sourcing/research-packet-policy";
            readonly title: "ResearchPacketPolicy";
            readonly additionalProperties: false;
            readonly type: "object";
            readonly required: readonly ["route", "assignmentRoute", "note"];
            readonly properties: {
                readonly route: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly assignmentRoute: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly note: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
            };
        };
        readonly submissionDesk: {
            readonly $id: "organizing/content-farm/sourcing/policy";
            readonly title: "SourcingPolicy";
            readonly additionalProperties: false;
            readonly type: "object";
            readonly required: readonly ["route", "note"];
            readonly properties: {
                readonly route: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
                readonly note: {
                    readonly minLength: 1;
                    readonly type: "string";
                };
            };
        };
        readonly sourceCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly seedCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
    };
};
export type BeatSourceReading = FromSchema<typeof BeatSourceReadingSchema>;
export type SourcingPolicy = FromSchema<typeof SourcingPolicySchema>;
export type ResearchPacketPolicy = FromSchema<typeof ResearchPacketPolicySchema>;
export type ContentFarmSourcingDepartment = FromSchema<typeof ContentFarmSourcingDepartmentSchema>;
export declare const beatSourceReadingCarrier: import("@emsenn/relating").DataCarrier<{
    readonly sourceCount: number;
    readonly beat: string;
    readonly seedTerms: readonly string[];
    readonly sources: readonly string[];
}>;
export declare const sourcingPolicyCarrier: import("@emsenn/relating").DataCarrier<{
    readonly note: string;
    readonly route: string;
}>;
export declare const researchPacketPolicyCarrier: import("@emsenn/relating").DataCarrier<{
    readonly note: string;
    readonly route: string;
    readonly assignmentRoute: string;
}>;
export declare const contentFarmSourcingDepartmentCarrier: import("@emsenn/relating").DataCarrier<{
    readonly property: string;
    readonly sourceCount: number;
    readonly seedCount: number;
    readonly farmCorpus: {
        readonly kind: "organizing.content-farm.corpus";
        readonly property: string;
        readonly contentDir: string;
        readonly dataDir: string;
        readonly corpusPath: string;
        readonly catalogTotal: number;
        readonly newscableConfigPath: string;
        readonly wireCount: number;
        readonly sourceCount: number;
        readonly seedCount: number;
    };
    readonly beats: readonly {
        readonly sourceCount: number;
        readonly beat: string;
        readonly seedTerms: readonly string[];
        readonly sources: readonly string[];
    }[];
    readonly department: "organizing.content-farm.sourcing";
    readonly farmCorpusRoot: {
        readonly kind: "organizing.content-farm.corpus-root";
        readonly property: string;
        readonly root: string;
        readonly expectedPaths: readonly {
            readonly path: string;
            readonly description: string;
            readonly present: boolean;
        }[];
        readonly stablePrefixes: readonly string[];
        readonly observedPrefixes: readonly string[];
        readonly missingPaths: readonly string[];
        readonly allowedPrefixes: readonly string[];
        readonly farmCorpus: {
            readonly kind: "organizing.content-farm.corpus";
            readonly property: string;
            readonly contentDir: string;
            readonly dataDir: string;
            readonly corpusPath: string;
            readonly catalogTotal: number;
            readonly newscableConfigPath: string;
            readonly wireCount: number;
            readonly sourceCount: number;
            readonly seedCount: number;
        };
        readonly rigging: {
            readonly kind: "organizing.knowledge-vault.corpus.rigging";
            readonly root: string;
            readonly rigCount: number;
            readonly rigs: readonly {
                readonly kind: "organizing.knowledge-vault.corpus.rig";
                readonly name: string;
                readonly inputKind: "newscable" | "newswire";
                readonly mount: string;
                readonly wireCount?: number;
                readonly sourceCount?: number;
                readonly configPath?: string;
                readonly href?: string;
            }[];
        };
    };
    readonly sourceRoll: {
        readonly kind: "producing-content.source-roll";
        readonly wireCount: number;
        readonly sourceCount: number;
        readonly configPath: string;
        readonly generatedAt: string;
        readonly wireItemCount: number;
        readonly wires: readonly {
            readonly kind: "producing-content.source-roll.wire";
            readonly sourceCount: number;
            readonly wireItemCount: number;
            readonly name: string;
            readonly title: string;
            readonly sources: readonly {
                readonly kind: "producing-content.source-roll.source";
                readonly wireItemCount: number;
                readonly beat: string;
                readonly adapter: string;
                readonly wire: string;
                readonly sourceKind: string;
                readonly sourceClass: string;
                readonly editorialRole: string;
                readonly url?: string;
                readonly domain?: string;
                readonly query?: string;
                readonly latestWireItemAt?: string;
                readonly max?: number;
            }[];
            readonly description?: string;
            readonly latestWireItemAt?: string;
        }[];
        readonly byClass: Record<string, unknown>;
        readonly bySourceKind: Record<string, unknown>;
        readonly constraints: readonly string[];
    };
    readonly researchPacketPolicy: {
        readonly note: string;
        readonly route: string;
        readonly assignmentRoute: string;
    };
    readonly submissionDesk: {
        readonly note: string;
        readonly route: string;
    };
}>;
export declare function beatSourceReading(input: BeatSourceReading): BeatSourceReading;
export declare function sourcingPolicy(input: SourcingPolicy): SourcingPolicy;
export declare function researchPacketPolicy(input: ResearchPacketPolicy): ResearchPacketPolicy;
export declare function contentFarmSourcingDepartment(input: Omit<ContentFarmSourcingDepartment, "department">): ContentFarmSourcingDepartment;
export declare function contentFarmSourcingDepartmentTerm(input: ContentFarmSourcingDepartment): Tm;
//# sourceMappingURL=index.d.mts.map