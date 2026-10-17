---
name: Scott Continuity
date-created: 2026-09-03
references:
  scott1976:
    authors: ["Dana S. Scott"]
    title: "Data Types as Lattices"
    publication: "SIAM Journal on Computing"
    year: 1976
---

A function $f : P \to Q$ between [directed-complete partial orders](./partial-order.md)
(dcpos) — posets in which every directed subset has a join — is **Scott-continuous** if
it is monotone and preserves directed joins:

$$f\!\left(\bigvee S\right) = \bigvee f(S) \qquad \text{for every directed } S \subseteq P.$$

Monotonicity alone only guarantees $f(\bigvee S) \geq \bigvee f(S)$; Scott-continuity
additionally requires the reverse inequality, so the function's value at a directed
limit is exactly the limit of its values along the way — nothing new appears only at
the join.

Equivalently, a dcpo $P$ carries the **Scott topology**: a set $U \subseteq P$ is open
iff it is upward-closed and *inaccessible by directed joins*, meaning that whenever a
directed join $\bigvee S$ lies in $U$, some element of $S$ already lies in $U$. The
Scott-continuous functions are exactly the topologically continuous functions for this
topology (Scott 1976) — the name records this coincidence.

Scott-continuity is the foundational notion of domain theory: Scott introduced it to
model computable functions between recursively defined data types (Scott 1976),
because a function computed by a finite (but unbounded) process can only ever have
examined finitely much of a directed limit's approximants before returning a value —
it cannot "see" the whole limit at once, which is exactly what Scott-continuity
formalizes. It underlies the existence of least fixed points for the semantics of
recursive programs: a Scott-continuous endofunction on a pointed dcpo has a least
fixed point obtained as the join of its iterates from the bottom element, $\bigvee_n
f^n(\bot)$ — the domain-theoretic form of the Kleene fixed-point theorem.

## In Obsmetrologia

`Obsmetrologia.Closure.Regime` carries `scottContinuous` as one of the three decidable
flags stratifying a settling problem's [closure ordinal](./closure-ordinal.md) `κ`: `κ
= ω` exactly in the regime where the closure is Scott-continuous over an infinite base
(the corpus's *Scott* regime). The corpus's own definition, stated for a closure
operator component on a predication fiber algebra rather than an arbitrary dcpo
function, is the node [Scott-continuous closure](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/closure-operator/content/scott-continuous-closure/scott-continuous-closure.md):
$\mathrm{cl}_p$ is Scott-continuous in the knowledge order if it preserves directed
$\leq_k$-joins, $\mathrm{cl}_p(\bigvee_k S) = \bigvee_k \{\mathrm{cl}_p(x) : x \in S\}$
— the same equation as above, specialized to a closure operator on a predication
fiber. That node observes the physical reading directly: Scott-continuity holds when
inference rules have finite antecedents (each rule fires on a directed join iff it
fires on some finite sub-join), and typically fails for quantifier-induced closures
with infinitary antecedents — the mechanism [causal existence](../../../../../../../natural-science-services-section/content/text/glossary/terms/causal-existence.md)
and [kinetic existence](../../../../../../../natural-science-services-section/content/text/glossary/terms/kinetic-existence.md)
diverge on.

## See also

- [Closure operator](./closure-operator.md) — the structure Scott-continuity is most often asked of
- [Closure ordinal](./closure-ordinal.md) — the transfinite iteration whose stabilization point Scott-continuity bounds
- [Fixpoint](./fixpoint.md) — what a Scott-continuous endofunction on a pointed dcpo is guaranteed to have
