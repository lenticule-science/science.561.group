// parsing.ts — produce the full ParseResult from a sentence span.
// Orchestrates: construe → descend → fold → read settled charges → build output.
import type { Span, ParseResult, ParsedWord, ParsedArc, ParsedAnswer } from "./types.ts";
import type { ArticulateResult, CompiledBundle } from "./types.ts";
import { construe, wordsInSentence } from "./construing.ts";
import { descend } from "./descending.ts";
import { fold } from "./folding.ts";
import { value, status } from "./charge.ts";

/** Parse a sentence span and return the full ParseResult. */
export function parse(
  sentenceSpan: Span,
  base: ArticulateResult,
  bundle: CompiledBundle,
): ParseResult {
  const wordSpans = wordsInSentence(sentenceSpan, base.spans);
  const constrained = construe(sentenceSpan, wordSpans, bundle);
  const { words, arcs, entries, specialization, questions } = constrained;

  const settled = descend(entries, specialization);

  // ── Words ──────────────────────────────────────────────────────────────────
  const parsedWords: ParsedWord[] = words.map((w) => {
    const connCharge = settled.settledCharge(w.id, "is-connected");
    // Collect derived roles: "is-subject", "is-object", etc. from unary projections
    const roles: string[] = [];
    const relNames = ["nsubj", "dobj", "prep", "pobj", "det", "amod", "advmod"];
    for (const r of relNames) {
      const rc = settled.settledCharge(w.id, `is-${r}`);
      if (rc.value[0] || rc.value[1]) roles.push(`is-${r}`);
    }
    return {
      i: w.i,
      text: w.span.text,
      tags: w.tags,
      feats: w.feats,
      connected: status(connCharge),
      roles,
    };
  });

  // ── Arcs ───────────────────────────────────────────────────────────────────
  // Deduplicate: keep unique (head, rel, dependent) triples, read settled arc charge
  const arcSeen = new Set<string>();
  const parsedArcs: ParsedArc[] = [];
  for (const a of arcs) {
    const k = `${a.head}\x00${a.rel}\x00${a.dependent}`;
    if (arcSeen.has(k)) continue;
    arcSeen.add(k);
    const headWord = words.find((w) => w.id === a.head);
    const depWord = words.find((w) => w.id === a.dependent);
    const arcCharge = settled.settledArc(a.head, a.rel, a.dependent);
    parsedArcs.push({
      rel: a.rel,
      head: a.head,
      dependent: a.dependent,
      headText: headWord?.span.text ?? a.head,
      depText: depWord?.span.text ?? a.dependent,
      status: status(arcCharge),
      value: value(arcCharge),
    });
  }

  // ── Answers ────────────────────────────────────────────────────────────────
  const parsedAnswers: ParsedAnswer[] = questions.map((q) => {
    const c = settled.settledCharge(q.subject, q.predicate);
    return {
      question: q.label,
      on: q.on,
      status: status(c),
      value: value(c),
    };
  });

  // ── Fold tower ─────────────────────────────────────────────────────────────
  const { paths: compositions, tower } = fold(arcs);

  // ── Partition conflicts and voids ──────────────────────────────────────────
  const conflicts = parsedAnswers.filter((a) => a.status === "ambiguous");
  const voids = parsedAnswers.filter((a) => a.status === "void");

  return {
    words: parsedWords,
    arcs: parsedArcs,
    answers: parsedAnswers,
    compositions,
    tower,
    conflicts,
    voids,
  };
}
