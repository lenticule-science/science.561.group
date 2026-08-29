/**
 * @emsenn/organizing-a-newswire
 *
 * A newswire is one provenanced claim stream. It owns wire-local bundle state,
 * item projection, production writes, and web-free wire surfaces.
 */
import { type FromSchema, type Tm } from "@emsenn/relating";
import type { Newswire, NewswireConfig } from "@emsenn/producing-content/cable";
export { addDays, assertedNow, auditOf, claimLine, computesClaim, createNewswire, freshnessOf, htmlPage, itemSummary, itemTitle, loadWireBundles, newswireDescription, newswireDescriptionCarrier, newswireDescriptionTerm, NewswireDescriptionSchema, projectItem, propositionText, publishedOf, readBundleFile, reportWrite, resolveDate, sortReverseChronological, updatedOf, WireSurfaceUrlsSchema, wireSurfaceUrls, wireSurfaceUrlsCarrier, wireSurfaceUrlsTerm, writeBundleIfAbsent, type ComputedClaimInput, type NewscableSiteConfig, type Newswire, type NewswireAuthor, type NewswireBlock, type NewswireConfig, type NewswireDefinition, type NewswireDescription, type NewswireOptions, type RenderDocument, type RenderLink, type StoredBundle, type WireAuditEntry, type WireCorrection, type WireItem, type WireSurface, type WireSurfaceUrls, type WriteOutcome, } from "@emsenn/producing-content/cable";
export declare const ProducingNewswireSchema: {
    readonly $id: "producing/newswire";
    readonly title: "ProducingNewswire";
    readonly type: "object";
    readonly required: readonly ["kind", "name", "title", "store", "authorName", "itemCount"];
    readonly properties: {
        readonly kind: {
            readonly const: "producing.newswire";
        };
        readonly name: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly title: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly store: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly authorName: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly itemCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
    };
    readonly additionalProperties: false;
};
export type ProducingNewswire = FromSchema<typeof ProducingNewswireSchema>;
export declare const producingNewswireCarrier: import("@emsenn/relating").DataCarrier<{
    readonly kind: "producing.newswire";
    readonly name: string;
    readonly title: string;
    readonly store: string;
    readonly authorName: string;
    readonly itemCount: number;
}>;
export declare function producingNewswire(input: Readonly<{
    config: NewswireConfig;
    wire: Newswire;
}>): ProducingNewswire;
export declare function producingNewswireTerm(input: ProducingNewswire): Tm;
//# sourceMappingURL=index.d.mts.map