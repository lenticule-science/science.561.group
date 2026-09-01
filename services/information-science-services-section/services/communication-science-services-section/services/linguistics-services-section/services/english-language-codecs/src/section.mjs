// section.mjs — settled-section realization, the inverse face of the shared
// engine's parse. Mechanically ported (types stripped) from the recovered
// content/assets/legacy/github-language-packages/english-language-codecs/src/section.mts.
// Logic is unchanged.
import { realizeClause } from "./realize.mjs";

function regimeOf(cell) {
  if (cell.charge.value === "potential") return "affirmed";
  if (cell.charge.value === "active") return "denied";
  if (cell.charge.value === "stable") return "contradicted";
  return "void";
}

function witnesses(cell) {
  return {
    positive: [...cell.charge.positiveWitnesses],
    negative: [...cell.charge.negativeWitnesses],
  };
}

function sentence(text) {
  const trimmed = text.trim();
  if (trimmed === "") return "";
  const cased = trimmed[0].toUpperCase() + trimmed.slice(1);
  return /[.!?]$/.test(cased) ? cased : `${cased}.`;
}

/** Realize a settled section into prose while preserving voids and contradictions in audit data. */
export function realizeSection(section) {
  const clauses = [];
  const dropped = [];
  const audit = [];

  for (const cell of section.cells) {
    const regime = regimeOf(cell);
    if (regime === "void") {
      dropped.push({ cell, reason: "void" });
      continue;
    }
    if (section.subject == null || section.subject.trim() === "") {
      dropped.push({ cell, reason: "missing-subject" });
      continue;
    }
    if (cell.predicate.trim() === "") {
      dropped.push({ cell, reason: "missing-predicate" });
      continue;
    }

    const realized = realizeClause({
      subject: section.subject,
      verb: cell.predicate,
      ...(cell.object != null ? { object: cell.object } : {}),
      negated: regime === "denied",
      tense: cell.tense ?? "past",
      ...(cell.obliques !== undefined ? { obliques: cell.obliques } : {}),
      charge: cell.charge,
    });

    if (regime === "contradicted") {
      audit.push({ cell, witnesses: witnesses(cell), default: realized.text });
    }
    clauses.push({ cell, regime, text: realized.text });
  }

  return {
    prose: clauses.map((c) => sentence(c.text)).filter(Boolean).join(" "),
    clauses,
    dropped,
    audit,
    why: (index) => audit[index] ?? null,
  };
}

export default realizeSection;
