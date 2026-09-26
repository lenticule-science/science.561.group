---
title: "Structured Analytic Techniques"
date-created: 2026-03-06T00:00:00
type: curriculum
aliases:
  - "structured analytic techniques curriculum"
  - "SATs curriculum"
keywords:
  - political-theory
  - governance
description: "A curriculum on the structured analytic techniques developed to mitigate cognitive bias in intelligence analysis."
---

## Learning objectives

After completing this curriculum, you will be able to:

- Explain why structured analytic techniques (SATs) exist — the cognitive biases they are designed to mitigate and the institutional failures that motivated their adoption
- Apply the core SAT suite: [key assumptions check](../../../glossary/terms/key-assumptions-check.md), [analysis of competing hypotheses](../../../glossary/terms/analysis-of-competing-hypotheses.md), [red teaming](../../../glossary/terms/red-teaming.md), and indicators validation
- Assess when each technique is appropriate and when it is likely to produce diminishing returns
- Articulate the limits of structured techniques — what they can mitigate and what they cannot reach

## Prerequisites

- [Introduction to Intelligence](./introduction-to-intelligence.md) — the intelligence cycle, collection disciplines, and the adversarial condition
- Familiarity with [perception and misperception](../../../glossary/terms/perception-and-misperception.md) — Jervis's framework on cognitive bias, which provides the theoretical justification for SATs

## Lesson 1: Why structure?

Intelligence analysis without structure defaults to narrative — the analyst builds a story that fits the available evidence and presents it with confidence proportional to the story's coherence rather than the evidence's strength. [Robert Jervis](./robert-jervis.md) demonstrated that this default is not a failure of training but a property of human cognition: consistency-seeking, anchoring, and premature closure are how minds make sense of incomplete information. The 2002 Iraq WMD estimate is the canonical case — a coherent narrative supported by selectively interpreted evidence, producing a high-confidence assessment that was comprehensively wrong.

Structured analytic techniques impose procedural constraints on the analytic process to interrupt cognitive defaults. They do not make the analyst smarter; they make specific cognitive errors harder to commit without noticing.

**Self-check:** Read the [intelligence failure](../../../glossary/terms/intelligence-failure.md) concept page. For the Iraq WMD case, identify which cognitive biases (anchoring, consistency-seeking, mirror-imaging) contributed to the erroneous assessment. Could you articulate, for each bias, what structured technique might have interrupted it?

<details><summary>Answer</summary>

Anchoring to prior assessments (Iraq had used WMD in the 1980s) → key assumptions check would surface this as an assumption rather than evidence. Consistency-seeking (interpreting ambiguous indicators as confirming the existing narrative) → ACH would force comparison of the evidence against alternative hypotheses including "Iraq destroyed its WMD." Mirror-imaging (assuming Iraq would maintain WMD because "any rational actor would") → red teaming from Iraq's perspective might reveal that the sanctions regime created incentives to destroy stockpiles while maintaining ambiguity.
</details>

## Lesson 2: Key Assumptions Check

The [key assumptions check](../../../glossary/terms/key-assumptions-check.md) surfaces the unstated premises on which an assessment depends and evaluates whether they are supported by evidence or merely taken for granted.

**Exercise:** Take the following assessment from the [prewar intelligence landscape](../../../../../services/2026-iran-war-services-section/content/text/documents/articles/notes/prewar-intelligence-landscape.md) analysis: "Iran did not preemptively escalate in response to U.S. military buildup indicators because Iranian leadership assessed the buildup as coercive signaling rather than genuine preparation."

List every assumption this assessment depends on. For each assumption, identify what evidence supports it and what would change if it were false.

<details><summary>Answer</summary>

Key assumptions include: (1) Iranian leadership was aware of the buildup indicators — supported by the public nature of carrier deployments and press reporting, but assumes Iranian intelligence was monitoring and briefing leadership accurately. (2) Iranian leadership interpreted the indicators through a deterrence framework — this is itself a mirror-imaging risk, projecting a rational-deterrence calculus that may not match the regime's actual decision framework. (3) Iranian leadership had the capacity to preemptively escalate if they chose — assumes military readiness and political authority to act, which the 2025-2026 protests may have constrained. (4) The alternative to preemptive escalation was inaction — in fact, Iran may have taken preparatory actions (dispersal, hardening, mobilization) that were not publicly visible but that short of "escalation." If assumption (2) is false, the assessment should consider whether Iran knew the strikes were coming and chose to absorb them, perhaps calculating that retaliation after a first strike would generate more international sympathy than preemption.
</details>

## Lesson 3: Analysis of Competing Hypotheses

[Analysis of competing hypotheses](../../../glossary/terms/analysis-of-competing-hypotheses.md) (ACH) requires the analyst to identify multiple hypotheses, list the available evidence, and systematically evaluate which evidence is consistent or inconsistent with each hypothesis. The technique's value is diagnostic: it identifies which hypothesis is *least inconsistent* with the evidence, rather than which hypothesis the analyst finds most compelling narratively.

**Exercise:** The [diplomatic-intelligence paradox](../../../../../services/2026-iran-war-services-section/content/text/glossary/terms/diplomatic-intelligence-paradox.md) identifies three possible explanations for Iran's negotiating posture in Oman and Geneva while the U.S. was simultaneously preparing strikes:

H1: Iran's negotiators genuinely sought agreement and were unaware of the impending strikes.
H2: Iran's leadership knew strikes were likely and used negotiations to buy time or establish a diplomatic record.
H3: Iran's leadership detected strike preparations through intelligence and continued negotiations as cover for their own retaliatory preparations.

For each hypothesis, identify what evidence supports it, what evidence contradicts it, and what additional evidence would distinguish between them.

<details><summary>Answer</summary>

H1 is supported by: the Oman FM's "breakthrough" announcement (suggesting genuine progress), the reported Iranian agreement to halt enrichment. It is weakened by: the extensive public indicators of military preparation, which a competent intelligence service should have detected. H2 is supported by: Iran's history of using negotiations as a delay tactic, the implausibility that Iranian leadership was unaware of the massive military buildup. It is weakened by: the substantive concessions reportedly offered (halting enrichment), which would be costly to offer merely as a stalling tactic. H3 is supported by: the scope and speed of Iran's retaliatory strikes (suggesting pre-positioning), the Strait of Hormuz closure (suggesting advance planning). It is weakened by: the apparent effectiveness of the decapitation strike on Khamenei (if Iran anticipated the strikes, why did the Supreme Leader remain at a known compound?). The distinguishing evidence would include: Iranian military communications in the days before the strike (SIGINT), observable pre-positioning of retaliatory assets (IMINT), and testimony from surviving Iranian officials about what was known and when.
</details>

## Lesson 4: Red Teaming

[Red teaming](../../../glossary/terms/red-teaming.md) adopts the adversary's perspective — not to predict what the adversary will do (which reintroduces mirror-imaging) but to identify vulnerabilities in one's own plan or assessment that the adversary could exploit. A red team asks: if I were the adversary, what would I do with the information and capabilities available to me? What assumptions is the other side making about me that I could exploit?

**Exercise:** Red-team the U.S.-Israeli strike plan from the Iranian perspective. Given that the military buildup was publicly visible, that the diplomatic negotiations provided a timeline, and that Iran possessed its own intelligence capabilities, what defensive or offensive actions could Iran have taken before 28 February? What does the fact that Iran apparently did not take these actions tell us about Iranian intelligence and decision-making?

<details><summary>Answer</summary>

From Iran's perspective, available defensive actions included: dispersing senior leadership to prevent co-location (which would have defeated the decapitation strike), pre-positioning retaliatory assets outside known facilities, activating proxy networks preemptively, and breaking off negotiations to signal willingness to escalate. Available offensive actions included: closing the Strait of Hormuz preemptively to establish deterrence, conducting preemptive strikes against U.S. bases in the region, or accelerating nuclear breakout to create a fait accompli. That none of these occurred suggests either: Iranian intelligence failed to correctly assess the indicators (a warning failure), Iranian leadership assessed the probability of strikes as low despite the indicators (a cognitive bias — possibly consistency-seeking with the belief that negotiations would succeed), or Iranian leadership calculated that absorbing a first strike and retaliating was strategically preferable to preemption (a rational calculation if international legitimacy was valued). The red team exercise reveals that the U.S.-Israeli plan was vulnerable to any of these preemptive actions, and its success depended on the assumption that Iran would not take them — an assumption that itself warranted a key assumptions check.
</details>

## Lesson 5: Limits of structure

Structured techniques mitigate cognitive bias; they do not eliminate it. The technique's output is only as good as the hypotheses the analyst generates (ACH cannot evaluate hypotheses no one proposed), the assumptions the analyst can articulate (KAC cannot surface assumptions invisible to the analyst's framework), and the adversary model the red team adopts (red teaming from within one's own strategic culture reproduces mirror-imaging under a different name).

More fundamentally, structured techniques address individual cognitive bias but not institutional bias — the organizational cultures, incentive structures, and bureaucratic politics that shape what questions are asked, what evidence is collected, and what assessments are rewarded. The Iraq WMD estimate was produced by analysts who had access to structured techniques; the failure was not the absence of tools but the institutional environment in which the tools were used.

**Self-check:** Identify a case where a structured analytic technique would have been unlikely to prevent the failure, and explain why. What would have been needed instead?

<details><summary>Answer</summary>

The [diplomatic-intelligence paradox](../../../../../services/2026-iran-war-services-section/content/text/glossary/terms/diplomatic-intelligence-paradox.md) illustrates a case where SATs would have been insufficient. Even if the analysts supporting negotiations had conducted a key assumptions check on "the diplomatic track is genuine," the institutional structure — in which the same intelligence community simultaneously supported diplomacy and strike planning — would have made it impossible for the analyst to act on the surfaced assumption. The problem is not cognitive but structural: the analyst's honest assessment is rendered irrelevant by a policy process operating on a different track. What would have been needed is institutional separation between the diplomatic and military intelligence support functions — a structural fix, not an analytic technique.
</details>

## Next steps

- Apply these techniques to the [2026 Iran war analysis](../analyses/2026-iran-war/index.md) texts as worked exercises
- Study the [intelligence failure](../../../glossary/terms/intelligence-failure.md) concept page for additional cases where structured techniques were or were not applied
- Read [The Structural Expectation of Failure](./the-structural-expectation-of-failure.md) for the argument that no technique eliminates the structural vulnerability
