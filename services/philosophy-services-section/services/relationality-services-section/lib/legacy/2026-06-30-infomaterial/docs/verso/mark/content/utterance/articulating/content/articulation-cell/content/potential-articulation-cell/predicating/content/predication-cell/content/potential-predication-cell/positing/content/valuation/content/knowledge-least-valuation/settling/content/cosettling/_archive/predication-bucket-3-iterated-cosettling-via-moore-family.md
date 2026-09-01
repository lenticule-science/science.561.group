---
kind: theorem
status: proved
depends-on: [cosettling, closure-operator, closure-2-monad]
---

# Iterated cosettling via Moore-family fixed-points

Alternative proof of [iterated cosettling counts derivable cells](iterated-cosettling-counts-derivable-cells.md) via Moore-family / Galois-connection structure of closure operators on complete lattices. Where the original proof argues from inflation + closure-stability directly, this path identifies the iterated cosettling fiber with a Moore-family closure-equivalence class.

## Background: closure operators and Moore families

For an idempotent monotone closure operator $T : L \to L$ on a complete lattice $L$:

- The **fixed points** $\mathrm{Fix}(T) := \{x \in L : T(x) = x\}$ form a *Moore family* of $L$: closed under arbitrary meets, with maximum $\top_L$ (if $T(\top_L) = \top_L$).
- $T$ factors as the composite $L \twoheadrightarrow \mathrm{Fix}(T) \hookrightarrow L$ where the first map is the closure restriction $T : L \to \mathrm{Fix}(T)$, $x \mapsto T(x)$, and the second is the inclusion $\iota : \mathrm{Fix}(T) \hookrightarrow L$.
- $T \dashv \iota$ is a **Galois connection**: $T(x) \leq y$ iff $x \leq \iota(y) = y$, for all $x \in L, y \in \mathrm{Fix}(T)$.

For each $w \in \mathrm{Fix}(T)$, the **closure-equivalence class** of $w$ is

$$T^{*-1}(w) \;:=\; \{x \in L : T^*(x) = w\} \;=\; \{x \in L : x \leq w \text{ and } T^*(x) = w\}.$$

For a Moore family, this equivalence class has a clean interval structure:

**Lemma (Moore-family fiber characterization).** *For a closure operator $T$ on a complete lattice $L$ with $\mathrm{Fix}(T)$ a Moore family, the closure-equivalence class of $w \in \mathrm{Fix}(T)$ is the interval*

$$T^{*-1}(w) \;=\; [\mathrm{generators}(w), w]$$

*where $\mathrm{generators}(w) := \bigwedge \{x \in L : T^*(x) = w\}$ is the smallest element whose closure is $w$ (it exists, as the meet of a non-empty family of elements with closure $w$, by Moore-family meet-closure).*

(*Standard fact in lattice theory. The interval form follows because $T^*$ is monotone and the fiber over $w$ is closed under joins with $w$ via inflation.*)

## The strict-regime cosettling

For a strict-regime closure operator $T$ with rule set $R$ on a finite cell space $C$, take $L = \mathcal{P}(C)$ (the powerset, ordered by inclusion).

**Statement.** *In the strict regime,*

$$T^{*-1}(w) \;=\; [\mathrm{seed}, w],$$

*where $\mathrm{seed}$ is the set of cells in $w$ with no incoming rule. Consequently $|T^{*-1}(w)| = 2^{|w| - |\mathrm{seed}|}$.*

## Proof

We invoke the Moore-family fiber characterization with $\mathrm{generators}(w) = \mathrm{seed}$.

**Step 1: $\mathrm{Fix}(T)$ is a Moore family in $\mathcal{P}(C)$.** $T$ is idempotent (strict regime, $\kappa < \omega$) and monotone (inflation + rule-antecedent monotonicity). For any family $\{x_i\} \subseteq \mathrm{Fix}(T)$, the intersection $\bigcap x_i$ is also closure-stable: any rule firing at $\bigcap x_i$ also fires at each $x_i$, with output in $T(x_i) = x_i$, so output in $\bigcap x_i$. Hence $\mathrm{Fix}(T)$ is closed under arbitrary meets — a Moore family.

**Step 2: $\mathrm{generators}(w) = \mathrm{seed}$.** The generators are the smallest $x$ with $T^*(x) = w$.

- *$\mathrm{seed} \subseteq \mathrm{generators}(w)$.* Cells of $\mathrm{seed}$ cannot be produced by any rule (no rule has them in its consequent). For $x \in \mathcal{P}(C)$ with $T^*(x) = w$ and $s \in \mathrm{seed} \setminus x$: $s \notin T^k(x)$ for any $k$ (no rule produces $s$ from cells reachable from $x$), so $s \notin T^*(x) = w$, contradicting $s \in w$. Hence $\mathrm{seed} \subseteq x$ for every $x$ in the fiber, so $\mathrm{seed} \subseteq \bigwedge_x x = \mathrm{generators}(w)$.

- *$\mathrm{generators}(w) \subseteq \mathrm{seed}$.* It suffices to show $T^*(\mathrm{seed}) = w$, then $\mathrm{seed}$ is in the fiber and the meet $\mathrm{generators}(w)$ is at most $\mathrm{seed}$.

  $T^*(\mathrm{seed}) \subseteq w$: rules firing at $\mathrm{seed} \subseteq w$ also fire at $w$, with output in $T(w) = w$.
  
  $T^*(\mathrm{seed}) \supseteq w$: the canonical forward trajectory $v_0 \subseteq v_1 \subseteq \cdots \subseteq v_\kappa = w$ starts at $v_0 = \mathrm{seed}$ (by definition of $\mathrm{seed}$ as the cells with no producing rule, which are exactly the cells set by the increment sequence at stage 0) and reaches $w$ in finitely many steps. Hence $T^*(\mathrm{seed}) = w$.

  Combining: $\mathrm{seed} \in $ fiber, so $\mathrm{generators}(w) \leq \mathrm{seed}$.

By antisymmetry, $\mathrm{generators}(w) = \mathrm{seed}$. $\square$ (Step 2)

**Step 3: applying the lemma.** By the Moore-family fiber characterization,

$$T^{*-1}(w) = [\mathrm{generators}(w), w] = [\mathrm{seed}, w].$$

In $\mathcal{P}(C)$, the interval $[\mathrm{seed}, w] = \{v \in \mathcal{P}(C) : \mathrm{seed} \subseteq v \subseteq w\}$, in bijection with $\mathcal{P}(w \setminus \mathrm{seed})$. So $|T^{*-1}(w)| = 2^{|w \setminus \mathrm{seed}|}$. $\blacksquare$

## What this gives that the original proof doesn't

The [original proof](iterated-cosettling-counts-derivable-cells.md) argued directly from inflation and closure-stability. It used no abstract structure beyond the closure operator's basic axioms.

The Moore-family version embeds the result in a richer lattice-theoretic framework:

- **Connects to standard lattice theory.** The result is a special case of "closure-equivalence classes are intervals in the closure-Moore-family Galois connection" — a classical fact for any complete-lattice closure operator. The strict-regime specialization gives the $\mathcal{P}(C)$ version with $\mathrm{generators} = \mathrm{seed}$.

- **Generalizes to arbitrary closure operators on complete lattices.** Any closure operator with the structure $T : L \to L$, idempotent and monotone, admits the same fiber characterization. The strict-regime restriction is unnecessary; the proof transfers to Scott-continuous and transfinite settings as long as $T^*$ is defined.

- **Suggests Galois-adjoint backward dynamics.** The Galois connection $T \dashv \iota : \mathrm{Fix}(T) \hookrightarrow L$ is a candidate "canonical backward operator" — see [forward-trajectory via Galois adjunction](forward-trajectory-via-galois-adjunction.md) for the single-step pre-image refinement.

## Position in the program

Companion proof to [iterated cosettling counts derivable cells](iterated-cosettling-counts-derivable-cells.md). Same conclusion via lattice-theoretic embedding rather than direct combinatorial argument.

The two paths together establish the iterated-cosettling formula on two independent structural foundations:

| Path | Framework | Key tool |
|---|---|---|
| 1 | Inflation + closure-stability | Direct cell-membership argument |
| 2 (this) | Moore-family / Galois | Fiber-as-interval characterization |

Both paths give $|T^{*-1}(w)| = 2^{|w \setminus \mathrm{seed}|}$. The Moore-family proof additionally identifies the structural reason: closure-equivalence classes of any closure operator are intervals in the Moore-family Galois connection.
