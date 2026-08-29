import { type FromSchema, type Tm } from "@emsenn/relating";
import { type DailyIndicatorsRecord } from "@emsenn/divining/divination/codecs";
import { type ClaimStateBundle, type NewsClaimSet } from "@emsenn/producing-content/topology/news";
export declare const DivinationNewswireProjectionSchema: {
    readonly $id: "producing-a-newswire/divination/projection";
    readonly type: "object";
    readonly title: "DivinationNewswireProjection";
    readonly required: readonly ["kind", "date", "subject", "claimCount", "sourceKinds"];
    readonly properties: {
        readonly kind: {
            readonly const: "producing-a-newswire.divination.projection";
        };
        readonly date: {
            readonly type: "string";
            readonly pattern: "^\\d{4}-\\d{2}-\\d{2}$";
        };
        readonly subject: {
            readonly type: "string";
            readonly minLength: 1;
        };
        readonly claimCount: {
            readonly type: "integer";
            readonly minimum: 0;
        };
        readonly sourceKinds: {
            readonly type: "array";
            readonly items: {
                readonly type: "string";
                readonly minLength: 1;
            };
        };
    };
    readonly additionalProperties: false;
};
export type DivinationNewswireProjection = FromSchema<typeof DivinationNewswireProjectionSchema>;
export declare const divinationNewswireProjectionCarrier: import("@emsenn/relating").DataCarrier<{
    readonly kind: "producing-a-newswire.divination.projection";
    readonly date: string;
    readonly subject: string;
    readonly claimCount: number;
    readonly sourceKinds: readonly string[];
}>;
export type DivinationNewswireBundle = Readonly<{
    projection: DivinationNewswireProjection;
    bundle: ClaimStateBundle;
}>;
export type DivinationNewswireOptions = Readonly<{
    subjectPrefix?: string;
    assertedAt?: string;
    witness?: string;
    citationBase?: string;
    status?: "published" | "draft";
}>;
export declare function divinationIndicatorsClaimStateBundle(indicators: DailyIndicatorsRecord, options?: DivinationNewswireOptions): DivinationNewswireBundle;
export declare function divinationIndicatorsClaimSet(bundle: ClaimStateBundle): NewsClaimSet;
export declare function writeDivinationNewswireBundle(storeDir: string, indicators: DailyIndicatorsRecord, options?: DivinationNewswireOptions & Readonly<{
    overwrite?: boolean;
}>): DivinationNewswireBundle;
export declare function readDailyIndicatorsFile(path: string): DailyIndicatorsRecord;
export declare function readDivinationIndicatorFiles(dir: string): readonly DailyIndicatorsRecord[];
export declare function divinationNewswireBundlesFromIndicatorsDir(dir: string, options?: DivinationNewswireOptions): readonly DivinationNewswireBundle[];
export declare function divinationNewswireProjectionTerm(input: DivinationNewswireProjection): Tm;
export declare function subjectDate(subject: string): string;
//# sourceMappingURL=index.d.mts.map