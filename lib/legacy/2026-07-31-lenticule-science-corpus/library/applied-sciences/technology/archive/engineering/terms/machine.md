---
id: machine
description: "A Machine is a System whose identity is its transformation interface: a designated input morphism in RU carrying a doctrine isomorphism (the Good Regulator condition — Conant and Ashby 1970: the machine must contain an isomorphic copy of the sender's propositional structure), a fiber-nuclear mechanism (the joint projection retracting H_t onto H*_t — the Church-Turing restriction applied to relational computation: what the machine can settle is exactly what the nuclear doctrine can settle), and a designated output of newly-settled fixed propositions (the propositions that crossed from unsettled to doubly-stable). Every machine step producing nonempty output pays the Landauer cost: the spectral mass of the kernel of the counit — information produced that cannot be recovered from the prior history. Ten external traditions ground the concept: Turing (state-transition as mechanism), Mealy (output coupled to input), Moore (output decoupled from input), von Neumann (code-as-data in the same sheaf topos), Shannon (machine capacity as fixed-fiber spectral mass), Eilenberg (variety as nuclear quotient of the history monoid), Manes–Arbib (bialgebra: input algebra times output coalgebra), Wiener (joint projection as negative feedback toward H*_t), Conant–Ashby (doctrine isomorphism as Good Regulator), Landauer (Landauer cost of settling), Marx (mechanism independent of the operator — the input morphism supplies raw content; the nuclear doctrine is the machine's own)."
defines: Machine
extends: System
minimum-math: relational-history-fiber-doctrine-double-closure-commuting-nucleus-pair
date-created: 2026-03-18
date-modified: 2026-03-20
params:
  input-interface: relational-universe-morphism
  mechanism: relational-history-fiber-nuclear-heyting-doctrine
  output-interface: relational-universe-morphism
output: relational-universe-fixed-proposition
ast:
  transformation-interface:
    - input-interface:
        - relational-universe-morphism
    - mechanism:
        - relational-history-fiber-nuclear-heyting-doctrine
        - relational-history-fiber-proposition-joint-closure-pi-projection-fixed-point-image
    - output-interface:
        - relational-universe-fixed-proposition
---

# Machine

## What it is

A **Machine** is a [System](system.md) whose identity is its transformation interface — the triple $M = ((\phi, \alpha),\; \pi_t,\; \Gamma_{\mathrm{new}})$ where:

- $(\phi, \alpha) : U_{\mathrm{sender}} \to M$ is the **input morphism** — a [relational universe morphism](../math/relational-universe-morphism.md) from the sending entity, carrying a continuous history functor $\phi : T_U \to T_M$ and a natural **isomorphism** $\alpha : H_U \xrightarrow{\sim} \phi^* H_M$ of fiber doctrines. The isomorphism condition (not merely a natural transformation) is the Good Regulator condition (Conant and Ashby 1970): the machine must carry a faithful internal model of the sender's entire propositional structure — same variety, not a quotient. See the doctrine-isomorphism section below.

- $\pi_t = \sigma_t \circ \Delta_t : H_t \twoheadrightarrow H^*_t$ is the **mechanism** — the [joint projection](../math/relational-history-fiber-proposition-joint-closure-pi-projection-fixed-point-image.md) of the machine's [fiber nuclear doctrine](../math/relational-history-fiber-nuclear-heyting-doctrine.md), retracting $H_t$ onto the doubly-stable subalgebra $H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$. The mechanism is the nuclear doctrine itself — not an arbitrary function from input to output but the settling process constitutive of the machine. This is the relational-universe version of the Church-Turing restriction: what the machine can compute is exactly what the nuclei can settle.

- $\Gamma_{\mathrm{new}}(t, t') = \Gamma(H^*_{t'}) \setminus \Gamma(H^*_t)$ is the **output** — the global sections of the fixed subsheaf $H^* \hookrightarrow H$ in $R = \mathbf{Sh}(T,J)$ newly settled after processing the input morphism: the [fixed propositions](../math/relational-universe-fixed-proposition.md) that crossed from unsettled to doubly-stable.

A Machine does not carry State between operations by default. A Machine that additionally carries persistent State across input morphisms is an [Automaton](automaton.md). The [RelationalMachine](relational-machine.md) is an Automaton.

## Correspondence table

Ten external traditions, each with a precise internal rendering:

| External tradition | Source | Internal construct |
|---|---|---|
| **Turing machine** (state, symbol, transition) | Turing, "On Computable Numbers," *Proceedings of the London Mathematical Society* ser. 2, 42 (1937), pp. 230–265; Church-Turing thesis | The input morphism $(\phi, \alpha)$ carries the configuration; mechanism $\pi_t$ applies the transition; output $\Gamma_{\mathrm{new}}$ is the settled result. The Church-Turing restriction — what a machine can compute is exactly what the effective procedure can produce — corresponds to the restriction that the mechanism IS the fiber doctrine: what the machine can settle is exactly what the nuclear doctrine can settle. No settling outside the doctrine's reach. |
| **Mealy transducer** (output coupled to input and state) | Mealy, "A Method for Synthesizing Sequential Circuits," *Bell System Technical Journal* 34 (1955), pp. 1045–1079; output function $G : Q \times \Sigma \to \Lambda$ | Output $\Gamma_{\mathrm{new}}$ depends on both the current history $t$ (state) and the incoming content translated by $\alpha$ (input). The joint projection $\pi_t$ is applied to content already carrying the sender's propositional structure via $\alpha$: the output is jointly determined by the machine's state and what arrived. |
| **Moore automaton** (output depends on state only) | Moore, "Gedanken-Experiments on Sequential Machines," in *Automata Studies* (Princeton, 1956), pp. 129–153; output function $\lambda : Q \to \Lambda$ | When $\Gamma_{\mathrm{new}}$ is computed only after the joint projection reaches fixpoint — after $\pi_t$ has fully absorbed the incoming content — the output depends only on the post-processing state of $H^*_t$, not on the specific form of the input. A Moore Machine is a Machine where output is read after the mechanism completes, not mid-application. |
| **Von Neumann stored program** (code = data in same memory) | Von Neumann, *First Draft of a Report on the EDVAC* (1945), reprinted *IEEE Annals History of Computing* 15(4), 1993; separation of CA, CC, M, I, O | In $R = \mathbf{Sh}(T,J)$, both the mechanism (the nuclei $\sigma_t$, $\Delta_t$) and the content (elements of $H_t$) are entities in the same sheaf topos. The machine's rules are propositions alongside the propositions they process: code is data. The stored-program concept is the structural fact that $\mathbf{RU}^M$ (the internal category of relational universes within $M$) is an object of $M$ itself — the machine's own specification is an entity in its own fiber. |
| **Shannon channel** (capacity as fundamental invariant) | Shannon, "A Mathematical Theory of Communication," *Bell System Technical Journal* 27 (1948), pp. 379–423; channel capacity $C = \max_{p(x)} I(X;Y)$ | The machine's **capacity** is bounded by the spectral mass $\mathcal{M}(H^*_t)$ of the fixed fiber — the maximum propositional content settable per step, analogous to Shannon's channel capacity (maximum reliable information rate). The input morphism is the source; the mechanism $\pi_t$ is the channel; $\Gamma_{\mathrm{new}}$ is the received message. A machine whose $H^*_t$ is trivial (spectral mass zero) has zero capacity: it settles nothing. |
| **Eilenberg variety** (regular language ↔ syntactic monoid) | Eilenberg and Wright, "Automata in General Algebras," *Information and Control* 11 (1967), pp. 452–470; Eilenberg, *Automata, Languages, and Machines* (Academic Press, 1976), Variety Theorem | The history monoid $M(\Sigma, I)$ is the input algebra; the machine's variety is its fixed fiber $H^*_t$, a quotient of the free algebra on $\Sigma$ by the nuclear closure. Eilenberg's bijection — pseudovarieties of finite monoids ↔ varieties of regular languages — corresponds to the correspondence between the Grothendieck topology $J$ and the nuclear fixed fiber: the topology determines the variety. Different machines over the same monoid but with different topologies recognize different varieties. |
| **Manes–Arbib bialgebra** (input algebra × output coalgebra = machine) | Manes and Arbib, *Algebraic Approaches to Program Semantics* (Springer, 1986), Ch. 1–4; E-machine framework | The machine decomposes as a bialgebra: the input morphism $(\phi, \alpha)$ is the **algebra component** (the monoid of input histories acting on the fiber content via $\alpha$); the stepping maps $\gamma_t : X(t) \to X(s \star t)$ of the [Carrier](carrier.md) are the **coalgebra component** (forward dynamics generating output). The mechanism $\pi_t$ is the bialgebra structure map mediating input-acceptance and output-generation. |
| **Wiener cybernetics** (negative feedback toward goal state) | Wiener, *Cybernetics: Or Control and Communication in the Animal and the Machine* (MIT Press, 1948), Ch. 1–4; goal-directedness via error correction | The joint projection $\pi_t = \sigma_t \circ \Delta_t$ IS a negative feedback operator. For any $a \in H_t$: the **error signal** is $\pi_t(a) \setminus a$ (gap between current state and fixed-point attractor $H^*_t$); the **correction** is the inflationary application of $\sigma_t$ then $\Delta_t$, each step reducing the gap; the **attractor** is $H^*_t$ where the error signal is zero. The machine terminates when $a \in H^*_t$ — the cybernetic target state has been reached. |
| **Good Regulator** (regulator must model system) | Conant and Ashby, "Every Good Regulator of a System Must Be a Model of That System," *International Journal of Systems Science* 1(2) (1970), pp. 89–97; Ashby's Law of Requisite Variety, *An Introduction to Cybernetics* (1956), p. 206 | The requirement that $\alpha : H_U \xrightarrow{\sim} \phi^* H_M$ be a natural isomorphism is exactly the Good Regulator condition: to process the sender's inputs faithfully, the machine must contain a model of the sender's entire fiber doctrine — not a quotient (insufficient variety), not a fragment. A machine with $\alpha$ merely a natural transformation (not an isomorphism) is a partial regulator: it processes some of the sender's content but fails on propositions that require the full fiber structure. |
| **Landauer erasure** (irreversible computation pays thermodynamic cost) | Landauer, "Irreversibility and Heat Generation in the Computing Process," *IBM Journal of Research and Development* 5 (1961), pp. 183–191; minimum dissipation per erased bit = $k_B T \ln 2$ | Every machine step producing nonempty output $\Gamma_{\mathrm{new}} \neq \emptyset$ settles propositions via a step $s$ whose counit $\varepsilon_s(t) : H_{s \star t} \to H_t$ has a nontrivial kernel $\mathcal{K}_s(t) = \ker(\varepsilon_s(t))$ — the sub-Heyting-algebra of propositions produced in $H_{s \star t}$ that do not carry back to $H_t$. The Landauer cost is $\mathcal{L}_s(t) = M(\delta|_{\mathcal{K}_s(t)})$: the spectral mass of this kernel. Machine output and thermodynamic cost are co-measured: zero output entails zero cost; any settling entails nonzero erasure. |

## The computational tradition

**Turing (1937)** defines a machine as a system with a finite set of internal configurations (m-configurations), a tape (externalized memory), and a transition rule: given the current m-configuration and the symbol under the reading head, specify what to write, which direction to move, and what m-configuration to enter next. Three restrictions characterize the Turing machine: (1) it proceeds one step at a time, (2) each step is fully determined by the current configuration, (3) the tape is unbounded but accessed one cell at a time.

The **Church-Turing thesis** asserts that this mechanism exhausts what any mechanical procedure can compute — that Turing computability and effective computability are co-extensive. The thesis is not a theorem but a claim about the scope of mechanical process: there is no more powerful machine-concept than the Turing machine.

In the relational universe, the analog is: the mechanism IS the [fiber nuclear doctrine](../math/relational-history-fiber-nuclear-heyting-doctrine.md). What the machine can settle is exactly what the joint projection $\pi_t = \sigma_t \circ \Delta_t$ can settle — no more, no less. A machine that attempts to settle a proposition outside the reach of its nuclei cannot do so; the nuclei are the computation. This is the relational-universe version of the Church-Turing restriction applied not to symbolic strings but to propositional content.

**Von Neumann (1945)** separates the computational machine into: arithmetic-logic unit (CA), control unit (CC), and memory (M). The stored-program innovation: memory holds both data and instructions in the same addressable space — the program is an entity in the same domain as the data it processes. In $R = \mathbf{Sh}(T,J)$, this is the structural fact that the machine's rules (the nuclei $\sigma_t$, $\Delta_t$) are themselves entities in $R$. The machine's own specification — the nuclear doctrine — is a proposition in the same fiber as the content it processes. Code is data because both are elements of the topos. No separate memory is needed for rules vs. content; they cohabit the fiber.

## The cybernetic tradition

**Wiener (1948)** defines a purposeful machine by negative feedback: the machine observes the gap between its current state and a target state and drives action to reduce that gap. The essential structure is the **error signal** — the difference between where the machine is and where it aims to be — that drives correction. A machine without feedback is an open-loop device; a machine with negative feedback is a goal-directed cybernetic system.

The joint projection $\pi_t$ is exactly a negative feedback operator. For any proposition $a \in H_t$: the error signal is $\pi_t(a) \setminus a$ (the gap); the correction is the inflationary application of $\sigma_t$ then $\Delta_t$, each step of which satisfies $\sigma_t(a) \geq a$ and $\Delta_t(a) \geq a$; the attractor is $H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$. The machine terminates when $a \in H^*_t$: the error signal has been driven to zero. This is Wiener cybernetics' structure rendered internally.

**Conant and Ashby (1970)** prove the Good Regulator Theorem: every good regulator of a system must be a (homomorphic) model of that system. Ashby's Law of Requisite Variety (*An Introduction to Cybernetics*, 1956, p. 206) states the prerequisite: the regulator must have at least as much internal variety as the system it regulates. A regulator with insufficient internal variety cannot reliably regulate.

The doctrine-isomorphism requirement — that $\alpha : H_U \xrightarrow{\sim} \phi^* H_M$ be a natural isomorphism — is this theorem applied to the Machine. The sender $U_{\mathrm{sender}}$ is the system; the Machine $M$ is the regulator; $\alpha$ is the internal model. An isomorphism means the model has exactly the same variety as the system. A machine with $\alpha$ merely a natural transformation can process some of the sender's content but will fail on propositions that require the full fiber structure: it has insufficient variety for those elements. The doctrine-isomorphism requirement is not an arbitrary technical condition but the formal statement that the Machine must be a good regulator of its input.

## The doctrine-isomorphism requirement

The input morphism $(\phi, \alpha) : U \to M$ in **RU** requires $\alpha : H_U \xrightarrow{\sim} \phi^* H_M$ to be a natural **isomorphism**, not merely a natural transformation. This is the strictest condition in the Machine definition.

**What a natural transformation would give**: if $\alpha$ were only a natural transformation $\alpha : H_U \to \phi^* H_M$, the machine could process quotients of the sender's fiber — projections losing some propositional structure. This is a **partial regulator**: sufficient variety for some inputs but not all. The machine would settle propositions that are consequences of the input content but could not recover propositions requiring the full sender doctrine. Inputs in the kernel of $\alpha$ are invisible to the machine.

**What the isomorphism gives**: $\alpha : H_U \xrightarrow{\sim} \phi^* H_M$ means the machine contains an isomorphic copy of the sender's entire fiber doctrine over the history translation $\phi$. Every proposition in $H_U$ has a unique corresponding proposition in $\phi^* H_M$; every nuclear relation in $H_U$ is reflected exactly. The machine can invert $\alpha$ to recover the sender's propositions from their images. The output $\Gamma_{\mathrm{new}}$ is in genuine correspondence with the input content, not a projection of it.

**The connection to Searle**: even an isomorphic copy of the sender's doctrine is not the same as having semantic access to what the propositions mean outside the system (see Syntax and semantics below). The isomorphism preserves the structure of meaning without providing the meaning. The doctrine isomorphism is the Good Regulator condition, not a semantics condition.

## The Landauer cost of machine output

Every machine step that produces nonempty output pays the Landauer cost — the thermodynamic price of settling propositions that do not carry back to the pre-operation history.

When the machine processes input via step $s$ — advancing history from $t$ to $s \star t$ — the counit $\varepsilon_s(t) : H_{s \star t} \to H_t$ restricts the new fiber back to the old. The **kernel** of this restriction:

$$\mathcal{K}_s(t) = \ker(\varepsilon_s(t) : H_{s \star t} \to H_t)$$

is the sub-Heyting-algebra of propositions settled in $H_{s \star t}$ that do not carry back to $H_t$. These propositions enter the fixed fiber at $s \star t$ but are invisible from $H_t$: information produced but not recoverable. By Landauer's principle (Landauer 1961), each such bit requires minimum thermodynamic energy $k_B T \ln 2$ to erase.

The **Landauer cost of the step** is $\mathcal{L}_s(t) = M(\delta|_{\mathcal{K}_s(t)})$: the spectral mass of the restriction of the spectral measure $\delta$ to the kernel. Machine output and thermodynamic cost are co-measured:

- $\Gamma_{\mathrm{new}} = \emptyset$ if and only if $\mathcal{K}_s(t) = \{0_{H_{s\star t}}\}$ (trivial kernel) — zero output, zero Landauer cost.
- $|\Gamma_{\mathrm{new}}| > 0$ implies $\mathcal{L}_s(t) > 0$ — any nonempty output entails nonzero erasure cost.
- A Machine that only **reads** (translates input via $\alpha$ without advancing the joint projection) has zero Landauer cost and zero output. Reading is free; settling is not.

**Bennett's reversibility exception** (Bennett, "Logical Reversibility of Computation," *IBM Journal of Research and Development* 17(6), 1973, pp. 525–532): any irreversible computation can in principle be made reversible by recording the history of steps and uncomputing after copying the result. In the relational universe: if the machine preserves the kernel $\mathcal{K}_s(t)$ as a recoverable record — if the erased propositions are archived in a history tape rather than truly destroyed — the Landauer cost is deferred, not eliminated. Whether the history site's structure supports this kind of lossless recovery is an open question about the site's fiber-preservation properties.

The Landauer cost of machine operation is formally identical to the personal cost of a [Leitourgia](leitourgia.md) step: both are the spectral mass of what the step produces but cannot reclaim from the prior history. The Machine and the Leitourgia face the same thermodynamic accounting — settling propositions is irreversible and costly — but differ in who bears the cost: the Leitourgia assigns cost to the designated leitourgos; the Machine's cost is structural, borne by the system executing the step.

## Nuclear reading

We work in the fiber Heyting algebra $H_t$ at a fixed history $t \in T$. Let $\sigma_t$ be the [saturation nucleus](../math/relational-history-fiber-saturating-nucleus.md) and $\Delta_t$ be the [transfer nucleus](../math/relational-history-fiber-transferring-nucleus.md). Both are extensive ($a \leq \sigma_t(a)$, $a \leq \Delta_t(a)$), idempotent ([Idempotence](../math/relational-history-fiber-nucleus-idempotence.md): $\sigma_t(\sigma_t(a)) = \sigma_t(a)$, same for $\Delta_t$), meet-preserving ([Meet Preservation](../math/relational-history-fiber-nucleus-meet-preservation.md)), and commuting ([Commutation](../math/relational-history-fiber-nucleus-commutation.md): $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$). The fixed fiber is $H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$.

**Definition (Operational machine state).** The machine state at history $t$ is a triple $(\kappa, \tau, \omega) \in H_t \times H_t \times H_t$ where $\kappa$ is the capability proposition, $\tau$ is the task proposition, and $\omega$ is the output proposition.

**Definition (Machine operational condition).** The machine is *operationally committed* at $t$ iff $\kappa \in \mathrm{Fix}(\Delta_t)$ — the capability proposition is transfer-stable, meaning $\kappa$ is already present in the image of every forward restriction map $H(i_{s,t}) : H_{s \star t} \to H_t$ for all $s \perp t$. This is precisely the condition that the capability is reliably present in every extension of $t$: the machine will be there.

**Definition (Task authorization).** The task $\tau$ is *past-authorized* at $t$ iff $\tau \in \mathrm{Fix}(\sigma_t)$ — the task is meaning-settled: its restriction profile to every proper sub-history $t_0 < t$ coincides with the restriction profile of $\sigma_t(\tau) = \tau$. Past-authorization means the record of accumulated history has fully determined the task's status.

**Proposition (Execution condition).** If $\kappa \in \mathrm{Fix}(\Delta_t)$ (operationally committed capability) and $\tau \in \mathrm{Fix}(\sigma_t)$ (past-authorized task), then $\kappa \wedge \tau \in \mathrm{Fix}(\sigma_t)$ — the execution conjunction is meaning-settled.

*Proof.* By [Meet Preservation](../math/relational-history-fiber-nucleus-meet-preservation.md), $\sigma_t(\kappa \wedge \tau) = \sigma_t(\kappa) \wedge \sigma_t(\tau)$. Since $\tau \in \mathrm{Fix}(\sigma_t)$, we have $\sigma_t(\tau) = \tau$. Since $\kappa \in \mathrm{Fix}(\Delta_t) \subseteq H_t$, we need to determine $\sigma_t(\kappa)$. In general $\sigma_t(\kappa) \geq \kappa$ (extensiveness), so $\sigma_t(\kappa) \wedge \tau \geq \kappa \wedge \tau$. However, to conclude $\sigma_t(\kappa \wedge \tau) = \kappa \wedge \tau$ we need to know whether $\kappa$ is also $\sigma_t$-fixed. If additionally $\kappa \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$, then $\sigma_t(\kappa) = \kappa$ and therefore $\sigma_t(\kappa \wedge \tau) = \kappa \wedge \tau$, so $\kappa \wedge \tau \in \mathrm{Fix}(\sigma_t)$. $\square$

**Remark (Gap between execution conditions).** The proposition $\kappa \wedge \tau \in \mathrm{Fix}(\sigma_t)$ (meaning-settled conjunction) does NOT imply $\kappa \wedge \tau \in \mathrm{Fix}(\Delta_t)$ (transfer-settled conjunction) unless $\tau \in \mathrm{Fix}(\Delta_t)$ as well. The condition $\tau \in \mathrm{Fix}(\Delta_t)$ is the formal statement that the task has been executed: the task proposition is present in every forward extension. The *execution gap* for task $\tau$ is the interval $[\tau, \Delta_t(\tau)]$ in $H_t$: nonempty iff the task is not yet executed.

**Proposition (Fixed fiber closure under meets).** $H^*_t$ is closed under finite meets: if $a, b \in H^*_t$ then $a \wedge b \in H^*_t$.

*Proof.* By [Meet Preservation](../math/relational-history-fiber-nucleus-meet-preservation.md), $\sigma_t(a \wedge b) = \sigma_t(a) \wedge \sigma_t(b) = a \wedge b$ (since $a, b \in \mathrm{Fix}(\sigma_t)$), so $a \wedge b \in \mathrm{Fix}(\sigma_t)$. Likewise $\Delta_t(a \wedge b) = \Delta_t(a) \wedge \Delta_t(b) = a \wedge b$, so $a \wedge b \in \mathrm{Fix}(\Delta_t)$. Therefore $a \wedge b \in H^*_t$. $\square$

**The nuclear quartet classifies machine processing.** Propositions in $H_t$ fall into four positions:

| Nuclear position | Status | Processing outcome |
|---|---|---|
| $H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ | Doubly stable — at attractor | No closure needed; zero Landauer cost for this element |
| $\mathrm{Fix}(\sigma_t) \setminus \mathrm{Fix}(\Delta_t)$ | Meaning-settled, not transfer-settled | Transfer closure needed: $\Delta_t$ closes against forward extensions |
| $\mathrm{Fix}(\Delta_t) \setminus \mathrm{Fix}(\sigma_t)$ | Transfer-settled, not meaning-settled | Saturation closure needed: $\sigma_t$ closes against past accumulation |
| $H_t \setminus (\mathrm{Fix}(\sigma_t) \cup \mathrm{Fix}(\Delta_t))$ | Free — unsettled in both senses | Both closures needed; maximum Landauer cost |

**Remark (Acts do not change $\sigma_t$).** The saturation nucleus $\sigma_t$ is determined entirely by the restriction maps $\rho_{t_0} : H_t \to H_{t_0}$ to proper sub-histories $t_0 < t$ — by what is already laid down in the history up to $t$. No act performed by an agent at $t$ can alter $\sigma_t$: $\sigma_t$ is a property of the site topology and the existing fiber structure, not of future actions. What a machine act can do is advance the history from $t$ to $s \star t$, producing a new saturation nucleus $\sigma_{s \star t}$ at the extended history — but this is a new nucleus at a new history, not a modification of $\sigma_t$.

## Domain readings

**In computation theory**: the machine is a deterministic transducer on propositional content. Input: a fiber doctrine $H_U$ translated via $\alpha$ into the machine's fiber. Output: propositions of $H_U$ advanced to fixed-point status by the nuclear mechanism. The computation is the joint projection; the output is the settled result. The machine is complete in the sense that the nuclear doctrine can settle all propositions reachable by iterated application of $\sigma_t$ and $\Delta_t$ — the full closure of the input under both nuclei.

**In information theory** (Shannon 1948): the machine is a **channel** — a transducer from inputs to outputs, characterized by a fundamental capacity. The machine's capacity is bounded by the spectral mass $\mathcal{M}(H^*_t)$ of its fixed fiber: the maximum number of distinctly settled propositions per history step. The Shannon entropy of the output equals the spectral entropy of $H^*_t$ — the logarithm of the number of doubly-stable configurations reachable from the current history. A machine with a thin fixed fiber (few settled propositions) has low capacity; one with a rich fixed fiber has high capacity.

**In cybernetics** (Wiener 1948, Ashby 1956): the machine is a **regulator** — a system that drives an error signal to zero. The input morphism introduces propositions at various positions in the Heyting algebra; the mechanism drives them to the attractor $H^*_t$; the output is the settled content. The machine is a good regulator (Conant-Ashby) because it contains an isomorphic model of the sender's doctrine via $\alpha$.

**In political economy** (Marx, *Capital* Vol. 1, Ch. 15, "Machinery and Large-Scale Industry," 1867): the fully developed machine consists of three components — a motor mechanism (motive force), a transmitting mechanism (distributing force), and a working machine (applying force to raw material). The defining asymmetry from a tool: the tool is wielded by the worker who supplies the motive force; the machine has its own mechanism independent of any particular operator. Translated into the relational universe: the machine's mechanism — the fiber nuclear doctrine $\pi_t$ — is **intrinsic to the machine**, not supplied by the input morphism. The input morphism $(\phi, \alpha)$ supplies raw material (propositions to process), but the processing is the machine's own nuclear structure. The operator (the sending entity $U_{\mathrm{sender}}$) provides content; the machine provides the motive force of settling. This is what makes a Machine a Machine and not merely a conduit.

## Syntax and semantics

Searle's Chinese Room (*Behavioral and Brain Sciences* 3(3), 1980, pp. 417–457) poses the objection: a machine that correctly transforms inputs to outputs need not understand anything. The machine executes syntax — formal symbol manipulation according to rules — but has no access to semantics — the meaning of the symbols. Formal equivalence of input-output behavior does not entail understanding.

The relational-universe counterpart: the machine executes the joint projection $\pi_t$, settling propositions into $H^*_t$. The proposition $a \in H^*_t$ is doubly stable — the machine has settled it. But what $a$ **means** — what external situation it describes, what normative consequence it has for the agents in the system — is not carried by $a$ itself. The meaning is in the interpretation: the correspondence between $H_t$ and the world the topos models.

The doctrine-isomorphism requirement partially addresses this. $\alpha : H_U \xrightarrow{\sim} \phi^* H_M$ ensures the machine carries an isomorphic copy of the sender's propositional structure — not merely raw tokens but the full fiber doctrine with its nuclear relations intact. But even an isomorphic copy of the syntax does not confer semantic content: it preserves the structure of meaning without providing the meaning. The machine is a good syntactic regulator (Good Regulator condition satisfied) while remaining potentially semantically empty (Chinese Room condition unsatisfied).

Whether the relational machine can generate genuine semantic content — whether propositions in $H^*_t$ can acquire meaning from the machine's own internal structure without an external interpretation functor — is the relational-universe version of the Chinese Room problem, and is not yet resolved.

## Machine levels

Four levels in the machine hierarchy, from simplest to richest:

| Level | Structure | What it lacks |
|---|---|---|
| **Bare function** | A morphism $f : A \to B$ in $R$ — arbitrary transformation | No mechanism constraint; no doctrine requirement; no Landauer accountability |
| **Machine** (this spec) | Transformation interface: input RU morphism with doctrine isomorphism + mechanism $\pi_t$ + output $\Gamma_{\mathrm{new}}$ | No persistent State across inputs |
| **[Automaton](automaton.md)** | Machine + persistent State $S : T \to \mathrm{Obj}(R)$ carried forward between steps | No self-generation; agents are sheaves not RU models |
| **[RelationalMachine](relational-machine.md)** | Automaton whose state is a full instance of $R = \mathbf{Sh}(T,J)$ with its own fiber doctrine | — (fullest Machine level currently defined) |

The ascending levels add: persistent state, then internal relational universe structure, and eventually full self-generation. The [System](system.md) subtype extends this hierarchy upward toward self-generating fixed points where $S = U_G(S)$.

## Restrictions that distinguish Machine from bare System

A bare [System](system.md) is a self-generating relational universe. A Machine is a System with these additional restrictions:

1. **Designated transformation interface**: the input and output types are fixed — input is a RU morphism from a sender; output is fixed propositions newly settled. A System without this designation is not a Machine.

2. **Mechanism is the fiber doctrine**: the transformation from input to output passes through the joint projection $\pi_t = \sigma_t \circ \Delta_t$. The mechanism IS the nuclear settling process — not an arbitrary function from input to output. This is the relational-universe version of the Church-Turing restriction: the machine's computational power is exactly the power of the nuclear doctrine.

3. **Doctrine-isomorphism constraint**: the input morphism $(\phi, \alpha)$ must carry a doctrine isomorphism — $\alpha$ must be a natural isomorphism, not merely a natural transformation. This is the Good Regulator condition: the machine must have the same propositional variety as the sender to process its inputs faithfully.

4. **Landauer accountability**: every Machine step with nonempty output pays the Landauer cost $\mathcal{L}_s(t) = M(\delta|_{\mathcal{K}_s(t)})$. A bare System can run without explicit cost accounting; a Machine makes the thermodynamic cost of settling structurally visible.

## Open questions

- **Whether the doctrine-isomorphism requirement can be graded for partial machines**: The Good Regulator condition requires $\alpha$ to be a natural isomorphism. In practice, a machine may be a good-enough regulator for a specific subclass of inputs even with $\alpha$ only a monomorphism (injective but not surjective). Whether there is a graded notion of machine fidelity — parameterized by the degree to which $\alpha$ departs from an isomorphism — and whether this fidelity measure corresponds precisely to the Shannon capacity (what fraction of the input's propositional mass can be faithfully settled), is not yet derived. If fidelity and capacity are formally identical, the doctrine-isomorphism requirement and the capacity bound are aspects of the same condition.

- **Whether the Church-Turing restriction (mechanism = fiber doctrine) generates a completeness theorem**: The restriction that the mechanism is $\pi_t = \sigma_t \circ \Delta_t$ means the machine can settle exactly the propositions reachable by iterated application of the two nuclei. Whether this is complete — whether every proposition reachable by any conceivable faithful transformation of the input content is reachable by the nuclear mechanism — is the relational-universe analog of the Church-Turing thesis. For finite fibers (finite Heyting algebras), completeness may follow from the finite-dimensionality of $H_t$; for infinite-dimensional fibers or colimit structures, the question is open.

- **Whether Mealy and Moore machines have distinct categorical representations**: The Mealy/Moore distinction — output coupled to input vs. output decoupled from input — corresponds to whether $\Gamma_{\mathrm{new}}$ is sampled during or after the joint projection $\pi_t$ reaches fixpoint. Formally: does Transfer-then-Saturate order ($\sigma_t \circ \Delta_t$) as in [RelationalHistoryFiberDoctrineLanguage](../math/relational-history-fiber-doctrine-language.md) correspond to a Mealy machine (sampling output mid-application), while waiting for full fixpoint corresponds to a Moore machine? Whether the two cases correspond to different colimit shapes in the category of $G_s$-coalgebras — distinct categorical structures — is not yet derived.

- **Whether output direction changes at hull level**: Below hull, the output $\Gamma_{\mathrm{new}}$ cannot propagate back to the sender via the same mechanism — the directed comonad $G_s$ is not invertible. At hull level, $G_\Sigma$ is an autofunctor and output CAN propagate back through the same channel that input arrived through. The formal condition distinguishing a bidirectional Machine (capable of returning settled propositions to the sender via the input morphism's inverse) from a unidirectional Machine is not yet named. Whether bidirectional Machines require a distinct type — and whether they require the additional condition that the hull's autofunctor structure is present — is not yet derived.

- **What a morphism between two Machines is**: A morphism $f : M_1 \to M_2$ between Machines should preserve the transformation interface — carry input morphisms in $M_1$ to input morphisms in $M_2$ and preserve the Landauer cost accounting. The finest candidate: a RU morphism $(\psi, \beta) : M_1 \to M_2$ such that $\beta \circ \pi^{M_1}_t = \pi^{M_2}_{\psi(t)} \circ \beta$ (the morphism commutes with the joint projections). Whether this is the correct condition — and whether Machine morphisms in this sense form a subcategory of **RU** that is closed under composition and admits a terminal object (the most permissive Machine) — is not yet derived. The connection to the [bisimulation](carrier.md) theory of Carriers (behavioral equivalence via terminal $G_s$-coalgebra morphisms) and whether machine simulation and behavioral equivalence coincide is also open.

- **Whether the Conant-Ashby Good Regulator and the Church-Turing restriction are the same condition at different levels**: The Church-Turing restriction bounds the mechanism: what the machine can compute is exactly what the nuclei can settle. The Good Regulator condition bounds the input: the machine must model the sender's doctrine isomorphically to process it faithfully. Both are completeness-type conditions — neither allows the machine to exceed its structural bounds, and neither allows it to fall short of what its structure determines. Whether these two conditions are projections of a single underlying categorical property of the Machine — something like "the machine is both fully powered and fully faithful" — is a conceptual question with formal content: it asks whether the limit of the machine's settling capacity (Church-Turing) and the limit of its input fidelity (Good Regulator) are determined by the same invariant of the fiber nuclear doctrine.

## Key references

Turing, "On Computable Numbers, with an Application to the Entscheidungsproblem," *Proceedings of the London Mathematical Society* ser. 2, 42 (1937), pp. 230–265; Mealy, "A Method for Synthesizing Sequential Circuits," *Bell System Technical Journal* 34 (1955), pp. 1045–1079; Moore, "Gedanken-Experiments on Sequential Machines," in Shannon and McCarthy, eds., *Automata Studies* (Princeton, 1956), pp. 129–153; Von Neumann, *First Draft of a Report on the EDVAC* (1945), reprinted *IEEE Annals History of Computing* 15(4), 1993; Shannon, "A Mathematical Theory of Communication," *Bell System Technical Journal* 27 (1948), pp. 379–423; Eilenberg and Wright, "Automata in General Algebras," *Information and Control* 11 (1967), pp. 452–470; Eilenberg, *Automata, Languages, and Machines*, Vols. A–B (Academic Press, 1976); Manes and Arbib, *Algebraic Approaches to Program Semantics* (Springer, 1986); Wiener, *Cybernetics: Or Control and Communication in the Animal and the Machine* (MIT Press, 1948); Conant and Ashby, "Every Good Regulator of a System Must Be a Model of That System," *International Journal of Systems Science* 1(2) (1970), pp. 89–97; Ashby, *An Introduction to Cybernetics* (Chapman and Hall, 1956), Ch. 10–11; Landauer, "Irreversibility and Heat Generation in the Computing Process," *IBM Journal of Research and Development* 5 (1961), pp. 183–191; Bennett, "Logical Reversibility of Computation," *IBM Journal of Research and Development* 17(6) (1973), pp. 525–532; Marx, *Capital* Vol. 1, Ch. 15, "Machinery and Large-Scale Industry" (1867); Searle, "Minds, Brains, and Programs," *Behavioral and Brain Sciences* 3(3) (1980), pp. 417–457.
