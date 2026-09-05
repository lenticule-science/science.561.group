// semantics/index.ts — re-export all semantic analysis modules.
export { roles } from "./roles.ts";
export type { SemanticFrame } from "./roles.ts";
export { polarity } from "./polarity.ts";
export type { PolarityFrame } from "./polarity.ts";
export { scope } from "./scope.ts";
export type { ScopeResult, Quantifier, ScopeReading } from "./scope.ts";
export { temporal } from "./tense.ts";
export type { TemporalFrame, TenseValue, AspectValue, EvidentialValue } from "./tense.ts";
export { presuppositions } from "./presupposition.ts";
export type { Presupposition, PresuppositionTrigger, TriggerKind } from "./presupposition.ts";
export { logicalForm } from "./logical-form.ts";
export type { LogicalFormResult, LogicalFormReading, LogicalFormNode } from "./logical-form.ts";
