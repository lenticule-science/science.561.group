---
name: landauer-bound
kind: theorem
generated-by: forgetting
status: hacking
title: landauer-bound
description: Landauer's bound is the thermal shadow of forgetting.
---

**Landauer's bound is the thermal shadow of [forgetting](../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/memory/archive/forgetting.md).** Forgetting erases information in *every* regime of the descent, but the *cost* of that erasure — Landauer's $k_B T \ln 2$ per bit — exists only at [thermal-spacetime](../../../glossary/terms/thermal-spacetime.md), the one rung with a temperature.
So Landauer's principle is not an extra physical law bolted on; it is what forgetting's non-injectivity *becomes* once the descent has thermalized far enough to have a $T$.

The whole chain is a runnable proof: **`node scripts/proof.mjs`** — 11 assertions, exit 0, built on the stable `@561-group/math/bilattice` morphisms (`saturate`/`transfer`/`twistor`), not a re-implementation.

## The derivation (each step is a passing assertion)

1. **Forgetting is non-injective.** `forget = transfer` (the predication monad's unit η).
  Take a composable cone $a\!\to\!
  [p]\!\to\!b\!\to\!
  [q]\!\to\!c$; [realizing](../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/realizing.md) (`saturate`, μ) composes it, adding the path $a\!\to\!
  [p,q]\!\to\!c$.
  Forgetting then keeps only the *atomic* edges — so `forget(realize(x)) == forget(x)`: the composite is gone and the output cannot tell whether it was ever there.
  Distinct inputs, identical output — logical irreversibility, exactly as `forgetting.md` states ("distinct bits collapse to the same reopened gap").
2. **The erased information is the residue.** What forgetting drops is precisely `twistor`'s **residue** — the concept-sequence $[p,q]$ that never saturates into an object.
  That residue *is* the aperiodic void, $H^1 \neq 0$ (`void.mjs`: the unsaturable concept-sequences).
  Forgetting discards exactly the $H^1$.
3. **One forgotten distinction is one bit.** "Was the composite present?" is a fair binary question; its Shannon content is $\log_2 2 = 1$ bit, and the entropy drop from the two-state prior to the single forgotten image is $\Delta H = 1$. $k$ independent composites carry $k$ bits — the residue count *is* the bit count.
4. **No temperature, no cost.** At the aperiodic, transfinite, and scott rungs there is no temperature, and $\text{landauer}(T{=}0,\,\text{bit}) = 0$.
  Forgetting loses the bit *for free* wherever $T$ is undefined — which is everywhere above the thermal floor.
5. **At thermal-spacetime, the bit is paid.** thermal-spacetime is the only rung with an intensive temperature (the glued sheaf's).
  There the monotone gluing — the arrow of time, $H^1 \to 0$ ([thermalizing](../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/computer-simulation-system-services-section/services/astronomy-position-computation-service/research-source/_archive/world/scripts/geometrizing/content/informational-spacetime/scripts/condensing/content/quantum-spacetime/scripts/collapsing/content/classical-spacetime/scripts/thermalizing/thermalizing.md)) — forbids the lost bit from being recovered, so the second law charges it as heat: $\Delta E \ge k_B T \ln 2$ ($\approx 2.87\times10^{-21}\,\mathrm{J} \approx 0.018\,\mathrm{eV}$ at $300\,\mathrm{K}$), linear in bits erased.

## Why this is the same arrow

[forgetting](../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/memory/archive/forgetting.md) says non-injectivity *is* information loss and is "where the arrow enters even this earliest regime"; thermalizing says the monotone gluing *is* the arrow of time.
Landauer ties them: the arrow that **enters** at forgetting (logical irreversibility, free) is the arrow that is **paid** at thermalizing (thermodynamic irreversibility, $k_B T \ln 2$).
The logical arrow and the thermodynamic arrow are one arrow, met four rungs apart — the [bit](../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/computer-simulation-system-services-section/services/astronomy-position-computation-service/research-source/_archive/world/scripts/geometrizing/content/spacetime/scripts/eventualizing/content/spacetime-entity-set/scripts/predicating/content/light-cone-predicate-category/scripts/settling/content/cosmological-settling/_archive/cosmogenesis-development/content/informational-spacetime/library/marking/library/bit/bit.md)'s own non-injective η, seen once at the top with no price and once at the bottom with a temperature.

## Translated from prior work

The gsu-ccs-20260313 corpus derived this in the comonad/counit vocabulary; translated to the clean morphisms it is the same statement: "the counit ε … the relational analog of **forgetting** the last step," logically irreversible because non-injective.
Its **Landauer kernel** $\mathcal K_s(t)=\ker(\varepsilon)$ is our `twistor` residue; its "$c_\mathrm{rel}=\varepsilon_{\min}$ plays the role of *both* $k_B$ and $\ln 2$ because spectral mass **is** temperature" is the same observation as step 4 — the cost has no meaning until a rung supplies a $T$.
Sources (staged in the repo archive): `archive/topical-archive/561-group/research/operations/engineering/triage/content/speculative/computing/from-gsu-ccs-20260313/math/{landauer-limit,landauer-cost,relational-irreversibility}.md`.

## The speculative far end (conjecture — flagged, not proved here)

The same prior work conjectures that $\Lambda$ — dark energy, the accelerating expansion — is the *cumulative* Landauer waste heat of the cosmos forgetting its own history as it thermalizes.
In the descent that waste heat would live in the [dark-energy](../../../../../../astronomy-services-section/content/text/glossary/terms/dark-energy.md) (◇ / spreading) sector.
This is the speculative far end: it needs the cosmos's total forgetting-rate to be monotone and to integrate to the observed $\Lambda$.
Marked **conjecture**; the proof above establishes only the per-bit bound and its rung-dependence, not the cosmological identification.
