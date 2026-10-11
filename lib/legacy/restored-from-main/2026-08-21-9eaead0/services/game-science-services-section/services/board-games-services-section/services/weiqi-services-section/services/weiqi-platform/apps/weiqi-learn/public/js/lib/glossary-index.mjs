// Pure lookup structure over public/data/glossary.json — no DOM, no fetch.
// The caller (app.mjs / the shell) reads and parses the JSON file and hands
// the plain array here; this module only indexes it.

/**
 * @typedef {object} GlossaryTerm
 * @property {string} name - slug, e.g. "life-and-death"
 * @property {string} title - display form, e.g. "life and death"
 * @property {string} definition
 * @property {string[]} related - names of other terms
 * @property {string} path - section-relative path, matching a kernel
 *   SemanticEvent's `termRef` field exactly (see events.mts TERM_PATH).
 */

/**
 * @typedef {object} GlossaryIndex
 * @property {(name: string) => GlossaryTerm | undefined} byTerm - look up
 *   by slug (case-insensitive) or by display title.
 * @property {(event: { termRef?: string, term?: string }) => GlossaryTerm | undefined} forEvent
 *   - look up the term a kernel SemanticEvent refers to, via its termRef
 *   path (falling back to its `term` slug if no path matches).
 * @property {() => GlossaryTerm[]} all - every term, in file order.
 */

/**
 * @param {GlossaryTerm[]} json - the parsed contents of glossary.json
 * @returns {GlossaryIndex}
 */
export function loadGlossary(json) {
  const terms = Array.isArray(json) ? json : [];

  /** @type {Map<string, GlossaryTerm>} */
  const byName = new Map();
  /** @type {Map<string, GlossaryTerm>} */
  const byTitle = new Map();
  /** @type {Map<string, GlossaryTerm>} */
  const byPath = new Map();

  for (const term of terms) {
    byName.set(term.name.toLowerCase(), term);
    byTitle.set(term.title.toLowerCase(), term);
    byPath.set(term.path, term);
  }

  function byTerm(name) {
    if (typeof name !== "string") return undefined;
    const key = name.toLowerCase();
    return byName.get(key) ?? byTitle.get(key);
  }

  function forEvent(event) {
    if (!event) return undefined;
    if (typeof event.termRef === "string") {
      const byRef = byPath.get(event.termRef);
      if (byRef) return byRef;
    }
    if (typeof event.term === "string") {
      return byTerm(event.term);
    }
    return undefined;
  }

  function all() {
    return terms.slice();
  }

  return { byTerm, forEvent, all };
}
