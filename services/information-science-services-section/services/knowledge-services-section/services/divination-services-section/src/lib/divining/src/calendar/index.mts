// calendar-topology: calendar mathematics as a carrier.
//
// The day-number line and its civil chart (iso-date), the computus
// (computus), calendrical cycles as quotients (cycles), and feasts as
// date-valued functions of the year (feast). Ported into Divination without
// the settling-core reading layer.

export {
  WEEKDAYS,
  civilDate,
  parseIsoDate,
  formatIsoDate,
  dayNumberFromCivil,
  civilFromDayNumber,
  dayNumber,
  isoFromDayNumber,
  addDays,
  daysBetween,
  dayOfWeek,
  weekdayOnOrAfter,
  weekdayOnOrBefore,
  weekdayAfter,
  weekdayBefore,
  nthWeekdayOnOrAfter,
  nthWeekdayOnOrBefore,
  type Weekday,
  type CivilDate,
} from "./iso-date.mts";

export { easterCivil, easterDate } from "./computus.mts";

export { goldenNumber, dayOfYear, isoWeek, type IsoWeek } from "./cycles.mts";

export {
  movableFeast,
  fixedFeast,
  feastDate,
  type Feast,
  type MovableFeast,
  type FixedFeast,
} from "./feast.mts";
export { buildDatePanel, readDate, type NamedFeast } from "./reading.mts";
