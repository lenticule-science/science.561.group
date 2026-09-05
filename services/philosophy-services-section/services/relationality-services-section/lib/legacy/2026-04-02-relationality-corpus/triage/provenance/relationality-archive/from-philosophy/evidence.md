---
name: evidence
description: "Evidence is a triple (e, p, R) — an evidence item e, a proposition p that e bears on, and a relevance relation R specifying how e bears on p. The invariant: evidence is relational — e is evidence FOR p relative to something (a prior, a type, a standard); there is no evidence in isolation."
acts-on: proposition
requires: [evidence-item, relevance-relation]
enables: grounding
produced-by: observation
date-created: 2026-03-20
date-modified: 2026-03-20
---


## Formal definition

**Evidence** is a triple $\mathcal{E} = (e, p, R)$:

$$\mathcal{E} = (e : \mathrm{Item},\; p : \mathrm{Proposition},\; R : \mathrm{RelevanceRelation})$$

where:
- $e$ is the **evidence item** — the thing that serves as evidence; may be a document, a measurement, a testimony, a proof term, an observation, a computed value, or a prior belief state; the item is not evidence in isolation — it is evidence only in relation to the proposition $p$ via $R$
- $p$ is the **proposition** — what the evidence bears on; the proposition in question may be a factual claim (the defendant was at the scene), a mathematical proposition (this function terminates), a legal claim (the contract is valid), or a normative claim (this action is permissible under the norm)
- $R$ is the **relevance relation** — the relation specifying *how* $e$ bears on $p$: whether $e$ raises $p$'s probability (Bayesian), whether $e$ is a term inhabiting $p$'s type (proof-theoretic), or whether $e$ meets the threshold of legal admissibility and weight. $R$ is what determines whether $e$ is evidence *for* $p$, evidence *against* $p$, or irrelevant to $p$.

**Three invariants.** $\mathcal{E}$ is an instance of evidence iff:

1. **Relationality**: $e$ is evidence *for* $p$ only relative to $R$. A fingerprint at a crime scene is evidence of presence only relative to a chain of inference connecting fingerprints to the person who left them, excluding contamination, etc. The same item can be evidence for $p$ under one relevance relation $R_1$ and irrelevant (or evidence against $p$) under another $R_2$. This is why contested evidence is typically contested at the level of $R$ — the parties agree on $e$ but disagree on what $e$ shows.

2. **Epistemic force**: good evidence moves the rational agent's credence toward $p$ (probabilistic) or provides the warrant needed to assert $p$ (justificationist) or witnesses $p$'s truth directly (proof-theoretic). Evidence that leaves all rational credences unchanged is not evidence — it is noise. The strength of evidence is the magnitude of the epistemic shift $e$ licenses.

3. **Defeasibility**: evidence is typically defeasible — new evidence $e'$ can override or qualify $e$'s support for $p$. This distinguishes evidence from proof in mathematics (where proof is indefeasible — once a theorem is proved, no further evidence can unseat it unless the proof is found faulty) from evidence in empirical and legal contexts (where new evidence can always shift the balance).

## The probabilistic reading: Bayesian evidence

In Bayesian epistemology, $e$ is **evidence for** $p$ iff:

$$P(p \mid e) > P(p)$$

The posterior probability of $p$ given $e$ exceeds the prior probability of $p$. Equivalently (by Bayes' theorem): $P(e \mid p) > P(e \mid \neg p)$ — the evidence is more likely under $p$ than under $\neg p$. The **Bayes factor** $B = P(e \mid p) / P(e \mid \neg p)$ measures the strength of evidence: $B > 1$ is evidence for $p$; $B < 1$ is evidence against; $B = 1$ is irrelevant.

The **likelihood ratio** is the fundamental measure of evidential force. It does not depend on prior probabilities — only on the probability of observing $e$ under each hypothesis. This is why likelihood ratios are used in forensic evidence: the DNA match probability under the prosecution hypothesis vs. the defense hypothesis is the likelihood ratio; it measures what the DNA evidence actually shows, independent of the base rate of innocence or guilt.

**The problem of old evidence** (Glymour 1980): if $e$ is already known before the theory $T$ is proposed, the Bayesian cannot say $e$ confirms $T$ (since $P(T \mid e) = P(T \mid e, e) = P(T \mid e)$ — already conditioned on $e$, the agent's credence in $T$ does not change on learning $e$ again). Yet we do treat known observations as confirming newly proposed theories. The solution: counterfactual confirmation — would $e$ have confirmed $T$ had we not already known $e$?

**Bayesian updating as nuclear application**: receiving evidence $e$ about $p$ and updating credence from $P(p)$ to $P(p \mid e)$ is the probabilistic analog of applying the saturation nucleus to $p$: $\sigma_t(p)$ is the updated (more strongly asserted) form of $p$ after evidence is incorporated. The nucleus does not change which propositions exist in the fiber; it changes their relational structure — their standing relative to other propositions in the meaning-closure.

## The proof-theoretic reading: evidence as term

In dependent type theory and the Curry–Howard–Lambek correspondence, a **proof of $p$** is a **term $t$ of type $p$**: $t : p$. The proposition $p$ is true (in the constructive sense) iff its type is **inhabited** — iff there exists a term $t$ such that $t : p$.

This is not metaphorical: in Martin-Löf type theory, a proposition *is* a type, and a proof *is* a term of that type. There is no external relation between the proof and the proposition — the proof just *is* an element of the type the proposition denotes.

Evidence in this reading: **evidence for $p$ is a term $t : p$**. The evidence item $e = t$ inhabits the type $p$; its existence is the fact that $p$ is provable. The relevance relation $R$ is type-checking: $e$ is relevant to $p$ iff $e$ can be type-checked as having type $p$ in the relevant context.

Key examples:
- **Conjunction**: evidence for $p \wedge q$ is a pair $(t_p, t_q)$ where $t_p : p$ and $t_q : q$ — evidence for both
- **Implication**: evidence for $p \Rightarrow q$ is a function $f : p \to q$ — a procedure that transforms evidence for $p$ into evidence for $q$
- **Existential**: evidence for $\exists x. P(x)$ is a pair $(a, t)$ where $a$ is a term and $t : P(a)$ — a witness $a$ together with evidence that the witness satisfies $P$
- **Universal**: evidence for $\forall x. P(x)$ is a function $f : (x : A) \to P(x)$ — a procedure that, for any element $x$, produces evidence that $x$ satisfies $P$

The **existential witness** is particularly important for this system: evidence for $\exists x. P(x)$ is not just a proof that something satisfying $P$ exists — it is an *explicit* witness $a$ together with a proof $t : P(a)$ that $a$ works. This is the constructive requirement: you must exhibit the evidence, not just argue that it must exist.

**Propositions-as-Types in the fiber**: in the relational hyperverse, elements of the fiber $H_t$ are propositions (in the Heyting algebra sense). A term $t : p$ in the proof-theoretic reading corresponds to an element in the inclusion $[p] \hookrightarrow H_t$ — a subobject witnessing $p$'s membership in the fiber. The nucleus fixed fiber $H^*_t$ is the inhabited-by-evidence part: $p \in H^*_t$ iff there is evidence that $p$ is both meaning-settled and execution-settled — both proved and executed.

## The legal reading: admissibility and weight

In law, evidence is governed by two distinct properties:

**Admissibility**: whether evidence may be presented to the fact-finder (the jury or judge). Inadmissible evidence — hearsay, privileged communications, illegally obtained evidence — must be excluded regardless of its probative value. Admissibility is a threshold criterion: $e$ must cross it before its weight can be assessed.

Key admissibility doctrines:
- **Relevance**: $e$ is admissible only if it tends to make a fact in issue more or less probable (*Federal Rules of Evidence*, Rule 401). Irrelevant evidence is inadmissible; even relevant evidence may be excluded if its probative value is substantially outweighed by dangers of unfair prejudice (*FRE* Rule 403).
- **Hearsay**: an out-of-court statement offered to prove the truth of the matter asserted is generally inadmissible (*FRE* Rule 801). Exceptions exist (excited utterances, dying declarations, business records) where reliability can be established by other means.
- **Privilege**: communications between attorney and client, doctor and patient, spouse and spouse are privileged — inadmissible to protect the relationship, not because of unreliability.
- **Illegally obtained evidence**: under the *exclusionary rule* (*Mapp v. Ohio*, 1961), evidence obtained in violation of the Fourth Amendment (unreasonable search and seizure) is inadmissible. The fruit of the poisonous tree doctrine extends exclusion to evidence derived from the illegal evidence.

**Weight**: once admitted, evidence is assigned weight — how much influence it should have on the fact-finder's conclusion. Weight is not binary; it ranges from minimal to decisive. Expert testimony may be admitted and assigned great weight; eyewitness testimony (notoriously unreliable) may be admitted and assigned less weight despite its intuitive appeal.

**Standards of proof**: different legal contexts require different levels of evidential sufficiency:
- **Criminal**: proof beyond a reasonable doubt (~95% confidence; the standard is intentionally asymmetric to minimize false convictions)
- **Civil**: preponderance of the evidence (more likely than not; >50%)
- **Clear and convincing evidence**: intermediate standard (~75%; used for some civil claims and administrative proceedings)

The standard is not a posterior probability claim — it is a normative decision rule: given this evidence, should we find for the plaintiff/defendant? The normative standard determines when sufficient evidence has been presented to justify the institutional fact (conviction, civil judgment).

## Evidence and grounding

In this system, the concept of **grounding** is the institutional-fact analog of evidence. A GroundingClaim asserts a relationship between entity A and entity B: A grounds B. The claim is supported by evidence in exactly the evidence triple structure:

$$\mathcal{E}_{\mathrm{grounding}} = (e, \mathrm{Grounds}(A, B), R)$$

where:
- $e$ = the content of the entity file that supports the grounding claim
- $p = \mathrm{Grounds}(A, B)$ = the proposition that A grounds B
- $R$ = the grounding relation's relevance: does $e$ show that A is prior to B, that B depends on A, that there is no circularity, that the content of $e$ actually backs the claim?

A grounding claim without backing evidence fails the hyperintensionality check: even if it is true that A grounds B, a system that cannot exhibit the evidence for the grounding has not established the claim. This connects to the SOUL.md principle: "Spec only what is grounded" — only grounded claims can go in MUST clauses, because ungrounded claims have no evidence backing them.

## Nuclear reading

**Definitions.** Evidence for proposition $p$ at history $t$: $e \in H_t$ (the evidence item is present in the fiber at the current history). The proposition $p \in H_t$ has saturation status $\sigma_t(p)$ determined by the restriction profile from all predecessor histories $t_0 < t$ — the past record up to $t$.

**Proposition 1 (Evidence reception creates a new history, not a new nucleus):** The correct fiber rendering of "receiving evidence $e$ for $p$" is: taking a step $s_e$ generates a new history $t' = s_e \star t$. The nucleus at $t'$ is $\sigma_{t'}$, which may settle $p$ where $\sigma_t$ did not. The original nucleus $\sigma_t$ is unchanged by receiving $e$.

*Proof.* $\sigma_t$ is determined by restriction maps of the presheaf $H$ at $t$; $e \in H_t$ is a fiber element, not a restriction map. Receiving $e$ creates a new step; the new history $t'$ has its own restriction maps, which now include the path through $s_e$ and therefore produce a nucleus $\sigma_{t'}$ that incorporates the evidential step. □

*Consequence.* The claim "e advances p toward its fixed point: σ_t(p) ≥ p because e is in scope" conflates two things. $\sigma_t(p) \geq p$ by extensiveness ALWAYS, regardless of $e$. The correct formulation: $e$ is evidence for $p$ iff at the new history $t' = s_e \star t$, the saturation gap $[p, \sigma_{t'}(p)]$ is strictly smaller than $[p, \sigma_t(p)]$ — or $p \in \mathrm{Fix}(\sigma_{t'})$ when $p \notin \mathrm{Fix}(\sigma_t)$.

**Proposition 2 (Evidence — reception vs. admission):**
- **Reception:** $e$ reaches the fiber: $e \in H_{t'}$ at $t' = s_e \star t$. This is a historical fact about the new step.
- **Admission:** $e \in \mathrm{Fix}(\sigma_{t'})$ — the evidence item is itself saturation-settled at the new history, meaning the system's restriction profile constitutes $e$ as a recognized, established item. An inadmissible item $e \notin \mathrm{Fix}(\sigma_{t'})$: it is present in the fiber at $t'$ but not saturation-fixed. The exclusionary rule corresponds to a condition on the topology $J$: inadmissible evidence is a step $s_e$ that does not constitute a covering family in $J$, so the restriction maps at $t' = s_e \star t$ do not propagate $e$ into $\mathrm{Fix}(\sigma_{t'})$.

*Note.* The saturation nucleus $\sigma_{t'}$ does not "choose to exclude" $e$; it is determined by the restriction maps. Inadmissibility is a structural condition on which steps constitute valid extensions in the topology, not a conditional behavior of the nucleus.

**Proposition 3 (Meet of admitted evidence items is admitted):** If $e_1, e_2 \in \mathrm{Fix}(\sigma_{t'})$ (both admitted), then $e_1 \wedge e_2 \in \mathrm{Fix}(\sigma_{t'})$.

*Proof.* By meet-preservation of $\sigma_{t'}$: $\sigma_{t'}(e_1 \wedge e_2) = \sigma_{t'}(e_1) \wedge \sigma_{t'}(e_2) = e_1 \wedge e_2$. □

**Proof-theoretic reading:** A proof term $\pi : p$ witnesses inhabitation of $p$. At history $t'$ where $\pi \in \mathrm{Fix}(\sigma_{t'})$ (the proof is admitted by the system's history), $p$ enters the saturation closure: since $\pi$ entails $p$ ($\pi \leq p$ in the fiber order), and $\sigma_{t'}$ is extensive and order-preserving, $p \leq \sigma_{t'}(p)$, and if $\pi \in \mathrm{Fix}(\sigma_{t'})$ with $\pi \leq p$ then $\sigma_{t'}(\pi) = \pi \leq \sigma_{t'}(p)$, making $p$'s position in the fiber at least as settled as $\pi$.

## Open questions

- Whether the three readings (Bayesian, proof-theoretic, legal) correspond to the three nuclear quartet positions: probabilistic updating corresponds to the Derivation position (in $\mathrm{Fix}(\Delta_t) \setminus H^*_t$ — execution-settled but not meaning-settled, like evidence that has been gathered but not yet admitted); proof-term inhabitation corresponds to the Process position (in $H^*_t$ — fully settled); and legal admissibility is the transition gate between the Inquiry position (raw evidence in $H_t$) and the Derivation position.
- Whether the **evidence aggregation problem** (combining multiple pieces of evidence for the same proposition) has a canonical fiber operation — whether the join $\bigvee e_i$ in the Heyting algebra gives the combined evidential support, and whether this join respects the relevance relations $R_i$.
- Whether the Curry–Howard–Lambek correspondence gives evidence a categorical formulation as a morphism: $e : \mathrm{Context} \to p$ (a morphism in the category with propositions as objects and evidence as morphisms), and whether this makes the category of propositions into a Kleisli category for some monad encoding evidential weight.
- Whether **defeasible evidence** can be modeled as evidence that is in $\mathrm{Fix}(\sigma_t)$ at $t$ (admitted, weight given) but can fall out of $\mathrm{Fix}(\sigma_{t'})$ at $t' > t$ (defeated by new evidence at later history). This would make defeasibility a property of the history fiber — a settled claim can be unsettled — which would require relaxing the standard monotonicity assumption on $\sigma$.
