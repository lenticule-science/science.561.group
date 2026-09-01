# Maintaining Invariant

*Story.*  Flow fixed points that remain states represent invariants.  FixFlow witnessing PhysicsState produces StabilizeInvariant.


StabilizeInvariant = (FixFlow PhysicsState)


*Proof Sketch.*  This composition uses earlier recognitions and records precisely those states fixed by the flow, so StabilizeInvariant follows.
