---

name: fiber
description: "Object: the proposition fiber — for each history t, the finite Heyting algebra H_t carrying all propositions available at that stage of relational history."
---

### Definition — The Proposition Fiber {#fiber}

For each history $t \in \mathrm{Ob}(T)$ there is a finite Heyting algebra
$$
H_t,
$$
called the **proposition fiber at $t$**. It is the algebra of propositions available at stage $t$ of relational history.

$H_t$ carries:

- a partial order $\leq_t$;
- binary meet $\wedge_t$ and join $\vee_t$ (all finite meets and joins exist);
- least element $\bot_t$ and greatest element $\top_t$;
- Heyting implication $\Rightarrow_t$, satisfying $c \leq_t (a \Rightarrow_t b)$ iff $(c \wedge_t a) \leq_t b$.

The fiber is **finite** — this is part of the fiber doctrine (§fiber-doctrine), not derived from the history structure. Finiteness ensures that all infima in the construction of the nuclei exist and that the fiber Heyting algebra is complete.

#### What the Fiber Is Not {#fiber-not}

The fiber $H_t$ is not a set of sentences, not a probability distribution, and not a vector space. It is a bounded distributive lattice with implication — the minimal structure needed for propositions to support negation, conjunction, disjunction, and conditional reasoning in a relational setting.

The partial order $\leq_t$ encodes **entailment** at history $t$: $a \leq_t b$ means that at this stage of history, $a$ entails $b$. It is not a temporal order — that is the prefix order on histories, which lives one level up.

#### Fibers Do Not Stand Alone {#fiber-relation}

The fiber $H_t$ is not an isolated object. The history category $T$ connects fibers via restriction maps: for each morphism $t \to t'$ in $T$ (i.e., each prefix extension), there is a Heyting algebra homomorphism $H_{t'} \to H_t$. This is the presheaf structure; see §reindexing. The fiber alone gives the local propositional structure; the restriction maps give it relational coherence across the whole of $T$.
