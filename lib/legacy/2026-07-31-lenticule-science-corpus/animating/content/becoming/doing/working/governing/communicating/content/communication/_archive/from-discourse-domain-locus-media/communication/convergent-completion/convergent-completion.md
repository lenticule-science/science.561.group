---
title: "Convergent Completion"
description: "The operational test for accountable closure: independent qualified readers performing the closure arrive at compatible completions. The criterion that distinguishes earned completion from invention."
date-created: 2026-05-02
aliases: [convergent-completion]
defines: [convergent-completion]
---

Convergent completion is the operational answer to the question, "How do I know whether a closure I asked the reader to perform was accountable?" The test is procedural: present the artifact to several qualified readers, have them independently perform the closure, and check whether they arrive at compatible completions. If they do, the artifact has licensed the closure adequately and the closure was [acceptable](acceptable-gap.md). If they diverge, the artifact left the closure underdetermined and the closure was [unaccountable](unaccountable-closure.md).

The test is operational because no a priori inspection of the artifact is sufficient. The same gap can be acceptable for one audience and not for another; the only ground truth is what audience members can actually do. Practices that take their gap discipline seriously have institutionalized convergent-completion checks: the seminar where the audience reconstructs the proof from notes, the design review where multiple engineers must implement the same spec and produce compatible behavior, the editorial test where a passage is read by several copy editors who must agree on what it commits to.

## What convergence looks like

Compatible does not mean identical. A proof's closure may be performed differently by two readers — one expanding the algebra, the other invoking the corresponding lemma — and both performances may be acceptable as long as they yield the same conclusion and respect the artifact's hypotheses. A spec's closure may be implemented in different code by different engineers and still be convergent if the resulting behavior is the same. Convergence is convergence on what the artifact is committing to, not convergence on the form of the completion.

Divergence is a diagnostic signal. When two qualified readers reach incompatible completions, the artifact has under-constrained somewhere. The repair is to identify the under-constrained move, decide whether to license it more tightly (add constraint) or to weaken the artifact's claim (acknowledge that the conclusion is conditional on a closure-choice the reader is making), and update the artifact accordingly.

## Distinguishing convergence from agreement

The test requires *qualified* readers. Asking unqualified readers and finding they all agree on a wrong completion is not convergence; it is shared misunderstanding. The qualification is the practice's own determination of who counts as a competent member of the audience the artifact addresses. A practice without that determination cannot run the test and so cannot tell, in any principled way, whether its artifacts are licensing their closures or not.
