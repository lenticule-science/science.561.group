/** Julian day of J2000.0, 2000-01-01T12:00:00 TT. */
export declare const J2000 = 2451545;
export declare function julianDayFromIso(iso: string): number;
export declare function isoFromJulianDay(julianDay: number): string;
/** ΔT = TT − UT in seconds, anchored at IERS 2026.45 (69.17 s), ~2015–2035. */
export declare function deltaTSeconds(julianDayUt: number): number;
/** The Julian day in terrestrial time for a UT Julian day. */
export declare function terrestrialJulianDay(julianDayUt: number): number;
/** Julian centuries of TT since J2000.0. */
export declare function julianCenturies(julianDayTt: number): number;
