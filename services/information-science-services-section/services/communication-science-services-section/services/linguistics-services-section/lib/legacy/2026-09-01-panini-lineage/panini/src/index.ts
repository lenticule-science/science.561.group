// index.ts — public API surface for @561-group/panini (syntaxis).
// Core pipeline: articulate → construe → descend → parse → render.
// Language-specific data lives entirely in CompiledBundle; all entry points require one.

// ── Types ─────────────────────────────────────────────────────────────────────
export type {
  Tier, Span, ContainmentEdge, SequenceEdge, ArticulateResult,
  Word, Arc, Entry, SpecializationEdge, Question, ConstrainedResult,
  DescentResult,
  ChargeValue, ChargeStatus,
  ParsedWord, ParsedArc, ParsedAnswer, FoldPath, FoldTower, ParseResult,
  BundleMeta, BundleLexicon, SuffixRule, BundleMorphology,
  PronounFeatures, BundleReference, BundleAttachment, BundleSegmentation,
  RawBundle, CompiledBundle,
} from "./types.ts";
export type { Charge } from "./charge.ts";

// ── Bundle ────────────────────────────────────────────────────────────────────
export { load } from "./bundle.ts";

// ── Charge helpers ────────────────────────────────────────────────────────────
export {
  BOTTOM, TRUE, FALSE, TOP,
  violation, compliant, bottom,
  value, status,
  joinKnowledge, meetKnowledge, negate, conflate,
  isTop, isBottom,
} from "./charge.ts";

// ── Articulation ──────────────────────────────────────────────────────────────
export { articulate, span, ruleSpan, tokenize } from "./articulating.ts";

// ── Per-token analysis ────────────────────────────────────────────────────────
export { tag } from "./tagging.ts";
export { features } from "./featuring.ts";
export { lemma } from "./lemmatizing.ts";
export { conjugate, pluralize, indefiniteArticle } from "./inflecting.ts";

// ── Core parse pipeline ───────────────────────────────────────────────────────
export { relate } from "./relating.ts";
export type { Proposal } from "./relating.ts";
export { charge } from "./charging.ts";
export type { ChargingResult } from "./charging.ts";
export { descend } from "./descending.ts";
export { construe, wordsInSentence } from "./construing.ts";
export { fold } from "./folding.ts";
export type { FoldResult } from "./folding.ts";
export { parse } from "./parsing.ts";

// ── Rendering ─────────────────────────────────────────────────────────────────
export { default as render, renderArcs } from "./rendering.ts";

// ── Semantics ─────────────────────────────────────────────────────────────────
export {
  roles, polarity, scope, temporal, presuppositions, logicalForm,
} from "./semantics/index.ts";
export type {
  SemanticFrame,
  PolarityFrame,
  ScopeResult, Quantifier, ScopeReading,
  TemporalFrame, TenseValue, AspectValue, EvidentialValue,
  Presupposition, PresuppositionTrigger, TriggerKind,
  LogicalFormResult, LogicalFormReading, LogicalFormNode,
} from "./semantics/index.ts";
