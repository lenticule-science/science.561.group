---
kind: example
status: draft
depends-on: [meta-moduli-stack-theorem, meta-stratification-by-regime, fibonacci-substitution-settling, transfinite-induction-meta-classification]
instantiates: [meta-moduli-stack-theorem, meta-stratification-by-regime]
lineage: 5
---

# Meta-classification of the Fibonacci substitution rule

The L5a instance of the [meta-moduli stack](../theorems/meta-moduli-stack-theorem.md) on a substantive aperiodic case.

## The Fibonacci substitution as a meta-point

The Fibonacci closure rule from [fibonacci-substitution-settling](fibonacci-substitution-settling.md) is a single-rule system $\mathcal{S}_\sigma$. Its rule-language fragment is essentially $\Pi_2$ (alternating quantifiers over substitution stages and positions).

## Meta-stratum

By the [meta-stratification by regime theorem](../theorems/meta-stratification-by-regime.md), $\Pi_2$ rule-language places $[\mathcal{S}_\sigma] \in \mathscr{M}^{\mathrm{meta}}_{\mathrm{aper}}$ — **meta-aperiodic**.

## Closure-equivalence class

Closure-equivalent rule systems include:

- The Fibonacci rule with equivalent substitution-stage encodings.
- Variants permuting tile-types ($a \leftrightarrow b$, etc.) — these may NOT be closure-equivalent (different generated closure operators); they are *separate* meta-points.

The Fibonacci substitution rule is a specific meta-point in the meta-aperiodic stratum, with structurally distinct neighbors corresponding to other substitutions.

## Comparison with other substitutions

| Substitution | Meta-stratum | Closure operator |
|---|---|---|
| Fibonacci ($a \mapsto ab, b \mapsto a$) | meta-aperiodic | $\Pi_2$ |
| Thue-Morse ($0 \mapsto 01, 1 \mapsto 10$) | meta-aperiodic | $\Pi_2$ |
| Penrose | meta-aperiodic | $\Pi_2$ |
| The trivial $\Pi_1$-induction (L4) | meta-transfinite-bounded | $\Pi_1$ |

All "real" aperiodic substitutions are in meta-aperiodic; the L4 transfinite-induction is a *simpler* case in meta-transfinite-bounded.

## Step-$n$ refinement: point in $\mathscr{M}^{(2)}$

By the [step-$n$ meta-stratification theorem](../theorems/step-n-meta-stratification.md), the meta-aperiodic stratum decomposes as $\mathscr{M}^{\mathrm{meta}}_{\mathrm{aper}} = \bigsqcup_{n \geq 2} \mathscr{M}^{(n)} \sqcup \mathrm{(residue)}$. The Fibonacci meta-point lies in $\mathscr{M}^{(2)}$ — the [step-$n$ moduli substack](../objects/step-n-moduli-substack.md) at $n = 2$. Compare with [padovan-meta-classification](padovan-meta-classification.md) (point in $\mathscr{M}^{(3)}$) and tetranacci (point in $\mathscr{M}^{(4)}$). The [step-shift morphism](../morphisms/step-shift-morphism.md) maps Fibonacci's meta-point to a point in $\mathscr{M}^{(3)}$ (not Padovan's, in general — see [fibonacci-to-padovan-step-shift](fibonacci-to-padovan-step-shift.md)).

## Position in Lineage 5

The L5a meta-classification instance. First concrete instance of meta-aperiodic stratum.
