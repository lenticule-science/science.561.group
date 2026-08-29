---

name: stable-mode-sheaf
description: "Object: the stable mode space E_0 = ker(δ_t) = V_t at each fiber, and its hyperverse analog E_0^H — the subspace of modes with zero defect, the invariant observable content."
defines: StableModeSheaf
---

### Definition — The Stable Mode Space {#stable-mode-sheaf}

#### Definition — $E_0$ at Each Fiber {#def-active-mode-space}

The **stable mode space** at history $t$ is
$$
E_0(t) \;:=\; \ker(\delta_t) \;=\; E_{t,0} \;=\; V_t \;=\; K^{H_t^*}.
$$
These three descriptions coincide: $E_0(t)$ is simultaneously the zero eigenspace of the
defect operator $\delta_t$ (§mode-sheaves), the invariant mode subspace, and the free
$K$-module on the fixed fiber $H_t^*$ (§fixed-fiber).

An element $v \in E_0(t)$ is a **stable mode**: its deviation from double-stability is
zero. Every basis vector $e_a$ with $a \in H_t^*$ lies in $E_0(t)$.

#### Sheaf Structure {#stable-mode-sheaf-structure}

The family $(E_0(t))_{t \in \mathrm{Ob}(T)}$ assembles into a subsheaf
$$
E_0 \;\subseteq\; \widetilde{V}
$$
of the full mode sheaf (§mode-sheaves) on $T$. Restriction maps preserve $E_0$ because
restriction maps $H(f)$ for $f : t \to t'$ in $T$ are nucleus-preserving, hence
send $H_{t'}^*$ to $H_t^*$ (§reindexing). The global sections $\Gamma(E_0)$ are the
globally stable modes — those whose defect is zero at every history simultaneously.

#### Spectral Role {#stable-mode-sheaf-spectral}

In the spectral decomposition $\widetilde{V}_t \cong \bigoplus_\lambda E_{t,\lambda}$
(§spectral-decomposition), $E_0(t)$ is the zero eigenspace: the modes that see no
relational history that they cannot account for. The non-zero eigenspaces $E_{t,\lambda}$
for $\lambda > 0$ are modes with positive defect — they record structure above the
doubly-stable layer.

The spectral mass of $E_0$ relative to $\widetilde{V}$ is $|H_t^*| / |H_t|$ (over finite
fibers). Its growth under the hyperverse tower determines the Golden Stability rate
(§golden-stability).

#### Hyperverse Analog $E_0^\mathcal{H}$ {#def-stable-mode-hyperverse}

At the level of the relational hyperverse $\mathcal{H} = \varinjlim_n R^{(n)}$
(§relational-hyperverse), the **hyperverse stable mode space** is
$$
E_0^\mathcal{H} \;:=\; \varinjlim_n E_0^{(n)},
$$
the colimit of the stable mode spaces along the tower $R^{(0)} \hookrightarrow R^{(1)}
\hookrightarrow \cdots$. New stable modes appear at each level as new doubly-stable
elements emerge; $E_0^\mathcal{H}$ is the union of all of them. Whether $E_0^\mathcal{H}$
is itself the kernel of a well-defined defect operator on $\mathcal{H}$ is part of the
Zeno Settling Gap (§zeno-settling).
