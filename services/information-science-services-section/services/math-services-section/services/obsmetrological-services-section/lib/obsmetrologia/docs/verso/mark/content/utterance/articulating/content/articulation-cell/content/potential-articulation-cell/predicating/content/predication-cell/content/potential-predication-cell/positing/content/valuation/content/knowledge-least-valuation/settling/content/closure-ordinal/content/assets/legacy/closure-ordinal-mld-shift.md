---
kind: theorem
status: proved
depends-on: [closure-ordinal, mutually-locally-derivable, settling-morphism]
type: theorem
---

# Closure ordinal under MLD-shift

Let $v, v'$ be settlings over a common base $B$ with [MLD-equivalence](../concepts/mutually-locally-derivable.md) witnessed by [settling-morphism](../morphisms/settling-morphism.md) $(\delta, \phi) : v \to v'$.
Then

$$\kappa(v') \;=\; \kappa(v) \,+\, \delta,$$

where the sum is ordinal addition in $\lambda$.

## Proof

By state-compatibility of the settling-morphism, $\phi_{q, \tau}(v_\tau(q)) = v'_{\tau + \delta}(q)$ for every $q, \tau$.

At $\tau = \kappa(v)$ the settling stabilizes: $v_{\kappa(v)} = v_{\kappa(v) + 1}$.
Applying $\phi$:

$$v'_{\kappa(v) + \delta} \;=\; \phi(v_{\kappa(v)}) \;=\; \phi(v_{\kappa(v) + 1}) \;=\; v'_{\kappa(v) + 1 + \delta},$$

so $v'$ stabilizes at $\kappa(v) + \delta$.
Hence $\kappa(v') \leq \kappa(v) + \delta$.
By symmetry, using the inverse $(-\delta, \psi) : v' \to v$, $\kappa(v) \leq \kappa(v') - \delta$.
Combining: $\kappa(v') = \kappa(v) + \delta$. $\square$

## Consequence

The [closure ordinal](../objects/closure-ordinal.md) is *not* an MLD-invariant — it shifts by the MLD-morphism's ordinal-shift component $\delta$.
Three possible remedies:

- (i) Define a shifted-$\kappa$-equivalence class and use it as the invariant.
- (ii) Use the *regime label* $\mathrm{reg}(v) \in \{A, B, C, D\}$ instead of $\kappa$ — by [regime MLD-invariance](regime-mld-invariance.md), the regime label *is* MLD-invariant.
- (iii) Pick a canonical representative (e.g., minimum-$\kappa$) per MLD-class and use its $\kappa$.

The moduli layer uses (ii) — the regime label — as the primary invariant.
For explicit computations needing the $|E| \geq \omega_1$ hypothesis of the [aperiodic-regime classification](../../../../aperiodic-settling/references/aperiodic-regime-classification.md), canonical representatives carry the specific $\kappa \leq \omega_1$ data.
