---
type: definition
class: hyperdoctrine-instance
status: draft
depends-on: [operations-settling, capability-fiber-bundle]
realizes: [predication-hyperdoctrine]
---

# Quantifier adjoints on work fibers

The hyperdoctrine layer of [predication-categories](../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/) instantiated on the [operations base](./operations-base.md). When the operations settling forms a [predication hyperdoctrine](../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md), every reindexing morphism in the work-themed predicate category $\mathcal{C}_{\mathrm{op}}$ has both a left adjoint $\exists_f$ and a right adjoint $\forall_f$ in *both* bilattice orders ($\leq_k$, $\leq_t$). These adjoints let predicated-work state existential and universal claims about work as substrate-algebraic operations rather than meta-statements.

## What the adjoints compute

For a [predicate-category morphism](../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) $f : q \to p$ (specialization, converse, subject-projection, or object-projection):

- $f^*: A_p \to A_q$ — *substitution*: read the $p$-fiber's value at the cells $f$ maps to.
- $\exists_f^k: A_q \to A_p$ — *knowledge-order existential*: the smallest $p$-fiber value whose substitution recovers a given $q$-fiber value or above. "Some witnessing exists in $q$-cells that lifts to $p$-cells."
- $\forall_f^k: A_q \to A_p$ — *knowledge-order universal*: the largest $p$-fiber value whose substitution stays below a given $q$-fiber value. "Every $q$-cell witnesses what's required at the corresponding $p$-cell."
- $\exists_f^t, \forall_f^t$ — analogs in the truth order.

## Concrete operational readings

**Existential over agents on `provides-capability`.** Take $f$ = the subject-projection morphism collapsing the agent argument. Then $\exists_f^t$ on the `provides-capability`-fiber $\sigma$ asks: *for each capability $c$, is there some agent providing $c$?* The result is a fiber over capabilities alone: `availability-of-capability(c)` — settled at $\mathbf{t}$ iff some $A$ has $\sigma_A(c) = \mathbf{t}$. This is the substrate-algebraic content of "what capabilities are currently held by someone?"

**Universal over subtasks on goal-cell completion.** Take a parent task $T$ with subtasks $T_1, \ldots, T_n$ and $f$ = the inclusion of the subtask-set into the operations base. Then $\forall_f^t$ on the `goal-settled`-fiber asks: *for every subtask, is the goal settled?* The result is a single cell at $T$: `all-subtasks-settled` — settled at $\mathbf{t}$ iff each $T_i$'s goal cells are at the target value. This is the [decompose-task morphism](./decompose-task.md)'s composition rule made explicit as a quantifier.

**Existential over stages on incumbency.** Take $f$ = the projection onto the stage axis. Then $\exists_f^k$ on the `inducted-into`-fiber for office $O$ asks: *was there ever a stage at which someone held $O$?* The result is a stage-independent cell: `office-O-was-ever-held`. This separates *current vacancy* from *never-held*.

**Universal over cycles on practice-stability.** For a recurrent practice $R$, $\forall_f^k$ on the per-cycle-firing fiber asks: *did every cycle of $R$ fire its closure rules?* The result identifies cycles where the practice was suspended.

## Frobenius reciprocity in operational context

Per (B2k) of the [predication hyperdoctrine](../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md):

$$\exists_f^k(f^*(\alpha) \wedge_k \phi) \cong \alpha \wedge_k \exists_f^k(\phi)$$

Operationally: the existential of (a substituted condition AND a fiber value) equals (the condition AND the existential of the fiber value). In dispatch language: "is there an agent (with property $\alpha$) providing capability $c$?" decomposes into "(property $\alpha$) AND (some agent provides $c$)" — the existential commutes with the property-conjunction. This makes complex queries factor into simpler steps.

## Beck-Chevalley as cycle-coherence

(B3) Beck-Chevalley says the existential and substitution commute under pullback diagrams. Operationally: "the existential of a property over the dispatched-tasks of all agents in jurisdiction $\mathcal{J}$" can be computed either by (existentially quantifying first, then restricting to $\mathcal{J}$) or by (restricting first, then existentially quantifying). Both produce the same result. This is what makes cross-jurisdictional queries well-defined.

## Comprehension as task-extension

(B4) Comprehension provides an extension functor $\mathrm{Ext}^t: \mathcal{C}/p \to \mathcal{E}_p$ taking a morphism $g: q \to p$ to $\exists_g^t(\mathbf{1}_q^t)$. Operationally: a *task selector* (a morphism into the predicate category — "the tasks requiring capability $c$") gets converted into a *task valuation* (a fiber value over $p$ that's $\mathbf{t}$ on those tasks and $\mathbf{f}$ elsewhere). This is the substrate-algebraic content of "carving out a sub-collection of tasks by predicate" — comprehension turns predicates into selections.

The right adjoint $\{p : -\}_\mathbf{t}: \mathcal{E}_p \to \mathcal{C}/p$ goes the other way: a fiber value (a *condition* on cells) gets converted into a *task selector* (the morphism whose extension recovers the condition). Together, comprehension ↔ extension is the operational content of *predicate-as-set* / *set-as-predicate* duality.

## Two parallel adjoint systems on operations

Per the math program, the operations hyperdoctrine has *both* $\leq_k$- and $\leq_t$-adjoints. Different operations naturally use different orders:

- *$\leq_k$-adjoints* answer questions about *evidence accumulation*. "Is there evidence of capability $c$ somewhere?" — $\exists_f^k$ on the evidence-fiber. "Has every cell received evidence?" — $\forall_f^k$.
- *$\leq_t$-adjoints* answer questions about *truth state*. "Is there a satisfying agent?" — $\exists_f^t$ on the satisfaction-fiber. "Are all dependencies satisfied?" — $\forall_f^t$.

Most operational queries are $\leq_t$-flavored ("is the work done?"); audit/diagnostic queries are often $\leq_k$-flavored ("what evidence exists?"). The hyperdoctrine provides both natively.

## Frobenius for $\odot$ failure as operational constraint

Per (B2)'s caveat: Frobenius reciprocity for the *fusion* operation $\odot$ fails on three of the four predicate-category generators. Operationally, this means: dispatch's $\odot$-based composition (when used) cannot be freely commuted with existential quantification. A query like "is there an agent whose capability *fused with* the task's requirement reaches some threshold" cannot be re-written in the cleanly-decomposed Frobenius form.

This is why [dispatch](../morphisms/dispatch.md) prefers $\Rightarrow$ (the residuation, which is well-Frobenius-behaved on the relevant generators) over $\odot$ for the match operation. The hyperdoctrine's structural properties guide morphism choice.

## Position in the program

The hyperdoctrine layer is the second chapter of the math program's derivation chain; predicated-work inherits the structure rather than re-deriving it. This object's job is to *expose* the inherited adjoints in operational vocabulary, so that quantifier-shaped operational queries — "exists an agent…", "for all tasks…", "carve out the sub-collection of…" — translate to substrate-algebraic operations the implementation can directly compute.

Without the hyperdoctrine layer, predicated-work could only state cell-level facts. With it, the theory speaks the language of first-order quantification over the substrate, which is what most operational reasoning actually needs.
