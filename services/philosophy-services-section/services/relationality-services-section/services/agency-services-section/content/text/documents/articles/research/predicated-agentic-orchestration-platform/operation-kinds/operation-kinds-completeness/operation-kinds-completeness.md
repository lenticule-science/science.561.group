---
type: theorem
class: engineering-claim
depends-on: [operation-kinds, agent, closure-kind, closure-2-monad, dualized-closure-2-comonad, predication-valuation]
status: empirical
title: The seven operation kinds cover platform operations
description: Claim.
---

# The seven operation kinds cover platform operations

**Claim.** Every operation that an [agent](teaching/explanations/agent.md) performs through the platform — every hook, every tool call, every closure-rule application, every dispatch step, every runbook step — decomposes into one or a sequence of the seven [operation kinds](../operation-kinds.md): observation, guard, accounting, query, mutation, analysis, learning.
There is no platform operation that fits none of the kinds; there is no operation that fits multiple kinds in a way that requires an eighth kind to capture.

The claim is *engineering-empirical* rather than mathematical: it is a typology that captures observed platform behavior and that has not been falsified by the platform's accumulating operation set.
A counterexample — an operation that does not decompose into the seven kinds and that the platform genuinely needs — would expand the typology to eight; the substrate's response would be to admit the new kind and update the corpus.

## Relation to the four substrate closure-kinds

The seven operation-kinds are an agential-layer refinement of the substrate's four [closure-kinds](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/closure-kind.md) (Process, Derivation, Procedure, Inquiry — per [closure-kind-exhaustivity](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/closure-kind-exhaustivity.md)).
The substrate's four closure-kinds classify *closure-rule applications* by their (σ-fixed, Δ-fixed) signature — the [closure 2-monad](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) and its [dualized 2-comonad](../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/dualized-closure-2-comonad.md) algebra-coalgebra structure.
The seven operation-kinds classify *agent-driven operations* by their relationship to the substrate's [predication valuation](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predication-valuation.md):

| Operation kind | Substrate signature | Closure-kind correspondence |
|---|---|---|
| **Observation** | mutation that records an event predication | Process or Derivation |
| **Guard** | closure-rule application producing an admissibility value (no-advance read of antecedent + write of consequent) | Process |
| **Accounting** | mutation that updates a ledger predication | Process |
| **Query** | reads-only (per [cost-discipline-reads-free](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/cost-discipline-reads-free.md)) | not a closure-rule application |
| **Mutation** | admit-and-settle step (contributes to increment sequence $u_\tau$) | Process or Procedure |
| **Analysis** | composed query producing aggregate output | not a closure-rule application |
| **Learning** | self-modification: edits the substrate's own [closure-rule system](../../../objects/closure-rule-system.md) | Inquiry |

The seven-kind typology is finer-grained than the four-kind because operation-kinds distinguish operations by *what they do at the agent surface* (observe, guard, account, query, mutate, analyze, learn) while closure-kinds classify by *what they do at the substrate algebra* (Process / Derivation / Procedure / Inquiry).

## Why this holds (the engineering-empirical argument)

The argument is a typology fitness check, applied to four classes of operation the platform performs.

**Class 1: Hooks (event-driven side effects).** Per the substrate's hook-as-substrate-operation discipline, hooks fire on substrate events.
The work a hook performs decomposes: - *Hooks that record what happened* are **observations** (writing event predications about an action — admit-and-settle steps). - *Hooks that check policy* are **guards** (closure-rule applications producing an admissibility value). - *Hooks that track resource flows* are **accounting** (mutations on ledger predications). - *Hooks that modify state in response to events* are **mutations**.

Inspecting a typical platform's hook set finds every hook in one of these categories.
A "hybrid" hook (e.g., a guard that also writes a witness) is a sequence of two kinds (guard then mutation), per the typology's composition rule.

**Class 2: Tools (agent-invoked operations).** Tools the platform exposes for agent invocation decompose: - *Read-only tools* (status checks, structured-data lookups, surface renderings) are **queries** — pure reads of the current valuation $v_\tau$. - *Mutation tools* (record-event, create-entity, edit-predication) are **mutations** — admit-and-settle steps. - *Aggregating tools* (cross-entity comparisons, reports, dashboards) are **analyses** — composed queries. - *Self-modification tools* (learn, evolve, promote, sharpen) are **learning** operations — they edit the substrate's own closure-rule system, which is substrate content per [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md).

**Class 3: Dispatch and routing.** A dispatch decision is a guard (admissibility composition per [dispatch-composes-authorization](../../dispatch/dispatch-composes-authorization/dispatch-composes-authorization.md)) followed by a mutation (recording the chosen agent-skill pair).
A federation receive is a guard (signature verification) followed by a mutation (admitting the federated event per [federation-convergence](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md)).
A re-dispatch on failure is a learning operation (the failure-diagnosis predication informs the next dispatch composition).

**Class 4: Runbook and skill execution.** A runbook execution is a sequence of dispatched skills, each of which is some combination of queries, mutations, and analyses.
A skill that invokes another skill is a higher-order composition; the leaves are the seven kinds.

Across the four classes, no operation has been found that fits none of the kinds.
The typology covers the platform's operation surface as observed.

## Engineering consequence

The typology is operationally engineering content, not just descriptive.
Three uses follow:

- **Hook lifting is kind-driven.** When refactoring an imperative hook into a substrate operation, the engineer first identifies the hook's kind.
  The kind determines the substrate operation's shape: a guard is a closure-rule pattern producing an admissibility value; a mutation is an insertion-and-witness operator; an accounting hook is a ledger predication.
  The lifted operation's behavior follows from its kind.
- **Witness coverage is kind-uniform.** Each kind has a typical witness shape: an observation produces an event-record witness; a guard produces an admissibility-decision witness; a mutation produces an insertion-and-retraction witness.
  Per [witness](../../../objects/witness.md), audit coverage is uniform within a kind, and the substrate's audit checks can be parameterized by kind.
- **Cost accounting is kind-aware.** Per [accounting](teaching/explanations/accounting.md), platform costs decompose by kind: observations and queries are cheap (queries are free per [cost-discipline-reads-free](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/cost-discipline-reads-free.md)), guards are bounded by their composition complexity, mutations include their downstream cascade cost (per [wavefront-termination](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/wavefront-termination.md)), learning operations are the most expensive (they involve self-composition).
  The platform's cost surface is the integral of per-kind costs over its operation history.

## What the theorem does not claim

The theorem does *not* claim that the seven kinds are mathematically minimal — that no smaller typology covers the same surface.
A more aggressive collapse (e.g., merging accounting into mutation, since accounting writes ledger predications) is possible if the cost is the kind-specific patterns no longer being captured.
The seven-kind typology is what fits the platform's operations with the structural distinctions the platform's engineering needs.

The theorem also does *not* claim that the seven kinds are exhaustive across all possible platforms.
A platform with new external boundaries (a sensor stream, a market-data feed, a hardware control loop) may surface operation patterns that the current typology does not anticipate.
The substrate's response is to expand the typology, not to insist on the seven.

## What the theorem requires

- Platform operations are substrate operations (per [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md)) — operations that live in runtime code outside the substrate are not under the typology's coverage.
- Per [witness](../../../objects/witness.md), every operation produces a witness whose shape is consistent with one of the kinds; ad-hoc operations without witnesses are violations of substrate discipline rather than counterexamples to the typology.
- Per [read-discipline](../../teaching/explanations/read-discipline.md), reads do not gate computation; the typology's "query" kind is reading without branching, not a primitive lookup-and-decide.

The classification was originally observed in a platform with around seventy distinct named hooks and tools; the empirical observation was that the operations decomposed without remainder into the seven kinds, with most operations being a single kind and a few being two-kind sequences.
The current corpus inherits the typology and treats it as engineering-stable until a counterexample appears.
