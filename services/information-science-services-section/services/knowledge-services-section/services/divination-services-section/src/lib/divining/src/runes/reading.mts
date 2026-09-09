import { castRunes, type Cast, type Orientation } from "./runes.mts";
import { corroborating, refuting, settleReading, type Reading, type SignWitness } from "../reading.mts";

function runeSign(name: string, orientation: Orientation): SignWitness {
  return orientation === "upright"
    ? corroborating("runes", name)
    : refuting("runes", name);
}

/** Project an existing rune cast to its orientation-valued witnesses. */
export function buildCastPanel(cast: Cast): readonly SignWitness[] {
  return Object.freeze(cast.drawn.map(({ rune, orientation }) => runeSign(rune, orientation)));
}

export function buildPanel(query: string, count?: number): readonly SignWitness[] {
  return buildCastPanel(castRunes(query, count));
}

/** Settle an existing or deterministic rune cast; non-invertible runes remain upright by domain law. */
export function readCast(query: Cast | string, question: string, count?: number): Reading {
  const cast = typeof query === "string" ? castRunes(query, count) : query;
  return settleReading(question, cast.date, buildCastPanel(cast));
}

