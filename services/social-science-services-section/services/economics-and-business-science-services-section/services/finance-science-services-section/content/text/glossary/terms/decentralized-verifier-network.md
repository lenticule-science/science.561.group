---
name: "Decentralized Verifier Network"
date-created: 2026-10-08
aliases:
  - "DVN"
  - "LayerZero DVN"
description: "A LayerZero v2 verifier that independently attests a message hash; applications choose required and optional verifiers and a threshold per channel."
references: {}
---

A **decentralized verifier network (DVN)** is a LayerZero v2 verifier that independently checks a message's payload hash and attests it to the destination endpoint. An application sets a list of required verifiers, a list of optional verifiers and how many of them must agree, separately for each source and destination. If it sets none, a default configuration applies; defaults can change and, in the vendor's own words, a single operator may then control both verification and execution. Security is therefore a property of the application's chosen verifier set.
