export type Body = "sun" | "moon" | "mercury" | "venus" | "mars" | "jupiter" | "saturn" | "uranus" | "neptune" | "pluto";
export declare const BODIES: readonly Body[];
export declare const BODY_GLYPHS: Readonly<Record<Body, string>>;
export type BodyState = Readonly<{
    /** Geocentric ecliptic longitude of date, degrees in [0, 360). */
    longitude: number;
    /** Geocentric ecliptic latitude, degrees. */
    latitude: number;
    /** dLongitude/dt in degrees per day; negative is apparent retrograde. */
    speed: number;
}>;
export type Motion = "direct" | "stationary" | "retrograde";
/** Below this |speed| (degrees/day) a body reads as stationary. */
export declare const STATIONARY_BAND = 0.003;
export declare function motionOf(state: Pick<BodyState, "speed">): Motion;
export type ChartProvenance = Readonly<{
    /** Name of the computation that produced the states. */
    algorithm: string;
    /** Honest accuracy claims, per body class, in the algorithm's own terms. */
    accuracy: string;
}>;
export type Chart = Readonly<{
    /** The instant, as an ISO 8601 UTC timestamp. */
    time: string;
    /** Julian day (terrestrial time) the states were evaluated at. */
    julianDay: number;
    bodies: Readonly<Record<Body, BodyState>>;
    provenance: ChartProvenance;
}>;
