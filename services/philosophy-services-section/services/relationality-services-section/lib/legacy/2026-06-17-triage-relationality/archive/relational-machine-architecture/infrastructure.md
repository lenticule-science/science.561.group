---
constituted-by:
  - substrate-category
  - practice
  - enabling-projection
  - position-measurement
  - convergence-operator
  - installed-base-order
supports: practice
priority-over: practice
component-of: relational-universe
fiber-of: relational-universe
base: relational-history-site
specialization: entity
date-created: 2026-03-19
date-modified: 2026-03-19
---

# Infrastructure

## Formal definition

An **Infrastructure** is a sextuple $\mathcal{I} = (S, P, \delta, \pi, \rho, \preceq)$:

$$\mathcal{I} = (S,\; P,\; \delta : S \to M,\; \pi : P \to S,\; \rho : S \to S,\; \preceq\; \text{on } S)$$

where:
- $S$ is the **substrate** — the base category or site; the set of infrastructure objects (histories, servers, contexts, earthworks)
- $P$ is the **supported practice** — the family of objects that depends on $S$; what $S$ enables (fibers, applications, domain logic, trains)
- $\delta : S \to M$ is the **position measurement** — a function from substrate objects to a measurement space $M$ quantifying where in the substrate each object sits (distance in the principal cycle, configuration state, obligation gap, network capacity)
- $\pi : P \to S$ is the **enabling projection** — every supported object lives over a substrate object; $\pi(p)$ is the substrate that $p$ runs on
- $\rho : S \to S$ is the **convergence operator** — the operation that sends any substrate state to its canonical/reduced/desired form; $\rho \circ \rho = \rho$ (idempotent)
- $\preceq$ is the **installed-base order** on $S$ — a partial order recording that $s \preceq s'$ means $s'$ can only exist given $s$; the substrate at any moment is constrained by the substrate at prior moments

**Seven invariants.** $\mathcal{I}$ is an infrastructure iff it satisfies:

1. **Enabling**: for every $p \in P$, $\pi(p) \in S$ and $p$ cannot be defined without $\pi(p)$ existing. $S$ is a necessary condition for $P$.
2. **Substrate priority**: $S$ is defined independently of $P$. The definition of any $s \in S$ does not reference $P$.
3. **Transparency in use**: when $\rho(s) = s$ (substrate at a fixed point), the elements of $\pi^{-1}(s)$ are accessible and agents attend to $P$, not to $S$. The substrate is invisible.
4. **Visibility upon breakdown**: when $\rho(s) \neq s$ (substrate not at fixed point), the fibers $\pi^{-1}(s)$ may be inaccessible or inconsistent, and agents must attend to $S$ directly.
5. **Installed-base constraint**: for $s \preceq s'$, the fiber $\pi^{-1}(s')$ restricts coherently to $\pi^{-1}(s)$. New substrate states are compatible with old ones; history is not retracted.
6. **Substitutability**: two substrates $S, S'$ are interchangeable for practice $P$ iff there exist projections $\pi : P \to S$ and $\pi' : P \to S'$ and an equivalence $\phi : S \to S'$ with $\pi' = \phi \circ \pi$. $P$ cannot distinguish $S$ from $S'$ through the interface $\pi$.
7. **Dependency direction**: the only morphisms between $P$ and $S$ are those of $\pi$ (going from $P$ toward $S$). There are no morphisms from $S$ into $P$. Infrastructure never depends on what it supports.

## In this system

The relational universe instantiates the infrastructure tuple as:

$$\mathcal{I}_{\mathrm{RH}} = (T,\; H,\; \delta_{\mathrm{gap}},\; p,\; \pi_t,\; \leq_T)$$

where:
- $S = T$ — the **history site** $(T, J)$; the base category whose objects are histories and whose morphisms are prefix extensions $s \leq t$
- $P = H : T^{\mathrm{op}} \to \mathbf{HA}_{\mathrm{nucl}}$ — the **fiber doctrine**; the sheaf of nuclear Heyting algebras over $T$; the practice the infrastructure supports
- $\delta_{\mathrm{gap}} : T \to H_t \times H_t$ — the **obligation gap** at each history: $\delta(t) = (\sigma_t(a) - a,\; \Delta_t(a) - a)$ for a representative $a \in H_t$; measures how far the current fiber is from $H^*_t$
- $p : H \to T$ — the **stalk projection**; sends each fiber $H_t$ to its base history $t$; the enabling projection of the sheaf fibration
- $\pi_t = \sigma_t \circ \Delta_t : H_t \to H^*_t$ — the **joint projection**; the convergence operator sending any element to the doubly-quiescent fixed fiber; $\pi_t \circ \pi_t = \pi_t$
- $\leq_T$ — the **prefix order** on $T$; $s \leq t$ iff $s$ is a prefix of $t$; the installed-base order: the restriction maps $H_t \to H_s$ for $s \leq t$ carry old observations forward intact

**Transparency / visibility** in $\mathcal{I}_{\mathrm{RH}}$: when $\delta(t) = (0, 0)$ — when the fiber at $t$ is fully settled — agents work with elements of $H^*_t$ without attending to the site. The history site is transparent. When a covering condition fails or a restriction map is missing — when the sheaf axiom is violated — the site becomes visible and must be repaired before the fiber can be used.

## In the FARS

The [FlatfileAgentialResourceSystemLocale](flatfile-agential-resource-system-locale.md) instantiates a second infrastructure layer above $\mathcal{I}_{\mathrm{RH}}$:

$$\mathcal{I}_{\mathrm{FARS}} = (\mathrm{Locale},\; \mathrm{Skills},\; \delta_{\mathrm{plan}},\; \pi_{\mathrm{scope}},\; \rho_{\mathrm{runbook}},\; \preceq_{\mathrm{git}})$$

where:
- $S = \mathrm{Locale}$ — the locale structure: (AGENTS, SOUL, MEMORY, INBOX, PLANS, IDEAS, skills/); the substrate for all agent work
- $P = \mathrm{Skills}$ — the skill library; the morphisms $f : A \to B$ agents invoke; the practice the locale supports
- $\delta_{\mathrm{plan}}$ — the PLANS.md state: which tasks are open, their ordering, their dependency gaps
- $\pi_{\mathrm{scope}}$ — the scoping projection: every skill is scoped to the locale it belongs to
- $\rho_{\mathrm{runbook}}$ — the runbook convergence: applying a runbook to the locale's state converges to the desired output (idempotent when all steps are Process-kind)
- $\preceq_{\mathrm{git}}$ — the git commit order; every state of the locale is a commit; commits are ordered by ancestry; the installed base is the git history

## The conceptual gradient

The research tradition gives six framings of infrastructure, each contributing a distinct formal property:

| Tradition | Formal contribution |
|---|---|
| **Number theory** (Scheidler-Stein) | Near-group with distance function $\delta$; quasi-additive composition; $\rho$ = ideal reduction |
| **IaC / systems** | Dependency DAG; idempotent Apply; desired-state semantics; drift = $\delta \neq 0$ |
| **Software architecture** | Dependency direction invariant (7); substitutability via fixed interfaces (6) |
| **Category theory** | $\pi : P \to S$ is a Grothendieck fibration; cartesian liftings implement substitutability |
| **STS (Star & Ruhleder)** | Invariants 3, 4, 5: transparency, visibility-upon-breakdown, installed base |
| **Civil engineering** | Network structure on $S$; long asset lifetime; public goods; enabling-without-representing |

The irreducible tension: infrastructure is **ontologically prior** (must exist before the practice) and **functionally posterior** (is identified and classified by the practice it supports). Roads are roads because people travel; contexts are contexts because types inhabit them; the history site is infrastructure because the fiber doctrine lives over it. Infrastructure is the enabling background shaped by what it enables.

## Open questions

- Whether the near-group structure of number-theoretic infrastructure (quasi-additivity of $\delta$, bounded deviation from group laws) has a correlate in $\mathcal{I}_{\mathrm{RH}}$ — whether the obligation gap $\delta_{\mathrm{gap}}$ satisfies a quasi-additivity condition across histories.
- Whether $\mathcal{I}_{\mathrm{FARS}}$ is a morphism of infrastructures over $\mathcal{I}_{\mathrm{RH}}$ — a map of tuples $(S_{\mathrm{FARS}}, P_{\mathrm{FARS}}, \ldots) \to (T, H, \ldots)$ commuting with $\pi$ and $\rho$.
- What the correct notion of **infrastructure morphism** is: a map $\phi : \mathcal{I} \to \mathcal{I}'$ should preserve the enabling projection and commute with the convergence operator.
