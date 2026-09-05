---
kind: theorem
status: proved
depends-on: [meta-moduli-stack-theorem, meta-moduli-prestack, four-regime-dichotomy, closure-rule-language, closure-rule-system, transfinite-bounded-regime-h1-generators, aperiodic-regime-classification]
---

# Meta-stratification by regime

The [meta-moduli stack](meta-moduli-stack-theorem.md) $\mathscr{M}^{\mathrm{meta}}$ stratifies into four locally-closed substacks, each indexed by a [closure-regime](four-regime-dichotomy.md):

$$\mathscr{M}^{\mathrm{meta}} \;=\; \mathscr{M}^{\mathrm{meta}}_{\mathrm{strict}} \;\sqcup\; \mathscr{M}^{\mathrm{meta}}_{\mathrm{SC}} \;\sqcup\; \mathscr{M}^{\mathrm{meta}}_{\mathrm{TB}} \;\sqcup\; \mathscr{M}^{\mathrm{meta}}_{\mathrm{aper}}.$$

A closure-rule system $\mathcal{S}$ is in meta-stratum $R \in \{\text{strict}, \text{SC}, \text{TB}, \text{aper}\}$ iff $R$ is the *maximum* regime any settling under $\mathcal{S}$ can attain — equivalently, iff the [rule-language fragment](../concepts/closure-rule-language.md) of $\mathcal{S}$ is exactly the fragment that generates regime-$R$ settlings.

This is the meta-level four-regime dichotomy — paralleling the settling-level [four-regime classification](four-regime-dichotomy.md) one level up.

## Statement

**Theorem (meta-stratification, draft).** Let $\mathcal{S}$ be a closure-rule system over a base $B \in \mathbf{B}$.
Then exactly one of the following holds:

1. **Meta-strict** ($\mathcal{S} \in \mathscr{M}^{\mathrm{meta}}_{\mathrm{strict}}$): every settling $v_\mathcal{S}$ under $\mathcal{S}$ has closure ordinal $\kappa < \omega$.

2. **Meta-Scott-continuous** ($\mathcal{S} \in \mathscr{M}^{\mathrm{meta}}_{\mathrm{SC}}$): some settling under $\mathcal{S}$ has $\kappa = \omega$, and no settling has $\kappa > \omega$.

3. **Meta-transfinite-bounded** ($\mathcal{S} \in \mathscr{M}^{\mathrm{meta}}_{\mathrm{TB}}$): some settling under $\mathcal{S}$ has $\omega < \kappa < \omega_1$, and no settling has $\kappa \geq \omega_1$.

4. **Meta-aperiodic** ($\mathcal{S} \in \mathscr{M}^{\mathrm{meta}}_{\mathrm{aper}}$): some settling under $\mathcal{S}$ has $\kappa \geq \omega_1$.

The classification is determined by the *rule-language fragment* of $\mathcal{S}$ — a syntactic invariant.

## Why "supremum-of-settling-regime"

A closure-rule system $\mathcal{S}$ admits *many* settlings $v_\mathcal{S}^U$, one per increment sequence $U$.
The settlings can have different closure ordinals depending on $U$.
Specifically:

- For the trivial $U$ (no increments), the settling is empty and the closure operator does nothing — $\kappa = 0$, strict regime.
- For richer $U$ (containing content that forces non-trivial closure), the settling can reach higher regimes.

The relevant invariant is the *maximum* regime any $U$ can drive $\mathcal{S}$ into.
This is the meta-regime of $\mathcal{S}$.
It is a *property of $\mathcal{S}$ alone*, independent of $U$.

## The rule-language characterization

The rule-language fragment of $\mathcal{S}$ — which formulas $\phi$ are allowed as antecedents — determines the meta-regime via the [closure-rule language](../concepts/closure-rule-language.md) and [four-regime dichotomy](four-regime-dichotomy.md):

- **Strict-fragment** ($\Sigma_0$ / $\Pi_0$, atomic-only): the closure operator is finitely iterable; every settling is strict. $\mathcal{S} \in \mathscr{M}^{\mathrm{meta}}_{\mathrm{strict}}$.
- **Scott-continuous fragment** (atomic + finite conjunctions / disjunctions): the closure operator commutes with directed colimits; settlings reach at most $\kappa = \omega$. $\mathcal{S} \in \mathscr{M}^{\mathrm{meta}}_{\mathrm{SC}}$.
- **$\Pi_1$-fragment** (universal quantifiers, possibly nested with finite-arity Boolean connectives): the closure operator can fail Scott-continuity at countable limits, with $L_{\mathrm{ns}}$ countable. $\mathcal{S} \in \mathscr{M}^{\mathrm{meta}}_{\mathrm{TB}}$.
- **$\Pi_2$-fragment or higher** (alternating quantifiers, etc.): the closure operator can have $L_{\mathrm{ns}}$ uncountable. $\mathcal{S} \in \mathscr{M}^{\mathrm{meta}}_{\mathrm{aper}}$.

This is the syntactic-side characterization.
The semantic-side characterization (via supremum-of-settling-regime) agrees by the [closure-rule language theorem](../concepts/closure-rule-language.md): rule-language fragment determines achievable settling regimes.

## Proof

The proof has three pieces: stratification well-definedness, mutual disjointness, and covering completeness.

**Well-definedness.** Each closure-rule system $\mathcal{S}$ has a well-defined rule-language fragment (the smallest fragment containing all rules of $\mathcal{S}$).
By the [closure-rule language theorem](../concepts/closure-rule-language.md), this fragment determines the maximum settling-regime $\mathcal{S}$ can produce.
Hence the meta-regime assignment is well-defined and depends only on the closure-equivalence class of $\mathcal{S}$ (closure-equivalent systems have the same generated closure operator, hence the same achievable settlings, hence the same maximum regime).

**Mutual disjointness.** The four rule-language fragments are nested: strict $\subset$ SC $\subset$ $\Pi_1$ $\subset$ $\Pi_2$.
The meta-regime is the *finest* fragment $\mathcal{S}$ requires — equivalently, the *highest* settling-regime $\mathcal{S}$ can produce.
This assignment is unique: a rule system is in exactly one meta-stratum.

**Covering completeness.** Every closure-rule system has *some* rule-language fragment (the trivial fragment covers all rules).
Hence every system is in some meta-stratum.
Combined with mutual disjointness: the four meta-strata partition $\mathscr{M}^{\mathrm{meta}}$.

**Locally-closed substack structure.** The meta-strata are *locally closed*: each is the intersection of an open condition (rule-language fragment is at most $F$) with a closed condition (rule-language fragment is at least $F$).
Both conditions descend along covers in $J_\mathbf{B}$ by the equational-descent of rule formulas (Step 1 of the [meta-moduli stack theorem](meta-moduli-stack-theorem.md)).
Hence each meta-stratum is a substack. $\square$

## What this gives

Three structural consequences:

**1.
The meta-classifier inherits the four-regime dichotomy.** The corpus's structural taxonomy (strict / Scott-continuous / transfinite-bounded / aperiodic) lifts uniformly from settlings to closure-rule systems.
The four-regime dichotomy is therefore not specific to a single level — it's a *recurring stratification* in the CHL apex tower.

**2.
Aperiodicity is a meta-level property of rule systems.** A closure-rule system "is aperiodic" iff some settling under it reaches $\kappa \geq \omega_1$.
This is a syntactic property of the rule-language: the system contains $\Pi_2$ or richer formulas.
Aperiodic-stratum systems are the meta-classifier's "aperiodic stratum" — the corpus's most complex meta-objects.

**3.
The meta-realizability map respects strata.** The [meta-realizability map](meta-realizability-map.md) sends $\mathcal{S}$ to its settling moduli stack.
Under this map, $\mathscr{M}^{\mathrm{meta}}_R$ maps into the regime-$R$ sub-moduli of $\mathscr{M}^{\mathrm{SKH}}$.
The meta-stratification and the settling-level regime stratification are *compatible* via the realizability map.

## Comparison with the settling-level dichotomy

| Level | Stratum-of | Stratification by |
|---|---|---|
| Settling | individual $v_\mathcal{S}^U$ | closure ordinal $\kappa(v)$ of $v$ |
| Meta | rule system $\mathcal{S}$ | maximum $\kappa$ over all $U$ |

The settling-level dichotomy classifies *one settling at a time*; the meta-level classification asks "what's the worst-case regime for this rule system, ranging over $U$?"
The two are related by: meta-regime of $\mathcal{S}$ is the supremum of settling-regimes of $v_\mathcal{S}^U$ as $U$ varies.

## Connection to the realizability program

The [realizability program](../narratives/realizability-program.md) asks which classifying classes are realized by some closure rule.
The meta-stratification refines this:

- Meta-strict realizability: which strict-regime classifying classes (trivial $H^1$) are realized?
- Meta-SC realizability: which Scott-continuous-regime classes?
- Meta-TB realizability: which transfinite-bounded $H^1$ classes?
- Meta-aperiodic realizability: which aperiodic $H^1$ classes?

Each meta-stratum has its own realizability cardinality bound.
The meta-aperiodic stratum is where the $2^{\aleph_0}$ realizability bound is achieved (per the [realizability cardinality bound theorem](realizability-cardinality-bound.md)) — *most* aperiodic classifying classes are realized only by aperiodic-stratum closure-rule systems.

## Position in the program

This theorem extends the corpus's structural taxonomy from settlings to closure-rule systems.
With it, the meta-classifier construction has the same kind of structural decomposition the existing settling moduli has — making the meta-level genuinely a *parallel* to the settling level, not a generic stack abstraction.

The chapter's frontier moves to:

- The [meta-realizability map](meta-realizability-map.md) — connecting meta-strata to settling-strata.
- Concrete examples: which closure-rule systems are in each meta-stratum, with explicit rule-language fragment annotations.
- The [meta-deformation theory](meta-moduli-deformation-theory.md) — how do deformations interact with the meta-stratification?

## Step-$n$ refinement of the meta-aperiodic stratum

The meta-aperiodic stratum $\mathscr{M}^{\mathrm{meta}}_{\mathrm{aper}}$ further decomposes into [step-$n$ moduli substacks](../objects/step-n-moduli-substack.md) by [step-$n$ meta-stratification](step-n-meta-stratification.md):

$$\mathscr{M}^{\mathrm{meta}}_{\mathrm{aper}} \;=\; \bigsqcup_{n \geq 2} \mathscr{M}^{(n)} \;\sqcup\; \mathscr{M}^{\mathrm{meta}}_{\mathrm{aper, residue}}.$$

Each $\mathscr{M}^{(n)}$ collects substitution-recurrence rules of step-depth exactly $n$: Fibonacci ($n = 2$), Padovan and Tribonacci ($n = 3$), Tetranacci ($n = 4$), and so on.
The four-regime dichotomy thus extends to a four-regime + step-$n$-tower stratification, with the [step-shift morphism](../morphisms/step-shift-morphism.md) producing an internal RG flow within the aperiodic stratum.
