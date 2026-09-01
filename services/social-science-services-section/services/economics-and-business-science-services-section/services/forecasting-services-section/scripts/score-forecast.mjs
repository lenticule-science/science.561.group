#!/usr/bin/env node
import { resolve } from "node:path";
import { createSemanticRecordJournal } from "@red-cup-engineering/semantic-record-journal-service";
import { brierScore, logScore } from "../src/forecasting.mjs";
import { FORECAST_CATEGORY, FORECAST_OBJECT_KIND, NODE_ROOT } from "./record-forecast.mjs";

/** The objectKind this section's semantic record journal uses for calibration-tracking records. */
export const CALIBRATION_OBJECT_KIND = "forecasting.calibration-record";

/** The journal category calibration-tracking records are written and queried under. */
export const CALIBRATION_CATEGORY = "forecasting.calibration";

/**
 * Looks up a previously recorded forecast by its journal record id.
 * @param {string} forecastId - a semantic-record-journal record id (an `ni:///sha-256;...` token).
 * @param {{dataRoot?: string}} [options]
 * @returns {Readonly<import("../src/forecasting.mjs").ForecastRecord>}
 * @throws {Error} when no recorded forecast matches forecastId.
 */
export function findRecordedForecast(forecastId, options = {}) {
  const dataRoot = resolve(options.dataRoot ?? NODE_ROOT);
  const journal = createSemanticRecordJournal({ root: dataRoot, objectKind: FORECAST_OBJECT_KIND });
  const match = journal.query({ category: FORECAST_CATEGORY }).find((row) => row.id === forecastId);
  if (!match) throw new Error(`score-forecast: no recorded forecast found for id ${forecastId}`);
  return match.record;
}

/**
 * Scores a previously recorded forecast against a resolved outcome using
 * proper scoring rules (Brier always; log score whenever the recorded
 * probability is not exactly 0 or 1, since logScore is undefined at those
 * boundaries -- see forecasting.mjs's logScore doc), and writes a
 * calibration-tracking record via the semantic record journal.
 * @param {{forecastId: string, outcome: (0|1)}} input
 * @param {{dataRoot?: string, recordedAt?: string}} [options]
 * @returns {{id: string, objectKind: string, contentAppended: number, claimsAppended: number, charge: {support: boolean, refutation: boolean}}} the journal's record receipt for the calibration entry.
 * @throws {TypeError} when outcome is not exactly 0 or 1.
 */
export function scoreForecast({ forecastId, outcome }, options = {}) {
  if (outcome !== 0 && outcome !== 1) throw new TypeError(`score-forecast: outcome must be exactly 0 or 1, got ${JSON.stringify(outcome)}`);
  const forecast = findRecordedForecast(forecastId, options);
  const brier = brierScore(forecast.probability, outcome);
  let log = null;
  let logScoreUndefinedReason = null;
  try {
    log = logScore(forecast.probability, outcome);
  } catch (error) {
    logScoreUndefinedReason = error.message;
  }
  const scoredAt = options.recordedAt ?? new Date().toISOString();
  const record = {
    forecastId,
    questionId: forecast.questionId,
    probability: forecast.probability,
    outcome,
    brierScore: brier,
    logScore: log,
    logScoreUndefinedReason,
    scoredAt,
  };
  const dataRoot = resolve(options.dataRoot ?? NODE_ROOT);
  const journal = createSemanticRecordJournal({ root: dataRoot, objectKind: CALIBRATION_OBJECT_KIND });
  return journal.record({ category: CALIBRATION_CATEGORY, recordedAt: scoredAt, record, charge: { support: true, refutation: false } });
}

if (import.meta.main) {
  const [forecastId, outcomeArg] = process.argv.slice(2);
  if (!forecastId || outcomeArg === undefined) {
    process.stderr.write("usage: score-forecast.mjs <forecastId> <outcome 0|1>\n");
    process.exitCode = 2;
  } else {
    try {
      process.stdout.write(`${JSON.stringify(scoreForecast({ forecastId, outcome: Number(outcomeArg) }), null, 2)}\n`);
    } catch (error) {
      process.stderr.write(`${error.message}\n`);
      process.exitCode = 1;
    }
  }
}
