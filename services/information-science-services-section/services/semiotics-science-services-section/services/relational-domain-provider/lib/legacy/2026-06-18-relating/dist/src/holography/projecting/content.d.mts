import type { EntityView, StateView } from "./state.mjs";
/** One projected content document: an entity, its file type, and its content. */
export interface ContentDocument {
    readonly entity: string;
    readonly type: string;
    readonly content: string;
}
/** How a view becomes content: the file type, the per-entity renderer, and the
 *  optional cut (the acceptance window over entities; default accepts all). */
export interface ContentProjection {
    readonly type: string;
    readonly render: (entity: string, view: EntityView) => string;
    readonly accept?: (entity: string, view: EntityView) => boolean;
}
/** The default content projection: markdown with YAML frontmatter, all entities. */
export declare const markdownContent: ContentProjection;
/** Project a view into per-entity content documents, keeping only the accepted
 *  cut. Order follows the view's entity order. */
export declare function projectContentDocuments(view: StateView, projection?: ContentProjection): readonly ContentDocument[];
//# sourceMappingURL=content.d.mts.map