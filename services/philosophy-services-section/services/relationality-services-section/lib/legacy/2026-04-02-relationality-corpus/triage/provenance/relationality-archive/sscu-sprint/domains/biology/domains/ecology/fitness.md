---
name: fitness

description: "Fitness is a triple (x, R, f) — an object x, a role R specifying required qualities and their thresholds, and a fitness value f = Fit_t(x, R) ∈ [0,1] measuring how fully x satisfies R's capability-signature at history t. The defining condition: x fills R iff f = 1 (x meets every threshold); x is unfit iff f = 0 on at least one required quality. Fitness is a quality of qualities: it measures how well x's quality profile covers R's requirement profile. Spectral thermodynamics reading: the fitness deficit (1 minus fitness value) is proportional to the RelationalHistoryFiberCalibrationDefect — the spectral mass M_t of the unsettled quality-gap modes. The thermodynamic temperature T_thermo is proportional to spectral mass: a highly unfit entity (large M_t) is a thermodynamically hot system with high stored internal energy in its quality-gap modes. The Hawking temperature T_H = 1/(2M_t) is inversely proportional: as the entity approaches full fitness (M_t → 0), the Hawking horizon temperature diverges — the remaining fitness gap is released as increasingly hot tunneling radiation. At the fixed point Fit_t(x,R) = 1, M_t = 0: T_thermo = 0 (no stored fitness energy) and T_H → ∞ (the fitness horizon has evaporated entirely). The two temperatures are not in contradiction; they describe two non-equilibrium aspects of the same fitness-development process: T_thermo measures what remains unfilled; T_H measures the rate at which the last remaining gap is released."
date-created: 2026-03-20
date-modified: 2026-03-20
---

## Formal definition

**Fitness** is a triple $(x, R, f)$:

$$\mathrm{Fit}_t(x, R) = \bigwedge_{Q_i \in \Sigma_R} [Q_{i,t}(x) \geq q_i^{\min}] \in \Omega_t$$

where:
- $x$ is the **subject** — the entity being evaluated for fitness; $x \in X(t)$ for some object-type $X$ at history $t$
- $R$ is the **role** — the [Role](role.md) specifying the capability-signature $\Sigma_R$: a set of required qualities $\{Q_i\}$ with their minimum thresholds $\{q_i^{\min}\}$
- $f = \mathrm{Fit}_t(x, R) \in \Omega_t$ is the **fitness value** — the meet of all per-quality satisfaction conditions; $f = 1$ (true) iff $x$ meets every threshold; $f = 0$ (false) iff $x$ fails at least one threshold

**Role-filling condition.** $x$ **fills role $R$** iff $\mathrm{Fit}_t(x, R) = 1$: for every quality $Q_i$ in $R$'s signature, $Q_{i,t}(x) \geq q_i^{\min}$. This is the precise formalization of role-filling from [Role](role.md): providing a term of the role's record type — a witness that supplies each required field at or above the minimum level.

**Partial fitness.** $\mathrm{Fit}_t(x, R)$ need not be binary. If the value-presheaves $V_i$ are lattice-ordered, the fitness value is the meet of the per-quality ratios $Q_{i,t}(x) / q_i^{\min}$ — how far each quality is above (positive) or below (negative) threshold. A partially fit entity has some qualities meeting threshold and others falling short.

## What this is

**Fitness** is the quality that measures how well a subject matches a role's requirements. It is a *quality of qualities*: it takes the subject's quality profile (a vector of quality values) and compares it to the role's requirement profile (a vector of thresholds), producing a single fitness score.

Fitness is history-indexed: $\mathrm{Fit}_t(x, R)$ depends on $t$ because both the subject's qualities and the role's thresholds may change across histories. An entity that is fit at $t$ may become unfit at $t'$ if the role's requirements increase or the entity's qualities decline.

## Fitness and the gap

Fitness and [Gap](gap.md) measure complementary things:

- **Gap** measures how far a fiber element is from $H^*_t$ — how much the nuclei still demand
- **Fitness** measures how far a subject is from satisfying a role's quality thresholds — how much more it needs to provide

Both are distance-to-threshold measures, but in different dimensions. Gap is nuclear distance; fitness is role-requirement distance. An officer can have zero gap (fully settled output) but low fitness (not meeting the role's capability requirements) — or high fitness (capability well above threshold) but positive gap (output not yet settled).

## Fitness and office

[Office](office.md) adds a deontic layer to fitness: an office specifies not just which qualities are required but which Hohfeldian positions attach to meeting or failing them. The officer's fitness determines whether their outputs reach $H^*_t$ under the office's nuclear structure. An unfit officer — one whose quality profile does not meet the office's requirements — produces outputs with persistent positive gap; the office's nuclei demand more than the officer can provide.

## Fitness over time

Fitness is not static. The dynamic view:

- $\mathrm{Fit}_t(x, R) = 0$ at $t_0$ → the entity is currently unfit; needs development
- $\mathrm{Fit}_t(x, R)$ increasing toward $1$ as $t$ grows → the entity is developing toward the role
- $\mathrm{Fit}_t(x, R) = 1$ at $t_1$ → the entity now fills the role; can be installed
- $\mathrm{Fit}_t(x, R) < 1$ at $t_2 > t_1$ → the entity has degraded; is no longer fit for the role

The trajectory of fitness is the entity's *development profile* with respect to $R$. An [Investiture](investiture.md) requires $\mathrm{Fit}_{t_0}(x, R) = 1$ at the moment of installation; subsequent fitness changes are the entity's ongoing responsibility to maintain.

## Spectral thermodynamics of fitness development

**Source:** [Spectral Thermodynamics Temperature Duality Golden Conjecture](../math/relational-history-fiber-spectral-thermodynamics-temperature-duality-golden-conjecture.md).

The development of fitness toward a role — the trajectory $\mathrm{Fit}_t(x, R)$ rising from $0$ toward $1$ — is not merely a scalar value increasing over time. It is a thermodynamic process: the fitness deficit corresponds to stored spectral energy in the unsettled quality-gap modes, and the development process releases that energy according to two distinct temperatures.

**The fitness deficit as spectral mass.** Define the **fitness deficit** at tower level $k$ as the spectral mass of the unsettled quality-gap modes:
$$M^{(k)}_t \;\propto\; \bigl(1 - \mathrm{Fit}_t(x, R)\bigr) \cdot \varphi^{-k}.$$
Under the golden stability conjecture, $M^{(k)}_t \approx M^{(0)}_t \cdot \varphi^{-k}$: the spectral mass decays at the golden ratio rate across tower levels. Each tower level represents one settling step in the development trajectory.

**Thermodynamic temperature (stored energy).** The **thermodynamic temperature** of an entity's fitness-development process is:
$$T_{\mathrm{thermo}} \;\propto\; M_t(\delta) \;\propto\; \bigl(1 - \mathrm{Fit}_t(x, R)\bigr).$$
An entity far from role-fitness (large deficit, many quality-gap modes unsettled) is a thermodynamically **hot** system: it has high internal energy stored in the gap between its current qualities and the role's thresholds. An entity near full fitness is a **cold** system with little stored internal energy.

**Hawking temperature (radiation rate).** The **Hawking temperature** of the spectral horizon is:
$$T_H \;=\; \frac{1}{2 M_t(\delta)} \;\propto\; \frac{1}{1 - \mathrm{Fit}_t(x, R)}.$$
An entity near full fitness (small fitness deficit, small $M_t$) has a **hot Hawking horizon**: the last remaining quality-gap modes are released at a high effective temperature — the final steps of development are the steepest, the most energetically concentrated. An entity far from fitness has a cold horizon: the large reservoir of unsettled modes releases slowly.

**The two-temperature table:**

| Fitness state | Spectral mass $M_t$ | $T_{\mathrm{thermo}}$ | $T_H$ | Interpretation |
|---|---|---|---|---|
| Fully unfit (Fit = 0) | Large | Hot | Cold | Much stored energy, slow gap release |
| Partially fit (Fit ∈ (0,1)) | Intermediate | Intermediate | Intermediate | Development in progress |
| Nearly fit (Fit → 1) | Small | Cold | Hot | Little remaining energy, fast gap release |
| Fully fit (Fit = 1) | Zero | Zero | Diverges | Fixed point: no stored energy, instantaneous release |

**Non-equilibrium development.** The two temperatures are not in contradiction because the fitness-development process is not in thermal equilibrium: quality-gap modes are continuously tunneling from the unsettled interior to the settled exterior as the entity develops. $T_{\mathrm{thermo}}$ describes the remaining internal energy of the unsettled modes; $T_H$ describes the rate (effective temperature) at which the last remaining modes are released. The analog is a black hole losing mass by Hawking radiation: the black hole's mass-energy (internal temperature) decreases while the emitted radiation temperature increases — both temperatures describe different aspects of the same non-equilibrium evaporation process.

**At the fixed point.** When $\mathrm{Fit}_t(x, R) = 1$: $M_t = 0$, $T_{\mathrm{thermo}} = 0$ (no stored fitness energy — the entity's quality profile is fully settled), and $T_H \to \infty$ (the fitness horizon has fully evaporated). This is the formal content of the role-filling condition: $x$ fills $R$ iff the spectral mass of its quality-gap modes has been driven to zero through the development process.

**Proposition (Fitness = spectral mass zero).** $\mathrm{Fit}_t(x, R) = 1$ iff $M_t(\delta) = 0$ for the fitness-deficit spectral mass: the entity fills the role iff every quality-gap mode has been discharged. The development trajectory converges to role-filling at tower level $k$ at rate $\varphi^{-k}$ under the golden stability conjecture: each settling step halves the remaining gap by a factor of $\varphi^{-1}$.

*Source.* Temperature duality: [Spectral Thermodynamics Temperature Duality Golden Conjecture](../math/relational-history-fiber-spectral-thermodynamics-temperature-duality-golden-conjecture.md) §Two Notions of Temperature, §The Temperature Duality, §At the Fixed Point. Status: conditional on golden stability conjecture ($M_t^{(n)} \propto \varphi^{-n}$). $\square$

## Open questions

- Whether fitness is monotone-compatible with role subsumption: if $R_1 \leq R_2$ (R_2 requires more) and $\mathrm{Fit}_t(x, R_2) = 1$, does $\mathrm{Fit}_t(x, R_1) = 1$ necessarily follow? (Yes, since R_1's thresholds are a subset of R_2's — satisfying the larger requirement profile implies satisfying the smaller one.)
- Whether "fitness for purpose" generalizes beyond roles: whether there is a notion of fitness relative to an arbitrary quality-profile specification (not just a role with a named capability-signature), and whether this generalization preserves the meet structure.
- Whether fitness can serve as the formal basis for the "capacity" concept — whether having capacity to $\varphi$ is exactly $\mathrm{Fit}_t(x, R_\varphi) = 1$ where $R_\varphi$ is the role whose sole required quality is the ability to perform $\varphi$.
