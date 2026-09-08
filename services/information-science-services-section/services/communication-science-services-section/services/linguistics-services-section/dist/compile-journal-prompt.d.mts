import type { Result, Thing } from "@red-cup-engineering/computer-data-type-engine";
import { type PromptCompilation, type PromptCompilationRefusal, type RelationBinding } from "./compile-prompt-reading.mjs";
/** One explicit journal-to-shared-field operation. It writes no parallel state. */
export declare function compileJournalPrompt(input: Readonly<{
    journalEntryId: string;
    sourceToken: string;
    text: string;
    resources: readonly Thing[];
    aliases: (resource: Thing) => readonly string[];
    bindings: readonly RelationBinding[];
}>): Result<PromptCompilation, PromptCompilationRefusal>;
