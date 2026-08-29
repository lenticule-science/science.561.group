---
id: depth-step-spectral-sequence
name: DepthStepSpectralSequence
description: "Object: the depth step spectral sequence E_1^{k,n} = H^n_depth(k) => H^{k+n}(R, E_0) — the depth-filtration spectral sequence converging to the cohomology of the relational universe."
defines: DepthStepSpectralSequence
---

### Definition — The Depth Step Spectral Sequence {#depth-step-spectral-sequence}

The depth filtration $E_0^{[0]} \subseteq E_0^{[1]} \subseteq \cdots \subseteq E_0$ of
the stable mode sheaf on $(T,J)$ induces a spectral sequence:
$$
E_1^{k,n} \;=\; H^n_{\mathrm{depth}}(k) \;\Longrightarrow\; H^{k+n}(R,\, E_0).
$$

The $E_1$-page is the depth step cohomology (§depth-step-cohomology). The $d_1$
differential $d_1: E_1^{k,n} \to E_1^{k+1,n}$ is the connecting homomorphism $\partial_k$.

Degeneration at $E_2$ holds iff all connecting homomorphisms vanish — equivalently, iff
$H^1_{\mathrm{depth}}(k) = 0$ for all $k$, meaning the cohomology of $R$ is entirely
determined by the step groups with no differentials.

The hyperverse-tower analog is §hyperverse-step-spectral-sequence.
