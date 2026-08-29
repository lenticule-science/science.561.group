---
type: concept
class: substrate-discipline
depends-on: [self-representation, governance, governance-as-modal-restriction, governance-decision-modal-decidability, vocabulary, principal, hash-discipline]
see-also: [authentication-flow, repair, backup-discipline, recovery-discipline, opportunistic-scheduling-loop]
---

# Substrate policy

The substrate's *discipline of policy decisions recorded as substrate content* — retention windows, rate limits, encryption requirements, dispatch preferences, repair recipes, scheduling priorities, expiry defaults. Where individual operations execute the substrate's algebra, *policy* declares the parameters those operations consult: which retention window applies to this content, which rate limit applies to this peer, which repair recipe applies to this $\top$-cell.

In the substrate's hyperdoctrine setting, substrate policy is *substrate-content predications declaring per-scope/per-principal/per-operation-class parameters that closure rules read at decision time*. Per [self-representation](self-representation.md), policy is content; per [governance-decision-modal-decidability](../theorems/governance-decision-modal-decidability.md), policy changes are governance decisions — the substrate's $\Box_R$ check applies to who can change which policies.

## Why this concept exists

Many PredComp concepts reference "the substrate's policy" or "per the substrate's policy":

- [backup-discipline](backup-discipline.md): "backup retention policy"
- [snapshot](../objects/snapshot.md): "snapshot retention policy"  
- [compaction](compaction.md): "compaction policy"
- [encryption](encryption.md): "encryption policy"
- [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md): "federation peer admission policy"
- [authentication-flow](theories/interactive-application-platform/concepts/authentication-flow.md): "authentication-method policy"
- [opportunistic-scheduling-loop](opportunistic-scheduling-loop.md): "scheduling priority policy"
- [repair](repair.md): "repair recipe policy"
- [resource-budget](resource-budget.md): "budget allocation policy"
- [user-state-predications](theories/interactive-application-platform/concepts/user-state-predications.md): "notification preferences"
- [metric](metric.md): "metric retention policy"
- [trace](trace.md): "trace export policy"

Each treats "policy" as something the substrate has, but policy itself isn't a concept. The result: implementations may treat policy as runtime configuration (config files, environment variables), breaking the substrate's [self-representation](self-representation.md) discipline, the [witness-chain-as-proof-object](../theorems/witness-chain-as-proof-object.md) audit, and the [conformance](conformance.md) testability.

This concept names the policy discipline so it has a structural reference.

## Policy structure

A substrate policy is a substrate cell:

```json
{
  "kind": "substrate-policy",
  "policy-id": "<canonical hash>",
  "policy-class": "<retention | rate-limit | encryption | dispatch | repair | scheduling | etc.>",
  "scope": {
    "kind": "global | per-scope | per-principal | per-operation-class | per-resource",
    "<scope-specific reference>"
  },
  "parameters": {
    "<policy-class-specific parameters>"
  },
  "established-at-ordinal": <substrate ordinal>,
  "established-by": "<authority-record-hash>",
  "valid-from-ordinal": <substrate ordinal>,
  "valid-until-ordinal": <substrate ordinal | null>,
  "supersedes": "<prior-policy-id | null>",
  "signature": {<authority signature>}
}
```

Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the policy-id is the canonical-form hash. Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), the authority's signature binds the policy.

## Common policy classes

### Retention policy

Per [backup-discipline](backup-discipline.md), [snapshot](../objects/snapshot.md), [event-log](../objects/event-log.md), [trace](trace.md), [metric](metric.md):

```json
{
  "policy-class": "retention",
  "parameters": {
    "kind": "fixed-window | exponential-decay | compliance-bound",
    "window": "<duration like '90 days' | tier list | regulation reference>",
    "compaction-after": "<duration before compaction begins>",
    "delete-after": "<duration after which content is forensically deleted>"
  }
}
```

### Rate-limit policy

Per [federation-envelope](federation-envelope.md), [authentication-flow](theories/interactive-application-platform/concepts/authentication-flow.md), [resource-state-predications](resource-state-predications.md):

```json
{
  "policy-class": "rate-limit",
  "parameters": {
    "subject": "<peer-hash | api-hash | account-hash>",
    "operation-class": "<admission | query | dispatch>",
    "limit": <integer>,
    "window-seconds": <number>,
    "exhaustion-policy": "throttle | reject | queue | escalate"
  }
}
```

### Encryption policy

Per [encryption](encryption.md), [encryption-as-visibility-restriction-via-invisible-automorphism](../theorems/encryption-as-visibility-restriction-via-invisible-automorphism.md):

```json
{
  "policy-class": "encryption",
  "parameters": {
    "scope-pattern": "<predicate or scope filter>",
    "scheme": "ed25519+chacha20 | age | aws-kms",
    "recipient-list": [<identity-record-hash>, ...],
    "encrypt-at-rest": <boolean>,
    "encrypt-in-transit": <boolean>
  }
}
```

### Dispatch policy

Per [graded-dispatch-via-q-enriched-fusion](../theorems/graded-dispatch-via-q-enriched-fusion.md), [opportunistic-scheduling-loop](opportunistic-scheduling-loop.md):

```json
{
  "policy-class": "dispatch",
  "parameters": {
    "match-strategy": "highest-grade | lowest-cost | round-robin | weighted-fair",
    "tie-breaking": "canonical-hash | priority-predicate | random",
    "backpressure-threshold": <fraction>
  }
}
```

### Repair policy

Per [repair](repair.md), [repair-as-top-cell-resolution](../theorems/repair-as-top-cell-resolution.md):

```json
{
  "policy-class": "repair",
  "parameters": {
    "top-cell-pattern": "<predicate or value-pattern>",
    "default-resolution": "priority | join | abort | escalate",
    "escalation-target": "<authority-record-hash>",
    "max-auto-repair-per-window": <integer>
  }
}
```

## Policy lookup at decision time

When a substrate operation needs to consult a policy:

1. Identify the policy-class (e.g., "I'm about to retire an event-log entry; what's the retention policy?").
2. Identify the relevant scope (substrate, scope, principal, operation-class).
3. Query the substrate for `substrate-policy:{policy-class}` cells matching the scope.
4. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the most-specific match wins (per-principal beats per-scope beats global).
5. Apply the policy's parameters.

Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), policy lookup is a read — free at the substrate level. Per [cache-coherence-via-functorial-projection](../theorems/cache-coherence-via-functorial-projection.md), policy results may be cached by the substrate's runtime.

## Policy changes are governance decisions

Per [governance-as-modal-restriction](theories/agential-orchestration-platform/theorems/governance-as-modal-restriction.md), changing a substrate policy is a governance decision — the principal admitting the new policy must have governance authority for the policy-class.

Per [governance-decision-modal-decidability](../theorems/governance-decision-modal-decidability.md), the substrate's $\Box_R$ check determines whether the principal has authority. Policy changes that fail the check are admitted as substrate content (auditable per [witness](witness.md)) but tagged as `inadmissible` and don't take effect.

Per [audit-content-via-inconsistency-sheaf-cohomology](../theorems/audit-content-via-inconsistency-sheaf-cohomology.md), repeated unauthorized policy-change attempts surface as $\top$-cells in the inconsistency sheaf — useful for detecting governance attacks.

## Policy versioning

Per the `supersedes` field, policies form a versioning chain: a new policy supersedes the previous one for the same scope/class. Per [witness-chain-as-proof-object](../theorems/witness-chain-as-proof-object.md), the chain is auditable — auditors can replay "what policy was active at ordinal $n$?"

Active policy at ordinal $n$: the most recent policy-record in the supersedes-chain whose `valid-from-ordinal` $\leq n$ and (`valid-until-ordinal` is null or $\geq n$).

## Federation: cross-substrate policy

Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), federation peers may have different policies. When a federated operation crosses to a peer, the *receiving* substrate's policy applies — the peer's retention, rate-limit, encryption disciplines govern the operation locally.

This means an envelope sent from peer $A$ to peer $B$ is subject to $A$'s send-side rate limits and $B$'s receive-side rate limits, $A$'s encryption-policy for what it sends and $B$'s decryption-recipient policy for what it accepts. Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), the trust grade between peers may itself be policy-governed.

## What the discipline rules out

- **Policy as runtime configuration.** Policies stored in config files, environment variables, or external systems break the substrate's [self-representation](self-representation.md) discipline. Per this concept, policies are substrate predications.
- **Implicit defaults.** A substrate operation that uses a default value when no policy matches should record the default as a substrate-policy entry — even an explicit "global default" policy is auditable, while an implicit runtime default is not.
- **Policy changes without authority.** Per [governance-as-modal-restriction](theories/agential-orchestration-platform/theorems/governance-as-modal-restriction.md), changing policy requires authority. Implementations that allow policy changes via direct substrate-content edits without governance check are non-conformant.
- **Conflicting policies without resolution.** Two policies matching the same scope at the same ordinal that disagree produce a $\top$-cell per [audit-content-via-inconsistency-sheaf-cohomology](../theorems/audit-content-via-inconsistency-sheaf-cohomology.md). The substrate's discipline is to surface and resolve, not silently pick one.

## Position

Substrate policy is the substrate's *configuration-as-substrate-content discipline*. Per [self-representation](self-representation.md), policy is substrate-recorded; per [governance-as-modal-restriction](theories/agential-orchestration-platform/theorems/governance-as-modal-restriction.md), policy changes are authorized; per [witness-chain-as-proof-object](../theorems/witness-chain-as-proof-object.md), policy history is auditable.

The concept composes with all the policy-consuming concepts ([backup-discipline](backup-discipline.md), [snapshot](../objects/snapshot.md), [compaction](compaction.md), [encryption](encryption.md), [authentication-flow](theories/interactive-application-platform/concepts/authentication-flow.md), [opportunistic-scheduling-loop](opportunistic-scheduling-loop.md), [repair](repair.md), [resource-budget](resource-budget.md), [user-state-predications](theories/interactive-application-platform/concepts/user-state-predications.md), [metric](metric.md), [trace](trace.md)), with [governance](theories/agential-orchestration-platform/concepts/governance.md) (the discipline that authorizes policy changes), with [vocabulary](vocabulary.md) (which predicates encode policy parameters), and with [self-representation](self-representation.md) (the meta-discipline making policy substrate content).
