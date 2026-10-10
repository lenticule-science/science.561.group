---
title: "Theory-side research notes — round 2 (five further sites where dev plans ask the theory questions it cannot yet answer)"
description: "Round-2 follow-on to `theory-side-research-notes-2026-05-03.md`. Picks five further sites in the rounds 5–7 frontier surveys and the standing placeholder-theorem audit where dev documentation raises questions the predication-categories / predicated-computing theory does not yet answer in published form. For each site: diagnose the gap, cite existing theory the dev prose has missed (often because the prose cites phantom theorems that do not exist on disk), develop a candidate answer grounded in the existing theory family, and propose the minimal math-side authoring needed."
kind: survey
status: draft
date: 2026-05-03
predecessor: "theory-side-research-notes-2026-05-03.md"
surfaces:
  - "../surveys/frontier-survey-2026-05-05-round-6.md"
  - "../surveys/frontier-survey-2026-05-06-round-7.md"
  - "../surveys/placeholder-theorems-2026-05-03.md"
default-disposition: "captain-review-then-promote-findings-to-library-authoring-tasks"
---

# Theory-side research notes — round 2 (2026-05-03)

The first round of theory-side research notes ([`theory-side-research-notes-2026-05-03.md`](theory-side-research-notes-2026-05-03.md)) addressed three sites surfaced by rounds 3–4 (cross-peer clock-meet, federation-fuel quantale distributivity, and witness-lifecycle 4-state).
Rounds 5–7 ([`frontier-survey-2026-05-04-round-5.md`](frontier-survey-2026-05-04-round-5.md), [`frontier-survey-2026-05-05-round-6.md`](frontier-survey-2026-05-05-round-6.md), [`frontier-survey-2026-05-06-round-7.md`](frontier-survey-2026-05-06-round-7.md)) opened a deeper-horizon surface and named several "next-not-recorded" frictions whose Western-default refusal the dev prose grounds in theorems that — on inspection — **do not yet exist on disk**.
Four such phantoms recur across the round-5/6/7 prose:

- `vote-as-bilattice-fold` (round-6 §2.3 + §3.6 + §B7);
- `progress-rollup-as-fiber-fold` (round-6 §2.3 + §3.6);
- `lawvere-cost-quantale` (round-6 §2.2 — distinct from the existing `cost-composition-via-lawvere-quantale`);
- `bounded-settlement-busaniche-cignoli` (round-6 §2.1).

(Initial draft of this note also flagged `four-regime-dichotomy` as a phantom; that flag was wrong — the theorem exists at [`predication-categories/theorems/four-regime-dichotomy.md`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md), proved, with the strict / Scott-continuous / transfinite-bounded / aperiodic stratification at the $\omega$ and $\omega_1$ ordinal boundaries.
Round-6 §2.4's cite is correct as written.)

In every other case a real theorem already does the work the prose asks for; the prose simply cites a name that was never authored.
This round audits five sites where that pattern shows up and, in each case, develops the candidate answer from existing theory.
The shape of each section matches round 1: identify the dev-doc question, walk what published theory actually says (with concrete file paths), state the answer, propose the minimal math-side authoring (typically zero new objects, one short theorem stating the corollary).

The five sites are:

1. **Tier-routing-as-bilattice-fold-over-admissibility-cells** ([round-6 §3.6](frontier-survey-2026-05-05-round-6.md), [round-7 §3.7](frontier-survey-2026-05-06-round-7.md)).
  The prose proposes a new "fold" primitive citing two phantoms (`vote-as-bilattice-fold`, `progress-rollup-as-fiber-fold`).
  We argue the operation already has a name on disk: it is [`graded-dispatch-via-q-enriched-fusion`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/graded-dispatch-via-q-enriched-fusion.md) specialised to admissibility cells over the cost quantale; placeholder #6 (`predication-cell-as-fold-source`) is dischargeable as a one-line corollary.
2. **Capability-API non-amplification under SDK composition** ([round-6 §3.4](frontier-survey-2026-05-05-round-6.md)).
  The prose claims a new theorem is needed for the v0.6 SDK boundary.
  We show the result already exists at the agent surface in [`agent-self-queueing-bounded-by-modal-restriction`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/agent-self-queueing-bounded-by-modal-restriction.md) and lifts to the SDK boundary by composing it with [`interfacer-counit-law-uniformity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law-uniformity.md).
  Placeholder #2 (`network-as-monoidal-functor`) shrinks accordingly.
3. **Model-supersession-as-substrate-edge-not-deletion + tower-fold-as-vocabulary-supersession** ([round-6 §3.7](frontier-survey-2026-05-05-round-6.md), [round-7 §3.4 / §6](frontier-survey-2026-05-06-round-7.md)).
  The prose names voidmath F9 (tower/fold) as if it were a new substrate primitive.
  We argue model-supersession **is** [`forward-migration-preserves-prior-content`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/forward-migration-preserves-prior-content.md) specialised to a model-cell, and the tower-fold is its iteration — a transfinite chain of forward-migrations whose limit is a directed colimit in the closure-2-monad's algebra category.
4. **Umwelt-as-fiber-projection** ([round-7 §3.5 + §6](frontier-survey-2026-05-06-round-7.md)).
  The captain's claim that perception = `respond(<entity>, <fiber>)` filtered to non-$\bot$ is grounded by [`predication-fiber-functor`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md) (math-side) composed with [`cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) (engineering-side).
  Umwelt-coherence across observers is a corollary of fiber functoriality, not new structure.
5. **World-tick-as-heartbeat-fold** ([round-7 §3.8.2 + §6](frontier-survey-2026-05-06-round-7.md)).
  The "world-tick" is engineering vocabulary for one application of the substrate's closure 2-monad to the heartbeat-triggered firable subset.
  Convergence is [`wavefront-termination`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/wavefront-termination.md); locality is [`wavefront-locality-via-cohomology-vanishing`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/wavefront-locality-via-cohomology-vanishing.md).
  No new theorem is needed; the pattern candidate is a naming convention over existing primitives.

The §6 phantom-citation register at the end of this note enumerates every phantom-cited theorem name found in the rounds 5–7 prose and pairs each with its existing-on-disk replacement, so the next dev-doc editorial sweep can do the path-rewrites mechanically.

---

## §1. Tier-routing IS graded dispatch over the cost quantale

[Round-6 §3.6](frontier-survey-2026-05-05-round-6.md) names *cheapest-sufficient-tier-routing-as-bilattice-fold-over-admissibility-cells* as the deep-horizon underspecification at v0.8, deferred to a pattern candidate `_patterns/cheapest-sufficient-tier-routing.md`.
The "Grounded in" line cites the phantoms `vote-as-bilattice-fold` and `progress-rollup-as-fiber-fold` plus the real [decisions/cheapest-sufficient-computation-tier](../decisions/cheapest-sufficient-computation-tier.md).
[Round-7 §3.7](frontier-survey-2026-05-06-round-7.md) extends the same pattern to gamification-as-enrichment-prioritizer.
The conformance-vector backlog entries B7 (round 4) and B11–B16 (round 6) all point at this fold-primitive as the pivot.

The placeholder-theorem audit ([`placeholder-theorems-2026-05-03.md`](placeholder-theorems-2026-05-03.md)) entry **#6 `predication-cell-as-fold-source`** carries the same gap: the v0.7 work-orchestration rollup-algebra spec and the v0.7 governance vote-tally spec both want this theorem; disposition is `AUTHOR-MATH-SIDE-IN-v0.7`.

We argue: **the operation already has a name on disk.** It is [`graded-dispatch-via-q-enriched-fusion`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/graded-dispatch-via-q-enriched-fusion.md) (proved, status: published) specialised to the four-bilattice $\mathbf{L}^\bowtie$ tag and the cost quantale $\mathcal{V}$ from [`cost-composition-via-lawvere-quantale`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md).
The "fold" the dev prose describes is the q-enriched fusion's $\odot$-iteration over an admissibility cell-set.

### §1.1. What the existing theorem says

[`graded-dispatch-via-q-enriched-fusion`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/graded-dispatch-via-q-enriched-fusion.md) declares: for a candidate agent $a$ with required-capability predication $r$ and agent-capability predication $u_a$ in a $\mathsf{Q}$-enriched [predication fiber algebra](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) over a commutative unital quantale $\mathsf{Q}$,

$$\mathrm{match}(r, u_a) \;=\; r \odot u_a \;\in\; A_p$$

decomposes into a **bilattice tag** $\tau \in \mathbf{L}^\bowtie$ and a **quantale grade** $q \in \mathsf{Q}$, with the grade composing multiplicatively across sequential dispatch decisions:

$$q(r_1 \odot u_{a_1} \odot r_2 \odot u_{a_2}) \;=\; q(r_1 \odot u_{a_1}) \cdot q(r_2 \odot u_{a_2}).$$

The theorem's own engineering-consequence section observes: *"Cost-models become quantales.
A dispatcher needing latency-aware routing picks $\mathsf{Q} = ([0, \infty], +, \min)$ (the Lawvere quantale); a dispatcher needing reliability-weighted routing picks $\mathsf{Q} = ([0, 1], \cdot, \max)$; a dispatcher needing modal trust picks $\mathsf{Q} = \mathbf{L}^\bowtie$ itself."*

That is: **tier-routing is dispatch with a particular $\mathsf{Q}$.** The substrate's $\odot$ operator on the bilattice tag is the same operator in each case; only the quantale changes.

### §1.2. Mapping the dev prose to the existing theorem

The round-6 §3.6 prose names three phenomena and asks for one fold-primitive that handles all three:

- **Voting.** A poll's $n$ ballots are admissibility-cells $\{(\text{ballot-}i, \text{vote}, \text{candidate-}j) = v_i\}_i$ with $v_i \in \mathbf{L}^\bowtie$; the tally is $\bigodot_i v_i$ on the truth-meet $\wedge_t$ axis.
  Tied-on-truth ballots produce $\top$ in the tally, retained per [`paraconsistency-as-substrate-discipline`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/paraconsistency-as-substrate-discipline.md).
- **Rollup.** A milestone's $n$ goal-status cells $\{(\text{goal-}i, \text{status}, \text{milestone-}M) = v_i\}_i$ are admissibility-cells; the rollup is $\bigodot_i v_i$ on the knowledge-meet $\wedge_k$ axis.
  Goals that disagree on `status` produce a $\top$-tagged rollup, surfaced as a captain-review item.
- **Tier-routing.** An office's $n$ task-tier admissibility cells $\{(\text{office-}o, \text{admissible-at-tier}, \text{tier-}T) = v_i\}_i$ are admissibility-cells with grade $q_i \in \mathcal{V}$ from the cost quantale; the routing is $\bigodot_i v_i$ where the bilattice tag selects "admissible at this tier" and the grade tracks "cumulative cost so far."

In each case the operation is $\bigodot$-fold over a cell-set indexed by the relevant axis (ballot, goal, tier) with values in the predication fiber algebra.
The bilattice tag and the quantale grade decompose per the existing theorem; multiplicative composition is supplied by [`quantale-graded-composition-uniformity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/quantale-graded-composition-uniformity.md).
For tier-routing specifically, the grade quantale is the substrate's cost quantale ($\mathcal{V} = ([0,\infty], +, \min)$ in v0.2 default); the bilattice tag carries the admissibility decision; tied-on-cost tiers produce a $\top$-tagged routing-decision cell that the office's policy resolves (or the captain reviews).

The "fold" is therefore not a new primitive — it is the binary $\odot$-fusion iterated over a cell-set, with the existing theorem's multiplicative-grade composition giving the iteration its semantics.
No new operator is introduced; the substrate's existing $\odot$ does the work.

### §1.3. Why the prose's framing is right but the citations were wrong

The round-6 prose's substantive claim — *"the substrate's tier-routing is a fold over admissibility cells whose tied-on-grade case is retained as $\top$-content for office or captain resolution"* — is correct on the existing theory's terms.
What's wrong is the citation chain:

- **Phantom 1: `vote-as-bilattice-fold`.** Does not exist on disk under [`predicated-computing/theorems/`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/).
  The closest existing theorem is [`bilattice-network-sheaf-consensus`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) (math side) — which is the network-sheaf-cohomology consensus theorem, not the local-tally fold.
  The local fold itself is `graded-dispatch-via-q-enriched-fusion` with $\mathsf{Q} = $ trivial (one-element quantale; grade is identity), reducing to plain $\odot$-fold.
- **Phantom 2: `progress-rollup-as-fiber-fold`.** Does not exist on disk.
  The local rollup is the same operator — `graded-dispatch-via-q-enriched-fusion` with $\mathsf{Q} = $ progress-percent quantale (e.g., $([0,1], \min, 1)$ for AND-rollup of completion fractions, or $([0,1], \max, 0)$ for OR-rollup of any-blocked).
  Cross-fiber rollup additionally cites [`predication-fiber-functor`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md) for the substitution along the goal $\to$ milestone projection.
- **Real anchor: `graded-dispatch-via-q-enriched-fusion`.** Carries the multiplicative grade composition, the bilattice-tag/quantale-grade decomposition, and the $\top$-retention discipline already.
- **Real anchor: `paraconsistency-as-substrate-discipline`.** Justifies the $\top$-retention on tied tags.
- **Real anchor: [`closure-rule-system-realizes-closure-2-monad`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/closure-rule-system-realizes-closure-2-monad.md).** Justifies that the fold-as-closure-step is the same algebra as every other substrate operation.

### §1.4. Math-side authoring proposal

The round-6/7 pattern candidate `_patterns/cheapest-sufficient-tier-routing.md` and the placeholder #6 (`predication-cell-as-fold-source`) discharge into one short theorem that names the specialisation explicitly:

- **theorem `cell-set-fold-as-graded-dispatch-specialization`** ([`predicated-computing/theorems/`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/)).
  Claim: for any admissibility cell-set $\{(\sigma_i, p, o) = v_i\}_i$ in a fiber algebra $A_p$ over $\mathsf{Q}$, the substrate's local $\odot$-fold $\bigodot_i v_i$ is the iterated-binary case of [`graded-dispatch-via-q-enriched-fusion`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/graded-dispatch-via-q-enriched-fusion.md): the bilattice tag composes per [`twist-product-fusion`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md), the quantale grade composes multiplicatively per [`quantale-graded-composition-uniformity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/quantale-graded-composition-uniformity.md), tied-on-tag instances produce a $\top$-tagged fold-result cell retained per [`paraconsistency-as-substrate-discipline`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/paraconsistency-as-substrate-discipline.md).
  The voting-tally, progress-rollup, and tier-routing surfaces are three instantiations differing only in the choice of $\mathsf{Q}$ (trivial / progress-percent / cost-quantale) and the choice of meet axis ($\wedge_t$ / $\wedge_k$ / mixed).
  - **Depends-on:** `graded-dispatch-via-q-enriched-fusion`, `twist-product-fusion`, `quantale-graded-composition-uniformity`, `paraconsistency-as-substrate-discipline`, `predication-fiber-algebra`.
  - **Class:** engineering-claim.
  - **Status:** proved (the proof is the §1.2 mapping above; each of the three surfaces is a one-paragraph specialisation of the existing q-enriched fusion theorem).
  - **Discharges:** placeholder #6 (`predication-cell-as-fold-source`); the v0.7 vote-tally and rollup-algebra spec citations; the v0.8 tier-routing pattern candidate's substrate-content anchor; the round-6 §3.6 friction; the round-7 §3.7 friction.

No new object is needed.
No edits to [`predication-categories/`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/) are needed.
The theorem lives entirely in `predicated-computing/theorems/` and is a one-screen-page corollary; the v0.7 slice owner can author it in an hour at the same time as the rollup-algebra spec.

A consequential editorial-pass observation: the rounds 4–7 prose should rewrite every `vote-as-bilattice-fold` and `progress-rollup-as-fiber-fold` citation to point at this new corollary (or directly at `graded-dispatch-via-q-enriched-fusion` if the corollary is not yet authored).
See §6 for the full phantom-citation register.

---

## §2. SDK capability non-amplification follows from existing theorems; placeholder #2 shrinks

[Round-6 §3.4](frontier-survey-2026-05-05-round-6.md) names *capability-API non-amplification under SDK composition* as the v0.6 SDK milestone's deep-horizon friction.
The Western default refused is "library-import-grants-importer-the-capability"; the discipline preserved is "$\Rightarrow$-adjunction non-amplification at the SDK boundary."
Backlog entry B13 records the conformance-vector.
The dev prose suggests the substrate needs a new theorem that the SDK boundary preserves capability-restriction under composition.

Placeholder-audit entry **#2 `network-as-monoidal-functor`** (`AUTHOR-MATH-SIDE-IN-v0.4`) carries the dual claim at the federation surface.
Both placeholders' substantive content overlaps with existing theorems.

We argue: **the non-amplification result is already proved** at the agent-self-queueing surface in [`agent-self-queueing-bounded-by-modal-restriction`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/agent-self-queueing-bounded-by-modal-restriction.md), and lifts to the SDK boundary by composing with [`interfacer-counit-law-uniformity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law-uniformity.md).
Placeholder #2's content is two distinct claims, only one of which needs new authoring.

### §2.1. What `agent-self-queueing-bounded-by-modal-restriction` already proves

The theorem (proved, status: published) states: for any agent $a$ admitting a work-item $W$ via self-queueing, the work-item's required capability is bounded by the agent's $\Box_R$-restricted capability:

$$\mathrm{required\_capability}(W) \;\subseteq\; (\Box_R u_a)_{w_a}$$

The proof composes [`signature-binds-witness-to-identity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/signature-binds-witness-to-identity.md), [`modal-necessity-basic-properties`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-necessity-basic-properties.md) (preservation of $\wedge_t$ and $\mathbf{t}$, monotonicity), and an existing `capability-non-amplification` cite (in the [`functional-runtime-platform`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/functional-runtime-platform/) sub-theory — the round-6 prose's appeal to the $\Rightarrow$-adjunction non-amplification *is* this cite, named locally).
The theorem's own "Engineering consequence" section makes the bounded-sub-agent-spawning claim explicit:

> *Bounded sub-agent spawning.
> When an agent spawns a sub-agent (via a `spawn-sub-agent` work-item), the sub-agent's capability is at most $\Box_R \cdot \mathrm{parent-capability}$.
> Per the theorem applied recursively, each generation in a spawn chain is at most as authorized as the previous; the chain is structurally non-amplifying.*

The "spawn-sub-agent" surface is exactly the SDK-import surface from the OS-process-model perspective: an SDK app `imports` a capability from the substrate; the substrate's interfacer admits the import; the imported capability is what the importing app gets to wield.
The existing theorem says this surface cannot amplify capability.
The structural argument is identical to the spawn-chain argument; only the surface vocabulary differs.

### §2.2. What `interfacer-counit-law-uniformity` already proves

The theorem (proved, status: published) states that **every substrate boundary** — frontend renderer, backend API extractor, federation-envelope, encryption interfacer, message-data-model encoder, form-submission envelope — is presented as a faithful functor $I : \mathcal{S} \to \mathrm{Pred}(\mathcal{C})$ with `apply` and `extract` operations satisfying the interfacer counit law.
Its position paragraph names:

> *...modal-restriction-as-substrate-authorization-primitive (one authorization, multiple surfaces), it completes a triplet of meta-claims: the substrate's three fundamental machineries — runtime, authorization, boundaries — are each one phenomenon at multiple engineering surfaces.*

The SDK boundary is one of the "multiple surfaces" the uniformity claim already covers.
The SDK is an interfacer in the theorem's sense: an SDK app's `import` is the boundary's `apply` direction; its `export` of substrate state is the boundary's `extract` direction; the counit law guarantees round-trip fidelity.
The theorem's own "What the theorem rules out" list is unambiguous about non-faithful boundaries:

> *Boundaries that don't satisfy the counit law.
> A "boundary" whose round-trip loses information ... is non-faithful — it's a non-conformant interfacer.*

A non-amplifying SDK boundary is a faithful interfacer that respects modal restriction at admit-time.
Both halves are already in the theorems.

### §2.3. The SDK-non-amplification claim as a composition

Putting §2.1 + §2.2 together: an SDK app's effective capability is

$$u_{\mathrm{app}} \;=\; (\Box_{R_{\mathrm{SDK}}} u_{\mathrm{importer}})_{w_{\mathrm{app}}}$$

where $R_{\mathrm{SDK}}$ is the SDK's accessibility relation (the substrate-admitted import-time restriction; declared by the SDK manifest per [decisions/skills-have-manifest-contracts](../decisions/skills-have-manifest-contracts.md)).
By [`modal-necessity-basic-properties`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-necessity-basic-properties.md), $(\Box_{R_{\mathrm{SDK}}} u_{\mathrm{importer}}) \leq_k u_{\mathrm{importer}}$ — the import is non-amplifying.

When the SDK app composes with another SDK app (importer-of-importer), the modal restrictions compose: $(\Box_{R_2} \Box_{R_1} u) \leq_k (\Box_{R_1} u) \leq_k u$.
The SDK composition chain is structurally non-amplifying, and the bound is computable per [`governance-decision-modal-decidability`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/governance-decision-modal-decidability.md) (PSPACE).

Per [`interfacer-counit-law-uniformity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law-uniformity.md), this is the *same* check the substrate runs at every other boundary — frontend, federation-envelope, encryption — with the SDK's accessibility relation in place of the boundary's.
The SDK boundary is not a special case requiring a special theorem; it is the existing pattern instantiated.

### §2.4. What placeholder #2 (`network-as-monoidal-functor`) actually still needs

Placeholder #2 has two substantive components, only one of which is now still open:

- **Component 2a: capability non-amplification at the network boundary.** Discharged by the §2.3 composition above (with $R_{\mathrm{SDK}}$ replaced by $R_{\mathrm{network}}$, the federation-trust-relation per [`federation-trust-bilattice-graded`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-trust-bilattice-graded.md)).
  No new theorem needed.
- **Component 2b: the network's `extract`/`apply`/`compose` triple as the action of a *monoidal* functor between the upstream-protocol category and the substrate category.** The monoidal-functor structure is what makes the protocol's parallel composition (multiple connections, multiplexed streams) commute with the substrate's parallel composition (multi-cell admit).
  This is a genuine structural claim not proved by `interfacer-counit-law-uniformity`, which only handles the unary boundary. **This is the genuine remaining math.**

The placeholder audit's `AUTHOR-MATH-SIDE-IN-v0.4` disposition therefore narrows to component 2b only.

### §2.5. Math-side authoring proposal

Two short entries:

- **theorem `sdk-import-non-amplifying-via-modal-restriction-composition`** ([`predicated-computing/theorems/`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/)).
  The SDK-boundary specialisation of `agent-self-queueing-bounded-by-modal-restriction` per §2.3.
  - **Depends-on:** `agent-self-queueing-bounded-by-modal-restriction`, `interfacer-counit-law-uniformity`, `modal-restriction-as-substrate-authorization-primitive`, `modal-necessity-basic-properties`, `governance-decision-modal-decidability`.
  - **Class:** engineering-claim.
  - **Status:** proved (the proof is the §2.3 composition; one paragraph).
  - **Discharges:** the round-6 §3.4 friction's substrate-side anchor; backlog B13's discharge-readiness flag; placeholder #2's component 2a.

- **theorem `network-monoidal-functor-binary` (placeholder #2 component 2b)**.
  Restate the placeholder's monoidal-functor claim narrowed to the binary-product structure: the substrate's `compose` operator on two parallel network admissions equals the upstream protocol's parallel composition under the interfacer functor.
  This is the *only* part of placeholder #2 that survives the §2.3 reduction.
  - **Depends-on:** `interfacer-counit-law-uniformity`, `federation-path-metrics-multiplicative`, `federation-convergence`, `quantale-graded-composition-uniformity`.
  - **Class:** engineering-claim.
  - **Status:** draft (proof requires checking that the parallel-composition coherences in the upstream protocol's category map to the substrate's $\odot$-parallel-fusion under the interfacer functor; one to two pages).
  - **Discharges:** placeholder #2's component 2b — the residue of the original placeholder.

The combined effect: placeholder #2's surface shrinks from "author the monoidal-functor theorem" to "author the binary-parallel monoidal-coherence corollary."
The capability non-amplification half of the original placeholder's intent is already in the theorem ledger; only the binary-parallel structural claim is genuinely new authoring.

---

## §3. Model-supersession IS forward-migration; tower-fold IS its iteration

[Round-6 §3.7](frontier-survey-2026-05-05-round-6.md) names *model-supersession-as-substrate-edge-not-deletion* as the v0.9 publishing-and-learning milestone's deep-horizon friction.
The Western default refused is "delete-on-retrain or move-to-archive"; the discipline preserved is "supersession as substrate edge; older model dispatch replayable."
Backlog B15 records the conformance-vector contribution.

[Round-7 §3.4](frontier-survey-2026-05-06-round-7.md) lifts this to a captain-question on whether voidmath F9 (tower/fold) becomes a first-class kernel API; [round-7 §6](frontier-survey-2026-05-06-round-7.md) names the pattern candidate `_patterns/tower-fold-as-vocabulary-supersession.md`.
The captain question [`voidmath-kernel-surface.md`](../questions/voidmath-kernel-surface.md) recommendation **U** (medium surface — add F8 + F9 substrate-cells at v0.9) treats tower-fold as a substrate primitive needing dedicated cells.

We argue: **model-supersession is exactly [`forward-migration-preserves-prior-content`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/forward-migration-preserves-prior-content.md) specialised to a model-cell.** The tower-fold is the iteration: a transfinite chain of forward-migrations whose colimit is a directed colimit in the closure-2-monad's algebra category, with [`closure-2-monad-lax-idempotence`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md) (Kelly–Lack property-likeness) ensuring the chain has no extra structure beyond its endpoint at each step.
No new substrate cells are needed; the supersession edge is a substrate-content morphism the existing theory already names.

### §3.1. What `forward-migration-preserves-prior-content` already says

The theorem (proved, status: published) states: for two closure-rule-system versions $V_1$ and $V_2$ with $V_2$ forward-compatible over $V_1$ ($V_2 \supseteq V_1$ as rule sets), the migration of a substrate $S$ at $V_1$ produces $S'$ whose predication valuation $v'$ satisfies $v \leq_k v'$ cellwise — every $V_1$-derived predication remains, and $V_2$ may have produced additional derivations.

Substituting `model-cell` for `closure-rule-system` and `model-version` for `rule-system version`, the same theorem says: for two model versions $M_1, M_2$ with $M_2$ forward-compatible over $M_1$, the supersession from $M_1$ to $M_2$ produces a substrate whose model-derived content is monotone: nothing $M_1$ produced is lost; $M_2$ may produce additional content.

The substrate-side container the dev prose asks for is just the migration's audit-chain extension per `stepping-laws`.
The "supersession edge" is the substrate's morphism `(model-cell-of-M_1, superseded-by, model-cell-of-M_2) = t` recorded as one substrate cell, witnessed by the migration's settling step.
Older-model dispatch remains replayable per [`recovery-via-event-log-replay-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/recovery-via-event-log-replay-determinism.md): the older model's event-log entries replay byte-identically; the supersession edge is metadata about which model the substrate currently *prefers*, not about which models exist.

### §3.2. The tower-fold as iterated forward-migration

Voidmath F9 (tower/fold) — as the round-7 §3.1.5 prose names it — is "settled entities at level $n$ become atoms at level $n+1$."
The substrate-side reading: a level-$n$ predicate's settled valuation becomes a level-$(n+1)$ atom, available as an input to the closure rules at the next level.

Per [`closure-2-monad-lax-idempotence`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md), being settled is a *property* of the valuation, not extra structural data (Kelly–Lack property-likeness).
Promoting a settled cell to atom status at the next level is therefore not adding structure to the cell; it is reindexing the cell into a higher-level fiber.
Per [`predication-fiber-functor`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md), reindexing is functorial: there is a substitution functor $f^*$ from the level-$(n+1)$ fiber to the level-$n$ fiber whose image is exactly the level-$n$ settled cells.

The tower of levels is therefore a **directed system of fiber algebras** $\{A_{p_n}\}_n$ with reindexing maps $f_n^* : A_{p_{n+1}} \to A_{p_n}$, and the tower-fold is the directed colimit $\mathrm{colim}_n A_{p_n}$ in the category of fiber algebras.
Per the [`predication-fibration`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md)'s closure under directed colimits (the fibration is small-cocomplete on each fiber, by the bilattice's complete lattice structure), this colimit exists.

Each step $n \to n+1$ in the tower is a forward-migration in the sense of `forward-migration-preserves-prior-content` — the level-$n$ rule set is contained in the level-$(n+1)$ rule set (the level-$(n+1)$ rules quantify over level-$(n+1)$ atoms, which include the level-$n$ settled cells as a sub-class).
Per `forward-migration-preserves-prior-content`, level-$n$ content is preserved at level $n+1$.
Per induction, content from any earlier level is preserved at every later level.

The tower-fold is therefore: **iterated forward-migration whose colimit is a directed colimit in the predication fibration**.
No new substrate primitive; no new cells beyond the ones existing forward-migration already maintains; the supersession edge per level is the same `superseded-by` substrate cell pattern as the model-supersession case.

### §3.3. The captain question's options re-examined

The captain question [`voidmath-kernel-surface.md`](../questions/voidmath-kernel-surface.md) (round 7) presents three options:

- **T.** Minimal surface (F1.3 Void only).
- **U.** Medium surface (add F8 entangled-pairs and F9 tower/fold substrate-cells at v0.9). **Recommended by agent.**
- **V.** Maximal surface (all of F5.x, F6, F7, F8, F9 as substrate-queryable cells).

The §3.2 finding suggests the U/V distinction on F9 is over-counted.
The substrate does not need new "tower/fold substrate-cells" to support F9; the existing forward-migration discipline plus the `superseded-by` substrate-cell pattern (already in use for closure-rule-system version chains) are exactly the mechanism.
What the v0.9 slice needs is not F9 cells but the *recognition* that model-cells participate in the same supersession discipline that closure-rule-systems already do.

The captain question therefore reduces, on F9 specifically, to a documentation question: at the v0.9 authoring time, is the model-supersession surface explicitly named as a use of `forward-migration-preserves-prior-content`, or is it left implicit?
Either is theory-conformant; the surface is identical. **The structural commitment the U/V split appears to ask for is already in the theorem ledger.**

F8 (entangled-pairs) is a separate question — it is genuinely a new substrate-cell pattern (a binary cell linking two cells whose joint value carries information beyond the marginal values).
The §6 phantom-citation register below flags this as a real authoring task, not a phantom.

### §3.4. Math-side authoring proposal

One short corollary, no new objects:

- **theorem `model-supersession-as-forward-migration-corollary`** ([`predicated-computing/theorems/`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/)).
  Claim: a model-cell's supersession edge $(M_1, \text{superseded-by}, M_2) = t$ is a forward-migration in the sense of `forward-migration-preserves-prior-content` when $M_2$'s closure-rule-system extension is forward-compatible over $M_1$'s, in which case the supersession preserves all content $M_1$ produced; older-model dispatch replays from the event log per `recovery-via-event-log-replay-determinism`.
  The tower-fold (voidmath F9) is the iteration: a directed system of forward-migrations whose colimit is a directed colimit in the predication fibration, available per the fibration's small-cocompleteness on each fiber.
  - **Depends-on:** `forward-migration-preserves-prior-content`, `closure-2-monad-lax-idempotence`, `predication-fiber-functor`, `recovery-via-event-log-replay-determinism`, `predication-fibration`.
  - **Class:** engineering-claim.
  - **Status:** proved (the proof is the §3.1 + §3.2 substitution; one paragraph each).
  - **Discharges:** the round-6 §3.7 friction; the round-7 §3.4 captain-question's F9 component (recommendation **U** narrows to F8 only); backlog B15's substrate-side anchor; the pattern candidate `_patterns/tower-fold-as-vocabulary-supersession.md`.

The captain decision the question really demands on F9 is therefore not "U vs V" but a documentation-naming choice; the substrate-content commitment is identical under either option.

---

## §4. Umwelt IS fiber-projection; cross-observer coherence is fiber functoriality

[Round-7 §3.5](frontier-survey-2026-05-06-round-7.md) names *umwelt-as-fiber-projection* as the v0.7 productivity-stack milestone's deep-horizon friction.
The captain's claim is that an entity's "perception" is `respond(<entity>, <fiber>)` filtered to non-$\bot$ — i.e., the entity perceives the predicates on which the substrate has a non-bottom valuation in the fiber over that entity.
The Western default refused is "per-app perception subsystem"; the discipline preserved is "single fiber-projection primitive shared across perception / relevance / dispatch."
The pattern candidate `_patterns/umwelt-as-fiber-projection.md` is named in round-7 §6.

We argue: **the umwelt notion has direct theoretical support.** The umwelt of an entity $e$ in a substrate $\mathcal{S}$ is, by definition, the image of the fiber-projection functor [`predication-fiber-functor`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md) at $e$, restricted to the non-$\bot$ sub-presheaf.
Cross-observer coherence (two observers agreeing on what entity $e$ perceives) is a corollary of fiber functoriality; it is structurally guaranteed, not an engineering convention.

### §4.1. The fiber functor as the umwelt operator

[`predication-fiber-functor`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md) (proved, with Lean witnesses: `PredicationCategories.
Categorical.
PredicateMap.fiberFunctor` and seven companion lemmas) gives the contravariant functor

$$F : \mathcal{C}^{\mathrm{op}} \longrightarrow \mathbf{DBiLat}(\mathbf{L})$$

from the predicate category (op-ed) to distributive bilattices over $\mathbf{L}$.
The functor's action on the four predicate-generator classes is given pointwise on $E \times E$ index pairs:

- [predicate specialization](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-specialization.md) $f : q \to p$ along an inclusion $\iota_f : \mathrm{dom}(q) \hookrightarrow \mathrm{dom}(p)$ acts as restriction: $$f^*(v)(s,o) = \begin{cases} v(s,o) & (s,o) \in \mathrm{dom}(q),\\ \bot & \text{otherwise.}\end{cases}$$
- [predicate converse](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-converse.md) acts as the swap $f^*(v)(s,o) = v(o,s)$.
- [predicate subject-projection](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-subject-projection.md) acts as the diagonal collapse $f^*(v)(s,o) = v(s,s)$.
- [predicate object-projection](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-object-projection.md) acts as the diagonal collapse $f^*(v)(s,o) = v(o,o)$.

For an entity $e \in E$, the umwelt operator the captain names is **specialization-at-$e$**: the specialization $f_e : p|_e \to p$ along the inclusion $\iota_{f_e} : \{e\} \times E \hookrightarrow E \times E$ (or, symmetrically, along $E \times \{e\}$ for the as-object umwelt).
The image $f_e^* v$ retains $v$'s value on cells involving $e$ in the chosen position and sends every other cell to $\bot$.
The non-$\bot$ image is exactly "the predicates on which the substrate has a non-bottom valuation involving $e$" — what the captain calls the entity's umwelt.

The subject-projection and object-projection morphisms in the theorem are *distinct* from this construction: they collapse to the $(s,s)$ or $(o,o)$ diagonal across all entities, not at a single $e$.
They appear in §4.3 below as the introspection / `respond(self, self)` surface — the diagonal projection IS the substrate's reflexive umwelt.
The two-position umwelt at $e$ is the join (in $A_p$, by the bilattice's $\vee_k$) of the as-subject-at-$e$ specialization and the as-object-at-$e$ specialization; it is functorial as a composition of specializations.

All three constructions — specialization-at-$e$, the diagonal collapse via subject-projection, the two-position join — are images of fiber-functor morphisms per the theorem; they inherit the theorem's bilattice-homomorphism preservation and its functoriality on $\mathcal{C}$.

### §4.2. Cross-observer coherence via fiber functoriality

The captain's stronger claim — *"umwelt is invariant across observers; two distinct dispatch paths to entity $e$ produce the same umwelt"* — is a coherence claim.
It says: the umwelt does not depend on which closure rule fired most recently or which observer asked the question; it is a property of the substrate's content at $e$, full stop.

This is exactly the [`cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) discipline, applied at the predicate-fiber surface.
The theorem's structural argument:

> *Per [hash-injectivity-under-canonical-form](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/hash-injectivity-under-canonical-form.md), the canonical hash $\kappa(v)$ uniquely determines $v$.
> Per [determinism-via-fiber-functoriality](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/determinism-via-fiber-functoriality.md), $f^*$ is a function: for each input $v$, $f^*(v)$ is uniquely determined.*

Replacing "cache" with "umwelt": for a given substrate state, the umwelt of $e$ is uniquely determined by the canonical-form hash of the fiber's content over $e$.
Two observers asking the same fiber-projection question on the same substrate state get the same umwelt — *necessarily*, by the same structural argument that gives content-addressed caches their coherence.
No engineering convention is needed; the coherence is structural.

Cross-substrate (federation) umwelt-coherence follows from [`federation-convergence`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md) by the same composition: federation-merged substrates agree on every cell at the endpoint state in strict and Scott-continuous regimes; their umwelts at $e$ are therefore equal at the endpoint.

### §4.3. The "respond(self, self)" framing as a special case

Round-7 §3.6 (algebraic-learning-calculus) cites *"respond(self, self) as dreams"* as the substrate's mechanism for an entity introspecting on its own umwelt.
Per §4.1 + §4.2 above, this is the fiber-projection at the entity-as-subject restricted to the entity-as-object diagonal — the cell-set $\{(e, p, e)\}_p$ for predicates $p$ involving $e$ in both positions.
The substrate's `respond(e, e)` is the closure step of [`closure-rule-system-realizes-closure-2-monad`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/closure-rule-system-realizes-closure-2-monad.md) applied to this diagonal cell-set; the result is the entity's reflexive umwelt, available by the same fiber-projection discipline.

This composition does not require new structure.
The introspection surface is the existing fiber functor restricted to the diagonal; the closure step is the existing closure 2-monad; the result is structurally coherent across observers per §4.2.

### §4.4. Math-side authoring proposal

One short corollary; no new objects (the math-side primitives all exist with Lean witnesses):

- **theorem `umwelt-as-fiber-projection-with-coherence`** ([`predicated-computing/theorems/`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/)).
  Claim: for an entity $e$ in a substrate $\mathcal{S}$, the umwelt of $e$ in a fiber $A_p$ is the non-$\bot$ image of the [`predication-fiber-functor`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md)'s **specialization-at-$e$** along the inclusion $\{e\} \times E \hookrightarrow E \times E$ (as-subject umwelt), or symmetrically along $E \times \{e\}$ (as-object umwelt), or the bilattice $\vee_k$-join of the two (two-position umwelt).
  The reflexive (introspection) umwelt is the diagonal-collapse image obtained via the subject-projection (or object-projection) morphism, restricted at the substrate-content level to the cell $(e,p,e)$.
  Cross-observer coherence on a single substrate is structural by [`cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) applied to the fiber-projection.
  Cross-substrate coherence under federation is structural by [`federation-convergence`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md) at the endpoint state in strict and Scott-continuous regimes (and on trajectory increments in transfinite-bounded and aperiodic regimes per round-1 [`theory-side-research-notes-2026-05-03.md`](theory-side-research-notes-2026-05-03.md) §1).
  - **Depends-on:** `predication-fiber-functor`, `cache-coherence-via-functorial-projection`, `determinism-via-fiber-functoriality`, `federation-convergence`, `hash-injectivity-under-canonical-form`.
  - **Class:** engineering-claim.
  - **Status:** proved (the proof is the §4.1 + §4.2 substitution).
  - **Discharges:** the round-7 §3.5 friction; the pattern candidate `_patterns/umwelt-as-fiber-projection.md`'s anchor; the v0.7 productivity-stack's "what tasks can this office see" surface; the round-7 §3.6 "respond(self, self) as dreams" composition.

The Uexküll umwelt notion the captain's triage cluster carries thus has direct math-side support; the substrate's perception surface is structurally one phenomenon at multiple engineering surfaces (perception / relevance / dispatch / introspection), exactly as round-7 §3.5's verdict claimed.

---

## §5. World-tick IS the closure-2-monad heartbeat-application; no new primitive

[Round-7 §3.8.2](frontier-survey-2026-05-06-round-7.md) names *daemon-world-tick* as a v0.5 capability hook: every entity that has an active bypass adjacency fires; effect-decay closure rules fire as part of the same tick.
The pattern candidate `_patterns/world-tick-as-heartbeat-fold.md` is named in round-7 §6.
Backlog B22 records the conformance-vector contribution.

We argue: **the world-tick is engineering vocabulary for one application of the closure 2-monad to the heartbeat-triggered firable subset.** Convergence is [`wavefront-termination`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/wavefront-termination.md); locality is [`wavefront-locality-via-cohomology-vanishing`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/wavefront-locality-via-cohomology-vanishing.md); determinism is [`settlement-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/settlement-determinism.md); replay is [`recovery-via-event-log-replay-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/recovery-via-event-log-replay-determinism.md).
No new theorem is needed; the pattern candidate is a naming convention on existing primitives.

### §5.1. The world-tick as a closure step

The substrate's heartbeat (per the existing dev-doc decision [decisions/heartbeat-is-the-scheduler](../decisions/heartbeat-is-the-scheduler.md)) fires periodic respond invocations.
Per [`closure-rule-system-realizes-closure-2-monad`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/closure-rule-system-realizes-closure-2-monad.md), each respond invocation is one application of the closure 2-monad $\mathrm{Cl}^\mathcal{S}$ at the responding scope.
A heartbeat-triggered respond covering "every firable entity" is the same closure step applied to the union of all firable entities' fibers; per the closure 2-monad's lax-idempotence, the result is a fixed point of the closure operator at that union.

"Effect-decay closure rules fire as part of the same tick" is the declaration that decay rules (sensor-staleness $\bot$-decay, actuation-effect-window expiry, etc.) are part of the substrate's closure-rule system, indexed by predicate and triggered by the heartbeat's ordinal.
There is no new substrate state required; decay is settling under closure rules whose triggering condition involves the substrate-clock's monotonic-ordinal advancement per [`monotonic-clock-discipline`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/monotonic-clock-discipline.md).

Per [`wavefront-termination`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/wavefront-termination.md), the closure step terminates (the wavefront converges); per [`wavefront-locality-via-cohomology-vanishing`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/wavefront-locality-via-cohomology-vanishing.md), the step's effects are local in the cohomology-bounded sense (changes propagate only to cells reachable in the wavefront's locality cover).
These two together give the world-tick its operational properties: it terminates in bounded time and changes only the cells it should.

### §5.2. The pattern candidate is a naming convention

The round-7 §6 pattern candidate `_patterns/world-tick-as-heartbeat-fold.md` is therefore not a new structural claim.
It is a documentation-pattern naming the composition

```
heartbeat-tick = closure-2-monad applied to (firable-entities ∪ decay-affected-entities)
```

and providing implementation guidance: which substrate cells are the "firable-entities" set (cells whose closure-rule triggering conditions are satisfied at the current heartbeat ordinal), how the decay rules are indexed for efficient detection, what the witness-emission discipline is for the bulk respond.
None of this is new theory; all of it is engineering ergonomics over the existing closure-2-monad realization theorem.

The captain decision the round-7 §6 candidate appears to demand — "should the world-tick be a dedicated kernel API or a composed pattern?" — is a documentation/API-surface choice, not a structural choice.
Either way the substrate's algebra is the same; the difference is whether the SDK exposes `world_tick()` as a verb or whether it is composed in userland from `respond` over the firable-entity scope.

### §5.3. Math-side authoring proposal

Zero theorems; one engineering pattern doc:

- **engineering pattern `_patterns/world-tick-as-heartbeat-fold.md`** ([`docs/dev/specs/_patterns/`](../specs/_patterns/)).
  Names the composition: world-tick = closure-2-monad applied to (firable-entities ∪ decay-affected-entities) at the heartbeat's ordinal.
  Cites `closure-rule-system-realizes-closure-2-monad`, `wavefront-termination`, `wavefront-locality-via-cohomology-vanishing`, `settlement-determinism`, `recovery-via-event-log-replay-determinism`, `monotonic-clock-discipline`.
  Provides implementation guidance for the firable-entities set, the decay-rule indexing, and the witness-emission discipline. **No math-side authoring is required** — the substrate algebra is already complete for this composition.
  - **Discharges:** the round-7 §3.8.2 friction; the pattern candidate's substrate-side anchor; backlog B22's discharge-readiness flag.

This is the strongest possible disposition: the substrate is already algebraically complete for the world-tick; only documentation is needed.

---

## §6. Phantom-citation register (rounds 5–7)

The rounds 5–7 prose cites several theorem names that do not exist on disk under either [`predicated-computing/theorems/`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/) or [`predication-categories/theorems/`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/).
Each is paired below with the existing-on-disk theorem that does the work the prose attributes to the phantom.
The next dev-doc editorial sweep can do the path-rewrites mechanically.

| Phantom name (rounds 5–7) | Existing-on-disk replacement | Cited from |
|---|---|---|
| `vote-as-bilattice-fold` | `graded-dispatch-via-q-enriched-fusion` (with $\mathsf{Q}$ trivial) + `paraconsistency-as-substrate-discipline` (for $\top$-retention) | round-6 §2.3 + §3.6; round-6 backlog B7 |
| `progress-rollup-as-fiber-fold` | `graded-dispatch-via-q-enriched-fusion` (with $\mathsf{Q}$ progress-percent) + `predication-fiber-functor` (for cross-fiber substitution) | round-6 §2.3 + §3.6 |
| `lawvere-cost-quantale` | `cost-composition-via-lawvere-quantale` (note: theorem, not object) + the math-side example `predication-categories/examples/benchmarks/benchmark-lawvere-quantale-settling.md` | round-6 §2.2 |
| `bounded-settlement-busaniche-cignoli` | `settlement-via-closure-2-monad` + `closure-2-monad-lax-idempotence` (math side) for the boundedness; `wavefront-termination` for the operational bound | round-6 §2.1 |
| `lawvere-quantale-of-fuel` (math-side object) | `cost-composition-via-lawvere-quantale` (theorem; the object the placeholder named is the substrate-side container, addressed in round-1 §2 as `cost-quantale-of-fuel`) | placeholder #1; round-6 §B11 |
| `event-log-is-the-history` (decision) | [`decisions/event-log-is-jsonl.md`](../decisions/event-log-is-jsonl.md) is the closest existing decision; `event-log-is-the-history` is not on disk under [`decisions/`](../decisions/) | round-6 §2.1 |
| `cells-are-files-files-are-cells` (decision) | [`decisions/everything-is-a-cell-not-a-file.md`](../decisions/everything-is-a-cell-not-a-file.md) is the closest existing decision; `cells-are-files-files-are-cells` is not on disk | round-7 §3.3 |
| `dispatch-matching` (concept, cited in `graded-dispatch-via-q-enriched-fusion`'s depends-on) | Located in the [`agential-orchestration-platform`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/) sub-theory; the cite path is correct, but the entity is in a sub-theory not always loaded by reciprocal-indexing audits | passim |

Two genuinely new authoring asks (not phantoms; the math is real and absent):

- **F8 entangled-pairs as substrate cells** — the round-7 §3.4 captain-question recommendation U includes F8 alongside F9.
  F9 reduces per §3 above; F8 is genuine new structure.
  The substrate-cell form: a binary cell $(e_1, \text{entangled-with}, e_2) = v$ with a joint-history sub-record carrying information beyond the marginal cells at $e_1$ and $e_2$.
  The math-side anchor would be a new object (or theorem) characterising the joint-cell as a non-decomposable element of the tensor of fibers $A_{p_1} \otimes A_{p_2}$. **Forward-pointer:** `AUTHOR-MATH-SIDE-IN-v0.9` (alongside the `model-supersession-as-forward-migration-corollary` theorem proposed in §3.4).
- **Network monoidal-functor binary-parallel coherence** — placeholder #2 component 2b per §2.4. **Forward-pointer:** `AUTHOR-MATH-SIDE-IN-v0.4` (the original placeholder disposition, narrowed to component 2b only).

---

## §7. Summary

Five sites; in all five, the dev plan's question about theory-side silence is answerable from existing theory once the right citations are made.
Phantoms cited in the rounds 5–7 prose obscured the answers; the citation register in §6 enables a mechanical editorial sweep.

| Site | Prose claim | Theory-side finding | Math authoring needed |
|---|---|---|---|
| §1 tier-routing-as-fold | "needs `vote-as-bilattice-fold` + `progress-rollup-as-fiber-fold`" | The fold is `graded-dispatch-via-q-enriched-fusion` specialised by choice of quantale and meet axis. | One corollary (`cell-set-fold-as-graded-dispatch-specialization`); discharges placeholder #6. |
| §2 SDK capability non-amplification | "needs new SDK-boundary theorem" | `agent-self-queueing-bounded-by-modal-restriction` already proves the substantive content; SDK boundary is one of `interfacer-counit-law-uniformity`'s "multiple surfaces." | One corollary (`sdk-import-non-amplifying-via-modal-restriction-composition`); placeholder #2 narrows to component 2b only. |
| §3 model-supersession + tower-fold | "needs F9 substrate-cells; needs supersession primitive" | Model-supersession IS `forward-migration-preserves-prior-content` for model-cells. Tower-fold IS its iteration; the colimit exists in the predication fibration. | One corollary (`model-supersession-as-forward-migration-corollary`); the captain question's U/V split on F9 reduces to a documentation-naming choice. F8 remains genuine new authoring. |
| §4 umwelt-as-fiber-projection | "needs umwelt primitive" | Umwelt IS the non-$\bot$ image of `predication-fiber-functor` at the entity. Coherence IS `cache-coherence-via-functorial-projection`. | One corollary (`umwelt-as-fiber-projection-with-coherence`); zero new objects; Lean witnesses already exist for the math-side primitives. |
| §5 world-tick-as-heartbeat-fold | "needs world-tick primitive" | World-tick IS one closure-2-monad application to the heartbeat-triggered firable subset. Convergence + locality + determinism + replay all already proved. | Zero theorems; one engineering pattern doc naming the composition. |

Four new theorems, zero new objects (one new object — F8 entangled-pairs — flagged as forward-pointer for v0.9).
All four theorems are short corollaries citing existing primitives; each is one paragraph of proof and discharges its target friction or placeholder.
No edits required to [`predication-categories/`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/) for §1, §2, §3, §5; §4 cites existing math-side `predication-fiber-functor` (with Lean witnesses) without modification.

Captain-side observations:

1. The captain question [`voidmath-kernel-surface.md`](../questions/voidmath-kernel-surface.md) recommendation **U** narrows on F9: F9 is documentation-naming, not new substrate-cells.
  F8 remains genuine.
2. The placeholder-theorem #2 (`network-as-monoidal-functor`) shrinks: its capability-non-amplification half is already proved at the agent surface and lifts to the network surface by composition.
  Only the binary-parallel monoidal-coherence component (2b) remains.
3. The placeholder-theorem #6 (`predication-cell-as-fold-source`) shrinks: it is one corollary of the existing `graded-dispatch-via-q-enriched-fusion` rather than new structural authoring.
4. Five phantom theorem names are recurring in the rounds 5–7 prose; the §6 register enables a mechanical editorial sweep to repair the citations.
  The sweep is records-shape (citation rewrites only) and can be done in one editorial pass without touching any normative spec.

The dev-doc rewrites the §6 register implies are within scope of the next records-only survey round (a "post-v0.2a-ship refocus" survey per [`frontier-survey-2026-05-05-round-6.md`](frontier-survey-2026-05-05-round-6.md) §9's first option) and do not require captain ratification; the four proposed theorems are within scope of their respective milestone authoring slices (v0.4, v0.6, v0.7, v0.9).

## §8. Cross-references

- [`theory-side-research-notes-2026-05-03.md`](theory-side-research-notes-2026-05-03.md) — round 1; this note's predecessor.
- [`placeholder-theorems-2026-05-03.md`](placeholder-theorems-2026-05-03.md) — placeholder audit; this note discharges entries #6 (§1) and shrinks entry #2 (§2).
- [`frontier-survey-2026-05-04-round-5.md`](frontier-survey-2026-05-04-round-5.md) — round 5 (cited from §1 + §3).
- [`frontier-survey-2026-05-05-round-6.md`](frontier-survey-2026-05-05-round-6.md) — round 6 (the deep-horizon walk; cited throughout).
- [`frontier-survey-2026-05-06-round-7.md`](frontier-survey-2026-05-06-round-7.md) — round 7 (the triage-inward walk; cited from §3, §4, §5).
- [`../questions/voidmath-kernel-surface.md`](../questions/voidmath-kernel-surface.md) — captain-question §3 narrows.
- [`../specs/_patterns/_index.md`](../specs/_patterns/_index.md) — pattern-extraction backlog the §1, §3, §4, §5 candidates are registered in.
- [`../specs/conformance-vectors-backlog.md`](../specs/conformance-vectors-backlog.md) — backlog entries B7, B11, B13, B15, B22 the §1, §2, §3, §5 corollaries discharge.
- Library entry-points cited throughout:
  - [`predicated-computing/theorems/graded-dispatch-via-q-enriched-fusion.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/graded-dispatch-via-q-enriched-fusion.md)
  - [`predicated-computing/theorems/quantale-graded-composition-uniformity.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/quantale-graded-composition-uniformity.md)
  - [`predicated-computing/theorems/agent-self-queueing-bounded-by-modal-restriction.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/agent-self-queueing-bounded-by-modal-restriction.md)
  - [`predicated-computing/theorems/interfacer-counit-law-uniformity.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law-uniformity.md)
  - [`predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md)
  - [`predicated-computing/theorems/forward-migration-preserves-prior-content.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/forward-migration-preserves-prior-content.md)
  - [`predicated-computing/theorems/cache-coherence-via-functorial-projection.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md)
  - [`predicated-computing/theorems/closure-rule-system-realizes-closure-2-monad.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/closure-rule-system-realizes-closure-2-monad.md)
  - [`predicated-computing/theorems/wavefront-termination.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/wavefront-termination.md)
  - [`predicated-computing/theorems/wavefront-locality-via-cohomology-vanishing.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/wavefront-locality-via-cohomology-vanishing.md)
  - [`predicated-computing/theorems/recovery-via-event-log-replay-determinism.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/recovery-via-event-log-replay-determinism.md)
  - [`predicated-computing/theorems/paraconsistency-as-substrate-discipline.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/paraconsistency-as-substrate-discipline.md)
  - [`predicated-computing/theorems/federation-convergence.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md)
  - [`predication-categories/theorems/predication-fiber-functor.md`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md)
  - [`predication-categories/theorems/closure-2-monad-lax-idempotence.md`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md)
  - [`predication-categories/theorems/modal-necessity-basic-properties.md`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-necessity-basic-properties.md)
  - [`predication-categories/morphisms/twist-product-fusion.md`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md)
