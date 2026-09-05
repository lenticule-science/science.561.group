import { type JsonValue } from "../../codecs/json.mjs";
import type { ContentDocument } from "./content.mjs";
import { type Datom, type EAVT, type EAVTRecord } from "../../codecs/eavt.mjs";
/** The projection-tier directories on disk. Free-form strings. `contentDir` is
 *  the optional fourth tier: the per-entity content cut projected from the bulk. */
export interface WitnessStore {
    readonly logDir: string;
    readonly stateDir: string;
    readonly recordDir: string;
    readonly contentDir?: string;
}
/** The flat leaf path of a feed's file under a tier directory. */
export declare function feedPath(dir: string, feed: string, type: string): string;
/** Atomically write content: temp file + rename (atomic on POSIX), so a crash
 *  mid-write never corrupts the target. */
export declare function writeFileAtomic(filePath: string, content: string): void;
/** Append records as newline-delimited canonical JSON. Best-effort (advisory):
 *  write errors are swallowed, never thrown. No-op on empty input. */
export declare function appendJsonl(filePath: string, records: readonly unknown[]): void;
/** Read newline-delimited JSON, skipping malformed lines; a missing file is []. */
export declare function readJsonl<T = JsonValue>(filePath: string): T[];
/** Read a single JSON document, or null if absent/unreadable. */
export declare function readJsonFile<T = JsonValue>(filePath: string): T | null;
/** Ensure all tier directories exist (the content tier only when configured). */
export declare function ensureStoreDirs(store: WitnessStore): void;
/** Atomically write one content document to its term address under the content
 *  tier (`<contentDir>/<term>/<term>.<type>`); returns the path written. A view's
 *  entity key is canonical JSON (how `projectStateView` keys the bulk), so it is
 *  decoded back to its term before addressing; a non-JSON key is used verbatim. */
export declare function writeContentDocument(store: WitnessStore, document: ContentDocument): string;
/** Read a feed's witness log as normalized EAVT records. Missing file yields []. */
export declare function readWitnessLog(store: WitnessStore, feed: string): EAVTRecord[];
/** Append only the witnesses not already present (by content identity). Returns
 *  how many rows were genuinely new — the per-tick growth signal. */
export declare function appendWitnesses(store: WitnessStore, feed: string, rows: readonly (EAVT | EAVTRecord)[]): {
    readonly appended: number;
};
/** Atomically write a JSON snapshot to `<dir>/<feed>.<type>`. */
export declare function writeJsonAtomic(dir: string, feed: string, value: JsonValue, type?: string): void;
/** Commit a settled projection: append its Datoms to the record tier and
 *  atomically rewrite the log to the compacted (kept) rows. No-op when empty. */
export declare function commitRecord(store: WitnessStore, feed: string, datoms: readonly Datom[], keptLog: readonly EAVTRecord[]): void;
//# sourceMappingURL=store.d.mts.map