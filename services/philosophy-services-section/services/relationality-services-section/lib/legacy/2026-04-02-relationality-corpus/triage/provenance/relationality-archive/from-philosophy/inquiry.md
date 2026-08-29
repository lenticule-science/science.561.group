---
name: inquiry
description: "An Inquiry is a triple (I, S, Q) — an indeterminate situation, a question whose answer is not yet determined, and an inquiry sequence of alternating deductive and interrogative steps transforming indeterminacy into resolution."
defines: Inquiry
related: Derivation, Procedure, Process, Abduction, InterrogativeModel
requires: [situation, question]
produces: evidence
contrasts-with: [derivation, procedure]
enables: grounding
date-created: 2026-03-20
date-modified: 2026-03-20
---


## Formal definition

An **Inquiry** is a triple $(\mathcal{I}, \mathcal{Q}, S)$:

$$(\mathcal{I} : \mathrm{IndeterminateSituation},\; \mathcal{Q} : \mathrm{Question},\; S : \mathrm{InquirySequence})$$

where:
- $\mathcal{I}$ is the **indeterminate situation** — the initial epistemic state from which the inquiry begins; $\mathcal{I}$ is indeterminate in the specific sense that $\mathcal{Q}$'s answer is not determined by the information in $\mathcal{I}$; the indeterminacy is the driving force of the inquiry — there is something not yet known that matters
- $\mathcal{Q}$ is the **target question** — the question the inquiry attempts to answer; $\mathcal{Q}$ may be a simple binary question ("is $P$ true?"), a wh-question ("what is the value of $x$?"), or a complex structured question ("what is the best explanation of $E$?"); the target question provides the criterion for when the inquiry is complete
- $S = (s_1, s_2, \ldots)$ is the **inquiry sequence** — a finite or potentially open-ended sequence of **inquiry steps** of two kinds:
  - **Deductive steps** $d$: logical inferences from information accumulated so far — derivations from the current information pool that extend it by logical consequence
  - **Interrogative steps** $q$: questions posed to the subject matter (Nature, an oracle, an experiment, a text) that return answers, extending the information pool with new information not derivable from what was already known

**Three invariants.** $(\mathcal{I}, \mathcal{Q}, S)$ is an inquiry iff:

1. **Indeterminate start**: $\mathcal{Q}$'s answer is not determined by $\mathcal{I}$ alone. If the target question were already answerable from the initial information, there would be nothing to inquire about — the situation would be determinate at the outset. Indeterminacy is constitutive: inquiry exists precisely because something is not yet known that can come to be known.

2. **Self-correction**: the inquiry sequence $S$ can revise its direction in light of new information. If an interrogative step returns a surprising answer that conflicts with a prior deductive conclusion, the inquiry can backtrack, revise its deductive steps, and proceed on a new trajectory. An inquiry that cannot revise is a procedure following a fixed script. Self-correction is the distinguishing mark of genuine inquiry: the ability to let the evidence shape the path.

3. **Question-dependence of interrogative steps**: the interrogative steps are sensitive to what questions the inquiry has generated — the inquiry can only ask questions that arise from its current state of information and its deductive-interrogative structure. Questions cannot be asked arbitrarily; they emerge from the logical development of the inquiry. This is the formal content of "controlled or directed" in Dewey's definition: the inquiry is directed by a developing question structure, not by random sampling of the domain.

**Termination.** The inquiry $(\mathcal{I}, \mathcal{Q}, S)$ **terminates successfully** at step $n$ iff the information accumulated through $S_n = (s_1, \ldots, s_n)$ determines the answer to $\mathcal{Q}$ — the indeterminate situation has been transformed into a determinate one that resolves the target question. Inquiry need not terminate: some inquiries are indefinitely continued (ongoing empirical programs, living traditions of investigation). An inquiry without termination conditions is not defective — it is inquiry into an open domain.

## Dewey: inquiry as controlled transformation

John Dewey (*Logic: The Theory of Inquiry*, 1938) defines inquiry as:

> "the controlled or directed transformation of an indeterminate situation into one that is so determinate in its constituent distinctions and relations as to convert the elements of the original situation into a unified whole."

Dewey's account identifies **five functional phases**:

1. **The antecedent conditions of inquiry: an indeterminate situation** — before inquiry begins, something is felt as wrong, confusing, or problematic. The situation as a whole has a quality of indeterminacy; it is not yet clear what the problem is, let alone what the solution is. The indeterminate situation is not a mental state — it is a situation, an objective state of affairs in which the relationships among elements are unsettled.

2. **Institution of a problem** — the first act of inquiry is to locate the indeterminacy: to transform the felt indeterminacy into a stated problem with enough determinacy to be worked on. The problem formulation is not given in advance; it is an achievement of inquiry. "A problem well-stated is a problem half-solved."

3. **The determination of a problem-solution** — the formation of a hypothesis or set of hypotheses that would, if true, resolve the stated problem. This is the creative step: generating candidates for the answer. The hypothesis is not derived mechanically from the premises — it is proposed, not deduced.

4. **Reasoning: working out the hypothesis** — deductive development of the hypothesis. If the hypothesis $H$ is true, what follows? What observations, what consequences, what further predictions? This is the analytic or deductive phase: unpacking what the hypothesis entails.

5. **The operational character of facts-meanings: experimental or observational testing** — the hypothesis's consequences are tested against observation or experiment. Facts that confirm or disconfirm the hypothesis. The inquiry terminates when hypothesis and evidence reach a "settled" relationship — when the situation is transformed from indeterminate to determinate.

Dewey's key philosophical move: **the means and end of inquiry are internal to the inquiry**. The problem is defined in the course of inquiry; the solution is what resolves the problem as defined; neither is specified in advance. The "end" of inquiry is not a pre-given goal but the termination condition generated by the inquiry's own development. This is what distinguishes inquiry from procedure: a procedure's end ($Q$) is specified before execution; an inquiry's end emerges from the inquiry itself.

## Peirce: abduction and the fixation of belief

Charles Sanders Peirce identified the fundamental logic of inquiry in two seminal contributions:

**"The Fixation of Belief"** (1877, *Popular Science Monthly*) presents four methods by which belief becomes fixed:
1. **Tenacity**: hold a belief against all evidence. Effective for individual peace of mind; fails under social pressure and collisions with inconvenient facts.
2. **Authority**: accept what an authoritative body declares. Effective for producing social stability; fails when authorities conflict or when independent inquiry is possible.
3. **The a priori method**: believe what is agreeable to reason. Effective for constructing internally coherent systems; fails because "agreeable to reason" varies with intellectual fashion — two careful reasoners disagree indefinitely with no tiebreaker, and what seems rational shifts across generations. The method reduces to taste; it is not anchored in external reality.
4. **The method of science**: beliefs are fixed by a self-correcting process that tracks external reality. The method is not merely accepting any result, but pursuing a method that, if followed indefinitely, converges to the truth. Science is the only self-correcting method — the only one that, when it produces a wrong belief, generates the evidence that corrects it.

The method of science is Peirce's characterization of inquiry: a self-correcting process aimed at fixing belief in a way that converges with external reality. What makes it inquiry rather than procedure: it can revise itself, it cannot specify its termination in advance, and its path is shaped by what it discovers.

**Genuine doubt vs. Cartesian methodological doubt.** Peirce explicitly rejects Descartes's starting-from-scratch methodology. Artificial doubt — the philosopher's decision to doubt for methodological purposes — does not produce real inquiry. Only **genuine doubt**, actual psychological-functional unsettledness of a belief habit, triggers inquiry. Inquiry begins from where we actually are, with our actual existing commitments; we cannot and should not try to strip them all away before beginning. This is a structural point: inquiry is not a procedure from a blank slate. It begins from an existing fabric of settled beliefs, one of which has been genuinely disturbed.

**First principle of reason** (Peirce): "Do not block the way of inquiry!" — a regulative maxim rather than an assertion. Genuine questions with empirical content must in principle be answerable; no result should be declared forever beyond inquiry.

**Abduction** (CP 2.623, 5.189; *Collected Papers*, 1931-1935) is Peirce's name for the logic of hypothesis generation:

> "The surprising fact C is observed. But if H were true, C would be a matter of course. Hence, there is reason to suspect that H is true." (CP 5.189)

Abduction is the creative inferential step — the step that generates a new hypothesis from an observed anomaly. Peirce distinguishes three inferential modes:
- **Deduction**: if $H$ then $C$; $H$; therefore $C$. Necessary inference; no new information beyond premises.
- **Induction**: we have observed many cases of the form "$H$ and $C$" and few of "$H$ and $\neg C$"; therefore $H$ is probable given $C$. Statistical inference; generalizes from cases.
- **Abduction**: $C$ is observed; $H \to C$ is plausible; therefore $H$ is hypothetically inferred. Ampliative inference; generates new hypotheses.

Peirce's three-step account of scientific inquiry: abduction generates hypotheses from anomalies; deduction develops their consequences; induction tests them. The inquiry sequence $S$ is structured by this triadic rhythm.

## Hintikka: the interrogative model

Jaakko Hintikka (*The Semantics of Questions and the Questions of Semantics*, 1976; *Inquiry as Inquiry*, 1999) developed the **interrogative model of inquiry** — a formal game-theoretic account:

An inquiry is modeled as a **game between the Inquirer and Nature**:
- The **Inquirer** is the agent conducting the inquiry, attempting to derive the target proposition $\mathcal{Q}$ from initial information $\mathcal{I}$ plus Nature's answers
- **Nature** is the oracle — the repository of all true information about the domain — that answers the Inquirer's questions honestly

Each **move** in the game is either:
- A **logical move** (deductive step): the Inquirer draws a logical inference from accumulated information using a standard rule of inference
- An **interrogative move** (interrogative step): the Inquirer poses a question to Nature, and Nature returns the true answer; the answer is added to the Inquirer's information pool

The Inquirer's goal: to derive $\mathcal{Q}$ in a finite number of moves. A **strategy** for the Inquirer is a function that specifies, at each game state (the current information pool and the current question structure), either which deductive step to take or which question to pose to Nature.

Hintikka's **principal theorem**: an inquiry strategy for deriving $\mathcal{Q}$ from $\mathcal{I}$ exists iff $\mathcal{Q}$ is "discoverable" from $\mathcal{I}$ — iff there is a sequence of questions whose answers, combined with deductive reasoning, suffice to establish $\mathcal{Q}$.

**The interrogative model separates two sources of knowledge**: what is known logically (derivable from $\mathcal{I}$ by deduction) and what is known empirically (obtained by questioning Nature). The power of inquiry lies in the interaction: deductive steps generate new questions; interrogative steps generate new premises for deductive steps. Neither alone is sufficient.

Hintikka's model makes the **question structure** explicit: what questions can be asked at each stage is determined by the current information pool and the target question. This gives a formal criterion for question-dependence of interrogative steps (Invariant 3): a question $q$ is licit at stage $n$ iff $q$ is generated by the deductive development of $\mathcal{I} \cup \{\text{answers to } s_1, \ldots, s_{n-1}\}$.

## The tree geometry of inquiry

The interrogative model gives inquiry a natural **tree geometry**: the **questioning tree** $T_\mathcal{Q}$ of an inquiry is the game tree of the Inquirer-Nature game:

- The **root** is the indeterminate situation $\mathcal{I}$
- Each **node** at depth $n$ is a possible information pool after $n$ moves
- **Branching** at interrogative nodes: each possible answer from Nature is a branch
- **Linear extension** at deductive nodes: deductive steps have unique conclusions
- A **path** from root to a leaf is a possible inquiry trajectory
- A **successful path** is one that terminates in a determinate situation resolving $\mathcal{Q}$

An inquiry is an exploration of this tree: the Inquirer follows one path (guided by the actual answers Nature provides), but the tree describes all possible paths the inquiry could take depending on Nature's responses.

The tree geometry makes the distinction between inquiry and procedure precise: a procedure's specification is a predicate on leaves (every path must reach a leaf satisfying $Q$); an inquiry's success condition is a property of paths (does the path reach a leaf that resolves $\mathcal{Q}$?). In a procedure, the same specification applies to every path. In an inquiry, the success condition is discovered along the path.

## Open questions

- Whether Hintikka's interrogative model is complete — whether every inquiry that terminates in principle (when Nature is asked the right questions) has an explicit strategy that the Inquirer can follow. Hintikka's theorem asserts existence; constructing the strategy is a harder problem.
- Whether Peirce's abductive logic can be formalized in a way that is both sound (abductively inferred hypotheses are more likely true than randomly chosen ones) and complete (no true hypothesis escapes abduction from the right evidence). Current formal accounts (Aliseda 2006, Josephson & Josephson 1994) capture limited fragments.
- Whether inquiry can be modeled in the relational hyperverse as a path-finding process in the history tower — whether an indeterminate situation corresponds to a history $t$ at which $\mathcal{Q}$'s answer is not in $H^*_t$, and the inquiry succeeds at history $t' > t$ when $\mathcal{Q}$'s answer enters $H^*_{t'}$ through the interaction of deductive closure (the saturation nucleus) and empirical settling (the transfer nucleus).
- Whether self-correction (Invariant 2) requires a non-monotonic logic — whether the inquiry sequence $S$ must be modeled with a logic that allows retraction of prior conclusions when new information contradicts them, and whether such non-monotonicity is compatible with the nucleus-based fiber structure (which is monotone in the lattice order).
