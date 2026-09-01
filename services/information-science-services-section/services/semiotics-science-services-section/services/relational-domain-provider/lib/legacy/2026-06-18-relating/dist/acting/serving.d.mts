/**
 * acting/serving — the four transports as functorial images of the apex.
 *
 * `induceBins` gives one `InducedBins` carrier (the coproduct apex of a module's
 * actions). This module projects it, with no second ontology, to:
 *   - CLI         — `dispatch` (elsewhere; the `relate` bin)
 *   - HTTP        — `POST /:verb` (body→stdin, stdout→response), `GET /` discovery, `GET /health`
 *   - OpenAPI     — `GET /openapi.json` (a 3.1.1 document derived from the actions)
 *   - MCP         — `POST /mcp` (tools, resources, and prompts over one apex)
 *   - web UX      — `GET /:verb` (a basic HTML form) and `GET /` (the index)
 *
 * The MCP projection is the full standard knowledge-vault surface: `tools/list`
 * and `tools/call` run the morphisms; `resources/list` and `resources/read`
 * serve the package's schemas and discovery carrier; `prompts/list` and
 * `prompts/get` serve the guided per-action (and registered) prompts. All three
 * are functorial images of the same `induceBins` apex — no second ontology.
 *
 * Every routed POST goes through `dispatch`, so an HTTP/MCP/form call is a
 * scripted play and is witnessed as EAVT exactly like a CLI call. Pure routing
 * (`routeRequest`) is separated from the thin `node:http` binding (`serve`).
 */
import { type Server } from "node:http";
import type { Action } from "./action.mjs";
import type { ActionDiscovery, ActionEndpoint, InducedBins } from "./induce.mjs";
import type { DispatchOptions } from "./dispatch.mjs";
/** A routed response: status, content type, and body. */
export interface ServedResponse {
    readonly status: number;
    readonly type: string;
    readonly body: string;
}
/** A routed request: method, path, query string, and body. */
export interface ServedRequest {
    readonly method: string;
    readonly path: string;
    readonly query: Readonly<Record<string, string>>;
    readonly body: string;
}
/** Options for serving (the witnessing data root flows to dispatch). */
export interface ServeOptions extends DispatchOptions {
    readonly basePath?: string;
    readonly title?: string;
    readonly version?: string;
}
export declare const json: (value: unknown, status?: number) => ServedResponse;
export declare const html: (body: string, status?: number) => ServedResponse;
export declare const text: (body: string, status: number) => ServedResponse;
/** The OpenAPI 3.1.1 document derived from the discovery carrier. */
export declare function actionOpenApi(induced: InducedBins, options?: ServeOptions): Record<string, unknown>;
/** The MCP tools list derived from the actions (one tool per verb). */
export declare function actionMcpTools(actions: readonly Action[]): readonly Record<string, unknown>[];
/** The MCP resources list derived from the apex (schemas, discovery, registered). */
export declare function actionMcpResources(induced: InducedBins): readonly Record<string, unknown>[];
/** The MCP prompts list derived from the apex (per-action + registered). */
export declare function actionMcpPrompts(induced: InducedBins): readonly Record<string, unknown>[];
/** Handle one MCP JSON-RPC message against the induced actions. */
export declare function actionMcpHandle(induced: InducedBins, message: unknown, options: ServeOptions): Record<string, unknown> | undefined;
/** The HTML form for one endpoint (web UX: a textarea for the input, submit POSTs it). */
export declare function actionFormHtml(endpoint: ActionEndpoint, base: string): string;
/** The HTML index of all operations (web UX). */
export declare function actionIndexHtml(discovery: ActionDiscovery, base: string): string;
/** Route one request against the induced actions — the pure transport projection. */
export declare function routeRequest(induced: InducedBins, request: ServedRequest, options?: ServeOptions): ServedResponse;
/** One module mounted in a manifold: a name and its induced apex. */
export interface ManifoldMount {
    readonly name: string;
    readonly induced: InducedBins;
}
/** The `$ref` of a schema slot, when it names a carrier by `$id`. */
export declare function slotRef(schema: import("../codecs/json.mjs").JsonRecord | undefined): string | undefined;
/** The carrier `$id`s a module's actions emit (`codomainSchema.$ref`). */
export declare function producedIds(induced: InducedBins): ReadonlySet<string>;
/** The carrier `$id`s a module's actions admit (`domainSchema.$ref`). */
export declare function consumedIds(induced: InducedBins): ReadonlySet<string>;
/** Do any of `b`'s consumed carrier ids appear among `a`'s produced ids? */
export declare function feeds(a: InducedBins, b: InducedBins): boolean;
/** The tiled basePath of each mount, keyed by name. A module mounts under a
 *  producer of its domain carrier (`/<producer>/<module>`); a source with no
 *  internal producer mounts at the root (`/<module>`). The path spells the
 *  composition. Resolution is order-independent and cycle-safe: an unplaceable
 *  module (its producer cycles, or isn't placed) falls back to a root mount. */
export declare function tileManifold(mounts: readonly ManifoldMount[]): ReadonlyMap<string, string>;
/** Route one request against a manifold of tiled mounts — the pure projection.
 *  Selects the longest tiled basePath that prefixes the path and delegates to that
 *  mount's `routeRequest`; `serve`/`routeRequest` are reused unchanged. */
export declare function routeManifold(mounts: readonly ManifoldMount[], request: ServedRequest, options?: ServeOptions): ServedResponse;
/** Bind a manifold of mounts to a node:http server: one origin, many tiled modules. */
export declare function serveManifold(mounts: readonly ManifoldMount[], options?: ServeOptions): Server;
/** Bind the router to a node:http server. The single transport binding. */
export declare function serve(actions: readonly Action[], options?: ServeOptions & {
    readonly induced?: InducedBins;
}): Server;
//# sourceMappingURL=serving.d.mts.map