---

name: entanglement-combinatorics
description: "Lemmas: structural properties of the entanglement measure ent(M) — additivity over conjunction, how Sat multiplies entanglement, Trans-neutrality for kc=0 formulas, and normal forms having zero entanglement."
---

### Theorem — Entanglement Combinatorics {#entanglement-combinatorics}

The entanglement measure $\mathsf{ent}$ ([nuclear-reduction-measure](nuclear-reduction-measure.md)) satisfies a collection of structural
lemmas that follow directly from its recursive definition. These lemmas make the measure
concrete and give it physical content beyond its role in the termination proof
(§strong-normalization).

Throughout, $\mathsf{kc}(M)$ denotes the $\mathsf{Transfer}$-count of $M$ ([nuclear-reduction-measure](nuclear-reduction-measure.md)).

#### Entanglement is Additive over Conjunction {#ent-additive}

**Lemma.** For all terms $M, N$:
$$
\mathsf{ent}(M \wedge N) \;=\; \mathsf{ent}(M) + \mathsf{ent}(N).
$$

*Proof.* Immediate from the recursive clause
$\mathsf{ent}(M \star N) = \mathsf{ent}(M) + \mathsf{ent}(N)$ with $\star = \wedge$. $\square$

The same holds for $\vee$ and $\Rightarrow$. **Consequence:** the settling cost of
establishing $M \wedge N$ is exactly the sum of the settling costs of $M$ and $N$ —
conjunction shares no settling work between its conjuncts. Each conjunct must independently
resolve the ordering between its $\mathsf{Saturate}$ and $\mathsf{Transfer}$ occurrences.

#### Saturation Multiplies Entanglement {#ent-sat-multiplies}

**Lemma.** For all terms $M$:
$$
\mathsf{ent}(\mathsf{Saturate}(M)) \;=\; \mathsf{ent}(M) + \mathsf{kc}(M).
$$

*Proof.* Immediate from the recursive clause $\mathsf{ent}(\mathsf{Saturate}(M)) = \mathsf{ent}(M) + \mathsf{kc}(M)$. $\square$

**Consequence.** Asserting past-stability of a formula containing $k$ distinct $\mathsf{Transfer}$
occurrences creates $k$ new unresolved ordering decisions — one for each $\mathsf{Transfer}$
that now finds itself inside a new $\mathsf{Saturate}$ ancestor. Saturation is expensive for
formulas that carry concurrent content: $\mathsf{Saturate}(M)$ costs $\mathsf{kc}(M)$ more
to settle than $M$ alone.

#### Transfer is Entanglement-Neutral for Trans-Free Formulas {#ent-trans-neutral}

**Corollary.** If $\mathsf{kc}(M) = 0$ then $\mathsf{ent}(\mathsf{Saturate}(M)) = \mathsf{ent}(M)$.

*Proof.* Set $\mathsf{kc}(M) = 0$ in the lemma above. $\square$

A formula $M$ with $\mathsf{kc}(M) = 0$ contains no $\mathsf{Transfer}$ — it lives in
$\mathrm{Fix}(\sigma_t)$ without interaction from $\Delta_t$. For such formulas,
normalization is entirely cheap in the entanglement direction: R7 never fires,
and the entanglement coordinate of the termination measure ([nuclear-reduction-measure](nuclear-reduction-measure.md)) is always $0$.

#### Normal Forms Have Zero Entanglement {#ent-normal-forms}

**Lemma.** If $M$ is in normal form with respect to R1–R19$'$ (§reduction-system),
then $\mathsf{ent}(M) = 0$.

*Proof.* If $\mathsf{ent}(M) > 0$, then the recursive definition implies $M$
contains a subterm $\mathsf{Saturate}(N)$ with $\mathsf{kc}(N) \geq 1$. Any $\mathsf{Transfer}$
occurrence in $N$ is inside a $\mathsf{Saturate}$-headed context. Working down to a
topmost such occurrence gives a subterm of the form $\mathsf{Saturate}(\ldots\mathsf{Transfer}(P)\ldots)$
where $P$ contains no $\mathsf{Saturate}$ wrapping an inner $\mathsf{Transfer}$.
But then $\mathsf{Saturate}(\mathsf{Transfer}(P))$ appears as a sub-context, and R7 applies —
contradicting the assumption that $M$ is in normal form. $\square$

**Corollary.** The entanglement counts the total $\mathsf{Saturate}$-over-$\mathsf{Transfer}$
ordering work outstanding before reaching normal form. When this count is zero, the
two operators are correctly sorted throughout the term.

#### Entanglement Bounds Trans-Depth {#ent-bounds-trans-depth}

**Lemma.** Let $d_\Delta(M)$ be the maximum nesting depth of $\mathsf{Transfer}$ in $M$
(the length of the longest path from a $\mathsf{Transfer}$-node to the root), and let
$\mathsf{satCount}(M)$ be the total number of $\mathsf{Saturate}$ occurrences in $M$.
Then:
$$
\mathsf{ent}(M) \;\leq\; d_\Delta(M) \cdot \mathsf{satCount}(M).
$$

*Proof.* Each $\mathsf{Transfer}$ occurrence contributes to $\mathsf{ent}$ at most its
number of $\mathsf{Saturate}$-headed ancestors. That number is at most $d_\Delta(M)$ (there
are at most $d_\Delta(M)$ ancestor nodes above it), and each such ancestor is a
$\mathsf{Saturate}$ occurrence, so the count is at most $d_\Delta(M)$. Summing over all
$\mathsf{kc}(M)$ Trans occurrences, and using $\mathsf{kc}(M) \leq \mathsf{satCount}(M)$
only crudely: each of the $\mathsf{kc}(M)$ Trans nodes contributes at most
$\mathsf{satCount}(M)$ to the total (since $\mathsf{satCount}$ counts all Sat nodes
in the whole term, which is an upper bound on ancestors of any one node). $\square$

**Consequence.** A formula can be large but cheap to normalize if its modal operators
are not deeply interleaved: if $d_\Delta(M)$ is small or $\mathsf{satCount}(M)$ is
small, entanglement is bounded regardless of the total size of $M$. The expensive case
is a small formula where $\mathsf{Saturate}$ and $\mathsf{Transfer}$ are wound tightly around
each other.

#### Relation to Settling Depth {#ent-settling-depth}

The five lemmas above describe entanglement as a combinatorial measure of modal
operator ordering. At the semantic level, $\mathsf{ent}(M)$ counts how many
$\sigma_t$-over-$\Delta_t$ orderings in $M$ still need to be resolved before
$M$'s denotation is expressed in the canonical form $\mathsf{Transfer}(\mathsf{Saturate}(-))$.

The deeper consequence — connecting entanglement to the number of R7 steps in any
reduction to normal form — is more subtle: non-R7 rules can also decrease
$\mathsf{ent}$ (for example R1 decreases $\mathsf{ent}$ by $\mathsf{kc}(M)$ in one
step). The minimum total reduction length equals $\mathsf{ent}(M)$ in the examples
computed, but a clean proof of this lower bound requires tracking whether non-R7
$\mathsf{ent}$-decrease always corresponds to future R7-obligations. This is recorded
as an open refinement of the strong normalization analysis (§strong-normalization).
