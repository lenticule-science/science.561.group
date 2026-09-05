/**
 * @emsenn/organizing-a-newscable
 *
 * A newscable bundles newswires. It owns the sheath: routing inversion, cable
 * directory, cable index, ingest, and source-roll readings over configured
 * wires.
 */
import { type FromSchema, type Tm } from "@emsenn/relating";
import type { Newscable, NewscableSiteConfig } from "@emsenn/producing-content/cable";
export { DEFAULT_WIRE_STORE, CableRoutingSchema, NEWSCABLE_CONFIG_BLOCK, NewscableSiteConfigSchema, NewswireDescriptionSchema, NewswireAuthorSchema, NewswireConfigSchema, SourceRollSchema, SourceRollSourceSchema, SourceRollWireSchema, aggregateWires, assertNewscableBlock, assertNewswireBlock, CableDirectorySchema, cableDirectory, cableDirectoryCarrier, cableDirectoryTerm, createNewscable, ingestCableFromConfig, ingestWire, newscableSiteConfig, newscableSiteConfigCarrier, newscableSiteConfigTerm, newswireDescription, newswireDescriptionCarrier, newswireDescriptionTerm, newswireConfig, newswireConfigCarrier, newswireConfigTerm, readNewscableSiteConfig, sourceRollCarrier, sourceRollReading, sourceRollSource, sourceRollSourceCarrier, sourceRollSourceTerm, sourceRollTerm, sourceRollWire, sourceRollWireCarrier, sourceRollWireTerm, WireSurfaceUrlsSchema, wireSurfaceUrls, wireSurfaceUrlsCarrier, wireSurfaceUrlsTerm, type CableDirectory, type IngestResult, type Newscable, type NewscableOptions, type NewscableSiteConfig, type NewscableSiteConfigCarrier, type NewswireAuthorCarrier, type NewswireBlock, type NewswireConfig, type NewswireConfigCarrier, type RenderDocument, type SourceRollClassification, type SourceRollClassifier, type SourceRollOptions, type SourceRollReading, type SourceRollSource, type SourceRollWire, } from "@emsenn/producing-content/cable";
export { producingNewswire, producingNewswireCarrier, producingNewswireTerm, type ProducingNewswire, } from "@emsenn/organizing-a-newswire";
export declare const OrganizedNewscableSchema: {
    readonly $id: "organizing/newscable";
    readonly title: "OrganizedNewscable";
    readonly type: "object";
    readonly required: readonly ["kind", "name", "title", "domain", "wireCount", "itemCount"];
    readonly properties: {
        readonly kind: {
            readonly const: "organizing.newscable";
        };
        readonly name: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly title: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly domain: {
            readonly minLength: 1;
            readonly type: "string";
        };
        readonly wireCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
        readonly itemCount: {
            readonly minimum: 0;
            readonly type: "integer";
        };
    };
    readonly additionalProperties: false;
};
export type OrganizedNewscable = FromSchema<typeof OrganizedNewscableSchema>;
export declare const organizedNewscableCarrier: import("@emsenn/relating").DataCarrier<{
    readonly kind: "organizing.newscable";
    readonly name: string;
    readonly title: string;
    readonly domain: string;
    readonly wireCount: number;
    readonly itemCount: number;
}>;
export declare function organizedNewscable(input: Readonly<{
    config: NewscableSiteConfig;
    cable: Newscable;
}>): OrganizedNewscable;
export declare function organizedNewscableTerm(input: OrganizedNewscable): Tm;
//# sourceMappingURL=index.d.mts.map