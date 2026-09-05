---

name: delta-possible
description: "A proposition a ∈ H_t is Δ-possible when Δ_t(a) ≠ a — equivalently a < Δ_t(a): the transfer nucleus has not yet fixed a, and the future can still push a upward."
math_symbol: "\\langle\\Delta\\rangle"
---

### Definition — Δ-Possible Propositions {#delta-possible}

A proposition $a \in H_t$ is **Δ-possible** when it is not fixed by the transfer nucleus:
$$
a \text{ is Δ-possible} \;\iff\; \Delta_t(a) \neq a \;\iff\; a \notin \mathrm{Fix}(\Delta_t).
$$

By extensivity of $\Delta_t$ (§transfer-nucleus), $\Delta_t(a) \geq a$ always; so
Δ-possible is equivalent to the strict inequality $a < \Delta_t(a)$. The gap
$[a, \Delta_t(a)]$ in the ordering on $H_t$ is the **Δ-possible interval** of $a$:
the space the future can still occupy above $a$.

#### Meaning of Δ-Possibility {#delta-possible-meaning}

Δ-possibility at $t$ means: there exists a possible extension $s \star t$
(§extension-possibility) whose restriction $H(i_{s,t}) : H_{s \star t} \to H_t$
does not already send everything onto $a$ — the future has not fully committed.
The transfer nucleus $\Delta_t(a)$ is the least element of $\mathrm{Fix}(\Delta_t)$
above $a$: the smallest proposition that all future extensions already agree on.

Closure of Δ-possibility — the passage $a \mapsto \Delta_t(a)$ — is the transfer
step: the nucleus applies and $a$ is replaced by its transfer-stable upper bound.
Once closed, $\Delta_t(a) \in \mathrm{Fix}(\Delta_t) = \mathrm{Relation}(\mathbf{U})$
(§transfer-stable-universe) and no further transfer movement is possible in that direction.

#### Δ-Possibility and the Modal Language {#delta-possible-fml}

In FiberNuclearLanguage ([fiber-nuclear-language](fiber-nuclear-language.md)), the operator $\mathsf{Transfer}(M)$
denotes the transfer-stable closure of formula $M$: $\mathsf{Transfer}(M)$ holds at $t$
iff $\Delta_t(\llbracket M \rrbracket_t) = \llbracket M \rrbracket_t$. A formula $M$
is Δ-possible at $t$ when $\mathsf{Transfer}(M) \neq M$ at $t$ — when applying
$\mathsf{Transfer}$ strictly increases the extension. The Δ-possible formulas are exactly
those on which $\mathsf{Transfer}$ acts non-trivially.
