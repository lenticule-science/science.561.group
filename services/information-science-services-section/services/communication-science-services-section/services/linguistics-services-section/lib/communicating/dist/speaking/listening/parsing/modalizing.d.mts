import type { ModalityReading, Word } from "./types.mjs";
import type { CompiledBundle } from "./types.mjs";
/** Read the modality of one sentence: hedge, future-marking, and auxiliary
 * surface tokens found among its words, in reading order. `hedges` reads the
 * optional `bundle.hedges` list; `future`/`auxiliaries` read the closed-class
 * aux lexicon the bundle already carries (tag "aux"). */
export declare function modalityFromWords(words: readonly Word[], bundle: CompiledBundle): ModalityReading;
//# sourceMappingURL=modalizing.d.mts.map