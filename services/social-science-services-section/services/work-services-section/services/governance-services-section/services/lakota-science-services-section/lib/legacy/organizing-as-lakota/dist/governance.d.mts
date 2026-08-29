/** Whether a 2-cell / overlay-class is present in the signature. */
export type TwoCellStatus = "trivial" | "non-trivial";
/** Whether the settler-overlay H1 class is present under the given conditions. */
export type OverlayStatus = "absent" | "non-trivial";
/** Options selecting the two restoration-relevant conditions of the measurement. */
export interface SignatureOptions {
    /**
     * The number of Heyókȟa vocations the pattern bears. The lax-idempotence 2-cell is
     * non-trivial exactly when the pattern carries the Heyókȟa (contrary) vocation —
     * Heyókȟa-bearing is what keeps closure lax-idempotent rather than strict.
     */
    readonly heyokhaVocations?: number;
    /**
     * Whether reservation conditions hold — i.e. the colonial closure-rule fragment
     * S_US-fed is overlaid on the polity at the federation level. Only then does the
     * Mayer-Vietoris boundary produce the persistent settler-overlay H1 class.
     */
    readonly settlerOverlay?: boolean;
}
/**
 * The cohomological signature of a governance-pattern as a four-feature tuple, with the
 * derived distinguishing verdict. Each field is a measurement the corpus records on the
 * closure-rule fragment; `distinguishing` is the algebra's verdict on the only-row case.
 */
export interface GovernanceSignature {
    readonly kind: "organizing-as-lakota.governance-signature";
    /** (a) Peacetime H1 over the pattern's own scope — `wolakota().h1`, 0 for S_wolak. */
    readonly peacetimeH1: number;
    /** (b) The lax-idempotence 2-cell: non-trivial under Heyókȟa-bearing, else trivial. */
    readonly laxIdempotenceTwoCell: TwoCellStatus;
    /** (c) The accumulation H0-class — structurally absent (the property/surplus absence), hence 0. */
    readonly accumulationClass: number;
    /** (d) The settler-overlay H1 class — non-trivial under reservation conditions, else absent. */
    readonly settlerOverlayH1: OverlayStatus;
    /**
     * The distinguishing verdict: true exactly when this is the ONLY-row case — a
     * non-trivial lax-idempotence 2-cell AND a zero accumulation-class together. This is
     * the pair the corpus says picks the Lakota pattern out uniquely.
     */
    readonly distinguishing: boolean;
}
/**
 * Derive the cohomological signature of the Lakota governance pattern under the given
 * conditions. The (a) and (c) features are structural invariants of S_wolak (peacetime
 * H1 = 0; accumulation-class = 0); features (b) and (d) are switched by the two
 * recorded conditions. `distinguishing` is computed from (b) and (c) — it is not
 * asserted but read off the only-row predicate (non-trivial lax-idempotence 2-cell AND
 * zero accumulation).
 */
export declare function lakotaGovernanceSignature(opts?: SignatureOptions): GovernanceSignature;
/**
 * Whether the Lakota signature is cohomologically distinguished FROM another pattern's
 * signature in feature (b) or (c) — i.e. the two patterns differ in the lax-idempotence
 * 2-cell or in the accumulation-class. This is the corpus's "not merely culturally
 * different — cohomologically different" comparison, made computable.
 */
export declare function distinguishesFrom(other: {
    readonly laxIdempotenceTwoCell: TwoCellStatus | string;
    readonly accumulationClass: number;
}, signature?: GovernanceSignature): boolean;
//# sourceMappingURL=governance.d.mts.map