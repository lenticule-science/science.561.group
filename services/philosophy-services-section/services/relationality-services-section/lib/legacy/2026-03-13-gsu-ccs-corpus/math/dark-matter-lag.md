---
id: dark-matter-lag
name: DarkMatterLag
description: "Relational Refractive Index — Dark Matter as History Lag"
---

### Conjecture — Relational Refractive Index: Dark Matter as History Lag {#dark-matter-lag}

*Dark matter is not a particle. It is a region of the universe with anomalously high
spectral mass — dense, unsettled relational history accumulated at a history coordinate.
In such regions, fiber reindexing requires more computational steps per depth level:
information throughput is throttled. What we observe as the gravitational influence
of dark matter is the Fischer–Rao curvature of the moduli space acting on the
restriction rate. The universe's computational substrate is refracting.*

---

#### The Mathematical Structures {#dml-math}

The relevant structures are:

- **Restriction velocity** (§restriction-velocity): the effective restriction velocity
  at history $t$ is
  $$
  c_{\mathrm{eff}}(t) \;=\; \frac{v_0}{1 + \alpha \cdot M_t(\delta)},
  $$
  where $v_0$ is the flat-space maximum (achieved when $M_t(\delta) = 0$, at the fixed
  point) and $\alpha > 0$ is a coupling constant. Restriction rate decreases monotonically
  as spectral mass increases: dense relational history throttles information throughput.

- **Fischer–Rao curvature** (§fischer-rao-metric): the Fischer–Rao metric on the moduli space
  $\mathcal{M}_n$ of nucleus families is the unique Riemannian metric invariant under the
  Markov kernels $K_n: \mathcal{P}(\mathcal{M}_{n+1}) \to \mathcal{P}(\mathcal{M}_n)$
  induced by depth-restriction. In regions of high spectral mass, mode eigenvalues are
  spread across many levels ($E_{t,\lambda}$ for large $\lambda$), producing high
  Fisher information variance — and therefore high Fischer–Rao scalar curvature $K$.

- **Spectral mass** (§spectral-decomposition): $M_t(\delta) = \mathrm{Tr}(\delta_t)$
  measures the total relational latency at history $t$ — the spectral weight of all
  unsettled modes $C_t = K^{H_t \setminus H_t^*}$.

- **Locality** (§locality): the sheaf condition enforces that coherent propositions
  must be witnessed by covering families. In sparse-history regions, covering families
  are thin — fewer witnesses per proposition.

---

#### The Kramers–Kronig Analogy {#dml-kramers-kronig}

**Classical optics.** A linear medium has a complex susceptibility
$\chi(\omega) = \chi'(\omega) + i\chi''(\omega)$. The Kramers–Kronig relations express
that the dispersive part (real, refractive) and the absorptive part (imaginary,
dissipative) are not independent: each determines the other via a Hilbert transform.
In particular, a medium that absorbs energy at frequency $\omega_0$ necessarily slows
the phase velocity of waves near $\omega_0$. Causality forces the coupling.

**The relational translation.** The spectral system at history $t$ has two aspects that
play the same roles:

- **Absorptive / imaginary**: the spectral mass $M_t(\delta) = \mathrm{Tr}(\delta_t)$
  is the "absorbed" relational weight — modes trapped in the spectral interior
  $\lambda > 0$, not propagating to the stable layer $E_{t,0}$. High spectral mass
  means the fiber is highly absorptive: propositions settle slowly, and many modes
  are "stuck."

- **Dispersive / real**: the restriction rate $c_{\mathrm{eff}}(t)$ is the "refractive"
  quantity — how fast information propagates from longer histories back to shorter ones.
  A slow restriction rate is a high "refractive index" $n_{\mathrm{rel}}(t) := v_0 / c_{\mathrm{eff}}(t)$.

**The Fischer–Rao coupling (the relational Kramers–Kronig).** The Fischer–Rao
curvature $K(\mathcal{M}_n, R_t)$ is the mediator:

$$
K(\mathcal{M}_n, R_t) \;\propto\; M_t(\delta)
\qquad \Longrightarrow \qquad
c_{\mathrm{eff}}(t) \;=\; \frac{v_0}{1 + \alpha \cdot K(\mathcal{M}_n, R_t)}.
$$

High spectral mass → high Fischer–Rao curvature → low restriction velocity. This is the
relational Kramers–Kronig: the absorptive character (spectral mass) forces the dispersive
character (restriction lag) via the information geometry of the moduli space. It is not
an independent assumption; it is the consequence of the Fischer–Rao metric being the
unique invariant metric under depth-restriction (§fischer-rao-metric).

The classical Kramers–Kronig integral $n(\omega) - 1 \propto \mathcal{P}\int \kappa(\omega')/(\omega'-\omega)\,d\omega'$ corresponds in the relational setting to the integral of spectral mass over all "frequencies" (eigenvalue levels) producing the local restriction rate. The principal-value integral is replaced by the Fischer–Rao curvature integration over the moduli space.

---

#### The Correspondence Table {#dml-table}

| Physical dark matter | Relational structure |
|---|---|
| Dark matter halo (gravitationally dense, no visible baryons) | Region $\Omega \subseteq T$ of high spectral mass $M_t(\delta)$ — dense, unsettled history |
| Dark matter density $\rho_{\mathrm{DM}}(x)$ | Spectral mass field $M_t(\delta)$ over the history site |
| Refractive index $n(\omega)$ of a medium | Relational refractive index $n_{\mathrm{rel}}(t) = v_0/c_{\mathrm{eff}}(t) = 1 + \alpha M_t(\delta)$ |
| Absorption coefficient $\kappa(\omega)$ | Spectral absorption $M_t(\delta)$: energy trapped in spectral interior |
| Kramers–Kronig relation (causality) | Fischer–Rao curvature coupling: $K \propto M_t \Rightarrow c_{\mathrm{eff}} \propto 1/K$ |
| Galactic rotation curves (flat velocity at large radius) | Slowly decaying $M_t(\delta)$: spectral mass falls off gradually with history distance from the center |
| Gravitational lensing by dark matter | Fischer–Rao geodesics deflected by curvature concentrations at high-$M_t$ regions |
| Light slows in optically dense medium | Restriction rate throttled: fiber reindexing requires more steps per depth level |
| No dark matter particle detected | No new particle: spectral mass is a relational property of the history site, not a baryonic constituent |
| Dark matter does not interact via electromagnetism | Spectral mass is not charged: it is a property of the relational history, not of any mode's internal quantum numbers |

---

#### The Bridge — Gravitational Attraction Without Extra Mass {#dml-bridge}

**Classical astrophysics** attributes the excess gravitational influence in galaxy halos,
galaxy clusters, and large-scale structure to non-baryonic dark matter: a new type of
matter that gravitates but does not interact electromagnetically. The evidence — rotation
curves, lensing, CMB power spectrum — is robust, but no particle candidate has been
directly detected.

**The relational reading** proposes that "dark matter" regions are regions where the
relational computation is denser: more histories converge on the same spatial
coordinate, producing higher spectral mass $M_t(\delta)$. This high spectral mass does
two things simultaneously:

1. **It slows the restriction rate** $c_{\mathrm{eff}}(t)$: information propagating
   outward from such a region must pass through a higher-curvature section of the
   moduli space, and the Fischer–Rao curvature acts as effective drag on each
   restriction map.

2. **It curves the relational moduli space** $\mathcal{M}_n$: the Fischer–Rao metric
   concentrates curvature near high-$M_t$ points (§fischer-rao-convergence), so
   geodesics in $\mathcal{M}_n$ bend toward regions of high spectral mass.

**Gravitational attraction as geodesic deviation.** If physical trajectories correspond
to geodesics in the Fischer–Rao moduli space (a conjecture — that the relational
geometry underlies the physical spacetime geometry), then geodesic bending toward
high-$M_t$ regions is observed as gravitational attraction. The "extra mass" required
to explain the bending is the spectral mass $M_t(\delta)$: not baryonic, not a particle,
but a property of the relational computational substrate.

**Galactic rotation curves.** The flat rotation curve problem: at large galactic radii
$r$, the orbital velocity $v(r) \approx \mathrm{const}$ rather than $\sim r^{-1/2}$ as
Newtonian gravity predicts from visible mass alone. In the relational reading: the
spectral mass $M_t(\delta)$ decays slowly with $r$ (because the history histories of
matter at large radii are extended and their unsettled modes persist), maintaining
a high Fischer–Rao curvature at large radii. This sustains the effective geodesic
bending and hence the flat rotation curve.

---

#### Prediction and Falsification {#dml-prediction}

**Prediction (qualitative).**

1. **Correlation of dark matter with relational complexity, not baryonic density alone**:
   the spectral mass $M_t(\delta)$ should correlate with the complexity of the relational
   history at a spatial coordinate — number of interacting systems, depth of interaction
   history — not merely with the count of baryons. This predicts that dark matter should
   be denser around gravitationally interacting systems (galaxy clusters) and sparser
   in isolated voids, consistent with observation.

2. **Speed-of-light variation in dark matter halos**: if $c_{\mathrm{eff}}(t)$ is genuinely
   lower in high-$M_t$ regions, then light should propagate more slowly — not just bend —
   through dark matter halos. The delay would be analogous to a Shapiro delay but with a
   distinct spectral-mass dependence: $\Delta t \propto \int M_t(\delta) \, d\ell$ along
   the light path, where $d\ell$ is path length.

3. **No particle**: the correspondence predicts that direct detection of a dark matter
   particle will continue to fail. The "mass" is relational, not baryonic — there is
   nothing to detect with a particle detector.

**Falsification.** The correspondence fails if:

- A dark matter particle with well-defined mass, spin, and coupling constants is
  directly detected, demonstrating that the gravitational excess has a baryonic (or
  particle) origin.

- The Shapiro delay in dark matter halos does not follow $\int M_t(\delta) \, d\ell$:
  if the delay profile disagrees with the spectral mass prediction, the restriction
  velocity conjecture is falsified.

- The Fischer–Rao curvature at a specific history coordinate $t$ can be computed from
  first principles (for a simple relational model) and does not scale with $M_t(\delta)$
  as required by the curvature bound of §restriction-velocity.

---

#### What the Correspondence Requires {#dml-requires}

- **§restriction-velocity**: the curvature bound $c_{\mathrm{eff}}(t) \propto 1/(1 + \alpha M_t(\delta))$
  is a conjecture, not a theorem. Establishing it requires showing that $K(\mathcal{M}_n, R_t) \propto M_t(\delta)$
  from the Fischer–Rao geometry and that this curvature genuinely caps the restriction rate.

- **A dictionary between restriction rate and propagation speed**: the restriction rate
  is defined on abstract history steps, not on physical spacetime. A physical reading
  requires identifying which restriction maps correspond to which spacetime intervals —
  a connection between the history category $T$ and the physical spacetime manifold.

- **The Kramers–Kronig integral**: for the analogy to be quantitative, the relational
  analog of $n(\omega) = 1 + \frac{1}{\pi}\mathcal{P}\int \kappa/(\omega'-\omega)\,d\omega'$
  must be derived — an explicit integral formula relating $c_{\mathrm{eff}}(t)$ to the
  spectral mass profile $M_{t'}(\delta)$ at neighboring histories $t'$.

- **Geodesic correspondence**: for the gravitational attraction argument to go through,
  physical worldlines must correspond to Fischer–Rao geodesics. This is not established
  and constitutes a substantial additional claim about the relationship between the
  relational geometry and general relativity.

**Status.** Stub. The throttling of restriction rate by spectral mass follows directly
from §restriction-velocity (conditional on that conjecture). The Fischer–Rao Kramers–Kronig
analogy is the structural bridge: it supplies the causality argument that absorption (spectral
mass) forces dispersion (restriction lag). The identification of this lag with the
gravitational effect of dark matter is the speculative far end, requiring a physical
dictionary between the history site and spacetime that is not yet established.
