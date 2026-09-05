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
