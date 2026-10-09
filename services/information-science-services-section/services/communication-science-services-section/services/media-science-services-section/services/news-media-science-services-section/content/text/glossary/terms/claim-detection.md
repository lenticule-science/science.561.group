---
name: Claim Detection
description: The task of scoring or classifying spans of text for whether they contain a checkable factual claim, established as check-worthiness classification by Hassan et al.'s ClaimBuster (KDD 2017) and sustained since 2018 as the one task present in every edition of the CLEF CheckThat! shared-task lab, forming the first-stage gate of any claim-extraction pipeline.
date-created: 2026-08-22
aliases: ["check-worthiness detection", "check-worthy claim identification", "claim spotting"]
instance-of: systems-pattern
---

Claim detection is the classification task of deciding whether a sentence (or shorter span) asserts something checkable — a factual, falsifiable proposition — as opposed to opinion, question, or non-substantive text.
Hassan et al. operationalized it as a supervised "claim spotter" trained on human-labeled U.S. presidential-debate sentences, scoring each sentence from 0 to 1 on checkability using features such as past-tense verbs, numbers, dates, and named entities, as part of the three-component ClaimBuster pipeline (claim monitor, claim spotter, claim matcher).
Source: [Hassan et al., "Toward Automated Fact-Checking: Detecting Check-worthy Factual Claims by ClaimBuster," KDD 2017](https://dl.acm.org/doi/10.1145/3097983.3098131).
The task was deployed, not just benchmarked: Duke Reporters' Lab's Tech & Check Cooperative combined ClaimBuster's scoring with speech-to-text and its own matching code to surface live fact-checks during 2020 U.S. election broadcasts.
Source: [Duke Reporters' Lab, Tech & Check Cooperative](https://reporterslab.org/tech-and-check/).

Claim detection has since become a standing shared-task line: the CLEF CheckThat! lab's Task 1 (check-worthiness estimation) is the only task that has run in every edition since the lab began, reaching its seventh edition in 2024 across fifteen languages, with Task 1 alone drawing 75 registered teams (the lab as a whole drew 130 registered teams, 46 of which participated) [corrected: 75 is Task 1's own registration count per the Task 1 overview paper, not a lab-wide figure].
Source: [Overview of the CLEF-2024 CheckThat! Lab](https://link.springer.com/chapter/10.1007/978-3-031-71908-0_2).
For the claim infrastructure, claim detection is the transform that produces the discrete unit — a candidate claim — that every later stage (natural-language inference against evidence, claim-state tracking, correction propagation) operates on; a claim never spotted at this stage cannot later be versioned, corrected, or conformance-checked.

See the fuller discussion in the [study of claim extraction and grounded generation engineering](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-claim-extraction-and-grounded-generation-engineering.md), Section 1.
