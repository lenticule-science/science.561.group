---
type: theorem
status: proved
depends-on: [closure-rule-language, scott-continuous-closure, four-regime-dichotomy, non-scott-continuous-firing-ordinal, regime-chain-order]
see-also: [regime-antimonotonicity, transfinite-bounded-regime-h1-generators, closure-rule-system, closure-rule]
---

# Antecedent structure bounds settling regime

For a [closure-rule system](teaching/explanations/closure-rule-system.md) $\mathcal{S}$ over base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$, the antecedent quantifier structure of the rules determines the settling regime:

1. **Quantifier-free → Scott-continuous bound.** If every rule in $\mathcal{S}$ has a quantifier-free antecedent, then $\mathrm{Cl}_\mathcal{S}$ is [Scott-continuous](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/closure-operator/content/scott-continuous-closure/scott-continuous-closure.md) and $\mathrm{reg}(\mathcal{S}) \leq \mathrm{scott\text{-}cont}$.

2. **Finiteness → strict.** If additionally $\mathbf{L}$, $E$, and $\mathcal{C}$ are all finite, then $\mathrm{reg}(\mathcal{S}) = \mathrm{strict}$.

3. **Universal quantifier ↔ supra-Scott-continuous.** $\mathrm{reg}(\mathcal{S}) > \mathrm{scott\text{-}cont}$ iff $\mathcal{S}$ contains at least one rule with a universal quantifier ranging over an infinite domain.

## Proof

**Part 1.** Let $r \in \mathcal{S}$ be a rule with quantifier-free antecedent. By the [closure-rule language](teaching/explanations/closure-rule-language.md), the antecedent is a positive Boolean combination of $\geq_k$-atoms of the form $v(q)(s_1, s_2) \geq_k V$. Each such atom is an upward-closed open condition in the Scott topology on the [predication fiber algebra](../objects/predication-fiber-algebra.md): if the atom holds at the limit of a directed $\leq_k$-family, it holds at some stage of the family, because $\leq_k$-chains are Scott-open. Positive Boolean combinations (finite conjunctions and disjunctions) of Scott-open conditions are Scott-open. Hence $r$ fires at some stage $\sigma_0$ strictly below any directed limit $\mu$ at which it would fire, making $\mathrm{Cl}_r$ Scott-continuous.

The closure operator $\mathrm{Cl}_\mathcal{S} = \bigvee_{r \in \mathcal{S}} \mathrm{Cl}_r$ is the join of Scott-continuous operators; a join of Scott-continuous operators over a complete lattice is Scott-continuous. By the [four-regime dichotomy](../../../references/four-regime-dichotomy.md), a Scott-continuous $\mathrm{Cl}$ gives closure ordinal $\kappa \leq \omega$, hence $\mathrm{reg}(\mathcal{S}) \leq \mathrm{scott\text{-}cont}$. $\square$

**Part 2.** Finite $\mathbf{L}$, $E$, $\mathcal{C}$ make each predication fiber algebra $A_p = \mathbf{L}^{\bowtie E \times E}$ finite. Every $\leq_k$-ascending chain in a finite algebra is finite, so $\kappa < \omega$. By the four-regime dichotomy, $\kappa < \omega$ iff strict regime. $\square$

**Part 3.** $(\Leftarrow)$: A universal antecedent $\forall x.\,\phi(x; v)$ ranging over an infinite domain is not Scott-open: the universal holds at the $\omega$-limit of the chain of stages (where every $x$ has been witnessed) but fails at every finite stage (some $x$ always remains unwitnessed). This is exactly a [non-Scott-continuous firing ordinal](../../settling-continuity/content/non-scott-continuous-firing-ordinal/non-scott-continuous-firing-ordinal.md) at the limit ordinal $\omega$ (or later), giving $\kappa > \omega$.

$(\Rightarrow)$: If $\mathrm{reg}(\mathcal{S}) > \mathrm{scott\text{-}cont}$, then $\kappa > \omega$. By definition of [non-Scott-continuous firing ordinal](../../settling-continuity/content/non-scott-continuous-firing-ordinal/non-scott-continuous-firing-ordinal.md), there exists a limit stage $\mu \leq \kappa$ at which some rule $r$ fires for the first time and that firing is not Scott-continuous: $\bigvee_{\sigma < \mu} \mathrm{Cl}_r(v_\sigma) < \mathrm{Cl}_r(\bigvee_{\sigma < \mu} v_\sigma)$. The antecedent of $r$ is satisfied at the join but not at any finite stage. By Part 1 (contrapositive), the antecedent of $r$ contains a universal quantifier over an infinite domain. $\square$

## Syntactic criterion

Combining the three parts: the regime of $\mathcal{S}$ is completely determined by the antecedent syntax:

| Antecedent type | Regime bound |
|---|---|
| All quantifier-free, all parameters finite | Strict |
| All quantifier-free, some parameter infinite | At most Scott-continuous |
| Contains $\forall$ over infinite domain | Transfinite-bounded or aperiodic |

The distinction between transfinite-bounded and aperiodic within the third row depends on the cofinality of the state space, not on the rule syntax alone.

## What this theorem does not claim

The bound in Part 1 is an upper bound, not a characterization. A system with only quantifier-free rules over an infinite entity set might reach exactly $\kappa = \omega$ (Scott-continuous regime) or might terminate at $\kappa < \omega$ (strict regime) if the rule-entity interaction happens to stabilize finitely. The theorem says the upper bound is Scott-continuous; the exact regime depends on the base parameters.
