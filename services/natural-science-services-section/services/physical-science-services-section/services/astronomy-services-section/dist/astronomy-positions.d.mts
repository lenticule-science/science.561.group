import { computeChart } from "./ephemeris.mts";
import { type Body } from "./positions.mts";
/** The interval in which the underlying approximate-elements fit is qualified. */
export declare const ASTRONOMY_POSITIONS_RANGE: Readonly<{
    minYear: 1800;
    maxYear: 2050;
}>;
/** Conservative angular bounds, in degrees, for the published numerical model. */
export declare const ASTRONOMY_POSITION_ACCURACY_DEGREES: Readonly<Record<Body, number>>;
/**
 * Validate an ISO instant and canonicalize it to UTC before numerical work.
 * The range is an accuracy boundary, not a calendar limitation.
 */
export declare function normalizeInstant(value: string | Date): string;
export type AstronomyPositions = Readonly<{
    tier: "astronomy-positions";
    time: string;
    frame: "geocentric ecliptic-of-date, tropical, apparent";
    bodies: Readonly<Record<Body, Readonly<{
        longitude: number;
        latitude: number;
        speed: number;
    }>>>;
    lunarPhase: Readonly<{
        elongation: number;
        illuminatedFraction: number;
        trend: "waxing" | "waning";
    }>;
    provenance: ReturnType<typeof computeChart>["provenance"];
    accuracy: Readonly<{
        perBodyDegrees: Readonly<Record<Body, number>>;
        method: string;
        validRange: string;
    }>;
}>;
/**
 * Pure positional-astronomy response for any consumer. It deliberately has
 * no zodiac, aspect, house, or interpretive field.
 */
export declare function computeAstronomyPositions(value: string | Date): AstronomyPositions;
