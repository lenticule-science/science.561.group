export type PlanetName = "mercury" | "venus" | "embary" | "mars" | "jupiter" | "saturn" | "uranus" | "neptune" | "pluto";
export type OrbitalElements = Readonly<{
    /** Semi-major axis, au: [value at J2000, rate per century]. */
    a: readonly [number, number];
    /** Eccentricity: [value, rate]. */
    e: readonly [number, number];
    /** Inclination, degrees: [value, rate]. */
    i: readonly [number, number];
    /** Mean longitude, degrees: [value, rate]. */
    l: readonly [number, number];
    /** Longitude of perihelion, degrees: [value, rate]. */
    lonPeri: readonly [number, number];
    /** Longitude of the ascending node, degrees: [value, rate]. */
    lonNode: readonly [number, number];
}>;
export declare const PLANET_ELEMENTS: Readonly<Record<PlanetName, OrbitalElements>>;
export type LunarSeriesTerm = readonly [number, number, number, number, number];
export declare const LUNAR_LONGITUDE_SERIES: readonly LunarSeriesTerm[];
export declare const LUNAR_LATITUDE_SERIES: readonly LunarSeriesTerm[];
