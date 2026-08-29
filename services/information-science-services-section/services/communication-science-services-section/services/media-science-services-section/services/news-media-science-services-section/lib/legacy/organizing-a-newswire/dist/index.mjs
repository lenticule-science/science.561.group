/**
 * @emsenn/organizing-a-newswire
 *
 * A newswire is one provenanced claim stream. It owns wire-local bundle state,
 * item projection, production writes, and web-free wire surfaces.
 */
import { carrierFrom, carrierToTerm } from "@emsenn/relating";
import { jsonResource } from "@emsenn/relating/writing";
export { addDays, assertedNow, auditOf, claimLine, computesClaim, createNewswire, freshnessOf, htmlPage, itemSummary, itemTitle, loadWireBundles, newswireDescription, newswireDescriptionCarrier, newswireDescriptionTerm, NewswireDescriptionSchema, projectItem, propositionText, publishedOf, readBundleFile, reportWrite, resolveDate, sortReverseChronological, updatedOf, WireSurfaceUrlsSchema, wireSurfaceUrls, wireSurfaceUrlsCarrier, wireSurfaceUrlsTerm, writeBundleIfAbsent, } from "@emsenn/producing-content/cable";
export const ProducingNewswireSchema = {
    $id: "producing/newswire",
    title: "ProducingNewswire",
    type: "object",
    required: ["kind", "name", "title", "store", "authorName", "itemCount"],
    properties: {
        kind: { const: "producing.newswire" },
        name: { minLength: 1, type: "string" },
        title: { minLength: 1, type: "string" },
        store: { minLength: 1, type: "string" },
        authorName: { minLength: 1, type: "string" },
        itemCount: { minimum: 0, type: "integer" },
    },
    additionalProperties: false,
};
export const producingNewswireCarrier = carrierFrom(ProducingNewswireSchema);
function authorName(config) {
    if (typeof config.author === "string")
        return config.author;
    if (config.author !== undefined)
        return config.author.name;
    return config.title;
}
export function producingNewswire(input) {
    return producingNewswireCarrier.assert({
        kind: "producing.newswire",
        name: input.config.name,
        title: input.config.title,
        store: input.config.store,
        authorName: authorName(input.config),
        itemCount: input.wire.items.length,
    }, "producing newswire");
}
export function producingNewswireTerm(input) {
    return carrierToTerm(jsonResource(producingNewswireCarrier.assert(input), "producing newswire"));
}
//# sourceMappingURL=index.mjs.map