---
id: history-orbit-aperiodicity
name: HistoryOrbitAperiodicity
description: "no nonempty step-sequence fixes any history under left-concatenation; G_s orbits in T are pairwise distinct and strictly increasing in depth."
---

### Lemma — History Orbit Aperiodicity {#history-orbit-aperiodicity}

In the free history monoid $\mathbb{M}(\Sigma, I)$, no nonempty step-sequence fixes any
history. Equivalently, the left-shift maps $\varphi_w : t \mapsto w \star t$ have no
periodic points for $w \neq \varepsilon$.

**Proof.** Suppose $w \star t = t$ for some nonempty step sequence $w$ and history $t$. Then
$w \star t = \varepsilon \star t$. By left-cancellativity of $\mathbb{M}(\Sigma, I)$
(§history-universality), this forces $w = \varepsilon$, contradicting the assumption
that $w$ is nonempty. $\square$

#### Corollary — G_s Orbit Distinctness {#history-orbit-distinctness}

For any step $s \in \Sigma$ and history $t \in T$, the orbit
$$
t, \quad s \star t, \quad s \star s \star t, \quad \ldots
$$
consists of pairwise distinct histories, each of strictly greater depth than its
predecessor.

**Proof.** Distinctness: suppose $s^m \star t = s^n \star t$ with $m > n$. Then
$s^{m-n} \star (s^n \star t) = s^n \star t$, so $s^{m-n}$ fixes $s^n \star t$, a
contradiction since $m - n > 0$. Strict depth increase: $\mathrm{depth}(s \star t) =
\mathrm{depth}(s) + \mathrm{depth}(t) \geq \mathrm{depth}(t) + 1$, since $s$ is
nonempty (unit-free, §history-monoid). $\square$

#### Remark — No Appeal to History Separation {#history-orbit-aperiodicity-independence}

This lemma uses only the unit-free and left-cancellative properties of the abstract
history system axioms (§history-monoid). It does not use the Axiom of History
Separation, the fiber algebras, or any modal structure. Cayley-graph aperiodicity of
$(T, I)$ is a consequence of the monoid axioms alone; it is automatic in every
relational universe, not a condition that needs to be checked or assumed.

This should be compared with the Axiom of History Separation (§history-separation),
which is about the *functor* $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ not being
collapsible by automorphisms of $T$. That axiom operates one level up and requires a
separate argument.
