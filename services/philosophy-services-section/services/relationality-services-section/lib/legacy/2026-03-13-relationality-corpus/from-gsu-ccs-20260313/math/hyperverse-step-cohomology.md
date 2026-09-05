---

name: hyperverse-step-cohomology
description: "Object: hyperverse step cohomology H^n_tower(k) = H^n(R^(k+1), tilde{N}_k) — the cohomology of the hyperverse-new-modes sheaf on R^(k+1), measuring new stable universe-propositions at tower level k+1."
---

### Definition — Hyperverse Step Cohomology {#hyperverse-step-cohomology}

$$
H^n_{\mathrm{tower}}(k) \;:=\; H^n\bigl(R^{(k+1)},\; \widetilde{N}_k\bigr), \qquad n, k \geq 0,
$$
where $\widetilde{N}_k$ is the hyperverse-new-modes sheaf (§hyperverse-new-modes). This
is the cohomology measuring new stable propositions about universe-objects first appearing
at tower level $k+1$.

#### Long Exact Sequence {#hyperverse-step-cohomology-les}

From the short exact sequence on $R^{(k+1)}$:
$$
\cdots \to
H^n\bigl(R^{(k+1)},\, (\iota_k)_* (\iota_k)^* E_0^{(k+1)}\bigr)
\to H^n\bigl(R^{(k+1)},\, E_0^{(k+1)}\bigr)
\xrightarrow{\;\widetilde{\partial}_k\;}
H^n_{\mathrm{tower}}(k)
\to H^{n+1}\bigl(R^{(k+1)},\, (\iota_k)_* (\iota_k)^* E_0^{(k+1)}\bigr)
\to \cdots
$$

By the Leray spectral sequence for $(\iota_k)_*$:
$H^n(R^{(k+1)}, (\iota_k)_* (\iota_k)^* E_0^{(k+1)}) \cong H^n(R^{(k)}, (\iota_k)^* E_0^{(k+1)})$.

The connecting homomorphism $\widetilde{\partial}_k$ measures the obstruction to lifting
a tower-level-$(k+1)$ stable mode class to tower-level-$k$ data.

#### Contrast with the Depth Version {#hyperverse-step-cohomology-contrast}

The depth-step cohomology (§depth-step-cohomology) uses both sheaves on the same site
$(T,J)$ and measures new stable *propositions* within a universe. The hyperverse step
cohomology uses sheaves on $R^{(k+1)}$ and measures new stable *universe-propositions*
— propositions about new universe-objects that enter the picture at level $k+1$.

The Zeno Settling conjecture (§zeno-settling) is about $H^1(\mathcal{H}, E_0^\mathcal{H})
\neq 0$, which concerns the colimit of hyperverse step cohomology:
$$
H^1(\mathcal{H},\, E_0^\mathcal{H}) \;\cong\; \varinjlim_k\, H^1_{\mathrm{tower}}(k).
$$

The hyperverse step spectral sequence (§hyperverse-step-spectral-sequence) organizes
all degrees.

**Status.** The definition requires $R^{(k+1)}$ to be a Grothendieck topos with well-defined
sheaf cohomology, and the geometric morphism $\iota_k$ to have a Leray spectral sequence
(which holds for geometric morphisms of toposes). Both are assumed for the hyperverse
tower (§hyperverse-tower).
