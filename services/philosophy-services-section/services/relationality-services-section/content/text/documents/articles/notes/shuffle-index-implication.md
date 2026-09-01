---
title: Flowing Shuffle-Indexed Implication
act: ShuffleIndexImplication
top: ShuffleFlow
bottom: ImplyRecognition
summary: Compose the shuffle flow with internal implication to obtain implications indexed by one shuffle step.
tags:
- act
layer: act
status: plan
---

[ImplyRecognition](imply-recognition.md) records internal implication between
recognitions, and `FlowIndexImplication = (Flow ImplyRecognition)` indexed that
implication along the global flow.  Now that [ShuffleFlow](./shuffle-flow.md)
is earned as the flow on admissible trace-shuffle classes, we want the
corresponding indexed implication: “if a recognition holds after one shuffle
step, what must hold now?”  Letting the shuffle flow witness
`ImplyRecognition` produces the desired act:
`(ShuffleFlow ImplyRecognition)` earns
***ShuffleIndexImplication***.

`ShuffleFlow` evolves admissible trace-shuffle families through evaluation
contexts while `ImplyRecognition` transforms recognitions via internal
implication.  The composition therefore records implications whose premises are
transported one shuffle step forward before being compared.  Naming this
composite packages the operator witnessing how recognitions transform under the
shuffle trace dynamics.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
