---
kind: theorem
status: proved
depends-on: [transfinite-bounded-regime-realizability, aperiodic-regime-realizability, closure-rule, non-scott-continuous-firing-ordinal, parameter-base-category]
---

# Rule-language fragment realizability refinement

A refinement of the per-regime realizability theorems along the rule-language axis. The bare $\Pi_1$+$<$ rule language realizes only initial segments of countable limit ordinals (per [transfinite-bounded](transfinite-bounded-regime-realizability.md) and [aperiodic](aperiodic-regime-realizability.md) regime realizability). Richer fragments unlock additional realizable subsets, with the realizable family extending in step with the rule language's expressive power.

The theorem covers the **bare** and **named-ordinal-entity-equality** levels with full proofs. Higher fragments (ordinal-arithmetic, $\Pi_2$-schema, second-order) are *not* covered by this theorem; they are recorded as open conjectures with sketches in the final section, to be developed separately.

## Theorem (per-fragment hierarchy, proved levels)

Each enrichment of the bare $\Pi_1$+$<$ rule language extends the realizable $L_{\mathrm{ns}}$-family by a specific structural class:

| Fragment | Realizable family | Status |
|---|---|---|
| Bare $\Pi_1$+$<$ | Initial segments of countable limits | **proved** (per-regime theorems) |
| + Named-ordinal entity-equality literals | Initial segments with finitely-many specific limits dropped or added | **proved** (this theorem, below) |
| + Ordinal-arithmetic primitives | Subsets definable in ordinal arithmetic | open conjecture |
| + $\Pi_2$-rule schemas (quantifier alternation) | Higher arithmetic-hierarchy definability | open conjecture |
| + Second-order quantifiers over subsets of $E$ | Borel/analytic subsets of countable limits | open conjecture |

The proved levels (rows 1-2) have constructive lower bounds and syntactic upper bounds; the open levels have lower-bound sketches and conjectured upper bounds.

## Bare $\Pi_1$+$<$: established (refer to per-regime theorems)

The base case is the [transfinite-bounded](transfinite-bounded-regime-realizability.md) and [aperiodic](aperiodic-regime-realizability.md) per-regime theorems. Realizable $L_{\mathrm{ns}}$-subsets are exactly initial segments of countable limit ordinals, parametrized by closure ordinal.

## Proof (named-ordinal entity-equality level)

**Claim.** Adding atoms of the form $\beta = c$ for ordinal constants $c \in E$ extends the realizable family to *initial-segment-modulo-finite* subsets — initial segments of countable limits with finitely-many specific limits suppressed (via range bounds) and finitely-many later limits achieved (via secondary chains).

**Proof.** The new atomic formulas allow rule range restrictions like "$\beta < c$" (rule fires only at $\beta$ below the named ordinal $c$) and "$c < \beta$" (rule fires only above $c$). The proof uses *range-partitioning*: a finite suppression set is realized by partitioning the rule's chain into intervals whose ranges avoid the suppressed limits.

*Lower bound (constructive).* Given a target subset $S = (S_0 \cup S_+) \setminus S_-$ where:

- $S_0$ is the set of countable limit ordinals below some $\eta_0$ (initial segment up to $\eta_0$),
- $S_+ = \{\nu_1, \ldots, \nu_m\}$ is a finite set of countable limits above $\eta_0$,
- $S_- = \{\mu_1 < \mu_2 < \cdots < \mu_n\}$ is a finite set of countable limits in $S_0$,

construct a closure-rule system whose $L_{\mathrm{ns}}$ equals $S$.

*Range-partitioned chain for $S_0 \setminus S_-$.* Set $\mu_0 = 0$ and $\mu_{n+1} = \eta_0$. Use $n+1$ transfinite-induction rules $r_0, r_1, \ldots, r_n$, each operating on a disjoint interval of the ordinal axis:

- Rule $r_i$ has range $\mu_i \leq \beta < \mu_{i+1}$ — encoded by named-ordinal entity-equality literals as the antecedent fragment "$\mu_i \leq \beta \wedge \beta < \mu_{i+1}$".
- Each rule is seeded by an increment at the start of its interval (cell $(\mu_i, \mu_i)$), sufficient to launch the chain.
- Rule $r_i$'s chain runs from $\mu_i$ via successor stages through every countable limit in its half-open interval $[\mu_i, \mu_{i+1})$, contributing each such limit to $L_{\mathrm{ns}}$.

By construction, no rule's range contains any $\mu_j \in S_-$ (each $\mu_j$ is the upper boundary of $r_{j-1}$'s range, and the half-open convention $\beta < \mu_{i+1}$ excludes the upper boundary; $\mu_j$ is also the lower boundary $\mu_i$ of $r_j$'s range, where it occurs as a successor seed but not as a closure-firing limit). So $\mu_j \notin L_{\mathrm{ns}}$ for every $j \in \{1, \ldots, n\}$.

The combined contribution of rules $r_0, \ldots, r_n$ is exactly $\{\text{countable limits} < \eta_0\} \setminus S_- = S_0 \setminus S_-$.

*Isolated firings for $S_+$.* For each $\nu_j \in S_+$ above $\eta_0$, use a separate rule with range $\nu_j - \omega < \beta < \nu_j + 1$ (encoded via $\nu_j - \omega$ and $\nu_j$ as named ordinals; $\nu_j - \omega$ is well-defined as the predecessor in the canonical $\omega$-sequence converging to $\nu_j$). Seed by an increment at $(\nu_j - \omega, \nu_j - \omega)$. The chain runs from $\nu_j - \omega$ via successor stages to $\nu_j$, contributing $\nu_j$ to $L_{\mathrm{ns}}$ as a non-Scott-continuous firing. The range bound $\beta < \nu_j + 1$ caps the chain at $\nu_j$.

Combining: the full system's $L_{\mathrm{ns}}$ equals $(S_0 \setminus S_-) \cup S_+ = S$. $\square$

*Upper bound.* Every rule in the fragment has its range expressible in $\{<, =\}$ over named ordinal constants — i.e., the range is a finite Boolean combination of half-open intervals $[c_i, c_j)$ for named constants. Each rule's $L_{\mathrm{ns}}$-contribution is the set of countable limits within its range, which is a finite union of initial-segment-fragments. The system's total $L_{\mathrm{ns}}$ is the union of finitely many such fragments, again expressible as an initial-segment-modulo-finite. $\square$

## Higher fragments (open conjectures)

The following levels are *not* established by this theorem; each is an open conjecture with a sketched lower-bound construction.

**Conjecture (ordinal-arithmetic primitives).** Adding atoms like "$\beta = \alpha_1 + \alpha_2$" or "$\beta = \alpha \cdot c$" allows rule ranges definable in ordinal arithmetic. The realizable family conjecturally extends to subsets definable in this fragment of ordinal arithmetic — typically arithmetically-definable subsets of countable limits (in the sense of Kleene's arithmetical hierarchy on $\omega_1$). *Open: lower bound via constructive encoding of arithmetic predicates as rule ranges; upper bound via syntactic complexity tracking.*

**Conjecture ($\Pi_2$-rule schemas).** Allowing antecedents with $\forall\exists$ alternation, the inductive iteration acquires richer non-Scott-continuous behavior — at limits where $\forall\exists$-antecedents commit. The realizable family conjecturally extends to projective-hierarchy-definable subsets at low levels. *Open: this fragment significantly extends the inductive-definability theory; precise characterization requires detailed structural induction.*

**Conjecture (second-order quantifiers).** With quantification over subsets of $E$, the rule language reaches second-order expressivity, and realizability conjecturally extends to Borel/analytic subsets of countable limits. *Open: corresponds to second-order monotone induction; classical results on $\Pi_1^1$-induction would need to be adapted.*

## A common limit

Across all fragment-extensions, the increment-sequence support remains a uniform constraint. With *countable-support* increments, no fragment realizes subsets of cardinality $> 2^{\aleph_0}$. With *unrestricted-support* increments, every subset is trivially realizable via increment-by-direct-marking, and the rule-language fragment becomes irrelevant.

The fragment hierarchy is therefore meaningful only under countable-support increments. The bare-$\Pi_1$+$<$ language realizes the *least* among these; second-order-with-Borel realizes near the *most* among them.

## Reading

The rule-language axis is the *expressivity* axis of realizability: richer rule languages encode richer subsets, with each enrichment unlocking a structurally specific class. The hierarchy parallels classical descriptive-complexity hierarchies (arithmetic vs. analytic vs. Borel; finite-rule vs. infinitary-rule recursion-theoretic classes), specialized to firing-ordinal-set characterizations.

The named-ordinal extension is the smallest non-trivial step: it unlocks finite modifications of initial segments, enough to suppress or add specific limits without escalating to ordinal arithmetic. The two examples in the corpus that exhibit this — [coupled-predicate transfinite settling](../examples/coupled-predicate-transfinite-settling.md) (uses $\mathrm{dom}(Q) = [0, \omega)$ as a named-ordinal restriction) and [converse-coupling transfinite settling](../examples/converse-coupling-transfinite-settling.md) — implicitly use named-ordinal expressivity.

## Position in the realizability program

The third axis refinement. Walks the hierarchy from bare to second-order; the bare and named-ordinal levels are proved by this theorem, the higher levels are recorded as open conjectures.

Pairs with [bigraded realizability refinement](bigraded-realizability-refinement.md) (orthogonal axis on value-types) and [$\mathcal{C}$-naturality coupling refinement](c-naturality-coupling-realizability-refinement.md) (orthogonal axis on predicate-category structure). Cross-axis questions — whether richer rule-language enables independent bigraded realizability on non-discrete $\mathcal{C}$ — remain open.
