---

name: hyperverse-normalization
description: "Theorem (stratified) and Anti-theorem (colimit): every term of HyperversalNuclearLanguage at a finite tower level normalizes, but strong normalization fails at the colimit — the Zeno settling gap separates level-wise termination from global termination."
---

### Theorem — Normalization at the Hyperverse Level {#hyperverse-normalization}

At the fiber level, every FiberNuclearLanguage term reduces to a unique canonical form
(§normalization, §strong-normalization). The question here is what normalization
properties HyperversalNuclearLanguage inherits — and which it loses.

The answer splits in two: a positive theorem at each finite level, and a negative
conjecture at the colimit.

#### Theorem — Stratified Normalization {#thm-stratified-normalization}

**Theorem.** For each $n \geq 0$, every term of the level-$n$ fragment of
HyperversalNuclearLanguage reduces to a unique canonical form in finitely many steps.

*Proof.* At level $n$, the fiber algebras are the fixed fibers $H_\mathbf{V}^*$ of
relational universes $\mathbf{V} \in \mathbf{RU}^{(n)}$ (§meta-universe-closure), and
the meta-nuclei $\sigma^{(n+1)}_\mathbf{V} = \Delta^{(n+1)}_\mathbf{V} = \mathrm{id}$
are trivial. The level-$n$ fragment of HyperversalNuclearLanguage therefore reduces to
a Heyting-algebraic language with trivial modal operators.

Strong normalization of FiberNuclearLanguage at each fiber (§strong-normalization) uses the
well-founded weight pair $(\mathsf{fmlW}(M), \mathsf{ent}(M)) \in \mathbb{N}^2$
ordered lexicographically ([nuclear-reduction-measure](nuclear-reduction-measure.md)). At level $n$, the modal operators are trivial:
$\mathsf{Saturate}_\mathcal{H}(M) \to M$ and $\mathsf{Transfer}_\mathcal{H}(M) \to M$ in one
step (by extensivity + idempotence of the identity). Every application of a meta-modal
operator reduces immediately, and the remaining Heyting reductions terminate by the
standard normalization of Heyting terms.

The weight function at level $n$ is bounded: the terms at level $n$ have
$\mathsf{fmlW}(M) \leq W_n$ for some finite $W_n$ depending on the size of
$\mathbf{RU}^{(n)}$. Confluence follows from confluence of the Heyting reductions
(no critical pairs remain once the modal operators are eliminated). $\square$

**Corollary — Level-Stratified Canonical Forms.** {#cor-stratified-canonical}
For each $n$, every derivable equivalence $\vdash M \equiv N$ at level $n$ is witnessed
by reduction to a common canonical form. The canonical forms at level $n$ embed into the
canonical forms at level $n+1$ via the tower inclusion, giving a directed system
$$
\mathsf{Can}^{(0)} \hookrightarrow \mathsf{Can}^{(1)} \hookrightarrow \cdots
$$
whose colimit $\mathsf{Can}^\mathcal{H} = \varinjlim_n \mathsf{Can}^{(n)}$ is the set
of **levelwise-canonical** terms of HyperversalNuclearLanguage.

#### Conjecture — Failure of Strong Normalization at the Colimit {#conj-normalization-failure}

**Conjecture (Zeno Settling Gap).** HyperversalNuclearLanguage is not strongly
normalizing. There exist terms of the internal language of $\mathcal{H}$ whose reduction
sequences do not terminate.

This is the reduction-theoretic face of the Zeno Settling Gap (§zeno-settling). The
failure has a precise source: the weight function $(\mathsf{fmlW}, \mathsf{ent})$ that
certifies termination at each finite level does not extend to the colimit, because new
terms with unbounded weight appear at each stage ([hyperversal-nuclear-language](hyperversal-nuclear-language.md)).

**The mechanism.** At each level $n$, the meta-modal operators are trivial and
reduce immediately. But HyperversalNuclearLanguage at the colimit contains terms that
are not the image of any finite level — terms whose construction requires the full
tower. For such a term $M$, the reduction sequence passes through infinitely many
tower levels: each reduction step may introduce a subterm first expressible at a
higher level, whose own reduction introduces terms at a still higher level.

Concretely: a term $M^\mathcal{H}$ in HyperversalNuclearLanguage is a compatible
family $M^{(n)}$ in the level-$n$ nuclear language for all $n$. Each $M^{(n)}$ normalizes
to a canonical form $\mathsf{NF}^{(n)}(M^{(n)})$. But the canonical forms
$\mathsf{NF}^{(n)}(M^{(n)})$ need not stabilize: the canonical form at level $n+1$
may differ from the image of the canonical form at level $n$, because the level-$(n+1)$
context equations impose new identifications (§completeness-tower-stratification).

If the canonical forms never stabilize — if for every $n$ there exists $m > n$ with
$\mathsf{NF}^{(m)}(M^{(m)}) \neq \iota_{nm}(\mathsf{NF}^{(n)}(M^{(n)}))$ — then
$M^\mathcal{H}$ has no canonical form in HyperversalNuclearLanguage.

#### Characterization — Normalizable and Non-Normalizable Terms {#normalization-characterization}

The terms of HyperversalNuclearLanguage divide into two classes:

**Levelwise terms.** A term $M^\mathcal{H}$ is **levelwise** if it factors through
some finite level: there exist $n$ and $M^{(n)}$ a level-$n$ nuclear language term such that
$M^\mathcal{H} = \iota_n(M^{(n)})$. By stratified normalization, every levelwise term
has a canonical form. The levelwise terms form the set $\mathsf{Can}^\mathcal{H}$ of
the corollary above.

**Genuinely hyperversal terms.** A term $M^\mathcal{H}$ is **genuinely hyperversal** if
it does not factor through any finite level. These are the terms whose canonical-form
sequence $(\mathsf{NF}^{(n)}(M^{(n)}))_{n \geq 0}$ does not stabilize.

The conjecture (§completeness-tower-stratification) asserts that
FiberNuclearLanguage-incomplete elements — those not expressible at any finite level — are
exactly those first expressible at the next tower level. By induction, the genuinely
hyperversal terms are those that require *every* tower level. The Zeno Settling Gap
is that such terms exist and their reduction does not terminate.

#### Connection to $H^1$ {#normalization-cohomology}

The Topos-of-Topoi conjecture (§topos-of-topoi) asserts
$H^1(\mathcal{H}, E_0^\mathcal{H}) \neq 0$: a non-trivial first cohomology class
obstructs global sections at the meta-level.

The non-normalizing terms are precisely those corresponding to non-trivial
$H^1$ classes (§zeno-obstruction): a term whose canonical form does not
stabilize across the tower is a local section (normalizable at each level)
that cannot be assembled into a global section (no global normal form).

$H^1 \neq 0$ and non-termination are two descriptions of the same
phenomenon. The cohomological language measures the obstruction; the
reduction-theoretic language describes the infinite descent through it.

#### Status {#normalization-status}

- **Stratified normalization** (§thm-stratified-normalization): proved, by reduction
  to §strong-normalization at each finite level.
- **Failure at the colimit** (§conj-normalization-failure): conjecture. Proving it
  requires exhibiting a non-terminating term (§zeno-open) and connecting it to the
  $H^1$ obstruction.
- **Scope determination** (§normalization-characterization): conjecture. Characterizing
  the boundary between levelwise and genuinely hyperversal terms depends on
  §completeness-tower-stratification.
