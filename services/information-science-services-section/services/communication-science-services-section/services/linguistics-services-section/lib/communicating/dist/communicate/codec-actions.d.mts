/**
 * communicate/codec-actions — the text↔meme CODEC surface, parameterized over a
 * language bundle.
 *
 * This is NOT communicating's operation surface (that is `actions(bundle)`, the
 * meme-transforming morphisms and membrane readings). These are
 * the `decode_L` codec actions: the ONLY place raw text is admitted as an operation.
 * They are the former core text actions (read/articulate/settle) reclassified as a
 * codec boundary and relocated out of the core operation surface — their bodies are
 * the rich machinery the package still exports (read/projectReading/articulate/settle),
 * now read over a concrete language bundle.
 *
 * A `@red-cup-engineering/communicating-in-<language>` package spreads `codecActions(itsBundle)`
 * alongside `actions(itsBundle)` so its discovery apex exposes both the language-neutral
 * meme operations and the language's own decode codec. The core itself injects no
 * bundle, so it exposes no codec actions; the codec exists only where a language is.
 */
import { type Action } from "@red-cup-engineering/relating";
import type { CompiledBundle } from "../speaking/listening/algebra/index.mjs";
/** decode-communication — admitted text → the holographic communication reading (decode_L). */
export declare const decodeCommunicationAction: (bundle: CompiledBundle) => Action;
/** articulate-communication — admitted text → the admitted communication articulation (decode_L step one). */
export declare const articulateCommunicationAction: (bundle: CompiledBundle) => Action;
/** settle-communication — admitted text → the settled parse reading (decode_L settled-parse stage). */
export declare const settleCommunicationAction: (bundle: CompiledBundle) => Action;
/**
 * The text↔meme decode codec actions over a chosen bundle. A language package spreads
 * these alongside `actions(bundle)` so raw text can be admitted into the substrate.
 * The core operation surface (`actions`) contains NONE of these — text is a codec,
 * not an operation.
 */
export declare const codecActions: (bundle: CompiledBundle) => readonly Action[];
//# sourceMappingURL=codec-actions.d.mts.map