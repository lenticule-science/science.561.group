# @lenticule-science/derive-set-of-nws-temperature-forecasts-service

Derives, for each declared Kalshi-style weather-market bracket, the house probability that the settled temperature lands inside the bracket, from api.weather.gov's public point forecast for the bracket's declared city station and a declared per-lead-time normal error model over the forecast high.

## Operation

~~~js
export async function deriveSetOfNwsTemperatureForecasts(request, options = {})
~~~

### Parameters

- request (@param {object[]} request.cityStations Declared city -> NWS grid mappings: `{city, gridId, gridX, gridY}`.
 * @param {object[]} request.brackets Market brackets to forecast: `{marketTicker, city, strikeType, floorStrike, capStrike, closeTime}`; an empty array derives nothing.
 * @param {string} request.asOf ISO 8601 timestamp this derivation is stamped with (used for lead-time calculation).
 * @param {string} [request.baseUrl] api.weather.gov base URL (default the documented production host).
 * @param {string} [request.userAgent] descriptive User-Agent NWS's API requires (default a house identification string).
 * @param {{stdDevByLeadDays?: object, stdDevFallback?: number}} [request.errorModel] Placeholder per-lead-day normal error model (see this operation's DEFAULT_STD_DEV_BY_LEAD_DAYS), to be fitted from the scoring record.
 * ): A NwsTemperatureForecastDerivationRequest.
- options ({fetchImpl?: typeof fetch}): `fetchImpl` overrides the network call for tests and fixtures; defaults to the global fetch.

### Returns

Promise<object[]>: An array of NwsTemperatureForecastDerivation records, one per bracket whose city station resolved a matching forecast period.

### Refusals

- TypeError: When request fields are malformed or a bracket names an undeclared city.
- Error: When an api.weather.gov request does not respond with an HTTP success status.

## Command

derive-set-of-nws-temperature-forecasts reads one JSON value per input line and writes one JSON value per output line.

## Examples

### empty brackets returns no derivations

Input:

~~~json
{
  "cityStations": [
    {
      "city": "nyc",
      "gridId": "OKX",
      "gridX": 33,
      "gridY": 42
    }
  ],
  "brackets": [],
  "asOf": "2026-09-04T12:00:00.000Z"
}
~~~

Output:

~~~json
[]
~~~

### empty brackets and empty cityStations still returns no derivations

Input:

~~~json
{
  "cityStations": [],
  "brackets": [],
  "asOf": "2026-09-04T12:00:00.000Z"
}
~~~

Output:

~~~json
[]
~~~
