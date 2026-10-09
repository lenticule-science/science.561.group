---
kind: example
status: draft
depends-on: [strong-mld-via-composed-duality, fibonacci-classifying-invariant, fibonacci-substitution-settling, transfinite-induction-strong-mld-exchange-orbit]
instantiates: [strong-mld-via-composed-duality]
lineage: 5
---

# Strong-MLD orbit of the Fibonacci substitution settling

The L5a instance of the [strong-MLD classification](../theorems/strong-mld-via-composed-duality.md) on an aperiodic case.

## Firing-orbit-type function

The Fibonacci settling's closure rule produces *truth-only* content at each substitution step (each new tile-position is asserted as $\mathbf{t}$ for one of $P_a, P_b$, never $\mathbf{f}$ or $\top$).

So the firing-orbit-type function $\tau^{\mathbb{D}}: L_{\mathrm{ns}}(\omega_1) \to \{\text{truth-only}, \text{falsity-only}, \top\}$ is **constant truth-only**:

$$\tau^{\mathbb{D}}(v_{\text{Fibonacci}})(\mu) = \text{truth-only} \text{ for all } \mu \in L_{\mathrm{ns}}(\omega_1).$$

## Composed-duality orbit

Under composed duality $\mathbb{D}$, the Fibonacci settling pairs with its negation $\neg v_{\text{Fibonacci}}$ — the "dual Fibonacci" where every tile-assertion is replaced by its negation. The orbit has size 2 — exchange-paired.

**The Fibonacci settling is in the exchange-orbit stratum of the strong-MLD classification.** Same orbit type as the L4 transfinite-induction settling — both are uniform truth-only-firing settlings, just at different complexity scales.

## Comparison with literature

In the substitution-tiling literature, the "negation tiling" is not standardly considered as a moduli partner — Anderson-Putnam's framework doesn't have an analog of bilattice negation. The corpus's strong-MLD orbit-type therefore identifies a structural pairing the substitution-tiling literature doesn't surface: every substitution tiling has a "dual" with the opposite evidence-side commitment.

## Position in Lineage 5

The L5a strong-MLD instance. For uniform substitution dynamics (Fibonacci, Thue-Morse partial), the orbit type is *constant* (all truth-only or all falsity-only). For mixed-type substitutions (e.g., a substitution producing both positive and negative cells), the orbit type would be mixed. The Fibonacci case is the simplest exchange-orbit aperiodic instance.
