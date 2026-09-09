import { type Body, type Chart } from "./positions.mts";
export declare function bodyLongitude(body: Body, julianDayTt: number): number;
/** The apparent geocentric ecliptic longitude derivative, in degrees per day. */
export declare function bodyLongitudeSpeed(body: Body, julianDayTt: number): number;
export declare const EPHEMERIS_PROVENANCE: Readonly<{
    algorithm: "meeus-truncated-series + jpl-approximate-elements (zero-dependency)";
    accuracy: "Sun ≤0.02°; Moon ≤0.02°; planets a few arcminutes typical (audited worst cases vs astronomy-engine/VSOP87: Jupiter ≤0.10°, Saturn ≤0.18°) within 1800–2050. Lunar event times ~3 minutes; slow-planet events ~hours.";
}>;
/** The ephemeris as a chart: every body's state at one UTC instant. */
export declare function computeChart(isoUtc: string): Chart;
