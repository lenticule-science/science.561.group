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
