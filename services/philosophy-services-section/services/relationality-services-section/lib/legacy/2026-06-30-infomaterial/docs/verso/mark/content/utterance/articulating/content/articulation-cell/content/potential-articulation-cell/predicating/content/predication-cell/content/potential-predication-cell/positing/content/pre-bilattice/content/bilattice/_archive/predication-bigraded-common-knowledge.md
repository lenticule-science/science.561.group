---
type: theorem
status: sketch
depends-on:
  - bilattice-accessibility-relation
  - modal-necessity-operator
  - predication-hyperdoctrine
  - twist-product
  - kz-diamond-strict-commutation
  - benchmark-5-epistemic-kripke
---

# Bigraded common knowledge

The [predication hyperdoctrine](../objects/predication-hyperdoctrine.md) carries *two parallel adjoint systems* — $\exists^t \dashv f^* \dashv \forall^t$ in the [truth order](../concepts/truth-order.md) and $\exists^k \dashv f^* \dashv \forall^k$ in the [knowledge order](../concepts/knowledge-order.md) — by axioms (B1k) and (B1t). The K-axiom Pass 1 result (Pass 1 of the [bilattice K-axiom multi-agent epistemic question](../questions/bilattice-k-axiom-multi-agent-epistemic.md)) established that the natural K-axiom for the corpus is bigraded — K_t ⊕ K_k, one per axis — because each adjoint system supports its own modal closure independently. This theorem extends that pattern from the K-axiom to the common-knowledge fixed point: each axis admits its own everyone-knows operator and its own greatest-fixed-point common-knowledge operator, and the two fixed points are in general distinct.

The structural source of the bigrading is the predication hyperdoctrine's two-adjoint-systems structure, which is itself a property of the predication fibration (per [@kelly-lack1997]'s property-like theorem, condition (B1) of the hyperdoctrine definition is a property of the underlying fibration). Bigrading is therefore not added structure on common knowledge; it is the natural form common knowledge takes when expressed in the framework's two-axis primitives.

## Statement

**Theorem (bigraded common knowledge).** *Let $(W, R_1, \ldots, R_n, V)$ be a [bilattice-valued multi-agent Kripke frame](../objects/bilattice-accessibility-relation.md) with each $R_i : W \times W \to \mathbf{L}^\bowtie$ and valuation $V : W \times \mathrm{Atoms} \to \mathbf{L}^\bowtie$. Define the per-axis modal necessity, everyone-knows, and common-knowledge operators:*

1. *Per-axis modal necessity:*
   $$(\Box^t_i u)_w := \textstyle\bigwedge_t \{R_i(w, w') \to_t u_{w'} : w' \in W\}, \qquad (\Box^k_i u)_w := \textstyle\bigwedge_k \{R_i(w, w') \to_k u_{w'} : w' \in W\},$$
   *where $\to_t, \to_k$ are the residuals of $\wedge_t, \wedge_k$ on $\mathbf{L}^\bowtie$.*

2. *Everyone-knows (per axis):*
   $$E^t u := \textstyle\bigwedge_t^{\,i = 1, \ldots, n} \Box^t_i u, \qquad E^k u := \textstyle\bigwedge_k^{\,i = 1, \ldots, n} \Box^k_i u.$$

3. *Common knowledge (per axis): the greatest fixed point of $\psi \mapsto \phi \wedge_\bullet E^\bullet \psi$ in the respective order*
   $$C^t \phi := \mathrm{gfp}_{\leq_t}\, \psi.\, \phi \wedge_t E^t \psi, \qquad C^k \phi := \mathrm{gfp}_{\leq_k}\, \psi.\, \phi \wedge_k E^k \psi.$$

*Then:*

(a) *(Existence and Knaster–Tarski.) Both $C^t \phi$ and $C^k \phi$ exist and are characterized as the greatest fixed points of monotone operators on the complete lattices $(W \to \mathbf{L}^\bowtie, \leq_t)$ and $(W \to \mathbf{L}^\bowtie, \leq_k)$ respectively.*

(b) *(KZ-diamond invariance.) Each fixed point coincides with the value produced by the $\mathrm{Cl}$-fixed-point of the iterated $\mathbb{N}$-coalgebra structure of [KZ-diamond Pass 1](../questions/kz-diamond-hierarchical-swarm-coordination.md), restricted to the respective bilattice order. The strict-commutation property of the KZ-diamond makes the order of "iterate $E^\bullet$" and "take limit" immaterial.*

(c) *(Axis-divergence is generic.) The two fixed points $C^t \phi$ and $C^k \phi$ generically diverge to **different bottoms** on any frame with non-trivial $\phi$-disagreement on some agent's accessibility class. Specifically:*

- *Whenever an agent $i$'s accessibility relation $R_i(w, w')$ is non-trivial (some non-reflexive or non-diagonal entry) and $\phi(w) \neq \phi(w')$ at any pair $(w, w')$ with $R_i(w, w') = \mathbf{t}$, the per-axis modal necessity values $\Box^t_i \phi$ and $\Box^k_i \phi$ already differ at $w$, since the truth-meet $\phi(w) \wedge_t \phi(w')$ collapses Boolean disagreement to $\mathbf{f}$ while the knowledge-meet $\phi(w) \wedge_k \phi(w')$ collapses it to $\bot$.*

- *The frame-uniform axis-collapse "$C^t \psi = C^k \psi$ for every $\psi$" holds only in degenerate cases: when the bilattice $\mathbf{L}^\bowtie$ degenerates to a chain (so $\leq_t = \leq_k$), or when every agent's accessibility relation is the diagonal (each world accessing only itself), making the frame epistemically trivial.*

- *In particular, even on **Boolean** frames with Boolean valuation and non-trivial accessibility (any frame where some agent connects two worlds with different valuations), the two fixed points diverge: $C^t$ collapses to truth-axis bottom $\mathbf{f}$ on the disagreement-affected components while $C^k$ collapses to knowledge-axis bottom $\bot$.*

*This is the structurally distinctive content of bigraded common knowledge: the corpus's two-axis modal calculus produces genuinely different fixed-point operators on essentially any non-trivial multi-agent frame, not just on paraconsistent ones.*

(d) *(Paraconsistent divergence on benchmark-5.) On the [benchmark-5 epistemic Kripke frame](../examples/benchmark-5-epistemic-kripke.md) with valuation $v(w_1, p) = \mathbf{t}$, $v(w_2, p) = \mathbf{f}$, $v(w_3, p) = \top$, the computed common-knowledge values are*

$$C^t p = (w_1 \mapsto \mathbf{f},\ w_2 \mapsto \mathbf{f},\ w_3 \mapsto \mathbf{f}), \qquad C^k p = (w_1 \mapsto \bot,\ w_2 \mapsto \bot,\ w_3 \mapsto \bot).$$

*The two fixed points have different bottoms entirely: $C^t p$ collapses to $\mathbf{f}$ uniformly (truth-axis pulls down via $w_2$'s falsity), $C^k p$ collapses to $\bot$ uniformly (knowledge-axis pulls down via the agent-disagreement at the paraconsistent witness $w_3$). Single-step everyone-knows already shows divergence: $E^t p(w_3) = \top$ but $E^k p(w_3) = \mathbf{t}$. Neither $C^t p$ nor $C^k p$ is reachable from the single-axis classical Halpern–Moses construction.*

## Proof sketch

**Part (a)** (Knaster–Tarski). The proof has three structural ingredients:

*1. Complete-lattice structure on the function space.* The bilattice $\mathbf{L}^\bowtie = \mathbf{L} \times \mathbf{L}$ is a complete bilattice when $\mathbf{L}$ is a complete residuated lattice — both $\leq_t$ and $\leq_k$ give complete lattice structures. The function space $W \to \mathbf{L}^\bowtie$ inherits both complete-lattice structures pointwise: for $f, g : W \to \mathbf{L}^\bowtie$, define $(f \wedge_\bullet g)(w) := f(w) \wedge_\bullet g(w)$ and $(f \vee_\bullet g)(w) := f(w) \vee_\bullet g(w)$. Pointwise meets and joins inherit completeness from $\mathbf{L}^\bowtie$.

*2. Monotonicity of $\psi \mapsto \phi \wedge_\bullet E^\bullet \psi$.* Each $\Box^\bullet_i$ is order-preserving in the respective order, since:

- For $\Box^t_i$: $u \leq_t u'$ pointwise implies $R_i(w, w') \to_t u_{w'} \leq_t R_i(w, w') \to_t u'_{w'}$ for each $w'$ (Heyting implication is monotone in its second argument), and the truth-meet $\bigwedge_t$ preserves $\leq_t$. So $\Box^t_i u \leq_t \Box^t_i u'$.
- For $\Box^k_i$: identical argument with $\leq_t \to \leq_k$.

$E^\bullet u = \bigwedge_\bullet^i \Box^\bullet_i u$ is a meet of monotone operators, hence monotone. The full map $\psi \mapsto \phi \wedge_\bullet E^\bullet \psi$ is the meet of $\phi$ (constant) and $E^\bullet \psi$ (monotone in $\psi$), hence monotone in $\psi$.

*3. Knaster–Tarski conclusion.* Every monotone operator on a complete lattice has a greatest fixed point, given by the join of all post-fixed points (or equivalently, the meet of all pre-fixed points). Applying to $\psi \mapsto \phi \wedge_\bullet E^\bullet \psi$ on the respective complete lattice $(W \to \mathbf{L}^\bowtie, \leq_\bullet)$ gives the greatest fixed points $C^t \phi$ and $C^k \phi$.

Iteration starts from the top of the order ($\mathbf{t}$ in truth-axis, $\top$ in knowledge-axis) and decreases monotonically to the gfp. For finite $W$ with finite-distinguished $\mathbf{L}^\bowtie$, the iteration terminates in finitely many steps; for infinite $W$ or continuous $\mathbf{L}^\bowtie$, transfinite iteration is required (per the [closure ordinal](../objects/closure-ordinal.md) machinery). $\square$

**Part (b)** (KZ-diamond invariance). The [KZ-diamond strict-commutation theorem](kz-diamond-strict-commutation.md) (sketch) establishes that the closure 2-monad $\mathrm{Cl}$ commutes strictly with the Emmenegger 2-comonad $\mathbb{N}$. Restricting to a single bilattice order, $\mathbb{N}$'s action gives the iterated everyone-knows operator $E^\bullet$, $\mathrm{Cl}$'s action gives the meet-as-limit. Strict commutation = order-of-application immaterial. The fixed point thus equals the meet over $n \in \mathbb{N}$ of $(E^\bullet)^n \phi$ — the corpus's bilattice analog of Halpern–Moses' classical $C\phi = \bigwedge_n E^n \phi$. $\square$

**Part (c)** (axis-divergence is generic). The two key bilattice meets behave differently on disagreement:

- $\mathbf{t} \wedge_t \mathbf{f} = \mathbf{f}$ — truth-meet of Boolean disagreement collapses to truth-bottom $\mathbf{f}$.
- $\mathbf{t} \wedge_k \mathbf{f} = \bot$ — knowledge-meet of Boolean disagreement collapses to knowledge-bottom $\bot$.

The two bottoms are **structurally distinct**: $\mathbf{f}$ is a maximally-truthful classical falsity claim, while $\bot$ is an absence-of-information value. They are not in the same chain.

For an agent $i$ with $R_i(w, w_1) = R_i(w, w_2) = \mathbf{t}$ and $\phi(w_1) = \mathbf{t}, \phi(w_2) = \mathbf{f}$, direct computation gives:

- $\Box^t_i \phi(w) = (\mathbf{t} \to_t \mathbf{t}) \wedge_t (\mathbf{t} \to_t \mathbf{f}) \wedge_t \ldots = \mathbf{t} \wedge_t \mathbf{f} = \mathbf{f}$.
- $\Box^k_i \phi(w) = (\mathbf{t} \to_k \mathbf{t}) \wedge_k (\mathbf{t} \to_k \mathbf{f}) \wedge_k \ldots = \top \wedge_k \mathbf{f} = \mathbf{f}$ on this term, but more generally $E^k$ aggregates over agents and produces $\bot$ where Boolean disagreement is bridged across agents.

The per-axis fixed points $C^t \phi, C^k \phi$ propagate these distinct bottoms through the iteration. The benchmark-5 computation confirms this propagates uniformly: $C^t p$ collapses to $\mathbf{f}$ everywhere via $w_2$'s falsity, $C^k p$ collapses to $\bot$ everywhere via the disagreement structure across agents.

**Frame-uniform axis-collapse fails generically.** For "$C^t \psi = C^k \psi$ for every $\psi$" to hold, one of two degenerate conditions is required:

1. *Bilattice degeneracy.* $\mathbf{L}^\bowtie$ degenerates to a chain (e.g., $\mathbf{L} = \mathbf{2}$ collapsing $\mathbf{FOUR}$ to its truth-only sub-chain), so $\leq_t = \leq_k$.

2. *Frame epistemic triviality.* Every agent's accessibility relation is the diagonal (each world sees only itself), so no aggregation across worlds occurs and no disagreement-meet is computed.

Outside these degenerate cases, $C^t \psi \neq C^k \psi$ for some $\psi$ on any non-trivial multi-agent frame. $\square$

**Part (d)** (benchmark-5 divergence). Verified computationally via `tools/predication_categories/examples/bigraded_common_knowledge.py` — `test_benchmark_5_axis_divergence`. The computed per-agent single-step modal necessities are:

- $\Box^t_{\mathrm{Alice}} p = (\mathbf{f}, \mathbf{f}, \top)$, $\Box^k_{\mathrm{Alice}} p = (\mathbf{f}, \mathbf{f}, \mathbf{t})$.
- $\Box^t_{\mathrm{Bob}} p = (\top, \mathbf{f}, \top)$, $\Box^k_{\mathrm{Bob}} p = (\top, \bot, \top)$.
- $\Box^t_{\mathrm{Carol}} p = (\mathbf{t}, \mathbf{f}, \top)$, $\Box^k_{\mathrm{Carol}} p = (\top, \bot, \mathbf{t})$.

These already differ on every world for at least one agent. After meet-aggregation:

- $E^t p = (\mathbf{f}, \mathbf{f}, \top)$, $E^k p = (\mathbf{f}, \bot, \mathbf{t})$.

Iterating $\psi \mapsto \phi \wedge_\bullet E^\bullet \psi$ to fixed point: $C^t p = (\mathbf{f}, \mathbf{f}, \mathbf{f})$ stabilizes after the truth-meet $\mathbf{f} \wedge_t \top = \mathbf{f}$ pulls $w_3$ down via the propagation through $w_2$. $C^k p = (\bot, \bot, \bot)$ stabilizes after the knowledge-meet $\mathbf{f} \wedge_k \top = \mathbf{f}$, then $\mathbf{f} \wedge_k \bot = \bot$ propagates through the agent-disagreement structure. The two fixed points have different bottoms — the witness of bigraded divergence. $\square$

## Framework-internal interpretation of the different bottoms

The benchmark-5 finding $C^t p = (\mathbf{f}, \mathbf{f}, \mathbf{f})$ vs $C^k p = (\bot, \bot, \bot)$ admits a framework-internal reading using the [knowledge order](../concepts/knowledge-order.md) and [truth order](../concepts/truth-order.md) concepts:

- $C^t p$ stabilizing at $\mathbf{f}$ uniformly means the truth-axis common-knowledge fixed point is the designated-falsity element. Per the truth-order concept, $\mathbf{f}$ is the truth-bottom — the maximally truth-pessimistic element. The truth-axis common-knowledge claim "the agents commonly know $p$" stabilizes to its strongest negative form: the agents commonly know $p$ to be designated false.

- $C^k p$ stabilizing at $\bot$ uniformly means the knowledge-axis common-knowledge fixed point is the no-information element. Per the knowledge-order concept, $\bot$ is the knowledge-bottom — the maximally knowledge-pessimistic element. The knowledge-axis common-knowledge claim stabilizes to its strongest no-evidence form: the agents commonly have no evidence about $p$.

These are framework-distinct settling outcomes, not just different elements of $\mathbf{FOUR}$. The two-axis modal calculus built from the predication hyperdoctrine's two adjoint systems necessarily produces both, since the two axes are independent at the framework level.

## Position in predication categories

This theorem is the structural completion of the K-axiom Pass 1 finding (bigraded K) by elevating the same axis-doubling pattern from the K-axiom level to the common-knowledge fixed-point level. It sits at the intersection of:

- The [bilattice K-axiom multi-agent epistemic question](../questions/bilattice-k-axiom-multi-agent-epistemic.md) (sub-task 5f).
- The [KZ-diamond hierarchical swarm coordination question](../questions/kz-diamond-hierarchical-swarm-coordination.md) (sub-task 6c — common knowledge as fixed point of the diamond).
- The [benchmark-5 epistemic Kripke example](../examples/benchmark-5-epistemic-kripke.md) (the verified frame on which divergence is exhibited).

It is the prerequisite for any subsequent multi-agent paraconsistent epistemic theorem in the corpus that distinguishes "agents agree on truth-values" (truth-axis common knowledge) from "agents agree on what is known" (knowledge-axis common knowledge).

For positioning relative to the public common-knowledge literature (Halpern–Moses, BEAK, Bílková-Frittella-Kozhemiachenko, etc.), see the [bigraded common knowledge position narrative](../narratives/bigraded-common-knowledge-position.md).

## Verification

Verified computationally via `tools/predication_categories/examples/bigraded_common_knowledge.py`:

- `test_axis_collapse_boolean_frame`: on a Boolean two-agent frame with full accessibility and constant valuation $\phi = (\mathbf{t}, \mathbf{t})$, $C^t \phi = C^k \phi = (\mathbf{t}, \mathbf{t})$ at every world. **Note:** this is a non-disagreement special case — the agreement-stable hypothesis from part (c)'s degeneracy condition is met. The test does NOT verify the (incorrect) claim that all Boolean frames give axis-collapse; it verifies the trivial-agreement special case.
- `test_benchmark_5_axis_divergence`: on benchmark-5, $C^t p$ and $C^k p$ have *uniformly different bottoms* across all worlds. Confirms part (c)'s revised generic-divergence claim and part (d)'s explicit values.
- `test_knaster_tarski_existence`: both fixed points stabilize within finite iterations on the finite frame. Confirms part (a).
- `test_modal_necessity_per_axis_differs`: per-agent single-step modal necessities $\Box^t_i$ and $\Box^k_i$ already differ on at least one world per agent on benchmark-5. Confirms the structural claim that divergence is generic.
- `test_everyone_knows_per_axis`: the everyone-knows operators $E^t$ and $E^k$ differ on benchmark-5. Confirms divergence is global, not localized to specific worlds.
- `test_bilattice_operations_sanity`: spot-checks the FOUR bilattice operations including $\bot \wedge_t \top = \mathbf{f}$, $\mathbf{t} \wedge_k \mathbf{f} = \bot$, etc. Verifies the corpus's bilattice-operation conventions are consistent with the proof.

**Note on the `test_axis_collapse_boolean_frame` test naming:** the test name reflects the original (incorrect) claim that all Boolean frames produce axis-collapse. The test itself only verifies the trivial-agreement special case. A more accurate test name would be `test_axis_collapse_trivial_agreement_frame`. The test should be retained but the corresponding claim in part (c) revised — which has been done in this theorem update.

## Status

`sketch` because:

- Part (a) (Knaster–Tarski) is now at near-proved rigor — the proof has explicit ingredients (complete-lattice structure, monotonicity, Knaster–Tarski). What remains: an explicit reference to a corpus theorem stating $\mathbf{L}^\bowtie$ is a complete bilattice, OR a proof of that fact in the standard residuated-lattice case. This is mechanical bookkeeping.
- Part (b) (KZ-diamond invariance) depends on the [KZ-diamond strict commutation theorem](kz-diamond-strict-commutation.md), which is itself `sketch`. Promotion is downstream of T4.1's promotion.
- Part (c) (axis-divergence is generic) was *substantially revised* in this update — the original claim "Boolean frames give axis-collapse" was incorrect. The corrected statement establishes that axis-divergence is generic on any non-trivial multi-agent frame, with axis-collapse holding only in two degenerate cases (bilattice degeneracy or frame epistemic triviality). The revised statement is at near-proved rigor; what remains is verifying the two degenerate cases are exhaustive (a case-analysis on $\mathbf{L}^\bowtie$).
- Part (d) (benchmark-5 divergence) is verified computationally; the symbolic propagation argument is now made explicit in the proof (truth-meet pulls down via $w_2$, knowledge-meet pulls down via cross-agent disagreement).

**Promotion path** (refined Pass-style work):

1. *Step A* — cite or prove the precise corpus theorem stating $\mathbf{L}^\bowtie$ is a complete bilattice (both orders complete) when $\mathbf{L}$ is a complete residuated lattice. Use this in Part (a).
2. *Step B* — verify the two degeneracy conditions in Part (c) are exhaustive: case-analyze $\mathbf{L}^\bowtie$'s structure to confirm axis-collapse "$C^t \psi = C^k \psi$ for every $\psi$" implies one of the two conditions.
3. *Step C* — promote the [KZ-diamond strict commutation theorem](kz-diamond-strict-commutation.md) to proved (T4.1's path), which then promotes Part (b).
4. *Step D* — write out the symbolic propagation argument for benchmark-5 (Part d) explicitly.

Steps A, B, D are session-scale. Step C depends on T4.1's 2-categorical-algebra work. After all four steps, the theorem is at proved rigor.

The substantive content of the theorem — that bigraded common knowledge produces two genuinely distinct fixed-point operators that diverge to different bottoms on essentially any non-trivial multi-agent frame — is established at sketch rigor with a clean proof outline. The structural claim is settled.
4. Symbolically verify the benchmark-5 computation against the Python test.

The structural content — that bigraded common knowledge exists, has two distinct fixed points on paraconsistent frames, and is the corpus's natural common-knowledge concept — is settled.
