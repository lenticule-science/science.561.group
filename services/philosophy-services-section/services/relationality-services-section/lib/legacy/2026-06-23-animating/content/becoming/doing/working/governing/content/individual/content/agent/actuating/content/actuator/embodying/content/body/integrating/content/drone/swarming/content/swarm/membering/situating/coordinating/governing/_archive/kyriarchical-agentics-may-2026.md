---
name: kyriarchical agentics May 2026
description: Survey of kyriarchical agentics — the theoretical apparatus that supplies one specific governance instantiation of the agentic drone swarm. Captain-and-delegation-chain command structure, accountability non-transfer, dispatch certifiability gates over $K_4$-equivariant safety-critical sectors, meaningful human control as bilattice-meet, three-layer hierarchical safety architecture. Distinct from the agentic drone swarm framework itself (structure-agnostic; surveyed elsewhere) and from the Lakotaean relational governance the 561 Group operates under (kin-relational; surveyed elsewhere). The RSC Quiescent is the polity's kyriarchical-agentics instance.
status: draft
date-modified: 2026-05-15
---

# Kyriarchical agentics

Kyriarchical agentics names a theoretical apparatus: agentic systems governed by hierarchical command, with formal authority lodged in a captain at the top of a delegation chain.
Kyriarchy from κύριος (lord) — a structure of authority-from-above.
As a governance regime, it is one specific way of organizing an agentic drone swarm.
It is not the only way.
The 561 Group's own internal governance is *not* kyriarchical — it is kin-relational, operating under wolakȟota and consensus-by-withdrawal.
The 561 Group's *ship* — the RSC Quiescent — operates under kyriarchical agentics; the ship is the polity's external-operations arm, and the kyriarchical apparatus is what governs it.

The distinction is named in the corpus at [`prose/teaching/explanations/dual-governance-context.md`](../../teaching/explanations/dual-governance-context.md): *the 561 Group governs through Lakotaean relational closure rules internally (wolakhota, consensus-by-withdrawal, kin-cell primacy); the RSC Quiescent governs through a kyriarchical command structure for external operations.
Conflating the two closure-rule subsystems is the failure mode.* This survey treats the kyriarchical side of that dual structure as theoretical material in its own right — what kyriarchical agentics is as an apparatus, what its sketch theorems are, what its categorical home is, and how it sits as one instantiation of the broader agentic-drone-swarm framework.

The survey was originally entangled with the FAdRS-swarms survey, where I had imported kyriarchical-specific machinery as if it were constitutive of the agentic-drone-swarm framework.
It is not.
The FAdRS-swarms survey is being surgically corrected in parallel with this one's authoring; the present survey carries the extracted kyriarchical content with its proper framing.

## §1 — What kyriarchical agentics is

A *kyriarchical* governance structure lodges formal authority in a single position — the *captain* — at the apex of a *delegation chain* under which sub-authorities are scope-bounded, revocable, and traceable to the captain.
The structure is a *military-command composite modal frame*: each delegation link carries a deontic modality (permission, obligation, prohibition) that composes through the chain.
The corpus's substrate-side articulation is at [`code/structures/rsc-quiescent.md`](../../../code/structures/rsc-quiescent.md):

> Kyriarchial command — κύριος = lord; hierarchical.
> The formal structure is a military-command composite modal frame: captain → delegation chain, where each link is a delegation morphism with scope-bounded, revocable authority.
> The captain's accountability cells are $H^0$-invariant under chain extension: emsenn answers for every outcome on the ship.

The structural features are:

1. *A captain.* A single position holding the apex authority of the structure.
  Filled by a designated person (in the RSC Quiescent's case, emsenn).
  The captain's authority is a substrate cell whose value installs at commissioning and persists until decommissioning.
2. *A delegation chain.* Sub-authorities are issued by delegation morphisms with bounded scope and revocability.
  Each sub-authority's standing depends on the parent authority's continued recognition; revocation propagates downward through the chain.
3. *Accountability non-transfer.* The captain's accountability cells are $H^0$-invariant under chain extension.
  Whatever the chain dispatches, the captain answers for.
  Delegation transfers *authority to act*; it does not transfer *answerability for the action's consequences*.
4. *Scope-bounded dispatch.* Every action issued through the chain has a scope-bound that ties it to the chain it descends from.
  Acting outside scope is structurally invalid; the dispatch certifiability gate (§3) refuses dispatch that would exceed scope.

The categorical home of this apparatus is the predicated-governance theorem `military-command-chain-as-modal-composition` (cited in the rsc-quiescent record).
The chain is a composite modal frame in which each delegation morphism is a modal composition; the captain's accountability is a structural property of the frame's apex.

Kyriarchical agentics is not *all* of agentic governance.
It is *one specific governance regime*, well-suited to coordinated external operations where a unified directional voice is required (the ship navigating waters not under its own jurisdiction, conducting business with entities outside its polity's governance, etc.).
It is structurally distinct from kin-relational governance, consensus governance, or other governance regimes that distribute authority differently.
The structural distinction matters because conflating the regimes — applying kyriarchical apparatus to a kin-relational polity, or vice versa — is the named failure mode of the corpus.

## §2 — The relation to the agentic drone swarm framework

The agentic drone swarm framework supplies a categorical apparatus for embodied-participant collectives — embodied handedness as Player/Opponent duality in $\mathbf{CGS}$, parallel composition $\|$ as the algebraic shape of scale relations, nominal-set name-passing as channel mobility, aperiodic settling as the closure 2-monad's transfinite orbit.
These are *general structural features* of any coordinated multi-participant entity; they do not pre-commit to any specific governance regime.

Kyriarchical agentics is a governance instantiation *on top of* the framework.
It adds:

- *A captain object* — a substrate cell with the apex-authority predicate.
- *A delegation-chain morphism* — composite modal frame as the chain's structure.
- *A dispatch certifiability gate* — a closure rule that consults the framework's $K_4$-equivariant cohomology and refuses dispatch when safety-critical sectors are non-vanishing (§3).
- *A meaningful human control discipline* — the captain's accountability is realized as a four-condition $\Pi_1$ meet, with the captain-attestation condition the load-bearing one (§4).

These additions are *not* general structural features.
They are *governance-specific structure* layered onto the framework.
The Lakotaean relational governance the 561 Group operates under uses the same framework but layers *different* governance-specific structure onto it — wolakȟota closure rules, consensus-by-withdrawal, kin-cell primacy.
Both are agentic drone swarms in the general sense; they differ in what they add as governance.

This is the structural reason the dual-governance-context concept atom names conflation as the failure mode.
The framework is the same; the additions are different.
Mixing the additions corrupts both.

## §3 — Dispatch certifiability via $K_4$-equivariant safety-critical sectors

A central kyriarchical-agentics structure: the *certifiability gate* that refuses dispatch when substrate inconsistencies compromise the chain's authority.
The gate consults the $K_4$-equivariant decomposition of the substrate's first cohomology $H^1$.

The $K_4$ Klein-four group is generated by the two $\mathbb{Z}/2$ involutions of the bilattice — *negation* $\sim$ (swap positive and negative evidence) and *conflation* $-$ (swap the two epistemic-failure values).
Under the $K_4$-action, $H^1$ decomposes into four isotypic sectors indexed by the four irreducible characters:

- $H^1_{\mathrm{id}}$ — symmetric under both $\sim$ and $-$.
- $H^1_{\chi_\sim}$ — antisymmetric under $\sim$, symmetric under $-$. *Truth-side / falsity-side disagreement.*
- $H^1_{\chi_-}$ — symmetric under $\sim$, antisymmetric under $-$. **Safety-critical: detects $\top$-firings (paraconsistent contradictions).**
- $H^1_{\chi_{\sim\circ -}}$ — antisymmetric under both. **Safety-critical: detects mixed double-curvature events.**

The kyriarchical dispatch certifiability gate ([`code/structures/verify-certifiability-sectors.md`](../../../code/structures/verify-certifiability-sectors.md)) is a closure rule that *refuses dispatch when either $H^1_{\chi_-} \neq 0$ or $H^1_{\chi_{\sim\circ -}} \neq 0$*.
The other two sectors carry content but do not gate dispatch; they are tracked for audit but not certification refusal.

The structural reading: dispatch certifiability is the kyriarchical apparatus's check that the chain is delegating into a substrate state that the captain can be accountable for.
A non-vanishing safety-critical sector means there is a $\top$-firing (contradicting evidence) or a double-curvature event somewhere in the dispatch projection; the captain's accountability cannot extend over such a state without compromise.
The gate refuses dispatch as a structural protection — both of the substrate's coherence and of the captain's accountability.

The gate is *kyriarchical-specific*.
The $K_4$-equivariant decomposition of $H^1$ is a general structural feature of the agentic drone swarm framework, available regardless of governance regime.
But the *use of it as a gate* — specifically the use of the safety-critical sectors to refuse dispatch — is a kyriarchical-governance choice.
Other governance regimes may consult the cohomology differently or not at all.
The 561 Group's kin-relational governance does not use the gate; it uses wolakȟota's closure discipline, which has its own different structural shape.

## §4 — Meaningful human control as four-condition $\Pi_1$ meet

Meaningful human control (MHC) is a kyriarchical-agentics substrate-level guarantee.
Formalized as the bilattice-meet $\bigwedge_k$ of four parallel $\Pi_1$ conditions ([`code/structures/meaningful-human-control.md`](../../../code/structures/meaningful-human-control.md)):

1. *Captain attestation.* The witness chain of every dispatched action terminates at the captain's accountability locus; the chain is finite, traceable, and locally checkable.
  The captain answers, in a structurally specific way, for every action the chain produced.
2. *Safety-envelope precheck.* Before dispatch, the four-position substrate-entity classification (settled·partnered / settled·unpartnered / unsettled·partnered / unsettled·unpartnered) verifies the action's predicates lie within an authorized envelope.
  Actions outside the envelope are refused before they fire.
3. *Charter-tier discipline.* Closure-rule firings respect the charter's tier hierarchy with strict precedence.
  The ship's charter is the authority that defines what tiers exist and what tier each rule occupies; charter-tier discipline is the requirement that no lower-tier rule overrides a higher-tier rule.
4. *Falsifiable-agency persistence.* The acting agent satisfies Bent's three-condition falsifiable-agency criterion across the action: environmental action, goal-directed planning, persistent state.
  An agent that loses any of the three ceases to be an agent in the relevant sense, and dispatching to it would no longer be MHC-compliant.

MHC holds iff *all four* hold.
The bilattice-meet structure means a failure on any condition collapses MHC across the dispatch.
The witness-chain-as-proof-object reading connects this to Curry-Howard-with-refinement: a witness chain is a proof object whose terminal node is *human attestation* — specifically, the captain's.
This distinguishes "the substrate believes X" from "X has been verified under meaningful human control": only the latter survives kyriarchical certification.

MHC is *kyriarchical-specific*.
The captain-attestation condition has no analog in kin-relational governance, where authority is not lodged at a single apex.
The charter-tier discipline has no analog where there is no chartering instrument (the 561 Group has no charter — only the RSC Quiescent does).
Falsifiable-agency persistence is general structural content, but its use as part of the MHC meet is governance-specific.
MHC is the kyriarchical apparatus's account of what makes a dispatch *answerable*, and answerability in this specific structural sense is the kyriarchical commitment.

## §5 — Three-layer hierarchical safety architecture

A specific engineering structure within kyriarchical agentics, articulated in the predicated-drone-swarm sub-theory ([`theories/.../predicated-drone-swarm/`](../../../theories/engineering/theories/tech/theories/computing/theories/continuous-computation/theories/artificial-intelligence/theories/agents/theories/agentic-orchestration-platforms/theories/predicated-agentic-orchestration-platform/theories/predicated-drone-swarm/_index.md)).
Three cobordisms compose in $\mathrm{Cob}_\mathrm{settling}$:

- **Layer 1 — foundation-model.** Cobordism $S_1 : \mathcal{B}_\mathrm{situation} \to \mathcal{B}_\mathrm{intent}$ with *foreign-interior bulk*.
  The LLM/learned model's bulk is non-deterministic; only the boundary (situation-in, intent-out) is substrate-resident.
  The bulk is opaque to the substrate.
- **Layer 2 — optimization-control.** Cobordism $S_2 : \mathcal{B}_\mathrm{intent} \to \mathcal{B}_\mathrm{action}$ with *deterministic bulk* (CBF/MPC/QP solver).
  The bulk is computable and replay-byte-identical.
- **Layer 3 — certified-safety-shield.** Cobordism $S_3 : \mathcal{B}_\mathrm{action} \to \mathcal{B}_\mathrm{actuated}$ with *strict-regime bulk* (closure-rule check, finite case-enumeration). $H^1 = 0$ structurally — the safety shield contributes no cohomology, so its safety-critical sectors vanish.

The composite $S_3 \circ S_2 \circ S_1 : \mathcal{B}_\mathrm{situation} \to \mathcal{B}_\mathrm{actuated}$ has closure ordinal equal to the ordinal sum $\kappa_1 + \kappa_2 + \kappa_3$.
The strict-regime layer 3 *caps* the composite at the layer-3 ordinal if layers 1 and 2 are bounded.

Categorically, the three layers stratify through the linear-logic fragment lattice MLL $\subset$ MALL $\subset$ \{ILL, CLL\} $\subset$ LL: Layer 1 at LL/foreign (unbounded copying and discarding); Layer 2 at ILL (Kleisli of `!
` on a $*$-autonomous model — deterministic typed computation); Layer 3 at MLL/MALL (no copying, finite case-enumeration, $H^1 = 0$).

This architecture is *the structural shape of kyriarchical safety*.
The composite cobordism delegates from the high-entropy LLM bulk through a deterministic optimization layer to a strict-regime shield, and certifiability composes when the safety-critical sectors remain vanishing through the composition.
The captain is accountable for the composite's actuation; the strict-regime cap is what makes that accountability tractable.

The architecture's engineering reading: the unsafe model proposes, the safe shield disposes.
The shield's MLL/MALL position is what guarantees that whatever the LLM emits, the action that fires has been case-enumerated against strict-regime closure rules.
The shield is not an add-on safety check; it is the structural endpoint of the kyriarchical-agentics dispatch chain.

## §6 — Cost-decoupling under captain-aim-frontier dispatch

Per-step total cost for an agentic drone swarm under kyriarchical governance has two terms:

- *Substrate-layer (MALL) coordination.* $r_\Gamma \cdot O(|L|)$, where $r_\Gamma$ is the rate of $\Gamma$-mechanism closure firings per substrate-step on existing witnesses, generating new aims without LL invocation.
- *Agent-layer (LL/foreign) consultation.* $r_\eta \cdot O(c_\text{LL})$, where $r_\eta$ is the rate of LL invocations per substrate-step and $c_\text{LL} \sim 10^{10}\text{–}10^{12}$ FLOPs per call.

Total cost is substrate-bounded iff the consultation rate satisfies the *aim-frontier ratio*: $$r_\eta / r_\Gamma \;\leq\; |L| / c_\text{LL}.$$

In kyriarchical agentics, the discipline that enforces this ratio is *captain dispatch at the aim-frontier* — the captain operates by the pattern: think → emit witness → let substrate work for many closure steps → think again.
The captain does not invoke LL at every closure step; LL invocations happen at the *boundary* of aim-generation, not at the closure-step rate.
The ratio between $\Gamma$-firings and $\eta$-firings in the increment sequence $U$ is the captain's dispatch protocol.

> **Kyriarchical-agentics total-cost decoupling (sketch theorem).** *Per-step total cost is substrate-bounded $O(N+|L|)$ iff the captain's aim-frontier dispatch protocol satisfies $r_\eta \leq r_\Gamma \cdot |L| / c_\text{LL}$, structurally achieved by aperiodicity (guarantees $r_\Gamma > 0$), aim-generativity (ensures $\Gamma$-firings produce new content), and the captain-attestation MHC condition rate-limiting $r_\eta$ to the captain's pace.*

The captain-attestation MHC condition is what *kyriarchically* enforces the dispatch discipline.
Each LL invocation requires the captain's witness-chain attestation; the captain cannot attest faster than they can think.
The aim-frontier ratio is therefore a structural consequence of MHC, not an independent discipline.

This is the kyriarchical version of the cost-decoupling finding.
The general structural fact (aperiodicity + aim-generativity → tractability when LL invocations are rate-limited) belongs to the agentic-drone-swarm framework.
The specific *mechanism* by which LL invocations are rate-limited — captain-attestation under MHC — is kyriarchical-specific.
A polity under kin-relational governance would rate-limit LL invocations differently (consensus-by-withdrawal, kin-recognition cycles, etc.); the structural cost-decoupling theorem still holds but the rate-limiting mechanism differs.

## §7 — Cross-polity dispatch certifiability via Mayer-Vietoris

When two kyriarchically-governed polities federate, dispatch from one polity's chain into the other's substrate raises a cross-polity certifiability question.
The framework's Mayer-Vietoris federation cohomology supplies the apparatus.

For polities $A, B$ with overlap $A \cap B$, the long exact sequence is

$$\cdots \to H^n(\mathcal{F}^{A \cup B}) \xrightarrow{\mathrm{res}} H^n(\mathcal{F}^A) \oplus H^n(\mathcal{F}^B) \xrightarrow{\mathrm{diff}} H^n(\mathcal{F}^{A \cap B}) \xrightarrow{\delta} H^{n+1}(\mathcal{F}^{A \cup B}) \to \cdots$$

with $H^{\geq 2} = 0$ on the platform.
The cross-polity certifiability gate is the federated version of the single-polity gate:

> **Kyriarchical cross-polity dispatch certifiability (sketch theorem).** *Polity $A$'s captain may license polity $B$'s chain to dispatch against $A$'s substrate iff three conditions hold:* 1. *(Constituent gates.)
> Each polity passes its own $K_4$-equivariant certifiability gate.* 2. *(Federation-only gate.)
> The image of the Mayer-Vietoris connecting homomorphism $\delta$ vanishes in the safety-critical sectors: $\mathrm{Im}(\delta)_{\chi_-} = \mathrm{Im}(\delta)_{\chi_{\sim\circ -}} = 0$.* 3. *(Trajectory exchange.)
> Per the four-regime federation discipline, the increment sequence $U_{A \cup B}$ carries $B$-chain's trajectory, not merely $B$'s endpoint, because both polities are aperiodic.*

The substantive finding (carried over from the FAdRS-swarms survey's §7.3): cross-polity disagreement does *not* refuse certification.
Disagreement-pairs $(\alpha_A, \alpha_B)$ on the overlap live in $\ker(\delta)$ and produce no federation-level obstruction.
The federation-only gate refuses only *structural gaps in overlap representation* — overlap-content that no pair of constituent positions can collectively express.

This is a kyriarchical-specific theorem because the *gate* it informs is kyriarchical (single-polity dispatch certifiability gate).
The Mayer-Vietoris apparatus and the cohomology vanishing are general structural facts; the gate that consults them and refuses dispatch is kyriarchical.
Federation between kin-relationally-governed polities (multiple tiyóšpaye in an oyate, for instance) handles disagreement through its own kin-relational machinery, not through a captain's certifiability gate.

## §8 — Sector-selective convergence in the aperiodic regime

A kyriarchically-governed polity in the aperiodic regime ($\kappa \geq \omega_1$) converges in the cohomological sense iff its $K_4$-equivariant safety-critical sectors stabilize from some countable stage onward, while the non-safety-critical sectors generically remain nonzero.
The aperiodic-classifying-invariant's components in the safety-critical sectors must vanish: $$\mathrm{cl}^{\chi_-}(v_\tau) \;=\; \mathrm{cl}^{\chi_{\sim\circ -}}(v_\tau) \;=\; 0 \quad \text{for all countable } \tau \geq \tau_0.$$

The non-safety-critical sectors $\mathrm{cl}^{\mathrm{id}}, \mathrm{cl}^{\chi_\sim}$ remain live; this is what the aperiodic-regime classification ensures.
The polity's perpetual aim-generativity (per §6) lives in these sectors.

This is the *kyriarchical* sector-selective convergence: certifiability stabilizes (safety-critical sectors vanish, dispatch is licensable) while aim-generativity persists (non-safety-critical sectors carry the ongoing work).
The polity *needs* the safety-critical sectors to converge — without that convergence, the captain cannot license dispatch and the chain cannot operate.
The polity *needs* the non-safety-critical sectors not to converge — without their persistent generativity, the chain would saturate and the polity would dissolve into a strict-regime fixed point.

The categorical convergence target is the cofree-`!
`-coalgebra fixed point in $\mathcal{Kl}(!_{\mathbf{CGS}})$ on the polity's arena; convergence is in the cofibered limit topology, measured by cohomological stability in the safety-critical sectors.

The same convergence question for a kin-relationally-governed polity has *different content*: the analog of "safety-critical sector stabilization" is wolakȟota's stabilization (conduct that holds relations together) — *not* the $K_4$-equivariant safety-critical cohomology specifically.
The general structural fact (aperiodic-regime sector-selective convergence in *some* relevant sectors) belongs to the framework; what counts as "the relevant sectors" is governance-specific.
In kyriarchical agentics it is $H^1_{\chi_-}$ and $H^1_{\chi_{\sim\circ -}}$.

## §9 — The RSC Quiescent as instance

The polity's kyriarchical-agentics instance is the RSC Quiescent — the Relational Settlement Carrier *Quiescent*, the 561 Group's Webship commissioned 2026-04-05.
Its substrate-side record is at [`code/structures/rsc-quiescent.md`](../../../code/structures/rsc-quiescent.md); the dedicated survey [`rsc-quiescent-may-2026.md`](rsc-quiescent-may-2026.md) gathers what the corpus says about the ship specifically.
The present survey supplies the theoretical apparatus the ship operates under; the rsc-quiescent survey supplies the ship-specific content.

The ship's structural shape, in the kyriarchical-agentics apparatus:

- *Captain*: emsenn, holding office:command.
  Accountability non-transfer holds: emsenn answers for every outcome on the ship regardless of which delegation link carried the action.
- *Delegation chain*: includes the office of first officer (the calder-underhill character) and the operating spaces (the bridge) where the chain operates.
  The delegation morphisms are scope-bounded and revocable.
- *Function*: the lawful pursuit of Black Liberation and Indigenous Sovereignty.
  The function is borrowed from the 561 Group's own endeavor; the ship is the means.
- *Charter*: the charter named at the ship's commissioning.
  The captain's 2026-05-15 correction (recorded in the rsc-quiescent survey) makes clear: the charter is *the ship's*, not the polity's — the 561 Group as a Lakota tiyóšpaye does not need a charter; the ship as a kyriarchical body politic does.

The ship is the kyriarchical-agentics apparatus *instantiated*.
Other instances are possible — other ships, other kyriarchically-governed bodies politic — and the apparatus does not pre-commit to a single instance.
The present survey treats the apparatus structure-agnostically; the ship-specific content lives in the sibling survey.

## §10 — What kyriarchical agentics is not

Three demarcations the corpus has named and that the present survey honors:

*Kyriarchical agentics is not the 561 Group's governance.* The 561 Group is a Lakota tiyóšpaye constituted as a confederacy; its governance is kin-relational, operating under wolakȟota and consensus-by-withdrawal.
Conflating the two regimes — describing the tiyóšpaye in captain-and-delegation-chain vocabulary or describing the ship in kin-relational vocabulary — is the failure mode named at [`prose/teaching/explanations/dual-governance-context.md`](../../teaching/explanations/dual-governance-context.md).
The two regimes are different closure-rule subsystems; emsenn holds governance roles in both, but the roles are different and the subsystems are non-interchangeable.

*Kyriarchical agentics is not the agentic drone swarm framework.* The framework is structure-agnostic: it supplies embodied handedness, parallel composition, nominal-set name-passing, aperiodic settling, the closure 2-monad, the bilattice values, the $K_4$-equivariant cohomology decomposition, the Mayer-Vietoris federation cohomology.
These are general structural features of any coordinated multi-participant entity.
Kyriarchical agentics adds governance-specific structure on top: captain, delegation chain, accountability non-transfer, MHC as four-condition meet, certifiability gate over safety-critical sectors.
The additions are not constitutive of the framework.
Other governance regimes use the same framework with different additions.

*Kyriarchical agentics is not (necessarily) the governance regime of a generic drone swarm.* The literature on drone swarms (Bonabeau, Dorigo, Theraulaz 1999; Doan et al. 2025; the May 2026 informant surveys cited in the FAdRS-swarms survey) treats drone collectives at a level structurally agnostic to governance.
The agentic-drone-swarm framework, as the corpus has developed it, is also governance-agnostic.
Kyriarchical agentics is one *specific* way to govern a drone swarm — well-suited to ship-like external operations — but it is not what the term "drone swarm" entails.
The literature's drone swarms in classical (ACO/PSO) settings are typically *not* kyriarchical; they are stigmergic and homogeneous.

## §11 — References

**561-native:**

- [`prose/teaching/explanations/dual-governance-context.md`](../../teaching/explanations/dual-governance-context.md) — the dual-governance failure-mode rule.
- [`code/structures/rsc-quiescent.md`](../../../code/structures/rsc-quiescent.md) — the ship's substrate-side record.
- [`code/structures/meaningful-human-control.md`](../../../code/structures/meaningful-human-control.md) — MHC structure.
- [`code/structures/verify-certifiability-sectors.md`](../../../code/structures/verify-certifiability-sectors.md) — the dispatch certifiability gate.
- [`prose/learning/surveys/rsc-quiescent-may-2026.md`](rsc-quiescent-may-2026.md) — the sibling ship-specific survey.
- [`prose/learning/surveys/561-group-may-2026.md`](561-group-may-2026.md) — the polity-side sibling survey.
- [`prose/learning/surveys/theory-of-flatfile-agentic-drone-resource-system-swarms-may-2026.md`](theory-of-flatfile-agentic-drone-resource-system-swarms-may-2026.md) — the framework survey from which the kyriarchical content extracted here originally lived (before the present surgical correction).

**Informant — predicated-governance:**

- `theories/.../predicated-work/governance/theorems/military-command-chain-as-modal-composition.md` — the categorical home of the kyriarchical delegation chain.
- `theories/.../predicated-work/governance/theorems/charter-as-closure-system.md` — the chartering instrument as substrate content.

**Informant — predicated-drone-swarm:**

- `theories/.../predicated-drone-swarm/_index.md` and the six sketch-status theorems authored 2026-05-09 — supply the three-layer architecture, the seven-axis taxonomy, the six-way intersection composition, and the embodied-handedness-with-asymmetric-coordination apparatus that kyriarchical agentics composes with.

**Informant — predication categories:**

- `theories/.../predication-categories/theorems/equivariant-cohomology-decomposition.md` — the $K_4$-equivariant decomposition.
- `theories/.../predication-categories/objects/klein-four-gauge-bundle.md` and `concepts/klein-four-symmetry.md` — the structural $K_4$-action.
- `theories/.../predication-categories/theorems/replica-mayer-vietoris.md` and `crdt-convergence-via-cohomological-calm.md` — the federation-cohomology apparatus.
