---
title: Persistent Recognition Carrier
id: persistent-recognition
role: structure
status: plan
proof_refs: []
derives-from: acts/fixed-profile-recognitions
---



## Definition
- Carrier: recognitions fixed by the flow/nucleus stack that remain reachable after persistence.
- Components: fixed-profile recognitions earned by [Fixed Profile Recognitions](./fixed-profile-recognitions.md) and stability witness from [Fixed Invariant](./fixed-invariant.md); reachability earned by [Reach](./reach.md).

## Invariants
- Flow/nucleus fixed: recognitions remain unchanged under the earned flow and nucleus actions.
- Reachable on reload: persisting and reloading a context preserves the ability to arrive at these recognitions.

## Proof
- Derived from: [Fixed Profile Recognitions](./fixed-profile-recognitions.md), which isolates the stable subset under flow/nucleus.
- Shows that: adding the reachability condition from [Reach](./reach.md) yields a carrier of recognitions that survive persistence, forming the persistent recognition carrier.
