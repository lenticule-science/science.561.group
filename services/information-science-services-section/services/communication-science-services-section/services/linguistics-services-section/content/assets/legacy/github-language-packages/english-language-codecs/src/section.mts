// section.ts — settled-section realization, the inverse face of language-topology parsing.
import type { SectionSpec, SectionRealization, SectionCell, SectionAudit } from "./types.mjs";
import { realizeClause } from "./realize.mjs";

type Regime = "affirmed" | "denied" | "void" | "contradicted";

function regimeOf(cell: SectionCell): Regime {
  if (cell.charge.value === "potential") return "affirmed";
  if (cell.charge.value === "active") return "denied";
  if (cell.charge.value === "stable") return "contradicted";
  return "void";
}

function witnesses(cell: SectionCell): SectionAudit["witnesses"] {
  return {
    positive: [...cell.charge.positiveWitnesses],
    negative: [...cell.charge.negativeWitnesses],
  };
}

function sentence(text: string): string {
  const trimmed = text.trim();
  if (trimmed === "") return "";
  const cased = trimmed[0]!.toUpperCase() + trimmed.slice(1);
  return /[.!?]$/.test(cased) ? cased : `${cased}.`;
}

/** Realize a settled section into prose while preserving voids and contradictions in audit data. */
export function realizeSection(section: SectionSpec): SectionRealization {
  const clauses: SectionRealization["clauses"][number][] = [];
  const dropped: SectionRealization["dropped"][number][] = [];
  const audit: SectionAudit[] = [];

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
