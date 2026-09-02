import type { Attribution, ParsedArc, Span, Word } from "./types.mjs";
import type { CompiledBundle } from "./types.mjs";
/** Read attributions (speaker/cue/content) for one sentence, from the
 * bundle's optional `reportingVerbs` and `attributionMarkers` hooks. Empty
 * when the bundle carries neither hook. */
export declare function attributionsFromWords(words: readonly Word[], arcs: readonly ParsedArc[], quotes: readonly Span[], fullText: string, bundle: CompiledBundle): readonly Attribution[];
//# sourceMappingURL=attributing.d.mts.map