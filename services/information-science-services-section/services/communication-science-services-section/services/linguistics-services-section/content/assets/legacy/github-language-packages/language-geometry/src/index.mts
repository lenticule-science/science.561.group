/**
 * @emsenn/language-geometry — the metric layer of language.
 *
 * Distance and shape over senses: an inspectable hypernym graph, synonym
 * sets, least-common-ancestor, and a depth-normalized similarity. No
 * embeddings, no statistics — the geometry is the sense graph itself, and
 * "distance" is path structure within it.
 */
export {
  hypernymGraph, synonymSets, hypernyms, synonymsOf,
  resolveToGraphWord, commonAncestor, similarity,
} from "./similarity.mjs";
