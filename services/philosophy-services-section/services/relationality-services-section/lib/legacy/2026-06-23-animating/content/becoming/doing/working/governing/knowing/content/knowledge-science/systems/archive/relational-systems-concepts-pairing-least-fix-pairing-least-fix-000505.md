# Pairing Least Fix

*Story.*  Application terms support repeated self-application, but the stabilized self-reference remains unspecified.  Letting FormApplicationTerm witness HeadTrace induces PairLeastFix.


PairLeastFix = (FormApplicationTerm HeadTrace)


*Proof Sketch.*  Using only earned recognitions, (FormApplicationTerm HeadTrace) records the self-application necessary for a fixpoint, so PairLeastFix follows.
