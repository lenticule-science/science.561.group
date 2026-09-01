/**
 * The compiled Lakota bundle: the witnessed finite vocabulary the Lakota fiber is
 * read over. `load` (the fiber-algebra functor) lives in the base; this package
 * supplies only the language data and its compilation.
 */
import { compiledBundleFromLanguageManifest } from "@emsenn/communicating/speaking/listening/algebra";
import { manifest } from "./manifest.mjs";

/** Compiled Lakota bundle: raw fiber data lifted into a CompiledBundle. */
export const lakota = compiledBundleFromLanguageManifest(manifest);
export default lakota;
