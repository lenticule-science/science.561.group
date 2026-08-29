/**
 * acting/mounting — the carrier-node mounting layer: a four-faced apex at every
 * carrier `$id`-node of a served subtree.
 *
 * `routeManifold`/`tileManifold` tile mounts by *module tail* — a consumer mounts
 * under whatever produces its domain carrier, so the URL spells the data-flow
 * composition. This layer generalizes that: it addresses each mount by the carrier
 * node its domain acts ON, mounting at the carrier's bare `$id` descent path (the
 * `$id` IS the path; refactor decision #1). Every carrier node then gets the four
 * faces — `GET /`, `GET /:verb`, `POST /:verb`, `GET /openapi.json`, `POST /mcp`,
 * `GET /health`, `GET /discovery` — for free, because routing delegates to the
 * existing `routeRequest` at the node's base path with NO per-node hand-wiring.
 *
 * The "carrier $id a mount acts on" is read from its actions' `domainSchema.$ref`
 * (the same `$id` match `tileManifold` already uses). A mount with no resolvable
 * domain carrier (a pure source) falls back to the existing module-tail placement
 * via `tileManifold`, so there is no regression: carrier-node match → mount at the
 * `$id` path; else → module-tail path. Both kinds coexist in one map.
 *
 * Everything here is additive and pure. The single `node:http` binding
 * (`serveCarrierManifold`) is a thin clone of `serveManifold` that calls
 * `routeCarrierManifold` instead of `routeManifold`.
 */
import { type Server } from "node:http";
import { type InducedBins } from "./induce.mjs";
import type { SchemaRegistry } from "../typing/registry.mjs";
import { type ServedRequest, type ServedResponse, type ServeOptions } from "./serving.mjs";
/** A carrier-node mount: a guest apex plus the carrier `$id` its domain acts on. */
export interface CarrierMount {
    readonly name: string;
    readonly induced: InducedBins;
    /** The carrier `$id`-path this mount mounts AT (its domain carrier). When omitted,
     *  derived from the mount's actions' domain slots (see `domainNodeOf`). */
    readonly nodeId?: string;
}
/** One node of the namespace tree: a carrier `$id`-path and the mounts at it. */
export interface CarrierNode {
    readonly id: string;
    readonly path: string;
    readonly mounts: readonly CarrierMount[];
    readonly endo: boolean;
}
/** The mount's domain carrier `$id` — the node it mounts at. Deterministic
 *  (first by sort) when several domain carriers are referenced. Undefined for a
 *  pure source (no domain `$ref`). */
export declare function domainNodeOf(induced: InducedBins): string | undefined;
/** True iff the mount both consumes and produces `nodeId` — the self-loop case
 *  (communicating is endomorphic on the meme carrier: meme in, meme out). */
export declare function isEndoMount(induced: InducedBins, nodeId: string): boolean;
/** Build the namespace tree from carrier `$id`s. The node-id universe is every
 *  registered `$id` (when a registry is passed) plus every domain/codomain `$id`
 *  any mount references, so even a carrier the host did not pre-register gets a
 *  node. Mounts are bucketed by their `nodeId`; a registry node with no mounts is
 *  still materialized (an empty, navigable carrier node) so the tree is whole.
 *  Returned sorted by path length descending — longest-base-first for routing. */
export declare function carrierNodeTree(mounts: readonly CarrierMount[], registry?: SchemaRegistry): readonly CarrierNode[];
/** The base path of each mount, keyed by name — the generalization of
 *  `tileManifold`. A mount whose domain resolves to a carrier node mounts at that
 *  carrier's `$id` path (`/<id>`); a mount with no resolvable domain carrier (a
 *  pure source) falls back to the existing module-tail placement via
 *  `tileManifold` for exactly those unplaceable mounts. Both kinds coexist. */
export declare function tileCarrierNodes(mounts: readonly CarrierMount[], registry?: SchemaRegistry): ReadonlyMap<string, string>;
/** The HTML index of the whole namespace: every node at its `$id` path, with the
 *  mount package names and `↻` for self-loops — the space navigable as one. */
export declare function carrierManifoldIndexHtml(nodes: readonly CarrierNode[]): string;
/** One four-faced apex over several guests co-mounted at one node: the coproduct
 *  of their actions through the existing `induceBins`. The node-level `GET /`,
 *  `GET /openapi.json`, and `POST /mcp` are projected from this pooled apex; each
 *  individual POST still dispatches through the OWNING mount so witnessing lands
 *  in the right per-package ledger. */
export declare function aggregateNodeApex(mounts: readonly CarrierMount[], nodeId: string): InducedBins;
/** Route one request against a carrier manifold — the pure projection that
 *  generalizes `routeManifold` to carrier-node base paths. Selects the longest
 *  carrier-node base that prefixes the path and delegates to that node's apex via
 *  the unchanged `routeRequest`, which supplies the four faces. Co-mounted guests
 *  at one node are disambiguated by verb for POST/`:verb`; `GET /`, OpenAPI, and
 *  MCP at the node go through the pooled apex (`aggregateNodeApex`). */
export declare function routeCarrierManifold(mounts: readonly CarrierMount[], request: ServedRequest, options?: ServeOptions, registry?: SchemaRegistry): ServedResponse;
/** Bind a carrier manifold to a node:http server — a thin clone of
 *  `serveManifold` that routes through `routeCarrierManifold`. */
export declare function serveCarrierManifold(mounts: readonly CarrierMount[], options?: ServeOptions, registry?: SchemaRegistry): Server;
//# sourceMappingURL=mounting.d.mts.map