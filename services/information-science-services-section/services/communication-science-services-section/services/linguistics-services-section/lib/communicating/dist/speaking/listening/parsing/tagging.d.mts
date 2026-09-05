import type { CompiledBundle } from "./types.mjs";
/** Return POS tags for a word. May return multiple tags (ambiguous open-class words).
 * Closed-class words return exactly one tag; open-class may return multiple. */
export declare function tag(word: string, bundle: CompiledBundle, opts?: {
    sentenceInitial?: boolean;
}): readonly string[];
//# sourceMappingURL=tagging.d.mts.map