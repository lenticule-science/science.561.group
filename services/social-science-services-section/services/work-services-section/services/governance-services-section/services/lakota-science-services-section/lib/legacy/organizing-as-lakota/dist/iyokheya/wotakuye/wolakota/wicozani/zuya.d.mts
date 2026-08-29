/**
 * zuya — the war-expedition as a scope-bounded overlay (Zuyá / Ozúye), wičhózani tier.
 *
 * Corpus: content/_archive/existence/lakota/.../lakotaean-governance/.../zuya. A zuya is
 * a scope-bounded closure-rule subsystem 𝒮_zuya that OVERLAYS on 𝒮_wolak for the
 * duration of a specific scope-action. The load-bearing structural fact is
 * COMPOSITION-NOT-REPLACEMENT: 𝒮_total = 𝒮_wolak ∪ 𝒮_zuya, both firing at once. The
 * overlay ADDS enemy-engagement permissions (raid, capture, counting coup); it does NOT
 * suspend any rule of 𝒮_wolak. Kin-cells keep firing (warriors stay kin, even to kin in
 * the enemy polity); the four virtues are still evaluated; withdrawal stays available
 * (participation is consent-based per engagement); harm still installs repair-required
 * cells. The polity stays the polity during war — this is what distinguishes Lakota war
 * from total-war forms.
 *
 * Like the akicita, the overlay retracts at SCOPE-COMPLETION: when the objective is met
 * the war-permissions are withdrawn and 𝒮_total returns to 𝒮_wolak. A zuya is NOT a
 * Westphalian war-state (no continuous war-condition between polities), NOT extermination
 * (objectives are circumscribed), NOT total mobilization (warriors enroll voluntarily).
 * A joint zuya constituted at confederacy scope is what met the U.S. cavalry at the
 * Greasy Grass in 1876. lakotaTerm: "Zuyá".
 */
import { type Wolakota } from "../wolakota.mjs";
/** A zuya: the war-overlay composed onto the standing wólakȟota discipline. */
export interface Zuya {
    readonly kind: "organizing-as-lakota.zuya";
    /** The target polity-unit (the enemy-cell, in Π_std). */
    readonly enemy: string;
    /** The scope-action whose completion ends the zuya (a raid, a defense, a response to harm). */
    readonly objective: string;
    /** The war-leader. */
    readonly blotahunka: string;
    /** Whether the omníčiye that constituted it carried wakȟáŋ-witness (council-authorized vs ad-hoc revenge). */
    readonly wakhanMarked: boolean;
    /** Whether the scope is in progress — t while active, ⊥ once the objective completes. */
    readonly scopeActive: boolean;
    /** The overlay COMPOSES with, never replaces, the standing discipline (𝒮_total = 𝒮_wolak ∪ 𝒮_zuya). */
    readonly composesWith: Wolakota;
    /** The permissions the overlay ADDS for the scope. */
    readonly adds: readonly string[];
    /** What the overlay does NOT suspend — the polity stays the polity during war. */
    readonly doesNotSuspend: readonly string[];
}
/** Constitute a zuya: the war-overlay over the standing discipline, scope-active. */
export declare function constituteZuya(enemy: string, objective: string, blotahunka: string, wakhanMarked: boolean): Zuya;
/**
 * Complete the zuya's objective: the overlay retracts (scope-active → ⊥) and 𝒮_total
 * returns to 𝒮_wolak. The polity returns to its peacetime substrate.
 */
export declare function completeZuya(zuya: Zuya): Zuya;
//# sourceMappingURL=zuya.d.mts.map