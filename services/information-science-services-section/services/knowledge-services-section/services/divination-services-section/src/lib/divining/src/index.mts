/**
 * @lenticule-science/divining -- sign-reading practice producers, live at Divination.
 *
 * This is the practice-producer half of the legacy @lenticule-science/divining package:
 * astrology, tarot/numerology, the computus, the lectionary, geomancy, the
 * I Ching, Ifa, runes, the Numogram, and Lakota star knowledge, each as
 * dependency-free domain mathematics. It ships source, not dist-only, and
 * depends on nothing outside this file tree.
 *
 * It replaces the legacy settled Reading core (`panelConsensus`, the
 * sigma-dual diagnosis/prediction, the D4 gauge orbit) that the legacy
 * package built over `@lenticule-science/{relating,knowing,playing,socializing,
 * communicating}` -- those packages sit in the dead agential-relationality
 * archive, and per the 2026-07-13 normalize-infography rule, resurrecting
 * that layer means rewriting it cleanly, not rewiring it back in. See
 * ../../../content/text/documents/sign-reading-as-settling.md for what was left
 * behind and why.
 *
 * A consumer wanting a plain indicator set (a moon phase, a tarot card, a
 * numerological reduction, a lection) calls a domain's own producers
 * directly or uses the common Reading object, whose FOUR settlement comes
 * from the current Articulating provider.
 */

export * as astrology from "./astrology/index.mts";
export * as divination from "./divination/index.mts";
export * as divinationCodecs from "./divination/codecs/index.mts";
export * as calendar from "./calendar/index.mts";
export * as liturgy from "./liturgy/index.mts";
export * as geomancy from "./geomancy/index.mts";
export * as iching from "./iching/index.mts";
export * as ifa from "./ifa/index.mts";
export * as runes from "./runes/index.mts";
export * as numogram from "./numogram/index.mts";
export * as starknowledge from "./starknowledge/index.mts";
export * from "./reading.mts";
