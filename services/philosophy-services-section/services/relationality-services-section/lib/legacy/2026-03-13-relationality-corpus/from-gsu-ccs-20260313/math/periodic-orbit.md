---

name: periodic-orbit
description: "Object: a locally periodic history — one where the restriction maps H*_{t·s^{n+1}} → H*_{t·s^n} become isomorphisms for large n — is a periodic orbit under U_G: the depth tower cycles without converging. This is the precise mathematical definition of a relational singularity."
defines: PeriodicOrbit
---

### Definition — Locally Periodic Histories {#periodic-orbit}

**Definition.** A history $t \in T$ is **locally periodic along step $s \in \Sigma$** if
there exists $N \geq 0$ such that for all $n \geq N$, the restriction map
$$
\rho_s^{(n)}\colon H^*_{t \cdot s^{n+1}} \;\longrightarrow\; H^*_{t \cdot s^n}
$$
is an isomorphism of nuclear Heyting algebras. The orbit $\{t \cdot s^n : n \geq N\}$ is
called a **periodic orbit** of $U_G$ at $t$ along $s$.

Under the Aperiodicity-Halting Conjecture (§aperiodicity-halting), a history is locally
periodic along $s$ if and only if $U_G$ fails to converge at $t$ along $s$ — the depth
tower at $t$ cycles without reaching a fixed fiber algebra.

#### Physical Interpretation {#periodic-orbit-physical}

*The discussion below is a physical correspondence; the mathematics above is primary.*

*A relational singularity is a coordinate in the history category where the
universe's self-generation program fails to terminate: the history at that coordinate
has become locally periodic, and $U_G$ enters an infinite loop attempting to normalize it.*

---

#### The Mathematical Structures {#bhs-math}

The relevant structures on the relational side are:

- **Aperiodicity** (§aperiodicity, §aperiodicity-halting): the history monoid
  $T = \mathbb{M}(\Sigma, I)$ is aperiodic if its Cayley graph contains no oriented
  cycle. The Aperiodicity-Halting conjecture states that $U_G$ reaches a fixed point
  if and only if the history monoid is aperiodic. A periodic history monoid causes $U_G$
  to enter an infinite regress in the normalization phase.

- **Local periodicity at a history**: a history $t$ is **locally periodic** if there exists
  a step $s \in \Sigma$ such that the fiber algebras satisfy $H_{t \cdot s^n} \cong
  H_{t \cdot s^{n+1}}$ for all sufficiently large $n$ — repeated extension by $s$ stops
  changing the relational state. This is a local violation of the Axiom of History
  Separation (§history-separation): distinct histories $t \cdot s^n$ and $t \cdot
  s^{n+1}$ become propositionally indistinguishable.

- **Spectral mass and Schwarzschild radius** (§spectral-schwarzschild): the spectral
  mass $M_t(\delta) = \mathrm{Tr}(\delta_t)$ is the total unsettled relational weight
  at history $t$. The Schwarzschild radius $r_s(\delta_t) = 2M_t(\delta)$ is the critical
  spectral scale: modes with eigenvalue $\lambda > M_t(\delta)$ lie in the spectral
  interior and cannot decay to $E_{t,0}$ through dynamics internal to $t$.

- **Cohomological tunneling** (§cohomological-tunneling): modes trapped in the spectral
  interior can exit via global cohomological structure — the connecting homomorphism
  $\partial: \Gamma(V/E_0) \to H^1(T,J;E_0)$ provides a non-local escape route when
  $H^1 \neq 0$. This is the mechanism by which $U_G$ partially resolves trapped modes
  without local dynamics.

---

#### The Correspondence Table {#bhs-table}

| Physical black hole | Relational mathematics |
|---|---|
| Black hole (macroscopic object) | Region $\Omega \subseteq T$ of locally periodic histories |
| Event horizon | Spectral Schwarzschild boundary: histories where $\lambda > M_t(\delta)$ for the dominant mode |
| Singularity at $r = 0$ | Trace $t_\mathrm{sing}$ where $U_G$ enters infinite regress: no canonical normal form |
| Gravitational collapse | Cascade of local periodicity: as depth increases, more histories enter the periodic regime |
| Nothing escapes the horizon classically | Modes in the spectral interior cannot decay via local dynamics alone |
| Hawking radiation (quantum) | Cohomological tunneling: spectrally trapped modes escape via $H^1$ obstruction class |
| Black hole temperature $T_H = 1/(8\pi M)$ | Tunneling rate $\propto 1/M_t(\delta)$ (§spectral-hawking): inverse spectral mass |
| Information paradox | Whether $H^1$ tunneling preserves the full mode-section content or loses it |
| No-hair theorem | The settled layer $H_t^* = E_{t,0}$ is the only observable content outside the horizon |

---

#### The Bridge — Singularity as Non-Convergence {#bhs-bridge}

**Classical general relativity** describes a black hole singularity as a region where
the spacetime metric becomes singular — curvature diverges, geodesics terminate, and
the equations of motion break down. This is a geometric failure.

**The relational reading** identifies the geometric failure with a computational one.
The universe at each history $t$ runs the self-generation program $U_G$: it applies the
four-phase closure (algebra, language, geometry, dynamics) to produce the canonical
fiber algebra $H_t = U_G(H_{t^-})$. This program terminates — converges to a unique
fixed-point fiber algebra — if and only if the history structure at $t$ is aperiodic
(§aperiodicity-halting).

**At a black hole singularity**, the local history structure has become periodic. The
history extensions $t, t \cdot s, t \cdot s^2, \ldots$ cycle through isomorphic fiber
algebras. Each application of $U_G$ attempts to identify $t \cdot s^n$ with $t \cdot
s^{n+1}$ (since they are isomorphic), but this identification requires normalizing a
history that includes itself as a sub-history — a relational cycle. The normalization phase
(§modal-calculus, §normalization) enters an infinite regress: no canonical normal form exists.

The singularity is not a point of infinite density; it is a point of **infinite
computational depth** — the self-generation program at that coordinate runs forever
without settling on a fixed-point fiber algebra.

**Geometry as a symptom.** The divergence of curvature in general relativity is the
geometric manifestation of this computational failure: when $U_G$ does not converge,
the depth tower $R_0 \hookrightarrow R_1 \hookrightarrow \cdots$ at the periodic
coordinate does not stabilize. The spectral mass $M_t(\delta)$ grows without bound
as depth increases, since no modes descend to $E_{t,0}$ — the stable eigenspace is
never reached. Diverging spectral mass corresponds to diverging "gravitational mass"
and hence diverging curvature.

---

#### The Event Horizon as Spectral Boundary {#bhs-horizon}

The spectral Schwarzschild conjecture (§spectral-schwarzschild, §spectral-horizon)
defines the event horizon spectrally: histories $t$ where the dominant mode eigenvalue
$\lambda_\mathrm{max}$ exceeds the spectral mass $M_t(\delta)$ are inside the horizon.

**Classically:** outside the Schwarzschild radius $r > r_s = 2M$, test particles can
escape to infinity. Inside $r < r_s$, all future-directed paths lead to the singularity.

**Spectrally:** outside the spectral horizon ($\lambda_\mathrm{max} < M_t(\delta)$),
modes can decay to $E_{t,0}$ via local dynamics — the relational state can settle.
Inside the spectral horizon ($\lambda_\mathrm{max} > M_t(\delta)$), no local dynamics
can move modes out of the spectral interior — the relational state is trapped.

The two boundaries correspond. The spectral mass $M_t(\delta) = \mathrm{Tr}(\delta_t)$
is the relational analog of the black hole mass $M$; the Schwarzschild radius
$r_s = 2M$ is the relational analog of the spectral threshold $\lambda_\mathrm{max}
= M_t(\delta)$.

---

#### Hawking Radiation as Cohomological Tunneling {#bhs-hawking}

The one mechanism by which modes inside the spectral horizon can escape is
cohomological tunneling (§cohomological-tunneling): when the obstruction class
$\partial([e]) \in H^1(T,J;E_0)$ is nontrivial, the Axiom of Locality forces $U_G$
to move the mode to a globally consistent lower-eigenvalue state, even though no
local dynamics permits this.

This is the relational analog of Hawking radiation: a quantum effect that allows
energy to escape the classical event horizon via a non-local mechanism (in Hawking's
case, vacuum fluctuations; in ours, global cohomological structure). The rate is
proportional to $1/M_t(\delta)$ by the spectral Hawking conjecture (§spectral-hawking):
large black holes have small $H^1$ obstruction classes and tunnel slowly; small black
holes have large $H^1$ obstruction classes and tunnel rapidly.

**The endpoint.** Hawking evaporation corresponds to the exhaustion of $H^1$
obstruction classes as the spectral mass decreases: $M_t(\delta) \to 0$ as $n \to
\infty$ (the mode fully settles to $E_{t,0}$). At $M_t(\delta) = 0$, the spectral
horizon closes and $U_G$ converges — the black hole has evaporated, and the history $t$
is now aperiodic.

---

#### The Information Paradox {#bhs-information}

The black hole information paradox asks whether information that falls into a black
hole is preserved or destroyed at evaporation. In the relational reading:

- **Information IN**: the modes falling past the spectral horizon are sections of the
  mode sheaf $V$ restricted to the periodic sub-region $\Omega$.
- **Tunneling OUT**: cohomological tunneling carries modes from $E_{t,\lambda}$ to
  lower eigenvalues via the obstruction class $[\partial(e)] \in H^1$.

The question: does the tunneling map $U_G: E_{t,\lambda} \to E_{t,\mu}$ (for $\mu <
\lambda$) preserve the full section data of $e$, or does it discard it?

In our framework: the connecting homomorphism $\partial$ is determined by the global
topology of $(T,J)$, not by the individual mode $e$. The tunneled mode $U_G(e)$ lands
at a globally consistent lower-eigenvalue state, but the global consistency condition
is a sheaf condition on covering families — it does not in general preserve the
fine-grained local data of $e$ at $t$. Information about the specific local mode
is potentially lost in the process of satisfying the global sheaf condition.

This is the relational analog of the information paradox: the Axiom of Locality
(§locality) forces global consistency (information about the covering structure is
preserved) but does not force local reconstruction (information about the specific
mode at a specific history may be lost). The paradox is not resolved in our framework;
it is identified as a question about the injectivity of the cohomological tunneling map.

---

#### Prediction and Falsification {#bhs-prediction}

**Prediction (qualitative).** Black holes are exactly the histories where the aperiodicity
condition fails — where the relational self-generation program halts. This predicts:

1. **No singularity in an aperiodic region**: if the history structure at a coordinate
   is globally aperiodic, $U_G$ converges there, and no singularity forms regardless
   of the local matter content.

2. **Singularity formation requires relational cycling**: a singularity forms when and
   only when a history extension cycle develops — when distinct histories become
   propositionally indistinguishable. This is a condition on the RELATIONAL structure
   of the matter distribution, not solely on its energy density.

3. **Hawking temperature as tunneling rate**: the tunneling rate of cohomological
   tunneling is $\propto 1/M_t(\delta)$, giving $T_H \propto 1/M$, consistent with
   the Hawking temperature formula $T_H = 1/(8\pi M)$ (in natural units). This is a
   prediction of the specific functional form, not merely a qualitative agreement.

**Falsification.** The correspondence is falsified if:
- A singularity forms at a history coordinate with a demonstrably aperiodic history
  structure (no relational cycling).
- The Hawking temperature deviates from $1/M$ at small $M$ (where the tunneling
  rate is expected to grow fastest and deviations from the functional form would
  be most visible).
- The spectral Schwarzschild radius $r_s = 2M_t(\delta)$ can be computed for a
  specific physical system and disagrees with the classical Schwarzschild radius.

---

#### What the Correspondence Requires {#bhs-requires}

- **§aperiodicity-halting**: the identification of singularities with
  non-convergence of $U_G$ requires this conjecture — that periodic history monoids
  genuinely cause $U_G$ to loop (not just to converge slowly).

- **§spectral-schwarzschild (§spectral-horizon)**: the identification of the event
  horizon with the spectral threshold $\lambda > M_t(\delta)$ requires the spectral
  horizon conjecture. Without it, there is no sharp spectral boundary corresponding
  to the classical event horizon.

- **§cohomological-tunneling**: the Hawking radiation identification requires this
  conjecture — that $H^1$ obstruction classes provide the non-local escape mechanism.

- **A dictionary between $M_t(\delta)$ and physical mass $M$**: for the Hawking
  temperature prediction to be quantitative, the spectral mass must be identified
  with the physical ADM mass of the black hole. This identification is not yet
  established; it requires a derivation of the spectral mass from a physical Hamiltonian.

**Status.** Stub. The qualitative correspondence between periodic history structure and
black hole singularities, and between the spectral Schwarzschild radius and the event
horizon, is structurally compelling but rests on three un-established conjectures.
The Hawking temperature formula match ($T_H \propto 1/M$) is the most concrete
quantitative prediction and the clearest test of the correspondence.
