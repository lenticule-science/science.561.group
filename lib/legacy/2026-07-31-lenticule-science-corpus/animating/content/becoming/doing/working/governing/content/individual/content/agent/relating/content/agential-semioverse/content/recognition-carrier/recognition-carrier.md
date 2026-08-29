---
title: Recognition Carrier
keywords:
  - recognition
  - carrier
  - trace
  - policy
layer: spec
status: plan
depends_on:
  - calculus/structure/recognition-carrier
---
# Recognition Carrier

This specification instantiates the **Recognition Carrier Structure** by fixing concrete carriers for state, carrier payloads, traces, and policy snapshots that together represent points of the recognition-carrier structure.

## 1. Types (carriers)

Implementations must provide concrete types that instantiate the four components in the theorem, specialised to the earned global state and policy carriers.

- **Relational state type (`RelationalState`).**  
  A concrete type representing a relational state `r`. It must:
  - be losslessly mappable to and from sections of the quasicrystalline
    hypertensor sheaf (`Section` in the universal‑state / hypertensor specs),
  - and be stable (up to isomorphism) under the earned flow/nucleus dynamics.
  In the kernel machine specification this is written as:
  `RelationalState := Section`.

- **Carrier payload type (`Carrier`).** A typed payload `c` representing the earned recognition of the state.
  It must:
  - be a schema-referenceable type (for example, a Pydantic model),
  - enforce the invariants of the judgement used by the recognition operator.

- **Trace step type (`TraceStep`).**  
  A type encoding a single admissible derivation step:
  - records the earned act or judgement identifier,
  - records enough input/output references (for example, term/recognition
    IDs, snapshot IDs, context IDs) to replay the step using the trace
    infrastructure,
  - carries an explicit position/index along the trace.

- **Trace type (`Trace`).**  
  A type encoding a finite, ordered sequence of `TraceStep` values:
  - each element records the act or judgement it witnesses,
  - the entire value can be replayed against the trace infrastructure to
    reconstruct the earned judgement “the criterion holds of `(r, c)`”.

- **Policy snapshot type (`PolicySnapshot`).** A type representing the policy state `p` at recognition time:
  - the potential policy identifiers,
  - the guards/warrants evaluated and their outcomes,
  - decisions that affect downstream composition.

  - **Recognition carrier type (`RecognitionCarrier`).** A composite type with fields

  ```text
  state   : RelationalState
  carrier : Carrier
  trace   : Trace
  policy  : PolicySnapshot
  ```

that corresponds to a point `(r, c, (tau), p)` of the recognition-carrier structure.

## 2. Operators (projections and relations)

Implementations must provide:

- Projection functions:

  ```text
  get_state(rec : RecognitionCarrier)   -> RelationalState
  get_carrier(rec : RecognitionCarrier) -> Carrier
  get_trace(rec : RecognitionCarrier)   -> Trace
  get_policy(rec : RecognitionCarrier)  -> PolicySnapshot
  ```

- A predicate for **trace extension**:

  ```text
  is_trace_extension(rec : RecognitionCarrier,
                     rec_prime : RecognitionCarrier) -> bool
  ```

which returns true exactly when the two values share `state`, `carrier`, and `policy`, and the trace of `rec_prime` is an extension of the trace of `rec`.

- A predicate for **policy refinement**:

  ```text
  is_policy_refinement(rec : RecognitionCarrier,
                       rec_prime : RecognitionCarrier) -> bool
  ```

which returns true exactly when the two values share `state`, `carrier`, and `trace`, and the policy of `rec_prime` is a refinement of the policy of `rec` in the sense of the policy stack.

- A predicate for **stability**:

  ```text
  is_stable(rec : RecognitionCarrier) -> bool
  ```

which returns true exactly when the carrier component is invariant under re-recognition with the same criterion and policy, and any change is expressible as trace extension and/or policy refinement.

## 3. Invariants

Recognition carriers must satisfy:

- **Trace soundness.** The trace component must be replayable as an admissible derivation over the underlying state and carrier payload, matching the judgement asserted by the recognition operator.

- **State–carrier consistency.** The carrier payload must be derivable from the state via earned acts; arbitrary payloads that cannot be justified by a trace are not recognition carriers.

- **Policy consistency.** The policy snapshot must be compatible with the policy stack: it must not claim guards or warrants that the current discipline/filter/regime data do not support.

## 4. Outputs

Implementations of this spec produce concrete recognition carriers that other specs and runbooks can consume.
Higher-level recognition endpoints are required to land in this carrier type and uphold the invariants above.
