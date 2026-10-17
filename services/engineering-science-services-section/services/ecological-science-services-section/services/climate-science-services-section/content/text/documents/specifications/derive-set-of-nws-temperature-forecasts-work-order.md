---
title: derive-set-of-nws-temperature-forecasts
description: const DEFAULTBASEURL = "https://api.weather.gov"; const DEFAULTUSERAGENT = "(561-group forecast-weather-markets loop, ops@561.group)";
---
# derive-set-of-nws-temperature-forecasts
## Requirements
- `fetches-nws-point-forecast`: For each declared city station, the operation reads api.weather.gov's public GET /gridpoints/{gridId}/{gridX},{gridY}/forecast endpoint to obtain the forecast high temperature for the bracket's close date.
- `probability-from-normal-error-model`: For each declared market bracket, the operation computes the house probability that the settled temperature lands inside the bracket from the fetched forecast high (as the normal distribution's mean) and a declared per-lead-time standard deviation, using the closed-form normal CDF.
- `groups-station-calls-by-city-and-date`: The operation issues at most one api.weather.gov forecast request per distinct city-station-and-close-date pair, reusing the fetched forecast across every bracket sharing that pair.
- `descriptive-user-agent-sent`: Every api.weather.gov request the operation sends carries a declared, descriptive User-Agent header, per NWS API usage requirements.
- `injectable-network-call`: The operation accepts an injectable fetch implementation defaulting to the global fetch, so callers and tests can supply fixtures instead of live HTTP.
## Prohibitions
- `refuses-unmapped-city`: The operation must refuse a bracket whose city is not present in the declared cityStations mapping.
- `refuses-malformed-request`: The operation must refuse a request whose cityStations or brackets are not arrays, or whose asOf is not a parseable ISO 8601 timestamp.
- `no-forecast-invention`: The operation must never invent a probability for a bracket whose city-station forecast fetch found no daytime period matching the bracket's close date; such a bracket is silently omitted from the result rather than guessed.
## Laws
- `calibration-gated-stakes-error-model-placeholder` | Three ways to turn capital into capital, 561 Group finance operations note | 2026-09-04 | 561-group-finance-operations-services-section/content/text/documents/articles/notes/2026/09/04/2026-09-04-note-on-three-ways-to-turn-capital-into-capital.md | Applies to the errorModel default this operation ships with. | A stake exists only when the org's calibration on the forecast's reference class, scored on at least thirty resolved forecasts, shows an expected edge; until that calibration record exists, this operation's declared standard-deviation-by-lead-time default is documented as a placeholder to be fitted from the scoring record, never treated as a validated error model.
## Standards
- `node-esm-operation` | Node.js | v24.2.0+ | https://nodejs.org/docs/v24/api/esm.html | Applies to the .mjs operation, its import.meta.main guard, and downstream package-birth assays. | The package uses one executable ESM operation source file that is eligible for downstream staged package-birth assays.
- `whatwg-fetch-standard` | WHATWG | Living Standard | https://fetch.spec.whatwg.org/ | Applies to the injectable network call this operation makes to api.weather.gov. | The operation uses the Fetch API contract (a Request URL and headers, a Response with `.ok` and `.json()`) for its HTTP calls, real by default via the global fetch and injectable for deterministic tests.
- `nws-api-web-service` | National Weather Service | v3 | https://www.weather.gov/documentation/services-web-api | Applies to the gridpoints forecast endpoint this operation reads. | The NWS API documents that requests require no API key but must carry a descriptive User-Agent identifying the application and a contact; the operation sends one on every request.
## Open questions
none
## Package
```json
{"packageName":"@lenticule-science/derive-set-of-nws-temperature-forecasts-service","packageVersion":"0.1.0","license":"UNLICENSED","dependencies":{},"devDependencies":{}}
```
## Operation
```mjs path=scripts/derive-set-of-nws-temperature-forecasts.mjs
#!/usr/bin/env node
// Derives, per declared Kalshi-style weather-market bracket, the house
// probability that the settled temperature lands inside the bracket, from
// api.weather.gov's public point forecast (no key; NWS requires a
// descriptive User-Agent) and a declared per-lead-time normal error model
// over the forecast high. Network access is delegated to an injectable
// fetch (defaulting to the global fetch), so fabrication examples and
// behavioral tests run deterministically without live HTTP.

const DEFAULT_BASE_URL = "https://api.weather.gov";
const DEFAULT_USER_AGENT = "(561-group forecast-weather-markets loop, ops@561.group)";

// Placeholder normal-error standard deviations by whole lead-days, to be
// fitted from the scoring record once >=30 resolved forecasts exist per
// reference class (see the calibration-gated-stakes-error-model-placeholder
// law this work order cites) -- never treated as a validated error model.
const DEFAULT_STD_DEV_BY_LEAD_DAYS = Object.freeze({ "0": 2, "1": 2.5, "2": 3, "3": 3.5, "4": 4 });
const DEFAULT_STD_DEV_FALLBACK = 5;

function requireArray(value, label) {
  if (!Array.isArray(value)) throw new TypeError(`derive-set-of-nws-temperature-forecasts: ${label} must be an array`);
  return value;
}

function requireIsoTimestamp(value, label) {
  if (typeof value !== "string" || !Number.isFinite(Date.parse(value))) {
    throw new TypeError(`derive-set-of-nws-temperature-forecasts: ${label} must be a parseable ISO 8601 timestamp`);
  }
  return value;
}

// Abramowitz & Stegun 7.1.26 erf approximation (max absolute error ~1.5e-7).
function erf(x) {
  const sign = x < 0 ? -1 : 1;
  const ax = Math.abs(x);
  const a1 = 0.254829592, a2 = -0.284496736, a3 = 1.421413741, a4 = -1.453152027, a5 = 1.061405429, p = 0.3275911;
  const t = 1 / (1 + p * ax);
  const y = 1 - (((((a5 * t + a4) * t) + a3) * t + a2) * t + a1) * t * Math.exp(-ax * ax);
  return sign * y;
}

function normalCdf(x, mean, stdDev) {
  return 0.5 * (1 + erf((x - mean) / (stdDev * Math.SQRT2)));
}

function bracketProbability({ strikeType, floorStrike, capStrike, mean, stdDev }) {
  if (strikeType === "greater") return 1 - normalCdf(floorStrike, mean, stdDev);
  if (strikeType === "less") return normalCdf(floorStrike, mean, stdDev);
  if (strikeType === "between") return normalCdf(capStrike, mean, stdDev) - normalCdf(floorStrike, mean, stdDev);
  throw new TypeError(`derive-set-of-nws-temperature-forecasts: unknown strikeType ${JSON.stringify(strikeType)}`);
}

function leadDaysBetween(asOf, closeTime) {
  const ms = Date.parse(closeTime) - Date.parse(asOf);
  return Math.max(0, Math.round(ms / 86400000));
}

function stdDevForLeadDays(leadDays, errorModel) {
  const key = String(leadDays);
  if (Object.prototype.hasOwnProperty.call(errorModel.stdDevByLeadDays, key)) return errorModel.stdDevByLeadDays[key];
  return errorModel.stdDevFallback;
}

async function fetchDailyHigh({ baseUrl, station, closeDate, fetchImpl, userAgent }) {
  const url = `${baseUrl}/gridpoints/${station.gridId}/${station.gridX},${station.gridY}/forecast`;
  const response = await fetchImpl(url, { headers: { "user-agent": userAgent, accept: "application/geo+json" } });
  if (!response.ok) {
    throw new Error(`derive-set-of-nws-temperature-forecasts: GET ${url} failed with HTTP ${response.status}`);
  }
  const payload = await response.json();
  const periods = payload?.properties?.periods ?? [];
  const match = periods.find((period) => period.isDaytime && typeof period.startTime === "string" && period.startTime.slice(0, 10) === closeDate);
  if (!match) return null;
  return { temperature: match.temperature, temperatureUnit: match.temperatureUnit, periodName: match.name };
}

/**
 * Derives, for each declared Kalshi-style weather-market bracket, the house probability that the settled temperature lands inside the bracket, from api.weather.gov's public point forecast for the bracket's declared city station and a declared per-lead-time normal error model over the forecast high.
 * @param {object} request A NwsTemperatureForecastDerivationRequest.
 * @param {object[]} request.cityStations Declared city -> NWS grid mappings: `{city, gridId, gridX, gridY}`.
 * @param {object[]} request.brackets Market brackets to forecast: `{marketTicker, city, strikeType, floorStrike, capStrike, closeTime}`; an empty array derives nothing.
 * @param {string} request.asOf ISO 8601 timestamp this derivation is stamped with (used for lead-time calculation).
 * @param {string} [request.baseUrl] api.weather.gov base URL (default the documented production host).
 * @param {string} [request.userAgent] descriptive User-Agent NWS's API requires (default a house identification string).
 * @param {{stdDevByLeadDays?: object, stdDevFallback?: number}} [request.errorModel] Placeholder per-lead-day normal error model (see this operation's DEFAULT_STD_DEV_BY_LEAD_DAYS), to be fitted from the scoring record.
 * @param {{fetchImpl?: typeof fetch}} [options] `fetchImpl` overrides the network call for tests and fixtures; defaults to the global fetch.
 * @returns {Promise<object[]>} An array of NwsTemperatureForecastDerivation records, one per bracket whose city station resolved a matching forecast period.
 * @throws {TypeError} When request fields are malformed or a bracket names an undeclared city.
 * @throws {Error} When an api.weather.gov request does not respond with an HTTP success status.
 */
export async function deriveSetOfNwsTemperatureForecasts(request, options = {}) {
  if (request === null || typeof request !== "object" || Array.isArray(request)) {
    throw new TypeError("derive-set-of-nws-temperature-forecasts: request must be a JSON object");
  }
  const cityStations = requireArray(request.cityStations, "request.cityStations");
  const brackets = requireArray(request.brackets, "request.brackets");
  const asOf = requireIsoTimestamp(request.asOf, "request.asOf");
  const baseUrl = typeof request.baseUrl === "string" && request.baseUrl.length > 0 ? request.baseUrl : DEFAULT_BASE_URL;
  const userAgent = typeof request.userAgent === "string" && request.userAgent.length > 0 ? request.userAgent : DEFAULT_USER_AGENT;
  const errorModel = {
    stdDevByLeadDays: request.errorModel?.stdDevByLeadDays ?? DEFAULT_STD_DEV_BY_LEAD_DAYS,
    stdDevFallback: typeof request.errorModel?.stdDevFallback === "number" ? request.errorModel.stdDevFallback : DEFAULT_STD_DEV_FALLBACK,
  };
  const fetchImpl = options.fetchImpl ?? fetch;

  const stationsByCity = new Map(cityStations.map((station) => [station.city, station]));
  const cache = new Map();
  const results = [];
  for (const bracket of brackets) {
    const station = stationsByCity.get(bracket.city);
    if (!station) throw new TypeError(`derive-set-of-nws-temperature-forecasts: no cityStations entry for city ${JSON.stringify(bracket.city)}`);
    const closeDate = String(bracket.closeTime).slice(0, 10);
    const cacheKey = `${station.gridId}/${station.gridX},${station.gridY}|${closeDate}`;
    if (!cache.has(cacheKey)) cache.set(cacheKey, await fetchDailyHigh({ baseUrl, station, closeDate, fetchImpl, userAgent }));
    const forecast = cache.get(cacheKey);
    if (!forecast) continue;
    const leadDays = leadDaysBetween(asOf, bracket.closeTime);
    const stdDev = stdDevForLeadDays(leadDays, errorModel);
    const probability = bracketProbability({ strikeType: bracket.strikeType, floorStrike: bracket.floorStrike, capStrike: bracket.capStrike, mean: forecast.temperature, stdDev });
    results.push({
      type: "NwsTemperatureForecastDerivation",
      version: 1,
      marketTicker: bracket.marketTicker,
      city: bracket.city,
      forecastHigh: forecast.temperature,
      forecastHighUnit: forecast.temperatureUnit,
      forecastPeriodName: forecast.periodName,
      forecastSource: "api.weather.gov gridpoints forecast",
      leadDays,
      stdDevUsed: stdDev,
      probability,
      asOf,
    });
  }
  return results;
}

if (import.meta.main) {
  if (process.argv.includes("--help")) {
    process.stdout.write(
      "deriveSetOfNwsTemperatureForecasts — Derives, for each declared Kalshi-style weather-market bracket, the house probability that the settled temperature lands inside the bracket, from api.weather.gov's public point forecast for the bracket's declared city station and a declared per-lead-time normal error model over the forecast high.\n",
    );
  } else {
    let text = "";
    for await (const chunk of process.stdin) text += chunk;
    for (const line of text.split("\n")) {
      if (line.length > 0) process.stdout.write(`${JSON.stringify(await deriveSetOfNwsTemperatureForecasts(JSON.parse(line)))}\n`);
    }
  }
}
```
## Tests
```mjs path=test/derive-set-of-nws-temperature-forecasts.test.mjs
import assert from "node:assert/strict";
import test from "node:test";
import { deriveSetOfNwsTemperatureForecasts } from "../scripts/derive-set-of-nws-temperature-forecasts.mjs";

// Trimmed from a live sample recorded 2026-09-04 against
// https://api.weather.gov/gridpoints/OKX/33,42/forecast
const OKX_FORECAST = {
  properties: {
    periods: [
      { number: 1, name: "Tonight", isDaytime: false, temperature: 69, temperatureUnit: "F", startTime: "2026-09-04T18:00:00-04:00" },
      { number: 2, name: "Saturday", isDaytime: true, temperature: 82, temperatureUnit: "F", startTime: "2026-09-05T06:00:00-04:00" },
      { number: 3, name: "Saturday Night", isDaytime: false, temperature: 64, temperatureUnit: "F", startTime: "2026-09-05T18:00:00-04:00" },
    ],
  },
};

const NYC_STATION = { city: "nyc", gridId: "OKX", gridX: 33, gridY: 42 };

function fixtureFetch(forecastsByUrl) {
  const calls = [];
  const fetchImpl = async (url, init) => {
    calls.push({ url, init });
    const forecast = forecastsByUrl[url];
    if (!forecast) return { ok: false, status: 404, json: async () => ({}) };
    return { ok: true, status: 200, json: async () => forecast };
  };
  fetchImpl.calls = calls;
  return fetchImpl;
}

test("returns [] without any fetch call for an empty brackets array", async () => {
  const fetchImpl = fixtureFetch({});
  const results = await deriveSetOfNwsTemperatureForecasts(
    { cityStations: [NYC_STATION], brackets: [], asOf: "2026-09-04T12:00:00.000Z" },
    { fetchImpl },
  );
  assert.deepEqual(results, []);
  assert.equal(fetchImpl.calls.length, 0);
});

test("derives a greater-strike probability from the matching daytime period", async () => {
  const url = "https://api.weather.gov/gridpoints/OKX/33,42/forecast";
  const fetchImpl = fixtureFetch({ [url]: OKX_FORECAST });
  const results = await deriveSetOfNwsTemperatureForecasts(
    {
      cityStations: [NYC_STATION],
      brackets: [{ marketTicker: "KXHIGHNY-26SEP05-T86", city: "nyc", strikeType: "greater", floorStrike: 86, capStrike: null, closeTime: "2026-09-05T05:00:00Z" }],
      asOf: "2026-09-04T12:00:00.000Z",
    },
    { fetchImpl },
  );
  assert.equal(results.length, 1);
  assert.equal(results[0].forecastHigh, 82);
  assert.equal(results[0].forecastSource, "api.weather.gov gridpoints forecast");
  assert.ok(results[0].probability > 0 && results[0].probability < 0.5, "82F forecast high with an 86F greater-strike should score under even odds");
  assert.equal(fetchImpl.calls[0].init.headers["user-agent"], "(561-group forecast-weather-markets loop, ops@561.group)");
});

test("derives a between-strike probability bounded in [0,1]", async () => {
  const url = "https://api.weather.gov/gridpoints/OKX/33,42/forecast";
  const fetchImpl = fixtureFetch({ [url]: OKX_FORECAST });
  const results = await deriveSetOfNwsTemperatureForecasts(
    {
      cityStations: [NYC_STATION],
      brackets: [{ marketTicker: "KXHIGHNY-26SEP05-T79", city: "nyc", strikeType: "between", floorStrike: 79, capStrike: 86, closeTime: "2026-09-05T05:00:00Z" }],
      asOf: "2026-09-04T12:00:00.000Z",
    },
    { fetchImpl },
  );
  assert.equal(results.length, 1);
  assert.ok(results[0].probability > 0 && results[0].probability < 1);
});

test("reuses one fetch across brackets sharing a city and close date", async () => {
  const url = "https://api.weather.gov/gridpoints/OKX/33,42/forecast";
  const fetchImpl = fixtureFetch({ [url]: OKX_FORECAST });
  const results = await deriveSetOfNwsTemperatureForecasts(
    {
      cityStations: [NYC_STATION],
      brackets: [
        { marketTicker: "A", city: "nyc", strikeType: "greater", floorStrike: 86, capStrike: null, closeTime: "2026-09-05T05:00:00Z" },
        { marketTicker: "B", city: "nyc", strikeType: "less", floorStrike: 79, capStrike: null, closeTime: "2026-09-05T05:00:00Z" },
      ],
      asOf: "2026-09-04T12:00:00.000Z",
    },
    { fetchImpl },
  );
  assert.equal(results.length, 2);
  assert.equal(fetchImpl.calls.length, 1);
});

test("omits a bracket with no matching daytime period rather than inventing one", async () => {
  const url = "https://api.weather.gov/gridpoints/OKX/33,42/forecast";
  const fetchImpl = fixtureFetch({ [url]: OKX_FORECAST });
  const results = await deriveSetOfNwsTemperatureForecasts(
    {
      cityStations: [NYC_STATION],
      brackets: [{ marketTicker: "A", city: "nyc", strikeType: "greater", floorStrike: 86, capStrike: null, closeTime: "2026-12-25T05:00:00Z" }],
      asOf: "2026-09-04T12:00:00.000Z",
    },
    { fetchImpl },
  );
  assert.deepEqual(results, []);
});

test("throws on an HTTP failure", async () => {
  await assert.rejects(
    deriveSetOfNwsTemperatureForecasts(
      { cityStations: [NYC_STATION], brackets: [{ marketTicker: "A", city: "nyc", strikeType: "greater", floorStrike: 86, capStrike: null, closeTime: "2026-09-05T05:00:00Z" }], asOf: "2026-09-04T12:00:00.000Z" },
      { fetchImpl: async () => ({ ok: false, status: 503, json: async () => ({}) }) },
    ),
    /HTTP 503/u,
  );
});

test("refuses a bracket naming an undeclared city", async () => {
  await assert.rejects(
    deriveSetOfNwsTemperatureForecasts({ cityStations: [NYC_STATION], brackets: [{ marketTicker: "A", city: "atl", strikeType: "greater", floorStrike: 86, capStrike: null, closeTime: "2026-09-05T05:00:00Z" }], asOf: "2026-09-04T12:00:00.000Z" }),
    /no cityStations entry for city "atl"/u,
  );
});

test("refuses a malformed asOf", async () => {
  await assert.rejects(deriveSetOfNwsTemperatureForecasts({ cityStations: [], brackets: [], asOf: "not-a-date" }), /asOf must be a parseable/u);
});
```
## Examples
```json name="empty brackets returns no derivations"
{"input":{"cityStations":[{"city":"nyc","gridId":"OKX","gridX":33,"gridY":42}],"brackets":[],"asOf":"2026-09-04T12:00:00.000Z"},"output":[]}
```
```json name="empty brackets and empty cityStations still returns no derivations"
{"input":{"cityStations":[],"brackets":[],"asOf":"2026-09-04T12:00:00.000Z"},"output":[]}
```
## Traceability
- `fetches-nws-point-forecast` -> projection `jsnode-operation-package`; acceptance `jsnode-package-assays`; constraints `nws-api-web-service`, `whatwg-fetch-standard`
- `probability-from-normal-error-model` -> projection `jsnode-operation-package`; acceptance `jsnode-package-assays`; constraints `calibration-gated-stakes-error-model-placeholder`
- `groups-station-calls-by-city-and-date` -> projection `jsnode-operation-package`; acceptance `jsnode-package-assays`; constraints `nws-api-web-service`
- `descriptive-user-agent-sent` -> projection `jsnode-operation-package`; acceptance `jsnode-package-assays`; constraints `nws-api-web-service`
- `injectable-network-call` -> projection `jsnode-operation-package`; acceptance `jsnode-package-assays`; constraints `whatwg-fetch-standard`, `node-esm-operation`
- `refuses-unmapped-city` -> projection `jsnode-operation-package`; acceptance `jsnode-package-assays`; constraints `node-esm-operation`
- `refuses-malformed-request` -> projection `jsnode-operation-package`; acceptance `jsnode-package-assays`; constraints `node-esm-operation`
- `no-forecast-invention` -> projection `jsnode-operation-package`; acceptance `jsnode-package-assays`; constraints `calibration-gated-stakes-error-model-placeholder`
