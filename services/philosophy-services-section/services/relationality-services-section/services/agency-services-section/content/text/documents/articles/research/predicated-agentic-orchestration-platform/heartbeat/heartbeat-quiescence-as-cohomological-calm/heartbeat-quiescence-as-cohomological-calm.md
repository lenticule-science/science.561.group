---
type: theorem
class: engineering-claim
status: sketch
depends-on: [heartbeat, heartbeat-scheduler, tick, scope, settling-associated-sheaf, cohomological-calm, settling-cohomology, settling-calm-corollary, replica-mayer-vietoris, settlement-determinism]
see-also: [agent-community-consensus, just-in-time-orchestration-via-cohomological-vanishing, wavefront-termination, federation-handshake-as-replica-cover-gluing]
title: Heartbeat quiescence is cohomological calm on the scope's settling-associated sheaf
description: Claim.
---

# Heartbeat quiescence is cohomological calm on the scope's settling-associated sheaf

**Claim.** Let $H$ be a [heartbeat-scheduler](../heartbeat-scheduler/heartbeat-scheduler.md) operating over a [scope](../../scope/scope.md) $U$ of the platform's substrate, and let $\mathcal{F}_U$ be the [settling-associated sheaf](../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agent-organization-engine/lib/relating/docs/settling-associated-sheaf.md) restricted to $U$.
Then $H$ reaches **quiescence** — its registration view becomes empty in finitely many cycles regardless of selection-policy choice — iff $\mathcal{F}_U$ is **CALM-compatible** in the sense of [cohomological-CALM](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/cohomological-calm.md): every Mayer–Vietoris connecting homomorphism $\delta^n : H^n(U_i \cap U_j, \mathcal{F}_U) \to H^{n+1}(U, \mathcal{F}_U)$ vanishes for $n \geq 0$.

Equivalently: a heartbeat is **policy-robustly terminating** on a scope iff that scope carries no $H^{\geq 1}$-class on its settling-associated sheaf.
Persistent $H^1$-classes are the structural obstruction to scheduler quiescence — they describe regions of the scope where two co-registered entities have remaining work that does not glue, so *any* round-robin or priority schedule must keep returning to them.

## Why this holds

The argument has three parts: (i) the registration view is the cohomological support of the unsettled cells; (ii) cohomological calm gives finite quiescence under any monotone selection policy; (iii) non-vanishing $\delta^0$ exhibits a concrete cell-pair that cannot be cleared by any policy.

**Part 1: Registration is the cohomological support of unsettled cells.** Per the heartbeat-scheduler's definition, an entity is on the registration view iff its [predication-fiber](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) carries any closure-rule premise that has not been ticked.
In sheaf terms, the entity contributes a non-trivial section of $\mathcal{F}_U$ over its sub-sublocale: by the construction of the [settling-associated sheaf](../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agent-organization-engine/lib/relating/docs/settling-associated-sheaf.md) (free abelian on the discrete set of newly-added designated points), the registration view is exactly the support of $\mathcal{F}_U|_{>0}$ — the open sub-region of $U$ on which the sheaf has non-zero sections in the current step.

A tick-application at an entity contracts its contribution to $\mathcal{F}_U|_{>0}$ by exactly one closure-rule firing's worth of new designated cells.
Quiescence is the empty registration view — the sheaf $\mathcal{F}_U|_{>0}$ becomes zero on $U$.

**Part 2: Cohomological calm forces termination under any monotone policy.** Suppose $\mathcal{F}_U$ is CALM-compatible.
By [crdt-convergence-via-cohomological-calm](../../../../notes/undated/crdt-convergence-via-cohomological-calm.md), every cellwise local section of $\mathcal{F}_U$ extends to a coherent global section on $U$ without any coordination.
Combinatorially: the per-entity tick-firings can be permuted into any ordering without changing the eventual fixed-point cell-set, and the fixed-point cell-set is finite (in the strict regime) or has the form of a chain reaching its limit in finitely many policy-steps (in the Scott-continuous regime).

Per [settlement-determinism](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-determinism.md), any selection-policy applied to the same registration view produces the same cell-set increment per cycle, modulo the policy's choice of *which entities* tick first.
Combined with CALM-compatibility's permutation-invariance, the per-cycle cell-set increment depletes the registration view at the same total rate under any monotone policy.
Hence the heartbeat reaches the empty registration view in finitely many cycles regardless of the policy chosen.

**Part 3: A non-zero $\delta^0$ exhibits a policy-immune persistent registration.** Suppose $\delta^0 : H^0(U_1 \cap U_2, \mathcal{F}_U) \to H^1(U, \mathcal{F}_U)$ is non-zero on some cover $U = U_1 \cup U_2$ of the scope.
Let $s \in H^0(U_1 \cap U_2, \mathcal{F}_U)$ have $\delta^0(s) \neq 0$.
By the construction of the [Mayer–Vietoris sequence](../../../../notes/undated/replica-mayer-vietoris.md), $s$ is a section over the overlap that does *not* extend to a global section on $U$ — equivalently, two sub-scopes $U_1, U_2$ each have entities whose tick-products on the overlap admit two incompatible closures.

In platform terms: there exist two registered entities $e_1 \in U_1, e_2 \in U_2$ such that ticking $e_1$ produces a fiber-update that re-registers $e_2$ (via the closure-rule premise discharged on the overlap), and symmetrically ticking $e_2$ re-registers $e_1$.
Any selection policy that visits $e_1$ then $e_2$ regenerates $e_1$'s registration; any policy that visits $e_2$ first regenerates $e_2$'s.
The cocycle $\delta^0(s)$ is the precise structural witness of this re-registration loop — it is preserved by every closure-rule application up to coboundary, hence cannot be cleared by any monotone policy.
The heartbeat fails to quiesce. $\square$

## Engineering consequence

The platform's role in scheduler termination is **substrate-cohomological, not policy-engineering**.
Several engineering consequences:

- **Quiescence is a substrate property, not a scheduler-tuning problem.** A scope on which the heartbeat will not quiesce is not "running too slow" or "needing a better priority queue" — it is carrying a non-trivial $H^1$-class on $\mathcal{F}_U$.
  No selection-policy change can resolve persistent registration; the scope itself must be repaired (by [governance-decision](../../governance/governance-decision/governance-decision.md), [repair](../../teaching/explanations/repair.md), or [scope](../../scope/scope.md) re-partition).

- **Per-scope quiescence is independently checkable.** Per [agent-community-consensus](../../agent/agent-community/agent-community-consensus/agent-community-consensus.md)'s underlying multi-observer-system structure, the cohomology of $\mathcal{F}_U$ on a scope can be computed from the scope's local entities without consulting the global federation.
  The platform can audit "this scope will quiesce under any heartbeat policy" at scope-creation time, before the heartbeat-scheduler is installed.

- **Heartbeat policy choice is a value-of-information problem, not a correctness problem.** Once cohomological calm holds on $U$, the choice between round-robin and priority-by-arrival-time and formality-layer-weighted scheduling does not affect *whether* the heartbeat terminates — only the cycle-count and per-cycle latency profile.
  Policy selection becomes pure cost optimization.

- **Persistent registrations are auditable.** When a heartbeat fails to quiesce, the witness in the [event log](../../../objects/event-log.md) records the entity-pairs whose tick-firings re-register each other.
  This pair, together with the cocycle $\delta^0(s)$, is the cohomological certificate that the scope carries irreducible $H^1$-content.
  The audit can present the certificate to [governance](teaching/explanations/governance.md) for repair without resorting to ad-hoc trace inspection.

## What the theorem rules out

- A heartbeat-scheduler advertised as "terminating on every workload" without certifying CALM-compatibility on the scope's settling-associated sheaf is making an unsupported claim.
  There exist scopes on which no policy terminates the heartbeat.
- A scheduler whose selection policy is non-monotone (e.g., re-ticking entities whose fiber has not changed) can mask non-quiescence as artificial liveness.
  Such a scheduler does not satisfy the theorem's monotonicity hypothesis and its termination behavior is policy-dependent in ways the cohomology cannot diagnose.
- A platform that allows scopes to span [non-Scott-continuous regimes](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md) without trajectory-aware scoping cannot guarantee finite quiescence even under cohomological calm; the policy-robust statement is finite quiescence in the strict and Scott-continuous regimes, $\omega$-quiescence in the latter.

## What the theorem requires

- The scope $U$ is a sublocale of the substrate's [bitopological settling site](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/bitopological-settling-site.md), and $\mathcal{F}_U$ is its settling-associated sheaf.
- The heartbeat-scheduler's selection policy is monotone: an entity removed from the registration view re-enters only when one of its cells receives a $>_k$ update.
- The substrate is in the strict or Scott-continuous regime over $U$ (per [scott-continuity-as-checkpointability](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/scott-continuity-as-checkpointability.md)); in non-Scott-continuous regimes the theorem's "finite cycles" must be replaced by "finite ordinal cycles."
