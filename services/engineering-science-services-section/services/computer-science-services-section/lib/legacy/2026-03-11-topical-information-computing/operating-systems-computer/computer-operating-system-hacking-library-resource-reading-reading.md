---
title: "Reads"
description: "Reading is a relation O reads R — operation O reads resource R — asserting that O accesses R's value without consuming or modifying R: after O completes, R persists unchanged and is available to other operations. The defining structure: reading is non-destructive access — the operation observes the resource without altering it. Reading corresponds to the exponential modality !A in linear logic (unrestricted, non-consuming use), to observation without token removal in Petri nets, and to fractional (shared) read access in separation logic. Reading is strictly weaker than taking (which acquires control of the resource) and strictly distinct from consuming (which destroys) and writing (which modifies)."
defines: Reads
related: Writes, Takes, Consumes, Uses, LinearLogic, SeparationLogic, EffectType
date-created: 2026-03-20
---

## Formal definition

**Reading** is a relation $O \text{ reads } R$:

$$(O : \mathrm{Operation},\; R : \mathrm{ResourceType})$$

holding when $O$ accesses an instance $r : R$ to observe its value and $r$ persists after $O$ completes — available and unchanged.

**One invariant.** $O \text{ reads } R$ iff:

1. **Non-destructive access**: $O$ accesses $r$ — observes its value, queries its state, inspects its content — without consuming or modifying $r$.
  The resource $r$ after $O$ is identical to $r$ before $O$: same value, same availability, same usability by other operations. **Idempotency of reading**: reading $r$ twice leaves $r$ in exactly the same state as reading $r$ once.

## Girard: the exponential !A

Jean-Yves Girard (*Linear Logic*, 1987, *Theoretical Computer Science*): in linear logic, the **exponential** $!
A$ marks a proposition as unrestricted — usable any number of times.
An operation $!
A \multimap B$ reads $A$ non-destructively: the $!$ modality allows using $A$ without consuming it.
The same instance of $A$ can serve as input to multiple operations simultaneously — shared read access.

The exponential restores contraction ($!
A \vdash !
A \otimes !
A$ — copy) and weakening ($!
A \vdash \mathbf{1}$ — discard) that linear logic otherwise forbids.
Reading is the computational interpretation of $!$: $!
A$ resources can be inspected, duplicated, or discarded. **Promotion**: $\frac{!
A_1, \ldots, !
A_n \vdash B}{!
A_1, \ldots, !
A_n \vdash !
B}$ — if all inputs are unrestricted (read-only), the output is also unrestricted.

## Separation logic: fractional permissions

Boyland (2003) and Bornat, Calcagno, O'Hearn, Parkinson (2005) introduced **fractional permissions** $x \xmapsto{q} v$ for $q \in (0, 1]$.
Full ownership ($q = 1$) allows reads and writes; fractional ownership ($q < 1$) allows only reads.

Multiple threads can hold fractional read permissions simultaneously: $x \xmapsto{q_1} v * x \xmapsto{q_2} v$ is satisfiable when $q_1 + q_2 \leq 1$.
The read rule: $\{x \xmapsto{q} v\}\; v' := [x]\; \{x \xmapsto{q} v \wedge v' = v\}$ — the read returns the value and leaves the permission unchanged.
Reading is formally non-consumptive: the permission is not reduced by reading.

## Effect type systems

Lucassen and Gifford (*Polymorphic Effect Systems*, 1988): an operation type $A \xrightarrow{\{\mathrm{reads}(r)\}} B$ reads from region $r$ but performs no writes.
Read-only functions are **observationally pure** with respect to writes: calling from the same state produces the same result (assuming no concurrent writes by others).

## Benton and Wadler: the LNL comonad

Nick Benton and Philip Wadler (*Linear Logic, Monads and the Lambda Calculus*, LICS 1996) construct the **Linear/Non-Linear (LNL) model** that makes the comonad structure of $!$ precise:

A monoidal adjunction $F : \mathcal{C} \rightleftharpoons \mathcal{L} : G$ between a cartesian closed category $\mathcal{C}$ (classical types, with weakening and contraction) and a symmetric monoidal closed category $\mathcal{L}$ (linear types) induces a comonad $! = FG$ on $\mathcal{L}$.
The comonad $!$ is exactly the linear logic $!$ modality.
The counit $\varepsilon : {!}
A \to A$ is **dereliction** — extracting the value from a reusable resource.
The comultiplication $\delta : {!}
A \to {!}{!}
A$ is **contraction** on the comonadic level.

Reading corresponds to the counit: an operation that reads $R$ has type ${!}
R \multimap ({!}
R \otimes B)$ — it applies $\varepsilon$ to extract the value, uses it, and returns the $!
R$ resource unchanged (re-introduces it via the comonad structure).
The $!$ comonad enforces that reading is non-destructive: the resource is threaded through the reading operation via the comonad's extract-and-return discipline.

The induced monad $T = GF$ on $\mathcal{C}$ gives the **computational monad** for effects.
Reading corresponds to the state monad's read operation: $\mathrm{get} : S \to T(S \times A)$ where the state $S$ is returned alongside the read value — the state is not destroyed.

## Atkey: quantitative type theory

Robert Atkey (*Syntax and Semantics of Quantitative Type Theory*, LICS 2018) provides a unified framework for all resource operation modes.
Each variable in the context is annotated with a **usage multiplicity** drawn from a semiring:

$\$0 \text{ (not accessed)}, \quad 1 \text{ (used exactly once)}, \quad \omega \text{ (used any number of times)}$$

These are the three grades of the usage semiring $\{0, 1, \omega\}$ (with \$0 + 1 = 1$, \$1 + 1 = \omega$, \$1 \cdot 1 = 1$, $\omega \cdot 1 = \omega$, etc.).
A typing judgment $x :_\rho A$ declares that variable $x$ of type $A$ is used with grade $\rho$.
The resource operations are then:

| Grade | Access mode | Corresponds to |
|---|---|---|
| $\rho = 0$ | Not accessed (may be absent) | Weakening — unused parameter |
| $\rho = 1$ | Used exactly once | Consumes — linear use |
| $\rho = \omega$ | Used freely, any number of times | Reads — non-destructive access |

Reading is exactly $\rho = \omega$: the resource may be accessed arbitrarily many times (zero, one, or more) without being consumed.
This is the formal content of idempotency-of-reading: the resource with grade $\omega$ may be inspected $n$ times for any $n \geq 0$ and remains available.

The semiring structure ensures the accounting is consistent: using a grade-$\omega$ resource once leaves grade $\omega$ (not $\omega - 1$); using a grade-\$1$ resource once leaves grade \$0$ (consumed).

## Open questions

- Whether $!
  A$ in linear logic and fractional read permissions in separation logic are formally the same — whether there is a translation from the proof nets of multiplicative-exponential linear logic to separation logic entailments that maps $!
  A$ to fractional permissions, and whether the LNL comonad structure corresponds to the permission-splitting operations in fractional permission models.
- Whether reading has a coherent account under quantum uncertainty — where measurement collapses a quantum state — and whether classical reading is the limit of quantum measurement as decoherence goes to infinity.
- Whether the grade-$\omega$ account of reads (Atkey) and the fractional-permission account (Boyland, Bornat et al.) are formally equivalent — whether $\omega$ corresponds to the condition $q \in (0, 1]$ for fractional $q$, and whether the fractional value encodes the "number of simultaneous readers" in some precise sense.
