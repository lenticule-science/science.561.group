import { type AddressedStatement, type DataType, type Relation, type RelationalField, type Result, type Thing } from "@red-cup-engineering/computer-data-type-engine";
/** The parser's dependency data is retained as evidence; it is never replaced by a guessed SPO triple. */
export type CandidateParse = Readonly<{
    id: string;
    source: Readonly<{
        token: string;
        text: string;
    }>;
    forest: Readonly<{
        readings: readonly CandidateReading[];
    }>;
}>;
export type CandidateReading = Readonly<{
    id: string;
    span: Readonly<{
        start: number;
        end: number;
        text: string;
    }>;
    parse: Readonly<{
        words: readonly Readonly<{
            id: string;
            text: string;
        }>[];
        arcs: readonly Readonly<{
            rel: string;
            head: string;
            dependent: string;
        }>[];
    }>;
}>;
export type PromptCompilerTypes = Readonly<{
    prompt: DataType;
    claim: DataType;
    statementWitness: DataType;
}>;
export type RelationBinding = Readonly<{
    relation: Relation;
    /** A declared interpretation of this relation in one language fiber. */
    head: string;
    preposition: string;
    classification: "proposed-intention" | "proposed-directive" | "proposed-requirement";
}>;
export type UnresolvedPredication = Readonly<{
    readingId: string;
    span: Readonly<{
        start: number;
        end: number;
        text: string;
    }>;
    reason: "unresolved-subject" | "unresolved-object" | "ambiguous-subject" | "ambiguous-object" | "unbound-relation" | "ambiguous-relation" | "relation-refusal" | "source-mismatch";
}>;
export type PromptCompilation = Readonly<{
    claims: readonly Thing[];
    statements: readonly AddressedStatement[];
    field: RelationalField;
    unresolved: readonly UnresolvedPredication[];
}>;
export type PromptCompilationRefusal = Readonly<{
    kind: "invalid-prompt" | "invalid-types" | "claim-refusal" | "field-refusal";
    message: string;
}>;
/**
 * The shared type declarations for source prompts, actual resources, proposed
 * claims, and the witness carried by each admitted statement. All values
 * cross the data-engine admission boundary before they become Things or rows.
 */
export declare function definePromptCompilerTypes(): Result<PromptCompilerTypes, PromptCompilationRefusal>;
/** Admit the exact witness bytes already written by the journal as a Prompt Thing. */
export declare function admitJournalPrompt(input: Readonly<{
    journalEntryId: string;
    sourceToken: string;
    text: string;
}>, types: PromptCompilerTypes): Result<Thing, PromptCompilationRefusal>;
/**
 * Compile only a dependency pattern explicitly bound to a declared shared
 * Relation.  A missing or multiple resource match is retained as unresolved;
 * this function never fabricates a resource endpoint.
 */
export declare function compilePromptReading(input: Readonly<{
    prompt: Thing;
    parse: CandidateParse;
    resources: readonly Thing[];
    /** Projection from the actual resource-graph model; it does not define Resource here. */
    aliases: (resource: Thing) => readonly string[];
    types: PromptCompilerTypes;
    bindings: readonly RelationBinding[];
}>): Result<PromptCompilation, PromptCompilationRefusal>;
