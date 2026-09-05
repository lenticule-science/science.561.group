---

name: hyperverse-step-spectral-sequence
description: "Object: the hyperverse step spectral sequence E_1^{k,n} = H^n_tower(k) => H^{k+n}(H, E_0^H) — the hyperverse tower filtration spectral sequence converging to hyperverse cohomology; non-degeneration at E_2 is the Zeno gap."
---

### Definition — The Hyperverse Step Spectral Sequence {#hyperverse-step-spectral-sequence}

The tower filtration on $E_0^\mathcal{H} = \varinjlim_k E_0^{(k)}$ (§stable-mode-sheaf)
induces a spectral sequence:
$$
E_1^{k,n} \;=\; H^n_{\mathrm{tower}}(k) \;\Longrightarrow\; H^{k+n}(\mathcal{H},\, E_0^\mathcal{H}).
$$

The $E_1$-page is the hyperverse step cohomology (§hyperverse-step-cohomology). The $d_1$
differential $d_1: E_1^{k,n} \to E_1^{k+1,n}$ is the connecting homomorphism $\widetilde{\partial}_k$.

Non-degeneration at $E_2$ — the existence of a non-zero $d_1$ differential — requires
$H^1_{\mathrm{tower}}(k) \neq 0$ for some $k$. The Zeno Settling conjecture (§zeno-settling)
asserts non-degeneration: new obstructions appear at every tower level.

#### Contrast with the Depth Version {#hyperverse-step-spectral-sequence-contrast}

The depth step spectral sequence (§depth-step-spectral-sequence) converges to
$H^{k+n}(R, E_0)$ — cohomology of the relational universe itself. This spectral sequence
converges to $H^{k+n}(\mathcal{H}, E_0^\mathcal{H})$ — cohomology of the hyperverse.
The Zeno gap lives in this one.

**Status.** Convergence requires the hyperverse $\mathcal{H}$ to be a Grothendieck topos
with well-defined sheaf cohomology — part of the Zeno/topos-of-topoi cluster of conjectures
(§zeno-settling, §topos-of-topoi).
