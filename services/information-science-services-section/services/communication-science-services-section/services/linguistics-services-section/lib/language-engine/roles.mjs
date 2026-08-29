// language-engine/roles.mjs — extract thematic roles from a parse. Mechanically ported
// (types stripped) from the recovered
// @lenticule-science/language-analysis/src/semantics/roles.mts. Logic is unchanged.
// Reads syntax, not semantics: agent/patient are grammar-derived.
// Active: nsubj → agent, dobj → patient.
// Passive: by-phrase → agent, nsubj → patient.
// This is the exact function the original recovered
// src/parity.test.mts imported (`import { roles } from
// "@lenticule-science/language-analysis"`) and asserted against for
// "Juliam Marcus amat." (role-by-case beating object-first surface order).

/** Extract semantic role frames from a parse result. */
export function roles(result) {
  const frames = [];

  // Find all verbs (words with is-verb role or tags includes verb)
  const verbs = result.words.filter((w) => w.tags.includes("verb"));

  for (const verb of verbs) {
    // Find arcs where this word is the head
    const headArcs = result.arcs.filter((a) => a.head === verb.id);

    let agent = null;
    let patient = null;
    let instrument = null;
    let recipient = null;
    let location = null;

    for (const arc of headArcs) {
      switch (arc.rel) {
        case "nsubj":
          // Check for passive: if there's a "be" aux, nsubj is patient
          agent = arc.depText;
          break;
        case "dobj":
          patient = arc.depText;
          break;
        case "prep": {
          // Find the pobj of this prep
          const pobj = result.arcs.find((a) => a.head === arc.dependent && a.rel === "pobj");
          const prepWord = result.words.find((w) => w.id === arc.dependent);
          const prep = prepWord?.text.toLowerCase();
          if (pobj) {
            if (prep === "by") agent = pobj.depText;
            else if (prep === "with") instrument = pobj.depText;
            else if (prep === "to") recipient = pobj.depText;
            else if (prep === "in" || prep === "at" || prep === "on") location = pobj.depText;
          }
          break;
        }
      }
    }

    frames.push({ verb: verb.text, agent, patient, instrument, recipient, location });
  }

  return frames;
}
