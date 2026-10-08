---
kind: theorem
status: proved
depends-on: [cosettling, closure-2-monad, settling-endofunctor, closure-operator, closure-ordinal]
title: Forward trajectory inside the cosettling
description: In the strict regime, the forward trajectory is contained in the iterated cosettling, and that inclusion is generally strict — the cosettling can include off-trajectory pre-images.
---

# Forward trajectory inside the cosettling

In the strict regime, the forward trajectory is *contained in* the iterated cosettling, and that inclusion is generally strict — the cosettling can include off-trajectory pre-images.

## Statement

**Theorem.** *Let $\mathcal{S}$ be a strict-regime closure-rule system with single-step closure operator $T$, and let $v_\kappa = T^\kappa(v_0)$ be closure-stable, reached after finitely many steps from initial state $v_0$.*

1. *(Pre-image characterization.) $v \in T^{-1}(v_\kappa)$ iff $v \subseteq v_\kappa$ and every cell $c \in v_\kappa \setminus v$ is added by some rule $r \in R$ whose antecedent is satisfied at $v$.*

2. *(Trajectory inclusion.) $\{v_0, v_1, \ldots, v_\kappa\} \subseteq \bigcup_{k \geq 0} (T^{-1})^k(v_\kappa)$.*

3. *(Strict inclusion in general.) The inclusion in (2) is strict whenever $v_\kappa$ contains a cell that is **delayable**: a cell $c \in v_\kappa$ such that some state $v_{\kappa-1} \cup \{c\} \cup \cdots$ off the trajectory has $T(v_{\kappa-1} \cup \{c\} \cup \cdots) = v_\kappa$. Concretely, this happens whenever a cell originating at trajectory stage $\tau < \kappa - 1$ can be present at the previous stage without preventing the final firings.*

4. *(Finiteness.) Each $T^{-1}(w)$ for $w \subseteq v_\kappa$ is finite, and the iterated union $\bigcup_k (T^{-1})^k(v_\kappa) \subseteq \mathcal{P}(v_\kappa)$ is finite.*

## Proof

**(1).** $(\Rightarrow)$ If $T(v) = v_\kappa$, inflation gives $v \subseteq T(v) = v_\kappa$, and every cell $c \in v_\kappa \setminus v$ must be added by $T$, hence by some rule firing at $v$. $(\Leftarrow)$ Conversely, if $v \subseteq v_\kappa$ and every $c \in v_\kappa \setminus v$ is added by some rule firing at $v$, then $T(v) \supseteq v \cup (v_\kappa \setminus v) = v_\kappa$. For the other direction $T(v) \subseteq v_\kappa$: any rule firing at $v$ produces a cell $c$ such that $c$ is added; we need $c \in v_\kappa$. Because $v \subseteq v_\kappa$ and $v_\kappa$ is closure-stable, every rule firing at $v$ also fires at $v_\kappa$ (rule antecedents are $\leq_k$-monotone), so $c \in T(v_\kappa) = v_\kappa$. Hence $T(v) = v_\kappa$. $\square$

**(2).** For each $\tau < \kappa$, $T(v_\tau) = v_{\tau+1}$ by definition of the trajectory, so $v_\tau \in T^{-1}(v_{\tau+1}) \subseteq (T^{-1})^{\kappa - \tau}(v_\kappa)$. Also $v_\kappa \in (T^{-1})^0(v_\kappa)$. $\square$

**(3).** See the worked example below: $\{(0,0), (2,2)\}$ is in $T^{-1}(v_2)$ but not on the trajectory.

**(4).** $T^{-1}(w) \subseteq \mathcal{P}(w)$ which is finite. The iterated union sits inside $\mathcal{P}(v_\kappa)$, also finite. $\square$

## Worked example: a 3-stage strict-regime settling

Closure rules:

- R1: $v(P)(0,0) = \mathbf{t} \implies v(P)(1,1) \geq_k \mathbf{t}$.
- R2: $v(P)(1,1) = \mathbf{t} \implies v(P)(2,2) \geq_k \mathbf{t}$.

Initial state $v_0$: $v_0(P)(0,0) = \mathbf{t}$, all else $\bot$.

**Forward trajectory.**

- $v_0 = \{(0,0)\}$.
- $v_1 = T(v_0) = \{(0,0), (1,1)\}$ (R1 fires).
- $v_2 = T(v_1) = \{(0,0), (1,1), (2,2)\}$ (R2 fires).
- $T(v_2) = v_2$. $\kappa = 2$.

**Single-step cosettling $T^{-1}(v_2)$.** Apply criterion (1): $v \subseteq v_2$, and every cell of $v_2 \setminus v$ is fired by some rule at $v$.

Enumerating $v \subseteq v_2$ — there are $2^3 = 8$ subsets. For each, check whether $T(v) = v_2$:

| $v$ | R1 fires? | R2 fires? | $T(v)$ | Equals $v_2$? |
|---|---|---|---|---|
| $\emptyset$ | no | no | $\emptyset$ | ✗ |
| $\{(0,0)\}$ | yes ($\to (1,1)$) | no | $\{(0,0),(1,1)\} = v_1$ | ✗ |
| $\{(1,1)\}$ | no | yes ($\to (2,2)$) | $\{(1,1),(2,2)\}$ | ✗ |
| $\{(2,2)\}$ | no | no | $\{(2,2)\}$ | ✗ |
| $\{(0,0),(1,1)\} = v_1$ | yes | yes | $v_2$ | ✓ |
| $\{(0,0),(2,2)\}$ | yes | no | $\{(0,0),(1,1),(2,2)\} = v_2$ | ✓ |
| $\{(1,1),(2,2)\}$ | no | yes | $\{(1,1),(2,2)\}$ | ✗ |
| $\{(0,0),(1,1),(2,2)\} = v_2$ | yes | yes | $v_2$ | ✓ |

So

$$T^{-1}(v_2) = \{v_1, \{(0,0),(2,2)\}, v_2\},$$

a **three-element** set. The off-trajectory state $\{(0,0),(2,2)\}$ contains a "cell from the future" — $(2,2)$, normally produced at the last step — without its normal precursor $(1,1)$. From this state, R1 fires and produces $(1,1)$, while $(2,2)$ is already present by inflation; the result is $v_2$ in one step.

**Iterated cosettling.**

- $T^{-1}(v_2) = \{v_1, \{(0,0),(2,2)\}, v_2\}$.
- $T^{-1}(v_1) = \{v_0\}$. (No state with $(1,1)$ has $T(v) = v_1$ — R2 would fire and overshoot. So $v$ must lack $(1,1)$. Then $v \subseteq \{(0,0)\}$. Only $v_0$ works.)
- $T^{-1}(\{(0,0),(2,2)\}) = \emptyset$. (Any $v$ with $(0,0)$ fires R1 and produces $(1,1)$, but the target lacks $(1,1)$. Any $v$ without $(0,0)$ cannot produce $(0,0)$.)
- $T^{-1}(v_0) = \emptyset$ in the closure-only sense. (The seed is supplied by the increment sequence, not by closure.)

Iterated union: $\{v_0, v_1, \{(0,0),(2,2)\}, v_2\}$. The forward trajectory $\{v_0, v_1, v_2\}$ is contained in this set, with the off-trajectory state $\{(0,0),(2,2)\}$ as a sterile branch (no further pre-images).

## What this gives — and what it does not

**Honest contributions.**

1. *Pre-image characterization* (1): a workable necessary-and-sufficient condition for membership in the cosettling.
2. *Trajectory inclusion* (2): the forward trajectory is reachable by iterated $T^{-1}$.
3. *Finiteness* (4): $T^{-1}$ stays computable in the strict regime.

**Walked-back claims.** An earlier draft claimed $T^{-1}(v_\kappa) = \{v_{\kappa-1}, v_\kappa\}$ (only the trajectory's previous stage and the closure itself). The example above refutes this: $\{(0,0),(2,2)\}$ is a third pre-image. The reasoning that broke in the earlier draft was missing inflation: a cell already in $v$ stays in $T(v)$ regardless of whether any rule produces it. So *delayable* cells — cells from "the future" of the trajectory inserted into a present state — give rise to off-trajectory pre-images.

**The open structural question.** Even in the strict regime, the cosettling lattice has more content than the trajectory. Characterizing the off-trajectory pre-images is a real combinatorial problem: which subsets of $v_\kappa \setminus v_{\kappa-1}$ can be "lifted" into $v_{\kappa-1}$ to give pre-images, and more generally which $v_\kappa \setminus v_\tau$ cells are delayable into earlier stages?

## Alternative proof paths

Two independent reformulations:

- [Forward trajectory via closure-cover hypergraph](../../documents/articles/notes/undated/forward-trajectory-via-hypergraph-cover.md) — restates pre-image characterization as closure-covers of an explicit hypergraph $H_w$. Combinatorial framework that connects to standard hypergraph-cover problems.
- [Forward trajectory via Galois adjunction](forward-trajectory-via-galois-adjunction.md) — for closure operators with right adjoint (a structural sub-class), gives the cosettling a clean Galois-saturation interval form. Restricted scope (meet-preserving closures only) but cleaner structurally where applicable.

## Position in the program

Establishes that the cosettling and the forward trajectory are *compatible but not coextensive* in the strict regime. The forward trajectory is one chain within the cosettling lattice; the cosettling has additional content from off-trajectory pre-images. This is a weaker structural statement than originally claimed, and it makes the cosettling cohomology question genuinely open: the cohomology classifies more than just the trajectory data.

Open downstream:

- *Characterize off-trajectory pre-images.* In the example above only one off-trajectory state arises; in larger systems with parallel rule firings the count grows. A combinatorial classification — e.g., as a function of the "rule-dependency-graph" structure — would close the loop.
- *Cosettling structure in non-strict regimes.* At limit ordinals, the cosettling could include states arising from "limit-step closure" coalescing many possibilities, with no analog of the strict-regime finite enumeration.
- *Backward-MLD.* Define $v \sim_{\mathrm{bMLD}} w$ iff $T^{-1}(v) = T^{-1}(w)$. Whether this is finer or coarser than forward-MLD (and what the off-trajectory pre-images contribute to the equivalence) is open.
- *Cosettling cohomology.* The cosettling lattice has its own poset structure with $v_\kappa$ at the top, off-trajectory states branching off the trajectory; sheaf cohomology over this poset is open work.
