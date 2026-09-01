---
type: theorem
status: proved
depends-on:
  - multi-observer-system-with-rules
  - distributed-settling-system
  - crdt-convergence
  - crdt-convergence-via-mayer-vietoris
  - transfinite-settling-convergence
  - knowledge-order
  - predication-fiber-algebra
see-also:
  - benchmark-multi-observer-disagreement
  - cohomological-calm
  - toward-agentic-swarm-theory
---

# CRDT convergence with per-observer rules

The corpus's [CRDT convergence theorem](crdt-convergence.md) and its [Mayer–Vietoris reformulation](crdt-convergence-via-mayer-vietoris.md) are stated for distributed-settling-systems in which all replicas evolve under a *shared* closure rule system. This theorem extends the convergence result to [ruled multi-observer systems](../objects/multi-observer-system-with-rules.md) in which observers may carry *distinct* closure rule systems.

The extension is structurally light — the convergence proof of the existing CRDT theorem rests on the bilattice knowledge-order $\vee_k$ being associative, commutative, idempotent, and on per-replica closure-driven settlings reaching quiescence. None of these depend on the rule systems being shared; the proof transfers verbatim with the substitution "rule system" → "per-observer rule system."

What the extension *does* contribute is a structural distinction between two qualitatively different sources of paraconsistency in multi-agent settings:

- **Evidence-layer paraconsistency** (already in the corpus's [multi-observer disagreement benchmark](../examples/benchmarks/benchmark-multi-observer-disagreement.md)): observers with the same rule system but different initial evidence produce $\top$-content via cellwise join.
- **Inferential-layer paraconsistency** (new with this theorem): observers with the same evidence but different rule systems produce $\top$-content because their distinct rules infer contradictory consequences from shared data.

Both produce $\top$ via the same cellwise $\vee_k$ mechanism; the structural distinction is in *why* the disagreement arose.

## Statement

**Theorem (CRDT convergence with per-observer rules).** *Let $(O, V, r)$ be a [ruled multi-observer system](../objects/multi-observer-system-with-rules.md) with $O$ discrete. Then:*

1. **Joint convergence.** *The cellwise bilattice knowledge-join over observers,*
   $$\bigl(\textstyle\bigvee_k V\bigr)_\tau(p)(s, o) \;:=\; \textstyle\bigvee_{o \in O} V(o)_\tau(p)(s, o),$$
   *is well-defined and stabilizes at a closure ordinal $\kappa^* := \sup_o \kappa_o$, where $\kappa_o$ is the closure ordinal of $V(o)$ under $\mathcal S_o$.*

2. **CRDT structure.** *The merge operation is associative, commutative, and idempotent over observers; the joint state at quiescence is independent of merge order. CRDT-style convergence holds without coordination among observers.*

3. **Independence from rule-system agreement.** *No assumption that $\mathcal S_{o_1} = \mathcal S_{o_2}$ for distinct observers is required. The theorem holds for arbitrary per-observer rule data.*

4. **Mayer–Vietoris vanishing.** *For any replica cover of any clopen $U$ on the bitopological settling site beneath the joint settling, the connecting Mayer–Vietoris homomorphism $\delta^0$ on the settling-associated sheaf of $\bigvee_k V$ vanishes, by [CRDT convergence via Mayer–Vietoris](crdt-convergence-via-mayer-vietoris.md). The cohomological CALM-compatibility of the joint settling holds.*

## Proof

The proof rests on three observations, all from existing corpus theorems with the per-observer-rule data added.

**Observation 1: bilattice $\vee_k$ is rule-independent.** The cellwise knowledge-order join $\vee_k$ is a bilattice operation depending only on the bilattice value category $\mathbf L^\bowtie$ — see the [predication fiber algebra](../objects/predication-fiber-algebra.md). It is associative, commutative, idempotent on the underlying bilattice; cellwise extension to the predication-fiber-algebra preserves these. None of these properties depend on closure rule systems.

**Observation 2: per-observer convergence.** Each $V(o)$ is closure-driven by $\mathcal S_o$. By the [transfinite settling convergence theorem](transfinite-settling-convergence.md) (when $\mathcal S_o$ generates a Scott-continuous closure operator) or by the regime-specific convergence results (for non-Scott-continuous cases), $V(o)$ stabilizes at a closure ordinal $\kappa_o$. For finite observer sets and finite bases, $\kappa_o < \omega$ (strict regime); for richer bases, $\kappa_o$ can be transfinite-bounded or aperiodic, but each is a well-defined ordinal regardless.

**Observation 3: joint convergence at $\kappa^* = \sup_o \kappa_o$.** Set $\kappa^* := \sup_o \kappa_o$. For finite $O$ this is the maximum (a finite supremum of ordinals is an ordinal); for countable $O$ it remains an ordinal at most $\omega_1$. At stage $\kappa^*$, every $V(o)$ has stabilized — i.e., $V(o)_{\kappa^*+1} = V(o)_{\kappa^*}$ for all $o$. The cellwise join at stage $\kappa^*$ inherits stability: $(\bigvee_k V)_{\kappa^*+1} = \bigvee_o V(o)_{\kappa^*+1} = \bigvee_o V(o)_{\kappa^*} = (\bigvee_k V)_{\kappa^*}$. The joint settling stabilizes.

**Combining (1)–(3).** Joint convergence (claim 1) is Observation 3. CRDT structure (claim 2) is Observation 1. Independence from rule-system agreement (claim 3) is the explicit non-use of rule-system equality in Observations 1–3. Mayer–Vietoris vanishing (claim 4) follows from applying [CRDT convergence via Mayer–Vietoris](crdt-convergence-via-mayer-vietoris.md) to the joint settling $\bigvee_k V$, which is a well-defined settling on the bitopological site by claim 1; the cited theorem's hypotheses (settling-associated sheaf with the right structure on a replica cover) are met. $\square$

## Worked instance: two observers with contrary rules

The smallest case where the per-observer-rule extension makes a structural difference: two observers with the *same evidence* but *contrary inference rules*.

**Setup.**
- Base: $\mathbf L = \mathbf 2$, $E = \{a, b\}$, $\Pi = \{X, Y\}$, $\mathcal C$ discrete, $\lambda = 2$.
- Observer category $O = \{o_1, o_2\}$ discrete.
- Initial state (shared by both observers): $v^{(0)}(X)(a, a) = \mathbf t$, all other cells $\bot$.
- Observer $o_1$'s rule system $\mathcal S_1$: $\{X(a, a) = \mathbf t \implies Y(a, a) \geq_k \mathbf t\}$ — "$X$ being true at $a$ implies $Y$ is true at $a$."
- Observer $o_2$'s rule system $\mathcal S_2$: $\{X(a, a) = \mathbf t \implies Y(a, a) \geq_k \mathbf f\}$ — "$X$ being true at $a$ implies $Y$ is false at $a$."

The two observers have *identical evidence* ($X = \mathbf t$ at $a$) but *opposing inference rules* ($X \implies Y$ vs. $X \implies \neg Y$).

**Per-observer settlings.**

Observer $o_1$:
- Stage 0: $V(o_1)(X)(a, a) = \mathbf t$, $V(o_1)(Y)(a, a) = \bot$.
- Stage 1: rule fires; $V(o_1)(Y)(a, a)$ updates to $\geq_k \mathbf t$, i.e., $\mathbf t$.
- Stage 2: no more rule applications; $V(o_1)$ stabilizes.

Observer $o_2$:
- Stage 0: $V(o_2)(X)(a, a) = \mathbf t$, $V(o_2)(Y)(a, a) = \bot$.
- Stage 1: rule fires; $V(o_2)(Y)(a, a)$ updates to $\geq_k \mathbf f$, i.e., $\mathbf f$.
- Stage 2: stabilizes.

Both observers' closure ordinals are $\kappa_1 = \kappa_2 = 1$. Per the theorem, $\kappa^* = 1$.

**Joint settling at $\kappa^* = 1$.**

Cellwise join $\bigvee_k V$:

| cell | $V(o_1)$ | $V(o_2)$ | $\bigvee_k$ |
|---|---|---|---|
| $X(a, a)$ | $\mathbf t$ | $\mathbf t$ | $\mathbf t$ (agreement) |
| $Y(a, a)$ | $\mathbf t$ | $\mathbf f$ | $\top$ (paraconsistent) |
| Other cells | $\bot$ | $\bot$ | $\bot$ |

The joint settling has $Y(a, a) = \top$ — *paraconsistent content arising purely from inferential disagreement.* Both observers agree on the evidence ($X = \mathbf t$); their rule systems produce opposing inferences about $Y$; the cellwise join records the disagreement as $\top$.

**Comparison to evidence-layer disagreement.** Per the [multi-observer disagreement benchmark](../examples/benchmarks/benchmark-multi-observer-disagreement.md): two observers with the *same rule* but *bilattice-negated initial states* ($\mathbf t$ vs $\mathbf f$ at $X$) also produce $\top$-content via cellwise join. The structural distinction between that benchmark and this one is in the *source* of the disagreement:
- Evidence-layer: disagreement at the $X$ cell (the evidence cell).
- Inferential-layer: agreement at the $X$ cell, disagreement at the $Y$ cell (the inferred cell).

Both cases produce $\top$ via the same $\vee_k$ mechanism; the cellular *location* of the $\top$ records which layer the disagreement lives at.

## Cohomological structure

Per claim 4 of the theorem and the [cohomological CALM theorem](cohomological-calm.md), the joint settling $\bigvee_k V$ has:
- $H^0 = $ joint settled state (per the structural unpacking in Observation 3).
- $H^1 = 0$ (Mayer–Vietoris vanishing on replica covers).
- $H^n = 0$ for $n \geq 2$ (by [settling cohomology vanishes above degree 1](settling-cohomology-vanishes-above-degree-1.md)).

The full d-frame structure on $H^0$, including consistency / totality relations, can be extracted via the [d-frame cohomology comparison theorem](d-frame-cohomology-comparison.md) applied to the joint settling-associated sheaf. For the worked instance above, the $\top$-cell at $Y(a, a)$ contributes to the inconsistency-side ($\mathcal F^{(\top)}$) of the bigraded decomposition, recording the inferential disagreement at the cohomological level.

## What this theorem does not establish

- **Consensus convergence.** The cellwise *meet* $\bigwedge_k V$ over observers is also rule-independently well-defined and converges, but the limit may be trivial (every cell $\bot$) when observers have substantively distinct rules — the limit captures only what *all* observers agree on inferentially. For the worked instance, $\bigwedge_k V(Y)(a, a) = \mathbf t \wedge_k \mathbf f = \bot$ — no consensus on $Y$. Consensus convergence is implied by the proof above (same argument applies to $\wedge_k$), but the limit's *content* is application-dependent.
- **Settling-morphism compatibility on non-discrete $O$.** The theorem assumes $O$ is discrete. For non-discrete $O$, settling-morphisms $V(\alpha)$ between observers with distinct rule systems require additional compatibility constraints (per the [ruled multi-observer system definition](../objects/multi-observer-system-with-rules.md)); whether the theorem extends is open.
- **Regime structure of the joint settling.** When per-observer settlings are in different closure-ordinal regimes, the joint settling's regime is well-defined ($\kappa^* = \sup_o \kappa_o$) but its [strong-MLD](strong-mld-via-composed-duality.md) orbit type and other refined invariants depend non-trivially on which observers contribute which firings; classification is open.
