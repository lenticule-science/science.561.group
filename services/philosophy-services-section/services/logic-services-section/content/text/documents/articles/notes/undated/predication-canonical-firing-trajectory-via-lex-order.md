---
type: theorem
class: trajectory-canonicality
status: sketch
depends-on: [closure-rule-system, closure-rule, closure-2-monad, closure-2-monad-lax-idempotence, predication-fiber-algebra, settling-monotonicity, settlement-via-closure-2-monad, independence-implies-confluence]
see-also: [closure-rule-system-realizes-closure-2-monad]
title: Canonical firing trajectory via lexicographic firing order
description: Claim.
---

# Canonical firing trajectory via lexicographic firing order

**Claim.** Let $\mathcal{S}$ be a [closure-rule system](../../research/2026/07/31/lenticule-import/from-predicate-category/teaching/explanations/closure-rule-system.md) over a [predication fiber algebra](../../research/2026/07/31/lenticule-import/objects/predication-fiber-algebra.md), each rule $r \in \mathcal{S}$ carrying a totally ordered `priority` field and a kebab-case `id`. Let $\Omega = (v_\tau)_{\tau \le \kappa}$ be a settling produced by iterating $\mathrm{cl}^{\mathcal{S}}$ from an input valuation $v_0$ to its closure-fixed-point $v_\kappa = \mathrm{cl}^{\mathcal{S}}(v_0)$. Among the (in general many) sequences of $(r, \vec{y})$ firing-pairs whose composite is the closure step $v_\tau \mapsto v_{\tau+1}$, the lexicographic order

$$\mathrm{key}(r, \vec{y}) \;:=\; \bigl(\,\mathrm{priority}(r),\; \mathrm{id}(r),\; \mathrm{lex}(\vec{y})\,\bigr)$$

— with `priority` ascending, `id` ascending kebab-case, and $\mathrm{lex}(\vec{y})$ the lexicographic order on the bind-assignment's canonicalised slug-tuple — selects a *unique* sequence $\sigma_\tau = ((r_1, \vec{y}_1), \dots, (r_m, \vec{y}_m))$ such that:

1. **Endpoint correctness.** Composing the firings of $\sigma_\tau$ as $\odot$/$\Rightarrow$ updates of $v_\tau$ produces $v_{\tau+1}$ exactly.
2. **Layer respect.** Within layer $\tau$, the prefix $\sigma_\tau^{[k]} = ((r_1, \vec{y}_1), \dots, (r_k, \vec{y}_k))$ is closed under "no firing in $\sigma_\tau$ key-precedes a firing already enabled at the start of the layer that is not in $\sigma_\tau^{[k]}$" — every key-earlier enabled firing is consumed before any key-later one.
3. **Skip-stability.** A firing-pair $(r, \vec{y})$ that has already been recorded earlier in the global trajectory is omitted (the firing-cache discipline).

Call $\sigma_\Omega = (\sigma_\tau)_{\tau < \kappa}$ the **lex-canonical firing trajectory** of $\Omega$. It is the unique trajectory, in the trajectory category of $\Omega$ (objects: pairs $(\tau, k)$; morphisms: enabled key-respecting firings), whose firing sequence is monotone increasing in the lex key within every layer.

## Setting

Let $\mathrm{Trj}(\Omega)$ denote the *trajectory category* of $\Omega$:

- Objects are pairs $(\tau, k)$ with $\tau < \kappa$ and $0 \le k \le m_\tau$, representing "after $k$ firings within layer $\tau$".
- Morphisms $(\tau, k) \to (\tau, k+1)$ are enabled $(r, \vec{y})$ pairs — pairs whose premise pattern is satisfied at $(\tau, k)$ and whose firing-cache slot is empty.
- The successor functor $(\tau, m_\tau) \to (\tau + 1, 0)$ is the layer-merge step (cellwise $\odot$ followed by per-cell bilattice stabilization, per the $\Delta$-pass).

A *trajectory* is a maximal chain of morphisms in $\mathrm{Trj}(\Omega)$ ending at $(\kappa, 0)$. By the closure-merge commutation lemma underlying [independence-implies-confluence](../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/independence-implies-confluence.md), every trajectory of $\Omega$ has the same endpoint; trajectories may differ only in the per-layer firing order and in the choice of which firings are emitted before being skipped by the firing cache.

## Why this holds

**Part 1 — totality of the lex key on enabled firings.** At $(\tau, k)$, the set of enabled firings is finite (each layer's worklist is built from a finite set of premise-pattern matches against the current finite cell set, modulo the rule-system's countability) and each carries a unique triple $(\mathrm{priority}, \mathrm{id}, \mathrm{lex}(\vec{y}))$: priorities are integers, ids are kebab-case strings, bind-assignments canonicalise to slug-tuples. The lex order is a strict total order on the enabled set. Hence at every $(\tau, k)$ the *minimum* enabled firing under $\mathrm{key}$ is uniquely determined.

**Part 2 — uniqueness of the lex-canonical trajectory.** Define $\sigma_\Omega$ inductively: at $(\tau, k)$, fire the lex-minimum enabled $(r, \vec{y})$ not in the firing-cache; iterate within the layer until no enabled-and-uncached firing remains; advance to $(\tau + 1, 0)$. The construction makes a unique choice at each step (Part 1), so $\sigma_\Omega$ is uniquely determined by $\mathcal{S}$ and the input.

**Part 3 — endpoint correctness and layer-monotonicity properties.** The construction respects the closure-rule system's premise/consequent semantics: at each step, the fired rule's premise is satisfied at $(\tau, k)$, so its consequent is admissible. By [settling-monotonicity](../../research/2026/07/31/lenticule-import/from-predicate-category/teaching/explanations/settling-monotonicity.md), each firing increases the cell value in $\le_k$, so no firing un-enables a previously-fired rule. The layer terminates when no firing is enabled-and-uncached, exactly when the layer-merge fixpoint is reached. Hence $\sigma_\Omega$ ends at the same $v_{\tau+1}$ as any other valid trajectory of $\Omega$ — the construction is a *trajectory* in $\mathrm{Trj}(\Omega)$.

**Part 4 — uniqueness up to lax-idempotence is sharpened to byte-uniqueness on the trajectory.** By [closure-2-monad lax-idempotence](../../research/2026/07/31/lenticule-import/from-predicate-category/closure-2-monad-lax-idempotence.md), the closure-2-monad is property-like: being closed is a property of the valuation, not extra structure. Two trajectories of $\Omega$ are equivalent as 2-cells in the closure-2-monad's algebra category, but the underlying 1-cell — the sequence of firings — distinguishes them. The lex-canonical trajectory is the *unique* representative of this 2-cell whose 1-cell sequence is lex-minimum at every step.

## What this rules out

- **Two valid trajectories of the same settling that disagree on the lex-canonical firing sequence.** Such a "second canonical" trajectory would have to make a non-minimum lex choice at some $(\tau, k)$ and still claim canonicality, which contradicts Part 2.
- **A trajectory whose firing order is determined by host-thread arrival, network buffering, or wall-clock.** Such an order is not key-determined on substrate content; the substrate is non-conformant per [closure-rule-system](../../research/2026/07/31/lenticule-import/from-predicate-category/teaching/explanations/closure-rule-system.md).
- **A canonicalisation discipline that differs between bind-variables of the same rule across runs.** Bind-assignments must canonicalise to a single slug-tuple representation; otherwise $\mathrm{lex}(\vec{y})$ is not well-defined.

## What this requires

- The closure-rule system $\mathcal{S}$ assigns each rule a totally-ordered `priority` and a unique kebab-case `id`.
- Bind-assignments admit a deterministic canonicalisation to slug-tuples (e.g., sort variable names lexicographically, then list bound values in that variable order).
- The firing-cache discipline is honoured: a cached $(r, \vec{y})$ pair is not re-fired in any later layer of the same trajectory.
- The premise-matching algorithm is itself deterministic and a function of substrate content alone.

## Position

The theorem is the trajectory-side companion of [settlement-via-closure-2-monad](../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-via-closure-2-monad.md): that theorem says the *endpoint* is determined by $(\mathcal{S}, v_0)$; this theorem says the *trajectory* is determined when the lex-canonical key discipline is in force. It is the math content that makes operational repair-log determinism — byte-identical sequences of firing entries across runs — a structural property rather than an implementation accident. The substrate-side lift is [repair-log-byte-canonicality-via-lex-firing](../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/repair-log-byte-canonicality-via-lex-firing.md).

The theorem is currently `status: sketch`: the layer-respect property (item 2 of the claim) and the equivalence of trajectories as 2-cells (Part 4) are stated at the proof-sketch level. The full proof would formalise $\mathrm{Trj}(\Omega)$ as a 2-categorical structure on the closure-2-monad's free algebra and verify lex-canonicality under the $\mathcal{C}$-natural reindexing axiom.
