---

name: history-depth
description: "The depth of a history is its minimum step count — the shortest number of steps in any representative step sequence."

defines: HistoryDepth
---

### Definition — History Depth {#history-depth}

The **depth** of a history $t \in T = \mathbb{M}(\Sigma, I)$ is the minimum step count
over all representative step sequences:
$$
\mathrm{depth}(t) \;:=\; \min\bigl\{ |w| \;\big|\; w \in \Sigma^* \text{ and } [w] = t \bigr\}.
$$
Here $|w|$ denotes the number of steps in $w$.

The empty history $\varepsilon$ has $\mathrm{depth}(\varepsilon) = 0$.

**Properties:**

1. *Subadditivity.* $\mathrm{depth}(s \star t) \leq \mathrm{depth}(s) + \mathrm{depth}(t)$, with equality when $s \perp t$ or when neither extends the other.

2. *Monotonicity with respect to prefix order.* If $t \leq t'$ (i.e., $t'$ extends $t$), then $\mathrm{depth}(t) \leq \mathrm{depth}(t')$.

3. *Finiteness of sublevel sets.* For each $n \in \mathbb{N}$, the set $\{t \in T \mid \mathrm{depth}(t) \leq n\}$ is finite, since $\Sigma$ is finite and histories at depth $\leq n$ have representative step sequences of length $\leq n$ — a finite set.

**Depth as a quality.** History depth is a *quality* of each history — a numerical invariant that measures how far removed $t$ is from the empty history. It is the discrete analogue of the norm in a metric space. The depth-$n$ sublevel set $T^{(n)}$ (§history-sublevel) is the ball of radius $n$ around $\varepsilon$.
