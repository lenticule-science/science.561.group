---
type: theorem
status: proved
depends-on: [closure-2-monad, settling-endofunctor, closure-operator, closure-2-monad-lax-idempotence]
---

# The closure 2-monad has no non-trivial periodic orbits

The corpus's [closure 2-monad](../morphisms/closure-2-monad.md) is monotone, inflationary, and idempotent. Iterating it produces an ascending chain that stabilises at the closure ordinal. **No periodic orbits of period $\geq 2$ exist** — the iteration always converges to a fixed point.

This is the basic dynamical-systems theorem for predication categories' standard closure-operator setting, addressing the [settling-endofunctor-as-dynamical-system question](questions/settling-endofunctor-as-dynamical-system.md).

## Statement

**Theorem (no non-trivial periodic orbits).** *Let $T : \mathrm{KP}(B) \to \mathrm{KP}(B)$ be a closure operator on the predication-presheaf category (monotone, inflationary, idempotent — predication categories' standard properties from the [closure 2-monad lax-idempotence theorem](closure-2-monad-lax-idempotence.md)). For every presheaf $v$ and every $k \geq 1$:*

$$T^k(v) = T(v) \implies T^{k+1}(v) = T(v).$$

*Equivalently: if $T^k(v) = v$ for some $k \geq 1$, then $T(v) = v$ (i.e., $v$ is a fixed point, period 1). No orbit has minimal period $\geq 2$.*

## Proof

Inflationarity: $T(v) \supseteq v$ for every presheaf $v$. Equivalent to the standard 2-monadic inflationarity in the corpus.

Iterate: $T(v) \supseteq v$, so applying $T$ again, $T^2(v) \supseteq T(v)$. Inductively, $T^{k+1}(v) \supseteq T^k(v)$ for all $k \geq 0$.

Suppose $T^k(v) = v$ for some $k \geq 1$. The chain

$$v \subseteq T(v) \subseteq T^2(v) \subseteq \cdots \subseteq T^k(v) = v$$

is a chain of inclusions ending at $v$. The first inclusion $v \subseteq T(v)$ combined with the last equality $T^k(v) = v$ forces $T(v) \subseteq v$. Combined with $v \subseteq T(v)$ (inflationarity): $T(v) = v$.

So $v$ is a fixed point — period 1. The supposed orbit of period $k \geq 2$ doesn't exist.

Equivalently: any $v$ with $T^k(v) = v$ for some $k$ satisfies $T(v) = v$ already. The minimal period is always 1, never larger. $\square$

## What this gives

The dynamical-systems story for predication categories' standard closure operator is **structurally trivial at the periodic-orbit level**: every iteration converges to a fixed point in finite or transfinite time, with no recurring intermediate behavior. The four-regime classification ([four-regime dichotomy](../../../references/four-regime-dichotomy.md)) is the *only* dynamical-systems classification — there's nothing else.

This is a clean negative result. **The settling endofunctor's dynamical-systems content is exhausted by the closure-ordinal classification.** No spectral theory, no strange attractors, no genuine periodic phenomena exist for inflationary monotone idempotent operators.

## Where periodic orbits *would* appear

To get genuine periodic orbits, the closure operator's standard properties would have to be relaxed:

### Drop inflationarity

If $T(v) \not\supseteq v$ (i.e., $T$ can *remove* content from $v$, not just add), then iteration can oscillate. Periodic orbits become possible.

**Example.** Let $T$ be the alphabet swap $0 \leftrightarrow 1$ on a binary settling — sends a presheaf with a $0$-valued cell to one with a $1$-valued cell. $T^2 = \mathrm{id}$, so every presheaf has period 2 unless already fixed. This $T$ is *not inflationary* — it doesn't add content, it transforms content.

This is structurally the bilattice's [negation involution](../morphisms/negation.md), which the corpus has as a *separate* operation, not as a closure operator. The framework recognises negation as a $\mathbb{Z}/2$-gauge action (per the [internal $\mathbb{Z}/2$-gauge concept](teaching/explanations/internal-z2-gauge.md)) precisely because it's not a closure operator.

### Drop idempotency

If $T \circ T \neq T$ (i.e., applying $T$ twice can change something even after the first application), period-2 orbits become possible.

**Example.** A non-monotone difference operator: $T(v) = v - \text{(some content)} + \text{(other content)}$. Could oscillate.

The corpus doesn't have such operators in its core setup; they're outside the closure-2-monad framework.

### Drop monotony

If $T$ is non-monotone, all sorts of dynamical behavior become possible. Standard dynamical-systems theory then applies.

## What this means for predication categories' framework

The corpus is structurally a **fixed-point theory**, not a dynamical-systems theory. Its content is in:

- **Fixed-point existence** (settlings exist for any closure-rule system).
- **Fixed-point classification** (four-regime dichotomy + cohomological invariants).
- **Symmetries of fixed points** (Klein-four involutions act on fixed points).

The natural dynamical-systems-flavored questions (periodic orbits, attractors, bifurcations) are *empty* for the standard setup. They become non-trivial only for *generalizations* of the closure operator that don't satisfy the standard inflationary-monotone-idempotent triple.

This is *not* a framework limitation — it's a structural fact about closure operators. The framework correctly classifies the dynamics it covers; the dynamics that fall outside (non-inflationary etc.) are a different subject.
