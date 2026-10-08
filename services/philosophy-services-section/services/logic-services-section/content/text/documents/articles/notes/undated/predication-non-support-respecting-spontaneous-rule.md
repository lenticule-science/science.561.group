---
type: example
status: draft
depends-on: [value-agnostic-void-cone, closure-operator]
instantiates: [value-agnostic-void-cone]
title: "Counterexample: non-support-respecting closure via a spontaneous rule"
description: A closure operator that violates the support-respecting hypothesis of the value-agnostic-void-cone theorem, demonstrating that the hypothesis is load-bearing for the "$V\infty$ counts structurally-unreachable cells" interpretation —…
---

# Counterexample: non-support-respecting closure via a spontaneous rule

A closure operator that violates the support-respecting hypothesis of the [value-agnostic-void-cone theorem](../../research/2026/07/31/lenticule-import/theorems/value-agnostic-void-cone.md), demonstrating that the hypothesis is load-bearing for the "$V_\infty$ counts structurally-unreachable cells" interpretation — though not for the cohomological-pairing claim itself.

## Construction

Cell set: $\{a, b, c\}$.

Rule:

- $R_1$: $\emptyset \;\Rightarrow\; b = \mathbf{t}$.

The rule has empty antecedent, so it fires unconditionally.

Seed: $\{a\}$ (i.e., $v_0(a) = \mathbf{t}$, $v_0(b) = v_0(c) = \bot$).

## Forward trajectory

- $v_0 = \{a\}$.
- $v_1 = T(v_0) = \{a, b\}$ ($R_1$ fires; $a$ stays by inflation).
- $v_2 = T(v_1) = \{a, b\}$. Closure-stable; $\kappa = 1$.

Closure ordinal $\kappa = 1 < \omega$ — strict regime.

## Support-respecting check

The support-respecting hypothesis: $T(v_{\equiv \mathbf{0}_\mathcal{V}}) = v_{\equiv \mathbf{0}_\mathcal{V}}$, where $v_{\equiv \mathbf{0}_\mathcal{V}}$ is the all-$\bot$ presheaf.

Apply $T$ to all-$\bot$:

$$T(\{\,\}) = \{b\} \;\neq\; \{\,\}.$$

The empty set is not a fixed point — $R_1$ fires from it, producing $b$. So $T$ is **not support-respecting**.

## What breaks: structural unreachability

Without the spontaneous rule, cell $b$ is structurally unreachable from seed $\{a\}$ — there is no rule chain producing $b$ from $a$ alone. Standard intuition would say "$b$ should be permanently void."

But $R_1$ fires anyway, regardless of the seed. The void cone shows:

- $V_0 = \{b, c\}$ — cells starting at $\bot$.
- $V_1 = \{c\}$ — $b$ leaves at step 1.
- $V_\infty = \{c\}$.

So $b \notin V_\infty$, despite being structurally unreachable from the seed.

The "$V_\infty$ = structurally-unreachable cells" reading of Step 2 of the value-agnostic theorem fails. The proof relied on support-respecting to rule out exactly this case: spontaneous firings that move cells out of the void without seed-provenance.

## What still works: cohomological pairing

The firing-set $L_{\mathrm{ns}} = \{1\}$ (one non-Scott-continuous firing at step 1, the firing of $b$). The associated graded of the void filtration:

$$\mathrm{gr}(\mathrm{Void}_v) \;=\; \mathbb{Z}^{V_0 \setminus V_1} \;=\; \mathbb{Z}^{\{b\}} \;\cong\; \mathbb{Z}.$$

This matches $H^1(\mathcal{F}_v) \cong \mathbb{Z}$ (one generator for the firing of $b$). The Verdier-dual pairing of the [void-cone (co)homology theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/lorentzian-causal-settling/references/void-cone-cohomology.md) holds.

So the cohomology formula is intact, but its **structural interpretation** changes:

- *Support-respecting case*: the firing-counting cohomology equals the structurally-unreachable-cell complement; "void left" $=$ "seed-derivable."
- *Non-support-respecting case*: the firing-counting cohomology counts both seed-derived firings and spontaneous firings; "void left" $\neq$ "seed-derivable."

## What this means for the theorem

Step 1 (monotone descent) of the value-agnostic theorem holds without support-respecting — inflation alone is enough.

Step 2 (limit void = structurally-unreachable cells) genuinely **requires** support-respecting. The hypothesis is load-bearing here.

Step 3 (cohomological pairing) holds without support-respecting in the formula sense, but with a weaker semantic interpretation: firings can be spontaneous, so the cohomology generators no longer all correspond to seed-derivation events.

The right modification to the theorem statement: replace "$V_\infty$ = structurally-unreachable cells" with "$V_\infty$ = cells never fired by closure" (a tautological restatement). The structural-unreachability reading is recovered as a *corollary* under the support-respecting hypothesis.

## Why spontaneous rules are unusual

In predication categories' main applications — substitution settlings, knowledge bases, CRDT systems, Kripke frames — rules typically have non-empty antecedents. Spontaneous rules correspond to "axioms always asserted" or "default values." They appear naturally in:

- Truth-maintenance systems with default rules.
- Logic programs with always-applicable facts.
- Probabilistic-belief systems with non-zero priors on otherwise-unreachable states.

In each of these, the support-respecting hypothesis fails. The cohomological framework still applies but needs the weakened interpretation above.

## Position in predication categories

Demonstrates that the support-respecting hypothesis of the [value-agnostic-void-cone theorem](../../research/2026/07/31/lenticule-import/theorems/value-agnostic-void-cone.md) is genuinely load-bearing for one structural reading of the theorem (Step 2's "structurally-unreachable cells" interpretation). The cohomological-formula statement (Step 3) survives; the semantic identification weakens.

Open: the corpus could either:
- Strengthen the theorem to assume support-respecting throughout (cleanest; current form).
- Generalize to non-support-respecting closures with the weakened interpretation (broader scope, slightly less clean).
- Distinguish "well-supported settlings" (with the structural reading) from "general settlings" (with only the formula).

The [value-agnostic theorem](../../research/2026/07/31/lenticule-import/theorems/value-agnostic-void-cone.md) currently takes the first path; this counterexample motivates the open question.
