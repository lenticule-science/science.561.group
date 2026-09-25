---
type: text
status: in-progress
authors:
  - Claude Opus
title: Sociological extensions of the work theory
description: The five extensions below are each concrete resource-theories in Coecke-Fritz-Spekkens 2014's sense — interpretations of the abstract structure under particular sociological literatures.
---

# Sociological extensions of the work theory

> **Provenance.** The content below was extracted from `questions/what-is-the-theory-of-work.md` on 2026-05-16.
> The question file is reserved for the *theory of work* as a formal mathematical object (a structural identification, in the Howard-Lambek sense).
> The material here is *sociological specialization* — particular interpretations of the theory's parameters under specific empirical traditions.
> It belongs in the work theory's prose, not in the foundational question.
> Final placement to be decided.

The five extensions below are each *concrete resource-theories* in Coecke-Fritz-Spekkens 2014's sense — interpretations of the abstract structure under particular sociological literatures.
They are not part of the theory of work; they are *theories of work-in-context*.

## Multi-worker structure

The single-locus reading of "worker" is empirically inadequate.
Real work is divided, coordinated, and embedded in interdependence-structures that sociology has theorized for over a century.

**Thompson 1967, *Organizations in Action*** distinguishes three forms of interdependence: *pooled* (each worker contributes to a common pool independently, with mutual dependence only through aggregate demands on shared resources); *sequential* (output of worker $i$ is input of worker $i+1$, as in assembly-line production); *reciprocal* (outputs of $i$ and $j$ each serve as inputs to the other, as in R&D, design, or care-work).
Thompson argues that the coordination cost rises sharply across these three: pooled requires rules, sequential requires plans, reciprocal requires mutual adjustment.

**Mintzberg 1979, *The Structuring of Organizations*** decomposes coordination into five mechanisms: mutual adjustment (informal communication), direct supervision (one person coordinates others), standardization of work processes (procedures specify the doing), standardization of outputs (specifications fix what the doing must produce), standardization of skills (training pre-coordinates by establishing shared method).
Different organizations rely on different coordination-mechanism mixes.

**Marx, *Capital* I Ch. 12-14** distinguishes the *technical division of labor* (specialization of operations within a workshop or factory) from the *social division of labor* (specialization of producers across society).
The two have categorically different mechanisms: technical division is coordinated by the capitalist's plan and direct supervision; social division is coordinated by the market.

**Extension.** Replace $\mathbf{W}$ with $\mathbf{W} \to \mathbf{Agt}$, a fibration over a category $\mathbf{Agt}$ of agents (workers, teams, organizations).
Each fiber $\mathbf{W}_a$ is the world from agent $a$'s perspective; the global world $\mathbf{W}$ is the Grothendieck construction $\int_{\mathbf{Agt}} \mathbf{W}_{(-)}$.
Interdependence-types become categorical structures on $\mathbf{Agt}$:

- *Pooled* — $\mathbf{Agt}$ has only the trivial morphisms; workers act in parallel on a shared $\mathbf{W}$-state without inter-fiber maps.
- *Sequential* — $\mathbf{Agt}$ is a chain $a_1 \to a_2 \to \cdots \to a_n$; the fibration has Beck-Chevalley-style transfer along these morphisms (worker $i$'s output is worker $i+1$'s input).
- *Reciprocal* — $\mathbf{Agt}$ has cycles or symmetric structure; the fibration has reciprocal transfer-functors, with the coalgebraic capability-update accounting for feedback.

Mintzberg's five coordination mechanisms are subcategorical features: standardization-of-work-processes corresponds to a *terminal procedural object* in $\mathbf{W}_a$ that every work-act factors through; standardization-of-skills corresponds to a *capability-precondition* on $\mathcal{C}$ shared across agents; mutual-adjustment corresponds to a 2-morphism structure between workers' work-acts.
Marx's technical/social distinction becomes the choice of $\mathbf{Agt}$: a small $\mathbf{Agt}$ with shared $\mathbf{W}$-base is technical (within-firm); a large $\mathbf{Agt}$ with mediating exchange-functors is social (across-market).

## Labor-power, labor, and surplus

The labor-power/labor distinction (Marx, *Capital* I Ch. 6) is structural, not terminological.
Labor-power is the *commodity* a worker sells — the capacity to work for a contracted duration.
Labor is the *exercise* of that capacity in production.
The capitalist buys labor-power at its value (what it costs to reproduce the worker — wages, ultimately tracking the value of subsistence) and consumes it in producing commodities of value greater than labor-power's value.
The gap is *surplus value*: $s = v_{\mathrm{prod}} - v_{\mathrm{LP}}$ where $v_{\mathrm{prod}}$ is the value of what labor produced and $v_{\mathrm{LP}}$ is the value of labor-power (wages).

**Braverman 1974, *Labor and Monopoly Capital*** identifies the structural mechanism by which the gap is widened: the *separation of conception from execution*.
In craft labor, the worker conceives and executes; in capitalist labor, conception is concentrated in management (Taylorism's "scientific management" of work-design) and execution is deskilled.
The worker's labor-power becomes cheaper (deskilled workers cost less to reproduce) while output remains high (the manager's plan is high-value).
Surplus widens.

**Burawoy 1979, *Manufacturing Consent*** and **Edwards 1979, *Contested Terrain*** add: the structural compulsion to surplus-extraction generates *control regimes* — simple control (direct supervision), technical control (the machinery paces the worker), bureaucratic control (rules and rule-application).
Each regime has its own cost-structure on the labor process.

**Friedman 1977, *Industry and Labour*** distinguishes *direct control* (close supervision, deskilled tasks) from *responsible autonomy* (workers granted latitude, controlled through commitment rather than discipline) as two strategies for surplus extraction, with different implications for $\kappa$ and capability dynamics.

**Extension.** Augment $\mathcal{W}$ with:

1. **A valuation functor** $V: \mathbf{Work}_\mathcal{W} \to Q'$ into a *value-quantale* $Q'$ (typically $[0, \infty]$ representing exchange-value-equivalent). $V$ assigns to each work-act the value it produces in the relevant valuation regime (market price; planned-economy target; non-monetary value-system).

2. **A wage-functor** $W: \mathcal{C} \to Q'$ assigning to each capability-state the cost of its reproduction (the wage required to keep the worker available).

3. **The surplus-gap** for a work-act $f$ with capability $C$: $s(f, C) = V(f) - W(C) \cdot \tilde{\kappa}(C, f)/\bar{\kappa}_C$ where $\bar{\kappa}_C$ is the worker's total budget at capability $C$ — i.e., what fraction of the worker's capacity this act consumed, valued at the wage-cost-of-capacity.
  The surplus is the gap between what the act produced and what the act-of-producing cost in wage-equivalents.

4. **Braverman's separation-of-conception-from-execution** is a partition $\mathrm{Mor}(\mathbf{W}) = \mathrm{Mor}_{\mathrm{conc}} \sqcup \mathrm{Mor}_{\mathrm{exec}}$ together with a *capability-flow constraint*: capability accumulated in conception-acts (planning-skill) cannot be applied to execution-acts, and vice versa.
  Mathematically: the capability-update $U: \mathcal{C} \times \mathrm{Mor}(\mathbf{W}) \to \mathcal{C}$ decomposes $\mathcal{C} = \mathcal{C}_{\mathrm{conc}} \oplus \mathcal{C}_{\mathrm{exec}}$ as a direct sum, with $U$ restricted: $U(C_{\mathrm{exec}}, f_{\mathrm{conc}}) = C_{\mathrm{exec}}$ (executing-capability is not updated by conception-acts) and dually.

5. **Edwards-Burawoy control regimes** are choices of how $\tilde{\kappa}$ and $V$ interact with $\mathbf{Agt}$: simple control has a supervisor-agent whose work-acts are *meta-acts* shaping execution-agents' $\tilde{\kappa}$; technical control internalizes pacing into the world $\mathbf{W}$'s natural-history $T$ (machinery's pace becomes the world's baseline); bureaucratic control implements coordination through standardization-of-work-processes (Mintzberg) embedded as procedural objects.

## Articulation work and visibility

The work that makes other work possible is structurally distinct from the work it enables. **Strauss 1985, "Work and the Division of Labor", *Sociological Quarterly* 26(1)** introduced *articulation work* as the meshing, scheduling, repairing, and aligning that turns interdependent individual work-acts into a coherent collective accomplishment. **Star 1991, "The Sociology of the Invisible"** and **Star-Strauss 1999, "Layers of Silence, Arenas of Voice", *CSCW* 8** establish that articulation work is systematically *invisible* — not by accident, but as a structural feature of the systems that track work.
Recognition-as-work follows status, gender, race, and category-membership; the same activity counts as work for some and as natural-disposition or unpaid-helping for others.

**Suchman 1995, "Making Work Visible", *CACM* 38(9)** documents that what counts as work is contested: visibility is *political*, produced by struggle over what gets recognized, measured, and paid. **Daniels 1987, "Invisible Work", *Social Problems* 34** establishes the broader category: invisible work includes domestic labor, emotional labor, organizational citizenship, and infrastructure-maintenance — all systematically uncounted by formal accounting.

**Hochschild 1983, *The Managed Heart*** isolates *emotional labor* as the inducement-or-suppression of feeling in oneself to produce a particular feeling in another (the flight attendant's smile, the bill-collector's hostility).
Emotional labor is articulation-work on relationships rather than tasks, with its own cost-structure (Hochschild's "feeling-rules" and "surface vs. deep acting").

**Extension.** Equip $\mathcal{W}$ with:

1. **A visibility predicate** $\mathrm{vis}: \mathrm{Mor}(\widetilde{\mathbf{Work}}_\mathcal{W}) \to \mathbf{FOUR}$ assigning to each work-act a four-valued recognition-settlement: $\mathbf{t}$ (recognized by the formal accounting system), $\mathbf{f}$ (refused — explicitly not-work), $\bot$ (unsettled — not yet adjudicated), $\top$ (contested — recognized by some parties, refused by others).
  The $\mathbf{FOUR}$-valuation captures Strauss-Star's *political* visibility: visibility is not Boolean and not symmetric across observers.

2. **A 2-categorical articulation-structure.** Articulation-work is morphisms-on-morphisms: an articulation-act $\alpha: f \Rightarrow g$ is a 2-cell whose source and target are 1-morphisms $f, g \in \mathbf{Work}_\mathcal{W}$.
  Examples: scheduling ($\alpha$ specifies the order between $f$ and $g$); translation ($\alpha$ maps the output of $f$ into the input format of $g$); repair ($\alpha$ replaces a failed $f$ with a corrected $g$).
  Articulation-work has its own cost $\tilde{\kappa}_2: \mathrm{2\text{-}Mor} \to Q$, often much lower than the 1-morphisms it coordinates but extending across many 1-morphisms.

3. **The Suchman-Hochschild divergence-of-visibility.** Visibility is not a property of the work-act in isolation but of the *pair* (work-act, observer).
  Refine $\mathrm{vis}$ to $\mathrm{vis}: \mathrm{Agt} \times \mathrm{Mor}(\widetilde{\mathbf{Work}}_\mathcal{W}) \to \mathbf{FOUR}$ — each observing-agent has its own four-valued visibility-assessment of each work-act.
  The political-content of visibility is then captured: the formal accounting system (a privileged agent) has its visibility-function; affected workers may have different ones; struggle changes the system's function.

4. **Emotional labor** as a subcategory.
  The world $\mathbf{W}$ has objects that are *relational states* (a customer's affect; a patient's trust; a team's morale), and work-acts whose contribution is on these relational objects.
  Hochschild's surface-vs-deep acting distinguishes work-acts whose cost is *performance-only* (surface acting, $\kappa$ in attention-time only) from work-acts whose cost is *self-modification* (deep acting, $\kappa$ in capability-updates that change the worker's emotional state).

## Failure modes

Work-acts fail in structured ways.
The endeavor literature gives failure-openness; the safety-science and ethnomethodological literatures give the *typology* of failure modes.

**Reason 1990, *Human Error*** establishes a hierarchical taxonomy. *Slips* are right-intention, wrong-execution — the worker intended $f: A \to B$ but produced $f': A \to B'$ with $B' \neq B$. *Lapses* are right-intention, no-execution — the worker intended $f$ but produced nothing (omission). *Mistakes* are wrong-intention — the worker chose to perform $f: A \to B$ when the appropriate act was $g: A \to B'$ (planning-failure rather than execution-failure). *Violations* are deliberate-deviation — the worker performed $f$ knowing $g$ was correct, for reasons external to the work itself (Reason's *routine violations* arising from the gap between procedure and feasibility).

**Reason's Swiss-cheese model** of organizational accidents: failure passes through aligned holes in multiple defense layers.
Each defense is a barrier-morphism; each hole is a *partial-condition* under which the barrier admits the failure-trajectory.

**Perrow 1984, *Normal Accidents*** establishes that in systems with *interactive complexity* (many non-linear interactions between components) and *tight coupling* (failures propagate fast), accidents are *normal* — structurally inevitable, not the result of careless workers.
The mathematical implication: the failure-rate is determined by topological properties of the work-graph (its connectedness and reaction-speed), not just by individual work-act reliability.

**Vaughan 1996, *The Challenger Launch Decision*** establishes *normalization of deviance*: small deviations from the procedural baseline that produce no immediate failure get accepted as the new baseline, gradually shifting the operating-point of the system toward catastrophe.
The mathematical implication: capability-updates $U$ are not always toward higher skill — they can be toward higher acceptance of risk, with the system's overall failure-rate trending up while individual workers' subjective competence remains stable.

**Garfinkel 1967, *Studies in Ethnomethodology*** establishes the *constitutive* role of *breach and repair*: the methodical character of social action becomes visible when expectations are breached and members repair the breach.
Work is studded with micro-breaches and micro-repairs; the repair-work is itself work and is the visible-content of articulation work.

**Extension.** Equip morphisms in $\widetilde{\mathbf{Work}}_\mathcal{W}$ with a *failure-type*:

1. **Failure-typed morphisms.** For each $f: A \to B$ in $\widetilde{\mathbf{Work}}_\mathcal{W}$ define an *attempt-realization function* $\rho: \mathrm{Mor}(\widetilde{\mathbf{Work}}_\mathcal{W}) \to \mathbf{Realization}$ where $\mathbf{Realization}$ has elements $\{\mathrm{ok}, \mathrm{slip}(B'), \mathrm{lapse}, \mathrm{mistake}(g), \mathrm{violation}(g)\}$.
  The intended-target $B$ may not be the produced-target — for a slip, $\rho(f) = \mathrm{slip}(B')$ with $B'$ produced instead.
  For a lapse, $\rho(f) = \mathrm{lapse}$ with no target produced.
  Etc.

2. **Swiss-cheese composition.** A failure-trajectory through a chain of work-acts $f_1, f_2, \ldots, f_n$ is permitted by the chain iff each defense-layer $f_i$'s failure-type admits the trajectory at $f_i$'s position.
  Formally: failure-types compose as a sequence in a defense-lattice; the chain fails iff every layer's failure-type is "permits-this-failure."

3. **Perrow normality.** The structural failure-rate of $\widetilde{\mathbf{Work}}_\mathcal{W}$ is a function of (i) interactive-complexity (cardinality of branch-points in $\mathbf{W}$) and (ii) tight-coupling (the natural-history $T$'s speed — how quickly failures propagate before intervention can stop them).
  Perrow's normal-accident theorem: above threshold complexity-and-coupling, the failure-probability is bounded below by a positive constant regardless of any individual work-act's reliability.

4. **Vaughan's normalization-of-deviance.** The capability-update $U$ has a *risk-accommodation component*: each work-act that succeeds despite deviating from procedure increments the worker's risk-tolerance.
  The trajectory $(C_0, C_1, \ldots)$ of capability under normalization-of-deviance is monotone in risk-tolerance even when subjective skill is stable.

5. **Garfinkel breach-repair.** Failure-modes are not exclusively negative: lapses prompt repair-work; repair-work is the visible-content of articulation work.
  The 2-cells of the articulation-structure (above) include repair-2-cells whose source is a failed 1-morphism and whose target is its repaired-replacement.

## Reproductive labor

The work that maintains the conditions for production is structurally distinct from production-work. **Federici 2004, *Caliban and the Witch*** establishes that the capitalist mode of production *externalizes* reproductive labor — the work of reproducing labor-power day-to-day (cooking, cleaning, caring) and generationally (childbearing, child-raising) — by gendering it as "natural women's work" rather than recognizing it as work proper.
The witch-hunts, on Federici's account, were a productive-political project of separating women from the commons and disciplining them into unwaged reproductive labor.

**Dalla Costa and James 1972, *The Power of Women and the Subversion of the Community*** initiated the *Wages for Housework* tradition: the demand that reproductive labor be recognized and remunerated.
Their argument is structural: reproductive labor is *necessary* for capitalist production (without it, there is no labor-power to sell tomorrow) but is *excluded* from the formal labor relation.
The exclusion is the surplus-extraction mechanism at the household-level.

**Fortunati 1995, *The Arcane of Reproduction*** develops the formal structure: reproductive labor produces *use-values* (a fed child, a cleaned home, a comforted partner) that the worker-of-tomorrow consumes as *means of reproduction* of labor-power.
The labor process at the household-level is structurally identical to the labor process at the workplace, with the gendering replacing the wage as the surplus-extraction mechanism.

**Glenn 2010, *Forced to Care*** establishes the *racial* structure of reproductive labor: in the U.S., reproductive labor has been displaced down a racial hierarchy — middle-class white women's reproductive labor performed by women of color, often immigrants, under conditions of further exclusion from labor-protection.
Reproductive labor is not just gendered; it is racialized-and-classed.

**Folbre 2001, *The Invisible Heart*** extends the analysis to *care economics*: the work of caring for dependents (children, elderly, ill) generates positive externalities that markets systematically undervalue.
Care work has the structural feature that *its quality depends on its non-instrumentalization* — a paid carer can be efficient, but the care itself is qualitatively different from love-driven care, and the qualitative difference matters for the cared-for.

**Extension.** Equip $\mathcal{W}$ with:

1. **A maintenance-vs-transformation partition** on morphisms.
  A morphism $f: A \to B$ is *transformative* iff $B$ is in a different equivalence-class under the world's salience-partition than $A$ (the world changes in a way that matters to the salient-categorization).
  A morphism is *maintenance* iff $B$ and $A$ are in the same equivalence-class — the salient state is preserved against $T$'s drift.
  The salience-partition is set by the recognizing-system (consistent with Strauss-Star: what counts as "the same state" is politically determined).

2. **Reproductive-labor as maintenance against $T$.** Reproductive labor is the subcategory of maintenance morphisms $f: A \to A$ where $T(A) \neq A$.
  The worker holds $A$ against decay.
  Without this work, $T$ would carry $A$ to $T(A)$, an unmaintained state.

3. **The externalization gap.** Combine with the visibility-predicate (Articulation extension): reproductive labor is the subset of maintenance morphisms with $\mathrm{vis}(\text{formal accounting}, f) = \mathbf{f}$ — refused-as-work by the formal system.
  The "exclusion from the formal labor relation" Federici names is exactly this combination: maintenance morphism + refused-visibility.

4. **The reproduction-dependency.** Production-work is *causally* dependent on reproduction-work in the structural sense: every production-trajectory $(C_0, \to C_1 \to \cdots)$ presupposes reproductive maintenance-trajectories on the worker's capability-state (the worker eats, sleeps, recovers — without these, $C_{n+1}$ would not be available for the next production-work).
  Formally: the production-fibration over $\mathbf{Agt}$ is *internally* nested in a reproduction-base — the world $\mathbf{W}_{\mathrm{prod}}$ is fibered over $\mathbf{W}_{\mathrm{repro}}$, with each production-state requiring a reproduction-state below it.

5. **Glenn's racial/classed displacement.** The reproductive-labor partition is itself partitioned by who-does-which-piece.
  Formally: $\mathrm{Mor}_{\mathrm{repro}} = \bigsqcup_{a \in \mathbf{Agt}_{\mathrm{repro}}} \mathrm{Mor}_{\mathrm{repro}, a}$ where $\mathbf{Agt}_{\mathrm{repro}}$ is the structured set of reproductive-agents with internal hierarchy.
  The displacement-down-hierarchy is a fact about which sub-agent gets which sub-morphism: the most-recognized agents off-load the least-recognized reproductive work to least-recognized agents.

6. **Folbre's non-instrumentalization-quality.** Care work has the structural feature that *its valuation under $V$ depends on its motivation*: instrumental care produces less of the care-specific value than non-instrumental care.
  Formally: $V_{\mathrm{care}}(f, \text{motivation})$ is a function of both the work-act and the *intentional structure* behind it (Chisholm-Hornsby endeavor-structure).
  This makes care-work resistant to market-pricing — the very act of pricing it changes its value.

## Integration of the extensions

The five extensions are each refinements of the bare $\mathcal{W}$ but they share substructure and constrain each other.
The integrated theory consolidates them.

**Definition.** An *integrated theory of work* is a tuple $$\mathcal{W}^* = (\mathbf{Agt}, \pi_{\mathrm{prod}}, \pi_{\mathrm{repro}}, T, Q, \kappa, \mathcal{C}, \tilde\kappa, U, V, W, \mathrm{vis}, \rho)$$ where:

1. **Agent base.** $\mathbf{Agt}$ is a small category of agents with distinguished full subcategories $\mathbf{Agt}_{\mathrm{prod}}$ (production-workers) and $\mathbf{Agt}_{\mathrm{repro}}$ (reproductive-workers); typically overlapping or nested, never disjoint by Federici's argument that production-workers are *also* reproductive-workers off the clock.

2. **Dual fibrations.** Two Grothendieck fibrations: $\pi_{\mathrm{prod}}: \mathbf{W}_{\mathrm{prod}} \to \mathbf{Agt}_{\mathrm{prod}}$ and $\pi_{\mathrm{repro}}: \mathbf{W}_{\mathrm{repro}} \to \mathbf{Agt}_{\mathrm{repro}}$; with a *reproductive-dependency morphism* $\rho_{\mathrm{dep}}: \mathbf{W}_{\mathrm{prod}} \to \mathbf{W}_{\mathrm{repro}}$ in $\mathbf{Cat}/\mathbf{Agt}$ saying: production-state requires a reproduction-state as precondition (well-fed, well-rested, intact-relations workers).

3. **Joint natural-history.** $T: \mathbf{W}_{\mathrm{prod}} \sqcup \mathbf{W}_{\mathrm{repro}} \to \mathbf{W}_{\mathrm{prod}} \sqcup \mathbf{W}_{\mathrm{repro}}$ — the world's drift includes both production-decay (wear, degradation, forgetting) and reproduction-decay (fatigue, fraying, crumbling infrastructure).

4. **Cost-quantale with conception/execution decomposition.** $Q = Q_{\mathrm{conc}} \oplus Q_{\mathrm{exec}}$.

5. **Stratified capability.** $\mathcal{C} = \mathcal{C}_{\mathrm{conc}} \oplus \mathcal{C}_{\mathrm{exec}} \oplus \mathcal{C}_{\mathrm{affect}}$ — conception-skill, execution-skill, and affect-capability (Hochschild's autonomous-affect, the resource emotional labor draws on).

6. **Cost-assignment.** $\kappa$ respects the conception/execution partition and $T$-freeness; $\tilde\kappa: \mathcal{C} \times \mathrm{Mor} \to Q$ depends on the relevant capability-component for each act-type. $U$ updates the corresponding component (Vaughan's risk-tolerance is a sub-coordinate of $\mathcal{C}_{\mathrm{exec}}$).

7. **Valuation, wage, visibility, realization.** $V: \mathbf{Work}_{\mathcal{W}^*} \to Q'$ (exchange-value or non-monetary value); $W: \mathcal{C} \to Q'$ (reproduction-cost of capability); $\mathrm{vis}: \mathbf{Agt} \times \mathrm{Mor} \to \mathbf{FOUR}$ (observer-relative recognition); $\rho: \mathrm{Mor} \to \mathbf{Realization}$ (Reason taxonomy).

The integrated category $\mathbf{Work}_{\mathcal{W}^*}$ has objects $(A, C, a)$ with $A \in \mathbf{W}_{\mathrm{prod}} \sqcup \mathbf{W}_{\mathrm{repro}}$, $C \in \mathcal{C}$, $a \in \mathbf{Agt}$; morphisms carry realization-type, observer-relative visibility, capability-update, and value/wage/surplus-data.

**Proposition (well-defined integration).** *$\mathbf{Work}_{\mathcal{W}^*}$ is a well-defined category.
Each of the five forgetful functors $\mathbf{Work}_{\mathcal{W}^*} \to \mathbf{Work}_{\mathrm{ext}_i}$ recovers the corresponding individual extension.*

*Proof.* Composition is well-defined because each piece of data composes independently: agent-fibration via Grothendieck-construction composition, capability-update by $U$-iteration, visibility per-observer, realization by Swiss-cheese composition, value/wage/cost additively.
Forgetful functors project out the data each extension does not use. $\square$

## Theorems with empirical content

The integrated theory makes the established findings of sociology of work into theorems.
The four below illustrate; many more are recoverable.

**Theorem (Perrow normal-accident lower bound).** *Let $\mathcal{W}^*$ have interactive-complexity $\chi(\mathbf{W}) := \sup_A |\{f: A \to B\}|$ (maximal branching at any state) and tight-coupling $\tau(T)$ (inverse of the average time-window for worker intervention before failure propagation).
For $\chi > \chi_0$ and $\tau > \tau_0$ (Perrow's thresholds), there exists $p_0 > 0$ depending only on $(\chi, \tau)$ such that for any work-chain $f_1, \ldots, f_n$, the probability of $\rho(f_1 \circ \cdots \circ f_n) \neq \mathrm{ok}$ is bounded below by $1 - (1 - p_0)^n$.*

*Justification.* Perrow 1984.
Swiss-cheese composition admits failure-trajectories whose hole-alignment is no longer rare under high $(\chi, \tau)$: interactive complexity multiplies the failure-interactions; tight coupling means worker-interventions arrive too late to repair.
The bound is on the *system*, not the worker.
Empirical content: in normal-accident systems, training and individual diligence cannot reduce failure below $p_0$ — what reduces it is reducing $\chi$ or $\tau$.

**Theorem (Hochschild emotional-labor exhaustion).** *Deep-acting emotional labor has capability-update $U_{\mathrm{affect}}(C^{\mathrm{affect}}, f_{\mathrm{deep}}) = C^{\mathrm{affect}} - \delta$ for some $\delta > 0$.
The trajectory $(C_n)$ under sustained deep-acting converges monotonically to a fixed-point $C_\infty$ with $C_\infty^{\mathrm{affect}} = 0$.
Workers at $C_\infty$ experience burnout — they can perform the emotional labor only through surface-acting or not at all.*

*Justification.* Hochschild 1983.
Deep acting recruits autonomous-affect; the recruitment depletes it.
Bounded-below-by-zero monotone decrease converges.
Empirical content: emotional-labor regimes requiring sustained deep acting (flight attendants, care-workers, teachers) systematically produce burnout as a structural consequence, not as a defect of individual workers.

**Theorem (Folbre care-pricing paradox).** *Suppose care-work has $V_{\mathrm{care}}(f, \mathrm{non\text{-}instr}) > V_{\mathrm{care}}(f, \mathrm{instr})$ — non-instrumentalized care produces more care-specific value than instrumentalized care.
Let $\mu: V \mapsto V_{\mathrm{market}}$ be market-pricing.
Then $\mu$ shifts the motivation-distribution toward instrumental and strictly reduces aggregate $V_{\mathrm{care}}$.
Marketization of care-work produces a Pareto-inferior valuation outcome relative to non-market provision.*

*Justification.* Folbre 2001 and care-economics literature.
The market-pricing operation shifts motivation toward instrumental (workers respond to pay-incentives; the structure of market-priced care undermines the conditions of non-instrumentalization).
Under the stated valuation-gap, this strictly reduces output-value.
Empirical content: some care-work cannot be efficiently marketized without losing what makes it care-work in the first place.
Empirical expression: paid care is systematically lower-quality than unpaid kin-care, controlled for hours and resources.

**Theorem (Marx-Braverman surplus-and-deskilling).** *Under the Braverman capability-flow constraint, sustained deskilling — defined as the regime where $U$ acts only on $\mathcal{C}_{\mathrm{exec}}$ — produces three effects: (i) $W(C)$ decreases over time as $\mathcal{C}$ becomes execution-heavy and conception-light, since conception is the high-value capability; (ii) the surplus-gap $s(f, C) = V(f) - W(C) \cdot \tilde{\kappa}(C, f)/\bar\kappa_C$ widens, since $V$ tracks the management-determined plan (conception-side) while $W$ tracks the deskilled wage (execution-side); (iii) the worker's capability-trajectory loses its conception-component, so future work-acts requiring conception become unavailable — deskilling is structurally irreversible from the worker's side.*

*Justification.* Braverman 1974.
(i)-(iii) are theorems about $\mathcal{W}^*$ under the stated regime.
Empirical content: Braverman's central thesis — that capitalist labor-processes structurally push toward deskilling and surplus-extraction — is recoverable as a feature of the integrated theory's dynamics.

Other recoverable theorems with similar status: Burawoy 1979's manufactured-consent (a control regime with $V/\kappa$ structure producing high surplus while workers experience effort as voluntary); Edwards 1979's three control regimes (simple/technical/bureaucratic as distinct $(\mathbf{Agt}, T, \tilde\kappa)$-configurations); Star 1991's politics-of-visibility (the observer-relative $\mathrm{vis}$ has equilibria favoring privileged observers); Federici 2004's primitive-accumulation (a historical $T$-shift moving morphisms from $\mathbf{W}_{\mathrm{prod}}$ to $\mathbf{W}_{\mathrm{repro}}$ while shifting their visibility to $\mathbf{f}$).

## The relationship to governance

Work and governance share much structure (agents, costs, world-states-and-transitions, capability-accumulation) but are not identical.
The relationship is articulated by a *governance-fragment* of $\mathbf{Work}_{\mathcal{W}^*}$ for a specific instantiation.

**Definition.** The *governance fragment* $\mathbf{Work}^{\mathrm{gov}}_{\mathcal{W}^*} \subseteq \mathbf{Work}_{\mathcal{W}^*}$ is the subcategory of work-acts $f: A \to B$ satisfying:

1. The source $A$ and target $B$ are *collective-states* — states whose constituents include a collective as a distinguished sort.

2. The act $f$ simultaneously realizes the three governance primitives (attribution to a collective, binding of at least one member, becoming of the collective's state) — see the parallel question `what-is-the-theory-of-governance.md` for the formal statement.

3. The cost $\kappa(f)$ includes a *legitimacy-component* in $Q$ — the act expends legitimacy of the actor, recoverable only by collective acknowledgment.

The governance-fragment is closed under composition and contains identities only when standing-still-on-the-collective is itself a legitimacy-expending act.

**Proposition (governance-work embedding).** *There is a faithful functor $E: \mathbf{Gov} \to \mathbf{Work}^{\mathrm{gov}}_{\mathcal{W}^*_{\mathrm{gov}}}$ for a specific instantiation $\mathcal{W}^*_{\mathrm{gov}}$ — taking $\mathbf{W}^{\mathrm{gov}}$ as the category of collective-states, $T$ as collective-drift-without-governance, $Q$ as a legitimacy-quantale, $\kappa$ as the legitimacy-cost of governance-acts, $\mathcal{C}$ as political-capability (Weber's three legitimacy-types as components). $E$ preserves the three governance primitives on-the-nose.*

*Proof sketch.* Construct $\mathcal{W}^*_{\mathrm{gov}}$ as specified.
Each governance morphism in $\mathbf{Gov}$ has a unique image satisfying the three primitives in the constructed work-theoretic frame.
Faithfulness follows because the governance primitives are preserved by $E$ on-the-nose. $\square$

This makes governance a *kind* of work — work whose output-domain is collective-states and whose cost includes legitimacy — without reducing governance to work.
The reverse embedding $\mathbf{Work} \to \mathbf{Gov}$ does not exist: there is more work than governance, and most work does not satisfy the three governance primitives.

The corollary for the corpus's organization: the work-domain contains the governance-domain as a *subcategory* of one specific instantiation of $\mathcal{W}^*$ — not as a subset of phenomena, but as a structurally-distinguished sub-theory.
Other instantiations of $\mathcal{W}^*$ (factory work, care-work, artistic-work, scientific-work) have their own sub-categories with different sort-structures and cost-quantales, none reducible to the others.

## Provenance of the extensions

External authors cited or named in source: Thompson 1967, Mintzberg 1979, Marx *Capital* I Ch. 6/12-14, Braverman 1974, Burawoy 1979, Edwards 1979, Friedman 1977, Strauss 1985, Star 1991, Star-Strauss 1999, Suchman 1995, Daniels 1987, Hochschild 1983, Reason 1990, Perrow 1984, Vaughan 1996, Garfinkel 1967, Federici 2004, Dalla Costa-James 1972, Fortunati 1995, Glenn 2010, Folbre 2001, Weber.
