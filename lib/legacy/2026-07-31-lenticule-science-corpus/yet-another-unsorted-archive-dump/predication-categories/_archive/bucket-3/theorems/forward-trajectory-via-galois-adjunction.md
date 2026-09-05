---
kind: theorem
status: proved
depends-on: [cosettling, closure-operator, closure-2-monad]
---

# Forward trajectory via Galois adjunction — meet-preserving case

Conditional alternative proof of [forward trajectory inside the cosettling](backward-closure-recovers-forward-trajectory.md) for closure operators that admit a right adjoint. Where the [pre-image characterization](backward-closure-recovers-forward-trajectory.md) and [closure-cover hypergraph](forward-trajectory-via-hypergraph-cover.md) paths work for arbitrary strict-regime closures, this path works only when $T$ preserves meets — a hypothesis that fails in general (see [the counterexample below](#when-meet-preservation-fails)).

## Hypothesis

The closure operator $T : \mathcal{P}(C) \to \mathcal{P}(C)$ on a finite cell space $C$ is **meet-preserving**:

$$T\!\left(\,\bigcap_i x_i\,\right) \;=\; \bigcap_i T(x_i)$$

for every family $\{x_i\} \subseteq \mathcal{P}(C)$.

Equivalently, $T$ has a *left adjoint* $T_!$ in the order-enriched sense: $T_!(y) \leq x \iff y \leq T(x)$. (Note: this is the *Galois adjoint* on the *opposite order*; $T$ inflationary becomes deflationary on $\mathcal{P}(C)^{\mathrm{op}}$, with right adjoint there.)

## Statement

**Theorem (forward trajectory via Galois adjunction).** *Under the meet-preservation hypothesis, the cosettling $T^{-1}(w)$ has a canonical minimum*

$$T_!(w) \;:=\; \bigcap T^{-1}(w),$$

*and the iterated cosettling has the explicit Galois-saturation form*

$$T^{*-1}(w) \;=\; \{v : v \subseteq w \text{ and } T_!(w) \subseteq T_!(v) \subseteq w\}.$$

*The forward trajectory $\{v_0, v_1, \ldots, v_\kappa\}$ is recovered as the chain*

$$T_!(w) \subseteq T_!(T_!(w)) \subseteq \cdots \subseteq w.$$

## Proof

### Step 1: $T_!$ exists under meet-preservation

By the adjoint functor theorem for posets ([@maclane-moerdijk1992] Ch IV), a monotone map between complete lattices has a left adjoint iff it preserves all meets. The hypothesis ensures $T_!$ exists; concretely,

$$T_!(y) := \bigcap \{x \in \mathcal{P}(C) : y \subseteq T(x)\}.$$

The adjunction $T_! \dashv T$ gives the inversion: $T_!(y) \subseteq x \iff y \subseteq T(x)$.

For $y = w$ closure-active: $T_!(w) = \bigcap \{x : w \subseteq T(x)\} = \bigcap T^{-1}(w)$, the meet of all single-step pre-images. $\square$ (Step 1)

### Step 2: $T_!(w)$ is the minimum of $T^{-1}(w)$

By definition $T_!(w) = \bigcap T^{-1}(w)$ is contained in every element of $T^{-1}(w)$. We need $T_!(w)$ itself to be in $T^{-1}(w)$, i.e., $T(T_!(w)) = w$.

By meet-preservation:

$$T(T_!(w)) = T\!\left(\bigcap T^{-1}(w)\right) = \bigcap_{v \in T^{-1}(w)} T(v) = \bigcap \{w\} = w.$$

So $T_!(w) \in T^{-1}(w)$ and is its minimum element. $\square$ (Step 2)

### Step 3: iterated cosettling form

The iterated cosettling $T^{*-1}(w) = \{v : T^k(v) = w \text{ for some } k\}$. By [iterated-cosettling-counts-derivable-cells](iterated-cosettling-counts-derivable-cells.md), this equals $\{v : \mathrm{seed} \subseteq v \subseteq w\}$ where $\mathrm{seed}$ = cells with no producing rule.

Under meet-preservation, $\mathrm{seed} = T_!(w)$ (the minimum of $T^{-1}(w)$ coincides with the cells that have no incoming rule, since these are the cells that must be present for any pre-image to close to $w$).

Hence $T^{*-1}(w) = [T_!(w), w]$ in the lattice $\mathcal{P}(C)$. $\square$ (Step 3)

### Step 4: trajectory recovery

The forward trajectory $v_0 \subseteq v_1 \subseteq \cdots \subseteq v_\kappa = w$ starts at $v_0 = \mathrm{seed} = T_!(w)$. The Galois adjunction gives:

$$v_\tau = T^\tau(v_0) = T^\tau(T_!(w)).$$

Using the "$T \circ T_!$" composite as the canonical "raise content" operation, the trajectory ascends through Galois-saturation iterates. The chain $T_!(w) \subseteq T(T_!(w)) \subseteq T^2(T_!(w)) \subseteq \cdots \subseteq w$ recovers the forward trajectory. $\blacksquare$

## When meet-preservation fails

The hypothesis is **not generic** even in the strict regime. Counterexample:

Cells $C = \{a, b, d\}$. Rules:

- $R_1: \{a\} \Rightarrow d$.
- $R_2: \{b\} \Rightarrow d$.

Take $x_1 = \{a\}, x_2 = \{b\}$. Then $\bigcap x_i = \emptyset$ but $T(x_1) \cap T(x_2) = \{a, d\} \cap \{b, d\} = \{d\}$, while $T(\bigcap x_i) = T(\emptyset) = \emptyset$. Meet-preservation fails: $\{d\} \neq \emptyset$.

This is the **multi-rule-same-consequent** structural pattern. Any rule system with two rules producing the same cell from disjoint antecedents breaks meet-preservation.

Such systems are common in the corpus's standard examples (e.g., diamond rule structures), so the Galois-adjunction approach has restricted applicability.

## When meet-preservation does hold

Specific cases where the hypothesis is satisfied:

- **Tree-shaped rule dependencies.** Each cell has a unique producing rule (no two rules produce the same cell). Meet-preservation follows because rule firings can be tracked individually. The corpus's [linear-chain benchmark](../tools/cosettling-enumerator/) is a tree-shaped instance.

- **Single-antecedent rules with no parallel firings.** Linear-chain-type rule systems where the rule graph has no diamond structures.

- **Boolean-algebra-flavored closures.** Closures arising from Boolean operations (intersection, union of ideals) on a Boolean algebra are meet-preserving by construction.

For these restricted cases, the Galois-adjunction proof gives a clean structural picture: the cosettling has a canonical minimum, and the iterated cosettling is an interval $[T_!(w), w]$.

## Position in the program

Conditional companion to [pre-image characterization](backward-closure-recovers-forward-trajectory.md) and [closure-cover hypergraph](forward-trajectory-via-hypergraph-cover.md). Where those paths handle arbitrary strict-regime closures, this path:

- **Strengthens the conclusion** when meet-preservation holds: the cosettling has a canonical minimum, an explicit Galois adjoint, and an interval-form iterated cosettling.
- **Restricts the scope** to meet-preserving closures, which are tree-shaped or Boolean-flavored — a structural sub-class of the strict regime.
- **Connects to standard lattice theory** via the Galois adjunction $T_! \dashv T$.

For non-meet-preserving closures, the [closure-cover hypergraph](forward-trajectory-via-hypergraph-cover.md) form is the right framework — the cosettling is a join-semilattice without canonical minimum, capturing the multi-rule-same-consequent structural feature.

Open: characterizing when meet-preservation holds in terms of the rule-dependency hypergraph $H_w$. The "tree-shaped or Boolean" sufficient conditions above are clean special cases; a general necessary-and-sufficient combinatorial criterion is open. See [closure-cover hypergraph classification](../questions/closure-cover-hypergraph-classification.md) for the broader combinatorial setting.
