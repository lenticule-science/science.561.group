---
type: concept
class: operation-kind
depends-on: [operation-kinds, query]
see-also: [observation-record, learning]
title: Analysis
description: "The platform's batch-inspection operation kind: an operation that inspects a set of substrate entities (a scope, a sub-region, a search result, a session's witness chain) and produces summary or comparative predications."
---

# Analysis

The platform's *batch-inspection* operation kind: an operation that inspects a *set* of substrate entities (a [scope](../scope/scope.md), a sub-region, a search result, a session's witness chain) and produces summary or comparative predications.
An analysis operation is structurally a composed [query](../query/query.md) followed by a derivation; the result is itself substrate content, typically inserted as an [observation-record](../objects/observation-record.md).

An analysis is structurally distinct from a [query](../query/query.md) at scale: a query reads a particular entity; an analysis reads a set, computes derived content from the set, and writes the derived content.
It is also distinct from a [mutation](../memory/mutation/mutation.md) directly: the mutation an analysis performs is an insertion of derived content, not a modification of the analyzed content.

## Three structural moves

- **Read-set.** Identify the entity set to analyze: by scope, by predicate match, by witness-chain traversal, by shape filter, by ad-hoc selection.
- **Derive.** Apply a derivation operator to the set: aggregation (count, sum, distribution), pattern detection (recurring co-occurrences, anomalies), comparative analysis (this set vs. a reference), or structural query (graph metrics, depth distributions).
- **Record.** The derived content is inserted as a substrate entity — an observation, a derived-summary, an analysis-record.
  The insertion is witnessed; the analysis is replayable.

## Engineering properties

- **Cost-bounded.** Per the analysis's declared scope, the operation's cost is bounded: a scope-bounded analysis doesn't scan the full substrate, an indexed analysis doesn't re-derive when caches are valid, an aggregation analysis runs in time linear in the input set's size.
- **Witness-recorded with cited inputs.** The analysis witness cites the input entity set's canonical hashes.
  Replays can re-fetch the input set and re-derive; agreement is the audit pass.
- **Read-many-write-derived.** The analysis reads many entities and writes one (or a small few).
  The asymmetry is what distinguishes analysis from query: query is one-to-one read; analysis is many-to-derived-content.

## Position in the platform

Analyses are the platform's *summary-content production*: how the substrate produces summarized, aggregated, or compared content from its raw operational record.
Per [settlement-path](settlement-path.md), analyses produce observation-records that may then mature into instincts and skills via [promote](../office/promote/promote.md); analyses are the front of the learning pipeline.

Particular analysis patterns:

- **Witness-chain analysis.** Read all witnesses produced in a session; derive the session's effective work output.
- **Scope-health analysis.** Read all entities in a scope; derive the scope's vocabulary completeness, shape coverage, closure-rule applicability metrics.
- **Failure-pattern analysis.** Read recent [failure-diagnosis](../failure-diagnosis/failure-diagnosis.md) records; derive recurring patterns suitable for promotion.
- **Cost-trend analysis.** Read [accounting](accounting.md) ledger entries over a window; derive cost trends, anomalies, budget projections.
- **Federation-coherence analysis.** Read sync witnesses across replicas; derive divergence patterns, retry-rate trends, bridge-translation efficacy.
