/**
 * @red-cup-engineering/communicating/speaking/listening/geometry — the metric layer of language.
 *
 * Distance and shape over senses: an inspectable hypernym graph, synonym
 * sets, least-common-ancestor, and a depth-normalized similarity. No
 * embeddings, no statistics — the geometry is the sense graph itself, and
 * "distance" is path structure within it.
 */
export { similarity, } from "./similarity.mjs";
/** A word-pair similarity reading at the document boundary. */
export interface SimilarPair {
    readonly a: string;
    readonly b: string;
    readonly similarity: number | null;
}
/** Parse a whitespace/tab separated word-pair document: one pair per nonblank line. */
export declare function similarPairsFrom(document: string): readonly (readonly [string, string])[];
//# sourceMappingURL=index.d.mts.map