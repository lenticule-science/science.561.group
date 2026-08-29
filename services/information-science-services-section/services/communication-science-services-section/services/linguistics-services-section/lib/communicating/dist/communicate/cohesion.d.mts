/**
 * communicate/cohesion — discourse COHESION of an agent membrane, read through the substrate
 * spectral graph Laplacian.
 *
 * communicating's across/truth face reads the membrane's per-subject lean (face.mts). This sibling
 * reading reads the membrane's DISCOURSE GRAPH — the subject↔object terms its utterances relate — as
 * relating's combinatorial graph Laplacian L = D − W (`@red-cup-engineering/relating` analysis.laplacian, exact over
 * ℤ). Two readings the face's per-cell census cannot give:
 *   • topics  = the connected-component count (H⁰, the Laplacian zero-eigenvalue multiplicity): how
 *     many INDEPENDENT discourse clusters the membrane splits into — subject-clusters that share no
 *     entity, hence cannot be about the same thing. One topic ⟺ the discourse is about one connected
 *     web of subjects.
 *   • cohesionTrees = the Matrix-Tree (Kirchhoff) spanning-tree count: the discourse's COHESION
 *     ROBUSTNESS — `0` the discourse fragments into several topics, `1` a single fragile thread (a
 *     spanning tree; one dropped utterance can fragment it), `> 1` a richly cross-linked discourse
 *     (redundant connections, resilient to dropped utterances).
 * The relation graph reads only the cells (subject↔object), so the membrane's pooled memes present it
 * directly via `membraneMeme` ∘ `relationGraphOfCells`. Total over any membrane. A LEAF over relating +
 * the package's own meme surface (does NOT import @red-cup-engineering/animating).
 */
import { type Action, type JsonRecord, type UtteranceCarrier } from "@red-cup-engineering/relating";
export declare const membraneSchema: {
    readonly $id: "communicating/membrane";
    readonly title: "CommunicatingMembrane";
    readonly description: "A communicating membrane admitted as an array of utterance carriers or { membrane: [...] }.";
    readonly anyOf: readonly [{
        readonly type: "array";
        readonly items: {
            readonly $ref: string;
        };
    }, {
        readonly type: "object";
        readonly required: readonly ["membrane"];
        readonly additionalProperties: true;
        readonly properties: {
            readonly membrane: {
                readonly type: "array";
                readonly items: {
                    readonly $ref: string;
                };
            };
        };
    }];
};
export declare const membraneCarrier: import("@red-cup-engineering/relating").Carrier<readonly unknown[] | {
    readonly membrane: readonly unknown[];
}>;
/** communicating's spectral read of discourse cohesion: H⁰ topics (component count) plus the
 *  Matrix-Tree spanning-tree count as the discourse's cohesion robustness. */
export interface DiscourseCohesion {
    readonly kind: "communicating.discourse-cohesion";
    /** distinct subject/object terms — the vertices of the discourse graph. */
    readonly subjects: number;
    /** H⁰ = the number of independent discourse topics (connected components), as the Laplacian's
     *  zero-eigenvalue multiplicity. */
    readonly topics: number;
    /** whether the whole membrane is one connected discourse (`topics === 1`). */
    readonly connected: boolean;
    /** the Matrix-Tree spanning-tree count of the discourse graph — its cohesion robustness
     *  (`0` fragmented, `1` a single fragile thread, `> 1` richly cross-linked). */
    readonly cohesionTrees: number;
    /** a single rigid thread of discourse: one spanning tree, no redundant cross-links. */
    readonly cohesive: boolean;
    /** a richly cross-linked discourse: redundant connections (`cohesionTrees > 1`) — resilient. */
    readonly redundant: boolean;
    /** derivable discourse-links: the EXACT/gradient flows `rank(L) = V − C` — the links implied by
     *  shared subjects, reconstructible from a per-topic potential. */
    readonly derivable: number;
    /** irreducible discourse cycles: the HARMONIC flows `β₁ = E − V + C` (the H¹ obstruction) — the
     *  independent cross-link loops no local rephrasing removes. */
    readonly irreducible: number;
    /** normalized finite cohomology receipt for the discourse graph's H0/H1/Laplacian read. */
    readonly cohomology: JsonRecord;
}
export declare const discourseCohesionSchema: {
    readonly $id: "communicating/discourse-cohesion";
    readonly title: "DiscourseCohesion";
    readonly type: "object";
    readonly required: readonly ["kind", "subjects", "topics", "connected", "cohesionTrees", "cohesive", "redundant", "derivable", "irreducible", "cohomology"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.discourse-cohesion";
        };
        readonly subjects: {
            readonly type: "integer";
            readonly minimum: 0;
        };
        readonly topics: {
            readonly type: "integer";
            readonly minimum: 0;
        };
        readonly connected: {
            readonly type: "boolean";
        };
        readonly cohesionTrees: {
            readonly type: "integer";
            readonly minimum: 0;
        };
        readonly cohesive: {
            readonly type: "boolean";
        };
        readonly redundant: {
            readonly type: "boolean";
        };
        readonly derivable: {
            readonly type: "integer";
            readonly minimum: 0;
        };
        readonly irreducible: {
            readonly type: "integer";
            readonly minimum: 0;
        };
        readonly cohomology: {
            readonly type: "object";
        };
    };
};
export declare const discourseCohesionCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.discourse-cohesion";
    readonly cohomology: Record<string, unknown>;
    readonly subjects: number;
    readonly topics: number;
    readonly connected: boolean;
    readonly cohesionTrees: number;
    readonly cohesive: boolean;
    readonly redundant: boolean;
    readonly derivable: number;
    readonly irreducible: number;
}>;
/** Read a membrane's discourse cohesion through the substrate graph Laplacian: the topic count (H⁰)
 *  and the spanning-tree robustness of the discourse. */
export declare function discourseCohesionOf(membrane: readonly UtteranceCarrier[]): DiscourseCohesion;
/** cohere — read a membrane's discourse cohesion through the spectral graph Laplacian (H⁰ topics +
 *  Matrix-Tree spanning-tree robustness). */
export declare const cohereAction: Action;
/**
 * The DISCOURSE SPACETIME of a membrane — its causal geometry, read through relating's substrate
 * temporal geometry (`analysis.geometry`). The membrane is a genuine Lorentzian causal set: each
 * utterance is an EVENT stamped by its position (its TIME), two events are adjacent when their cells
 * share a TERM, and an earlier utterance causally PRECEDES a later one when a chain of shared terms
 * threads them forward (the transitive closure of stage-increasing term-adjacency — `causalOrder`).
 * Unrelated utterances are SPACELIKE (independent, concurrent topics). This is a DIFFERENT structure
 * from the discourse cohesion graph: it is the discourse's TIME, not just its connectivity.
 */
export interface DiscourseSpacetime {
    readonly kind: "communicating.discourse-spacetime";
    /** the utterances, as causal-set events. */
    readonly events: number;
    /** timelike (causally-related) pairs — utterances threaded by shared terms through time. */
    readonly timelikePairs: number;
    /** all distinct event pairs. */
    readonly totalPairs: number;
    /** the ORDERING FRACTION = timelike / total — the discourse's causal density (Lorentzian: `1` a pure
     *  chain of sequential reasoning, low a wide spacelike spread of independent concurrent threads). */
    readonly orderingFraction: number;
    /** the PROPER TIME = the longest causal chain — the depth of the deepest discourse thread (how many
     *  utterances deep the longest forward-threaded line of shared terms runs). */
    readonly properTime: number;
    /** a single dominant causal thread (`properTime === events`): the whole discourse is one timelike line. */
    readonly threaded: boolean;
}
export declare const discourseSpacetimeSchema: {
    readonly $id: "communicating/discourse-spacetime";
    readonly title: "DiscourseSpacetime";
    readonly type: "object";
    readonly required: readonly ["kind", "events", "timelikePairs", "totalPairs", "orderingFraction", "properTime", "threaded"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.discourse-spacetime";
        };
        readonly events: {
            readonly type: "integer";
            readonly minimum: 0;
        };
        readonly timelikePairs: {
            readonly type: "integer";
            readonly minimum: 0;
        };
        readonly totalPairs: {
            readonly type: "integer";
            readonly minimum: 0;
        };
        readonly orderingFraction: {
            readonly type: "number";
            readonly minimum: 0;
        };
        readonly properTime: {
            readonly type: "integer";
            readonly minimum: 0;
        };
        readonly threaded: {
            readonly type: "boolean";
        };
    };
};
export declare const discourseSpacetimeCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.discourse-spacetime";
    readonly events: number;
    readonly timelikePairs: number;
    readonly totalPairs: number;
    readonly orderingFraction: number;
    readonly properTime: number;
    readonly threaded: boolean;
}>;
/** Read a membrane's discourse spacetime: its causal order's ordering fraction (density) and proper
 *  time (deepest thread), through the substrate temporal geometry. */
export declare function discourseSpacetimeOf(membrane: readonly UtteranceCarrier[]): DiscourseSpacetime;
/** spacetime — read a membrane's discourse causal geometry (ordering fraction + proper time). */
export declare const spacetimeAction: Action;
/**
 * The CHANNEL INFORMATION of a membrane — communicating read as information theory. With each utterance
 * a (speaker, subject) sample (the enriched membrane cell `(subject, predicate, utterer)`), the membrane
 * is an empirical joint distribution over a SPEAKER alphabet and a SUBJECT alphabet — a communication
 * channel. `mutualInformation` = `I(speaker; subject)` (bits): how much knowing who is speaking tells you
 * about what they speak of — the information the channel actually carries. `0` ⟺ speakers and subjects are
 * independent (everyone talks about everything equally); high ⟺ speakers specialize (each owns a topic).
 * Read through relating's substrate `analysis.mutualInformation`.
 */
export interface ChannelInformation {
    readonly kind: "communicating.channel-information";
    /** the utterances, as joint samples. */
    readonly utterances: number;
    /** distinct speakers — the X alphabet. */
    readonly speakers: number;
    /** distinct subjects — the Y alphabet. */
    readonly subjects: number;
    /** `H(speaker)` — the entropy of who is speaking (bits). */
    readonly speakerEntropy: number;
    /** `H(subject)` — the entropy of what is spoken of (bits). */
    readonly subjectEntropy: number;
    /** `H(speaker, subject)` — the joint entropy (bits). */
    readonly jointEntropy: number;
    /** `I(speaker; subject)` — the information the channel carries (bits, `≥ 0`). */
    readonly mutualInformation: number;
}
export declare const channelInformationSchema: {
    readonly $id: "communicating/channel-information";
    readonly title: "ChannelInformation";
    readonly type: "object";
    readonly required: readonly ["kind", "utterances", "speakers", "subjects", "speakerEntropy", "subjectEntropy", "jointEntropy", "mutualInformation"];
    readonly additionalProperties: false;
    readonly properties: {
        readonly kind: {
            readonly const: "communicating.channel-information";
        };
        readonly utterances: {
            readonly type: "integer";
            readonly minimum: 0;
        };
        readonly speakers: {
            readonly type: "integer";
            readonly minimum: 0;
        };
        readonly subjects: {
            readonly type: "integer";
            readonly minimum: 0;
        };
        readonly speakerEntropy: {
            readonly type: "number";
            readonly minimum: 0;
        };
        readonly subjectEntropy: {
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
export declare const channelInformationCarrier: import("@red-cup-engineering/relating").Carrier<{
    readonly kind: "communicating.channel-information";
    readonly utterances: number;
    readonly subjects: number;
    readonly speakers: number;
    readonly speakerEntropy: number;
    readonly subjectEntropy: number;
    readonly jointEntropy: number;
    readonly mutualInformation: number;
}>;
/** Read a membrane's channel information: the mutual information between speaker and subject. */
export declare function channelInformationOf(membrane: readonly UtteranceCarrier[]): ChannelInformation;
/** channel — read a membrane's channel information: H(speaker), H(subject), and I(speaker; subject). */
export declare const channelAction: Action;
//# sourceMappingURL=cohesion.d.mts.map