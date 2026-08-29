---
title: "Supports"
description: "Support is a relation E supports H — evidence E supports hypothesis H — asserting that E raises the credibility or probability of H without being sufficient to establish H alone. The defining structure: support is a partial evidential relation, weaker than grounding (which provides complete foundation) and weaker than implication (which provides deductive necessity). E supports H without entailing H; multiple independent items of evidence may support the same hypothesis, and H could be true or false regardless of E in extreme cases. Support is the central relation of confirmation theory — the study of how evidence bears on hypotheses."
defines: Supports
related: Grounding, Satisfies, Refines, Derivation, BayesianConfirmation, ToulminArgument
date-created: 2026-03-20
---

## Formal definition

**Support** is a binary relation $E \succ H$ (read: $E$ supports $H$):

$$(E : \mathrm{Evidence},\; H : \mathrm{Hypothesis})$$

where: - $E$ is the **evidence** — the information, observation, argument, or fact that bears on $H$; $E$ may be a data point, an experimental result, a theoretical consideration, or a background assumption; $E$ is the supporting item - $H$ is the **hypothesis** — the claim, proposition, or theory that $E$ supports; $H$ is the supported item; $H$ may be a specific empirical prediction, a general theory, or a principle

**The support relation** $E \succ H$ holds when $E$ **raises the credibility** of $H$ — $H$ is more likely true, better grounded, or more warranted given $E$ than without it.
Support is a graded, partial relation: stronger evidence gives stronger support; support is not binary.

**One invariant.** $E \succ H$ iff:

1. **Positive relevance**: $E$ makes $H$ more credible than $H$ is in the absence of $E$.
  Formally in the probabilistic account: $P(H \mid E) > P(H)$. $E$ is **irrelevant** to $H$ if $P(H \mid E) = P(H)$. $E$ is **negative evidence** for $H$ (undermines $H$) if $P(H \mid E) < P(H)$.
  Positive relevance distinguishes genuine support from neutral information.

**Support is not grounding**: grounding provides the complete mathematical foundation for $H$ — the unique sufficient reason.
Support provides partial evidence — $H$ can have multiple independent supports, and $H$ could be true without any of them (through other evidence).
The relation $E$ grounds $H$ implies $E \succ H$, but $E \succ H$ does not imply $E$ grounds $H$.

**Support is not implication**: $E \Rightarrow H$ (logical implication) means $H$ is necessarily true whenever $E$ is true — the support is deductive and complete. $E \succ H$ (support) means $E$ raises $H$'s probability but does not necessitate $H$ — the relation is inductive and partial.

## Carnap: inductive logic and degrees of confirmation

Rudolf Carnap (*Logical Foundations of Probability*, 1950; *The Continuum of Inductive Methods*, 1952) developed **inductive logic** as a formal theory of the support relation:

Carnap distinguishes two notions of probability: - **Probability$_1$** (logical or epistemic probability): the degree of support — the degree to which evidence $E$ confirms hypothesis $H$, denoted $c(H, E)$ (the **confirmation function**) - **Probability$_2$** (empirical probability): the relative frequency of an event in the long run

The **confirmation function** $c(H, E)$ is a function from hypothesis-evidence pairs to real numbers in $[0, 1]$, satisfying: - $c(\neg H, E) = 1 - c(H, E)$ (negation complement) - $c(H_1 \vee H_2, E) = c(H_1, E) + c(H_2, E)$ when $H_1$ and $H_2$ are logically exclusive - $c(H, E_1 \wedge E_2) = c(H, E_1) \cdot c(H \mid E_1, E_2)$ (product rule)

$E$ **confirms** $H$ relative to background $K$ iff $c(H, E \wedge K) > c(H, K)$ — the evidence raises $H$'s confirmation above its background level.
This is Carnap's formal definition of support.

Carnap's **lambda continuum**: a parameterized family of confirmation functions $c_\lambda$ indexed by $\lambda \in [0, \infty)$, capturing the degree of reliance on prior (inductive bias) vs evidence.
At $\lambda = 0$: pure frequency-based (no prior); at $\lambda \to \infty$: pure prior-based (ignores evidence).
The continuum of inductive methods is the space of possible evidential support relations, not just one fixed relation.

## Hempel: qualitative confirmation theory

Carl Hempel (*Studies in the Logic of Confirmation*, 1945, *Mind*) gave the first systematic qualitative theory of support/confirmation:

Hempel's **satisfaction criterion**: evidence $E$ confirms hypothesis $H$ iff $E$ satisfies $H$ in the sense that $E$ includes all instances that $H$ predicts (the universal hypothesis "all ravens are black" is confirmed by evidence "this black raven").

Hempel identifies three **adequacy conditions** for a confirmation relation: 1. **Entailment condition**: if $E \Rightarrow H$, then $E$ confirms $H$ — logical implication is a limit case of support 2. **Consistency condition**: a consistent body of evidence cannot confirm two mutually exclusive hypotheses 3. **Equivalence condition**: if $E$ confirms $H$ and $H \equiv H'$, then $E$ confirms $H'$ — support respects logical equivalence of hypotheses

The **paradox of confirmation** (Hempel 1945): "All ravens are black" ($H$) is logically equivalent to "All non-black things are non-ravens" ($H'$).
By the equivalence condition, if "this white shoe" confirms $H'$, it also confirms $H$.
This is the **raven paradox**: a white shoe appears to confirm the raven hypothesis, which seems absurd.
Hempel accepts the result: in principle, any non-black non-raven is confirming evidence for the raven hypothesis, though very weak evidence.

The raven paradox shows that support is sensitive to the **reference class**: the white shoe confirms the hypothesis within the reference class of "non-black things" but not within the narrower class of "ravens."
Different reference classes yield different support judgments.

## Toulmin: argument structure and backing

Stephen Toulmin (*The Uses of Argument*, 1958) developed a model of argument structure that distinguishes several roles for supporting evidence:

**The Toulmin argument model** has six components: 1. **Claim** ($C$): the conclusion being argued for 2. **Data/Grounds** ($D$): the evidence (facts, data) supporting the claim; $D \succ C$ 3. **Warrant** ($W$): the rule or principle that licenses the move from $D$ to $C$; "given $D$, so $C$ because $W$" 4. **Backing** ($B$): support for the warrant $W$ itself; $B \succ W$ 5. **Qualifier** ($Q$): the degree of confidence in the claim (necessarily, probably, presumably) 6. **Rebuttal** ($R$): conditions under which the warrant does not apply; exceptions to $W$

The **support hierarchy**: $B$ supports $W$; $W$ licenses the move from $D$ to $C$; $D$ supports $C$.
Support is transitive through the warrant: if $B \succ W$ and $W$ licenses $D \Rightarrow C$, then $B$ transitively supports $C$.

**Backing vs grounding**: Toulmin's backing $B$ provides support for the warrant — it makes the warrant credible, but does not logically entail the warrant.
If $B$ were the complete logical foundation for $W$ (making $B \Rightarrow W$ analytically), then $B$ would ground $W$; otherwise $B$ merely supports $W$.

The Toulmin model makes explicit that in real argumentation, support is **layered**: we support conclusions with data, warrants license the inference, and backings support the warrants.
Each layer involves a distinct support relation — none is deductively complete.

## Bayesian confirmation theory

Bayesian confirmation theory (Good 1950; Howson & Urbach, *Scientific Reasoning: The Bayesian Approach*, 1989) formalizes support using conditional probability:

$E$ **confirms** $H$ iff $P(H \mid E) > P(H)$ — the probability of $H$ given $E$ exceeds $H$'s prior probability.
This is the **positive relevance** account of confirmation.

**Measures of degree of support**: - **Difference measure**: $c(H, E) = P(H \mid E) - P(H)$ - **Ratio measure**: $c(H, E) = P(H \mid E) / P(H)$ - **Log-likelihood ratio**: $c(H, E) = \log P(E \mid H) / P(E \mid \neg H)$ (Bayes factor)

**Bayesian updating**: when evidence $E$ is received, beliefs update by Bayes' theorem:

$$P(H \mid E) = \frac{P(E \mid H) \cdot P(H)}{P(E)}$$

The support relation is dynamically maintained: each new piece of evidence updates $P(H \mid -)$, making support a real-time relation that tracks the epistemic state.

## Open questions

- Whether the Bayesian account of support (probabilistic relevance) is the right formal foundation for the support relation in a non-probabilistic setting — whether support can be given a formal definition in terms of the Heyting algebra structure of the history fiber without invoking probability.
- Whether there is a topological account of support — whether $E$ supports $H$ iff $E$ is in the **interior** of a neighborhood of $H$ in some topology on propositions, making strong support the condition that $E$ is close to $H$ in the epistemic topology.
