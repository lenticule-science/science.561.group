---
id: commutation
name: Commutation
description: "The commutation relation I on Σ: which step-pairs commute, determining the shape of commutation classes and the diamond structure of T."
defines: Commutation
---

### Definition — Commutation {#commutation}

**Commutation** is the symmetric irreflexive relation $I \subseteq \Sigma \times \Sigma$
specifying, for any two steps $s, s' \in \Sigma$,
whether their order does not affect the history produced.

Formally:
$$
I \subseteq \Sigma \times \Sigma, \qquad s \perp s' \;:\Leftrightarrow\; (s,s') \in I.
$$

$I$ is a global fact about $\Sigma$: if $s \perp s'$, it holds at every history
$t' \geq t$ — no extension can revoke commutation.

**The Diamond.** The operationally decisive consequence of commutation is the
diamond in $T$: when $s \perp s'$, the extensions $s \star t$ and $s' \star t$
satisfy $s \star (s' \star t) = s' \star (s \star t)$. This diamond is what
drives nucleus commutativity $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$
(§fiber-doctrine) and therefore the well-behavior of the fixed fiber $H_t^*$.

**Scope.** This file documents commutation as a quality predicate at the
history level. Commutation propagates through all subsequent levels (fibers,
geometry, dynamics, hyperverse); those echoes are catalogued in §commutation.
