---
type: definition
class: sub-settling
realizes: [observer]
depends-on: [cosmological-settling, observer, predication-settling]
---

# Inference sub-settling

A **cosmological inference pipeline** — Planck CMB, DESI BAO, Pantheon+ Type Ia supernovae, distance-ladder Cepheids — is a stabilized sub-process of the [cosmological settling](cosmological-settling.md): an [observer](teaching/explanations/observer.md), augmented with a measurement and parameter-estimation procedure, that produces a [predication valuation](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md) on a restricted predicate sub-category. The result is an **inference sub-settling**.

Concretely, fix:

- An observer $O$ at event $e_O$ in $E_{\mathrm{cos}}$.
- A predicate sub-category $\mathcal{C}_O \subseteq \mathcal{C}_{\mathrm{cone}}$ — those predicates the pipeline measures: typically $\{H(z), D_A(z), r_d, \ldots\}$ for a given redshift range.
- A measurement-and-parameter-estimation procedure: a [closure rule](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule.md) firing repeatedly under the pipeline's data-reduction steps until a stable bilattice value is reached for each cell in $\mathcal{C}_O$.

The **inference sub-settling** $E_O$ is the family $(v_O^t)_{t \geq t_O}$ of valuations on $\mathcal{C}_O$ produced by this procedure as the pipeline ingests more data over its operational lifetime. The pipeline's published parameter posterior at any moment is the projection of the current $v_O^t$ onto frame-dependent observables.

## Stabilization

The pipeline reaches **closure** in the [predication-settling](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) sense when its closure-rule firings stop producing $\leq_k$-jumps — when no additional data and no additional parameter-estimation iterations push any cell value upward in the [knowledge order](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md). Standard cosmological pipelines reach closure in this sense once their posterior chains converge: $E_O = \mathrm{Close}(E_O)$, i.e., the sub-settling is a fixed point of its own closure operator.

A closed inference sub-settling is the predicated content of "the pipeline has produced its result." Pre-closure, the sub-settling is still updating; post-closure, it is committed.

## Two canonical examples

- $E_{\mathrm{early}}$ — the **early-universe inference sub-settling**: predicates measured by Planck CMB analysis, with values determined from CMB anisotropy power spectrum at the [CMB quiescent frontier](cmb-quiescent-frontier.md). The light-cone restriction from the frontier to the present, composed with the Boltzmann closure rules at recombination, produces $v_{\mathrm{early}}$.
- $E_{\mathrm{late}}$ — the **late-universe inference sub-settling**: predicates measured by distance-ladder + BAO + Type Ia supernovae, with values determined from late-time observations along observers' past light cones in the local universe.

Both pipelines are observers of the same cosmological settling. They project onto overlapping but distinct predicate sub-categories. Their values on the shared predicates — most notably $H(z)$ — should agree if the underlying [cosmological settling](cosmological-settling.md) is single and self-consistent.

## When values disagree

When the values of $E_{\mathrm{early}}$ and $E_{\mathrm{late}}$ on a shared predicate are not [knowledge-order](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) compatible — when, for instance, $E_{\mathrm{early}}(H_0) = 67.4 \pm 0.5$ and $E_{\mathrm{late}}(H_0) = 73.0 \pm 1.0$ are not joinable in $\mathbf{L}$ to a single non-$\bot$ value — the two sub-settlings constitute a **residuation failure** in the parent cosmological settling. This is the predicated content of the Hubble tension. See [hubble-tension-as-residuation-failure](../theorems/hubble-tension-as-residuation-failure.md).

## Provenance

Translates the "stabilized recognitions" $E_{\mathrm{early}}, E_{\mathrm{late}} \in \mathrm{Rel}$ of the prior reflexive-existence formulation: see [`analyzing-hubble-tension-as-reflexive-dynamics.md`](../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relationality/triage/provenance/relationality-archive/sscu-sprint/domains/cosmology/analyzing-hubble-tension-as-reflexive-dynamics.md) (sscu-sprint, 2026-02-27). The reflexive `Close(E_i) = E_i` axiom is the predicated `E_O = \mathrm{Close}(E_O)` settling-fixed-point condition; the reflexive `Together`/`Either`/`Induces` operators map to bilattice meet/join and residuation in $\mathbf{L}$.
