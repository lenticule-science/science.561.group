---
type: structure
status: active
depends-on:
  - eff.md
see-also:
  - ../prose/learning/claims/four-is-image-of-omega-under-double-negation.md
  - ../code/transformers/double-negation-nucleus.md
references:
  - Belnap 1977
  - Hyland 1982
name: FOUR — the bilattice of computational truth values
description: $\mathbf{FOUR} \cong \mathbf{2} \times \mathbf{2}$ is the bilattice of external computational truth values.
---

# FOUR — the bilattice of computational truth values

$\mathbf{FOUR} \cong \mathbf{2} \times \mathbf{2}$ is the bilattice of external computational truth values. Its four elements record the settled state of a computational predicate once all computation has run:

| Element | Name | Meaning |
|---|---|---|
| $\mathbf{t} = (\top, \bot)$ | verified | $P$ has a realizer; $\neg P$ does not |
| $\mathbf{f} = (\bot, \top)$ | refuted | $P$ has no realizer; $\neg P$ does |
| $\bot = (\bot, \bot)$ | undecidable | neither $P$ nor $\neg P$ is $\neg\neg$-closed |
| $\top = (\top, \top)$ | contradictory | logically impossible in consistent theory |

## The two dimensions

$\mathbf{FOUR} = \mathbf{2} \times \mathbf{2}$ has two independent Boolean dimensions:

- **Truth dimension** (first component): $\neg\neg P$ — whether $P$ holds classically (has a realizer whose existence is $\neg\neg$-closed).
- **Decidability dimension** (second component): $\neg\neg\neg P$ — whether $\neg P$ holds classically (has a realizer for refutation).

A proposition is decidable exactly when both dimensions are determined and opposite: $(\top, \bot)$ or $(\bot, \top)$. The undecidable value $\bot = (\bot, \bot)$ appears when neither $P$ nor $\neg P$ has a $\neg\neg$-closed witness.

## Internal derivation

$\mathbf{FOUR}$ is not an external framework imposed on computation. It is the image of $\Omega_{\mathbf{Eff}}$ under the internal map $\rho(P) = (\neg\neg P,\; \neg\neg\neg P): \Omega_{\mathbf{Eff}} \to \Omega_{\mathrm{cl}} \times \Omega_{\mathrm{cl}} \cong \mathbf{2} \times \mathbf{2}$, defined entirely within $\mathbf{Eff}$'s internal language using the double-negation Lawvere-Tierney nucleus. See [four-is-image-of-omega-under-double-negation](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/code/prose/learning/claims/four-is-image-of-omega-under-double-negation.md).

Rice's theorem forces the undecidable value $\bot$ to appear for every non-trivial behavioral predicate. $\mathbf{FOUR}$ is the minimal truth-value structure that can record this.

## Relationship to Eff's internal logic

$\mathbf{FOUR}$ and $\mathbf{Eff}$'s internal Heyting algebra operate at different levels:

- The **internal logic** (Heyting-valued) governs what is derivable inside $\mathbf{Eff}$ — it is a rich intuitionistic logic with infinitely many truth values (elements of $\Omega_{\mathbf{Eff}}$).
- $\mathbf{FOUR}$ is the **external settled-state structure** — what propositions look like once all computation has terminated and the result is observed from outside.

They are compatible: $\rho: \Omega_{\mathbf{Eff}} \to \mathbf{FOUR}$ is a map from the internal logic to the external structure. A proposition internally provable in $\mathbf{Eff}$ lands on $\mathbf{t}$; an internally refuted one lands on $\mathbf{f}$; one for which neither proof nor refutation is derivable lands on $\bot$.

## Via CGS

The $F^!$ embedding of $\mathbf{Eff}$ into $\mathcal{Kl}(!_{\mathbf{CGS}})$ propagates $\mathbf{FOUR}$ into the concurrent game framework: $\mathbf{FOUR}$ is the external truth-value structure for the Kleisli sub-CCC of computable concurrent computation in $\mathbf{CGS}$.
