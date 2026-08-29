---
id: depth-step-cohomology
name: DepthStepCohomology
description: "Object: depth step cohomology H^n_depth(k) = H^n(T,J; N_[k]) — sheaf cohomology of the depth-new-modes sheaf, fitting in a long exact sequence between consecutive depth levels of the filtration within a single universe."
defines: DepthStepCohomology
---

### Definition — Depth Step Cohomology {#depth-step-cohomology}

$$
H^n_{\mathrm{depth}}(k) \;:=\; H^n(T,J;\; N_{[k]}), \qquad n,k \geq 0,
$$
where $N_{[k]} = E_0^{[k+1]}/E_0^{[k]}$ is the depth-new-modes sheaf (§depth-new-modes).
This is the cohomology measuring new stable structure settling at depth $k+1$ within
the relational universe $R$, computed on the canonical history site $(T,J)$.

#### Long Exact Sequence {#depth-step-cohomology-les}

From the short exact sequence $0 \to E_0^{[k]} \to E_0^{[k+1]} \to N_{[k]} \to 0$:
$$
\cdots \to H^n(T,J;\, E_0^{[k]}) \to H^n(T,J;\, E_0^{[k+1]})
\xrightarrow{\;\partial_k\;}
H^n_{\mathrm{depth}}(k)
\to H^{n+1}(T,J;\, E_0^{[k]}) \to \cdots
$$

The connecting homomorphism $\partial_k$ measures the obstruction to lifting a
depth-$(k+1)$ stable mode class to depth-$k$ data.

#### Interpretation {#depth-step-cohomology-interpretation}

$H^0_{\mathrm{depth}}(k)$: globally compatible new stable sections first appearing at
depth $k+1$. Since $H^0(E_0^{[k]}) \cong K$ (§cohomology), the long exact sequence gives
the injection $H^0_{\mathrm{depth}}(k) \hookrightarrow H^1(T,J;\, E_0^{[k]})$: new global
stable sections are obstructed by depth-$k$ cohomology.

$H^1_{\mathrm{depth}}(k)$: compatible local new stable data that fails to assemble
globally at depth $k+1$.

#### Zeno Connection {#depth-step-cohomology-zeno}

$$
H^1(R,\, E_0) \;\cong\; \varinjlim_k\, H^1_{\mathrm{depth}}(k).
$$

The non-vanishing of the first cohomology of $R$ (§cohomology) is the colimit of depth
step cohomology. The depth step spectral sequence (§depth-step-spectral-sequence)
organizes all degrees. The hyperverse-tower analog is §hyperverse-step-cohomology.
