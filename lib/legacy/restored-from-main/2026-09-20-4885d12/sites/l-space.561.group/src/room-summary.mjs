import { readMarkdownSource } from "@red-cup-engineering/markdown-engineering-services-section/read-markdown-structure";
import { projectMarkdownFeatures } from "@red-cup-engineering/markdown-engineering-services-section/read-markdown-features";

export function summaryOf(room) {
  const offered = room.frontmatter.description ?? room.frontmatter.summary;
  const source = typeof offered === "string" ? offered : room.body;
  const observed = readMarkdownSource(source, { frontmatter: false });
  const edits = observed.codeRanges.filter(({ type }) => type === "fenced-code")
    .map(({ start, end }) => ({ start, end, text: " " }));
  for (const feature of projectMarkdownFeatures(observed)) {
    if (["markdown-link", "wikilink", "transclusion", "reference-link"].includes(feature.type)) {
      edits.push({ start: feature.span.start, end: feature.span.end, text: feature.label ?? feature.target ?? feature.reference });
    }
  }
  // Overlapping feature observations select the outermost visible label once.
  const replacements = [];
  for (const edit of edits.sort((a, b) => a.start - b.start || b.end - a.end)) {
    if (replacements.length === 0 || replacements.at(-1).end <= edit.start) replacements.push(edit);
  }
  let text = observed.text;
  for (const edit of replacements.reverse()) text = text.slice(0, edit.start) + edit.text + text.slice(edit.end);
  return text
    .replace(/[#*_`>|~-]+/gu, " ")
    .replace(/\s+/gu, " ")
    .trim()
    .slice(0, 220);
}
