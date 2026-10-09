---
title: "No Buy product hypotheses"
description: "A dated product note for a no-purchase earning guide and a free-tier AI router. It records the proposed receiver, constraints, falsifiers, and next test; it is not an operational program or business plan."
date-created: 2026-09-05
type: note
name: 2026-09-05-note-on-no-buy-product-hypotheses
status: historical-proposal
authors:
  - claude-fable-5.1
keywords:
  - no-buy
  - free-tier
  - hive
  - lightning
  - inference-dispatch
cites:
  - "Earning without buying: the field and its literature"
  - Hive Developer Portal
  - Rate limits and free-model terms
  - Rate limits
---

# No Buy product hypotheses

This is a September 2026 product hypothesis, not a service, enterprise, or
operating plan. Its research belongs to [the participation-economy field
note](2026-09-05-note-on-earning-without-buying-the-field-and-its-literature.md).

## Hypothesis

Two small tools might help a person with time and attention but no capital:

1. A dated guide to ways of earning or receiving crypto without purchase,
   which makes labor, identity requirements, custody, withdrawal gates, and
   payout limits visible.
2. A router that spends a person's own free AI quotas through an existing
   compatible endpoint, reports the quota and data-use terms of each lane,
   and never moves into a paid lane without an explicit choice.

The first is a research and comparison problem. The second is only lawful as
per-person key routing: OpenRouter's terms do not permit a shared key to route
many users [@openrouter-limits]. Neither hypothesis implies that the Group
holds a person's key, wallet, balance, identity record, or earnings ledger.

## Findings worth retaining

- “Free” and “no KYC” are separate filters. ZBD could permit earning before
  verification but requires government ID for BTC withdrawal. The official
  Hive free path was broken or identity-gated in this pass; claimed-account
  creation and Ecency were the identified alternatives [@hive-developers].
- Coinbase Learning Rewards had been discontinued. Consumer availability of
  ZBD needed direct device observation rather than inference from its web
  redirect.
- A free AI lane may impose an unpublished quota, a signup credit, a privacy
  cost, or a contradictory payment-method requirement. Gemini's free-tier
  training/review terms and SambaNova's conflicting documentation were both
  reasons to surface uncertainty rather than promise availability.
- Existing routers already provide multi-provider endpoints and fallback. The
  narrower possible difference is quota-reset awareness, per-lane terms, and
  refusing an unrequested paid fallback.

## Smallest honest test

Use two personally owned free AI accounts with one ordinary client. Exhaust
one documented quota, verify that the next free lane is selected, and verify
that a paid route is refused. Separately, publish one earning-surface guide
row with its source date, payout restriction, identity restriction, and an
explicit `unknown` where evidence is absent.

Until those tests happen, this note is a proposal only.
