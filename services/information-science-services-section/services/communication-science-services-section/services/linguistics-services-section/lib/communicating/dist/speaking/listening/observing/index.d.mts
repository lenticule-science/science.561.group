/**
 * observing - parse readings as charged communication observations.
 *
 * This is the communication-specific observation adapter cannibalized from the
 * old animating-experimental doing algebra. It reads a language parse result into
 * charged observations about communication tasks; it does not become a root
 * communicating action because parsing is bundle/codec-bound in this package.
 */
import { type ArticulationCell, type Cell, type ChargeCarrier, type Claim, type Mark, type PredicationPredicate, type PredicationTerm, type Token, type UtteranceCarrier, type FromSchema } from "@red-cup-engineering/relating";
import type { CompiledBundle } from "../algebra/index.mjs";
import { type CommunicatingCarrier, type ParseResult } from "../parsing/index.mjs";
export declare const communicationTaskSchema: {
    readonly $id: "communicating/speaking/listening/observing/task";
    readonly type: "object";
    readonly required: readonly ["kind", "utterance", "articulation", "subject", "predicate", "object", "cell"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.task";
        };
        readonly utterance: {
            readonly description: "A relating utterance carrier.";
        };
        readonly articulation: {
            readonly description: "A relating articulation cell.";
        };
        readonly subject: {
            readonly description: "A relating predication term.";
        };
        readonly predicate: {
            readonly description: "A relating predication predicate.";
        };
        readonly object: {
            readonly description: "A relating predication term.";
        };
        readonly cell: {
            readonly description: "A relating predication cell.";
        };
    };
};
export declare const communicationTaskCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly object: unknown;
    readonly kind: "communicating.task";
    readonly utterance: unknown;
    readonly articulation: unknown;
    readonly subject: unknown;
    readonly cell: unknown;
    readonly predicate: unknown;
}>;
export declare const communicationObservationSchema: {
    readonly $id: "communicating/speaking/listening/observing/observation";
    readonly type: "object";
    readonly required: readonly ["kind", "observer", "task", "charge"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.observation";
        };
        readonly observer: {
            readonly description: "A relating predication term.";
        };
        readonly task: {
            readonly $id: "communicating/speaking/listening/observing/task";
            readonly type: "object";
            readonly required: readonly ["kind", "utterance", "articulation", "subject", "predicate", "object", "cell"];
            readonly additionalProperties: false;
            readonly properties: {
                readonly kind: {
                    readonly const: "communicating.task";
                };
                readonly utterance: {
                    readonly description: "A relating utterance carrier.";
                };
                readonly articulation: {
                    readonly description: "A relating articulation cell.";
                };
                readonly subject: {
                    readonly description: "A relating predication term.";
                };
                readonly predicate: {
                    readonly description: "A relating predication predicate.";
                };
                readonly object: {
                    readonly description: "A relating predication term.";
                };
                readonly cell: {
                    readonly description: "A relating predication cell.";
                };
            };
        };
        readonly charge: {
            readonly description: "A relating bilattice charge carrier.";
        };
        readonly at: {
            readonly description: "Relational evidence carried with the observation.";
        };
        readonly note: {
            readonly description: "Relational evidence carried with the observation.";
        };
    };
};
export declare const communicationObservationCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.observation";
    readonly charge: unknown;
    readonly observer: unknown;
    readonly task: {
        readonly object: unknown;
        readonly kind: "communicating.task";
        readonly utterance: unknown;
        readonly articulation: unknown;
        readonly subject: unknown;
        readonly cell: unknown;
        readonly predicate: unknown;
    };
    readonly at?: unknown;
    readonly note?: unknown;
}>;
export declare const communicationObservationSetSchema: {
    readonly $id: "communicating/speaking/listening/observing/observations";
    readonly type: "object";
    readonly required: readonly ["kind", "source", "parse", "observations"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.observations";
        };
        readonly source: {
            readonly description: "A communicating carrier.";
        };
        readonly parse: {
            readonly description: "A communicating parse result.";
        };
        readonly observations: {
            readonly type: "array";
            readonly items: {
                readonly $id: "communicating/speaking/listening/observing/observation";
                readonly type: "object";
                readonly required: readonly ["kind", "observer", "task", "charge"];
                readonly additionalProperties: false;
                readonly properties: {
                    readonly kind: {
                        readonly const: "communicating.observation";
                    };
                    readonly observer: {
                        readonly description: "A relating predication term.";
                    };
                    readonly task: {
                        readonly $id: "communicating/speaking/listening/observing/task";
                        readonly type: "object";
                        readonly required: readonly ["kind", "utterance", "articulation", "subject", "predicate", "object", "cell"];
                        readonly additionalProperties: false;
                        readonly properties: {
                            readonly kind: {
                                readonly const: "communicating.task";
                            };
                            readonly utterance: {
                                readonly description: "A relating utterance carrier.";
                            };
                            readonly articulation: {
                                readonly description: "A relating articulation cell.";
                            };
                            readonly subject: {
                                readonly description: "A relating predication term.";
                            };
                            readonly predicate: {
                                readonly description: "A relating predication predicate.";
                            };
                            readonly object: {
                                readonly description: "A relating predication term.";
                            };
                            readonly cell: {
                                readonly description: "A relating predication cell.";
                            };
                        };
                    };
                    readonly charge: {
                        readonly description: "A relating bilattice charge carrier.";
                    };
                    readonly at: {
                        readonly description: "Relational evidence carried with the observation.";
                    };
                    readonly note: {
                        readonly description: "Relational evidence carried with the observation.";
                    };
                };
            };
        };
    };
};
export declare const communicationObservationSetCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.observations";
    readonly source: unknown;
    readonly parse: unknown;
    readonly observations: readonly {
        readonly kind: "communicating.observation";
        readonly charge: unknown;
        readonly observer: unknown;
        readonly task: {
            readonly object: unknown;
            readonly kind: "communicating.task";
            readonly utterance: unknown;
            readonly articulation: unknown;
            readonly subject: unknown;
            readonly cell: unknown;
            readonly predicate: unknown;
        };
        readonly at?: unknown;
        readonly note?: unknown;
    }[];
}>;
export type CommunicationTask = Omit<FromSchema<typeof communicationTaskSchema>, "utterance" | "articulation" | "subject" | "predicate" | "object" | "cell"> & {
    readonly utterance: UtteranceCarrier;
    readonly articulation: ArticulationCell;
    readonly subject: PredicationTerm;
    readonly predicate: PredicationPredicate;
    readonly object: PredicationTerm;
    readonly cell: Cell;
};
export type CommunicationObservation = Omit<FromSchema<typeof communicationObservationSchema>, "observer" | "task" | "charge" | "at" | "note"> & {
    readonly observer: PredicationTerm;
    readonly task: CommunicationTask;
    readonly charge: ChargeCarrier;
    readonly at?: CommunicationTaskEvidence;
    readonly note?: CommunicationTaskEvidence;
};
export type CommunicationObservationSet = Omit<FromSchema<typeof communicationObservationSetSchema>, "source" | "parse" | "observations"> & {
    readonly source: CommunicatingCarrier;
    readonly parse: ParseResult;
    readonly observations: readonly CommunicationObservation[];
};
export type CommunicationTaskEvidence = Mark | Token | Claim | PredicationPredicate | PredicationTerm | Cell | UtteranceCarrier | ArticulationCell | CommunicationTask;
/** Convert an admitted communication and language bundle into charged parse observations. */
export declare function communicationObservations(source: CommunicatingCarrier, bundle: CompiledBundle): CommunicationObservationSet;
/** Convert an existing parse result into charged observations over communicating tasks. */
export declare function observationsOfCommunication(source: CommunicatingCarrier, parsed: ParseResult): CommunicationObservationSet;
export declare function communicationTask(input: {
    readonly subject: PredicationTerm;
    readonly predicate: PredicationPredicate;
    readonly object?: PredicationTerm;
}): CommunicationTask;
export declare function communicationTask(input: Cell): CommunicationTask;
export declare function communicationTask(input: UtteranceCarrier): CommunicationTask;
export declare function taskCell(taskCarrier: CommunicationTask): Cell;
export declare function communicationObservation(input: {
    readonly observer: PredicationTerm;
    readonly task: CommunicationTask;
    readonly charge: ChargeCarrier;
    readonly at?: CommunicationTaskEvidence;
    readonly note?: CommunicationTaskEvidence;
}): CommunicationObservation;
//# sourceMappingURL=index.d.mts.map