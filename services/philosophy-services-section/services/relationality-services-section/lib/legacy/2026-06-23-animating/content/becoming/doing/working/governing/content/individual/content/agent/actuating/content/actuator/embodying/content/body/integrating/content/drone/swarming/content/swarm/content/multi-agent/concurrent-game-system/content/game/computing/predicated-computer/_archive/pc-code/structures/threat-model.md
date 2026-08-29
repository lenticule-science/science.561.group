---
type: definition
class: substrate-entity
realizes: [trust-boundary, attack-surface]
depends-on: [trust-boundary, attack-surface, witness, conformance]
see-also: [identity-record, federation-bridge]
---

# Threat model

A **threat model** is the substrate-entity formal definition of the *adversaries* the substrate is protected against, the *assets* worth protecting, and the *defensive discipline* in place. Threat models are how the substrate makes its security posture queryable, auditable, and adjustable as substrate content.

## Structural fields

- **`id`** — kebab-case identifier (e.g., `production-threat-model-v3`).
- **`description`** — one-line summary.
- **`assets`** — references to substrate content the model protects: identity-records (key compromise), private substrate content (encryption-recipient list), federation-graph integrity, audit-chain integrity, deployment availability.
- **`adversaries`** — declared adversary models: `passive-network-eavesdropper`, `active-network-mitm`, `compromised-federation-peer`, `compromised-host-environment`, `compromised-identity-key`, `insider-with-agent-authorization`. Each adversary has a declared capability set.
- **`mitigations`** — references to substrate disciplines that protect against each adversary: encryption (against eavesdropper), signature verification (against MITM), governance-decision-gating (against compromised peer), key-rotation discipline (against compromised key), audit-chain monitoring (against insider).
- **`acceptable-risks`** — explicit declaration of risks the model does *not* protect against. Honesty about scope is part of a useful threat model.
- **`conformance-suite`** — reference to a [conformance test suite](conformance-test-suite.md) that exercises the model's mitigations.
- **`closure-kind`** — `threat-model`.

## Invariants

- **Mitigation-asset coherence.** Every asset in the model has at least one mitigation declared against the relevant adversaries.
- **Conformance-testable.** Every mitigation has a conformance check; per [conformance-implies-substrate-properties](../theorems/conformance-implies-substrate-properties.md), passing the suite is empirical evidence the mitigation works.
- **Honest scope.** Acceptable-risks are explicit. A threat model that doesn't acknowledge what it doesn't cover is dishonestly comprehensive.
- **Versioned.** Threat models evolve as adversaries do. Per [self-representation](teaching/explanations/self-representation.md), updates produce a new model version with `predecessor` to the prior.

## Operations

- *Author.* Create a new threat-model record. Authoring is itself a substrate operation; per [witness](witness.md), the authoring agent is recorded.
- *Update.* Add adversaries, mitigations, or assets. Each update produces a new model version.
- *Test.* Per [run-conformance-test](../morphisms/run-conformance-test.md), exercise the cited conformance suite against the substrate. Failures indicate the substrate's defenses don't match the model's claims.
- *Audit.* Query the model's adversary-mitigation matrix; verify which adversaries the substrate is currently protected against and which acceptable-risks are in scope.

## Position in the substrate

Threat models are the substrate's *security-posture registry*. Without them, security is implicit and unauditable; with them, the substrate's defensive commitments are explicit content. The pattern composes with [trust-boundary](teaching/explanations/trust-boundary.md) (the boundaries the model defends), [attack-surface](teaching/explanations/attack-surface.md) (the inputs the model protects), [conformance-test-suite](conformance-test-suite.md) (the empirical verification), and [witness](witness.md) (the audit chain that records security-relevant events).
