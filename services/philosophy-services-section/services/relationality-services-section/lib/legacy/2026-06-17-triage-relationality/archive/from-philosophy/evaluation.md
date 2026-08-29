---
title: "Evaluation"
description: "An Evaluation is a four-tuple (E, x, Q, v) — an evaluator E, a subject x, a quality Q specifying the dimension of assessment, and a result value v = Q_t(x) ∈ V(t). The evaluator applies quality-map Q to subject x at history t, producing v as the verdict."
defines: Evaluation
related: Quality, Gap, Fitness, Judgment, Act, Observation, Report, Criterion, Measure
instance-of: act
requires: [evaluator, subject, quality]
produces: gap
acts-on: entity
date-created: 2026-03-20
date-modified: 2026-03-20
---


## Formal definition

An **Evaluation** is a four-tuple $(E, x, Q, v)$:

$$(E : \mathrm{Person},\; x \in X(t),\; Q : X \Rightarrow V,\; v = Q_t(x) \in V(t))$$

where:
- $E$ is the **evaluator** — the agent who performs the evaluation; $E$ is the author of the quality-value assignment $v$; $E$ is accountable for the accuracy of the assignment
- $x \in X(t)$ is the **subject** — the object being evaluated; $x$ is an instance of the object-type $X$ at history $t$
- $Q : X \Rightarrow V$ is the **quality** — the [Quality](quality.md) being assessed; a natural transformation from the object-type presheaf $X$ to the value-presheaf $V$; specifies WHAT dimension is being evaluated
- $v \in V(t)$ is the **result** — the quality value assigned; $v = Q_t(x)$ is what the evaluation produces; $E$ is asserting that the quality of $x$ on dimension $Q$ at history $t$ is $v$

**Accuracy condition.** The evaluation $(E, x, Q, v)$ is **accurate** iff $v = Q_t(x)$ — the result actually equals the quality map applied to the subject at $t$. An evaluation is an authored [Assertion](assertion.md) of the form "$Q_t(x) = v$"; accuracy is the condition that this assertion is true.

**Evaluator dependence.** Evaluations are authored: $E$'s assessment of $Q_t(x)$ may differ from $E'$'s, even on the same subject and quality, if their accessible sub-fibers differ. An expert evaluator has access to a larger sub-fiber than a non-expert, and may produce more accurate evaluations as a result. Evaluation accuracy is relative to the evaluator's accessible sub-fiber.

## What this is

An **Evaluation** is the act of applying a [Quality](quality.md) to a subject and recording the result. Evaluations are how the system produces structured assessments — not raw observations of what IS, but measurements of HOW MUCH of some quality a subject has.

Every quality assessment in the system is an evaluation:
- Is this element in $H^*_t$? → Evaluation on the fixed-fiber membership quality $\chi_{H^*}$
- How large is this element's gap? → Evaluation on the Gap quality $\mathrm{Gap}_t$
- Does this agent satisfy the role's capability requirements? → Evaluation on Fitness quality
- Is this report accurate? → Evaluation on accuracy quality

## Evaluation and judgment

Judgment is a special case of evaluation: the judgment $(Z, I, f, \alpha)$ evaluates the situation $f$ against the intent $I$ within zone $Z$, producing the act-choice $\alpha$. The "quality" in judgment is the prudential quality — how well each candidate action serves the intent within the zone. Judgment's result $\alpha$ is the action assigned the highest prudential quality score.

The quality of judgment (phronesis) is itself a meta-quality: how well the evaluator (the officer making the judgment) performs the evaluation. A good judge consistently produces accurate prudential evaluations — their quality assignments track the genuine prudential ordering of candidate actions.

## Evaluation and the gap

The Gap evaluation is fundamental: $\mathrm{Gap}_t : H_t \to H_t \times H_t$ assigns to each fiber element $a$ the pair $(\sigma_t(a), \Delta_t(a))$. This is the most basic quality evaluation in the system — it measures incompleteness. Every element can be evaluated on this quality at any history; the result tells you how far the element is from $H^*_t$.

The gap evaluation is performed automatically by the nucleus operators. It does not require a human evaluator $E$ — it is the system's intrinsic quality assessment machinery.

## Evaluation chains

Evaluations compose: if $Q_1 : X \Rightarrow V_1$ and $Q_2 : V_1 \Rightarrow V_2$ are qualities, then $Q_2 \circ Q_1 : X \Rightarrow V_2$ is a derived quality. The evaluation chain $(E, x, Q_1, v_1)$ followed by $(E, v_1, Q_2, v_2)$ produces the composite evaluation $(E, x, Q_2 \circ Q_1, v_2)$.

Example: evaluate compliance ($Q_1$: officer → gap) then evaluate gap-size ($Q_2$: gap → small/large). The chain produces a compliance-size judgment on the officer. This chain structure underlies multi-criteria evaluation in institutional settings: complex quality judgments are chains of simpler quality evaluations.

## Evaluation in the FARS

In the flatfile agential resource system, evaluations appear as:

| Evaluation | Subject | Quality | Result |
|---|---|---|---|
| Norm check | Agent output | Compliance with MUST clauses | Pass/fail |
| Quality assessment of a math file | math entity | Completeness, grounding, proof coverage | Quality score |
| Triage | Task | Priority, urgency, completeness | Priority classification |
| Grounding claim evaluation | Claim | Evidence sufficiency | Settled/unsettled |
| Skill output check | Skill output | Satisfies skill spec | Satisfies/fails |

## Rosetta quartet reading: four modes of evaluation

**Source:** Baez-Stay Rosetta Quartet.

The Baez-Stay Rosetta Stone (2009) observes that computation, logic, topology, and physics are four columns of the same mathematical table. On the free-quotient nuclear quartet conjecture, these four columns correspond to the four phases of the relational universe construction: algebra (computation), language (logic), geometry (topology), dynamics (physics). An evaluation $(E, x, Q, v)$ has all four readings simultaneously — the quality $Q$ and the evaluation act take a different form in each column but they are the same mathematical structure:

| Baez-Stay column | Phase | Evaluation reading |
|---|---|---|
| Computation (types, programs) | Algebra | $Q$ is a coKleisli map; $x$ is an input type (element of $H_t$); $v$ is the output type |
| Logic (propositions, proofs) | Language | $Q$ is a derivation in RelationalHistoryFiberDoctrineLanguage; $x$ is a proposition; $v$ is the proof-verified value |
| Topology (spaces, cobordisms) | Geometry | $Q$ is a sheaf-section check on the history site $(T,J)$; $x$ is a local section; $v$ records whether local data glues coherently |
| Physics (processes, operators) | Dynamics | $Q$ is a nucleus application ($\sigma_t$ or $\Delta_t$); $x$ is a fiber state; $v$ is the nucleus-evolved state |

**Computation phase evaluation.** In the algebra phase, evaluation is program execution: the quality $Q$ is a coKleisli map $G_s(X) \to V$ in the coKleisli category of the directed comonad $G_s$. Applying $Q$ to subject $x$ of type $X$ (an element of the fiber $H_t$ read as a type by the Lindenbaum-Tarski/Curry-Howard construction) produces $v$ as the output type. Evaluation accuracy becomes type-correctness: $v = Q_t(x)$ iff the program produces the correct type at the current history.

**Logic phase evaluation.** In the language phase, evaluation is proof application: the quality $Q$ is a derivation $\pi$ in RelationalHistoryFiberDoctrineLanguage — a formal proof that proposition $x$ entails value-proposition $v$ at history $t$. The evaluator $E$ checks the derivation. Evaluation accuracy becomes proof validity: $v = Q_t(x)$ iff $\pi$ is a valid derivation. The cut rule in sequent calculus — the fundamental rule allowing inference chains — is evaluation composition: $(E, \pi_2(v_1), \pi_1(x), v_2) \circ (E, \pi_1(x), x, v_1)$.

**Topology phase evaluation.** In the geometry phase, evaluation is sheaf gluing: the quality $Q$ is a covering condition in the commutation topology $J$. Subject $x$ is a family of local sections $\{s_i \in H_{t_i}\}$ over a sieve on $t$. The evaluation result $v$ is the global section they glue to (if compatible) or the failure evidence (if not). Evaluation accuracy is the sheaf gluing condition: $v = Q_t(x)$ iff the local sections are compatible and uniquely extend to a global section in $H_t$.

**Physics phase evaluation.** In the dynamics phase, evaluation is operator application: the quality $Q$ is a nucleus ($\sigma_t$ or $\Delta_t$, or their composition $\pi_t$). Subject $x$ is a fiber state in $H_t$. Result $v = Q_t(x)$ is the nucleus-evolved state. Evaluation accuracy is trivially guaranteed by the nucleus axioms — the nucleus is not an authored assertion but a structural operator. This is the borderline case between authored evaluation (evaluator $E$ is responsible for $v$) and structural evaluation (the nucleus computes $v$ automatically). The automation question in the open questions is here answered: nucleus applications are the physics-phase evaluations, and they are not authored by a human $E$ — but they are evaluations in the same mathematical sense.

**Evaluation chains as cut-rule applications.** The composition of evaluations — $(E, x, Q_1, v_1)$ followed by $(E, v_1, Q_2, v_2)$ yielding $(E, x, Q_2 \circ Q_1, v_2)$ — is simultaneously: coKleisli composition in computation, the cut rule in logic, cobordism gluing in topology, and operator composition in dynamics. The four-column coherence of the Rosetta Stone is the formal content of why evaluation chains are well-defined: they compose because the same composition structure underlies all four phases.

**Proposition (Four-phase coherence of evaluation).** On the Rosetta quartet conjecture, evaluation chains are coherent across all four phases: composing evaluations in the computation phase is the same mathematical operation as composing proofs in the logic phase, gluing sections in the geometry phase, and composing operators in the dynamics phase. The commutativity of the free-quotient nuclear quartet guarantees that these four modes of composition coincide.

*Source.* Baez-Stay correspondence from Baez-Stay Rosetta Quartet §The Conjecture and §Requirements 1–4. Status: computation and logic phases established; topology phase suggestive; physics phase speculative (inner product structure not yet constructed). $\square$

## Open questions

- Whether every evaluation requires a human evaluator $E$ or whether automated evaluations (nucleus applications, type checkers, proof verifiers) are evaluations in the same sense — whether the evaluator slot can be filled by a computational process rather than a person.
- Whether the accuracy condition $v = Q_t(x)$ can itself be evaluated — whether there is a meta-quality $A : \mathrm{Evaluation} \Rightarrow \{0,1\}$ that evaluates the accuracy of evaluations, and whether this meta-quality is itself evaluable (and whether this generates a regress).
- Whether evaluation results must be in the same fiber as the subject or can span across fibers — whether a cross-history evaluation $(E, x \in H_t, Q, v \in H_s)$ for $s \neq t$ is coherent, or whether evaluations are necessarily fiber-local.
