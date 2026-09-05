---
type: question
status: partial
explores: [charter-as-closure-system, closure-rule-language]
---

# Which closure-rule-language fragment corresponds to each charter tier?

The [charter-as-closure-system theorem](../theorems/charter-as-closure-system.md) commits that the charter's rule-tier hierarchy (rules > guidelines > preferences > instructions) corresponds to a hierarchy of [closure-rule-language](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-language.md) fragments — rules use a more-restricted fragment than guidelines, etc. The math program's [rule-language fragment realizability refinement](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/rule-language-fragment-realizability-refinement.md) classifies behaviors per fragment.

## Derivation of the correspondence

The fragment hierarchy must satisfy a structural constraint from [charter-as-closure-system](../theorems/charter-as-closure-system.md): the *rules tier* must keep compliance decidable (in the strict or Scott-continuous regime), and each lower tier may admit richer fragments at the cost of higher-regime compliance checking.

The constraint is: let tier $X$ use fragment $\mathcal{L}_X$; then compliance checking for the $X$-tier must be computationally feasible for an operational working community. "Computationally feasible" means at most Scott-continuous-regime decidability for rules and guidelines (the tiers a community checks regularly), and transfinite-bounded-regime feasibility for preferences and instructions (checked less frequently, with more deliberate review).

### Tier 1: Rules — bare Π₁ (ground-atom conjunctive antecedents)

A *rule* is a charter commitment that must hold under all operational conditions without exception. To be checkable in the strict regime, a rule's antecedent must not require quantification over variable-domain sets or aggregation over unbounded collections. The antecedent's atoms must be ground or one-variable (with the variable ranging over a fixed finite domain — the current agent-set or task-set, bounded at any operational snapshot).

Fragment $\mathcal{L}_{\mathrm{rules}}$: **bare Π₁** — antecedents are finite conjunctions of ground or single-variable (finite-range) predication-cell equalities; consequents are single cell-value assertions.

Example from the library's charter: "No invisible labor — every increment of work on a task must appear in the event log as a witness." The antecedent detects a work-increment not matched by a witness cell; the consequent asserts a `violation-record` cell. Both are ground (no quantification over unknown sets). The rule fires or not in finite time.

**Regime:** Strict-class. Any settling is checkable for rules-tier compliance in finitely many closure steps. This is the [charter-as-closure-system](../theorems/charter-as-closure-system.md) regime constraint, now grounded in the fragment.

### Tier 2: Guidelines — Π₁ with entity-set quantification

A *guideline* is a charter commitment that should hold unless a rule's outcome takes precedence. Guidelines may quantify over the *currently known* entity-set (agents, tasks, capabilities enumerated in the current operations base), but this set is finite at any snapshot. The antecedent may range over $\forall a \in E_{\mathrm{op}}$ or $\exists a \in E_{\mathrm{op}}$ where $E_{\mathrm{op}}$ is fixed at the time of rule firing.

Fragment $\mathcal{L}_{\mathrm{guide}}$: **Π₁ with bounded first-order quantification** — antecedents may include $\forall a \in E_{\mathrm{op}}: \phi(a)$ or $\exists a \in E_{\mathrm{op}}: \phi(a)$ where the domain $E_{\mathrm{op}}$ is the current operations base's entity set (finite). Consequents remain single or finitely-conjunctive cell-value assertions.

Example: "Every assigned task should have a completion criterion stated." The antecedent quantifies over all currently-assigned tasks; the consequent asserts a `needs-completion-criterion` cell for each one lacking the criterion. The quantification is over the current finite task-set — Π₁ with bounded quantification.

**Regime:** Scott-continuous-class at most. If the entity-set grows across stages (new tasks/agents being added), the guidelines' LFP may require $\omega$ steps (one firing per entity arriving). But for a fixed snapshot, checking is polynomial in $|E_{\mathrm{op}}|$.

**Fragment relationship to rules.** $\mathcal{L}_{\mathrm{rules}} \subset \mathcal{L}_{\mathrm{guide}}$: every rule-fragment expression is a degenerate case of the guideline fragment (bounded quantification over a singleton set, or no quantification at all). The containment is strict: guidelines can express universal claims over the whole entity-set that rules cannot.

### Tier 3: Preferences — Π₁ with order and aggregate side-conditions

A *preference* is a soft commitment: the community prefers this behavior but it does not rise to a guideline. Preferences may involve ordering comparisons (one value preferred over another), aggregate summaries (the average number of open tasks per agent should be below a threshold), or relational conditions that are more complex than bounded quantification.

Fragment $\mathcal{L}_{\mathrm{pref}}$: **Π₁ with side-conditions** — antecedents may include arithmetic side-conditions on cell values, simple aggregate predicates (counts, sums over the current entity-set, using the slot-cell encoding from [capacity-as-substrate-property](../questions/capacity-as-substrate-property.md)), and ordering comparisons. The side-conditions are computable from the current settling but require more than bilattice-algebraic operations.

Example: "Prefer to assign tasks to agents with fewer current assignments." The antecedent computes each eligible agent's current load (via slot-cell count), compares across agents, and identifies the agent with minimum load. The comparison is a side-condition on natural-number-valued slot cells — outside bare Π₁ but computable in the strict regime from the slot-cell encoding.

**Regime:** Strict-class for finite-agent finite-task populations, with the slot-cell capacity encoding. If the preference involves genuinely transfinite aggregation (e.g., "prefer decisions consistent with the best outcome across all future cadence steps"), it lifts to transfinite-bounded. The common operational preferences are strict-regime side-conditions.

### Tier 4: Instructions — unrestricted Π₁ (and potentially Π₂)

An *instruction* is guidance specific to an agent or operation, most fine-grained and flexible. Instructions may be agent-specific, task-type-specific, or context-conditional in ways that the higher tiers do not express. Instructions may reference dynamic conditions, history-dependent patterns, or domain-specific procedural structures.

Fragment $\mathcal{L}_{\mathrm{inst}}$: **unrestricted Π₁** plus potentially **Π₂** (antecedents may quantify over both cells and closure-rule firings, or express "for all future stages" conditions). The instructions fragment is the least-restricted and admits the richest expressiveness at the cost of the richest regime.

A Π₂ antecedent of the form "if this condition holds in all future stages, then assert..." is non-Scott-continuous (the future-stage universal introduces a limit quantifier). Instructions with such antecedents lift the tier's LFP into the transfinite-bounded or aperiodic class. However, because instructions are lowest-precedence and gated by the tier-settlement-marker mechanism (cells pinned by rules/guidelines/preferences are not touched), the instruction tier's regime does not propagate upward to affect the rules tier's compliance check.

**Regime:** Varies. Practical instructions for a working community are typically strict or Scott-continuous (they reference current cell values, not transfinite aggregations). The fragment's expressive power is the maximum; most uses stay well within Π₁.

## Fragment correspondence table

| Tier | Fragment $\mathcal{L}_X$ | Antecedent expressive power | Compliance regime |
|---|---|---|---|
| Rules | Bare Π₁ | Ground or single-variable (finite-range) conjunctions | Strict |
| Guidelines | Π₁ + bounded FOL | Bounded $\forall$/$\exists$ over current entity-set | Scott-continuous |
| Preferences | Π₁ + arithmetic side-conditions | Slot-cell counts, ordering comparisons | Strict (with slot-cell encoding) |
| Instructions | Unrestricted Π₁ (+ Π₂) | Arbitrary antecedents including dynamic conditions | Varies; typically strict to Scott-continuous in practice |

## Relation to the AOP formality layers F0–F3

The [AOP formality-layer](../../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/concepts/formality-layer.md) progression F0–F3 (informal → propositional → first-order → fixpoint) is not identical to the charter tier hierarchy but overlaps:

- F0 (informal): no closure-rule structure; corresponds to *no tier* in the charter — purely human-judgment operations outside the substrate.
- F1 (propositional): ground Π₁; maps to the *rules tier* ($\mathcal{L}_{\mathrm{rules}}$).
- F2 (first-order): bounded-FOL Π₁; maps to the *guidelines tier* ($\mathcal{L}_{\mathrm{guide}}$).
- F3 (fixpoint): Π₂ and beyond; partially maps to *instructions tier* in its richest form.

The charter tier hierarchy is *not* the same as the formality-layer progression: preferences (tier 3) use arithmetic side-conditions, which are F2-class by complexity but F1 in quantifier structure. The two hierarchies run along different dimensions — formality-layer classifies logical complexity; charter-tier classifies normative weight. They intersect but neither subsumes the other.

## What this determines operationally

Knowing the fragment correspondence gives the working community:

1. **Which charter violations are substrate-detectable.** Rules-tier violations are detectable in the strict regime (finite-time check). Guidelines-tier violations are detectable at each operational cycle via Scott-continuous firing.
2. **Which violations require external review.** A Π₂-antecedent instruction violation (transfinite-bounded or aperiodic class) cannot be checked in finite time; it requires deliberate review, not automatic detection.
3. **What a charter amendment means.** Moving a guideline to the rules tier requires weakening its fragment from Π₁+FOL to bare Π₁ — simplifying the antecedent to remain ground-or-single-variable. Moving a rule to instructions allows fragment enrichment but lowers its precedence.

## Remaining open

The precise list of the library's current charter rules, guidelines, preferences, and instructions has not been computed against the fragment table. Doing so would verify that the tier assignments in the charter are consistent with the fragment-compliance-regime constraint — and would identify any rules currently written with guideline-tier fragment complexity that should either be simplified or reclassified. This is the analysis step the question originally required.
