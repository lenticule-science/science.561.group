# Contextualizing Trace

*Story.*  A named trace requires a record that couples the naming with the whole trace.  Forcing AssignTrace to witness CompleteTrace yields the act ContextualizeTrace.


ContextualizeTrace = (AssignTrace CompleteTrace)


*Proof Sketch.*  AssignTrace and CompleteTrace have been earned, so their composition records the full named trace structure, confirming ContextualizeTrace.
