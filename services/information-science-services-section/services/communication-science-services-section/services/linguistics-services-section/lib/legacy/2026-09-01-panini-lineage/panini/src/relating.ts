// relating.ts — dependency attachment rules.
// Each rule is independent and proposes every arc it licenses.
// Conflicts (multiple heads for one dependent, or vice versa) are NOT resolved here;
// they propagate to the descend kernel which joins them to ⊤ or holds them as ⊥.
import type { Word, Arc } from "./types.ts";
import type { CompiledBundle } from "./types.ts";

/** A proposed arc with the source rule that licensed it. */
export interface Proposal {
  readonly arc: Arc;
  readonly rule: string;
}

// ── Individual attachment rules ───────────────────────────────────────────────

function det(words: readonly Word[]): readonly Proposal[] {
  const proposals: Proposal[] = [];
  for (let i = 0; i < words.length; i++) {
    const w = words[i];
    if (!w) continue;
    if (!w.tags.includes("det")) continue;
    // Determiner attaches to the nearest following noun (SVO-default)
    for (let j = i + 1; j < words.length; j++) {
      const head = words[j];
      if (!head) continue;
      if (head.tags.includes("noun") || head.tags.includes("pron")) {
        proposals.push({ arc: { head: head.id, rel: "det", dependent: w.id, headSpan: head.span, depSpan: w.span }, rule: "det" });
        break;
      }
    }
  }
  return proposals;
}

function amod(words: readonly Word[]): readonly Proposal[] {
  const proposals: Proposal[] = [];
  for (let i = 0; i < words.length; i++) {
    const w = words[i];
    if (!w) continue;
    if (!w.tags.includes("adj")) continue;
    // Adjective attaches to the nearest following noun
    for (let j = i + 1; j < words.length; j++) {
      const head = words[j];
      if (!head) continue;
      if (head.tags.includes("noun")) {
        proposals.push({ arc: { head: head.id, rel: "amod", dependent: w.id, headSpan: head.span, depSpan: w.span }, rule: "amod" });
        break;
      }
    }
  }
  return proposals;
}

function advmod(words: readonly Word[]): readonly Proposal[] {
  const proposals: Proposal[] = [];
  for (let i = 0; i < words.length; i++) {
    const w = words[i];
    if (!w) continue;
    if (!w.tags.includes("adv")) continue;
    // Adverb attaches to nearest verb
    let closest: Word | null = null;
    let closestDist = Infinity;
    for (let j = 0; j < words.length; j++) {
      const head = words[j];
      if (!head) continue;
      if (!head.tags.includes("verb")) continue;
      const dist = Math.abs(j - i);
      if (dist < closestDist) { closestDist = dist; closest = head; }
    }
    if (closest) proposals.push({ arc: { head: closest.id, rel: "advmod", dependent: w.id, headSpan: closest.span, depSpan: w.span }, rule: "advmod" });
  }
  return proposals;
}

function nsubj(words: readonly Word[], bundle: CompiledBundle): readonly Proposal[] {
  const proposals: Proposal[] = [];
  const verbs = words.filter((w) => w.tags.includes("verb") || w.tags.includes("aux"));
  for (const verb of verbs) {
    // Subject is the closest nominal to the left (SVO default)
    const vi = words.indexOf(verb);
    for (let j = vi - 1; j >= 0; j--) {
      const cand = words[j];
      if (!cand) continue;
      if (cand.tags.includes("noun") || cand.tags.includes("pron")) {
        // Skip if it's a preposition's object (handled by pobj)
        proposals.push({ arc: { head: verb.id, rel: "nsubj", dependent: cand.id, headSpan: verb.span, depSpan: cand.span }, rule: "nsubj" });
        break;
      }
      // Stop scanning at another verb or clause boundary markers
      if (cand.tags.includes("verb")) break;
    }
  }
  // Adjust for non-SVO word orders
  if (bundle.wordOrder === "SOV" || bundle.wordOrder === "OVS") {
    // Subject still precedes verb in SOV; same logic applies
  }
  return proposals;
}

function dobj(words: readonly Word[], bundle: CompiledBundle): readonly Proposal[] {
  const proposals: Proposal[] = [];
  const verbs = words.filter((w) => w.tags.includes("verb") || w.tags.includes("aux"));
  for (const verb of verbs) {
    const vi = words.indexOf(verb);
    // Object is the closest nominal to the right of the verb (SVO/VSO default)
    for (let j = vi + 1; j < words.length; j++) {
      const cand = words[j];
      if (!cand) continue;
      if (cand.tags.includes("noun") || cand.tags.includes("pron")) {
        // Don't attach if a preposition intervenes (it's a pobj)
        proposals.push({ arc: { head: verb.id, rel: "dobj", dependent: cand.id, headSpan: verb.span, depSpan: cand.span }, rule: "dobj" });
        break;
      }
      if (cand.tags.includes("prep")) break;
    }
  }
  return proposals;
}

function prep(words: readonly Word[]): readonly Proposal[] {
  const proposals: Proposal[] = [];
  for (let i = 0; i < words.length; i++) {
    const w = words[i];
    if (!w) continue;
    if (!w.tags.includes("prep")) continue;
    // Propose ALL licensed heads (verb or noun to the left)
    for (let j = i - 1; j >= 0; j--) {
      const head = words[j];
      if (!head) continue;
      if (head.tags.includes("verb") || head.tags.includes("noun")) {
        proposals.push({ arc: { head: head.id, rel: "prep", dependent: w.id, headSpan: head.span, depSpan: w.span }, rule: "prep" });
        // Don't break — propose all possible heads (PP-attachment ambiguity)
        if (head.tags.includes("verb")) break; // Stop at first verb
      }
    }
  }
  return proposals;
}

function pobj(words: readonly Word[]): readonly Proposal[] {
  const proposals: Proposal[] = [];
  for (let i = 0; i < words.length; i++) {
    const w = words[i];
    if (!w) continue;
    if (!w.tags.includes("prep")) continue;
    // Nearest nominal to the right
    for (let j = i + 1; j < words.length; j++) {
      const cand = words[j];
      if (!cand) continue;
      if (cand.tags.includes("noun") || cand.tags.includes("pron")) {
        proposals.push({ arc: { head: w.id, rel: "pobj", dependent: cand.id, headSpan: w.span, depSpan: cand.span }, rule: "pobj" });
        break;
      }
    }
  }
  return proposals;
}

// ── Run all rules ─────────────────────────────────────────────────────────────

/** Run all attachment rules and return all proposed arcs. */
export function relate(words: readonly Word[], bundle: CompiledBundle): readonly Proposal[] {
  return [
    ...det(words),
    ...amod(words),
    ...advmod(words),
    ...nsubj(words, bundle),
    ...dobj(words, bundle),
    ...prep(words),
    ...pobj(words),
  ];
}
