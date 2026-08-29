---

description: "The result of repeatedly applying a set of rules until nothing new is produced. The least fixpoint of a monotone operator — making all derivable consequences explicit."
defines: closure
aliases: [closure, closed, closure operator, deductive closure]
specialization: fixpoint
properties: [idempotent, extensive, monotone]
computed-via: knaster-tarski
requires: [monotone, complete-lattice]
on-bilattice: "eliminates ⊥ within scope"
effective-algebra-after: "{t, f, ⊤}"
adjunction-survives: true
truth-ordering-becomes: total-order
convergence: "at most 2 × |assertions| steps"
bilattice-technique: fitting-1991
date-created: 2026-03-31
---

The closure of a structure under a set of rules is what you get when you apply the rules until nothing new can be derived. Every consequence that the rules can produce has been made explicit.

In set theory, the closure of a set $S$ under an operation $f$ is the smallest set containing $S$ that is closed under $f$ — if $a$ is in the set, then $f(a)$ is in the set.

In logic, the deductive closure of a set of axioms is the set of all theorems derivable from those axioms. The axioms are the starting point; the closure is everything they imply.

In [residuated lattice](./residuated-lattice.md) semantics, closure is computed by iterating a monotone operator to its least [fixpoint](../../order/terms/fixpoint.md). Fitting (1991) showed that inference on bilattice-valued structures reaches a fixpoint because the knowledge ordering has finite height: each step pushes at least one value strictly upward, and the chain is bounded.

On the four-valued [bilattice](./bilattice.md), closure eliminates $\bot$ (unknown) from within scope: every assertion reachable by inference gets pushed from $\bot$ upward to $t$, $f$, or $\top$. After closure, the effective algebra operates on $\{t, f, \top\}$. The [adjunction](../../categories/domains/ordinary-categories/terms/adjoint-pair.md) $\odot \dashv \Rightarrow$ persists on this reduced set — both operations are closed on $\{t, f, \top\}$ and the residuation holds with zero violations.

A closure operator is **idempotent**: closing something that is already closed does nothing. It is **extensive**: the closure contains the original. It is **monotone**: closing a larger set gives a larger result. These three properties — [idempotent](./idempotence.md), extensive, monotone — define a closure operator abstractly.
