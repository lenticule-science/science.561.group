export interface ActionCarrier {
    readonly codomainSchema?: unknown;
    readonly description?: string;
    readonly domainSchema?: unknown;
    readonly inputFormat: string;
    readonly kind: "relating.action";
    readonly options: ReadonlyArray<string>;
    readonly outputFormat: string;
    readonly summary?: string;
    readonly verb: string;
}
//# sourceMappingURL=action.schema.types.d.mts.map