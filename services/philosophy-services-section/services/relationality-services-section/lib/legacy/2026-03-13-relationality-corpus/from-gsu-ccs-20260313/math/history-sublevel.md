---

name: history-sublevel
description: "The depth-n sublevel T^(n) is the full subcategory of the history category on histories of depth at most n; it forms a finite history site."

---

### Definition — History Sublevel {#history-sublevel}

For each $n \in \mathbb{N}$, the **depth-$n$ sublevel** is the full subcategory
$$
T^{(n)} \;:=\; \bigl\{ t \in T \;\big|\; \mathrm{depth}(t) \leq n \bigr\},
$$
with morphisms inherited from $T$ (prefix extensions within $T^{(n)}$).

**Properties:**

1. *Finite.* By property (3) of §history-depth, $T^{(n)}$ is a finite category.

2. *Downward-closed.* If $t \leq t'$ and $t' \in T^{(n)}$, then $t \in T^{(n)}$ (by monotonicity of depth: $\mathrm{depth}(t) \leq \mathrm{depth}(t') \leq n$). Thus $T^{(n)}$ is an *aroma* (downward-closed sub-poset) of the prefix order.

3. *Stability of commutation.* If $s \perp t$ and $s, t \in T^{(n)}$, then $s \star t \in T^{(n)}$ if and only if $\mathrm{depth}(s) + \mathrm{depth}(t) \leq n$.

4. *Filtration.* $T^{(0)} = \{\varepsilon\} \subseteq T^{(1)} \subseteq T^{(2)} \subseteq \cdots$ with $\bigcup_n T^{(n)} = T$.

**The restricted topology.** The commutation topology $J$ on $T$ (§locality) restricts to $T^{(n)}$ as $J|_{T^{(n)}}$: a sieve on $t \in T^{(n)}$ covers iff it covers in $J$. The site $(T^{(n)}, J|_{T^{(n)}})$ is the algebra input for the depth-$n$ relational universe $R_n$ (§depth-filtration).

**The sublevel as a relational universe input.** Each $T^{(n)}$ is itself a valid history category (it satisfies the Axiom of Histories at level $n$). The relational universe built over it is $R_n = \mathbf{Sh}(T^{(n)}, J|_{T^{(n)}})$.
