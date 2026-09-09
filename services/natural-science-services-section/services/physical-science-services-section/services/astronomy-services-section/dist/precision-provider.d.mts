export declare const PRECISION_RANGE: Readonly<{
    minYear: 1972;
    maxYear: 2050;
}>;
export declare const DE440_SHA256 = "29915576d0a6555766b99485ac3056ee415e86df4fce282611c31afb329ad062";
export declare const OXIEPHEMERIS_VERSION = "0.1.1";
export type OxiEphemerisRequest = Readonly<{
    time: string;
    latitude: number;
    longitude: number;
    houseSystem?: string;
    rulership?: string;
    sidereal?: string;
}>;
export declare function normalizePrecisionAstronomyRequest(date: string | Date, options?: {
    latitude?: unknown;
    longitude?: unknown;
}): Readonly<{
    time: string;
    latitude: number;
    longitude: number;
}>;
export declare function oxiEphemerisArguments(request: OxiEphemerisRequest, ephemerisFile: string): string[];
export declare function executeOxiEphemeris(request: OxiEphemerisRequest, runtime?: Record<string, string | undefined>): Promise<any>;
export declare function computePrecisionAstronomyPositions(date: string | Date, options: {
    latitude?: unknown;
    longitude?: unknown;
}, dependencies?: {
    execute?: typeof executeOxiEphemeris;
    runtime?: Record<string, string | undefined>;
}): Promise<Readonly<{
    tier: "astronomy-precision-positions";
    time: string;
    location: Readonly<{
        latitudeDegreesNorth: number;
        longitudeDegreesEast: number;
    }>;
    metrology: Readonly<{
        coordinateFrame: "apparent geocentric ecliptic-of-date (true equinox)";
        ephemeris: "JPL DE440";
        ephemerisSha256: "29915576d0a6555766b99485ac3056ee415e86df4fce282611c31afb329ad062";
        supplier: "OxiEphemeris 0.1.1";
        supplierLicense: "Apache-2.0";
        qualification: "Raw numeric resolution is preserved. No unsupported universal uncertainty is inferred; per-body divergence from the independently implemented essentials engine is reported below.";
    }>;
    bodies: any;
    nodes: any;
    essentialsCrossCheck: {
        [k: string]: {
            essentialsLongitudeDegrees: number;
            precisionLongitudeDegrees: any;
            signedDifferenceDegrees: number;
            absoluteDifferenceArcminutes: number;
            withinEssentialsAuditedBound: boolean;
        };
    };
}>>;
