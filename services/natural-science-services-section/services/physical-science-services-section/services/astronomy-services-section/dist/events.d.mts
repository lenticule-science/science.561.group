export type CrossingDirection = "increasing" | "decreasing";
export type Crossing = Readonly<{
    /** Julian day (TT) of the crossing. */
    julianDay: number;
    direction: CrossingDirection;
}>;
export type ScanOptions = Readonly<{
    /** Sampling step in days; must be well under the function's half-period. */
    stepDays: number;
    /** Bisection tolerance in days. */
    toleranceDays?: number;
}>;
/**
 * Find the zero crossings of a continuous function of Julian day on
 * [jdStart, jdEnd]: scan at stepDays, bisect each sign-changing bracket.
 */
export declare function findZeroCrossings(fn: (julianDay: number) => number, jdStart: number, jdEnd: number, options: ScanOptions): readonly Crossing[];
/**
 * Find the moments a circular function (degrees on R/360°) crosses a target
 * value. The scan step must keep successive samples within ±90° of each other
 * around the target so the local chart signedArc(target, value) stays
 * continuous across each bracket.
 */
export declare function findCircleCrossings(fn: (julianDay: number) => number, targetDegrees: number, jdStart: number, jdEnd: number, options: ScanOptions): readonly Crossing[];
