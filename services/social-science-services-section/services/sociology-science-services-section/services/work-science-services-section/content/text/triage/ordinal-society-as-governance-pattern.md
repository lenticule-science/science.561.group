---
type: question
status: open
explores: [governance-pattern, score-governed-authority-gate, normative-system, polity]
---

# Does the ordinal society constitute a governance pattern in the PredGov sense?

The [ordinal-society](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/terms/ordinal-society.md) term (Fourcade and Healy) describes a society organized through algorithmic ranking and scoring systems that distribute life chances along continuous ordinal scales. [Governance-pattern](concepts/governance-pattern.md) in PredGov is a closure-rule fragment plus witness language plus recognition discipline. The question is whether the ordinal society's ranking apparatus is a definite governance pattern with a cohomological signature distinguishable from the Hohfeldian, consensus, rotational, and other named patterns.

## The claim to formalize

If the ordinal society is a governance pattern, it has:

1. **A closure-rule fragment:** score-governing rules — rules whose antecedents reference aggregate score cells and whose consequents assert access-granted or access-denied cells. These are threshold-comparison rules on continuous-valued cells.

2. **A witness language:** behavioral-trace increments — observational cells recording behavioral events (clicks, durations, locations, transactions) that feed into score computation. The witness language is the language of behavioral observables.

3. **A recognition discipline:** score-based recognition — entities are recognized as standing to receive resources/opportunities not by explicit social acts (investiture, installation, certification) but by their score cell exceeding a threshold. Recognition is automatic and continuous, not ceremonial and discontinuous.

## Sub-questions

### (a) Is the score-governed governance pattern a well-formed PredGov governance pattern?

[Tradition-pluralism-as-fragment-coproduct](theorems/tradition-pluralism-as-fragment-coproduct.md) shows that governance patterns coexist as coproducts of their closure-rule fragments. Is the score-governed pattern's fragment — threshold-comparison rules on continuous-valued cells — a well-formed fragment in the closure-rule-language sense? The threshold comparison $v(\langle S, \texttt{score}\rangle) \geq \theta$ is a real-valued inequality, not a bilattice-valued assertion. Does the closure-rule language as currently defined accommodate real-valued antecedents, or does the score-governed pattern require an extension?

### (b) What is the cohomological signature of score-governed governance?

[Cohomological-signature-of-traditions](theorems/cohomological-signature-of-traditions.md) assigns each governance tradition a characteristic cohomology class. What is the score-governed pattern's class? Candidates:

- The pattern's $H^0$ (connected components) might capture the number of distinct threshold-defined strata — the ordinal positions at which access conditions change.
- The pattern's $H^1$ (obstructions) might capture the instability of score-governed standing — the fact that access can be lost as well as gained (non-monotone in the knowledge order), producing potential for oscillation rather than stable settling.

### (c) Does surveillance capitalism formalize as a score-governed pattern plus a behavioral-extraction closure rule?

The [surveillance capitalism](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/terms/surveillance-capitalism.md) analysis adds a fourth step to the ordinal society's structure: the behavioral-modification feedback loop, where the platform's design nudges subjects toward more-predictable behavioral patterns. In the substrate: the platform's closure-rule system includes not only score-computation rules (step 2) but also behavioral-modification rules (step 4) — rules that fire on the gap between current and predicted behavior and produce "nudge" increments (notification design, content ranking adjustments) that push the subject's behavioral trace toward the platform's model. The question is whether this feedback loop is a definite structural addition to the score-governed pattern — a new closure-rule subfamily — or whether it is an emergent property of the score-computation rules applied continuously.

### (d) Is score-governed recognition compatible with Hohfeldian recognition?

In the Hohfeldian pattern, recognition (that an agent holds an office, has standing, is an incumbent) is established by explicit social acts — investiture, certification, installation. Score-governed recognition is automatic: no act is required; the score crossing the threshold is sufficient. Do these recognition disciplines coexist peacefully in the governance-pattern coproduct, or do they generate norm-conflict when both are operative? The formal question: do the score-governed recognition rules and the Hohfeldian recognition rules produce compatible consequents on the same recognition cells, or do they produce $\top$-states requiring adjudication?
