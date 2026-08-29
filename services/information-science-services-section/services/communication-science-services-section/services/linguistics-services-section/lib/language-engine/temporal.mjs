// language-engine/temporal.mjs — tense, aspect, and evidential extraction.
// Mechanically ported (types stripped) from the recovered
// @lenticule-science/language-analysis/src/semantics/tense.mts (the exported function
// is `temporal`, so this file is named for what it exports — same
// convention roles.mjs uses for semantics/roles.mts). Logic is unchanged.
// Epistemic: past/present firsthand → t; future → ⊥ (potential); reported →
// ⊥.
//
// Ported this session (2026-07-23) for english-language-codecs's real
// recovered sectionFromText(), which imports `temporal` from
// @lenticule-science/language-analysis — the first die under linguistics-services-
// section to need it; no parsing die's own recovered parity test ever called
// it.

const REPORT_VERBS = new Set(["say", "said", "claim", "claimed", "allege", "alleged", "report", "reported"]);
const FUTURE_AUX = new Set(["will", "shall", "going"]);
const HAVE_FORMS = new Set(["have", "has", "had"]);
const BE_FORMS = new Set(["is", "are", "was", "were", "be", "been", "being"]);

/** Extract temporal information from a parse result. */
export function temporal(result) {
  const frames = [];
  const verbs = result.words.filter((w) => w.tags.includes("verb"));

  for (const verb of verbs) {
    // Determine tense from morphological features
    let tense;
    if (verb.feats.includes("past")) {
      tense = "past";
    } else if (FUTURE_AUX.has(verb.text.toLowerCase())) {
      tense = "future";
    } else {
      tense = "present";
    }

    // Determine aspect
    let aspect = "simple";
    const prevWords = result.words.slice(0, verb.i);
    const hasHave = prevWords.some((w) => HAVE_FORMS.has(w.text.toLowerCase()));
    const hasBe = prevWords.some((w) => BE_FORMS.has(w.text.toLowerCase()));
    if (verb.feats.includes("nonfin")) {
      if (hasBe) aspect = "progressive";
      else if (hasHave) aspect = "perfect";
    } else if (hasHave) {
      aspect = "perfect";
    }

    // Determine evidentiality
    let evidential = "firsthand";
    if (REPORT_VERBS.has(verb.text.toLowerCase())) {
      evidential = "reported";
    } else {
      // Check if this verb is a complement of a report verb
      const depArc = result.arcs.find(
        (a) => a.dependent === verb.id && a.rel === "dobj",
      );
      if (depArc) {
        const headWord = result.words.find((w) => w.id === depArc.head);
        if (headWord && REPORT_VERBS.has(headWord.text.toLowerCase())) {
          evidential = "reported";
        }
      }
    }

    // Epistemic status
    let epistemicStatus;
    if (tense === "future" || evidential === "reported") {
      epistemicStatus = "absurd"; // not yet asserted; epistemic void
    } else {
      epistemicStatus = "potential"; // firsthand assertion
    }

    frames.push({ verb: verb.text, tense, aspect, evidential, epistemicStatus });
  }

  return frames;
}
