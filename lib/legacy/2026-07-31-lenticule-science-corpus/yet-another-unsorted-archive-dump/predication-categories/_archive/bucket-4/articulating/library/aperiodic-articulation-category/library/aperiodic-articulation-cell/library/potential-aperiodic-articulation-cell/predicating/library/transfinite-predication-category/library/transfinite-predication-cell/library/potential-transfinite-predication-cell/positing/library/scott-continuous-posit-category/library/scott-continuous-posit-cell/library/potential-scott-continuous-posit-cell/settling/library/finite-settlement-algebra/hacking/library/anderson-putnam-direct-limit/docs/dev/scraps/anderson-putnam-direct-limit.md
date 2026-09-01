---
type: definition
class: direct-limit-construction
---

# Anderson–Putnam direct limit

For a substitution dynamical system with a substitution self-map $\omega$ on a finite cell complex $\Gamma_\omega$ (the **Anderson–Putnam complex**), the dynamical space is the inverse limit

$$\Omega_\omega \;\cong\; \lim_{\leftarrow}\; \bigl(\Gamma_\omega \xleftarrow{\omega} \Gamma_\omega \xleftarrow{\omega} \cdots \bigr),$$

and its Čech cohomology is the **direct limit** of the induced cohomology maps:

$$\check{H}^n(\Omega_\omega) \;\cong\; \varinjlim \;\bigl(\check{H}^n(\Gamma_\omega) \xrightarrow{\omega^*} \check{H}^n(\Gamma_\omega) \to \cdots\bigr).$$

[@anderson-putnam1998]. The construction was developed for substitution tilings; cohomology classes of the direct limit are the classifying invariants of aperiodic tilings up to local-isomorphism equivalence (mutual local derivability).

## Adoption here

The [aperiodic-regime classification](../theorems/four-regime-dichotomy.md) inherits the direct-limit framework. The settling endofunctor's iterates play the role of the substitution self-map; finite-stage cohomology of the bounded sub-sites $\mathbf{T}^*_{\leq \tau}$ plays the role of $\check{H}^n(\Gamma_\omega)$; the direct limit at the closure ordinal $\omega_1$ assembles them into the classifying $H^1$ for the aperiodic regime.

The analogy is structural rather than technical: tiling cohomology lives on simplicial-complex inverse limits with abelian-group coefficients, while the [aperiodic-settling](../concepts/aperiodic-settling.md) cohomology lives on bitopological-site direct limits with the same coefficients. The underlying direct-limit framework transfers cleanly without invoking the technical machinery specific to tilings ($C^*$-algebras, $K$-theory, Anderson–Putnam collaring, branched-manifold inverse limits).
