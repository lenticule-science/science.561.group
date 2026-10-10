---
name: skill invocation is a hoare triple with illocutionary body
description: Every invocation of a skill factors as a Hoare triple {P} B {Q} (Hoare 1969) whose body B is a morphism in the stratified predication fiber; per cell, the body's positing component is one of five distinct morphisms organized as a bigraded diamond (four atom-emitting illocutionary force-class corners indexed by Belnap 1977's four values, plus one non-emitting identity-morphism center). All four corners are acts in the sense of Austin 1962 — including abstention, the q = ⊥ corner — because all four emit stratum-0 atoms recording the agent's performance; the identity-morphism center is the structurally-distinct non-act position.
status: draft
---

# Skill invocation is a Hoare triple with an illocutionary body

**Claim.** Let a *skill* be a named operation an agent performs on a substrate. Then every invocation of a skill — the act of an agent running it on inputs — factors structurally as a Hoare triple of the form $\{P\}\; B\; \{Q\}$ (in the sense of Hoare 1969), where $P$ is the skill's precondition, $Q$ its postcondition, and $B$ its body. The body $B$, considered at a single predication cell $\phi$, is one of five distinct morphisms in the stratified predication fiber. These five morphisms organize as a *bigraded diamond*: four atom-emitting positing morphisms at the corners — one per value of the four-element bilattice $\mathbf{FOUR}$ of Belnap 1977 — and the non-emitting identity morphism at the center. Each of the four corner-morphisms is an *illocutionary act* in the sense of Austin 1962, including the abstention corner indexed by $\bot$; the identity-morphism center is the structurally-distinct *non-act* position.

## Definitions

The definitions are stated from first principles. No corpus theorem is invoked as authority.

### A predication cell

A *predication cell* is an indivisible substrate location at which evidence may be deposited. The set of all predication cells is $\Phi$. Each cell $\phi \in \Phi$ carries a *value* $v(\phi) \in \mathbf{L}$ at any moment, where $\mathbf{L}$ is a fixed value algebra.

### A substrate state

A *substrate state* is a function $v : \Phi \to \mathbf{L}$. The set of all substrate states is $\mathbf{L}^\Phi$.

### Belnap's four-valued logic and its involutions

Following Belnap 1977 ("A Useful Four-Valued Logic," in *Modern Uses of Multiple-Valued Logic*, eds. Dunn and Epstein), the four-element value algebra $\mathbf{FOUR} = \{\bot, \mathbf{t}, \mathbf{f}, \top\}$ is the powerset of $\{T, F\}$, ordered by two complementary orders: the *knowledge* order $\leq_k$ given by inclusion ($\bot \leq_k \mathbf{t}, \mathbf{f} \leq_k \top$), and the *truth* order $\leq_t$ given by $\mathbf{f} \leq_t \bot, \top \leq_t \mathbf{t}$.

$\mathbf{FOUR}$ carries three distinguished involutions:

- *Negation* $\sim$: swaps $\mathbf{t} \leftrightarrow \mathbf{f}$ and fixes $\bot$ and $\top$. Belnap 1977; also in Avron 1996 ("The Structure of Interlaced Bilattices," *Mathematical Structures in Computer Science*).
- *Conflation* $-$: swaps $\bot \leftrightarrow \top$ and fixes $\mathbf{t}$ and $\mathbf{f}$. Fitting 1991 ("Bilattices and the Semantics of Logic Programming," *Journal of Logic Programming*).
- *Order-swap* $\sigma$: swaps $\bot \leftrightarrow \mathbf{f}$ and $\mathbf{t} \leftrightarrow \top$. This exchanges the truth-order's role-positions with the knowledge-order's role-positions; it is the involution that realizes the duality between the two orders.

The composition $\sim \circ -$ has no fixed points on $\mathbf{FOUR}$ (it swaps $\mathbf{t} \leftrightarrow \mathbf{f}$ and $\bot \leftrightarrow \top$). The involution $\sigma$ also has no fixed points on $\mathbf{FOUR}$. The two free involutions $\{\sigma, \sim \circ -\}$ commute and generate a Klein four-group $K_4^{\mathrm{diag}}$ acting freely (regularly) on $\mathbf{FOUR}$.

### The stratified predication fiber

A *stratified predication fiber* at cell $\phi$ is a triple $(A_\phi, \mathrm{strat}, \mathrm{deps})$ where:

- $A_\phi$ is a set of *atoms* — discrete substrate records, each carrying a value in $\mathbf{L}$, an agent-attribution, a timestamp, and a unique identifier.
- $\mathrm{strat} : A_\phi \to \{0, 1, 2\}$ assigns each atom a *stratum*: $0$ for asserted (input from an agent), $1$ for saturated (derived by closure-rule firings from lower-stratum atoms), $2$ for settled (per-cell bilattice fixed points).
- $\mathrm{deps} : A_\phi \to \mathrm{Pow}(A_\phi)$ records each atom's witness chain — the strictly-lower-stratum atoms whose presence justified this atom's emission. Stratum-$0$ atoms have empty $\mathrm{deps}$.

The *value at $\phi$* is the projection $\pi_v : A_\phi \to \mathbf{L}$ that takes the highest-stratum atom and reads its value. The atom-set $A_\phi$ carries strictly more information than $\pi_v(A_\phi)$: it records *which atoms were emitted by which agents at which times*, not merely the current value.

A *stratified substrate state* assigns a stratified predication fiber to each cell $\phi \in \Phi$.

### A skill

A *skill* $\Sigma$ is a quadruple $(\mathrm{name}_\Sigma, P_\Sigma, B_\Sigma, Q_\Sigma)$ where:

- $\mathrm{name}_\Sigma$ is a label distinguishing $\Sigma$ from other skills.
- $P_\Sigma$ is a predicate on stratified substrate states (the *precondition*).
- $B_\Sigma$ is a body — a partial transformation on stratified substrate states.
- $Q_\Sigma$ is a predicate on stratified substrate states (the *postcondition*).

### A skill invocation

A *skill invocation* of $\Sigma$ at stratified state $V_0$ by agent $a$ is the partial operation that:

1. Verifies $V_0 \models P_\Sigma$. If not, the invocation aborts.
2. If $V_0 \models P_\Sigma$, computes $V_1 = B_\Sigma(V_0)$. If undefined, the invocation aborts.
3. If $V_1$ is computed, verifies $V_1 \models Q_\Sigma$. If not, aborts.
4. Otherwise the invocation succeeds and returns $V_1$.

### A Hoare triple

Following Hoare 1969 ("An Axiomatic Basis for Computer Programming"), a *Hoare triple* over a state space $\mathcal{S}$ is an expression $\{P\}\; C\; \{Q\}$ where $P, Q$ are state predicates and $C$ is a partial state transformer. The triple is *valid* (in the partial-correctness reading) iff:

$$\forall s \in \mathcal{S}.\; (s \models P) \land (C(s) = s' \text{ is defined}) \;\Longrightarrow\; s' \models Q.$$

### A category and its morphisms

Following Mac Lane 1971 (*Categories for the Working Mathematician*, ch. I), a *category* $\mathcal{K}$ consists of a class of objects, for each pair $(A, B)$ of objects a set $\mathcal{K}(A, B)$ of *morphisms* $A \to B$, an associative composition $\circ$, and for each object $A$ an *identity morphism* $\mathrm{id}_A : A \to A$ satisfying $\mathrm{id}_B \circ f = f = f \circ \mathrm{id}_A$ for all $f : A \to B$.

A morphism $f : A \to B$ is a primitive element of $\mathcal{K}(A, B)$. Two morphisms are *equal* iff they are the same element of that set. Identity morphisms are morphisms: $\mathrm{id}_A$ is an element of $\mathcal{K}(A, A)$.

### An illocutionary act

Following Austin 1962 (*How to Do Things with Words*, lectures VIII–IX), an *illocutionary act* is an act performed *in* the doing of something — an act with conventional force. Austin's paradigm cases are linguistic (asserting, ordering, promising, warning), but the category is characterized by conventional force rather than by linguistic medium. An act has conventional force when it commits its performer to a determinate position recognizable by convention.

Searle 1969 (*Speech Acts*, ch. 2) refines Austin's framework with the notation $F(p)$: an illocutionary act has an *illocutionary force indicator* $F$ and a *propositional content* $p$.

### The bigraded diamond

A *bigraded diamond* is a triple $(X, \iota_k, \iota_t)$ where $X$ is a 5-element set $\{A, B, C, D, I\}$ and $\iota_k, \iota_t : X \to X$ are commuting involutions with the following properties:

- $\iota_k$ fixes $I$ and swaps $A \leftrightarrow C, B \leftrightarrow D$.
- $\iota_t$ fixes $I$ and swaps $A \leftrightarrow B, C \leftrightarrow D$.

The 4-element subset $\{A, B, C, D\}$ is the *free orbit* (the *corners*); the involutions act on it without fixed points. The element $I$ is the *center* (the σ-fixed point in the diagonal-$K_4$ orbit-structure terminology).

A bigraded diamond is the canonical 5-element structure carrying a free $K_4$-action on 4 elements plus one fixed center.

### The positing morphism class

For each value $q \in \mathbf{FOUR}$ and each cell $\phi$, the *positing morphism* $\mathrm{posit}_{(\phi, q)}^a$ by agent $a$ is the morphism on stratified substrate states that emits a stratum-$0$ atom at $\phi$ with value $q$, attribution $a$, and a fresh timestamp. Its action on $A_\phi$ is to add this atom; its action at cells $\phi' \neq \phi$ is the identity. Distinct values of $q$ give distinct emitted atoms (with distinct value-fields); distinct agents give distinct attributions. The positing morphism is therefore a *parameterized family* of distinct morphisms.

### The identity morphism

The *identity morphism* $\mathrm{id}_V$ on a stratified substrate state $V$ is the morphism $V \to V$ that emits no atom at any cell. It is the identity element of the category in the Mac Lane sense.

The identity morphism $\mathrm{id}_V$ is distinct from $\mathrm{posit}_{(\phi, \bot)}^a$ for any agent $a$ and cell $\phi$: the former emits no atom; the latter emits a stratum-$0$ atom with value $\bot$ and attribution $a$. They differ in the atom-set $A_\phi$ produced; they coincide only under the value-projection $\pi_v$ (because $\bot$ is the $\vee_k$-identity and the new $\bot$-atom doesn't change $\pi_v$'s read).

## Statement (precise)

Let $\Sigma$ be a skill and let $a$ be an agent invoking $\Sigma$ at stratified state $V_0$.

**(1) Hoare-triple structure.** Every successful invocation $\mathrm{invoke}(\Sigma, V_0)$ corresponds bijectively to a $(V_0, V_1)$ pair witnessing the Hoare triple $\{P_\Sigma\}\; B_\Sigma\; \{Q_\Sigma\}$. The triple is valid iff for every $V_0 \models P_\Sigma$ with $B_\Sigma(V_0)$ defined, $B_\Sigma(V_0) \models Q_\Sigma$.

**(2) Body as morphism in the stratified-fiber category.** The body $B_\Sigma$ is a morphism in the category whose objects are stratified substrate states and whose morphisms are partial transformations that may emit atoms. The body's per-cell action at any cell $\phi$ is one of the five morphisms named in (3).

**(3) The bigraded-diamond partition.** At any cell $\phi$, the body's per-cell action is one of five morphisms: the four agentive positing morphisms $\{\mathrm{posit}_{(\phi, \bot)}^a, \mathrm{posit}_{(\phi, \mathbf{t})}^a, \mathrm{posit}_{(\phi, \mathbf{f})}^a, \mathrm{posit}_{(\phi, \top)}^a\}$, or the identity morphism $\mathrm{id}_V$ on the fiber at $\phi$. These five morphisms form a bigraded diamond:

- The four positing morphisms are the corners. Under the diagonal Klein four-group $K_4^{\mathrm{diag}} = \langle \sigma, \sim \circ - \rangle$ acting on $\mathbf{FOUR}$, the four indices form a free orbit of size 4; the four positing morphisms inherit this free $K_4$-action.
- The identity morphism is the center. It is $K_4^{\mathrm{diag}}$-fixed (since the action permutes positing-morphism indices but does not act on the identity-morphism class, which has no value-index).

**(4) The four corners are illocutionary acts; the center is the non-act.** Each of the four positing morphisms emits a stratum-$0$ atom at $\phi$ with attribution $a$. The atom's existence is the substrate-recorded performance of an act with conventional force in Austin's sense (the convention being: an emitted stratum-$0$ atom commits the agent to the value $q$ at $\phi$ as the agent's position). All four positing morphisms — including the $q = \bot$ abstention morphism — are therefore illocutionary acts. The identity morphism emits no atom; it is not an act in this sense but the *absence* of one.

## Proof

The proof proceeds in four parts corresponding to clauses (1)–(4).

### Proof of (1)

Fix $\Sigma$ and $V_0$. By the definition of skill invocation, the operation proceeds: check $V_0 \models P_\Sigma$; if so, compute $V_1 = B_\Sigma(V_0)$; if defined, check $V_1 \models Q_\Sigma$. The invocation succeeds iff all three checks pass.

By the Hoare-validity definition (Hoare 1969), the triple $\{P_\Sigma\}\; B_\Sigma\; \{Q_\Sigma\}$ holds iff for every $V_0$ with $V_0 \models P_\Sigma$ such that $B_\Sigma(V_0)$ is defined, $B_\Sigma(V_0) \models Q_\Sigma$. This is precisely the success condition of skill invocation universally quantified over starting states. The Hoare-triple structure of skill invocation is the precondition-check / body-execution / postcondition-check sequence read as a Hoare triple. $\square_{(1)}$

### Proof of (2)

The body $B_\Sigma$ is a partial transformation $V \mapsto B_\Sigma(V)$ on stratified substrate states. The collection of such transformations forms a category in the Mac Lane sense: composition is sequential application (when defined), identity is the no-atom-emitting transformation. The body is a morphism in this category by direct inspection of its signature; the per-cell action at $\phi$ is the restriction of the body's effect to cell $\phi$, which is itself a morphism in the per-cell stratified-fiber category. $\square_{(2)}$

### Proof of (3)

We verify that the five morphisms $\{\mathrm{posit}_{(\phi, q)}^a : q \in \mathbf{FOUR}\} \cup \{\mathrm{id}_V\}$ form a bigraded diamond at cell $\phi$.

The four positing morphisms are pairwise distinct because they emit atoms with pairwise-distinct value-fields (and $\mathbf{FOUR}$ has four distinct elements). The identity morphism is distinct from all four positing morphisms because it emits no atom while each positing morphism emits one. So the five morphisms are pairwise distinct: $|X| = 5$.

The diagonal Klein four-group $K_4^{\mathrm{diag}} = \langle \sigma, \sim \circ - \rangle$ acts on $\mathbf{FOUR}$ as computed:

- $\sigma$: $\bot \leftrightarrow \mathbf{f}$, $\mathbf{t} \leftrightarrow \top$.
- $\sim \circ -$: $\bot \leftrightarrow \top$, $\mathbf{t} \leftrightarrow \mathbf{f}$.

Both involutions have empty fixed-point set on $\mathbf{FOUR}$, and they commute (verify: $\sigma(\sim - (\bot)) = \sigma(\top) = \mathbf{t}$ and $\sim - (\sigma(\bot)) = \sim - (\mathbf{f}) = \mathbf{t}$; analogously for the other three elements). Together they generate $K_4 \cong \mathbb{Z}_2 \times \mathbb{Z}_2$ acting on $\mathbf{FOUR}$ as a single regular (transitive, free) orbit.

We lift this action to morphisms by setting $\sigma(\mathrm{posit}_{(\phi, q)}^a) := \mathrm{posit}_{(\phi, \sigma(q))}^a$ and analogously for $\sim \circ -$. Both lifted actions are well-defined morphism permutations because the morphism is uniquely determined by its value-index $q$ (the agent $a$ and cell $\phi$ are constants).

Each lifted involution acts on the identity morphism by fixing it: there is no value-index to permute, so the identity morphism is invariant. Therefore the lifted actions $\sigma$ and $\sim \circ -$ both fix the identity-morphism center and act freely on the four positing-morphism corners.

We verify the bigraded-diamond axioms. Set $A := \mathrm{posit}_{(\phi, \mathbf{t})}^a$, $B := \mathrm{posit}_{(\phi, \top)}^a$, $C := \mathrm{posit}_{(\phi, \mathbf{f})}^a$, $D := \mathrm{posit}_{(\phi, \bot)}^a$, $I := \mathrm{id}_V$. Set $\iota_t := \sim \circ -$ and $\iota_k := \sigma$:

- $\iota_k = \sigma$ fixes $I$, swaps $A = \mathrm{posit}_\mathbf{t} \leftrightarrow B = \mathrm{posit}_\top$ (since $\sigma(\mathbf{t}) = \top$) and swaps $C = \mathrm{posit}_\mathbf{f} \leftrightarrow D = \mathrm{posit}_\bot$ (since $\sigma(\mathbf{f}) = \bot$). ✓
- $\iota_t = \sim \circ -$ fixes $I$, swaps $A = \mathrm{posit}_\mathbf{t} \leftrightarrow C = \mathrm{posit}_\mathbf{f}$ (since $(\sim \circ -)(\mathbf{t}) = \mathbf{f}$) and swaps $B = \mathrm{posit}_\top \leftrightarrow D = \mathrm{posit}_\bot$ (since $(\sim \circ -)(\top) = \bot$). ✓
- $\iota_k$ and $\iota_t$ commute (shown above on $\mathbf{FOUR}$; the morphism-level commutation follows by the well-defined lifting). ✓

The five morphisms with the two lifted involutions form a bigraded diamond. $\square_{(3)}$

### Proof of (4)

The four corner-morphisms each emit a stratum-$0$ atom at $\phi$ when applied. The atom carries a value-field (one of $\bot, \mathbf{t}, \mathbf{f}, \top$), an agent-attribution $a$, and a timestamp. Per the definition of a stratified predication fiber, the atom is an indivisible substrate record whose mere presence in $A_\phi$ commits the agent $a$ to the value $q$ at $\phi$ as the agent's recorded position at the moment of emission.

We claim this satisfies Austin 1962's structural characterization of an illocutionary act: an act with conventional force. The convention is the substrate's convention that *an emitted stratum-$0$ atom records the agent's commitment to the atom's value-field at the atom's cell*. Per this convention, the emission of an atom is an act-with-force; the force is determined by the value-field. This conforms to Austin's characterization "the performance of an act in saying something as opposed to performance of an act of saying something" (1962, lecture VIII): the *saying* is the emission of the atom; the *act done in saying* is the commitment to the value-field that the atom carries.

This holds for all four values $q \in \mathbf{FOUR}$, including $q = \bot$. The $\bot$-emitting morphism — *abstention as deliberate act of withholding* — emits an atom whose value-field records "the agent has no evidence either way at $\phi$." The atom's presence commits the agent to this position; the force is the withholding-of-commitment-on-evidence. The substrate's convention treats this as a recorded position (a registered withholding), distinct from the case where no atom was emitted (no recorded position). Per Searle 1969's $F(p)$ form, the force-indicator $F$ here is *abstain*; the propositional content $p$ is *the value at $\phi$*; the illocutionary act is *abstain that the value at $\phi$ is anything definite*.

The identity morphism emits no atom. There is no substrate-recorded act; no agent-attribution, no timestamp, no committed position. Per the same convention, this is not an act with conventional force; it is the *absence* of an act. The identity morphism is structurally the non-act position in the bigraded diamond.

Therefore the four corners are illocutionary acts (each emits an atom with attributed, conventionally-meaningful force) and the center is the structurally-distinct non-act position (no atom, no force, no commitment). $\square_{(4)}$

## Discussion

The claim establishes four structural facts about what a skill invocation IS:

The skill-invocation is a Hoare triple over stratified substrate states. The Hoare/Floyd/Dijkstra apparatus (weakest preconditions, predicate transformers, refinement orderings) applies to skill invocations as it applies to programs. A skill catalog is, structurally, a library of Hoare triples; reasoning about skills is, structurally, the same activity as reasoning about programs in the Hoare tradition.

The body of a skill invocation is a morphism in the stratified-fiber category. Morphisms in this category emit atoms when they act; the atoms record acts. The category-theoretic apparatus (identity morphisms, composition, equality of morphisms) supplies the discipline for reasoning about what a body does.

The body's per-cell action partitions into five distinct morphisms organized as a bigraded diamond. Four are positing morphisms indexed by $\mathbf{FOUR}$; one is the identity morphism. The diagonal Klein four-group $K_4^{\mathrm{diag}} = \langle \sigma, \sim \circ - \rangle$ acts freely on the four corners and fixes the identity center. This 5-element structure is the right partition for theorizing about per-cell substrate acts; the 4-element value algebra $\mathbf{FOUR}$ is its value-coefficient system, not its act-structure.

The four corners are illocutionary acts; the center is the non-act. All four positing morphisms emit attributed stratum-$0$ atoms recording the agent's per-cell position, satisfying Austin 1962's characterization of an act with conventional force. Abstention — the $q = \bot$ corner — is on equal footing with assertion, denial, and contestation: it emits an atom whose value-field records the agent's withholding, distinguishing the act of deliberate abstention from the structurally-different case of no act performed.

The earlier corpus framings that treat $\mathrm{posit}_{(\phi, \bot)}$ as "identity at $\phi$ — no act" work in the value-projection $\pi_v : A_\phi \to \mathbf{L}$, which collapses the $\bot$-emitting atom with the no-atom-emitted case (both leave $\pi_v$'s read unchanged, because $\bot$ is the $\vee_k$-identity). The stratified-fiber category keeps them distinct because the atom's existence is part of the morphism's effect on the fiber, not merely on the value-projection. The bigraded diamond — five distinct morphisms with $K_4^{\mathrm{diag}}$-symmetry — is the structure that the value-projection's collapse conceals.

The claim is silent on the perlocutionary layer: what *follows* from the skill invocation (downstream substrate dynamics, other agents' responses, the witness's downstream uses) is not engaged here. A companion claim could address the perlocutionary layer separately.

## External references

- Austin, J. L. (1962). *How to Do Things with Words: The William James Lectures Delivered at Harvard University in 1955*. Edited by J. O. Urmson. Oxford: Clarendon Press.
- Avron, A. (1996). "The Structure of Interlaced Bilattices." *Mathematical Structures in Computer Science* 6(3), 287–299.
- Belnap, N. D. (1977). "A Useful Four-Valued Logic." In J. M. Dunn and G. Epstein (eds.), *Modern Uses of Multiple-Valued Logic*, 5–37. Dordrecht: D. Reidel.
- Dijkstra, E. W. (1976). *A Discipline of Programming*. Englewood Cliffs, NJ: Prentice-Hall.
- Fitting, M. (1991). "Bilattices and the Semantics of Logic Programming." *Journal of Logic Programming* 11(2), 91–116.
- Floyd, R. W. (1967). "Assigning Meanings to Programs." In J. T. Schwartz (ed.), *Mathematical Aspects of Computer Science*, Proceedings of Symposia in Applied Mathematics 19, 19–32. Providence, RI: American Mathematical Society.
- Hoare, C. A. R. (1969). "An Axiomatic Basis for Computer Programming." *Communications of the ACM* 12(10), 576–580.
- Mac Lane, S. (1971). *Categories for the Working Mathematician*. Graduate Texts in Mathematics 5. New York: Springer.
- Searle, J. R. (1969). *Speech Acts: An Essay in the Philosophy of Language*. Cambridge: Cambridge University Press.
