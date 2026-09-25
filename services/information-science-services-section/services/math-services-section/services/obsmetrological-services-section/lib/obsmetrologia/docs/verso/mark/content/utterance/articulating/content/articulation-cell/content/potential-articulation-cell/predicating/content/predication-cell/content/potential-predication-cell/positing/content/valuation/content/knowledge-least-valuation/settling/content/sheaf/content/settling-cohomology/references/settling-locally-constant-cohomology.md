---
kind: theorem
status: proved
depends-on: [settling-cohomology, settling-local-constancy, four-regime-dichotomy]
---

# Cohomology stabilizes under settling-local-constancy

If a sheaf $F$ on the [bitopological settling site](../../../../bitopological-settling-site/bitopological-settling-site.md) is [settling-locally-constant](../../../../settling-local-constancy/settling-local-constancy.md) beyond $\tau_0$, then for every $\sigma \geq \tau_0$,

$$H^n(\mathbf{T}^*_{\leq \sigma}, F) \;\cong\; H^n(\mathbf{T}^*_{\leq \tau_0}, F),$$

and the unbounded [settling cohomology](../settling-cohomology.md) reduces to a finite computation:

$$H^n(\mathbf{T}^*, F) \;\cong\; H^n(\mathbf{T}^*_{\leq \tau_0}, F).$$

## Proof

Under settling-local-constancy, the directed system $\{H^n(\mathbf{T}^*_{\leq \tau}, F)\}_{\tau \geq \tau_0}$ has all transition maps isomorphisms.
Its colimit is any one of its values — in particular, $H^n(\mathbf{T}^*_{\leq \tau_0}, F)$. $\square$

## Regime application

For [strict regime](../../../../../references/four-regime-dichotomy.md) and [Scott-continuous regime](../../../../../references/four-regime-dichotomy.md) settlings — finite-stabilizing or $\omega$-Scott-continuous — the [settling-associated sheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md) is settling-locally-constant beyond the closure ordinal $\kappa$.
The unbounded cohomology then reduces to the bounded computation at $\tau_0 = \kappa$, which is finite or $\omega$-stage-bounded by regime hypothesis.

For the aperiodic regime, the proposition does not apply: $\mathcal{F}_U$ fails settling-local-constancy at every countable $\tau_0 < \omega_1$ — newly-added designated cells continue arriving up to and including $\omega_1$ — and the unbounded cohomology genuinely requires the direct-limit construction.
This aperiodic-regime failure is what makes the [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) live there rather than at any bounded stage.
