import { execFile } from "node:child_process";
import { promisify } from "node:util";

import { ACCURACY_DEGREES, BODIES, computeEphemeris, normalizeInstant } from "./ephemeris-product.mjs";

const execFileAsync = promisify(execFile);

export const PRECISION_RANGE = Object.freeze({ minYear: 1972, maxYear: 2050 });
export const DE440_SHA256 = "29915576d0a6555766b99485ac3056ee415e86df4fce282611c31afb329ad062";
export const OXIEPHEMERIS_VERSION = "0.1.1";

const HOUSE_SYSTEMS = new Set([
  "placidus", "koch", "whole-sign", "equal", "porphyry", "regiomontanus", "campanus",
]);
const SIDEREAL_MODES = new Set(["fagan-bradley", "lahiri", "krishnamurti", "raman"]);
const RULERSHIPS = new Set(["traditional", "modern"]);

function finiteNumber(value, label, min, max) {
  const number = typeof value === "number" ? value : Number(value);
  if (!Number.isFinite(number) || number < min || number > max) {
    throw new RangeError(`${label} must be a finite number from ${min} through ${max}`);
  }
  return number;
}

function selected(value, allowed, label, fallback) {
  const choice = value ?? fallback;
  if (!allowed.has(choice)) throw new TypeError(`${label} must be one of: ${[...allowed].join(", ")}`);
  return choice;
}

export function normalizePrecisionRequest(date, options = {}) {
  const time = normalizeInstant(date);
  const year = new Date(time).getUTCFullYear();
  if (year < PRECISION_RANGE.minYear || year > PRECISION_RANGE.maxYear) {
    throw new RangeError(
      `precision moment supports ${PRECISION_RANGE.minYear}-${PRECISION_RANGE.maxYear} UTC (got year ${year}); ` +
      "the supplier's leap-second table does not admit earlier UTC instants",
    );
  }
  const latitude = finiteNumber(options.latitude, "latitude", -90, 90);
  const longitude = finiteNumber(options.longitude, "longitude", -180, 180);
  const houseSystem = selected(options.houseSystem, HOUSE_SYSTEMS, "houseSystem", "placidus");
  const rulership = selected(options.rulership, RULERSHIPS, "rulership", "traditional");
  const sidereal = options.sidereal === undefined || options.sidereal === null || options.sidereal === ""
    ? null
    : selected(options.sidereal, SIDEREAL_MODES, "sidereal", null);
  if ((houseSystem === "placidus" || houseSystem === "koch") && Math.abs(latitude) >= 66) {
    throw new RangeError(`${houseSystem} houses are refused at |latitude| >= 66; choose whole-sign or equal`);
  }
  return Object.freeze({ time, latitude, longitude, houseSystem, rulership, sidereal });
}

async function executeOxieph(request, runtime = process.env) {
  const binary = runtime.OXIEPH_BIN || "oxieph";
  const deFile = runtime.OXIEPH_DE;
  if (!deFile) throw new Error("OXIEPH_DE must name the pinned JPL DE440 classic-binary ephemeris file");
  const args = [
    "chart",
    request.time,
    "--lat", String(request.latitude),
    `--lon=${request.longitude}`,
    "--system", request.houseSystem,
    "--rulership", request.rulership,
    "--de", deFile,
    "--format", "json",
  ];
  if (request.sidereal) args.push("--sidereal", request.sidereal);
  const { stdout } = await execFileAsync(binary, args, {
    encoding: "utf8",
    maxBuffer: 8 * 1024 * 1024,
    timeout: 15_000,
  });
  return JSON.parse(stdout);
}

function signedAngularDelta(from, to) {
  let difference = ((to - from) % 360 + 360) % 360;
  if (difference > 180) difference -= 360;
  return difference;
}

function crossCheck(essentials, precisionChart) {
  const preciseBodies = new Map(precisionChart.bodies.map((body) => [body.body.toLowerCase(), body]));
  return Object.fromEntries(BODIES.map((body) => {
    const approximate = essentials.bodies[body];
    const precise = preciseBodies.get(body);
    if (!approximate || !precise) throw new Error(`precision supplier omitted ${body}`);
    const differenceDegrees = signedAngularDelta(approximate.longitude, precise.lon_deg);
    return [body, {
      essentialsLongitudeDegrees: approximate.longitude,
      precisionLongitudeDegrees: precise.lon_deg,
      signedDifferenceDegrees: Number(differenceDegrees.toFixed(8)),
      absoluteDifferenceArcminutes: Number((Math.abs(differenceDegrees) * 60).toFixed(6)),
      withinEssentialsAuditedBound: Math.abs(differenceDegrees) <= ACCURACY_DEGREES[body],
    }];
  }));
}

export async function computePrecisionMoment(date, options, { execute = executeOxieph, runtime = process.env } = {}) {
  const request = normalizePrecisionRequest(date, options);
  const [chart, essentials] = await Promise.all([
    execute(request, runtime),
    Promise.resolve(computeEphemeris(request.time)),
  ]);
  if (chart?.kind !== "natal" || !Array.isArray(chart.bodies)) {
    throw new Error("precision supplier returned a non-chart payload");
  }
  return {
    tier: "precision-moment",
    time: request.time,
    semanticLayers: {
      astronomy: {
        facts: [
          "epoch", "observer-location", "apparent-body-position", "angular-speed", "declination",
          "distance", "light-time", "lunar-node",
        ],
        authority: "JPL DE440-backed numerical computation",
      },
      astrology: {
        interpretations: [
          "zodiac-placement", "house-cusp", "chart-angle", "aspect", "sect", "lot",
          "essential-dignity", "element-modality-distribution",
        ],
        tradition: {
          zodiac: request.sidereal ? `sidereal:${request.sidereal}` : "tropical",
          houseSystem: request.houseSystem,
          rulership: request.rulership,
        },
      },
    },
    location: {
      latitudeDegreesNorth: request.latitude,
      longitudeDegreesEast: request.longitude,
    },
    configuration: {
      zodiac: request.sidereal ? "sidereal" : "tropical",
      siderealMode: request.sidereal,
      houseSystem: request.houseSystem,
      rulership: request.rulership,
    },
    metrology: {
      coordinateFrame: "apparent geocentric ecliptic-of-date (true equinox)",
      ephemeris: "JPL DE440",
      ephemerisSha256: DE440_SHA256,
      supplier: `OxiEphemeris ${OXIEPHEMERIS_VERSION}`,
      supplierLicense: "Apache-2.0",
      qualification:
        "Raw numeric resolution is preserved. No unsupported universal uncertainty is inferred; per-body divergence from the independently implemented essentials engine is reported below.",
    },
    chart,
    essentialsCrossCheck: crossCheck(essentials, chart),
  };
}
