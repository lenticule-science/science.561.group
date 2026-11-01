---
title: "Quantum Contexts: What Can Be Shared, and What Cannot Be Glued?"
page-title: "Quantum Contexts, Bell Correlations and Relational Physics"
summary: "An exact probability example separates shared measurement contexts, Bell-local explanations, quantum correlations and stronger no-signalling models, with a reproducible calculation."
date-created: 2026-10-31
type: article
status: draft
visibility: public
math: true
tags: [relational-physics, quantum-mechanics, contextuality, probability, causality, obsmetrologia]
---

A measurement can agree with every other measurement it overlaps and still resist a single classical account of them all. Understanding that sentence requires more than saying that everything is related. We need to specify which measurements can be performed together, what each combination reports, and what a proposed unified account must preserve.

This article gives one small example in full. By changing a single parameter, we move from classical correlations through quantum correlations to correlations that preserve no-signalling but exceed quantum mechanics. The same calculation shows why checking which outcomes are possible is weaker than checking their probabilities.

For the existing Obsmetrologia Q1/Q4 investigations, this is an external calibration case: a precise problem against which a proposed connection between relational mathematics and quantum theory can be tested. It reproduces established quantum-foundations distinctions. It does not derive a new quantum law from the Group's foundations. The [relational physics research guide](/relational-physics/) explains the larger program, while [causal intervals and projection](/causal-intervals-and-projection/) develops a different problem of reconstructing structure from a restricted reading.

## Four contexts, two outcomes each

Imagine two experimenters, Alice and Bob. Alice chooses setting $x=0$ or $x=1$; Bob chooses $y=0$ or $y=1$. Each records one bit, $a$ or $b$. There are four jointly accessible measurement contexts: $(0,0)$, $(0,1)$, $(1,0)$ and $(1,1)$.

A probability model supplies $P(a,b\mid x,y)$ for each context. It does not initially supply a simultaneous observation of all four counterfactual outcomes $a_0,a_1,b_0,b_1$. Whether such a unified description can reproduce the observed context probabilities is the question.

For a parameter $0\le v\le1$, define

$$
P_v(a,b\mid x,y)=\frac{1+v(-1)^{a+b+xy}}{4}.
$$

The complete table is small enough to inspect:

| Settings $(x,y)$ | Outcome $00$ | Outcome $01$ | Outcome $10$ | Outcome $11$ |
|---|---:|---:|---:|---:|
| $(0,0)$ | $(1+v)/4$ | $(1-v)/4$ | $(1-v)/4$ | $(1+v)/4$ |
| $(0,1)$ | $(1+v)/4$ | $(1-v)/4$ | $(1-v)/4$ | $(1+v)/4$ |
| $(1,0)$ | $(1+v)/4$ | $(1-v)/4$ | $(1-v)/4$ | $(1+v)/4$ |
| $(1,1)$ | $(1-v)/4$ | $(1+v)/4$ | $(1+v)/4$ | $(1-v)/4$ |

Every row sums to one. Every entry is nonnegative. Summing over either party's outcome gives $1/2$ for each outcome of the other party, whatever the remote setting. Alice cannot distinguish Bob's choice from her local frequencies; Bob cannot distinguish Alice's. This is the operational no-signalling condition for these tables.

At $v=0$ all outcomes are independent and uniform. Increasing $v$ strengthens a pattern: matching outcomes in the first three contexts, opposite outcomes in the fourth. The local marginals stay unchanged throughout.

## A classical explanation has a testable constraint

A Bell-local model describes outcomes using a shared variable $\lambda$ and local responses:

$$
P(a,b\mid x,y)
=\sum_\lambda q(\lambda)P_A(a\mid x,\lambda)P_B(b\mid y,\lambda).
$$

The distribution $q$ is independent of the selected settings. Alice's response depends on $x$ and $\lambda$, and Bob's on $y$ and $\lambda$. Shared randomness can correlate the results without a response depending on the other party's setting. For this finite scenario, stochastic responses can be refined into mixtures of the sixteen deterministic assignments to $a_0,a_1,b_0,b_1$. This is the relevant global-probability question in the sheaf account of contextuality.[^abramsky]

Encode a bit $a$ as the sign $(-1)^a$. Let

$$
E_{xy}=\sum_{a,b}(-1)^{a+b}P(a,b\mid x,y),
\qquad S=E_{00}+E_{01}+E_{10}-E_{11}.
$$

For any deterministic assignment of signs,

$$
S=A_0(B_0+B_1)+A_1(B_0-B_1)=\pm2.
$$

If $B_0=B_1$, the second parenthesis vanishes; if $B_0=-B_1$, the first vanishes. Averaging assignments therefore gives $|S|\le2$. This is the Clauser–Horne–Shimony–Holt, or CHSH, constraint in this convention.

Our table gives $(E_{00},E_{01},E_{10},E_{11})=(v,v,v,-v)$, hence $S=4v$. It violates the local constraint whenever $v>1/2$.

The other direction also has a constructive proof. Eight of the sixteen assignments have $S=2$. Giving each of those eight weight $1/8$ reproduces exactly the table at $v=1/2$. Mixing that distribution with uniform independent outcomes gives every $0\le v\le1/2$: use weight $2v$ for the boundary model and $1-2v$ for uniform noise. The threshold is exact, not just a failure to find a classical model.

## Quantum mechanics occupies a larger, bounded region

The quantum boundary is $v=1/\sqrt2$. We can exhibit the entire quantum part of this family directly.

Let

$$
|\Phi^+\rangle=\frac{|00\rangle+|11\rangle}{\sqrt2},\qquad
\rho_v=(\sqrt2v)|\Phi^+\rangle\langle\Phi^+|
+(1-\sqrt2v)\frac{I_4}{4}.
$$

For $0\le v\le1/\sqrt2$, this is a valid mixture of a Bell state and white noise. Choose the Pauli observables

$$
A_0=Z,\quad A_1=X,\qquad
B_0=\frac{Z+X}{\sqrt2},\quad B_1=\frac{Z-X}{\sqrt2}.
$$

Here $X=\left(\begin{smallmatrix}0&1\\1&0\end{smallmatrix}\right)$ and $Z=\left(\begin{smallmatrix}1&0\\0&-1\end{smallmatrix}\right)$. Outcome bit zero denotes eigenvalue $+1$, and bit one denotes $-1$.

The Bell state has $\langle Z\otimes Z\rangle=\langle X\otimes X\rangle=1$, vanishing cross correlations $ZX$ and $XZ$, and zero single-party means. The selected observables therefore give correlations $(1,1,1,-1)/\sqrt2$. The white-noise mixture scales these by $\sqrt2v$, producing $(v,v,v,-v)$. The Born rule then gives exactly the four probability rows above.

Cirel'son's quantum bound, usually called Tsirelson's bound, gives $|S|\le2\sqrt2$ for observables with outcomes in $[-1,1]$ and commuting observables across the two parties.[^tsirelson] Since our family has $S=4v$, nothing beyond $v=1/\sqrt2$ can be realized by those quantum measurements. The construction and the bound meet.

![Parameter interval from zero to one: Bell-local models end at one half; quantum-realizable models end at one over square root of two; no-signalling continues to one. Global support assignments exist at every parameter below one, including the quantum region that violates Bell locality.](/figures/quantum-contexts-boundaries.svg)

| Parameter | What the example establishes |
|---|---|
| $0\le v\le1/2$ | A global classical probability distribution exists. |
| $1/2<v\le1/\sqrt2$ | Quantum measurements realize the table, but no Bell-local model does. |
| $1/\sqrt2<v\le1$ | The table satisfies no-signalling and exceeds the quantum bound. |

No-signalling is therefore a constraint on allowable correlations, but it does not by itself select quantum mechanics.

## Possible outcomes can glue while probabilities cannot

At every $v<1$, every entry of the table is positive. Every one of the sixteen assignments to $a_0,a_1,b_0,b_1$ therefore selects a possible outcome in every context. A checker that asks only whether the supports admit a global assignment will accept all sixteen.

Yet at $v=3/5$, for example, $S=12/5>2$. No choice of nonnegative weights on those assignments reproduces the four context distributions. The obstruction concerns their probabilities, even though their possible outcomes fit together.

Abramsky and Brandenburger's sheaf formulation makes this distinction precise. Their global section for an empirical model is a distribution whose restrictions reproduce the context distributions. Failure of such a section is probabilistic contextuality. Absence of even a support-compatible assignment is the stronger condition of strong contextuality.[^abramsky]

The endpoint $v=1$ has that stronger obstruction. Its allowed outcomes obey

$$
a_0\oplus b_0=0,\quad a_0\oplus b_1=0,\quad
a_1\oplus b_0=0,\quad a_1\oplus b_1=1.
$$

Taking the exclusive-or of all four equations makes every variable occur twice. The left side becomes zero, while the right side is one. No assignment exists. This is the Popescu–Rohrlich box: a useful mathematical comparison that exceeds the quantum bound, not a quantum apparatus.

## Entanglement asks a related, different question

Entanglement concerns whether a quantum state can be expressed as a mixture of product states. Bell-locality concerns whether specified measurement statistics have the local response model described above. Werner constructed entangled states admitting a local hidden-variable model for the measurements in his construction, demonstrating that these properties cannot be identified.[^werner]

Accordingly, failing to violate this particular CHSH inequality does not certify that a prepared state is unentangled. Conversely, the abstract probability table does not itself specify how a state was prepared. Our explicit density operator and measurement choices supply that additional information for the quantum part of the example.

## Reproduce the finite calculation

The accompanying [Python example](https://github.com/lenticule-science/science.561.group/blob/main/examples/quantum-contexts.py) uses only the standard library and exact rational arithmetic. From a checkout, run:

```sh
python3 examples/quantum-contexts.py
```

It checks normalization, nonnegativity, both parties' marginals, correlations, CHSH values and global support assignments. It also constructs the local boundary distribution and verifies the endpoint's parity contradiction. Its five cases are:

| $v$ | $S$ | Global support assignments | Global probability model | Quantum realization |
|---:|---:|---:|---|---|
| $0$ | $0$ | 16 | Yes | Yes |
| $1/2$ | $2$ | 16 | Yes | Yes |
| $3/5$ | $12/5$ | 16 | No | Yes |
| $3/4$ | $3$ | 16 | No | No |
| $1$ | $4$ | 0 | No | No |

The quantum column follows the analytic construction and bound above; the enumeration does not independently prove Tsirelson's theorem. These are mathematical tables, not experimental observations, and the script is not a general linear-programming solver.

## What the existing Obsmetrologia carriers already supply

The current source already distinguishes several layers. `MeasurementScenario` supplies measurement contexts and predicates for their allowed outcome assignments. `EmpiricalModel` adds `WDist`, a finite list of assignments with natural-number weights, and `PModel`, a family of those weighted readings. Its `singleMarginal` computes a marginal count, and `NoSignaling` compares those counts for a shared measurement. `SupportContextuality` then forgets the weights and proves that the existing PR model's positive-weight support is strongly contextual. These are actual source declarations, not proposed names for new modules.[^native]

The hierarchy is also already finer than a single yes/no test. `ContextualObstruction` distinguishes the existence of *some* global assignment from the stronger requirement that *every* allowed local assignment extend. That distinction handles the logical-contextuality level between a fully extendible support and a support with no global assignment. The example here tests the additional information carried by probabilities even when every local assignment extends.

The rational members of our family fit the existing weighted carrier directly. Write $v=p/q$, with $q>0$ and $0\le p\le q$. Give an outcome weight $q+p$ when it satisfies the PR parity and $q-p$ otherwise. Every context then has total weight $4q$; every single-party outcome has marginal weight $2q$. At $v=3/5$, the first three rows have weights $(8,2,2,8)$ and the fourth has $(2,8,8,2)$. Dividing by the common total twenty gives the displayed probabilities. No new real-valued probability carrier is needed for this finite case.

The supplied positive common total matters: the `PModel` carrier does not itself prove normalization. Its present `NoSignaling` predicate compares individual measurement counts. That covers the overlaps in this two-party example, where distinct overlapping contexts share one measurement; a more general context cover can require joint-marginal compatibility.

This makes the unresolved question precise: **can one global weighted distribution reproduce those context weights?** The CHSH argument above proves that it cannot at $v=3/5$, even though its support admits all sixteen assignments. This is an executable mathematical calibration for the existing carrier. The present supplement does not claim to have added or kernel-checked that weighted-extension theorem in Lean.

One native declaration needs an equally precise reading. `chsh_tsirelson_tier` proves a deterministic parity obstruction and that a constructed scalar equals $2\sqrt2$, lying strictly between 2 and 4. Its statement is not a supremum theorem over all quantum states and measurement operators. The general quantum bound used in this article is the separate result of Cirel'son; the density operator and observables above supply an explicit external realization. Keeping both results visible identifies the bridge still to be earned.

## What this asks of a relational account

A useful connection to Obsmetrologia must identify its measurement contexts, outcomes, distributions and restriction maps. It must then show whether the proposed translation preserves normalization, marginal compatibility and the relevant obstruction. A statement about forgetting source distinctions or failing to reconstruct a boundary does not supply those maps by itself.

That requirement creates a productive research target. A source-aware representation could retain which context licensed a claim, distinguish a possible assignment from a weighted empirical model, and expose exactly what a global reconstruction fails to preserve. The finite family above gives it concrete receiving cases: a classical boundary that must pass, a quantum case whose support passes while its probability model fails, and a stronger no-signalling case that quantum mechanics excludes.

*Research status, 31 October 2026:* AI-assisted exposition of established quantum-foundations results, inspected native declarations and exact finite teaching calculations. No new physical experiment, complete native quantum derivation, fresh whole-library Lean build or external peer review is claimed.

*Reuse terms:* no additional reuse license is granted by this page. Cited works and linked source repositories retain their own terms.

## References

[^native]: Obsmetrologia, revision `a0d8d07226b57f04c088d96e4d7f91a00c785f9d`: [MeasurementScenario](https://github.com/lenticule-science/obsmetrologia/blob/a0d8d07226b57f04c088d96e4d7f91a00c785f9d/Obsmetrologia/QuantumContextuality/MeasurementScenario.lean), [EmpiricalModel](https://github.com/lenticule-science/obsmetrologia/blob/a0d8d07226b57f04c088d96e4d7f91a00c785f9d/Obsmetrologia/QuantumContextuality/EmpiricalModel.lean), [SupportContextuality](https://github.com/lenticule-science/obsmetrologia/blob/a0d8d07226b57f04c088d96e4d7f91a00c785f9d/Obsmetrologia/QuantumContextuality/SupportContextuality.lean), and [ContextualObstruction](https://github.com/lenticule-science/obsmetrologia/blob/a0d8d07226b57f04c088d96e4d7f91a00c785f9d/Obsmetrologia/QuantumContextuality/ContextualObstruction.lean). These links require authorized repository access. They identify the inspected mathematical source, not publicly available proof artifacts or an observed deployment.

[^abramsky]: Samson Abramsky and Adam Brandenburger (2011), “The Sheaf-Theoretic Structure of Non-Locality and Contextuality,” *New Journal of Physics* 13, 113036. Theorem 8.1 relates factorizable hidden-variable realization to a global distribution; the paper distinguishes probabilistic and strong contextuality. https://arxiv.org/pdf/1102.0264v7 and https://doi.org/10.1088/1367-2630/13/11/113036.

[^tsirelson]: B. S. Cirel'son (1980), “Quantum generalizations of Bell's inequality,” *Letters in Mathematical Physics* 4, 93–100. Theorem 1 and the CHSH bound on page 94. https://doi.org/10.1007/BF00417500. Original-paper scan: https://www.informationphilosopher.com/solutions/scientists/bell/Tsirelson.pdf.

[^werner]: Reinhard F. Werner (1989), “Quantum states with Einstein-Podolsky-Rosen correlations admitting a hidden-variable model,” *Physical Review A* 40, 4277–4281. The counterexample concerns the measurement model specified in the paper; it is not a claim about unrestricted experimental protocols. https://doi.org/10.1103/PhysRevA.40.4277 and https://journals.aps.org/pra/abstract/10.1103/PhysRevA.40.4277.
