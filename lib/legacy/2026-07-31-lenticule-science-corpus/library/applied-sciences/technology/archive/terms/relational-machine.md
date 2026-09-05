---
id: relational-machine
description: "The RelationalMachine is the operational instance of a relational universe R = Sh(T,J): the history site running its fiber nuclear doctrine H: T^op → HA_nucl, with the joint projection π_t = σ_t ∘ Δ_t settling propositions at each history and global sections of H* emitting newly-fixed output."
implements: IndexedAutomaton
date-modified: 2026-03-20
params:
  history-site: relational-history-site
  fiber-doctrine: relational-history-fiber-nuclear-heyting-doctrine
output: relational-universe-fixed-proposition
ast:
  relational-history-site:
    - relational-history-step-commutation
    - relational-history-site-commutation-topology-grothendieck-coverage-j
  relational-history-fiber-nuclear-heyting-doctrine:
    - relational-history-site
    - relational-history-fiber-saturating-nucleus
    - relational-history-fiber-transferring-nucleus
  relational-history-fiber-proposition-joint-closure-pi-projection-fixed-point-image:
    - relational-history-fiber-nuclear-heyting-doctrine
  relational-universe-fixed-proposition:
    - relational-history-fiber-proposition-joint-closure-pi-projection-fixed-point-image
    - relational-history-site
---

# Relational Machine

## What it is

The RelationalMachine is an [IndexedAutomaton](indexed-automaton.md) whose state is an instance of the relational universe $R = \mathbf{Sh}(T,J)$: the [history site](../math/relational-history-site.md) $(T,J)$ running its [fiber nuclear doctrine](../math/relational-history-fiber-nuclear-heyting-doctrine.md) $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$.

The machine's output at each step is the global sections newly settled: $\Gamma(H^*_{t'}) \setminus \Gamma(H^*_t)$ — the [fixed propositions](../math/relational-universe-fixed-proposition.md) in $H^* \hookrightarrow H$ that appear for the first time after advancing history from $t$ to $t'$.

The four mathematical structures that constitute a RelationalMachine — one per component — are named constructs in the math, not descriptions of informal structure:

- **[RelationalHistorySite](../math/relational-history-site.md) $(T,J)$**: the thin poset-category $T = \mathbb{M}(\Sigma, I)$ (congruence classes of $\Sigma^*$ under the independence relation $I$, ordered by prefix) equipped with the [Grothendieck commutation topology](../math/relational-history-site-commutation-topology-grothendieck-coverage-j.md) $J$ (covering sieves = commutation partitions). This is not just a monoid: $J$ is what determines the sheaf condition on $H$ and therefore determines [RelationalHistoryFiberSaturatingNucleus](../math/relational-history-fiber-saturating-nucleus.md) $\sigma_t$.
- **[RelationalHistoryFiberNuclearHeytingDoctrine](../math/relational-history-fiber-nuclear-heyting-doctrine.md) $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$**: the presheaf assigning to each history $t$ a fiber nuclear square $(H_t, \sigma_t, \Delta_t)$ — a [finite Heyting algebra](../math/relational-history-fiber-heyting-algebra.md) with [RelationalHistoryFiberSaturatingNucleus](../math/relational-history-fiber-saturating-nucleus.md) $\sigma_t$ (the sheafification projection over $J$) and [RelationalHistoryFiberTransferringNucleus](../math/relational-history-fiber-transferring-nucleus.md) $\Delta_t$ (the reflection onto $\bigcap_{s \perp t} \mathrm{image}(H(i_{s,t}))$), commuting: $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$. These nuclei are NOT separate params — they are structure of the doctrine functor itself, packed into the $\mathbf{HA_{nucl}}$ target.
- **[Joint projection](../math/relational-history-fiber-proposition-joint-closure-pi-projection-fixed-point-image.md) $\pi_t = \sigma_t \circ \Delta_t$**: the canonical retraction $H_t \twoheadrightarrow H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$, which is itself a nucleus because $\sigma_t$ and $\Delta_t$ commute. $\pi_t(a)$ is the [joint closure](../math/relational-history-fiber-proposition-joint-closure-pi-projection-fixed-point-image.md) of $a$ — the minimum element of $H^*_t$ above $a$, equivalently $\mathrm{Saturate}(\mathrm{Transfer}(a))$ in [RelationalHistoryFiberDoctrineLanguage](../math/relational-history-fiber-doctrine-language.md). Commutativity is required here: without it the composite need not be a nucleus and the four [nuclear square positions](../math/relational-history-fiber-nuclear-square-two-nuclei-two-axes-commutation-requirement.md) do not cohere.
- **Global sections $\Gamma(H^*)$**: [fixed propositions](../math/relational-universe-fixed-proposition.md) in $R = \mathbf{Sh}(T,J)$ — sections $\mathbf{1} \to H^*$ of the fixed subobject $H^* \hookrightarrow H$, equivalently opens of the [invariant locale Phase](../math/relational-universe-invariant-locale-internal-fixed-sub-heyting-algebra-frame.md). The machine emits $\Gamma(H^*_{t'}) \setminus \Gamma(H^*_t)$: the propositions that crossed the threshold from unsettled to doubly-stable between two history steps.

The machine implements this structure. It MUST be organized into four components, one per mathematical role above. See [relational-machine-math-diagram](relational-machine-math-diagram.md) for the full set-level class diagram and [relational-machine-c4-diagram](relational-machine-c4-diagram.md) for the C4 architecture view.

---

## Four-component architecture

### Input Boundary

**Mathematical role:** $(T, J)$ — the history site, presented by the step set $\Sigma$ with independence relation $I$, carrying the Grothendieck commutation topology.

The input boundary is constituted by three distinct components, each named:

- **[RelationalMachinePort](relational-machine-port.md)** — the step set $(\Sigma, I)$: the typed vocabulary of inputs the machine accepts and the commutation relation that makes order of independent steps irrelevant.
- **[RelationalMachineInterface](relational-machine-interface.md)** — the exposed boundary through which outside agents submit steps; the foot of the patch site inclusion where external content enters.
- **[RelationalMachineSteppingMap](relational-machine-stepping-map.md)** — the family of maps $\gamma_t : X(t) \to X(s \star t)$ that advance the carrier's state when a step $s$ is received.

The full interaction type — what the machine accepts and what it returns — is the [RelationalMachineArena](relational-machine-arena.md).

### DataStore

**Mathematical role:** $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ — the fiber nuclear doctrine over the history site.

The DataStore carries the [RelationalHistoryFiberNuclearHeytingDoctrine](../math/relational-history-fiber-nuclear-heyting-doctrine.md) across all histories. At each $t$ it holds the full fiber $H_t$ and the settled sub-algebra $H^*_t = \mathrm{Im}(\pi_t)$. It exposes restriction maps $H(f) : H_{t'} \to H_t$ for each extension $f : t \to t'$ in $T$. Both nuclei $\sigma_t$ and $\Delta_t$ are structure of $H$ — they are not held separately.

### Engine

**Mathematical role:** $\pi_t = \sigma_t \circ \Delta_t$ — the [joint projection](../math/relational-history-fiber-proposition-joint-closure-pi-projection-fixed-point-image.md) retraction.

The Engine applies the joint projection to $H_t$ to produce $H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$. The [commutativity](../math/relational-history-fiber-nucleus-commutation.md) $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ is required: it is what makes $\pi_t$ itself a nucleus (not just a composite of nuclei), so that $H^*_t$ has a nucleus reflection from $H_t$ rather than merely existing as a set-theoretic intersection. Without commutativity the [nuclear square](../math/relational-history-fiber-nuclear-square-two-nuclei-two-axes-commutation-requirement.md) does not cohere and there is no Engine.

The Engine runs Transfer-then-Saturate: the canonical term order in [RelationalHistoryFiberDoctrineLanguage](../math/relational-history-fiber-doctrine-language.md) is $\mathrm{Saturate}(\mathrm{Transfer}(M))$, encoding the temporal direction — settle $M$ against what all extensions share first, then close against what accumulated history forces.

### Observation Layer

**Mathematical role:** $\Gamma(H^*)$ — global sections of the fixed subsheaf in $R = \mathbf{Sh}(T,J)$.

The Observation Layer computes sections $\mathbf{1} \to H^*$ of the [fixed subobject](../math/relational-universe-fixed-heyting-algebra.md) $H^* \hookrightarrow H$ in $R$. A global section is a compatible family $(a_t)_{t \in T}$ with $a_t \in H^*_t$ and $H(f)(a_{t'}) = a_t$ for all extensions $f : t \to t'$ — equivalently, an open of the [invariant locale Phase](../math/relational-universe-invariant-locale-internal-fixed-sub-heyting-algebra-frame.md). The machine's output at each step is $\Gamma(H^*_{t'}) \setminus \Gamma(H^*_t)$: the fixed propositions newly settled since the previous step.

---

## Correspondence table

| Math object | Component | Role |
|---|---|---|
| $(\Sigma, I)$ — step set with independence | [RelationalMachinePort](relational-machine-port.md) | Names the typed input vocabulary |
| $(T, J)$ — history site | Input Boundary | Base site for all sheaf constructions |
| $\iota : U \to T$ — patch inclusion foot | [RelationalMachineInterface](relational-machine-interface.md) | Exposed boundary where steps enter |
| $\gamma_t : X(t) \to X(s \star t)$ — coalgebra map | [RelationalMachineSteppingMap](relational-machine-stepping-map.md) | Advances carrier state by one step |
| $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ — fiber doctrine | DataStore | Carries fibers, restriction maps, both nuclei |
| $\pi_t = \sigma_t \circ \Delta_t$ — joint projection | Engine | Retracts $H_t$ onto $H^*_t$; requires commutativity |
| $\Gamma(H^*)$ — global sections of $H^*$ in $R$ | Observation Layer | Emits newly settled fixed propositions |

---

## Peer connection

Two relational machines MAY be connected by a structure-preserving map between their fiber systems — conjecturally a geometric morphism. Connected machines could synchronize histories and share settled sections.

The connection is unformalized. The correct category of morphisms between fiber Heyting algebra systems over different monoids remains open.

---

## Relationship to the two towers

The relational machine implements the **depth-filtration tower**: building $R$ within a fixed history monoid $M$. It does NOT implement the **hyperverse tower** (iterating $U_H$ across universes to build $\mathcal{H}$). These MUST NOT be conflated.

---

## Open questions

- What is the right category of morphisms between relational machines?
- How does the independence relation $I$ propagate across a peer connection?
- Does the Engine run one composite pass or iterate each nucleus to fixpoint? Convergence behavior may differ.
- What does an implementation of the hyperverse tower look like as a machine?
