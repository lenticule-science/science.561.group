---

name: order-recognition
act: OrderRecognition
slug: order-recognition
symbol: "\u2264"
top: RecognizeContext
bottom: Recognition
summary: '*Recognize Context* tests when one recognition subsumes another but does not yet record the ordering relation itself. Forcing *Recognize Context* to witness *Recognition* yields ***Order Recognition*** (`OrderRecognition`).'
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

*Recognize Context* tests when one recognition subsumes another but does not yet record the ordering relation itself.  Forcing *Recognize Context* to witness *Recognition* yields ***Order Recognition*** ([OrderRecognition](order-recognition.md)).

Both recognitions already exist, so their composition records the act of comparing recognitions, establishing *Order Recognition*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
