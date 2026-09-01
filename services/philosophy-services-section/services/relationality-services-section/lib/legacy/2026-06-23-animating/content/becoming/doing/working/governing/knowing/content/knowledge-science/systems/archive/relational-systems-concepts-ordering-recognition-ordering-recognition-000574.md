# Ordering Recognition

*Story.*  RecognizeContext tests when one recognition subsumes another but does not yet record the ordering relation itself.  Forcing RecognizeContext to witness Recognition yields OrderRecognition.


OrderRecognition = (RecognizeContext Recognition)


*Proof Sketch.*  Both recognitions already exist, so their composition records the act of comparing recognitions, establishing OrderRecognition.
