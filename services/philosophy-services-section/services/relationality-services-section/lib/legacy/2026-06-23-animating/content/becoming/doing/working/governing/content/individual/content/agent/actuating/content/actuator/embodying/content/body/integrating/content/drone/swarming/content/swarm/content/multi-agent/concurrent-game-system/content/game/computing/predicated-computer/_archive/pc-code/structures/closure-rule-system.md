---
type: definition
class: substrate-aggregate
realizes: [closure-rule]
depends-on: [closure-rule-record, closure-rule-system, closure-operator, closure-2-monad]
see-also: [closure-rule-application, settle, witness, regime-record, closure-rule-system-realizes-closure-2-monad, substrate-operations-are-bigraded-modal]
---

# Closure-rule system

The substrate's complete *active rule set*: the aggregate of all [closure-rule records](closure-rule-record.md) the substrate's [engine](teaching/explanations/engine.md) reads and applies during [settle](../morphisms/settle.md). The substrate-recorded form of a [closure-rule system](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) — the syntactic generator that produces the substrate's [closure operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) $\mathrm{cl}^{\mathcal{S}}$ via the standard fixed-point construction (least operator satisfying every rule's consequent whenever its antecedent holds).

This object is the substrate's *queryable, versionable* representation of $\mathcal{S}$. The closure operator $\mathrm{cl}^{\mathcal{S}}$ it generates is unique by Knaster-Tarski, and being a $\mathrm{Cl}^{\mathcal{S}}$-algebra is property-like by [closure 2-monad lax-idempotence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md).

## Structural fields

A closure-rule system record carries:

- **`id`** — kebab-case identifier (commonly `default`, `paraconsistent`, `strict-mode`, etc.).
- **`description`** — one-line summary of the rule-set's purpose.
- **`version-hash`** — canonical-form hash of the rule-set's content, suitable for citation in [witness](witness.md) records and replay verification.
- **`rules`** — references to the [closure-rule records](closure-rule-record.md) the system includes. Each cited rule must resolve to an existing substrate entity.
- **`scope-applicability`** — references to the [scopes](scope-record.md) the rule system is active in. A substrate may host multiple rule systems simultaneously, with different scopes binding different active sets.
- **`closure-kind-distribution`** — derived count of rules per [closure-kind](teaching/explanations/closure-kind.md) (Process, Derivation, Procedure, Inquiry). Surfaces what the substrate's settling computation looks like under this rule set.
- **`rule-language-fragment`** — declares which fragment of the [closure-rule language](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-language.md) the rules are drawn from: *quantifier-free* (Scott-continuous closure, [strict or Scott-continuous regime](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md)) or *with-$\forall$-blocks* (non-Scott-continuous closure, transfinite-bounded or aperiodic regime). The fragment determines the [regime](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md) of the substrate's settling and hence which engine disciplines apply (per [federation-convergence](../theorems/federation-convergence.md), [wavefront-termination](../theorems/wavefront-termination.md)).
- **`fuel-policy`** — references to the [fuel-bound](teaching/explanations/fuel-bound.md) discipline declaring how settle invocations are bounded under this rule set. Common policies: per-layer, per-rule, total-wavefront. Must be regime-compatible with the rule-language fragment.
- **`predecessor`** — optional reference to the prior version of the rule system. Lets an auditor trace how the rule system has evolved through substrate edits.

## Invariants

- **Acyclic predecessor chain.** A rule system's `predecessor` chain must terminate at a bootstrap version (per [bootstrap](teaching/explanations/bootstrap.md)). Cycles in the chain would prevent reliable replay.
- **Scope-applicability respects scope hierarchy.** A rule system applicable to scope $S$ is implicitly applicable to scopes nested within $S$, unless overridden by a more-specific rule-system declaration.
- **Closure-kind distribution sums to total rules.** Every rule must have a declared closure-kind; the count of rules per kind sums to the total. A rule with no kind, or with multiple kinds, is malformed (per [closure-kind](teaching/explanations/closure-kind.md)).
- **Version hash is canonical.** Two rule systems with byte-identical content (same rules, same scope, same fuel policy, same metadata) must have identical version hashes. Different content must produce different hashes.
- **Rule-language fragment matches rules.** If the system declares the *quantifier-free* fragment, all included closure-rule records must have quantifier-free antecedents. A rule with $\forall$-block antecedent in a system declared quantifier-free is a configuration error — the substrate has under-declared its regime.
- **$\mathcal{C}$-naturality holds for every rule.** Each closure-rule record must be stated uniformly across the predicate category (per [closure-rule-language](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-language.md)'s predicate-uniformity requirement) so that the generated closure operator satisfies axiom 4 of [closure-operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md). Without this, the closure family is not a closure 2-monad and [settlement-determinism](../theorems/settlement-determinism.md) Part 2 fails.

## Operations

- *Activate.* Designate this rule system as active in a scope. The substrate's engine will apply the system's rules to settle predications within the scope's bounds. Per [self-representation](teaching/explanations/self-representation.md), activation is itself a substrate operation that produces a witness.
- *Extend.* Add a new closure-rule record to an existing rule system, producing a new rule-system version with a new version hash and a `predecessor` link to the prior version. Editing rule systems is editing substrate content.
- *Query.* Given a predicate, enumerate the rules in the system whose premise mentions that predicate. Lets the engine's matching pass scope its work efficiently.
- *Audit.* Given a [witness](witness.md) citing a particular `rule-system-version`, retrieve the historical rule-system content that produced the witness. Per the [audit stack](teaching/explanations/substrate-as-stack-composition.md), the rule-system version's persistence is what makes substrate replay byte-identical across time.
- *Federate.* When two substrates federate, the receiving substrate consults the sending substrate's `rule-system-version` against its own. Mismatched rule systems require a federation-bridge translation per [federation-bridge](federation-bridge.md), or the substrate refuses the federated content as semantically incompatible.

## Position in the substrate

The closure-rule system is the substrate's *programmable layer*. Editing the rule system is editing the substrate's behavior; the engine reads the new system, the closure 2-monad it generates is updated structurally, and the substrate's settling produces different outputs. Per [driver-substrate-split](teaching/explanations/driver-substrate-split.md), the rule system carries the program that the runtime interprets; the runtime is plumbing, the rule system is the program.

Per [closure-rule-system-realizes-closure-2-monad](../theorems/closure-rule-system-realizes-closure-2-monad.md), the closure-rule system *is* the substrate-content realization of the [closure 2-monad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) $\mathrm{Cl}^{\mathcal{S}}$ — its unit (inflationarity), multiplication (nested-closure collapse), monad laws, and lax-idempotence are all substrate-content properties. The system's [regime-record](regime-record.md) reference (via the matching `rule-language-fragment` field) determines which of the four [regimes](../theorems/regime-classification-for-substrate.md) the substrate's closure machinery operates in.

The pattern composes with [closure-rule-record](closure-rule-record.md) (the system's elements), with [witness](witness.md) (which cites the system's version hash), with [scope-record](scope-record.md) (which the system's applicability respects), and with the [agential-orchestration-platform](theories/agential-orchestration-platform/concepts/skill.md) subtheory's skill discipline (where each agential skill is a closure-rule-record-or-system at the agential level).
