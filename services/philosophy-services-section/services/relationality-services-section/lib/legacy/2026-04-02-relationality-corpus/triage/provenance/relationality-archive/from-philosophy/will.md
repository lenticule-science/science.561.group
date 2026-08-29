---
name: will
description: "A Will is a pair (d, w) — a first-order desire and a second-order volition endorsing it. The will is effective when the endorsed desire is execution-settled. Akrasia is the saturation-shadow condition: endorsed but not executed."
defines: Will
related: Teleology, Goal, Endeavor, Judgment, Duty, Person, Akrasia
requires: [person, desire]
determined-by: teleology
produces: [commitment, goal]
enables: act
contrasts-with: akrasia
date-created: 2026-03-20
date-modified: 2026-03-21
---


## Formal definition

A **Will** is a pair $\mathcal{W} = (d, w)$:

$$\mathcal{W} = (d \in H_t,\; w = \sigma_t(d) \in \mathrm{Fix}(\sigma_t))$$

where:
- $d$ is the **first-order desire** — any motivational element in the current fiber: a drive, an inclination, an appetite, an aim, a pull toward some state of affairs; $d$ is not yet endorsed — it is simply present in $H_t$; two different first-order desires may coexist and conflict; at the level of first-order desires, there is no hierarchy and no endorsement
- $w = \sigma_t(d)$ is the **second-order volition** — the saturation closure of $d$; the agent has applied the saturation nucleus to $d$, asking: what is the smallest meaning-settled element above $d$? The result $w$ is the endorsed desire — what the agent has committed to wanting to want; $w \geq d$ (saturation expands); $\sigma_t(w) = w$ (the endorsed desire is itself meaning-settled)

**Two invariants.**

1. **Endorsement structure**: the will is not the desire itself but the desire-after-endorsement. Applying $\sigma_t$ to $d$ is the act of second-order endorsement: asking whether $d$ is consistent with what the agent's whole history has settled, and raising $d$ to the minimum settled position above it. The agent who simply acts on $d$ without applying $\sigma_t$ is a **wanton** (Frankfurt's term): a being with first-order desires but no second-order volitions. The wanton does not care which desire moves them; the will does.

2. **Effectiveness condition**: the will is **effective** when $w \in \mathrm{Fix}(\Delta_t)$ — when the endorsed desire also propagates forward into action. The full condition for effective will: $w \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$. An endorsed desire that is meaning-settled but not execution-settled is a will that has not yet moved the agent.

## Akrasia: meaning-settled, transfer-open

**Akrasia** (weakness of will) is the condition:

$$w = \sigma_t(d) \quad \text{(endorsed: } w \in \mathrm{Fix}(\sigma_t)\text{)} \quad \text{but} \quad \Delta_t(w) \neq w \quad \text{(not execution-settled)}$$

The agent has endorsed $d$ — applied saturation, committed to $d$ as the desire to act from — but the endorsed desire does not transfer into action. The action-propagation fails. Meaning and execution come apart.

This is exactly the nuclear signature of an active promise ([Promise](promise.md)): meaning-closed, transfer-open. Akrasia is a promise to oneself that the self does not execute.

Davidson's formal analysis of akrasia: the agent forms an all-things-considered judgment that action $A$ is best, but forms an all-out judgment to do $B$ instead. In fiber terms: $\sigma_t(\text{do-}A) = \text{do-}A$ (the all-things-considered endorsement is meaning-settled) but $\Delta_t(\text{do-}A) \neq \text{do-}A$ (it does not transfer-settle into the action). The all-out judgment selects $\text{do-}B$, which does transfer-settle despite not being the endorsed choice.

## Willpower as nuclear application capacity

**Willpower** is not a separate formal object but a property of the agent's capacity for nuclear application: how effectively the agent can apply $\sigma_t$ to their own first-order desires and maintain the transfer-settlement of endorsed desires over time.

Baumeister's ego depletion model maps directly: willpower is a depletable resource because the capacity to apply $\sigma_t$ repeatedly in the face of competing $d_i$ draws on a finite executive resource. Repeated acts of self-regulation (applying $\sigma_t$ to override $d_{\text{competing}}$) reduce the agent's subsequent capacity for nuclear application. Recovery (rest, glucose, positive affect) restores it.

Gollwitzer's implementation intentions formalize willpower conservation: if-then plans ("if situation $Y$, then action $Z$") encode specific first-order desires $d_Z$ together with their trigger conditions $Y$, so that when $Y$ obtains, $d_Z$ is automatically move to $w = \sigma_t(d_Z)$ without requiring fresh executive application. Implementation intentions automate will: they pre-apply the saturation endorsement, reducing the nuclear application cost to near zero at the moment of action.

## Frankfurt's hierarchy

Frankfurt's analysis in "Freedom of the Will and the Concept of a Person" (1971):

- **First-order desire**: $d$ — wanting $X$
- **Second-order desire**: wanting to want $X$ (or to not want $X$) — an attitude about the first-order desire, but not necessarily effective
- **Second-order volition**: the specific second-order desire that it be *this* desire that moves one — a desire about which desire shall be one's will

The third level is what distinguishes mere second-order desire from second-order volition: you can want to want to quit smoking without having a second-order volition that the wanting-to-quit-smoking be your will. The second-order volition commits; the second-order desire merely wishes.

In fiber terms: second-order volition is the act of applying $\sigma_t$ with the intention that $w = \sigma_t(d)$ be the element that transfers-settles into action. It is not merely computing $\sigma_t(d)$ but committing to $\Delta_t(\sigma_t(d)) = \sigma_t(d)$ — committing that the endorsed desire shall be execution-settled.

## The free will of officers

For an officer in a pursuing vessel, will is the faculty that bridges intent and action. Judgment identifies the right $\alpha \in Z \cap R(f)$; will is what moves the officer to actually select and execute $\alpha$ rather than being deflected by competing first-order desires (fear, convenience, short-term incentive).

An officer with good will: $\sigma_t(\alpha) = \alpha$ (endorsed the right action given the intent) and $\Delta_t(\alpha) = \alpha$ (will transfer-settles into execution — the officer acts).

An akratic officer: $\sigma_t(\alpha) = \alpha$ (correctly endorses $\alpha$) but does not execute — the transfer-settlement fails and a different action propagates forward. This is distinct from excess of jurisdiction ($\alpha \notin Z$) or abuse of discretion ($\alpha \notin R(f)$): the akratic officer knows the right action and endorses it but fails to execute it.

## Nuclear reading

**Proposition 1 (Frankfurt hierarchy collapses at one application; the endorsement regress terminates).** Applying RelationalHistoryFiberSaturatingNucleus twice gives the same result as applying it once:

$$\mathrm{RelationalHistoryFiberSaturatingNucleus}_t(\mathrm{RelationalHistoryFiberSaturatingNucleus}_t(d)) = \mathrm{RelationalHistoryFiberSaturatingNucleus}_t(d)$$

The second-order volition is already the fixed point of the endorsement process. Wanting to want to want $d$ is the same as wanting to want $d$, which is the same as RelationalHistoryFiberSaturatingNucleus applied once.

*Proof.* By idempotence of RelationalHistoryFiberSaturatingNucleus: this is one of the three nucleus axioms — extensiveness, idempotence, meet-preservation. The iterated saturation stabilizes at the first application. $\square$

*Content.* The Frankfurtian worry that the hierarchy of second-order volitions generates an infinite regress is formally dissolved: the hierarchy is a one-step closure, not an infinite tower. A being with endorsed desires has an endorsed desire; endorsing the endorsement returns the same thing. This is not a limitation — it is the formal content of endorsement stability.

**Proposition 2 (Wanton = motivational driver not in Fix(RelationalHistoryFiberSaturatingNucleus); desire drives without endorsement).** A wanton, in Frankfurt's sense — a being that has first-order desires and acts on them without forming second-order volitions — has motivational elements $d \in H_t \setminus \mathrm{Fix}(\mathrm{RelationalHistoryFiberSaturatingNucleus}_t)$: desires that have not been subjected to saturation endorsement and are not meaning-settled relative to the agent's history. The wanton acts directly on $d$ without computing RelationalHistoryFiberSaturatingNucleus applied to $d$.

*Proof.* The wanton is characterized by the absence of the endorsement step. A desire $d \in H_t$ can motivate action regardless of whether RelationalHistoryFiberSaturatingNucleus has been applied. The wanton is the agent who takes $d$ as the action-driver without raising it to the saturation fixed point. Formally: there is no $w \in \mathrm{Fix}(\mathrm{RelationalHistoryFiberSaturatingNucleus}_t)$ that the agent treats as normatively authoritative over $d$ — the wanton's action is driven by $d$ directly. $\square$

*Content.* The wanton condition is not one of the four shadow class types of the desire itself — any desire can appear in any class. It is a property of the agent's relationship to their desire: whether they apply the endorsement operation at all. The distinction between person and wanton, in Frankfurt's framework, is the distinction between an agent who runs the saturation nucleus and one who does not.

**Proposition 3 (Akrasia = RelationalHistoryFiberSaturationShadowClass; endorsed but not executed).** The akratic will is the condition where the endorsed desire $w = \mathrm{RelationalHistoryFiberSaturatingNucleus}_t(d)$ is in Fix(RelationalHistoryFiberSaturatingNucleus) but not in Fix(RelationalHistoryFiberTransferringNucleus):

$$w \in \mathrm{RelationalHistoryFiberSaturationShadowClass}_t$$

This is exactly the saturation shadow class: elements fixed by the saturation nucleus but not the transfer nucleus.

*Proof.* Akrasia requires: endorsed ($\mathrm{RelationalHistoryFiberSaturatingNucleus}_t(w) = w$) and not executed ($\mathrm{RelationalHistoryFiberTransferringNucleus}_t(w) \neq w$). The elements satisfying exactly $\sigma$-fixed but not $\Delta$-fixed are by definition RelationalHistoryFiberSaturationShadowClass. $\square$

*Content.* The four nuclear positions of a desire give a complete classification of volitional status:
- RelationalHistoryFixedFiber ($\sigma$-fixed and $\Delta$-fixed): effective will — endorsed and executed
- RelationalHistoryFiberSaturationShadowClass ($\sigma$-fixed, not $\Delta$-fixed): akrasia — endorsed but not executed
- RelationalHistoryFiberTransferShadowClass (not $\sigma$-fixed, $\Delta$-fixed): acting without endorsement — executed but not genuinely willed
- RelationalHistoryFiberFreeShadowClass (neither): drifting desire — neither endorsed nor executed

**Proposition 4 (The endorsed desire is always between the desire and its telos; endorsement is partial settling).** For any first-order desire $d \in H_t$:

$$d \leq \mathrm{RelationalHistoryFiberSaturatingNucleus}_t(d) \leq \mathrm{RelationalHistoryFiberJointNuclearRetraction}_t(d)$$

The endorsed desire lies strictly between the raw desire and the telos (when the desire is not yet at RelationalHistoryFixedFiber). Endorsement closes the saturation gap but not the transfer gap. The effective will — the endorsed desire that is also transfer-settled — is exactly when the endorsed desire equals the telos.

*Proof.* The first inequality is extensiveness of RelationalHistoryFiberSaturatingNucleus. The second: RelationalHistoryFiberJointNuclearRetraction applied to $d$ = min of RelationalHistoryFixedFiber above $d$; RelationalHistoryFiberSaturatingNucleus applied to $d$ = min of Fix(RelationalHistoryFiberSaturatingNucleus) above $d$; since RelationalHistoryFixedFiber ⊆ Fix(RelationalHistoryFiberSaturatingNucleus), the minimum over a smaller set is at least as large. $\square$

*Content.* Endorsement is progress toward the telos, not arrival. The saturation nucleus closes half the gap (the backward-looking, history-constituted half); the transfer nucleus must close the other half (the forward-looking, execution-propagating half). The fully effective will, sitting at RelationalHistoryFixedFiber, has traversed the entire instability interval from the active envelope to the telos.

**Proposition 5 (Will aligns with teleology when endorsed desire equals the telos; misalignment is the akratic residual).** The will is **teleologically aligned** when:

$$\mathrm{RelationalHistoryFiberSaturatingNucleus}_t(d) = \mathrm{RelationalHistoryFiberJointNuclearRetraction}_t(d)$$

i.e., when the endorsed desire is already in RelationalHistoryFixedFiber. In this case the agent's endorsement already delivers the telos in one step: there is no transfer gap to close, and effective will and teleological arrival coincide.

The will is **teleologically misaligned** (akratic-adjacent) when the endorsed desire is strictly below the telos: $\mathrm{RelationalHistoryFiberSaturatingNucleus}_t(d) < \mathrm{RelationalHistoryFiberJointNuclearRetraction}_t(d)$. The agent has endorsed something that the nuclear structure will continue to press upward — the endorsed desire is not yet stable under the transfer nucleus.

*Proof.* RelationalHistoryFiberSaturatingNucleus applied to $d$ equals RelationalHistoryFiberJointNuclearRetraction applied to $d$ iff the transfer nucleus applied to RelationalHistoryFiberSaturatingNucleus applied to $d$ equals RelationalHistoryFiberSaturatingNucleus applied to $d$ — i.e., iff the endorsed desire is already transfer-settled — i.e., iff the endorsed desire is in RelationalHistoryFixedFiber. $\square$

*Content.* The teleologically aligned will is not just psychologically stable (endorsed = idempotent saturation closure) but operationally settled: both nuclei recognize it. The gap between endorsement and execution — the territory akrasia occupies — is exactly the transfer gap that remains after saturation has done its work.

## Open questions

- Whether the hierarchy of second-order volitions continues meaningfully: third-order volitions (wanting to have a certain second-order volition structure), and whether this regress terminates or is always open. In fiber terms: whether there is a fixed point of iterated $\sigma_t$ application — and since $\sigma_t$ is idempotent ($\sigma_t(\sigma_t(d)) = \sigma_t(d)$), the answer is yes: the hierarchy collapses after the first application. The Frankfurtian regress halts at the meaning-fixed point.
- Whether the effectiveness condition ($w \in H^*_t$) can fail in a way that is not akrasia — whether there are cases where the endorsed desire genuinely cannot propagate into action due to external constraint rather than weakness of will, and whether this maps formally to $\Delta_t(w) \neq w$ for reasons outside the agent's control.
- Whether Schopenhauer's cosmic Will — a blind striving with no telos — corresponds to the condition $d \in H_t \setminus \mathrm{Fix}(\sigma_t)$: a desire that has not been subjected to saturation endorsement, that is never raised to a second-order volition but simply drives from below the fixed fiber.
