---
title: Ordering Provability
description: Story.
---
# Ordering Provability

*Story.*  Typing judgements encode entailment between types under a context, but we require the explicit preorder that records this entailment.  JudgeTyping witnessing ImplyRecognition yields OrderProvability.


OrderProvability = (JudgeTyping ImplyRecognition)


*Proof Sketch.*  Composing the judgement with implication records precisely when a context proves that type A implies type B, so OrderProvability follows.
