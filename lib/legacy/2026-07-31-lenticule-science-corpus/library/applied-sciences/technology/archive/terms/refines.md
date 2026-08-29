---
id: refines
description: "Refinement is a preorder relation ⊑ on specifications (programs, types, processes) where S₁ ⊑ S₂ — S₂ refines S₁ — means every behavior permitted by S₂ is also permitted by S₁, and every obligation imposed by S₁ is inherited by S₂. The defining structure: refinement is the direction of increasing specificity — a refinement adds information, constraints, or detail without losing any behavior that was required or any freedom that was guaranteed. Refinement is a preorder: reflexive (every spec refines itself) and transitive (if S₂ refines S₁ and S₃ refines S₂ then S₃ refines S₁). The lattice structure has demonic nondeterminism as meet and angelic nondeterminism as join."
defines: Refines
related: Extends, Satisfies, Procedure, Process, ProgramCorrectness, WeakestPrecondition
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  abstract-specification: relational-universe
  concrete-specification: relational-universe
output: relational-universe-morphism
ast:
  obligation-preservation-preorder:
    - abstract-specification
    - concrete-specification:
        - obligation-preservation:
            - abstract-specification
        - behavior-containment:
            - abstract-specification
---

# Refines

## Formal definition

**Refinement** is a binary relation $\sqsubseteq$ on a class of specifications $\mathcal{S}$:

$$S_1 \sqsubseteq S_2 \quad \text{(read: }S_2\text{ refines }S_1\text{)}$$

The refinement relation $\sqsubseteq$ is characterized by two conditions:

1. **Behavior containment** (soundness): every behavior permitted by $S_2$ is a behavior permitted by $S_1$. A refinement makes a choice among the behaviors allowed by the abstract specification — it does not introduce new behaviors that $S_1$ did not sanction. In terms of sets of behaviors: $\llbracket S_2 \rrbracket \subseteq \llbracket S_1 \rrbracket$.

2. **Obligation inheritance** (completeness): every obligation imposed by $S_1$ is inherited by $S_2$. A refinement cannot drop requirements — it may only add them. If $S_1$ requires $P$ to be established, $S_2$ must establish $P$ as well.

Together these conditions define refinement as **specialization**: $S_2$ is a more specific version of $S_1$ — it does everything $S_1$ does (obligation inheritance) and nothing $S_1$ would prohibit (behavior containment).

**The refinement preorder**: $\sqsubseteq$ is a **preorder** on $\mathcal{S}$:
- **Reflexivity**: $S \sqsubseteq S$ (every specification refines itself; the identity refinement adds nothing)
- **Transitivity**: $S_1 \sqsubseteq S_2$ and $S_2 \sqsubseteq S_3$ implies $S_1 \sqsubseteq S_3$ (refinement composition is valid)

$\sqsubseteq$ is not in general antisymmetric — two distinct specifications may mutually refine each other while being different representations (e.g., two equivalent programs that are not syntactically identical). The **refinement equivalence** $S_1 \equiv S_2$ iff $S_1 \sqsubseteq S_2$ and $S_2 \sqsubseteq S_1$ is the equivalence relation induced by the preorder.

## Dijkstra and weakest preconditions

Edsger Dijkstra (*A Discipline of Programming*, 1976) introduced the **weakest precondition** transformer $\mathrm{wp}(S, Q)$ — the weakest predicate on the initial state that guarantees postcondition $Q$ after executing $S$. The weakest precondition transformer gives a complete and compositional characterization of program meaning.

**The weakest precondition refinement order**: $S_1 \sqsubseteq S_2$ iff for every postcondition $Q$:

$$\mathrm{wp}(S_1, Q) \Rightarrow \mathrm{wp}(S_2, Q)$$

$S_2$ is a refinement of $S_1$ iff $S_2$ succeeds from at least as many starting states as $S_1$, for every postcondition. Equivalently: the set of states from which $S_2$ guarantees $Q$ (its weakest-precondition set) is at least as large as $S_1$'s corresponding set. A refinement is more defined: it handles all input states that the abstract specification handles and possibly more, guaranteeing the same or stronger outcomes.

The direction: $\mathrm{wp}(S_1, Q) \Rightarrow \mathrm{wp}(S_2, Q)$ means $S_2$'s weakest-precondition set $\supseteq S_1$'s — $S_2$ establishes $Q$ in at least as many situations. The abstract specification $S_1$ may succeed only from restricted states; the concrete refinement $S_2$ extends this to all of $S_1$'s states and potentially more. The formula is not $\mathrm{wp}(S_2, Q) \Rightarrow \mathrm{wp}(S_1, Q)$: that would require $S_2$ to succeed from strictly fewer states than $S_1$, which is the opposite of refinement.

**Monotonicity of composition**: if $S_1 \sqsubseteq S_1'$ and $S_2 \sqsubseteq S_2'$, then $(S_1; S_2) \sqsubseteq (S_1'; S_2')$ — sequential composition is monotone in refinement. This makes refinement-based development compositional: a system can be refined component by component, and the whole system's refinement follows from the components'.

**The refinement lattice**: under Dijkstra's weakest precondition model:
- **Top element** ($\top$, the "magic" specification): satisfied by everything — $\mathrm{wp}(\top, Q) = \mathrm{true}$ for all $Q$. The magic specification is never implementable; it forms the top of the refinement order.
- **Bottom element** ($\bot$, **abort**): satisfies no postcondition — $\mathrm{wp}(\bot, Q) = \mathrm{false}$ for all $Q$. Abort never terminates (or always fails); it refines everything.
- **Demonic nondeterminism** (meet, $\sqcap$): $\mathrm{wp}(S_1 \sqcap S_2, Q) = \mathrm{wp}(S_1, Q) \wedge \mathrm{wp}(S_2, Q)$. The nondeterministic choice that is worst for the programmer: the implementation may choose either branch, and the programmer must ensure $Q$ regardless.
- **Angelic nondeterminism** (join, $\sqcup$): $\mathrm{wp}(S_1 \sqcup S_2, Q) = \mathrm{wp}(S_1, Q) \vee \mathrm{wp}(S_2, Q)$. The nondeterministic choice that is best for the programmer: there exists a branch satisfying $Q$.

## Back and von Wright: the refinement calculus

Ralph-Johan Back and Joakim von Wright (*Refinement Calculus: A Systematic Introduction*, 1998) developed the **refinement calculus** — a complete formal system for systematically deriving correct programs from abstract specifications by a sequence of refinement steps.

A **specification statement** $[pre, post]$ specifies a program component by its precondition $pre$ and postcondition $post$: the component is correct iff, when started in a state satisfying $pre$, it terminates in a state satisfying $post$.

The **basic refinement law**: $[pre_1, post_1] \sqsubseteq [pre_2, post_2]$ iff:
$$pre_2 \Rightarrow pre_1 \quad\text{and}\quad (pre_2 \wedge post_2) \Rightarrow post_1$$

(Weaken the precondition — the refinement applies to more starting states; strengthen the postcondition — the refinement guarantees more about the final state.)

Back and von Wright prove an extensive library of **refinement laws** — lemmas establishing when one program construct refines another. Key laws:
- **Strengthen postcondition**: $[pre, post_1] \sqsubseteq [pre, post_2]$ when $post_2 \Rightarrow post_1$ (stronger guarantee)
- **Weaken precondition**: $[pre_1, post] \sqsubseteq [pre_2, post]$ when $pre_2 \Rightarrow pre_1$ (more starting states covered)
- **Sequential composition**: $[pre, mid]; [mid, post] \sqsubseteq [pre, post]$ (introduce a midcondition)
- **Conditional introduction**: $[pre, post] \sqsubseteq (\mathbf{if}\; g\; \mathbf{then}\; [pre \wedge g, post]\; \mathbf{else}\; [pre \wedge \neg g, post]\; \mathbf{fi})$ (introduce guard)

A complete derivation in the refinement calculus is a proof that a concrete program refines its abstract specification: a chain $\mathrm{spec} \sqsupseteq S_1 \sqsupseteq S_2 \sqsupseteq \cdots \sqsupseteq \mathrm{program}$.

## Abadi and Lamport: specification refinement

Martín Abadi and Leslie Lamport (*The Existence of Refinement Mappings*, 1991) gave a model-theoretic account of specification refinement for concurrent systems:

A **specification** is a set of behaviors (infinite sequences of states). $S_2$ refines $S_1$ iff $\llbracket S_2 \rrbracket \subseteq \llbracket S_1 \rrbracket$ — every behavior of $S_2$ is a behavior of $S_1$.

**Refinement mapping**: a function $f$ from states of the concrete system to states of the abstract system is a refinement mapping iff it preserves all behaviors — for every concrete behavior $\sigma$, $f(\sigma)$ (the behavior obtained by applying $f$ to each state) is a behavior of the abstract system.

Abadi and Lamport prove: $S_2$ refines $S_1$ iff there exists a refinement mapping from $S_2$ to $S_1$ (possibly with **auxiliary variables** — additional state tracking what the concrete system has "committed to" in terms of the abstract spec). The auxiliary-variable requirement is the key technical contribution: pure refinement mappings are not always sufficient for capturing all valid refinements; auxiliary variables track intermediate commitments.

**TLA+ refinement**: in TLA+ (Temporal Logic of Actions), a specification $S_2$ refines $S_1$ iff $\vdash S_2 \Rightarrow S_1$ — the spec $S_2$ implies spec $S_1$ as a temporal formula. This is the strongest characterization: specification-level implication is refinement.

## Hoare, He, and Sanders: data refinement

C.A.R. Hoare, He Jifeng, and J.W. Sanders (*Data Refinement Refined*, ESOP 1986) generalized the Back-von Wright account to handle **data refinement** — refinement between implementations that use different state representations:

In standard refinement, the abstract specification $S_1$ and the concrete implementation $S_2$ operate on the same state space. Data refinement relaxes this: the concrete implementation may use an entirely different **concrete state space** $C$ while the abstract specification uses an **abstract state space** $A$.

A **retrieve relation** $\rho \subseteq C \times A$ (also called an **abstraction relation** or **coupling invariant**) maps concrete states to the abstract states they represent:
$$\rho(c, a) \quad\text{(read: concrete state }c\text{ represents abstract state }a\text{)}$$

**Downward simulation** (the sufficient condition for data refinement): $S_C$ data-refines $S_A$ via $\rho$ iff:
1. **Initialization**: every initial concrete state $c_0$ is related by $\rho$ to some initial abstract state $a_0$: if $c_0$ satisfies $\mathrm{init}_C$, there exists $a_0$ satisfying $\mathrm{init}_A$ with $\rho(c_0, a_0)$.
2. **Correctness step**: for every concrete step from $c$ to $c'$ under $S_C$, and every abstract state $a$ with $\rho(c, a)$, there exists an abstract state $a'$ with $\rho(c', a')$ such that $S_A$ takes $a$ to $a'$. In terms of weakest preconditions: $\rho(c, a) \wedge \mathrm{wp}(S_C, \rho(c', a'))(c) \Rightarrow \mathrm{wp}(S_A, \top)(a)$ — the concrete operation's termination condition (via $\rho$) implies the abstract operation terminates.

**Upward simulation** (via $\rho^{-1}$): the same conditions applied with the retrieve relation reversed. Hoare, He, and Sanders prove that downward and upward simulation together are necessary and sufficient for data refinement.

When $\rho$ is a **function** $r : C \to A$ (a surjection), the retrieve relation becomes the **abstraction function** of abstract data types (Hoare 1972, *Proof of Correctness of Data Representations*, Acta Informatica). The data refinement condition then reduces to: the concrete operation commutes with $r$ — applying $r$ before or after the concrete operation gives the same abstract result. This is the precise categorical statement: $r \circ S_C = S_A \circ r$ (natural transformation condition on the state-transformer functors).

Data refinement is the bridge between `refines` and `extends`: when the concrete state space $C$ properly extends the abstract state space $A$ (via an inclusion $\iota : A \hookrightarrow C$), the retrieve relation $\rho = \iota^{-1}$ recovers standard refinement. Data refinement generalizes this to arbitrary re-representations — the concrete state can be a more efficient encoding, a lower-level structure, or a completely different representation that happens to implement the same observable behavior.

## Open questions

- Whether the refinement preorder $\sqsubseteq$ is always a partial order (antisymmetric up to observational equivalence) for the behavior-containment formulation, or whether there are specifications $S_1 \neq S_2$ with $S_1 \sqsubseteq S_2$ and $S_2 \sqsubseteq S_1$ that are genuinely observationally distinct.
- Whether the refinement calculus of Back and von Wright can be embedded into the topos $\mathbf{Sh}(T, J)$ — whether specification statements $[pre, post]$ are morphisms in the topos, whether refinement is the factorization order on those morphisms, and whether the refinement laws correspond to natural transformations.
- Whether data refinement (Hoare, He, and Sanders 1986) — where the concrete state space differs from the abstract — corresponds to refinement in the coalgebraic setting: a simulation relation between coalgebras over different state spaces, which is what the coalgebraic account of bisimulation already provides.
- Whether the Abadi-Lamport auxiliary variable construction has a canonical categorical form — whether auxiliary variables correspond to enriching the diagram category with extra colimits that track commitments, and whether the refinement mapping theorem is a universal property in this enriched category.
