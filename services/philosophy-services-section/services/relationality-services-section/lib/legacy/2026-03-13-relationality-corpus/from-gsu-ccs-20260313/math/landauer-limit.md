---

name: landauer-limit
description: "Logic-Gate Horizon — The Landauer Limit of U_G"
---

### Conjecture — Logic-Gate Horizon: The Landauer Limit of $U_G$ {#landauer-limit}

*Every turn of the self-generation cycle $U_G$ is a logically irreversible computation.
Its counit $\epsilon$ discards relational information that cannot be recovered from the
shorter history alone. By Landauer's principle, this erasure dissipates a minimum
amount of spectral energy as heat at each depth step. The accelerating expansion of
the universe is not driven by a free constant $\Lambda$: it is the cumulative waste
heat of the universe computing its next depth level.*

---

#### The Mathematical Structures {#ll-math}

The relevant structures are:

- **Directed comonad** (§directed-comonad): the comonad $(G_s, \epsilon, \delta)$ on $R$,
  where $G_s(F)(t) = F(s \star t)$ shifts the fiber forward by one step $s$. The counit
  $\epsilon_F(t): F(s \star t) \to F(t)$ is restriction along the prefix inclusion
  $i_t: t \to s \star t$ — it maps from the extended fiber back to the shorter one.

- **Fiber entropy** (§entropy): the Shannon entropy
  $\mathcal{H}_t(\delta) = -\sum_\lambda p_{t,\lambda} \log p_{t,\lambda}$ of the
  spectral weight distribution $\{p_{t,\lambda}\}$ at history $t$. It measures the
  informational disorder of the unsettled modes.

- **Spectral thermodynamic temperature** (§spectral-thermodynamics):
  $T_{\mathrm{thermo}}(t) \propto M_t(\delta) = \mathrm{Tr}(\delta_t)$, the spectral
  mass. This is the temperature of the mode system itself — how much energy is stored
  in unsettled relational history.

- **Depth filtration** (§depth-filtration): the tower
  $R^{(0)} \hookrightarrow R^{(1)} \hookrightarrow \cdots$ where $R^{(n+1)} = U_G(R^{(n)})$.
  Each step applies the self-generation closure and advances the depth by one.

---

#### Logical Irreversibility of the Counit {#ll-irreversibility}

**The counit erases information.** The counit component
$$
\epsilon_H(t) \;:\; H_{s \star t} \longrightarrow H_t
$$
is the restriction map from the fiber at the extended history $s \star t$ to the fiber at $t$.
This map is the relational analog of **forgetting the last step $s$**: it discards all
propositions that are true of the history $s \star t$ but are not determined by $t$ alone.

**What is erased.** Define the **$s$-shadow** at $t$ as the kernel of the restriction map in the
spectral sense: those modes $e \in H_{s \star t}$ whose restriction $\epsilon_H(t)(e) = 0 \in H_t$
— propositions that depend essentially on the $s$-extension and vanish when $s$ is forgotten.
In spectral terms (§spectral-decomposition): modes in $E_{s \star t, \lambda}$ for $\lambda > 0$
that are annihilated by restriction are $s$-specific information.

**Logical irreversibility.** A computation step is **logically irreversible** if its output
does not determine its input — if distinct inputs can produce identical outputs, so the step
cannot be undone. The restriction map $\epsilon_H(t)$ is logically irreversible whenever the
$s$-shadow is nontrivial: distinct elements $a, b \in H_{s \star t}$ with $a \neq b$ but
$\epsilon_H(t)(a) = \epsilon_H(t)(b) \in H_t$. This happens exactly when there exist
propositions true at $s \star t$ that are not visible at $t$ — i.e., whenever the prefix
inclusion $t \hookrightarrow s \star t$ is not a local isomorphism of fibers. By the
Axiom of History Separation (§history-separation), distinct histories $t$ and
$s \star t$ have genuinely distinct fiber algebras, so the restriction map is generically
non-invertible: the counit is generically logically irreversible.

**Remark on the fixed fiber.** The restriction map IS injective on $H_t^*$ (§fixed-fiber):
on the doubly-quiescent layer, restriction maps are isomorphisms of fixed-point algebras,
so no settled propositions are erased. Logical irreversibility is confined to the unsettled
modes — the spectral interior above $E_{t,0}$.

---

#### The Landauer Bound {#ll-landauer}

**Landauer's principle** (classical): any logically irreversible computation step that
erases $k$ bits of information dissipates at least $k \cdot k_B T \ln 2$ of energy as
heat, where $T$ is the temperature of the computational substrate.

**Relational Landauer bound.** Translating into the spectral framework:

- **Bits erased**: the spectral mass of the Landauer kernel $\mathcal{K}_s(t) = \ker(\varepsilon_s(t))$
  (§landauer-cost) —
  $$
  \mathcal{L}_s(t) \;:=\; M\bigl(\delta|_{\mathcal{K}_s(t)}\bigr)
  $$
  the total spectral weight of the defect operator restricted to propositions annihilated
  by the counit. This is the spectral weight destroyed by the counit.

- **Temperature**: the thermodynamic temperature $T_{\mathrm{thermo}}(t) \propto M_t(\delta)$
  of the fiber at the target history $t$ (the heat reservoir that receives the waste heat).

- **Minimum dissipation per counit application**:
  $$
  \Delta \mathcal{E}_{\mathrm{Landauer}}(t,s)
  \;\geq\; c_{\mathrm{rel}} \cdot T_{\mathrm{thermo}}(t) \cdot \mathcal{L}_s(t)
  \;\propto\; M_t(\delta) \cdot \mathcal{L}_s(t),
  $$
  where $c_{\mathrm{rel}} = \varepsilon_{\min}$ is the minimum nonzero spectral drop
  (§landauer-cost) — derived from the spectral structure of the fiber algebras as the
  minimum energy quantum per spectral bit of erased relational history.

- **Total per-depth-step dissipation** (summing over all histories and all step-generators $s$):
  $$
  \mathcal{E}_{\mathrm{Landauer}}^{(n)}
  \;\geq\; c_{\mathrm{rel}} \cdot \sum_{t \in T} \sum_{s \in \Sigma} M_t(\delta^{(n)}) \cdot \mathcal{L}_s^{(n)}(t).
  $$
  This is the minimum heat released to the vacuum at depth step $n$.

**The heat flows downward.** The dissipated energy $\Delta \mathcal{E}_{\mathrm{Landauer}}$
is deposited into the stable layer $E_{t,0}$ — the ground-state modes. It is not removed
from the universe; it is settled. Settled modes at $E_{t,0}$ constitute the "thermal
reservoir" of the relational universe — the spectral background into which all irreversible
computation must eventually discharge.

---

#### The Correspondence Table {#ll-table}

| Physical phenomenon | Relational structure |
|---|---|
| Universe expands (increasing depth $n$) | Depth tower $R^{(0)} \hookrightarrow R^{(1)} \hookrightarrow \cdots$ |
| One cycle of computation | One application of $U_G$: depth step $n \to n+1$ |
| Bit erasure in computation | Mode erasure by counit $\epsilon_H(t): H_{s \star t} \to H_t$ |
| Erased information content | Spectral mass of Landauer kernel: $\mathcal{L}_s(t) = M(\delta|_{\mathcal{K}_s(t)})$ |
| Landauer heat per bit | $\varepsilon_{\min} \cdot T_{\mathrm{thermo}}(t) \propto M_t(\delta)$ per spectral bit |
| Total Landauer heat per computation step | $\mathcal{E}_{\mathrm{Landauer}}^{(n)}$: summed across all histories and step-generators |
| Thermal reservoir receiving heat | Stable layer $E_{t,0}$ (settled modes: ground-state fiber content) |
| Accelerating expansion | Monotone increase in $\mathcal{E}_{\mathrm{Landauer}}^{(n)}$ as $n$ increases and $M_t$ shrinks |
| Cosmological constant $\Lambda$ | Cumulative Landauer heat across all depth steps: $\Lambda \propto \sum_n \mathcal{E}_{\mathrm{Landauer}}^{(n)}$ |
| Vacuum energy density $\rho_\Lambda$ | Landauer heat per unit "history volume" per depth step |

---

#### The Bridge — Accelerating Expansion as Waste Heat {#ll-bridge}

**Classical cosmology** treats $\Lambda$ as a free constant: the cosmological constant
appears in the Einstein field equations $G_{\mu\nu} + \Lambda g_{\mu\nu} = 8\pi G T_{\mu\nu}$
as an unexplained parameter whose measured value $\Lambda \approx 1.1 \times 10^{-52}\ \mathrm{m}^{-2}$
is many orders of magnitude smaller than quantum field theory predictions (the "cosmological
constant problem").

**The relational reading** proposes that $\Lambda$ is not a free constant but a
derived quantity: the cumulative Landauer heat deposited into the stable layer
$E_{t,0}$ as the universe executes successive depth steps. The accelerating expansion
is not driven by an intrinsic energy of empty space; it is driven by the
irreducible minimum energy cost of self-computation.

**Why the expansion accelerates.** The Landauer dissipation per depth step is
$\mathcal{E}_{\mathrm{Landauer}}^{(n)} \propto M^{(n)}_{\mathrm{total}} \cdot \mathcal{L}^{(n)}_{\mathrm{total}}$.
As the tower descends:

- $M^{(n)}_{\mathrm{total}}$ decreases (modes settle; spectral mass flows to $E_{t,0}$).
- But the Landauer RATE, governed by the spectral thermodynamic temperature, is
  $\propto M_t^{(n)}$: as the system cools (spectral mass decreases), individual counit
  applications dissipate less heat per erasure event.
- However, the total number of remaining unsettled modes also decreases, so the
  accumulated heat in $E_{t,0}$ continues to grow — it is an accumulation, not a flow.

The effective cosmological constant at depth $n$ is:
$$
\Lambda^{(n)} \;\propto\; \sum_{k=0}^{n} \mathcal{E}_{\mathrm{Landauer}}^{(k)},
$$
a monotone increasing quantity. The expansion is accelerating because $\Lambda^{(n)}$ is
monotone in $n$, and depth increases without bound.

**The logic-gate horizon.** The title refers to the boundary at which the universe's
self-computation is forced to "pay the price" for each irreversible gate operation.
Below the stable layer $E_{t,0}$ (outside the spectral horizon), computation is free:
settled modes propagate without dissipation. Inside the spectral horizon
($\lambda > M_t(\delta)$, cf. §spectral-schwarzschild), each counit application
incurs a minimum Landauer tax. The boundary is the "logic-gate horizon" — where
the computational tax begins.

---

#### Prediction and Falsification {#ll-prediction}

**Prediction (qualitative).** If the correspondence is correct:

1. **$\Lambda$ is computable from spectral data**: the cosmological constant is the
   integral of Landauer heat across the depth tower. In principle, given a computation
   of $M_t(\delta^{(n)})$ and $\mathcal{L}_s^{(n)}(t)$ for the Fibonacci history model
   (§quasicrystal-hypertensor, §golden-stability), one should obtain a finite value
   for $\Lambda$.

2. **The expansion rate encodes the erasure rate**: the Hubble parameter $H(z)$ at
   redshift $z$ corresponds to the Landauer dissipation rate at depth $n(z)$. The
   functional form of $H(z)$ is determined by how $\mathcal{E}_{\mathrm{Landauer}}^{(n)}$
   varies with $n$.

3. **The cosmological constant problem is resolved in principle**: the relational
   Landauer heat is proportional to spectral mass (which decays as $\varphi^{-n}$
   per §golden-stability), not to the naive quantum field theory estimate. The
   suppression factor $\varphi^{-n}$ at any finite depth $n$ could account for
   the small observed value of $\Lambda$ without fine-tuning, if the current
   cosmological epoch corresponds to a large depth $n$.

**Falsification.** The correspondence fails if:

- The restriction map $\epsilon_H(t): H_{s \star t} \to H_t$ is injective for ALL
  histories $t$ and generators $s$ — which would require all fiber algebras to be
  constant across extensions, contradicting the Axiom of History Separation.
  This direction of falsification is already ruled out by the axioms.

- The total Landauer heat per depth step is not monotone increasing in $n$: if
  $\mathcal{E}_{\mathrm{Landauer}}^{(n)}$ decreases as the tower descends, the
  accumulated vacuum energy would not produce accelerating expansion.

- The derived value of $\Lambda$ from spectral mass data (if ever computed for a
  specific example) disagrees with the measured cosmological constant by more than
  the modeling uncertainty.

---

#### What the Correspondence Requires {#ll-requires}

- **Categorification of $\mathcal{L}_s(t)$**: ✓ Resolved. The Landauer cost is now
  defined as the spectral mass of the sheaf-theoretic kernel $\mathcal{K}_s(t) = \ker(\varepsilon_s(t))$
  of the counit (§landauer-cost). This is a natural transformation, not a numerical
  difference.

- **Derivation of $c_{\mathrm{rel}}$**: ✓ Resolved. The relational cost constant is
  $c_\mathrm{rel} = \varepsilon_{\min}$, the minimum nonzero spectral drop across all
  tunneling events (§landauer-cost, §spectral-heat). It is derived from the spectral
  structure of the fiber algebras, not posited as a free parameter.

- **Monotonicity of $\mathcal{E}_{\mathrm{Landauer}}^{(n)}$**: the claim that accumulated
  Landauer heat is monotone increasing requires showing that each depth step adds
  more heat than the previous one removes — a statement about the balance between
  the decreasing spectral mass and the increasing number of counit applications.

- **A physical dictionary for depth $n$**: to match $\Lambda^{(n)}$ to the measured
  cosmological constant, we need to identify which depth $n$ corresponds to the
  current cosmological epoch. This is not yet established.

**Status.** Draft. The logical irreversibility of the counit follows from the axioms
(History Separation rules out injective restriction maps in general). The Landauer cost
is now categorified as a sheaf-theoretic kernel, and $c_\mathrm{rel} = \varepsilon_{\min}$
is derived from the spectral structure (§landauer-cost). The remaining open items are the
monotonicity of cumulative Landauer heat and the physical dictionary for depth $n$. The
identification of $\mathcal{E}_{\mathrm{Landauer}}^{(n)}$ with $\Lambda$ is the
speculative far end of the correspondence and requires a fully quantitative
derivation from the spectral mass tower.
