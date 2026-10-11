---
aliases:
  - flow matrix payment
  - path payment
description: A trust-path payment moves value from payer to payee along a path of trust edges, converting at each hop between currencies the next party has said it accepts.
identity: trust-path-payment
name: Trust-path payment
date-created: 2026-10-08
---
A trust-path payment is how Circles v2 moves money: each avatar declares which other avatars' personal currencies it accepts, with an expiry; a payment is a path through those declarations, executed in one transaction (operateFlowMatrix), and at each hop the sender's holding is swapped one-for-one for a currency the next hop accepts. The newest protocol change makes the flow consented and bidirectional, with an opt-out to the old unidirectional model ([UBI and Local Currency Protocols](../../documents/articles/notes/2026/10/08/2026-10-08-ubi-and-local-currency-protocols.md)).

Its collateral is social: a currency has value to the extent that someone trusted by a counterparty accepts it. Compare the paths of a [trustline](./trustline.md) network, where each hop shifts a bilateral balance instead of swapping tokens.
