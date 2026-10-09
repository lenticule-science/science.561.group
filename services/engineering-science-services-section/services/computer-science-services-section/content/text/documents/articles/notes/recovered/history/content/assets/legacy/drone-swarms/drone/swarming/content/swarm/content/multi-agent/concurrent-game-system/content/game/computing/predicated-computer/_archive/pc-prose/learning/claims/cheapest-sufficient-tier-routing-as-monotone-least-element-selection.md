---
type: theorem
class: engineering-claim
status: proved
depends-on: [cost-composition-via-lawvere-quantale, cost-discipline-reads-free, dispatch-composes-authorization]
see-also: [graded-dispatch-via-q-enriched-fusion, scott-continuity-as-checkpointability, federation-path-metrics-multiplicative]
---

# Cheapest-sufficient tier routing is monotone least-element selection on a finite chain

**Claim.** Let $\mathbf{T} = (\mathrm{tier\text{-}1} < \mathrm{tier\text{-}2} < \mathrm{tier\text{-}3})$ be the totally-ordered tier chain (cost-monotone: lower index = cheaper per-respond). Let $\mathrm{Adm}(o) \subseteq \mathbf{T}$ be the office's admissibility set (per `permits-tier`/`denies-tier` cells and formality-layer default), and let $\mathrm{Suff}(\mathrm{respond}) \subseteq \mathbf{T}$ be the *upward-closed* set of tiers on which a given respond is sufficient (settled at non-$\bot$ for every expected-output predicate; or above the tier-2 model's confidence threshold; tier-3 always sufficient by spec §1). Then the dispatch scheduler's tier-choice map

$$\mathrm{route}_o(\mathrm{respond}) \;=\; \begin{cases} \min\bigl(\mathrm{Adm}(o) \cap \mathrm{Suff}(\mathrm{respond})\bigr) & \text{if non-empty,}\\ \bot \text{ (denied; emits \texttt{PCS\_TIER\_ESCALATION\_DENIED})} & \text{otherwise} \end{cases}$$

is well-defined on the finite chain $\mathbf{T}$, *monotone* in $\mathrm{Adm}$ and in $\mathrm{Suff}$ under set-inclusion (anti-monotone in the cost order), and the per-respond escalation chain `tier-1 → tier-2 → tier-3` is the *forward-only finite trajectory* the substrate uses to discover $\mathrm{route}_o$ when sufficiency is observed empirically (one tier-attempt per step). Because $\mathbf{T}$ is finite and the trajectory is strictly increasing, the trajectory terminates in at most $|\mathbf{T}| = 3$ steps.

## Why this holds

The well-definedness of $\mathrm{route}_o$ on the non-empty case is the standard fact that *every non-empty subset of a finite total order has a minimum*; $\mathbf{T}$ has three elements, the intersection $\mathrm{Adm}(o) \cap \mathrm{Suff}(\mathrm{respond})$ is a subset of $\mathbf{T}$, so $\min$ is well-defined whenever the intersection is non-empty. When empty, the substrate emits `PCS_TIER_ESCALATION_DENIED` per spec §10 — this is the explicit non-totality of $\mathrm{route}_o$, surfaced as an error rather than treated as a default.

Sufficiency is *upward-closed* in $\mathbf{T}$ by the spec's structural commitment in §1: tier-3 (LLM inference) can answer any respond tier-2 (statistical model) can answer (the model's recorded output is reproducible as text), and tier-3 can answer any respond tier-1 (algebraic substrate) can answer (the algebra's derivation is reproducible as a derivation trace). So if $T \in \mathrm{Suff}(\mathrm{respond})$ then $T' \in \mathrm{Suff}(\mathrm{respond})$ for every $T' \ge T$. Equivalently, the *insufficiency* set is downward-closed.

Per [cost-composition-via-lawvere-quantale](cost-composition-via-lawvere-quantale.md), per-respond cost lies in the additive Lawvere quantale $\mathcal{V} = ([0, \infty], +, \min)$. Each tier carries a per-respond cost contribution (tier-1: $\sigma/\Delta$-engine fuel; tier-2: inference fuel plus amortized weight-load; tier-3: LLM token spend); per spec §1 the tiers are strictly cost-ordered, so the embedding $\mathbf{T} \hookrightarrow \mathcal{V}$ is order-preserving. The substrate's "cheapest sufficient" choice is therefore the minimum of $\mathrm{Adm}(o) \cap \mathrm{Suff}$ both in $\mathbf{T}$ and in $\mathcal{V}$.

Monotonicity follows from minimum's order-preservation properties:

- **Monotone in $\mathrm{Suff}$.** If $\mathrm{Suff}_1 \subseteq \mathrm{Suff}_2$ (a respond is sufficient on more tiers), then $\mathrm{Adm} \cap \mathrm{Suff}_1 \subseteq \mathrm{Adm} \cap \mathrm{Suff}_2$, so $\min(\mathrm{Adm} \cap \mathrm{Suff}_2) \le \min(\mathrm{Adm} \cap \mathrm{Suff}_1)$ in $\mathbf{T}$ — more sufficiency only makes the chosen tier cheaper or equal, never more expensive.
- **Monotone in $\mathrm{Adm}$.** If $\mathrm{Adm}_1 \subseteq \mathrm{Adm}_2$ (the office permits more tiers), the same monotone-min argument applies: the chosen tier becomes cheaper or stays the same. Adding `denies-tier` cells can only push the routed tier upward (more expensive), never downward.

The per-respond escalation chain in spec §6 is the substrate's observational discovery of $\mathrm{route}_o$ when $\mathrm{Suff}$ is not known a priori: try tier-$k$, observe whether it settles, escalate to tier-$(k{+}1)$ if not. Because the trajectory is strictly increasing on the finite chain $\mathbf{T}$, it terminates in at most three steps; because sufficiency is upward-closed, the first tier that succeeds is the minimum of $\mathrm{Suff}$ above the starting tier, hence (when intersected with $\mathrm{Adm}$ and starting at $\min \mathrm{Adm}$) precisely $\mathrm{route}_o(\mathrm{respond})$.

The escalation cells `(tier-escalated-from, tier-escalated-to)` are the substrate's witness chain for the trajectory's stepwise advance. Per [cost-discipline-reads-free](cost-discipline-reads-free.md), reading the admissibility and sufficiency cells contributes the cost-quantale's unit; only the actual tier dispatch consumes settlement fuel. Replay re-runs the trajectory deterministically because admissibility cells are substrate content and tier-3 LLM responses are recorded events (per spec §9 substitution).

## Engineering consequence

- **No-escalation-when-sufficient is a min-on-a-chain identity.** Per spec §1, "the scheduler never reaches for Tier 2 when Tier 1 has settled." This is the elementary fact that if $\mathrm{tier\text{-}1} \in \mathrm{Adm} \cap \mathrm{Suff}$, then $\min(\mathrm{Adm} \cap \mathrm{Suff}) = \mathrm{tier\text{-}1}$; no further trajectory step occurs. The discipline is structural, not a hand-coded scheduler shortcut.
- **Escalation is forward-only.** Per spec §6, "no Tier-3-to-Tier-2 de-escalation during a respond." Once the trajectory has advanced to tier-$k$, the per-respond cost in $\mathcal{V}$ has been spent and the additive quantale has no inverse. Re-trying a cheaper tier within the same respond would not undo the $\mathcal{V}$-cost; the substrate's discipline acknowledges this by monotonising the trajectory.
- **Admissibility composes by intersection.** Per spec §3, denials compose as set intersection on $\mathrm{Adm}(o)$. By the monotone-min argument, every additional `denies-tier` cell strictly shrinks (or leaves unchanged) the routed tier set; the routing decision is a monotone function of the admissibility cell projection.
- **Budget exhaustion is *not* an escalation trigger.** Per spec §8, escalation is for sufficiency, not for resource starvation. Sufficiency is a structural subset of $\mathbf{T}$; budget is a quantale value in $\mathcal{V}$. The two live in different mathematical objects; conflating them would require a non-existent homomorphism. The spec's separation is structural.
- **`PCS_TIER_ESCALATION_DENIED` is the empty-intersection witness.** When $\mathrm{Adm}(o) \cap \mathrm{Suff}(\mathrm{respond}) = \emptyset$, $\mathrm{route}_o$ has no value (the minimum of an empty subset of a finite chain is undefined); the substrate emits the dedicated error. Per [dispatch-composes-authorization](theories/agential-orchestration-platform/theorems/dispatch-composes-authorization.md), the operator-review surface is the substrate's response to an inhabitable-but-admissibility-blocked dispatch.
- **Replay is structural.** $\mathrm{route}_o$ depends only on $(\mathrm{Adm}, \mathrm{Suff})$ — both substrate cell projections (with tier-3 invocations recorded as events per spec §9). Replaying the event log re-applies the same minimum and reproduces the same routing decision, byte-identically.
- **Per-respond bound on trajectory length.** Per the finite chain $\mathbf{T}$ with $|\mathbf{T}| = 3$, the substrate's escalation costs at most three tier-attempts per respond. This caps the sufficiency-discovery overhead structurally; per [scott-continuity-as-checkpointability](scott-continuity-as-checkpointability.md), each attempt produces a checkpoint, so the trajectory is fully observable and replayable.

## What the theorem rules out

- **Non-monotone escalation chains.** A discipline that "tries tier-3 first, then falls back to tier-1" is not a strictly-increasing trajectory on $\mathbf{T}$; per the additive cost in $\mathcal{V}$, the tier-3 attempt's cost cannot be undone. The substrate's discipline is forward-only; "fallback to cheaper" within a respond is structurally rejected.
- **Tier-3 de-escalation mid-respond.** The same forward-only argument: once tier-3 has spent token cost, the quantale has no inverse. The spec's §6 prohibition on de-escalation is the additive quantale's irreversibility.
- **Budget-driven escalation.** Conflating fuel exhaustion with sufficiency would require treating $\mathcal{V}$ as a sub-order of $\mathbf{T}$; the embedding is in the opposite direction. The structures are not interchangeable.
- **Scheduler privileges outside the rule fabric.** Per spec §1, tier-routing rules are themselves substrate cells. The routing function is determined by admissibility and sufficiency cell projections; a "kernel-only" tier choice would break the witness chain (the routing decision must be reproducible from substrate content).
- **Multi-maximum cost surfaces.** A non-totally-ordered tier set with two incomparable "cheapest" tiers would have no $\min$ on the intersection; $\mathrm{route}_o$ would not be well-defined. The spec's strict total order on $\mathbf{T}$ (§1) is a structural prerequisite; introducing a fourth, incomparable tier would require either re-totalising or restating routing as the choice of an antichain (a different theorem).

## What the theorem requires

- The tier set $\mathbf{T}$ is a *finite total order* (the spec's three-tier chain satisfies this).
- Sufficiency is upward-closed in $\mathbf{T}$ (a stronger tier can answer every respond a weaker tier can).
- Admissibility $\mathrm{Adm}(o)$ is a substrate-cell projection (so $\mathrm{route}_o$ is replayable).
- The cost embedding $\mathbf{T} \hookrightarrow \mathcal{V}$ is order-preserving (per [cost-composition-via-lawvere-quantale](cost-composition-via-lawvere-quantale.md) and the spec's §1 strict cost order).
- Escalation is monotone forward (per spec §6); de-escalation within a respond is forbidden.
- Tier-3 invocations are recorded as substrate events (per spec §9), so the discovery trajectory replays deterministically.

## Position

This theorem grounds the dev plan's informal "cheapest-sufficient" principle as the *least-element selection on a finite cost-ordered chain*, not as a full Galois adjunction. The cost-monotonicity argument is genuine; the escalation chain is a strictly-increasing finite trajectory; the forward-only commitment is the additive quantale's structural irreversibility. Together with [graded-dispatch-via-q-enriched-fusion](graded-dispatch-via-q-enriched-fusion.md) (which grounds the office-selection layer of dispatch as a $\odot$-fold) and [cost-composition-via-lawvere-quantale](cost-composition-via-lawvere-quantale.md) (which grounds per-tier cost composition), this completes the structural decomposition of the dispatch scheduler: office-routing is a bilattice-graded $\odot$-fold, tier-routing is monotone least-element selection on a finite cost chain, and budget enforcement is a quantale ceiling on the resulting $\otimes$-composition. The three layers are mathematically distinct, structurally non-substitutable, and per the spec's §11 composition table — wired into the rule fabric as separate closure-rule layers.
