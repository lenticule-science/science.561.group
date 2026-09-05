---

title: Profile Flow
tags:
  - flow
  - geometry
  - profile
  - trace
  - shuffle
  - nucleate
depends-on:
  - start-trace
  - advance-trace
  - continue-trace
  - complete-trace
  - head-trace
  - tail-trace
  - trace-step
  - renew-trace
  - rehead-trace
  - retail-trace
  - restep-trace
  - decompose-trace
  - shuffle-trace
  - collapse-shuffle
  - shuffle-flow
  - shuffle-profile-recognitions
form: research
# Theorem (Profile Flow)

Let `T₀`, `T₁`, `T₂`, … be the completed trace recognitions obtained by iterating
the earned trace acts (`StartTrace`, `AdvanceTrace`, `ContinueTrace`,
`CompleteTrace`) together with head–tail progress recognitions
(`HeadTrace`, `TailTrace`, `TraceStep`, `ReheadTrace`, `RetailTrace`,
`RestepTrace`).  Let [DecomposeTrace](../../acts/decompose-trace.md) and
[ShuffleTrace](../../acts/shuffle-trace.md) be the recognitions that
(i) exhibit each `Tₙ` as a composite of two smaller traces and
(ii) record the free shuffle structure on their progress steps.

Define `Reorder(Tₙ)` to be the admissible shuffle class of trace-progress
recognitions produced from `Tₙ` using `ShuffleTrace`, and let `(Fₙ)` denote the
sequence determined by
$$
F_0 = 1,\quad F_1 = 1,\quad F_{n+2} = F_{n+1} + F_n,
$$
which coincides with the classical Fibonacci numbers.
Then:

1. **Decomposition.**  
   `DecomposeTrace` witnesses that for each `n ≥ 2`, the completed trace `Tₙ`
   factors (up to admissible commutations) into predecessors, splitting its
   progress steps into those belonging to `Tₙ₋₁` and `Tₙ₋₂`.

2. **Free shuffle.**  
   `ShuffleTrace` witnesses that admissible commutations form a free shuffle
   structure: any permutation of independent steps generates a distinct
   syntactic trace in `Reorder(Tₙ)`, and all such permutations remain
   admissible.

3. **Collapse modulo shuffle.**  
   [CollapseShuffle](../../acts/collapse-shuffle.md) witnesses that
   [Nucleate](../../acts/nucleate.md) identifies exactly those traces whose
   syntactic difference is explained by admissible shuffles: two completed
   traces are nucleus-equivalent iff they lie in the same `Reorder(Tₙ)` class.

4. **Recurrence on reorderings.**  
   As a consequence of (1)–(3),
   $$
   |\,\Reorder(T₀)\,| = 1,\quad |\,\Reorder(T₁)\,| = 1,\quad
   |\,\Reorder(Tₙ)\,| = |\,\Reorder(Tₙ₋₁)\,| + |\,\Reorder(Tₙ₋₂)\,|
   $$
   for `n ≥ 2`, so `|\,\Reorder(Tₙ)\,| = Fₙ`.

5. **Flow and profile.**  
   Inside [ShuffleGeometry](../../acts/shuffle-geometry.md) and
   [ShuffleProfileSemantics](../../acts/shuffle-profile-semantics.md),
   [ShuffleFlow](../../acts/shuffle-flow.md) acts on the classes
   `Reorder(Tₙ)` as a dynamics whose orbits are the admissible trace-shuffle
   families, and
   [ShuffleProfileRecognitions](../../acts/shuffle-profile-recognitions.md) is
   precisely the collection of recognitions invariant under both
   `ShuffleFlow` and `Nucleate`, depending only on the stage `n`.

## Proof sketch

1. `DecomposeTrace` is earned by combining `HeadTrace` and `TailTrace` with
   `TraceStep`, `RenewTrace`, `ReheadTrace`, `RetailTrace`, and `RestepTrace`,
   showing any completed trace breaks into a leading subtrace and a re-entering
   remainder matching the shapes of `Tₙ₋₁` and `Tₙ₋₂`.

2. `ShuffleTrace` packages the commuting behavior of progress recognitions:
   reheading before restepping or vice versa yields syntactically different but
   admissible traces, and no further equalities arise, so the shuffle is free.

3. `CollapseShuffle` records that `Nucleate` equates traces precisely when they
   differ by admissible shuffles, so nucleus-equivalence classes coincide with
   the `Reorder(Tₙ)` classes.

4. Decomposition plus free shuffle imply that `Reorder(Tₙ)` splits into reorderings
   beginning with a `Tₙ₋₁` progress and those beginning with a `Tₙ₋₂` progress.
   This yields the recurrence defining `Fₙ`, so `|Reorder(Tₙ)| = Fₙ` inductively.

5. `ShuffleFlow = (Flow ShuffleTrace)` evolves shuffle classes along evaluation
   contexts, and `CommuteShuffleFlowAndNucleus` ensures this dynamics respects
   nucleus equivalence.  `ShuffleProfileRecognitions` then isolates the
   recognitions invariant under this action, so they depend only on the stage
   `n`.  Restricting `StructureSemantics` to these recognitions yields the
   claimed profile semantics.

This completes the characterization of the profile flow inside the relational
flow–geometry–profile stack.
