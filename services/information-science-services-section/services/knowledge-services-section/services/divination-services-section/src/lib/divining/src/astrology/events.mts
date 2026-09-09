// Astrological events interpret numerical crossings through the tropical zodiac.
//
// The astronomy package supplies circular root finding and body positions. This
// module adds only the sign quotient: which sign was left and which was entered.

import {
  bodyLongitude,
  findCircleCrossings,
  isoFromJulianDay,
  julianDayFromIso,
  terrestrialJulianDay,
  type Body,
} from "@lenticule-science/astronomy-services-section";
import { ZODIAC_SIGNS, type ZodiacSign } from "./zodiac.mts";

export type IngressEvent = Readonly<{
  body: Body;
  from: ZodiacSign;
  to: ZodiacSign;
  /** TT Julian day at which the longitude reaches the sign cusp. */
  julianDay: number;
  /** ISO rendering of the settled event instant. */
  time: string;
  direction: "increasing" | "decreasing";
}>;

/**
 * Find tropical zodiac boundary crossings over a UTC interval. Numerical
 * bracketing remains in astronomy; this operation names the resulting signs.
 */
export function findIngresses(body: Body, start: string, end: string): readonly IngressEvent[] {
  const startTt = terrestrialJulianDay(julianDayFromIso(start));
  const endTt = terrestrialJulianDay(julianDayFromIso(end));
  const events: IngressEvent[] = [];
  for (let cusp = 0; cusp < 360; cusp += 30) {
    const crossings = findCircleCrossings(
      (julianDay) => bodyLongitude(body, julianDay),
      cusp,
      startTt,
      endTt,
      { stepDays: body === "moon" ? 0.1 : 1 },
    );
    for (const crossing of crossings) {
      const toIndex = crossing.direction === "increasing"
        ? cusp / 30
        : (cusp / 30 + 11) % 12;
      const fromIndex = crossing.direction === "increasing"
        ? (toIndex + 11) % 12
        : (toIndex + 1) % 12;
      events.push(Object.freeze({
        body,
        from: ZODIAC_SIGNS[fromIndex] as ZodiacSign,
        to: ZODIAC_SIGNS[toIndex] as ZodiacSign,
        julianDay: crossing.julianDay,
        time: isoFromJulianDay(crossing.julianDay),
        direction: crossing.direction,
      }));
    }
  }
  return Object.freeze(events.sort((left, right) => left.julianDay - right.julianDay));
}
