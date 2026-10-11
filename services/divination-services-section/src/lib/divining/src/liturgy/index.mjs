// liturgy-topology: liturgical calendars and lectionaries as structure over
// calendar-topology.
//
// The shared vocabulary (vocabulary), the General Roman Calendar's season
// partition and day chart (roman), the Revised Common Lectionary's cycles,
// propers, and daily structure (rcl), the sourced reading tables
// (lectionary-data), and the total lookup (lection). Ported into Divination
// without the settling-core reading layer.

export {
  observance,

} from "@lenticule-science/divining/src/liturgy/vocabulary.mjs";

export {
  ROMAN_MOVABLE_OBSERVANCES,
  ROMAN_FIXED_OBSERVANCES,
  adventStart,
  baptismOfTheLord,
  romanSeasons,
  liturgicalYearOf,
  sundayCycleOf,
  weekdayCycleOf,
  romanDay,

} from "@lenticule-science/divining/src/liturgy/roman.mjs";

export { rclYear, properOfSunday, dailyRelation } from "@lenticule-science/divining/src/liturgy/rcl.mjs";

export {
  RCL_SUNDAY_ENTRIES,
  RCL_DAILY_ENTRIES,
  RCL_LECTIONARY_ENTRIES,

} from "@lenticule-science/divining/src/liturgy/lectionary-data.mjs";

export { lectionFor } from "@lenticule-science/divining/src/liturgy/lection.mjs";
export { buildLectionPanel, readLections } from "@lenticule-science/divining/src/liturgy/reading.mjs";
