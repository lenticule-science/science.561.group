---
type: definition
class: set-of-presheaves
symbol: "T^{-1}(w)"
depends-on: [closure-2-monad, settling-endofunctor, closure-operator, predication-settling]
---

# Cosettling

The **cosettling** of a state $w$ is the set of presheaves whose forward closure produces $w$ in one step. Formally, for a closure operator $T$ on the predication-presheaf category $\mathrm{KP}(B)$ over a base $B$:

$$T^{-1}(w) := \{v \in \mathrm{KP}(B) : T(v) = w\}.$$

This is a *multi-valued* operation — multiple presheaves typically close to the same state. The cosettling is predication categories' [backward-dynamics](../questions/cosettling-backward-direction.md) counterpart to the forward closure operator: where $T$ asks "what does $v$ become under one closure step?", $T^{-1}$ asks "what could have produced $w$ in one step?".

The **iterated cosettling**

$$T^{*-1}(w) := \bigcup_{k \geq 0} (T^{-1})^k(w) = \{v : T^k(v) = w \text{ for some } k \geq 0\}$$

is the set of all states from which the forward closure eventually reaches $w$. The two should be kept distinct: $T^{-1}$ is single-step, $T^{*-1}$ is iterated.

## Structural facts

For closure-active $w$ (so $T(w) = w$):

- **Containment.** Every $v \in T^{-1}(w)$ satisfies $v \subseteq w$, by inflation: $T(v) \supseteq v$, so $T(v) = w$ requires $v \subseteq w$.
- **Maximum.** $w \in T^{-1}(w)$ since $T(w) = w$, and $w$ is the maximum of $T^{-1}(w)$ under $\subseteq$.
- **Closure under union.** If $v, v' \in T^{-1}(w)$, then $v \cup v' \in T^{-1}(w)$. Proof: $T(v \cup v') \supseteq v \cup v'$ by inflation; rules firing at $v$ or $v'$ also fire at $v \cup v'$ by antecedent-monotonicity, so $T(v \cup v') \supseteq T(v) \cup T(v') = w$. Conversely $v \cup v' \subseteq w$, and rules firing at $v \cup v'$ also fire at $w$, with output in $T(w) = w$, so $T(v \cup v') \subseteq w$.
- **No minimum in general.** Distinct minimal pre-images are typically incomparable; see the [worked example](../theorems/backward-closure-recovers-forward-trajectory.md) where $T^{-1}(v_2) = \{v_1, \{(0,0),(2,2)\}, v_2\}$ and $v_1, \{(0,0),(2,2)\}$ are incomparable.
- **Not closed under intersection.** In the same example $v_1 \cap \{(0,0),(2,2)\} = \{(0,0)\} = v_0$, but $v_0 \notin T^{-1}(v_2)$ (since $T(v_0) = v_1 \neq v_2$).
- **Finiteness.** In the strict regime $T^{-1}(w) \subseteq \mathcal{P}(w)$ is finite.

So $T^{-1}(w)$ is a **finite join-subsemilattice with top** of $[\bot, w]$ — *not* a complete lattice in general. The corpus's earlier "complete sub-lattice" framing was wrong.

## Trajectory location

The forward trajectory $v_0 \subseteq v_1 \subseteq \cdots \subseteq v_\kappa = w$ lives in the *iterated* cosettling: each $v_\tau \in (T^{-1})^{\kappa - \tau}(w)$. It does **not** live entirely in single-step $T^{-1}(w)$ — only $v_{\kappa-1}$ and $v_\kappa$ do (the previous-stage and the closure itself).

The iterated cosettling is in general strictly larger than the trajectory: it can include off-trajectory pre-images such as $\{(0,0),(2,2)\}$ above — states with cells from "the future" inserted into a present, where the missing precursor is then re-derived by one closure step. See [forward trajectory inside the cosettling](../theorems/backward-closure-recovers-forward-trajectory.md).

## Why this matters

The cosettling is predication categories' first explicit backward-dynamics object. It is *not* a clean inverse to $T$: it is multi-valued, lacks a minimum in general, and contains off-trajectory pre-images even in the strict regime.

These limitations make the structural questions sharper rather than blocking them. Open lines:

- **Cohomology of $T^{-1}(w)$ as a poset.** The cosettling is a finite join-subsemilattice with top, hence a poset; its order complex admits sheaf cohomology. What does it classify? Whether off-trajectory pre-images contribute non-trivial classes is the first question.
- **Off-trajectory pre-image classification.** Which subsets $S \subseteq w$ give $v_{\kappa-1} \cup S \in T^{-1}(w)$? More generally, which "delayable" cell choices produce off-trajectory pre-images? A combinatorial characterization in terms of the rule-dependency graph would close the strict-regime story.
- **Backward-MLD.** Define $v \sim_{\mathrm{bMLD}} w$ iff $T^{-1}(v) = T^{-1}(w)$, or alternatively iff $T^{*-1}(v) = T^{*-1}(w)$. The two definitions could give different equivalences; whichever is finer than forward-MLD is the interesting one.
- **Cosettling in non-strict regimes.** At limit ordinals, $T^{-1}$ at the limit step has structure beyond what the strict-regime enumeration captures; whether the join-semilattice structure persists is open.

## Position in predication categories

The cosettling pairs with [the void cone](../narratives/void-cone-structure.md): the void cone tracks what is *not yet settled* during forward iteration; the cosettling tracks what *could have been the starting point* for one backward step. The corpus's complete forward/backward picture has a **forward** axis driven by $T$ and a **backward** axis given by the multi-valued $T^{-1}$ — but the backward axis is structurally lossier than the forward one (multi-valued, no canonical minimum), and that loss is itself the content of the open work.

Pairs with [forward trajectory inside the cosettling](../theorems/backward-closure-recovers-forward-trajectory.md) for the basic strict-regime structural result.
