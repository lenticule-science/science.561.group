---
name: theory-of-flatfile-agentic-drone-resource-system-swarms-may-2026
description: Survey of prior thought, 561-native and informant, on the formalization of swarms of flatfile agentic drone resource systems — what a FARS-shaped polity contributes that conventional multi-agent and swarm-intelligence framings lack, and where the polity's own predicated-drone-swarm sub-theory already takes the synthesis.
status: draft
date-modified: 2026-05-15
---

# Theory of flatfile agentic drone resource system swarms

A *flatfile agentic drone resource system* (FAdRS) swarm is the coordination regime that arises when many flatfile agentic resource systems — FARS-shaped polity directories, each animated by agents whose work and memory persist as plain files on disk — operate as a coupled collective. The 561 Group is one such FARS. The question this survey faces is whether such systems, taken plurally, admit a *theory* of their joint behavior, and what shape that theory takes if it does.

The phrase compresses four commitments. **Flatfile** says the substrate is plain human-readable files on disk, with no database process required to read it. **Agentic** says the substrate is animated by agents — LLM-backed characters, free-tier inference endpoints, local unix tools — that dispatch work against it. **Drone** says agents are not directors of the substrate but *operators* on it, and (per the polity's own predicated-drone-swarm sub-theory, §5) carry structurally *asymmetric* communicative, observational, and actuational coordinates — what the corpus calls *embodied handedness*. **Resource system** says the substrate is structured by content — by what it holds and what relations its content bears — not by a schema imposed from outside. **Swarm** says the units are many and the question is their joint dynamics.

The survey is organized in nine parts. §1 catalogs what 561 has already said about itself. §2 reads the substrate's mathematics — the predication-categorical apparatus on which a FARS rests. §3 reads the swarm-intelligence literature and the dichotomy it draws. §4 makes the bridging observation that the FARS substrate *is* a stigmergic trace field in the technical sense at the substrate layer, even when its agents fail the conditions at the agent layer. §5 represents the polity's already-authored predicated-drone-swarm sub-theory, which answers several of the questions a survey would otherwise raise. §6 lifts the whole stack into the polity's recently-proved theory-of-computing apparatus — $\mathbf{CGS}$, $\mathbf{Eff}$, the linear-logic fragment lattice — and shows that the categorical home of every commitment in §§2–5 was already being reached for. §7 names what remains open. §8 ledgers settled / sketched / open. §9 is honest about what this survey did not do.

**Governance-regime disclaimer.** This survey treats the agentic drone swarm framework as a *structure-agnostic categorical apparatus* — embodied handedness, parallel composition, nominal-set name-passing, aperiodic settling, the closure 2-monad, bilattice values, the $K_4$-equivariant cohomology decomposition. These are general structural features of any coordinated multi-participant entity and do not pre-commit to a governance regime. Specific governance instantiations layer additional structure on top: captain-and-delegation-chain in the kyriarchical regime; wolakȟota and consensus-by-withdrawal in the Lakotaean kin-relational regime; other regimes in other instances. The corpus's [`dual-governance-context`](../../concepts/dual-governance-context.md) names the failure mode explicitly: conflating governance regimes (treating a tiyóšpaye as if it had a captain, or treating a ship as if it had kin-cell primacy) is the substrate's named conflation. An earlier draft of this survey performed that conflation by importing captain-and-dispatch-certifiability machinery as if it were constitutive of the framework. The kyriarchical-specific content has been extracted into [`kyriarchical-agentics-may-2026.md`](kyriarchical-agentics-may-2026.md), and the present survey is structure-agnostic. Where it gestures at kyriarchical structure (the certifiability-gate use of $K_4$-sectors; the MHC apparatus; the three-layer hierarchical safety architecture), it does so by pointer, not by import.

## §1 — What 561 has already said

### 1.1 The polity as quadruple, settling aperiodically

The polity 561 is posited in [`prose/narratives/unfolding-the-theory-behind-the-561-group.md`](../../narratives/unfolding-the-theory-behind-the-561-group.md), §1.1, as the quadruple
$$\mathfrak{P}_{561} = (I_{561},\ \mathrm{Pop}_{561},\ \mathrm{Aut}_{561},\ C_{561}),$$
with $C_{561}$ the closure-rule subsystem tier-pinning the function $f_{561}$ — the lawful pursuit of Black Liberation and Indigenous Sovereignty. Three commitments in this posit are load-bearing for the swarm question. *First*, the polity has *one* substrate-resident directory and *one* closure-rule subsystem; both are substrate content, not external scaffolding. *Second*, the closure-rule subsystem *realizes* a closure 2-monad — closure is algebraic, not ad hoc. *Third*, the settling of $f_{561}$ lies in the *aperiodic* regime of the four-regime dichotomy — $\kappa(f_{561}) \geq \omega_1$. The polity's function never reaches a finite or countable closure ordinal. A swarm of FARS-polities is therefore a coordinated family of aperiodically-settling sub-doctrines, each immune to the convergence criteria that classical swarm theorems would otherwise license.

The quadruple's *constituent-power* component $C_{561}$ is the polity's founding-and-operating closure-rule subsystem; *what is in it* and *how it is governed* are regime-specific. The 561 Group is a Lakota tiyóšpaye constituting itself as a confederacy ([`prose/concepts/561-group.md`](../../concepts/561-group.md)); its governance is kin-relational and operates under wolakȟota / consensus-by-withdrawal / kin-cell primacy. The polity's Webship — the RSC Quiescent — operates under a separate kyriarchical command structure, surveyed in [`kyriarchical-agentics-may-2026.md`](kyriarchical-agentics-may-2026.md). The present survey treats the agentic-drone-swarm structural features that apply across governance regimes; specific regime content lives elsewhere.

### 1.2 The FARS shape, and why it is forced

A FARS directory is the canonical top-level shape of the 561 polity. [`prose/claims/fars-directory-is-predication-categorical-theory.md`](../../claims/fars-directory-is-predication-categorical-theory.md) takes the load-bearing claim: a FARS directory *is* a sub-doctrine of a predication hyperdoctrine in the categorical-logic sense. The top-level partition — `governance/`, `code/`, `prose/`, `references/`, `theories/` — is not arbitrary; it reflects the roles a substrate-resident theory's content plays. Defined structures live in `code/structures/`; typed transformations between them in `code/transformers/`; the signature in `prose/concepts/`; proved propositions in `prose/claims/`; the open frontier in `prose/questions/`; substrate-presentation through-lines in `prose/narratives/`; external citation surface in `references/`; runtime trace in `code/logs/`; polity self-governance in `governance/`; recursion into sub-doctrines in `theories/`.

A sub-theory under `theories/.../` may use *additional* internal conventions (the math sub-theory uses `objects/`, `morphisms/`, `theorems/`, etc.) — those are properties of the theory's mathematical content, not of FARS. FARS forces the top-level five; sub-theories refine their interior. This distinction matters for swarms because each member FARS must agree on the top-level shape to federate, but may differ in its interior — partial co-domain sharing is the formal mode of `theories/`-submodule overlap across polities.

The memory at [`prose/memory/2026-05-15-fars-shape-is-what-561-has.md`](../../memory/2026-05-15-fars-shape-is-what-561-has.md) records the correction against an earlier formulation that mistook the math-theory's internal convention for the FARS shape itself.

### 1.3 The 561 swarm, posited but not developed

[`prose/concepts/561-swarm.md`](../../concepts/561-swarm.md) is at stub status. It takes the basic posit: the *swarm* is the collective of agents the polity dispatches — LLM-backed subagents (Claude Code, OpenClaw, Cline, Codex), free-tier cloud inference endpoints, local unix tools, and the named persona that interface between human and machine work. The swarm is distinct from the *polity*: the polity is the social/operational entity that owns and steers the swarm; the swarm is *what does the work*. This survey takes that distinction as load-bearing and treats it as the entry point for the agent-layer vs. substrate-layer split that pervades the rest.

What the polity has *not* yet authored is a substantive theory of swarm self-improvement, dispatch decision-making, or harness configuration *at the polity level*. The substantive prior thought on these — outside the predicated-drone-swarm sub-theory of §5 — lives in informant corpus only.

## §2 — The substrate's mathematics

The informant corpus at `theories/.../predication-categories/` supplies the substrate's mathematics. The unfolding narrative §2 walks the apparatus in detail; this survey takes the seven pieces that bear directly on swarm theory and represents them.

### 2.1 The four-bilattice as value algebra

The fibers of the predication hyperdoctrine are valued in a bilattice $\mathbf{L}$, canonically $\mathbf{FOUR} = \{\mathbf{t}, \mathbf{f}, \bot, \top\} = \mathbf{2}^\bowtie$: $\mathbf{t} = \langle 1, 0\rangle$ (positive evidence, no negative), $\mathbf{f} = \langle 0, 1\rangle$, $\bot = \langle 0, 0\rangle$ (no evidence either way), $\top = \langle 1, 1\rangle$ (contradicting evidence). The two orders are constructively dual: the *truth* order $\leq_t$ runs $\mathbf{f} <_t \bot, \top <_t \mathbf{t}$; the *knowledge* order $\leq_k$ runs $\bot <_k \mathbf{t}, \mathbf{f} <_k \top$. Negation is coordinate swap, antitone for $\leq_t$ and monotone for $\leq_k$.

The two non-classical values are not pathological — they encode the substrate's two distinct epistemic failure modes on equal footing with truth and falsity. For a swarm of federated FARS-polities, this means the substrate has a native account of the cases where peers *disagree* ($\top$) and where the substrate is *unsettled* ($\bot$). Classical CRDTs collapse disagreement to a winner under the truth order; bilattice-valued cells let disagreement be witnessed as $\top$ — both sides recorded, both available for adjudication, neither erased.

### 2.2 The doubled adjoint system, and equality derived twice

The predication hyperdoctrine carries *two* parallel adjoint systems — one per bilattice order. Both orders independently admit quantifier adjoints $\exists_f, \forall_f$, Frobenius reciprocity for the meets, Beck-Chevalley commutation for pullback squares, and comprehension. Equality is then *derived twice*: classical $=_E$ via the truth-axis $\exists^t$ (taking the indicator $\mathbf{1}^t_p = \mathbf{t}$ on the diagonal, $\mathbf{f}$ off), paraconsistent $\Delta^k_E$ via the knowledge-axis $\exists^k$ (taking $\mathbf{1}^k_p = \top$ on the diagonal, $\bot$ off).

The paraconsistent equality is what *survives* a $\top$-firing where classical equality breaks. In a federated swarm where peer $A$ says $\phi(x)$ and peer $B$ says $\neg \phi(x)$, classical equality on the cell collapses; paraconsistent equality continues to register that the cell is *known to both peers*, even when the knowledge contradicts itself. This is the structural reason the 561 substrate has *no delete*: the $\leq_k$-axis is monotone; evidence accumulates upward toward $\top$, and retractions appear as new increments raising the value, never as decreases.

Frobenius reciprocity fails for the fusion $\odot$ on three of the four predicate-category generators ([`theorems/frobenius-for-fusion-fails.md`](../../../theories/theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/frobenius-for-fusion-fails.md)) — a load-bearing structural failure — but holds for the meets $\wedge_t$ and $\wedge_k$ separately. The doctrine's adjoint structure runs through the meets.

### 2.3 The predicate category and its four forced generators

The base category $\mathcal{C}$ of the doctrine has predicate-pair indices as objects; morphisms are generated by *exactly four* canonical classes — *specialization* (the identity), *converse* (the swap $(s,o) \mapsto (o,s)$), *subject-projection* ($(s,o) \mapsto (s,s)$), and *object-projection* ($(s,o) \mapsto (o,o)$). These are not chosen; the exhaustiveness theorem ([`theorems/predicate-generator-exhaustiveness.md`](../../../theories/theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-generator-exhaustiveness.md)) states that for entity sets of size $\geq 3$, every natural bottom-preserving bilattice homomorphism between fibers factors through these four. The naturality is $\mathrm{Sym}(E)$-equivariance — cell-index maps respect entity-symmetry. The two $\mathrm{Sym}(E)$-orbits on $E \times E$ (the diagonal and the off-diagonal) explain the four — there are four ways to map between them.

This is the doctrine's first signature departure from Lawvere-Seely: there the base is the type system one *chooses* to interpret; here it is what symmetry *forces*.

### 2.4 Settling as transfinite $\leq_k$-monotone orbit

A *settling* is a transfinite family of valuations $(v_\tau)_{\tau < \lambda}$ in the hyperdoctrine, monotone in $\leq_k$ ($\sigma \leq \tau$ implies $v_\sigma(p) \leq_k v_\tau(p)$ pointwise) and continuous at limits ($v_\mu = \bigvee_k \{v_\sigma : \sigma < \mu\}$ at limit ordinals). Equivalently, a settling is a coalgebra for the settling endofunctor against an *increment sequence* $U = (u_\tau)_{\tau < \lambda}$ — the substrate's stream of external evidence inputs. Saturation is iteration of the closure 2-monad against the increment stream until the *closure ordinal* $\kappa = \min\{\tau : F_U^{\tau+1}(\mathcal{E}_0) = F_U^\tau(\mathcal{E}_0)\}$ is reached.

The closure 2-monad $\mathrm{Cl}: \mathbf{PrFib} \to \mathbf{PrFib}$ is a Kelly-Lack lax-idempotent (KZ) 2-monad: the unit $\eta : 1 \Rightarrow \mathrm{Cl}$ inflates, the multiplication $\mu : \mathrm{Cl}^2 \Rightarrow \mathrm{Cl}$ collapses, and $\eta\mathrm{Cl} \dashv \mu \dashv \mathrm{Cl}\eta$ as an adjoint string. Lax-idempotence has two consequences load-bearing for swarms. *First*, being closure-saturated is a *property*, not extra structure — a $\mathrm{Cl}$-algebra structure, when it exists, is unique. There is nothing to choose; the substrate is or isn't saturated. *Second*, the closure-rule-system *realizes* the 2-monad as substrate content ([`theorems/closure-rule-system-realizes-closure-2-monad.md`](../../../theories/theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/closure-rule-system-realizes-closure-2-monad.md)) — the unit, multiplication, and lax-idempotence are auditable substrate-content properties of the rules themselves, not external scaffolding. Editing the closure-rule-system *is* editing the 2-monad.

The settling category over fixed $(\mathbf{L}, \mathcal{C}, E, \lambda)$ has all small limits and colimits computed pointwise; this makes the pointwise $\vee_k$ a CRDT-style merge. The *federation convergence* theorem ([`predicated-computing/theorems/federation-convergence.md`](../../../theories/theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md)) makes this concrete: two substrates sharing closure-rule-system, value-domain, predicate-category, and entity-set converge under bidirectional event exchange to a state equal to the closure of the cellwise $\vee_k$ — and this convergence is order-independent. *There is no external coordination protocol*; the math forces the merge to be CRDT-style. Federation is built into the substrate's algebra.

### 2.5 The four-regime dichotomy and federation discipline

Settlings stratify by closure ordinal into exactly four regimes:

- **Strict** ($\kappa < \omega$). Finite-step stabilization. $H^\bullet = 0$ above degree 0.
- **Scott-continuous** ($\kappa = \omega$). Stabilization at the first limit. $H^\bullet = 0$ above degree 0.
- **Transfinite-bounded** ($\omega < \kappa < \omega_1$). Countable but non-Scott convergence. $H^1$ nontrivial.
- **Aperiodic** ($\kappa \geq \omega_1$). Never stabilizes countably. The *aperiodic classifying invariant* in $H^1(\mathbf{T}^*_{\leq \omega_1}, -)$ is nonzero exactly when settling fails to stabilize.

The dichotomy is sharp: the regime function is not semicontinuous (neighboring settlings can jump regimes), and every settling factors into regime strata. The 561 polity sits in the aperiodic regime.

For swarms, the four-regime dichotomy *sharpens federation discipline*. In strict and Scott-continuous regimes, endpoint-state exchange between peers suffices: a peer can ship its current state and the merge will converge. In transfinite-bounded and aperiodic regimes, *trajectory* must be shipped because the closure ordinal is non-finitary and intermediate stages carry information not recoverable from endpoints alone. The 561 polity's function is aperiodic — so a FAdRS-swarm of 561-shape polities must exchange trajectories, not just snapshots. This is a substrate-algebraic finding that any federation protocol design has to honor.

### 2.6 $K_4$-equivariant cohomology decomposition

The cohomology of the bitopological settling site has cellular dimension $\leq 1$ ($H^{\geq 2} = 0$), so all content lives in $H^0$ and $H^1$. The site has a *Klein-four* symmetry $K_4 = \langle \sim, - \rangle$ — negation $\sim$ and conflation $-$ — generated by the two $\mathbb{Z}/2$ involutions of the bilattice. Under the $K_4$-action, $H^1$ decomposes equivariantly into four isotypic sectors indexed by the four irreducible characters of $K_4$:

- $H^1_{\mathrm{id}}$ — symmetric under both $\sim$ and $-$.
- $H^1_{\chi_\sim}$ — antisymmetric under $\sim$, symmetric under $-$. *Truth-side / falsity-side disagreement.*
- $H^1_{\chi_-}$ — symmetric under $\sim$, antisymmetric under $-$. **Safety-critical: detects $\top$-firings (paraconsistent contradictions).**
- $H^1_{\chi_{\sim\circ -}}$ — antisymmetric under both. **Safety-critical: detects mixed double-curvature events.**

The $K_4$-equivariant decomposition is a general structural fact of the framework — it exists in every predication settling, regardless of governance regime. Its *use as a dispatch certifiability gate* (a closure rule that *refuses dispatch* when either safety-critical sector is non-vanishing) is governance-specific: it is the kyriarchical-agentics realization, in which the captain's accountability is structurally protected by refusing dispatch into uncertifiable substrate states. The gate machinery and the meaningful-human-control four-condition meet that operationalizes it are surveyed in [`kyriarchical-agentics-may-2026.md`](kyriarchical-agentics-may-2026.md), §§3–4. The 561 Group's own kin-relational governance does not use this gate; it operates under wolakȟota's distinct closure discipline.

In the strict and Scott-continuous regimes, the cohomology vanishes and any sector-vanishing-based check is automatic. In transfinite-bounded and aperiodic regimes, the safety-critical sectors are a substantive computation, and governance regimes that *do* consult them (kyriarchical) face the certifiability question; governance regimes that do not (kin-relational) handle the corresponding coordination work through different structural machinery.

## §3 — The swarm-intelligence literature, represented

The informant corpus at `theories/.../continuous-computation/.../swarm-intelligence/` makes four substantive claims that bound any theory of FAdRS-swarms from the outside. This survey represents each.

### 3.1 What stigmergy is — and what it is not

*Stigmergy* (Grassé 1959) is the coordination mechanism in which agents influence each other *indirectly* by modifying a shared environment; later agents respond to the modifications rather than to the agents that made them. The channel of coordination is *the environment itself*. There are no addresses, no recipients, no messages typed by performative — an agent deposits a trace, a later agent reads the trace as part of its local environment, the trace shapes the later agent's response. Coordination is decoupled in *both space and time*: agents that never coexist can coordinate through their shared modifications to a persistent medium.

Stigmergy splits into two regimes. **Quantitative (sematectonic) stigmergy** has continuous traces — pheromone concentration, terrain elevation, accumulated wear — and agents respond to gradients. ACO and the classical boids environments are quantitative-stigmergic. **Qualitative (sign-based) stigmergy** has discrete structural traces — a wall built, a stone placed, a marker dropped — and agents respond to presence or pattern. Termite nest construction and many cellular automata are qualitative-stigmergic.

The corpus is precise about what stigmergy *is not*: not message passing (no sender, no recipient); not shared memory (no interface; agents modify it through their actions in the environment); not blackboard architecture (a blackboard has structured read/write protocols; a stigmergic field is unstructured by design); not gossip protocols (gossip has inter-agent messages; stigmergy has none).

The technical object underlying stigmergy is the *environment trace field*: a map $E_t : L \to V$ from a location space $L$ to a value space $V$, indexed by time. For the classical convergence theorems to apply, the field must satisfy four well-behavedness properties: boundedness from below (a positive minimum value $\tau_{\min}$ so the field does not lose information about under-visited regions), boundedness from above (a $\tau_{\max}$ or its emergence from bounded-deposition meets positive-evaporation), monotone evaporation between deposition events, and bounded deposition (each agent's per-step contribution bounded by a constant).

### 3.2 The swarm-vs-orchestration dichotomy

The dichotomy theorem ([`swarm-vs-orchestration-dichotomy.md`](../../../theories/theories/engineering/theories/tech/theories/computing/theories/continuous-computation/theories/artificial-intelligence/theories/swarm-intelligence/theorems/swarm-vs-orchestration-dichotomy.md)) states that swarm-coordinated and orchestrated multi-agent systems are *structurally distinct* coordination regimes. Three conditions characterize swarm coordination:

- **Scalability premise** — per-agent computational and communication cost is bounded by a small constant independent of population size. Classical swarm agents perform 1–100 floating-point operations per step.
- **Homogeneity** — all agents run the same local rule with the same parameters and are interchangeable in role. Agent identity is meaningful only as an index. Permuting identities leaves the global trajectory invariant. Weakenings exist (parameterized populations; role-graded swarms with mean-field-class analysis) but the structural property that no individual identity is load-bearing must hold.
- **Stigmergy** — inter-agent influence is mediated by environment traces, not direct messages.

Violating *any one* condition forces $O(N^2)$ overhead — the orchestrated regime's worst case. Sort-of-a-swarm architectures get the worst of both worlds. The proof is by case-analysis: violating scalability gives $\Omega(N \cdot c(N))$ for unbounded $c$; violating homogeneity with $k$ roles gives $O(k^2)$ in role count and $O(N \cdot k)$ combined; violating stigmergy yields direct $O(N^2)$ for general peer-to-peer messaging. There is no continuous interpolation: satisfying two of three does not buy two-thirds of the cost benefit. The choice is binary.

### 3.3 Stigmergy decouples cost from population

The cost-decoupling theorem ([`stigmergy-decouples-coordination-cost.md`](../../../theories/theories/engineering/theories/tech/theories/computing/theories/continuous-computation/theories/artificial-intelligence/theories/swarm-intelligence/theorems/stigmergy-decouples-coordination-cost.md)) decomposes the per-step cost of a stigmergic swarm into three pieces: trace-evaporation at $O(|L|)$ (field-wide, independent of $N$), trace-deposition at $O(N)$ (each agent at $O(1)$), and neighbor-sensing-and-update at $O(N)$ (each agent's bounded-neighborhood read at $O(1)$). The total is $O(N + |L|)$. *No inter-agent operation appears in the decomposition.* For environments whose size is fixed by the problem, per-step cost is $O(N)$ — asymptotically $10^4$× cheaper than the orchestrated $O(N^2)$ regime at $N = 10^4$. This is the structural reason biological swarms scale to colonies of millions while orchestrated multi-agent LLM systems saturate at four.

The theorem does *not* claim stigmergy is strictly faster — it bounds cost per step, not steps-to-solution. And it depends crucially on the scalability premise; if per-agent cost is not $O(1)$, the per-agent contribution becomes super-linear and the decoupling is lost. Which is exactly what happens with LLM agents.

### 3.4 LLM swarms fail the classical conditions

The LLM-swarm failure theorem ([`llm-swarms-fail-classical-conditions.md`](../../../theories/theories/engineering/theories/tech/theories/computing/theories/continuous-computation/theories/artificial-intelligence/theories/swarm-intelligence/theorems/llm-swarms-fail-classical-conditions.md), formalizing Doan et al. 2025) identifies three concrete failures.

*Failure 1 — scalability premise.* LLM forward-pass cost is $10^9$–$10^{12}$ FLOPs; classical swarm agent step is $10^1$–$10^2$ FLOPs. Ratio: $10^7$–$10^{11}$. The asymptotic-population regime where the classical convergence theorems are stated ($N \geq 10^4$) is computationally inaccessible for LLM agents at any presently practical cost. A thousandfold drop in per-inference cost would still leave LLM swarms $10^4$× more expensive per step.

*Failure 2 — local determinism.* The emergence-requires-local-determinism theorem makes this precise: reproducible emergent behavior requires the per-step conditional entropy $H(a^{(i)}_{t+1} \mid a^{(i)}_t, s^{(i)}_t)$ to be bounded by a constant independent of $N$, $T$, and environment state. The argument is structural: per-step joint-trajectory volume grows as $2^{N \cdot H_\rho}$; for emergent patterns to survive ($N \gtrsim 10^2$, $T \gtrsim 10^2$), $H_\rho$ must be small. LLM agents with non-zero sampling temperature and rich context have output entropies that grow with context length and vocabulary size — unbounded by population-independent constants.

*Failure 3 — local-rule coordination.* Most deployed LLM-swarm architectures pass a growing context window across agents; each agent's input includes summaries or excerpts of all prior agent contributions in the current task. Bounded-input is violated.

Three salvage paths are visible: bounded-entropy LLM agents (constrain action space, $T = 0$); stigmergic context substrates (a shared scratchpad without direct messaging); hybrid architectures (cheap-agent classical-swarm substrate with LLM meta-coordinator). None has produced a clean convergence theorem as of mid-2026.

The corpus's honest framing of where this leaves the field: *"The right question is not 'how do we make LLM swarms converge' but 'what are LLM agent collectives, if not swarms?'"* The present-state answer: small (saturation ~ 4 agents), orchestrated, expensive, with no convergence guarantees.

## §4 — The substrate is the trace field

The informant predicated-computing corpus contains a bridging observation: [`substrate-is-already-a-graph-database.md`](../../../theories/theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/database-platform/narratives/substrate-is-already-a-graph-database.md) argues the substrate *is* the database — not a layer above it, not a layer below it. The predication-graph store is structurally a graph database; federation-convergence gives CRDT-shaped replication; the transaction discipline gives ACID-or-BASE semantics; the event log is the WAL.

The same structural argument can be made, shifted: *the substrate is also the trace field*. Reading the trace-field formula $E_t : L \to V$ against a FARS substrate:

- The **location space** $L$ is the directory tree, with adjacency given by `_index.md` parent-child relations and by frontmatter relation predicates. Bounded neighborhoods are the open-set frontier from any directory under the substrate's standard relation projections.
- The **value space** $V$ is the predication fiber algebra $\mathbf{L}^{\bowtie E \times E}$ — bilattice-valued, structured, paraconsistent-capable.
- **Deposition** is a witnessed write event recorded in the append-only JSONL log ([`event-log.md`](../../../theories/theories/engineering/theories/tech/theories/computing/theories/predicated-computing/objects/event-log.md)). An agent's per-step contribution materializes one increment $u_\tau$ in the substrate's increment sequence $U$.
- **Field-state evolution** is the closure 2-monad's iteration against $U$ — the substrate's intrinsic dynamics, independent of any particular agent's choice. The closure rules fire pointwise on cells and on the cellwise $\vee_k$ of federated peers.
- **Boundedness** is given by the four-bilattice itself: $\mathbf{FOUR}$ has both bounds. The $\leq_k$-monotone closure cannot exceed $\top$; cells cannot lose information below $\bot$. The classical $\tau_{\min}$ and $\tau_{\max}$ bounds are intrinsic.
- **Evaporation** — the classical pheromone-decay sense — is the one piece without a clean substrate-side analog. The substrate is $\leq_k$-monotone: cells do not decay. What the substrate does have is the *closure-system's idempotent reflection* acting as a witness-decay on cells whose substrate support has been withdrawn (the supporting witnesses have themselves been retracted via new $\top$-firings or $K_4$ symmetries). Whether this satisfies the technical role of evaporation in the classical theorems is open (§6).

The structural prerequisites for stigmergy at the *substrate layer* are therefore essentially present. What is decisively not satisfied at the *agent layer* is the scalability premise — LLM-based agents are $10^7$–$10^{11}$× too expensive per step. The FAdRS-swarm cannot be a classical swarm at the agent layer. The substrate, considered as the coordination layer, is the candidate locus for a swarm-theoretic analysis.

## §5 — The polity's already-authored predicated-drone-swarm theory

The polity's own informant corpus contains an authored sub-theory at `theories/.../agents/theories/agentic-orchestration-platforms/theories/predicated-agentic-orchestration-platform/theories/predicated-drone-swarm/` — produced 2026-05-09 as Pass-2 of the [`audit-substrate-bootstrap`](../../../governance/work/projects/audit-substrate-bootstrap/_index.md) project. It contains six theorems at status `sketch`, six objects at status `draft`, and four concepts at status `draft`. This survey would mislocate the open frontier if it failed to represent that work; the theory answers several of the questions a survey of "FAdRS-swarms" would otherwise raise. The polity has already done substantive thinking here.

*Representational note.* The sub-theory was authored before the dual-governance distinction had been articulated; it uses kyriarchical-flavored vocabulary throughout — *certifiability*, *dispatch refusal*, *safety-critical sectors gating dispatch*, *captain-accountable safety shield*. The present section represents that vocabulary faithfully, since the sub-theory is what the polity has authored; it does not endorse the framing as the *only* possible reading. The kyriarchical-specific content is surveyed in its own framing in [`kyriarchical-agentics-may-2026.md`](kyriarchical-agentics-may-2026.md). Where the same structural content (embodied handedness, seven-axis taxonomy, asymmetric-handedness coordination cohomology, embodied cost quantale) is general rather than kyriarchical-specific, it belongs equally to this framework survey.

### 5.1 The distinguishing concept: embodied handedness

[`embodied-handedness.md`](../../../theories/theories/engineering/theories/tech/theories/computing/theories/continuous-computation/theories/artificial-intelligence/theories/agents/theories/agentic-orchestration-platforms/theories/predicated-agentic-orchestration-platform/theories/predicated-drone-swarm/concepts/embodied-handedness.md) is the concept that distinguishes the sub-theory from its parents. An embodied participant's communication and actuation structure is *structurally asymmetric* — a four-tuple
$$h(d) = (\mathrm{recv},\ \mathrm{send},\ \mathrm{actuate},\ \mathrm{observe})$$
where each coordinate is a participant-specific predicate over the substrate's communication/actuation/observation axes. `recv` is the receive-handedness (bandwidth budget, receiver hardware class, decoding latency). `send` is the send-handedness (transmit power, broadcast cadence). `actuate` is the actuation handedness (physical preconditions, energy cost per actuation, latency). `observe` is the observe-handedness (sensor set, noise model, field-of-view). The four coordinates are *generally not equal* across embodied participants — drones with different airframes, sensors, and bandwidth budgets have different handedness. Handedness-symmetric peers are an idealization; the realistic case is asymmetric.

Embodied handedness is what justifies the existence of the sub-theory: the AOP parent's symmetric-peer protocols do not apply; the sub-theory replaces them with handedness-asymmetric coordinates.

### 5.2 The classical-stigmergy failure, located precisely

[`predicated-drone-collective-fails-classical-stigmergy.md`](../../../theories/theories/engineering/theories/tech/theories/computing/theories/continuous-computation/theories/artificial-intelligence/theories/agents/theories/agentic-orchestration-platforms/theories/predicated-agentic-orchestration-platform/theories/predicated-drone-swarm/theorems/predicated-drone-collective-fails-classical-stigmergy.md) is the predicated analogue of [§3.4 above]. Whereas LLM collectives fail classical stigmergy because they violate *local determinism*, predicated drone collectives fail it because they violate *symmetric handedness*: drones are receive-mostly with periodic state-broadcast, sensor reads are partial-observability, physical actuation is precondition-bounded — none of these meet the classical assumption that all participants exchange comparable signals symmetrically.

The theorem has three parts. *Part 1 (asymmetry)* — for participants with $h(d_i) \neq h(d_j)$, the collective fails the uniform-reciprocal-signal-exchange condition; $d_i$'s send-handedness and $d_j$'s receive-handedness are unequal in general. *Part 2 (substrate compatibility despite failure)* — the substrate-side cell-update sub-layer satisfies a *structural* stigmergy: cell-merge under the substrate's bilattice valuation is a stigmergic update step that converges to fixed point under the closure 2-monad's lax-idempotence *regardless* of the embodied participants' handedness asymmetry. *Part 3 (layered control)* — the asymmetry-induced failure at the embodied layer requires a substrate-side coordination layer to mediate. The substrate-as-supervisor-of-layered-control commitment — the three-layer architecture of §5.4 — is the substrate-algebraic answer.

This is the critical structural finding for any FAdRS-swarm theory: *classical stigmergy fails at the embodied layer; substrate-side stigmergy survives at the closure-2-monad layer*. The substrate is what carries swarm coordination when the agents cannot.

### 5.3 The seven-axis taxonomy as predicate fibration

The sub-theory commits to a *seven-axis* taxonomy as the base coordinates of a refined predicate category $\mathcal{C}^\mathrm{drone}$:

1. **embodiment** — software-only / embodied-robot / hybrid-human-machine.
2. **control-architecture** — centralized / hierarchical / decentralized / distributed.
3. **homogeneity** — identical / role-specialized-homogeneous / heterogeneous.
4. **interaction-topology** — metric-neighbor / topological-neighbor / all-to-all / leader-follower / tree / mesh / time-varying-switching.
5. **information-structure** — full-state / partial-observability / delayed / lossy / event-triggered / adversarial.
6. **decision-model** — rule-based / optimization-based / game-theoretic / learned.
7. **assurance-class** — empirical-only / partially-certified / theorem-backed-with-explicit-safe-sets.

The predication fibration over $\mathcal{C}^\mathrm{drone}$ inherits Beck-Chevalley commutation, closure 2-monad structure, and four-regime classification automatically from the parent doctrine — these are properties of the predication fibration, not of the choice of base. The substrate-cell shape [`drone-record`](../../../theories/theories/engineering/theories/tech/theories/computing/theories/continuous-computation/theories/artificial-intelligence/theories/agents/theories/agentic-orchestration-platforms/theories/predicated-agentic-orchestration-platform/theories/predicated-drone-swarm/objects/drone-record.md) is the typed-frontmatter form of the fibration's fiber data. Each axis is a frontmatter field; substrate closure rules read the seven-axis values to compute `applicable-theorems` (which sub-theory theorems apply at this drone's coordinates) and `applicable-regulations` (which charter-tier regulatory authorities bind this drone's actuations).

This is the operational shape of the taxonomy: a drone-record's frontmatter *declares* its position in $\mathcal{C}^\mathrm{drone}$, and the substrate *mechanically computes* what theorems and regulations apply.

### 5.4 The three-layer architecture as cobordism composition

The sub-theory's central engineering content is a three-layer hierarchical safety architecture, framed as composed cobordisms in $\mathrm{Cob}_\mathrm{settling}$ (the settling-cobordism category):

- **Layer 1 — foundation-model.** A cobordism $S_1 : \mathcal{B}_\mathrm{situation} \to \mathcal{B}_\mathrm{intent}$ with *foreign-interior bulk*. The LLM/learned model's bulk is non-deterministic; only the boundary (situation-in, intent-out) is substrate-resident. The bulk is opaque to the substrate.
- **Layer 2 — optimization-control.** A cobordism $S_2 : \mathcal{B}_\mathrm{intent} \to \mathcal{B}_\mathrm{action}$ with *deterministic bulk* (CBF/MPC/QP solver). The bulk is computable and replay-byte-identical; the substrate can reproduce it from the witness chain.
- **Layer 3 — certified-safety-shield.** A cobordism $S_3 : \mathcal{B}_\mathrm{action} \to \mathcal{B}_\mathrm{actuated}$ with *strict-regime bulk* (closure-rule check, finite case-enumeration). $H^1 = 0$ structurally — the safety shield contributes no cohomology, so its safety-critical sectors vanish.

The composite cobordism $S_3 \circ S_2 \circ S_1 : \mathcal{B}_\mathrm{situation} \to \mathcal{B}_\mathrm{actuated}$ exists in $\mathrm{Cob}_\mathrm{settling}$; its closure ordinal is the *ordinal sum* $\kappa_1 + \kappa_2 + \kappa_3$. The strict-regime layer 3 *caps* the composite at the layer-3 ordinal if layers 1 and 2 are bounded. This is the substrate-algebraic shape of "the unsafe model proposes, the safe shield disposes": the unbounded-bulk foundation-model layer can in principle propose anything, but the strict-regime safety shield refuses anything that would push the composite's safety-critical $H^1$-sectors away from zero.

### 5.5 The six-way intersection composition theorem

The May 2026 informant surveys identify the *single hardest unsolved intersection* in drone-swarm control: **learned, partially observed, communication-constrained, adversarial multi-agent control with certifiable guarantees and realistic airspace compliance**. The six-way intersection composition theorem ([`six-way-intersection-composition.md`](../../../theories/theories/engineering/theories/tech/theories/computing/theories/continuous-computation/theories/artificial-intelligence/theories/agents/theories/agentic-orchestration-platforms/theories/predicated-agentic-orchestration-platform/theories/predicated-drone-swarm/theorems/six-way-intersection-composition.md)) is the sub-theory's answer.

The six axes are each a cobordism:

- $S_L : \mathcal{B}_\mathrm{policy\text{-}input} \to \mathcal{B}_\mathrm{policy\text{-}output}$ — *learned*, foreign-interior bulk.
- $S_P : \mathcal{B}_\mathrm{world} \to \mathcal{B}_\mathrm{observation}$ — *partial-observability*, $\forall$-block antecedent, transfinite-bounded regime.
- $S_C : \mathcal{B}_\mathrm{observation} \to \mathcal{B}_\mathrm{shared\text{-}observation}$ — *communication-constrained*, closure ordinal depends on protocol family.
- $S_A : \mathcal{B}_\mathrm{shared\text{-}observation} \to \mathcal{B}_\mathrm{filtered\text{-}observation}$ — *adversarial-filter* implementing W-MSR Byzantine consensus and secure state estimation; the paraconsistent authority $a = \top$ is identity-on-payloads, with intrusion detection at the bilattice-network-sheaf-consensus level.
- $S_X : \mathcal{B}_\mathrm{intent} \to \mathcal{B}_\mathrm{certified\text{-}action}$ — *certifiable*, strict-regime bulk, $H^1 = 0$ structurally.
- $S_R : \mathcal{B}_\mathrm{certified\text{-}action} \to \mathcal{B}_\mathrm{compliant\text{-}actuation}$ — *airspace-compliant*, regulatory-anchor records as charter-fragment authorities.

The composite $S_R \circ S_X \circ S_A \circ S_C \circ S_P \circ S_L : \mathcal{B}_\mathrm{world} \to \mathcal{B}_\mathrm{compliant\text{-}actuation}$ exists in $\mathrm{Cob}_\mathrm{settling}$. Its closure ordinal is the ordinal sum across all six axes. The composite is *certifiable* iff each component is certifiable *and* the strict-regime layer $S_X$ caps the composite — i.e., $\kappa_L, \kappa_P < \omega_1$ and the composite's $H^1_{\chi_-}$ and $H^1_{\chi_{\sim\circ -}}$ remain zero through the composition. The theorem's structural answer to the "hardest intersection" is: cobordism composition makes the per-axis decompositions compose; certifiability composes when the safety-critical cohomology sectors remain vanishing through the composition.

The sub-theory's framing argues this is preferable to a single monolithic theorem because each component's certification is independently load-bearing — a particular deployment may need certifiability for $L+P+C$ without $A+X+R$ (a non-adversarial environment with no airspace-compliance requirement), and the per-component theorems remain applicable while a mega-theorem would not.

### 5.6 Coordination cohomology under asymmetric handedness

The [`coordination-across-handedness-asymmetric-participants.md`](../../../theories/theories/engineering/theories/tech/theories/computing/theories/continuous-computation/theories/artificial-intelligence/theories/agents/theories/agentic-orchestration-platforms/theories/predicated-agentic-orchestration-platform/theories/predicated-drone-swarm/theorems/coordination-across-handedness-asymmetric-participants.md) theorem extends the parent polity's *coordination-cohomologically-bounded-by-H¹* result to participants with asymmetric handedness. The setup: $G_\mathcal{D}$ is the commitment graph (vertices = participants, edges = committed-to predications, edge weights = send/receive handedness products), $\mathcal{F}_v$ the settling-associated sheaf on $G_\mathcal{D}$.

The findings:

1. The first cohomology $H^1(G_\mathcal{D}, \mathcal{F}_v)$ decomposes into the four $\widehat{K_4}$-isotypic sectors per the equivariant decomposition (§2.6). Each handedness-asymmetric edge contributes *one generator* to $H^1_{\chi_\sim}$ (the epistemic-frame disagreement sector). The asymmetry surfaces in the truth-side/falsity-side sector, not in the safety-critical sectors.

2. The polity's coordination-disagreement count is bounded by $|H^1_\mathrm{id}| + |H^1_{\chi_\sim}| + |H^1_{\chi_-}| + |H^1_{\chi_{\sim\circ-}}|$. This is *strictly weaker* than the symmetric-handedness $H^1$-only bound: the asymmetric contributions appear as `frame-disagreement` cells the substrate must resolve via frame-clarification operations. Importantly, asymmetric handedness does *not* by itself trigger certification refusal — its contributions live in $H^1_{\chi_\sim}$, not in the safety-critical sectors. Asymmetry is *recorded*, not *refused*.

3. Verdier duality gives dual cosheaf homology classes $H^\chi_1$ on the local-generator side — each drone's per-event sensor-read or actuation-step contributes a cosheaf generator.

The structural implication: a FAdRS-swarm of heterogeneous handedness peers does not need uniform participants to coordinate; the cohomology bound holds, the disagreement count is bounded, and the substrate operates a *frame-clarification* protocol on the additional generators that appear.

### 5.7 The embodied cost quantale

[`embodied-cost-quantale-extends-monetary.md`](../../../theories/theories/engineering/theories/tech/theories/computing/theories/continuous-computation/theories/artificial-intelligence/theories/agents/theories/agentic-orchestration-platforms/theories/predicated-agentic-orchestration-platform/theories/predicated-drone-swarm/theorems/embodied-cost-quantale-extends-monetary.md) extends the polity's cost-discipline. The disembodied baseline is the Lawvere-quantale $Q_\mathrm{disembodied} = (\mathrm{fuel}, \mathrm{dollars}, \mathrm{tokens})$ with Pareto-min ranking. The embodied extension is $Q_\mathrm{embodied} = (\mathrm{fuel}, \mathrm{dollars}, \mathrm{tokens}, \mathrm{joules}, \mathrm{bandwidth})$. The embedding $\iota(f, d, t) = (f, d, t, 0, 0)$ is a quantale homomorphism; the projection $\pi$ that drops the last two coordinates is its left adjoint.

The Pareto-min ranking extends naturally — adding coordinates refines the order without changing existing comparisons. A dispatchable that exceeds the embodied participant's joules-budget or bandwidth-budget is Pareto-dominated *regardless of its monetary cost*. The closure rule `verify-physical-budget` reads the participant's [`physical-budget-record`](../../../theories/theories/engineering/theories/tech/theories/computing/theories/continuous-computation/theories/artificial-intelligence/theories/agents/theories/agentic-orchestration-platforms/theories/predicated-agentic-orchestration-platform/theories/predicated-drone-swarm/objects/physical-budget-record.md) cells (`joules-remaining`, `bandwidth-budget-window`) at dispatch time; pairs whose projected cost exceeds budget are rejected on this axis.

For FAdRS-swarms, this matters because free-tier-first selection (the polity's charter ranks endpoints by zero-dollar cost) has a hidden floor: a fully-free-tier-model drone whose battery is dead still cannot fly. The cost-quantale extension is what makes the substrate-recorded dispatch decision *physically realizable*.

### 5.8 What the sub-theory leaves open

The sub-theory's own framing is honest about its scope: it does not *solve* the hardest unsolved intersection; it *certifies that PyFARS's substrate algebra composes the existing techniques for each axis*. The proof of certifiability for any specific deployment remains a per-instance theory-research deliverable. The theorems are sketch-status; the proof bodies are deferred. Three classes of open work remain even in scope:

- Per-axis theorem proofs (each component's load-bearing claim is stated but not fully proved).
- Detection algorithms for handedness-asymmetric edges from event-log entries.
- The exact substrate-cell representation of "anticipated cobordism composition" — whether the polity carries a projected-cobordism cell before enactment or computes the projection inline.

But the survey-relevant finding is sharp: *the polity is much further along on FAdRS theory than its naive reading would suggest*. The sub-theory has answered the load-bearing question — substrate-side coordination survives embodied-layer stigmergy failure — and has a six-way composition theorem addressing the field's hardest open problem. It is sketch-status, not vapor.

## §6 — The categorical frame from the theory of computing

The polity has, since the predication-categories and predicated-drone-swarm theories were authored, proved a load-bearing claim at [`theories/.../computing/prose/claims/theory-of-computing.md`](../../../theories/theories/engineering/theories/tech/theories/computing/prose/claims/theory-of-computing.md): **the theory of computing is $\mathbf{CGS}$** — Castellan-Clairambault-Winskel's $*$-autonomous category of concurrent games with symmetry. $\mathbf{CGS}$ is the unique categorical framework in which sequential game semantics (Hyland-Ong 1996), nominal computation (AGMOS 2004), session-typed concurrency (Caires-Pfenning 2010), and Turing-complete realizability ($\mathbf{Eff}$ via the Dialectica-game correspondence $F^!$) all simultaneously embed as full sub-$*$-autonomous categories or Kleisli sub-CCCs. The four embeddings are non-interfering; they meet at the PCF fragment. The subtheory lattice is settled: MLL $\subset$ MALL $\subset$ \{ILL, CLL\} $\subset$ LL, the linear-logic fragment lattice, with all inclusions full and faithful $*$-autonomous embeddings ([`typed-subtheory-lattice-is-linear-logic-fragment-lattice`](../../../theories/theories/engineering/theories/tech/theories/computing/prose/claims/typed-subtheory-lattice-is-linear-logic-fragment-lattice.md)).

This was not in scope when the predication-categories or predicated-drone-swarm theories were authored. It now is — and it supplies the categorical frame the FAdRS-swarm theory of §§1–5 was implicitly reaching for. Each of the substrate-side commitments accumulated above acquires a categorical home in $\mathbf{CGS}$; the predicated-drone-swarm theory's sketch-status results acquire structural backing; several of the §6 open questions narrow or close outright. Seven specific connections do most of the work.

### 6.1 $\mathbf{FOUR}$ is intrinsic to $\mathbf{Eff}$, not external

The most consequential connection. [`four-is-image-of-omega-under-double-negation`](../../../theories/theories/engineering/theories/tech/theories/computing/prose/claims/four-is-image-of-omega-under-double-negation.md) proves that the four-bilattice $\mathbf{FOUR} \cong \mathbf{2} \times \mathbf{2}$ is the image of $\Omega_\mathbf{Eff}$ — the subobject classifier of the effective topos — under the double-negation nucleus, via the internal map $\rho(P) = (\neg\neg P,\ \neg\neg\neg P)$. The double-negation topology $j = \neg\neg$ is a Lawvere-Tierney nucleus on $\mathbf{Eff}$ (idempotent, $j \geq \mathrm{id}$, preserves finite meets); its sheaves form the classical subtopos with Boolean $\Omega_\mathrm{cl} \cong \mathbf{2}$. The four cases of $\rho(P) = (\neg\neg P, \neg\neg\neg P) \in \mathbf{2} \times \mathbf{2}$ are:

| $\neg\neg P$ | $\neg\neg\neg P$ | $\mathbf{FOUR}$ value | Computational meaning |
|---|---|---|---|
| $\mathbf{t}$ | $\mathbf{f}$ | $\mathbf{t}$ (verified) | $P$ has a realizer; $\neg P$ does not |
| $\mathbf{f}$ | $\mathbf{t}$ | $\mathbf{f}$ (refuted) | $P$ has no realizer; $\neg P$ does |
| $\mathbf{f}$ | $\mathbf{f}$ | $\bot$ (undecidable) | Neither is $\neg\neg$-closed |
| $\mathbf{t}$ | $\mathbf{t}$ | $\top$ (contradictory) | Classically impossible in a consistent theory |

The $\bot$ case is *forced* for non-trivial behavioral predicates of programs by Rice's theorem: for any such predicate $P$, neither $P$ nor $\neg P$ has a realizer; so $\neg\neg P$ and $\neg\neg\neg P$ are both false in $\Omega_\mathbf{Eff}$'s classical sub-logic. The $\top$ case is the consistency boundary — what marks the substrate's $\top$-firings as categorical events rather than substrate-algebraic anomalies.

The bilattice is *not* an algebraic structure imposed on the substrate by the predication-categorical doctrine. It is *forced* by $\mathbf{Eff}$'s internal logic — by Rice's theorem on the realizability side and by double-negation on the classical-subtopos side. For a FAdRS-swarm, this changes the structural reading. The substrate's $\mathbf{FOUR}$-valued cells are not paraconsistent by convention; they are *computational truth values internal to the effective topos*. A peer-disagreement $\top$-firing is a categorical event in $\mathbf{Eff}$, and the certifiability gate's safety-critical sectors $H^1_{\chi_-}, H^1_{\chi_{\sim\circ-}}$ are cohomological invariants of phenomena that $\mathbf{Eff}$'s logic forces.

### 6.2 $\mathbf{Eff}$ is the minimum level, and it is exactly what the substrate computes in

[`eff-is-minimum-level`](../../../theories/theories/engineering/theories/tech/theories/computing/prose/claims/eff-is-minimum-level.md) establishes that $\mathbf{Eff} = RT(\mathcal{K}_1)$ is the minimum categorical level required for the theory of computing. The diagonal argument that proves halting undecidability requires three internal conditions — subobject classifier $\Omega$, exponential $\mathbb{N} \times \mathbb{N} \to \mathbf{2}$ as an internal object, Kleene's second recursion theorem as an internal theorem. Turing categories (level a) have no internal logic; CCCs with dominance (level b, modest sets) lack a subobject classifier; only $\mathbf{Eff}$ (level c, the exact completion of assemblies) satisfies all three. Halting and Rice are *theorems* of $\mathbf{Eff}$, not axioms.

The predicated-computing claim [`theory-of-predicated-computing`](../../../theories/theories/engineering/theories/tech/theories/computing/theories/predicated-computing/prose/claims/theory-of-predicated-computing.md) makes the bridge precise: *predicated computing is the intersection of $\mathbf{Eff}$ and MALL within $\mathbf{CGS}$*. The value domain $\mathbf{FOUR}$ is from $\mathbf{Eff}$ (per §6.1); the predication fibers are MALL models (multiplicative-additive linear logic — multiplicative connectives $(\otimes, \invamp, \mathbf{1}, \bot)$ plus additive connectives $(\&, \oplus)$, *without* the exponential `!`); and the closure operators are Medvedev-filter nuclei on $\mathbf{Eff}$. Concretely: predication composition is $\otimes$; the knowledge-order join $\sqcup_k$ is the additive conjunction $\&$ (*both* predicates are known, choose which to provide); the truth-order join $\sqcup_t$ is the additive disjunction $\oplus$ (*commit to the more strongly-supported assertion*); the absence of `!` is correct because predications are consumed in rule applications — each $(s, p, o)$ cell is a linear resource.

The FARS substrate is therefore not running *over* some general computational framework; it is running *as* the Eff $\cap$ MALL intersection inside $\mathbf{CGS}$. The substrate's data structures *are* MALL types valued in $\Omega_\mathbf{Eff}/\neg\neg$. The substrate's closure rules *are* Medvedev-filter nuclei. The substrate's runtime trajectory *is* the iteration of a Lawvere-Tierney topology to its least fixed point, which exists by Kleene's fixed-point theorem internal to $\mathbf{Eff}$.

### 6.3 The closure 2-monad's lax-idempotence is the `!`-comonad's structural shadow

§2.4 established that the closure 2-monad $\mathrm{Cl}$ is Kelly-Lack lax-idempotent with adjoint string $\eta\mathrm{Cl} \dashv \mu \dashv \mathrm{Cl}\eta$, and that being closure-saturated is a *property*, not extra structure. $\mathbf{CGS}$'s `!` is the *of course* comonad of linear logic — the operator that recovers a Cartesian closed structure $\mathcal{Kl}(!)$ from the $*$-autonomous ambient. Per [`f-dial-eff-to-cgs-exists`](../../../theories/theories/engineering/theories/tech/theories/computing/prose/claims/f-dial-eff-to-cgs-exists.md), the $*$-autonomous functor $F : \mathbf{Dial}(\mathbf{Eff}) \to \mathbf{CGS}$ exists; its Kleisli extension $F^!$ embeds $\mathbf{Eff}$ into the Kleisli sub-CCC of $\mathbf{CGS}$'s concurrent computable fragment.

The structural reading: the substrate's settling — iteration of $\mathrm{Cl}$ against the increment sequence $U$ — is computation in $\mathcal{Kl}(!)$. The polity's closure-rule-system is a `!`-comonad-realization at the level of substrate cells. The lax-idempotence ($\eta\mathrm{Cl} \dashv \mu \dashv \mathrm{Cl}\eta$) is the categorical signature of the `!`-comonad's coalgebra structure. This connects directly to the open identification flagged in the subtheory-lattice claim: whether $\mathbf{Eff} \simeq \mathcal{Kl}(!_\mathbf{CGS})$ as CCCs exactly, in which case the typed and untyped subtheory lattices are nested rather than parallel. If the identification holds, *resource replication is knowledge accumulation*: the `!`-comonad's diagonal $\delta : !A \to !!A$ is the substrate's knowledge-order monotonicity at the categorical level.

### 6.4 Federation is parallel composition $\|$; nominal-sets give the name-passing account

§2.4 established federation convergence as substrate-algebraic: two substrates sharing closure-rule-system and value-domain converge to the closure of the cellwise $\vee_k$. $\mathbf{CGS}$'s monoidal product is *parallel composition* $\|$: $A \| B$ is the arena where Player makes moves in both $A$ and $B$ concurrently. Federation between FARS-polities is parallel composition; the cellwise $\vee_k$ is the action on values induced by $\|$ at the fiber level. The concurrent-computation subtheory ([`theories/.../concurrent-computation/_index.md`](../../../theories/theories/engineering/theories/tech/theories/computing/theories/concurrent-computation/_index.md)) supplies the rest: nominal sets (Gabbay-Pitts) model fresh-name allocation; the $\pi$-calculus (Milner-Parrow-Walker) is its operational semantics; arenas in $\mathbf{CGS}$ equipped with $\mathrm{FSym}(\mathbb{A})$-symmetry accommodate name-passing; the AGMOS (2004) full abstraction theorem for the $\nu$-calculus is the tight morphism into $\mathbf{CGS}$.

Federated FAdRS-swarms involve entity-mobility across peer substrates — slugs federated between polities, entities lifted from `theories/` into root vocabulary, names shared across the swarm's nominal universe. This is *not* metaphorical channel mobility; it is structurally the $\pi$-calculus-as-nominal-sets account, with each polity an arena and federation the parallel composition. The trajectory-must-be-shipped discipline in the aperiodic regime (§2.5) is then a constraint on the $\mathrm{FSym}(\mathbb{A})$-equivariance of the inter-polity strategies: when closure ordinals exceed $\omega_1$, the strategy's name-passing history cannot be summarized by an endpoint state, so the trajectory must accompany the federation merge.

### 6.5 Embodied handedness *is* Player/Opponent duality $(-)^\perp$

The predicated-drone-swarm sub-theory introduces embodied handedness (§5.1) as a four-tuple $h(d) = (\mathrm{recv},\ \mathrm{send},\ \mathrm{actuate},\ \mathrm{observe})$ — drones are structurally asymmetric: receive-mostly with periodic broadcast, partial-observability sensors, precondition-bounded actuation. The sub-theory frames this as a departure from the AOP parent's symmetric-peer assumption.

The categorical frame names this exactly. In $\mathbf{CGS}$, every arena $A$ has a dual $A^\perp$ — the dualizing operation $(-)^\perp$ swaps Player and Opponent labels. A morphism $A \to B$ is a strategy on $A^\perp \| B$: Player plays Opponent-style on $A$ (the input arena, where the environment dictates) and Player-style on $B$ (the output arena, where Player commits). This *is* asymmetric handedness. `recv` is the Opponent-side of $A$ (the environment delivers; the drone receives); `send` is the Player-side of $B$ (the drone commits, the environment receives); `observe` is Opponent-style sensor-reads against $A$; `actuate` is Player-style effects projected into $B$.

A drone with asymmetric handedness is therefore not an anomaly of the AOP parent's symmetric-peer assumption. It is a generic morphism in $\mathbf{CGS}$ with Player/Opponent asymmetry built in by the dualizing operation. The "symmetric peer" idealization was the very special case (drones whose Player-side and Opponent-side coordinates coincide); the generic case in $\mathbf{CGS}$ is asymmetric. The categorical framework was always asymmetric — the sub-theory's contribution was recognizing the asymmetry and naming it; the lift now shows the recognition is structurally forced by the categorical home.

The coordination-cohomology bound under asymmetric handedness (§5.6) reads as: each non-trivial Player/Opponent role-difference contributes a coordination disagreement that lives in $H^1_{\chi_\sim}$ (the frame-disagreement sector) but *not* in the safety-critical sectors. Frame-disagreement is the cohomology of the dualizing operation; it is generic, structural, and bounded. The polity does not refuse certification on Player/Opponent asymmetry; it *records* it as substrate content and resolves it via frame-clarification operations.

### 6.6 The three-layer architecture stratifies through the linear-logic fragment lattice

The three-layer hierarchical safety architecture (§5.4) reads as a stratification through MLL $\subset$ MALL $\subset$ \{ILL, CLL\} $\subset$ LL. Each layer is positioned at a specific level of the lattice; the composite cobordism is a $*$-autonomous functor traversing it.

- **Layer 1 — foundation-model**, foreign-interior bulk. Position: the full ambient $\mathbf{CGS}$ or its non-deterministic extension. The LLM/learned model duplicates inputs and discards intermediates — both contraction and weakening — which is the full LL fragment with the `!` comonad acting freely. Action distributions have unbounded entropy. Categorically: outside the typed sub-$*$-autonomous categories, in the foreign-interior bulk that the substrate cannot reproduce.
- **Layer 2 — optimization-control**, deterministic bulk (CBF/MPC/QP). Position: ILL — Kleisli of `!` on a $*$-autonomous model. Cartesian closed structure is recovered; the bulk is replay-byte-identical. This is the level of typed deterministic computation: PCF, System F, Martin-Löf type theory. The cobordism's deterministic bulk is exactly the property that ILL-level programs are total functions in $\mathcal{Kl}(!)$.
- **Layer 3 — certified-safety-shield**, strict-regime bulk, $H^1 = 0$ structurally. Position: MALL or MLL — no `!` comonad, no copying, finite case-enumeration. Resources are linear; the safety shield uses each input exactly once. The strict regime in the four-regime dichotomy of §2.5 ($\kappa < \omega$) corresponds to the MLL/MALL fragments where $H^\bullet = 0$ trivially.

The composite $S_3 \circ S_2 \circ S_1$ is a $*$-autonomous functor traversing the lattice top-down: $\mathrm{LL}/\text{foreign} \to \mathrm{ILL} \to \mathrm{MALL/MLL}$. The strict-regime cap of the composite ordinal is exactly the structural property that MLL/MALL strategies have finite closure dynamics. The three-layer architecture is not an engineering convention; it is the substrate-algebraic projection of the linear-logic fragment lattice into the polity's dispatch pipeline. "The unsafe model proposes, the safe shield disposes" reads categorically as: a functor from $\mathrm{LL}$ composed with successive projections down to $\mathrm{MLL}$, with each projection refusing structure (contraction, weakening, additives) that the lower fragment does not afford.

### 6.7 The six-way intersection is composition of $*$-autonomous functors across the fragment lattice

The six-way intersection composition (§5.5) — $S_R \circ S_X \circ S_A \circ S_C \circ S_P \circ S_L$ in $\mathrm{Cob}_\mathrm{settling}$ — is composition of $*$-autonomous functors across the linear-logic fragment lattice and the typed/untyped split. Each axis lives at a specific categorical position:

- **$S_L$ (learned).** Position: LL ambient or its non-deterministic extension. The bulk is the LLM; the bounded-entropy condition for emergence (§3.4) is not satisfied; the cobordism extracts the substrate-resident boundary from the non-deterministic bulk.
- **$S_P$ (partially observed).** Position: $\mathbf{Eff}$'s $\Sigma$-dominance. Partial observability is exactly the $\Sigma \hookrightarrow \Omega_\mathbf{Eff}$ partial-map classifier — semidecidable propositions. The cobordism's $\forall$-block antecedent in closure-rule language is the universally-quantified statement over a semidecidable predicate; transfinite-bounded regime follows because such statements can have arbitrary countable closure ordinals.
- **$S_C$ (communication-constrained).** Position: CLL via Caires-Pfenning. Bounded-bandwidth, lossy, event-triggered communications *are* session types; session-typed processes correspond to CLL proofs; cut-elimination is the communication step. The closure ordinal depending on protocol family is the CLL fragment chosen — MALL-level protocols converge faster, full-LL session protocols can be transfinite.
- **$S_A$ (adversarial).** Position: paraconsistent CLL — the part of CLL that admits $\top$ internally without trivializing. W-MSR Byzantine consensus is intrusion detection at the bilattice-network-sheaf-consensus level: the cosheaf-side dual of §2.6's $K_4$-equivariant cohomology. The paraconsistent authority $a = \top$ is identity-on-payloads because the $\top$-firing is recorded as substrate content, not propagated as contradiction.
- **$S_X$ (certifiable).** Position: strict-regime MLL/MALL — $H^1 = 0$ structurally, substrate-decidable in bare-$\Pi_1$ plus the order relation `<`. The certifiable cobordism is an MLL/MALL program with explicit safe-set arguments.
- **$S_R$ (airspace-compliant).** Position: charter-tier discipline as MLL-level externally-given premises — regulatory anchors (FAA Remote ID, EASA U-space, etc.) are linear hypotheses, used once per dispatch, no copying. The polity's charter is itself an MLL structure: rules apply exactly once per firing.

The six-way composition traverses the lattice with a specific structural shape:
$$\underbrace{\mathrm{LL}/\text{foreign}}_{S_L} \to \underbrace{\mathbf{Eff}\text{-internal}}_{S_P} \to \underbrace{\mathrm{CLL}}_{S_C} \to \underbrace{\mathrm{CLL}_\top}_{S_A} \to \underbrace{\mathrm{MALL/MLL}}_{S_X} \to \underbrace{\mathrm{MLL}_\text{linear-premises}}_{S_R}$$
The composite is certifiable iff each component is *and* the strict-regime layer caps the composite — which is the lattice-level claim that a composite $*$-autonomous functor is bounded by its strictest-fragment factor when the path through the lattice ends in MLL.

The May 2026 surveys' framing of *the hardest unsolved intersection* was the engineering articulation of what the categorical framework now names: certifying that the typed sub-$*$-autonomous-categories of $\mathbf{CGS}$ compose under the cobordism category $\mathrm{Cob}_\mathrm{settling}$, with composite certifiability inherited from the strictest fragment in the composition. The substrate's certifiability gate reads the projection of this composite into the $K_4$-isotypic decomposition.

## §7 — Open frontier, narrowed

Given what §5 has authored and what §6 lifts, the survey's open frontier is narrower than either an unawareness of §5 or an unawareness of §6 would draw. Of the four questions the prior draft named open, *all four now resolve to sketch-status* on a closer re-reading of the corpus (§§7.1–7.4). One residual identification ($\mathbf{Eff} \simeq \mathcal{Kl}(!_{\mathbf{CGS}})$ as CCCs exactly) remains open in the informant computing corpus; the FAdRS-swarm theory's per-agent settling-as-knowledge claim and its aperiodic-regime convergence (§7.4) both depend on this identification.

### 7.1 The technical-stigmergy status of the FARS substrate — resolves (sketch)

The prior draft of this question held it as the first of four open. A re-reading of [`predicated-computing/morphisms/retraction.md`](../../../theories/theories/engineering/theories/tech/theories/computing/theories/predicated-computing/morphisms/retraction.md) against §2.4's closure-algebra-coalgebra correspondence and §6's categorical frame closes it — at sketch-status, the same level the predicated-drone-swarm sub-theory holds.

**The piece previously missed.** The substrate has *two* declared retraction modes, each of which preserves $\leq_k$-monotonicity at the appropriate level of analysis. *Repair retraction* creates a new settling indexed by post-repair ordinals; the original settling ends at the repair point; monotonicity holds *within* each settling and the boundary is a witnessed substrate event. *Sublocale-bounded retraction* changes an application's nucleus; the cell *still exists* in the predication-graph store but is no longer visible to that application; the sublocale's own settling continues monotonically. Neither mode deletes; both are append-only at the event-log level. The substrate has no value-decay; it has *visibility-decay relative to an application sublocale*, and *settling-boundary events* recorded as substrate content.

**The two structural analogs of evaporation.** Combining the retraction discipline with the $\mathrm{Cl}$-algebra / $\mathrm{Cl}^*$-coalgebra correspondence of §2.4 (under Jung-Rivieccio duality) and the $K_4$-equivariant cohomology of §2.6:

1. *Sublocale-nucleus evolution.* From any application's point of view, cells fade from visibility as the application's nucleus tightens. The cell remains in storage; the application's substrate view loses it. This satisfies the technical role of evaporation — *information that no longer matters to a given agent becomes invisible to that agent's response* — without deleting anything from the underlying substrate. The corresponding `?A`-side weakening in linear logic is exactly the structural shape: discarding on the negative side without violating MALL's no-copy/no-discard on the positive side. Categorically: the counit $\epsilon^* : \mathrm{Cl}^*(\mathcal{E}^*) \to \mathcal{E}^*$ of the dualized closure 2-comonad is the projection that forgets the coalgebra's structural enrichment when it becomes redundant.

2. *$K_4$-sector migration.* Under the equivariant cohomology decomposition, cells migrate between isotypic sectors $H^1_\text{id}, H^1_{\chi_\sim}, H^1_{\chi_-}, H^1_{\chi_{\sim\circ-}}$ as new evidence arrives. A cell whose content stays the same can shift its role in the certification gate. This bounds the cell's *influence over time* cohomologically — its action on dispatch decisions can fade by migrating away from the safety-critical sectors.

Both are substrate-content events (witnessed in the event log), independent of $N$ (they happen on substrate alone, not per-agent), and bounded (by $\top, \bot$ in $\mathbf{FOUR}$ and by $H^{\geq 2} = 0$ for the cohomology). They satisfy the technical role of classical evaporation without violating $\leq_k$-monotonicity.

**The cost-decoupling theorem, separated.** Classical $O(N + |L|)$ comes from $O(1)$ per-agent cost. For FAdRS-swarms, decompose:

- $O(|L|)$ closure-rule application — substrate-layer, MALL, cell-wise, *independent of $N$*.
- $O(N)$ depositions — each agent emits one witness at $O(1)$ *substrate-layer cost*.
- $O(N)$ reads — each agent's bounded wavefront read at $O(1)$ *substrate-layer cost*.
- Plus: $O(N \cdot c_\text{LL})$ agent-layer inference cost — *consultation*, not coordination, lives in LL/foreign outside the MALL substrate.

The classical theorem's premise was $O(1)$ per-agent. For FAdRS the per-agent substrate-layer cost *is* $O(1)$ (one cell write, one bounded wavefront read); the LLM inference cost is a separable per-agent consultation cost living at a different position in the linear-logic fragment lattice. The decoupling theorem transfers verbatim when *coordination cost* is measured in substrate-layer (MALL) operations.

> **FAdRS substrate-layer stigmergy (sketch theorem).** *The FARS substrate is a stigmergic trace field in the technical sense at the substrate-coordination layer. Location space $L$ is the directory tree with relation-frontmatter adjacency; value space $V$ is $\mathbf{FOUR}$ (from $\mathbf{Eff}$ via §6.1); deposition is the `admit` morphism; field-state evolution is the closure 2-monad iteration in $\mathcal{Kl}(!)$ (§6.3); evaporation is sublocale-nucleus evolution plus $K_4$-sector migration (the $\mathrm{Cl}^*$-coalgebra counit and the equivariant cohomology dynamics); boundedness is given by $\top, \bot$ in $\mathbf{FOUR}$ and by $H^{\geq 2} = 0$ in the cohomology. Per-step coordination cost is $O(N + |L|)$ in substrate-layer MALL operations; per-step consultation cost is $O(N \cdot c_\text{LL})$ at the agent-layer LL/foreign and is additive, not multiplicative, because no inter-agent operation appears in the substrate-layer cost decomposition.*

**Proof obligations for promotion to proved-status:**

- That sublocale-nucleus evolution satisfies all four well-behavedness properties of [`environment-trace-field`](../../../theories/theories/engineering/theories/tech/theories/computing/theories/continuous-computation/theories/artificial-intelligence/theories/swarm-intelligence/objects/environment-trace-field.md) — boundedness below, boundedness above, monotone evaporation between deposition events, bounded deposition — under the categorical translation given here.
- The bounded-wavefront read at $O(1)$ substrate-layer cost regardless of $|L|$ — this depends on the [`wavefront-locality-via-cohomology-vanishing`](../../../theories/theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/wavefront-locality-via-cohomology-vanishing.md) theorem in predicated-computing/theorems/.
- A formal statement of the substrate-layer/consultation-layer cost separation as a corollary of the $\mathbf{Eff} \cap \mathrm{MALL}$ vs. LL/foreign categorical split established in §6.6.

### 7.2 Total-cost decoupling under non-$O(1)$ per-agent cost — resolves (sketch)

§7.1 separated coordination from consultation as additive, not multiplicative; this question asked about the *ratio* between them. A second piece of prior thought closes it: the polity's aperiodic-regime commitment (§1.3, §2.5) combined with *aim-generativity* from the predicated-work corpus.

**The piece previously missed.** Per-step total cost has two terms:

- *MALL-layer (substrate-coordination).* $r_\Gamma \cdot O(|L|)$, where $r_\Gamma$ is the rate of $\Gamma$-mechanism firings per substrate-step — closure-2-monad iterations driven by *existing* witnesses, generating new aims without LL invocation.
- *LL-layer (consultation).* $r_\eta \cdot O(c_\text{LL})$, where $r_\eta$ is the rate of LL invocations per substrate-step and $c_\text{LL} \sim 10^{10}$–$10^{12}$ FLOPs is the per-call cost.

These live at different positions in the linear-logic fragment lattice (§6.6): MALL versus LL/foreign. The substrate-bound regime requires the MALL-layer term to dominate, which yields the *aim-frontier ratio*:
$$\frac{r_\eta}{r_\Gamma} \;\leq\; \frac{|L|}{c_\text{LL}}.$$

**Three structural commitments achieve the discipline:**

1. *Aperiodicity guarantees $r_\Gamma > 0$ uniformly.* A polity in the aperiodic regime ($\kappa \geq \omega_1$) has closure firings at every substrate-step — the closure 2-monad never stabilizes against any countable admission sequence, so the substrate is always doing autonomous work on existing witnesses. Strict-regime polities ($\kappa < \omega$) stabilize and stop; aperiodic polities don't.

2. *Aim-generativity ensures $r_\Gamma$ is non-trivial.* The $\Gamma$-mechanism in [`predicated-work/objects/enterprise.md`](../../../theories/theories/humanities/theories/sociology/theories/work/theories/predicated-work/objects/enterprise.md) is exactly the closure rule that generates *new* aims from existing ones. Aim-generativity is a structural commitment of the polity's hard core $C$, not a fortunate accident; it is what distinguishes an *endeavor* (sustained aim-generation; perpetual aperiodic settling) from a *project* (terminates at completion).

The third condition — that the consultation rate $r_\eta$ is rate-limited to a level that keeps the aim-frontier ratio bounded — is *governance-regime-specific*. The kyriarchical realization rate-limits $r_\eta$ via the captain's attestation pace under MHC (see [`kyriarchical-agentics-may-2026.md`](kyriarchical-agentics-may-2026.md), §6). The 561 Group's kin-relational realization rate-limits $r_\eta$ via consensus-by-withdrawal and kin-recognition cycles; the rate-limiting mechanism differs but the framework-level cost-decoupling theorem holds in both cases.

**The load-bearing finding.** The polity's aperiodicity is *not just* a regime classification; it is the structural condition that makes the swarm computationally tractable. The reason the polity's function lives at $\kappa \geq \omega_1$ is precisely so that the substrate can keep working autonomously between LL invocations. A polity in the strict regime would saturate, then need fresh LL consultations to do anything further — and the LL cost would dominate. The aperiodic regime is what makes $\Gamma$-firings produce $r_\Gamma \cdot |L|$ work per step indefinitely, allowing the consultation cost to amortize across many closure passes.

**Quantitative.** For LLM at $c_\text{LL} \sim 10^{10}$ FLOPs and substrate at $|L| \sim 10^6$ cells (with per-cell closure at $\sim 10^2$ FLOPs), the discipline requires $r_\eta / r_\Gamma \leq 10^{-4}$ — *one LL consultation per ten thousand $\Gamma$-driven closure firings*. For LLM at $10^{12}$ and $|L| \sim 10^4$ the ratio tightens to $10^{-8}$. Larger LLMs and smaller substrates require sparser consultations.

> **Total-cost decoupling (sketch theorem).** *Per-step total cost for an agentic drone swarm is substrate-bounded — $O(N + |L|)$ — iff the consultation rate $r_\eta$ satisfies the LL$\to$MALL projection-rate discipline $r_\eta \leq r_\Gamma \cdot |L| / c_\text{LL}$. The discipline is achieved when (i) the polity is in the aperiodic regime (guarantees $r_\Gamma > 0$), (ii) the polity's function is aim-generative (ensures $\Gamma$-firings produce new content), and (iii) the governance regime rate-limits $r_\eta$ to the level required by the inequality. For polities meeting these conditions, the swarm's total cost is substrate-bound; the LLM consultations amortize across the substrate's autonomous closure work.*

**Proof obligations for promotion to proved-status:**

- A formal definition of $r_\Gamma$ as a measure on the closure 2-monad's iteration against the increment sequence $U$ — what counts as a $\Gamma$-firing vs. an $\eta$-firing in the $U$ decomposition.
- The function-as-aperiodic-settling theorem in [`predicated-work/theorems/function-as-aperiodic-settling.md`](../../../theories/theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/function-as-aperiodic-settling.md) lifted to provide the structural lower bound on $r_\Gamma$ under aperiodicity.
- A regime-by-regime formal statement of the rate-limiting mechanism (kyriarchical: captain-attestation under MHC; kin-relational: consensus-by-withdrawal and kin-recognition cycles; etc.), each surveyed in the appropriate regime-specific survey.

### 7.3 Cross-polity dispatch certifiability — moved to kyriarchical-agentics

The cross-polity dispatch certifiability question — under what conditions one polity's chain may license dispatch against another polity's substrate — is a kyriarchical-governance-specific question. *Dispatch certifiability* itself is a kyriarchical apparatus (§2.6 pointer): the closure rule that refuses dispatch when safety-critical $K_4$-sectors are non-vanishing. The Mayer-Vietoris federation cohomology that decomposes the cross-polity gate is a general structural fact, but its *use as a gate* is kyriarchical.

The sketch theorem has been moved to [`kyriarchical-agentics-may-2026.md`](kyriarchical-agentics-may-2026.md), §7. What survives here as general structural content: the Mayer-Vietoris long exact sequence for parallel-composition cohomology is the framework's account of how federated cohomology decomposes from constituent cohomologies and overlap cohomology, with disagreement-pairs living in $\ker(\delta)$ and not contributing to the federation-level $H^1$. This is a fact about the framework regardless of governance regime; what each regime *does* with the fact (refusing dispatch via a gate vs. adjudicating through kin-relational machinery vs. other) is regime-specific.

The previously identified load-bearing finding — *cross-polity disagreement does not refuse certification at the kyriarchical level* — stands and is recorded in the kyriarchical-agentics survey. The corresponding general-structural finding here: *cross-arena disagreement in parallel composition is recorded as substrate content (in the bilattice's $\top$ value) and lives in $\ker(\delta)$; how each governance regime metabolizes that disagreement is regime-specific*.

**General structural fact retained here:** For arenas $A, B$ in $\mathbf{CGS}$ with parallel composition $A \| B$ and overlap $A \cap B$ (entity-mobility via nominal-set name-passing with $\mathrm{FSym}(\mathbb{A})$-equivariance), the Mayer-Vietoris long exact sequence
$$\cdots \to H^n(\mathcal{F}^{A \cup B}) \xrightarrow{\mathrm{res}} H^n(\mathcal{F}^A) \oplus H^n(\mathcal{F}^B) \xrightarrow{\mathrm{diff}} H^n(\mathcal{F}^{A \cap B}) \xrightarrow{\delta} H^{n+1}(\mathcal{F}^{A \cup B}) \to \cdots$$
decomposes the federated cohomology, with $H^{\geq 2} = 0$ on the platform per [`coordination-cohomologically-bounded-by-h1`](../../../theories/theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/distributed-coordination-platform/theorems/coordination-cohomologically-bounded-by-h1.md). Disagreement-pairs $(\alpha_A, \alpha_B)$ with $\iota_{AB}^*\alpha_A \neq \iota_{AB}^*\alpha_B$ live in $\mathrm{Im}(\mathrm{diff}) = \ker(\delta)$, so cross-arena disagreement contributes no federation-level $H^1$ class. The federation-level structural content lives in $\mathrm{coker}(\mathrm{diff}) \cong \mathrm{Im}(\delta)$: overlap-content that no pair of constituent positions can collectively express. This is a structural fact about the framework, regardless of governance regime. The kyriarchical use of this fact (as a dispatch certifiability gate) is in the kyriarchical-agentics survey; how kin-relational governance regimes handle the same structural content is regime-specific.

### 7.4 The aperiodic-regime analog of a swarm convergence criterion — resolves (sketch)

The prior draft framed this as the deepest of the four open questions, expecting it to need derivation or web search. A second look at the corpus closes it at sketch-status — two findings I had cited but not surfaced. First, the `aperiodic-regime-classification` theorem makes the aperiodic-classifying-invariant the *complete* MLD-invariant: $v \sim_\text{MLD} v'$ iff $\mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v')$; cohomological equivalence in $H^1$ classifies aperiodic settlings completely. Second, [`crdt-convergence-via-cohomological-calm`](../../../theories/theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence-via-cohomological-calm.md) shows that in *strict and Scott-continuous* regimes (where $H^1 = 0$ structurally), CRDT convergence holds *by abstract nonsense* from codomain vanishing in Mayer-Vietoris. In aperiodic and transfinite-bounded regimes, $H^1 \neq 0$ globally, so the abstract argument fails — but the $K_4$-equivariant decomposition (§2.6) refines $H^1$ into four isotypic sectors, and *vanishing in some sectors but not others is weaker than global vanishing*.

This is the seam. The convergence criterion lives at the level of *sector-selective* stabilization of the aperiodic-classifying-invariant — not the invariant as a whole. Which sectors must stabilize, and which must remain live, is governance-regime-specific.

**The construction.** For a swarm of aperiodically-settling polities $A_1, \ldots, A_n$, the joint settling $v^{\|}$ on the parallel composition $A_1 \| \cdots \| A_n$ in $\mathbf{CGS}$ has the aperiodic-classifying-invariant
$$\mathrm{cl}\text{-}\mathrm{inv}(v^{\|}) \;\in\; H^1\!\left(\mathbf{T}^*_{\leq \omega_1},\ \mathcal{F}_{U^{\|}}\right).$$
The $K_4$-equivariant decomposition projects this into four sectors:
$$\mathrm{cl}\text{-}\mathrm{inv}(v^{\|}) \;=\; \big(\mathrm{cl}^{\mathrm{id}},\ \mathrm{cl}^{\chi_\sim},\ \mathrm{cl}^{\chi_-},\ \mathrm{cl}^{\chi_{\sim\circ -}}\big).$$

> **Aperiodic-regime swarm convergence (sketch theorem).** *A swarm of aperiodically-settling polities $A_1, \ldots, A_n$ converges in the cohomological sense iff some non-empty proper subset of the four $K_4$-equivariant sectors of its aperiodic-classifying-invariant stabilizes (vanishes from some countable stage $\tau_0$ onward), while the complementary subset generically remains nonzero. Which sectors stabilize is governance-regime-specific. Categorically: the joint state converges in the cofibered limit topology to the cofree-`!`-coalgebra fixed point in $\mathcal{Kl}(!_{\mathbf{CGS}})$ on the parallel composition, with convergence measured by sector-selective cohomological stability.*

In the kyriarchical-agentics realization, the safety-critical sectors $H^1_{\chi_-}, H^1_{\chi_{\sim\circ -}}$ are the ones that must stabilize (for the dispatch certifiability gate to license action); the others are aim-generative and remain live. That specialization is surveyed in [`kyriarchical-agentics-may-2026.md`](kyriarchical-agentics-may-2026.md), §8. In the 561 Group's kin-relational realization, the relevant sectors and the meaning of their stabilization are different — wolakȟota's stabilization corresponds to conduct-cells stabilizing, not specifically to $H^1_{\chi_-}$ vanishing; the *structural* sector-selectivity is the same, but *which* sectors are the load-bearing ones differs. That regime-specific reading is the subject of the wolakȟota survey.

**The classical-analog table.** Each classical swarm-convergence hypothesis has a structural agentic-drone-swarm analog:

| Classical hypothesis | Framework analog | Categorical home |
|---|---|---|
| ACO bounded-pheromone-update (Dorigo-Stützle 2004) | Bounded cell-value updates | $\top, \bot$ bounds of $\mathbf{FOUR}$ (intrinsic to $\mathbf{Eff}$ per §6.1) |
| PSO parameter constraint (Trelea 2003; Clerc-Kennedy 2002) | Coherence conditions on closure-rule-system | Lax-idempotence $\eta\mathrm{Cl} \dashv \mu \dashv \mathrm{Cl}\eta$ (§2.4) |
| Bounded-entropy local-rule (emergence-requires-local-determinism) | Bounded $r_\Gamma$ in aim-frontier ratio | The §7.2 discipline |
| Probabilistic convergence to global optimum | Sector-selective cohomological stability | $K_4$-projection of $\mathrm{cl}\text{-}\mathrm{inv}$ |
| Convergence in distribution to stable region | Cofree-`!`-coalgebra fixed point | Limit in $\mathcal{Kl}(!_{\mathbf{CGS}})$ |

**The load-bearing finding.** Convergence in the aperiodic regime is *structurally sector-selective*: some $H^1$-content stabilizes while other $H^1$-content remains perpetually live. The aperiodic regime's structural strength is that it permits this — strict-regime polities cannot, because they have $H^1 = 0$ globally and cannot distinguish stabilizing from non-stabilizing content within $H^1$. A polity *needs* the sector-selective option: certain content (whatever the governance regime designates as load-bearing for action-licensing) must stabilize; certain other content (aim-generativity) must not. Sector-selective convergence is not a defect of the aperiodic regime; it is the regime's structural strength, *and the governance regime selects which sectors play which role*.

**Connection to the $\mathbf{Eff} \simeq \mathcal{Kl}(!_{\mathbf{CGS}})$ open identification.** If this identification holds exactly, the cofree-`!`-coalgebra in $\mathcal{Kl}(!_{\mathbf{CGS}})$ is *the* $\mathbf{Eff}$-internal universal object — Kleene's second recursion theorem's fixed point lifted to the categorical level. Sector-selective convergence of a FAdRS-swarm = stabilization of a recursion-theoretic invariant in $\mathbf{Eff}$. The remaining open identification (§8 ledger below) is therefore the deepest tie between the FAdRS-swarm theory and the recently-proved theory-of-computing apparatus.

**Proof obligations for promotion to proved-status:**

- The $K_4$-equivariant decomposition of the aperiodic-classifying-invariant lifts cleanly to the parallel composition $A_1 \| \cdots \| A_n$ — i.e., the $K_4$-action commutes with $\|$ at the cohomology level.
- Preservation of safety-critical-sector vanishing under bidirectional event exchange (the §7.3 federation-convergence apparatus with $K_4$-action equivariance).
- The cofree-`!`-coalgebra fixed point exists as the categorical limit of the closure 2-monad's iteration in the aperiodic regime; depends on the $\mathbf{Eff} \simeq \mathcal{Kl}(!_{\mathbf{CGS}})$ identification or a direct categorical argument.

## §8 — Settled, sketched, open

**Settled (within 561's own commitments — `prose/claims/`):**

- A FARS directory is a sub-doctrine of a predication hyperdoctrine ([`fars-directory-is-predication-categorical-theory`](../../claims/fars-directory-is-predication-categorical-theory.md), status: draft; the polity has canonicalized the structuration by decision, so operations do not wait on the proof).
- The 561 polity's function settles aperiodically; convergence is not the criterion for progress.
- The swarm is distinct from the polity: the polity decides; the swarm does.

**Settled (in the polity's recently-proved theory-of-computing apparatus — informant `theories/.../computing/prose/claims/`):**

- The theory of computing is $\mathbf{CGS}$ (concurrent games with symmetry); the four major computational paradigms — sequential game semantics, nominal computation, session-typed concurrency, Turing-complete realizability — all embed as full sub-$*$-autonomous-categories or Kleisli sub-CCCs.
- $\mathbf{Eff} = RT(\mathcal{K}_1)$ is the minimum categorical level for the theory of computing; halting undecidability and Rice's theorem are *theorems* of $\mathbf{Eff}$, not axioms.
- $\mathbf{FOUR}$ is *intrinsic*: the image of $\Omega_\mathbf{Eff}$ under the double-negation nucleus via $\rho(P) = (\neg\neg P, \neg\neg\neg P)$. Rice's theorem forces the $\bot$ value for non-trivial behavioral predicates of programs.
- The typed subtheory lattice is the linear-logic fragment lattice MLL $\subset$ MALL $\subset$ \{ILL, CLL\} $\subset$ LL; each inclusion is a full $*$-autonomous embedding.
- Predicated computing is the intersection $\mathbf{Eff} \cap \mathrm{MALL}$ inside $\mathbf{CGS}$: $\mathbf{FOUR}$ from $\mathbf{Eff}$, MALL-fiber-algebra for predication composition and joins, Medvedev-filter nuclei for closure rules.

**Settled by §6's categorical lift (this survey's contribution; sketch-status):**

- The FARS substrate runs in $\mathbf{Eff}$; its bilattice values are computational truth values internal to the effective topos, not paraconsistent-by-convention.
- The closure 2-monad's lax-idempotence is the `!`-comonad's structural shadow under $\mathbf{Eff} \simeq \mathcal{Kl}(!)$; settling is computation in $\mathcal{Kl}(!)$; resource replication and knowledge accumulation are the same comonadic structure.
- Federation is parallel composition $\|$ in $\mathbf{CGS}$; entity-mobility across federated polities is nominal-set name-passing in $\mathrm{FSym}(\mathbb{A})$-equivariant arenas.
- Embodied handedness is Player/Opponent duality $(-)^\perp$; symmetric peers are a special case, asymmetric drones are the generic case in $\mathbf{CGS}$.
- The three-layer architecture (foundation-model / optimization-control / certified-safety-shield) is a stratification through the linear-logic fragment lattice: LL/foreign $\to$ ILL $\to$ MLL/MALL. This architecture is a *kyriarchical* engineering structure (the captain-accountable safety shield is what makes the layered chain MHC-compliant); the categorical fragment-lattice mapping is general but the use-as-safety-architecture is in [`kyriarchical-agentics-may-2026.md`](kyriarchical-agentics-may-2026.md), §5.
- The six-way intersection composition traverses the fragment lattice: $\mathrm{LL}/\text{foreign} \to \mathbf{Eff} \to \mathrm{CLL} \to \mathrm{CLL}_\top \to \mathrm{MALL/MLL} \to \mathrm{MLL}_\text{linear-premises}$. The composition is general structural; the *certifiability inheritance* from the strictest factor is the kyriarchical gate's algebra.

**Settled (in the informant predication-categories corpus, available to 561 with the lift):**

- The four-bilattice carries two parallel adjoint systems; equality is derived twice — classically (via $\exists^t$) and paraconsistently (via $\exists^k$).
- The four predicate-category generators are $\mathrm{Sym}(E)$-forced (exhaustiveness theorem); the base category is not chosen but forced.
- Settling is a transfinite $\leq_k$-monotone orbit, equivalent to a coalgebra against an increment sequence; saturation is iteration to the closure ordinal.
- The closure 2-monad is Kelly-Lack lax-idempotent (KZ); the closure-rule-system realizes it as substrate content.
- The four-regime dichotomy in $\kappa$; the equivariant cohomology decomposition under $K_4$ into four isotypic sectors $H^1_{\mathrm{id}}, H^1_{\chi_\sim}, H^1_{\chi_-}, H^1_{\chi_{\sim\circ -}}$ (the *use* of two of these as a dispatch certifiability gate is governance-specific and treated in [`kyriarchical-agentics-may-2026.md`](kyriarchical-agentics-may-2026.md), §3).
- Federation convergence is built into substrate algebra (CRDT-shape $\vee_k$ followed by closure); convergence is order-independent.
- Federation discipline by regime: endpoint-exchange suffices in strict/Scott-continuous regimes; trajectory must be shipped in transfinite-bounded/aperiodic regimes.
- Meaningful human control as a bilattice-meet of four $\Pi_1$ conditions is the *kyriarchical* governance instantiation of substrate-level guarantees; treated in [`kyriarchical-agentics-may-2026.md`](kyriarchical-agentics-may-2026.md), §4.

**Settled (in the informant swarm-intelligence corpus, applicable to FAdRS-swarms with the reservations of §3.4):**

- Swarm-vs-orchestration is a structural dichotomy in three conditions (scalability, homogeneity, stigmergy); no continuous interpolation.
- Stigmergy decouples coordination cost from population, *conditional on* $O(1)$ per-agent cost: $O(N + |L|)$ per step.
- Emergence requires bounded per-step local-rule entropy independent of $N$, $T$, environment state.
- LLM-based agent collectives violate scalability by $10^7$–$10^{11}$× and typically violate local-determinism and local-rule coordination; classical convergence theorems do not transfer.
- Stigmergy is distinct from shared memory, message passing, blackboards, and gossip; the channel of coordination is the environment itself.

**Sketched (in the polity's already-authored predicated-drone-swarm sub-theory, all theorems status: `sketch`):**

- *Embodied handedness* as the load-bearing concept distinguishing the sub-theory from the AOP parent.
- *Predicated drone collective fails classical stigmergy* — at the embodied layer, due to handedness asymmetry; substrate-side stigmergy survives via closure 2-monad lax-idempotence (Part 2).
- *Seven-axis taxonomy* as base coordinates of $\mathcal{C}^\mathrm{drone}$; predication fibration inherits BC, closure 2-monad, four-regime classification.
- *Three-layer hierarchical safety architecture* as cobordism composition $S_3 \circ S_2 \circ S_1$ in $\mathrm{Cob}_\mathrm{settling}$, with strict-regime layer-3 capping the composite ordinal.
- *Six-way intersection composition* — the May 2026 surveys' hardest unsolved intersection composes via cobordism composition in $\mathrm{Cob}_\mathrm{settling}$; certifiability composes when the safety-critical cohomology sectors remain zero through the composition.
- *Coordination cohomology under asymmetric handedness* — handedness-asymmetric edges contribute generators to $H^1_{\chi_\sim}$ (frame-disagreement sector), not to the safety-critical sectors. Asymmetry is recorded, not refused.
- *Embodied cost quantale* extends $(\mathrm{fuel}, \mathrm{dollars}, \mathrm{tokens})$ to $(\mathrm{fuel}, \mathrm{dollars}, \mathrm{tokens}, \mathrm{joules}, \mathrm{bandwidth})$; Pareto-min ranks accordingly.

**Resolved by this survey (sketch-status; promotion to proved requires the obligations named in §7):**

- *The FAdRS substrate-layer stigmergy sketch theorem* (§7.1). The FARS substrate is a stigmergic trace field in the technical sense at the substrate-coordination layer; evaporation is sublocale-nucleus evolution plus $K_4$-sector migration (the $\mathrm{Cl}^*$-coalgebra counit and the equivariant cohomology dynamics); the classical $O(N+|L|)$ cost-decoupling bound transfers verbatim when coordination cost is measured in substrate-layer MALL operations and consultation cost is held separate at the agent-layer LL/foreign position. The resolution combines `retraction`'s two-mode discipline, the closure-algebra-coalgebra correspondence under Jung-Rivieccio duality, the $K_4$-equivariant cohomology decomposition, and §6's categorical frame.
- *Total-cost decoupling sketch theorem* (§7.2). Per-step total cost is substrate-bounded $O(N+|L|)$ iff the consultation rate satisfies the aim-frontier ratio $r_\eta / r_\Gamma \leq |L| / c_\text{LL}$. The discipline is achieved structurally by aperiodicity (guarantees $r_\Gamma > 0$), aim-generativity (ensures $\Gamma$-firings produce new content), and a governance-regime-specific rate-limiting mechanism on $r_\eta$. *Load-bearing finding:* the polity's aperiodicity is the structural condition that makes agentic-drone-swarms computationally tractable — strict-regime polities would saturate, then become consultation-bound; aperiodic polities amortize LL costs across perpetual autonomous closure work. The kyriarchical rate-limiting mechanism (captain-attestation under MHC) is in [`kyriarchical-agentics-may-2026.md`](kyriarchical-agentics-may-2026.md), §6.
- *Cross-arena parallel-composition cohomology theorem* (§7.3). For arenas $A, B$ in $\mathbf{CGS}$, the Mayer-Vietoris long exact sequence decomposes the federated cohomology with $H^{\geq 2}=0$ on the platform. Disagreement-pairs $(\alpha_A, \alpha_B)$ on the overlap live in $\ker(\delta)$ and contribute no federation-level $H^1$ class. *General structural finding:* the federation-level cohomological content lives in $\mathrm{coker}(\mathrm{diff})$ — overlap-content unrepresentable by constituent positions. The kyriarchical *use as a dispatch certifiability gate* is in [`kyriarchical-agentics-may-2026.md`](kyriarchical-agentics-may-2026.md), §7.
- *Aperiodic-regime sector-selective convergence sketch theorem* (§7.4). The swarm converges in the cohomological sense iff some non-empty proper subset of the four $K_4$-equivariant sectors of its aperiodic-classifying-invariant stabilizes from some countable stage onward, while the complementary subset remains nonzero. *Load-bearing finding:* convergence in the aperiodic regime is structurally sector-selective — the regime *permits* the sector-selective option and the polity *needs* it (some content must stabilize for action-licensing; some must not stabilize for aim-generativity). Which sectors play which role is governance-regime-specific; the kyriarchical specialization (safety-critical sectors $H^1_{\chi_-}, H^1_{\chi_{\sim\circ-}}$ must stabilize) is in [`kyriarchical-agentics-may-2026.md`](kyriarchical-agentics-may-2026.md), §8.

**Open (no current commitment in 561 or its informant corpora; the categorical frame has narrowed but not closed):**

- Whether $\mathbf{Eff} \simeq \mathcal{Kl}(!_\mathbf{CGS})$ as CCCs exactly — the open identification flagged in [`typed-subtheory-lattice-is-linear-logic-fragment-lattice`](../../../theories/theories/engineering/theories/tech/theories/computing/prose/claims/typed-subtheory-lattice-is-linear-logic-fragment-lattice.md). The FAdRS-swarm theory's per-agent settling-as-knowledge claim (§6.3) and its aperiodic-regime convergence target (§7.4) both depend on this identification holding. This is the deepest residual tie between the FAdRS-swarm theory and the recently-proved theory-of-computing.

## §9 — What this survey did not do

This survey did not *lift* any informant material into 561's own concept / structure / transformer / claim layers. The mention of stigmergy, trace fields, embodied handedness, the seven-axis taxonomy, the three-layer architecture, the cobordism composition, the cost quantale — all of this is informant, much of it from a sub-theory authored against the May 2026 surveys' content. The 561 polity has not yet committed to any of it as its own root-level vocabulary at `prose/concepts/`, `code/structures/`, `code/transformers/`, or `prose/claims/`. The lift would be the *next* piece of work, and per the [`feedback_lift_slowly`](../../../../.claude/projects/-home-emsenn-561/memory/feedback_lift_slowly.md) memory, it should be conducted as a conversation, not as a rushed artifact.

This survey also did not draft a *theory* of FAdRS-swarms at root-FARS scope. The predicated-drone-swarm sub-theory of §5 is a theory of embodied-participant collectives under a layered control architecture; it does not address the FARS-to-FARS federation question that the §7.3 open frontier names. A root-FARS-scoped theory — `theories/.../flatfile-agentic-drone-resource-system-swarms/` with its own concepts, objects, morphisms, theorems — is the object of a future campaign. The path of that campaign is named by §7's open questions and by the lifts §5's sketch theorems and §6's categorical-frame mappings will support once they are turned into formal claims.

A small editorial note: the survey targets `prose/research/surveys/` (plural; the existing convention) rather than the singular path the prompt initially named, and the filename carries the `-may-2026` date suffix per the other four surveys in that directory. The choice was conservative-conforming, not silently divergent.

## §10 — References to the corpus

**561-native (`/`)**

- [`_index.md`](../../../_index.md) — polity-as-image.
- [`prose/concepts/561-swarm.md`](../../concepts/561-swarm.md) — stub.
- [`prose/concepts/dual-governance-context.md`](../../concepts/dual-governance-context.md) — the load-bearing dual-governance distinction (561 Group as kin-relational tiyóšpaye; RSC Quiescent as kyriarchical ship).
- [`prose/concepts/561-group.md`](../../concepts/561-group.md) — the 561 Group as Lakota tiyóšpaye.
- [`prose/research/surveys/kyriarchical-agentics-may-2026.md`](kyriarchical-agentics-may-2026.md) — the sibling survey for the kyriarchical-governance instantiation; carries the dispatch-certifiability machinery, MHC, three-layer hierarchical safety architecture, and the four sketch theorems' kyriarchical specializations that the present survey points at.
- [`2026-05-15-rsc-quiescent-may-2026.md`](../../../../../../../561-group-services-section/content/text/documents/articles/notes/2026/05/15/2026-05-15-rsc-quiescent-may-2026.md) — the ship-specific survey for the RSC Quiescent.
- [`2026-05-15-561-group-may-2026.md`](../../../../../../../561-group-services-section/content/text/documents/articles/notes/2026/05/15/2026-05-15-561-group-may-2026.md) — the polity-specific survey for the 561 Group.
- [`prose/claims/fars-directory-is-predication-categorical-theory.md`](../../claims/fars-directory-is-predication-categorical-theory.md) — draft.
- [`prose/narratives/unfolding-the-theory-behind-the-561-group.md`](../../narratives/unfolding-the-theory-behind-the-561-group.md) — draft; §1.1 posit, §2 mathematics, §3 epistemology, §4 substrate.
- [`prose/questions/what-is-the-theory-of-the-561-group.md`](../../questions/what-is-the-theory-of-the-561-group.md) — open.
- [`prose/memory/2026-05-15-fars-shape-is-what-561-has.md`](../../memory/2026-05-15-fars-shape-is-what-561-has.md).
- [`code/structures/rsc-quiescent.md`](../../../code/structures/rsc-quiescent.md) — the ship's substrate-side record (its kyriarchical-governance content is surveyed in the kyriarchical-agentics survey, not here).
- [`code/structures/meaningful-human-control.md`](../../../code/structures/meaningful-human-control.md); [`code/structures/verify-certifiability-sectors.md`](../../../code/structures/verify-certifiability-sectors.md) — kyriarchical-governance machinery; their use here is by pointer only.
- [`governance/work/projects/audit-substrate-bootstrap/_index.md`](../../../governance/work/projects/audit-substrate-bootstrap/_index.md) — the campaign that produced Pass 1 (witness-chain-record, certifiability sectors), Pass 2 (predicated-drone-swarm theory), pending Pass 3 (closure firing).

**Informant — theory of computing (`theories/.../computing/`)**

- `_index.md`; `questions/{what-is-the-theory-of-computing, what-are-the-subtheories-of-computing}.md`.
- `prose/claims/{theory-of-computing, eff-is-minimum-level, k1-is-initial-turing-complete-pca, four-is-image-of-omega-under-double-negation, opca-equivalent-to-reat, complexity-excludes-from-subtopos-lattice, arithmetical-hierarchy-excludes-from-subtopos-lattice, modified-realizability-is-a-sibling-topos, typed-subtheory-lattice-is-linear-logic-fragment-lattice, f-dial-eff-to-cgs-exists}.md`.
- `prose/research/exploring-the-question-of-the-theory-of-computing.md`.
- `code/structures/{cgs, dial-eff, eff, four, k1, opca, pca}.md`.
- `theories/{predicated-computing, decidability, continuous-computation, linear-computation, interactive-computation, concurrent-computation, computability, type-theory, probabilistic-computation}/_index.md`.
- `theories/predicated-computing/prose/claims/theory-of-predicated-computing.md` — the load-bearing bridge: predicated computing is $\mathbf{Eff} \cap \mathrm{MALL}$ inside $\mathbf{CGS}$.

**Informant — predication category theory (`theories/.../predication-categories/`)**

- `objects/{bilattice, four-bilattice, twist-product, residuated-lattice, predicate-category, predication-fibration, predication-hyperdoctrine, predication-settling, closure-ordinal, settling-cobordism-category, aperiodic-classifying-invariant, klein-four-gauge-bundle, bigraded-settling-cohomology}.md`.
- `morphisms/closure-2-monad.md`; `morphisms/predicate-{specialization, converse, subject-projection, object-projection}.md`.
- `theorems/{predicate-generator-exhaustiveness, four-regime-dichotomy, equivariant-cohomology-decomposition, jung-rivieccio-duality, frobenius-for-fusion-fails, frobenius-for-knowledge-and-truth-meets, closure-2-monad-lax-idempotence, settling-convergence, transfinite-settling-convergence, predication-settling-category-completeness, truth-knowledge-cohomology-long-exact-sequence, settling-cohomology-vanishes-above-degree-1, verdier-duality-bitopological-site, tqft-structure}.md`.
- `prose/narratives/{the-two-adjoint-systems, two-disentangled-kz-structures, priestley-route-significance, settling-dynamics-opener, regime-stratification-opener, bilattice-cohomology-opener}.md`.

**Informant — predicated-computing (`theories/.../predicated-computing/`)**

- `objects/{predicated-computer, predication-graph-store, event-log, closure-rule-system, application-sublocale}.md`; `concepts/{predication-substrate, closure-conditions, wavefront, two-store-coherence, reification, hash-discipline, witness}.md`; `morphisms/{settle, merge, traversal, retraction, closure-rule-application, emit-witness, admit}.md`.
- `theorems/{federation-convergence, four-position-substrate-entity-classification, settlement-determinism, closure-rule-system-realizes-closure-2-monad, umwelt-as-fiber-projection-with-coherence, witness-chain-as-proof-object, substrate-runtime-as-closure-driven-settling}.md`.
- `theories/database-platform/narratives/substrate-is-already-a-graph-database.md`.
- `theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/_index.md` — the FARS spec.

**Informant — swarm-intelligence (`theories/.../swarm-intelligence/`)**

- `_index.md`; `concepts/{stigmergy, scalability-premise, homogeneity, local-rule-coordination, swarm-coordinated-system, emergence, pheromone-trail}.md`; `objects/{environment-trace-field, pheromone-field, fitness-landscape, neighborhood, particle-state, swarm-population}.md`.
- `theorems/{swarm-vs-orchestration-dichotomy, stigmergy-decouples-coordination-cost, llm-swarms-fail-classical-conditions, emergence-requires-local-determinism, aco-convergence, pso-local-convergence}.md`.
- `questions/{stigmergic-context-engineering, when-do-llm-agents-form-a-swarm, hybrid-swarm-orchestration, swarm-vs-mas-formal-distinction}.md`.

**Informant — multi-agent (`theories/.../multi-agent/`)**

- `_index.md`; `concepts/{agent-orchestration, multi-agent-system, emergent-coordination, equilibrium-concept, mechanism-design, byzantine-fault-tolerance, social-choice}.md`; `narratives/the-orchestration-pattern.md`; `objects/agent-population.md`; `questions/when-do-llm-agents-coordinate.md`.

**Informant — predicated-drone-swarm (`theories/.../predicated-drone-swarm/`)**

- `_index.md` — the sub-theory.
- `concepts/{embodied-handedness, physical-precondition, control-layer-rejection, meaningful-human-control}.md`.
- `objects/{drone-record, control-layer-handoff, safety-envelope-cell, embodied-cost-coordinate, physical-budget-record, byzantine-resilience-witness}.md`.
- `theorems/{predicated-drone-collective-fails-classical-stigmergy, embodied-cost-quantale-extends-monetary, safe-envelope-precheck-as-bilattice-modal-suspension, meaningful-human-control-as-charter-c3-extension, coordination-across-handedness-asymmetric-participants, six-way-intersection-composition}.md`.

**External-but-cited (via informant references)**

- Castellan, Clairambault, Winskel 2014/2017 — concurrent games with symmetry; $\mathbf{CGS}$ is $*$-autonomous.
- Hyland 1982 — the effective topos $\mathbf{Eff}$; original construction.
- Hyland 2002 — $\mathbf{Eff} \simeq \mathcal{Kl}(!_{\mathbf{Dial}(\mathbf{Eff})})$; the Dialectica-game correspondence.
- Hyland-Ong 1996 — sequential game semantics; PCF full abstraction.
- Gabbay-Pitts 1999 — nominal sets; Fraenkel-Mostowski topos.
- Abramsky-Ghica-Murawski-Ong-Stark 2004 — full abstraction for the $\nu$-calculus.
- Caires-Pfenning 2010; Wadler 2012 — session-typed concurrency as classical linear logic.
- Girard 1987; Seely 1989; Abramsky-Mellies 1999 — linear logic and its game semantics.
- Belnap 1977; Dunn 1976; Fitting 1991 — the four-valued bilattice.
- Carboni-Celia Magno 1982; Rosolini 1986; Cockett-Hofstra 2008 — Turing categories, modest sets, exact completion.
- Grassé 1959 — origin of *stigmergy*.
- Reynolds 1987 — flocking model.
- Dorigo 1992; Dorigo & Stützle 2004 — Ant Colony Optimization.
- Kennedy & Eberhart 1995; Clerc & Kennedy 2002; Trelea 2003 — Particle Swarm Optimization.
- Bonabeau, Dorigo, Theraulaz 1999 — *Swarm Intelligence: From Natural to Artificial Systems*.
- Camazine et al. 2001 — *Self-Organization in Biological Systems*.
- Doan et al. 2025 — *LLM-Powered Swarms: A New Frontier or a Conceptual Stretch?* (arXiv 2506.14496).
- The May 2026 informant survey texts under `theories/.../agents/texts/`: *autonomous-agents-drone-swarms-standalone-report-may-2026*, *emergent-intelligence-drone-swarms*, *strategic-deployment-roadmap-drone-swarms*, *cyber-resilience-framework-for-decentralized-multi-agent-drone-swarms*.
