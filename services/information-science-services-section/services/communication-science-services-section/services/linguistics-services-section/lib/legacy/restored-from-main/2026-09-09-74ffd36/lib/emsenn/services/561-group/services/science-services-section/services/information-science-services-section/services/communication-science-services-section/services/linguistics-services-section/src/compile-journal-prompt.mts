import type { Relation, Result, Thing } from "@red-cup-engineering/computer-data-type-engine";
import { parseLeaderMessage } from "@lenticule-science/linguistics-services-section";
import {
  admitJournalPrompt,
  compilePromptReading,
  definePromptCompilerTypes,
  type PromptCompilation,
  type PromptCompilationRefusal,
  type RelationBinding,
} from "./compile-prompt-reading.mjs";

/** One explicit journal-to-shared-field operation. It writes no parallel state. */
export function compileJournalPrompt(input: Readonly<{
  journalEntryId: string;
  sourceToken: string;
  text: string;
  resources: readonly Thing[];
  aliases: (resource: Thing) => readonly string[];
  bindings: readonly RelationBinding[];
}>): Result<PromptCompilation, PromptCompilationRefusal> {
  const types = definePromptCompilerTypes();
  if (types.ok === false) return Object.freeze({ ok: false, refusal: types.refusal });
  const prompt = admitJournalPrompt({ journalEntryId: input.journalEntryId, sourceToken: input.sourceToken, text: input.text }, types.value);
  if (prompt.ok === false) return Object.freeze({ ok: false, refusal: prompt.refusal });
  const parse = parseLeaderMessage(input.text);
  if (parse.source.token !== input.sourceToken) return Object.freeze({ ok: false, refusal: Object.freeze({ kind: "invalid-prompt" as const, message: "journal source token does not identify its verbatim text" }) });
  return compilePromptReading({ prompt: prompt.value, parse, resources: input.resources, aliases: input.aliases, types: types.value, bindings: input.bindings });
}
