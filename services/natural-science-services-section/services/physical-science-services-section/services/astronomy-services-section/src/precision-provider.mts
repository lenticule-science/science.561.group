import { execFile } from "node:child_process";
import { promisify } from "node:util";
import { ASTRONOMY_POSITION_ACCURACY_DEGREES, computeAstronomyPositions, normalizeInstant } from "./astronomy-positions.mts";
import { BODIES } from "./positions.mts";

const executeFile = promisify(execFile);
export const PRECISION_RANGE = Object.freeze({ minYear: 1972, maxYear: 2050 });
export const DE440_SHA256 = "29915576d0a6555766b99485ac3056ee415e86df4fce282611c31afb329ad062";
export const OXIEPHEMERIS_VERSION = "0.1.1";

export type OxiEphemerisRequest = Readonly<{
  time: string;
  latitude: number;
  longitude: number;
  houseSystem?: string;
  rulership?: string;
  sidereal?: string;
}>;

function coordinate(value: unknown, name: string, low: number, high: number): number {
  const number = typeof value === "number" ? value : Number(value);
  if (!Number.isFinite(number) || number < low || number > high) throw new RangeError(`${name} must be a finite number from ${low} through ${high}`);
  return number;
}

export function normalizePrecisionAstronomyRequest(date: string | Date, options: { latitude?: unknown; longitude?: unknown } = {}) {
  const time = normalizeInstant(date);
  const year = new Date(time).getUTCFullYear();
  if (year < PRECISION_RANGE.minYear || year > PRECISION_RANGE.maxYear) throw new RangeError(`precision positions support ${PRECISION_RANGE.minYear}-${PRECISION_RANGE.maxYear} UTC`);
  return Object.freeze({ time, latitude: coordinate(options.latitude, "latitude", -90, 90), longitude: coordinate(options.longitude, "longitude", -180, 180) });
}

export function oxiEphemerisArguments(request: OxiEphemerisRequest, ephemerisFile: string): string[] {
  const args = ["chart", request.time, "--lat", String(request.latitude), `--lon=${request.longitude}`, "--system", request.houseSystem ?? "whole-sign", "--rulership", request.rulership ?? "traditional", "--de", ephemerisFile, "--format", "json"];
  if (request.sidereal) args.push("--sidereal", request.sidereal);
  return args;
}

export async function executeOxiEphemeris(request: OxiEphemerisRequest, runtime: Record<string, string | undefined> = process.env) {
  const binary = runtime.OXIEPH_BIN || "oxieph";
  if (!runtime.OXIEPH_DE) throw new Error("OXIEPH_DE must name the pinned JPL DE440 classic-binary ephemeris file");
  const { stdout } = await executeFile(binary, oxiEphemerisArguments(request, runtime.OXIEPH_DE), { encoding: "utf8", maxBuffer: 8 * 1024 * 1024, timeout: 15_000 });
  return JSON.parse(stdout);
}

function crossCheck(essentials: ReturnType<typeof computeAstronomyPositions>, chart: any) {
  const precise = new Map<string, any>(chart.bodies.map((body: any) => [body.body.toLowerCase(), body]));
  return Object.fromEntries(BODIES.map((body) => {
    const measured = precise.get(body);
    if (!measured) throw new Error(`precision supplier omitted ${body}`);
    let delta = ((measured.lon_deg - essentials.bodies[body].longitude) % 360 + 360) % 360;
    if (delta > 180) delta -= 360;
    return [body, { essentialsLongitudeDegrees: essentials.bodies[body].longitude, precisionLongitudeDegrees: measured.lon_deg, signedDifferenceDegrees: Number(delta.toFixed(8)), absoluteDifferenceArcminutes: Number((Math.abs(delta) * 60).toFixed(6)), withinEssentialsAuditedBound: Math.abs(delta) <= ASTRONOMY_POSITION_ACCURACY_DEGREES[body] }];
  }));
}

export async function computePrecisionAstronomyPositions(date: string | Date, options: { latitude?: unknown; longitude?: unknown }, dependencies: { execute?: typeof executeOxiEphemeris; runtime?: Record<string, string | undefined> } = {}) {
  const request = normalizePrecisionAstronomyRequest(date, options);
  const chart = await (dependencies.execute ?? executeOxiEphemeris)(request, dependencies.runtime);
  if (chart?.kind !== "natal" || !Array.isArray(chart.bodies)) throw new Error("precision supplier returned a non-chart payload");
  const fields = ["body", "lon_deg", "lat_deg", "lon_speed_deg_per_day", "lat_speed_deg_per_day", "distance_au", "light_time_days", "declination_deg", "retrograde", "out_of_bounds"];
  return Object.freeze({ tier: "astronomy-precision-positions", time: request.time, location: Object.freeze({ latitudeDegreesNorth: request.latitude, longitudeDegreesEast: request.longitude }), metrology: Object.freeze({ coordinateFrame: "apparent geocentric ecliptic-of-date (true equinox)", ephemeris: "JPL DE440", ephemerisSha256: DE440_SHA256, supplier: `OxiEphemeris ${OXIEPHEMERIS_VERSION}`, supplierLicense: "Apache-2.0", qualification: "Raw numeric resolution is preserved. No unsupported universal uncertainty is inferred; per-body divergence from the independently implemented essentials engine is reported below." }), bodies: Object.freeze(chart.bodies.map((body: any) => Object.fromEntries(fields.filter((field) => field in body).map((field) => [field, body[field]])))), nodes: chart.nodes, essentialsCrossCheck: crossCheck(computeAstronomyPositions(request.time), chart) });
}
