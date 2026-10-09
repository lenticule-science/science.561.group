---
type: reference
class: foundational
status: active
authors: ["Leslie Lamport", "Robert Shostak", "Marshall Pease"]
year: 1982
venue: "ACM Transactions on Programming Languages and Systems, vol. 4, no. 3"
title: "The Byzantine Generals Problem"
---

# Lamport, Shostak & Pease 1982 — Byzantine Generals

Lamport, L., Shostak, R., & Pease, M.
(1982).
The Byzantine Generals Problem. *ACM Transactions on Programming Languages and Systems*, 4(3), 382-401.

The paper introducing the Byzantine generals allegory and proving the fundamental bound: agreement among $n$ agents tolerating $f$ Byzantine (arbitrary) faults requires $n > 3f$.
With cryptographic signatures, the bound improves to $n > 2f$.

The framing — generals surrounding a city, some loyal some traitors, all must agree on attack-or-retreat — gave the problem an evocative name and made the abstraction widely accessible.

Subsequent decades produced practical Byzantine fault- tolerant protocols (PBFT, BFT-SMaRt, HotStuff, Tendermint) all operating within the bound the paper established.

The problem and its solution shaped distributed systems, cryptocurrency design (Nakamoto consensus is a probabilistic alternative to BFT), and contemporary secure-distributed-AI architectures.

Cited by: [byzantine-fault-tolerance](teaching/explanations/byzantine-fault-tolerance.md), [byzantine-bound](../theorems/byzantine-bound.md).
