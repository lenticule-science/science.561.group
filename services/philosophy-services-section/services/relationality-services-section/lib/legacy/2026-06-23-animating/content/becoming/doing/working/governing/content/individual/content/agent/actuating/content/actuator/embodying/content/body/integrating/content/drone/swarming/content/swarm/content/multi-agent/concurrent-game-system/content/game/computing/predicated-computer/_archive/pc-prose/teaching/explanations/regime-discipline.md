---
type: narrative
status: current
introduces: [regime-record, regime-engineering-envelope]
recaps: [regime-classification-for-substrate, four-regime-dichotomy]
discusses: [strict-regime-engineering-envelope, scott-continuous-regime-engineering-envelope, transfinite-bounded-regime-engineering-envelope, aperiodic-regime-engineering-envelope, rule-language-realizability-determines-regime, federation-convergence, snapshot-replay-fidelity, audit-content-via-inconsistency-sheaf-cohomology]
---

# Regime discipline: declaring, engineering for, and federating across the four regimes

The substrate's [four-regime classification](../theorems/regime-classification-for-substrate.md) is not just a structural fact about closure ordinals — it is the substrate's *primary engineering parameter*, a declaration the substrate makes once at substrate-record creation and lives with through every fuel decision, every federation handshake, every snapshot, every audit. This narrative walks through what the regime declaration commits the engineering to, how the four regimes differ in what they require of the engine, and how regime-distinguished substrates federate across regime boundaries.

## The regime is a declaration, not a discovery

The first move that distinguishes regime-disciplined engineering from undisciplined engineering: the substrate *declares* its regime in a [regime record](../objects/regime-record.md) at substrate creation, rather than letting the regime emerge implicitly from scattered engineering choices.

A substrate without a regime record has its regime implicit in policy fields scattered across the engineering: the fuel policy says "finite per cascade" implies strict or Scott-continuous; the snapshot policy says "endpoint only" implies the same; the federation discipline says "ship endpoint state" implies the same; the audit machinery's cohomology bound is unset implying the regime supports trivial $H^1$. These implicit regime indicators may or may not agree; if they disagree, the substrate's engineering is fighting itself. The regime record makes the regime explicit and one source of truth.

The regime record's declaration captures four substrate parameters:

- The **regime** itself: one of `strict`, `scott-continuous`, `transfinite-bounded`, `aperiodic`.
- The **rule-language fragment**: per [rule-language-realizability-determines-regime](../theorems/rule-language-realizability-determines-regime.md), `quantifier-free` for the strict and Scott-continuous regimes, `with-forall-blocks` for the transfinite-bounded and aperiodic regimes.
- The **base finiteness**: declarations of which of $\mathbf{L}$ (value-domain), $E$ (entity set), $\mathcal{C}$ (predicate category) are finite or infinite. All-finite gives the strict regime; some-infinite gives the others.
- The **state-space cofinality**: countable for transfinite-bounded, $\geq \omega_1$ for aperiodic.

The four parameters jointly determine the regime; per [rule-language-realizability-determines-regime](../theorems/rule-language-realizability-determines-regime.md), the determination is a function. A regime record whose declared `regime` field disagrees with what the parameters support is malformed.

## Per-regime engineering envelopes

Each of the four [regime engineering envelope theorems](../theorems/strict-regime-engineering-envelope.md) walks through what the substrate's engineering can *assume* — and must *engineer for* — in each regime.

### Strict regime envelope

A strict-regime substrate (finite $\mathbf{L}$, $E$, $\mathcal{C}$ + quantifier-free rules) is the *easy case*: everything is finite, polynomial, deterministic. The engine is $\omega$-bounded; audit is polynomial in the substrate content size; federation ships endpoint state; snapshots are endpoint-only; equivalence is decidable cheaply per [strict-regime-mld-trivial](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/strict-regime-mld-trivial.md). The classical-computing comfort zone — relational databases, finite TBoxes, finite Kripke frames, finite knowledge graphs — sits here. Most engineering substrates start here and stay here.

### Scott-continuous regime envelope

A Scott-continuous-regime substrate (some infinite component + quantifier-free rules) is the *infinite-content but finitary-inference* case. Each finite prefix is strict-like; the global $\omega$-limit is the directed colimit of the prefixes per [transfinite-settling-convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/transfinite-settling-convergence.md). The engine is finite-prefix-bounded; audit is polynomial per prefix; federation ships settled-prefix endpoints; snapshots are anchored at finite prefixes. Description logics over infinite domains, logic programming over infinite Herbrand bases, knowledge bases with countable entity spaces and finitary closure rules — all live here.

### Transfinite-bounded regime envelope

A transfinite-bounded-regime substrate ($\forall$-block rules + countable cofinality) is where the substrate's engineering first encounters non-trivial $H^1$. Each non-Scott-continuous firing ordinal $\mu \in L_{\mathrm{ns}}(\kappa)$ contributes one $\mathbb{Z}$-generator to $H^1$ per [transfinite-bounded-regime-h1-generators](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/transfinite-bounded-regime-h1-generators.md). The engine must support transfinite stage admission per [wavefront-termination](../theorems/wavefront-termination.md); audit must enumerate $H^1$-class generators by firing ordinal; federation must ship trajectory (not just endpoint); snapshots must record the firing-ordinal pattern. The smallest natural example is the [quantifier-induced transfinite settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/examples/quantifier-induced-transfinite-settling.md) at $\kappa = \omega + 1$.

The realizable expressive range over the bare $\Pi_1$+$<$ rule-language fragment is exactly *initial segments of countable limit ordinals* per [transfinite-bounded-regime-realizability](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/transfinite-bounded-regime-realizability.md) — a one-parameter family indexed by $\kappa$. Richer rule-language fragments (named-ordinal entity-equality literals, ordinal-arithmetic primitives) extend the realizable family per [rule-language-fragment-realizability-refinement](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/rule-language-fragment-realizability-refinement.md), with the engineering envelope correspondingly extending but staying within the transfinite-bounded regime as long as the cofinality remains countable.

### Aperiodic regime envelope

An aperiodic-regime substrate ($\forall$-block rules + cofinality $\geq \omega_1$) is the *uncountable-depth case*. The closure ordinal reaches $\omega_1$ or larger; no countable-stage termination is admissible without scoping to a bounded prefix. $H^1$ is the direct limit of countable-truncation $H^1$s per [aperiodic-regime-cohomology-via-direct-limit](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/aperiodic-regime-cohomology-via-direct-limit.md), following the [Anderson–Putnam template](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/anderson-putnam-direct-limit.md). The engine is uncountable-aware or prefix-scoped; audit enumerates up to a declared bound or summarizes by pattern; federation ships truncation-trajectory; snapshots are truncation-anchored.

In practice, most engineering substrates declare transfinite-bounded or stricter regimes and scope to bounded prefixes when crossing into aperiodic territory; the aperiodic envelope is where the substrate's engineering meets the theory's deepest classification result.

## Federation across regime boundaries

A central engineering question is how to federate substrates whose regime records declare different regimes. The general rule per [federation-convergence](../theorems/federation-convergence.md): federation between substrates in incompatible regimes is admissible only with explicit prefix-scoping or trajectory shipping. The four regimes form a *partial order* of admissibility:

- Strict ≤ Scott-continuous: a strict substrate's content is also Scott-continuous-admissible (Scott-continuity is vacuous on finite bases). Federation is direct.
- Scott-continuous ≤ Transfinite-bounded: a Scott-continuous substrate's content is also transfinite-bounded-admissible (the firing-ordinal set $L_{\mathrm{ns}}$ is empty for Scott-continuous, so the cohomological invariant is trivial). Federation requires the transfinite-bounded side to translate the empty firing-ordinal set into its trajectory format.
- Transfinite-bounded ≤ Aperiodic: a transfinite-bounded substrate's content is also aperiodic-admissible (the bounded firing-ordinal set is a finite truncation of the aperiodic direct limit). Federation requires the aperiodic side to receive the bounded truncation as one piece of the direct-limit assembly.

The reverse directions require *prefix-scoping*: a substrate in a higher regime federating with one in a lower regime must scope its federation traffic to a region admissible in the lower regime. Concretely:

- An aperiodic substrate federating with a transfinite-bounded substrate must scope its traffic to a bounded countable truncation.
- A transfinite-bounded substrate federating with a Scott-continuous substrate must scope its traffic to a Scott-continuous prefix (a region with no non-Scott-continuous firings).
- A Scott-continuous substrate federating with a strict substrate must scope its traffic to a finite prefix.

The substrate's [scope-record](../objects/scope-record.md) is the engineering primitive for such scoping: a scope's `closure-rule-subset` and `vocabulary` determine the regime of operations within that scope per [closure-conditions-composability](../theorems/closure-conditions-composability.md). A substrate hosts a Scott-continuous-prefix scope for federation traffic to a Scott-continuous peer; the scope's regime is Scott-continuous regardless of the substrate's broader regime.

## Audit across regimes

Per [audit-content-via-inconsistency-sheaf-cohomology](../theorems/audit-content-via-inconsistency-sheaf-cohomology.md), audit content lives in the [inconsistency-sheaf record](../objects/inconsistency-sheaf-record.md)'s cohomology. The audit machinery is regime-distinguished via the [query-inconsistency-cohomology](../morphisms/query-inconsistency-cohomology.md) operator:

- **Strict / Scott-continuous regimes.** $H^1 = 0$, so audit reduces to $H^0$-counts of $\top$-cells. Audit cost is polynomial; the audit machinery's cohomology branch is dead code in these regimes.
- **Transfinite-bounded regime.** $H^1$ is non-zero with one generator per non-Scott-continuous firing ordinal in $L_{\mathrm{ns}}(\kappa)$. Audit must enumerate by firing-ordinal traversal; the audit machinery's cohomology branch is active.
- **Aperiodic regime.** $H^1$ is the direct limit at $\omega_1$ scale. Audit either enumerates up to the regime record's declared `audit-cohomology-bound` or summarizes by firing-ordinal pattern; the cohomology branch is active and the bound is actively consulted.

The substrate's audit operations in each regime cite the [inconsistency-sheaf record](../objects/inconsistency-sheaf-record.md) by hash and the regime record by hash; replay reproduces the historical audit result.

## Snapshots across regimes

Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), snapshot policy is regime-determined:

- **Strict / Scott-continuous regimes.** Endpoint-only snapshots (or, for Scott-continuous, finite-prefix-anchored snapshots) reproduce historical results byte-for-byte. Trajectory snapshots are over-engineered.
- **Transfinite-bounded regime.** Snapshots must record the firing-ordinal pattern up to the snapshot's step ordinal. Replay from such snapshots reproduces subsequent firing-ordinal sequences byte-for-byte.
- **Aperiodic regime.** Snapshots are taken at countable truncations and record the firing-ordinal pattern up to the truncation. Replay assembles subsequent truncations via direct-limit.

A substrate's snapshot machinery in each regime stores in regime-compatible format; cross-regime snapshot exchange requires translation, with the same prefix-scoping rules as for federation.

## Why the discipline matters

The regime discipline is what makes the substrate's transfinite content engineering-tractable. Without it, every substrate engineering decision implicitly assumes one regime, and the decisions can disagree (the fuel policy says strict, the audit says transfinite-bounded, the federation discipline says Scott-continuous). With it, the regime is one substrate parameter, all engineering decisions are regime-compatible, and cross-regime operations have explicit prefix-scoping.

Three concrete payoffs:

- **A substrate's regime is queryable.** External tools (auditors, federation peers, monitoring systems) can read the regime record and adjust their behavior accordingly. A federation peer querying the substrate's regime learns immediately whether endpoint-state federation is admissible.
- **Regime promotion is an audit event.** When a substrate's rule-language is extended in a way that crosses a regime boundary (per [rule-language-realizability-determines-regime](../theorems/rule-language-realizability-determines-regime.md)), the regime record is updated, the engineering machinery is upgraded, and the upgrade itself is recorded as an audit event in the [event log](../objects/event-log.md). Regime drift is structurally detectable.
- **The four regimes give a complete coverage.** Per [regime-classification-for-substrate](../theorems/regime-classification-for-substrate.md), every conformant substrate falls into one of the four regimes. The engineering envelopes for the four regimes therefore *exhaust* the engineering possibilities; the substrate's discipline is to declare which one it operates in and engineer for that envelope.

The regime discipline is the substrate's *answer* to the question "how do I build a transfinite-content computer that is also engineering-tractable?": classify content by closure ordinal, declare the regime, engineer the envelope, federate across boundaries with prefix-scoping. The four regimes are the substrate's organizing principle for its transfinite machinery, and the regime record is where that organizing principle lives as substrate content.
