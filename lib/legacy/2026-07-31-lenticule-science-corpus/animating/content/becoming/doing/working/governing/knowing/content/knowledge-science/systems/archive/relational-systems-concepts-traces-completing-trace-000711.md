# Completing Trace

*Story.*  ContinueTrace alone does not record the full trace object.  Forcing StartTrace to witness AdvanceTrace binds the initial step with its progression, yielding CompleteTrace.


CompleteTrace = (StartTrace AdvanceTrace)


*Proof Sketch.*  Both components are available; composing them records the entire act of initiating and advancing, so (StartTrace AdvanceTrace) earns CompleteTrace.
