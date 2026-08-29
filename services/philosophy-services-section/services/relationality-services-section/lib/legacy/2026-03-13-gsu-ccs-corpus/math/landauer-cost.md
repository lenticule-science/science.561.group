---
id: landauer-cost
name: LandauerCost
description: "Object: the Landauer cost L_s(t) as sheaf-theoretic kernel of the counit, and the relational cost constant c_rel derived from the minimum spectral drop."
defines: LandauerCost
---

### Definition — Landauer Cost {#landauer-cost}

#### The Landauer Cost as Sheaf-Theoretic Kernel {#def-landauer-cost}

For a step $s \in \mathrm{atoms}(T)$ and a history $t$, the counit of the directed comonad
(§directed-comonad) gives a morphism of sheaves:
$$
\varepsilon_s(t) : G_s(H)(t) = H_{s \star t} \longrightarrow H_t.
$$
The **Landauer kernel** at $(s, t)$ is the sheaf-theoretic kernel of $\varepsilon_s(t)$
in the abelian category of sheaves on $(T, J)$:
$$
\mathcal{K}_s(t) \;:=\; \ker\bigl(\varepsilon_s(t) : H_{s \star t} \to H_t\bigr).
$$
This is the **$s$-shadow** (§landauer-limit): the sub-Heyting-algebra of propositions at
$s \star t$ that are annihilated by restriction to $t$ — relational information that
depends essentially on the extension step $s$ and vanishes when $s$ is forgotten.

The **Landauer cost** is the spectral mass of this kernel:
$$
\mathcal{L}_s(t) \;:=\; M\bigl(\delta|_{\mathcal{K}_s(t)}\bigr)
\;=\; \sum_{\lambda > 0} \dim_K\bigl(\mathcal{K}_s(t) \cap E_{s \star t, \lambda}\bigr) \cdot \lambda,
$$
the total spectral weight of the defect operator restricted to the kernel. This equals
the old definition $M_{s \star t}(\delta) - M_t(\delta|_{s \star t})$ when the restriction
map is a morphism of spectral modules, but the kernel formulation is the categorically
correct one: it is a natural transformation $\mathcal{L}_s : T^{\mathrm{op}} \to K\text{-}\mathbf{Mod}$,
not merely a numerical difference.

*Remark — Why the kernel.* The kernel $\mathcal{K}_s(t)$ is a sheaf on $(T, J)$ in
its own right. It defines a subsheaf of $G_s(H)$ that measures exactly the information
destroyed by each counit application. The Landauer cost is the spectral mass of this
subsheaf — a sheaf-theoretic quantity, not a set-theoretic one. This categorification
is essential for the derivation of $c_\mathrm{rel}$ below.

#### The Relational Cost Constant $c_\mathrm{rel}$ {#def-relational-cost}

The **relational cost constant** $c_\mathrm{rel}$ is *derived*, not posited.

**Definition — Minimum spectral drop.** Let $\varepsilon_{\min}$ be the minimum nonzero
spectral drop (§spectral-heat) across all tunneling events in the depth tower:
$$
\varepsilon_{\min} \;:=\; \inf\bigl\{\; \lambda - \mu \;\big|\;
e \in E_{t,\lambda},\; U_G(e) \in E_{t,\mu},\; \lambda > \mu \geq 0,\;
t \in T \;\bigr\} \;>\; 0.
$$
The strict positivity $\varepsilon_{\min} > 0$ follows from the finiteness of each fiber
$H_t$ (§fiber): in a finite Heyting algebra, the spectral decomposition of $\delta_t$
has finitely many eigenvalues, so the minimum nonzero gap between them is strictly positive.

**Derivation.** The minimum spectral drop $\varepsilon_{\min}$ is the **spectral bit**:
the smallest unit of erased relational information. The Landauer cost of erasing one
spectral bit at thermodynamic temperature $T_\mathrm{thermo}(t) = M_t(\delta)$
(§spectral-thermodynamics) is:
$$
c_\mathrm{rel} \;:=\; \varepsilon_{\min}.
$$
The relational Landauer bound then reads:
$$
\Delta\mathcal{E}_\mathrm{Landauer}(t,s) \;\geq\; \varepsilon_{\min} \cdot T_\mathrm{thermo}(t) \cdot \mathcal{L}_s(t),
$$
where $\mathcal{L}_s(t) / \varepsilon_{\min}$ counts the number of spectral bits erased.
The bound is sharp: it is attained when each erased mode drops by exactly
$\varepsilon_{\min}$ — the maximally efficient erasure.

*Remark — Comparison with $k_B \ln 2$.* In classical Landauer theory, $k_B \ln 2$ is
the minimum free energy cost per bit at temperature $T$. The constant $k_B$ converts
between temperature and energy units; $\ln 2$ is the information content of one bit. In
the relational setting, $\varepsilon_{\min}$ plays both roles simultaneously: it is both
the minimum energy quantum of the spectral decomposition and the information content of
one spectral bit. There is no separate Boltzmann constant because the relational universe
does not have independent temperature and energy scales — spectral mass IS temperature
(§spectral-thermodynamics).

#### Role in This Theory {#landauer-cost-role}

$\mathcal{L}_s(t)$ and $c_\mathrm{rel} = \varepsilon_{\min}$ are the constitutive data
of the Relational Landauer Principle (§landauer-limit), which asserts that forgetting
relational history costs free energy bounded below by
$\varepsilon_{\min} \cdot T \cdot \mathcal{L}$. In the Fibonacci history system this cost
decays as $\varphi^{-n}$ (§golden-ratio), giving the Fibonacci Zeno pattern of the
§zeno-settling conjecture.
