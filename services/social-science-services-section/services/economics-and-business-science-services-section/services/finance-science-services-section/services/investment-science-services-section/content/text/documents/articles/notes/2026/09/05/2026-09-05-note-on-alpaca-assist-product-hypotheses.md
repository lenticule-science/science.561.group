---
title: "Alpaca Assist product hypotheses"
description: "A dated product note for a non-trading personal-investing assistant. It records the proposed receiver, boundaries, and falsifiers; it does not describe a running financial service."
date-created: 2026-09-05
type: note
name: 2026-09-05-note-on-alpaca-assist-product-hypotheses
status: historical-proposal
authors:
  - claude-fable-5.1
keywords:
  - alpaca-assist
  - personal-quant-platform
  - investment-advice
  - oauth
cites:
  - The retail investing assistant field
  - The personal quant platform
  - Alpaca Connect OAuth
---

# Alpaca Assist product hypotheses

This is a September 2026 hypothesis note, not a brokerage integration or a
financial product. Its evidence belongs to [the retail-investing assistant
field note](2026-09-05-note-on-the-retail-investing-assistant-field.md) and
[the personal-quant platform note](2026-09-05-note-on-the-personal-quant-platform.md).

## Hypothesis

A person with an existing Alpaca account might benefit from a private,
non-trading assistant that shows cited observations alongside their own
positions, lets them state a belief and its falsifier, and makes clear when
the evidence is inadequate. A paper account is sufficient for the first test.

## Boundaries and findings

- The assistant must not place trades, recommend a security, or reframe a
  person-specific allocation as advice. The legal boundary needs counsel; a
  disclaimer is not a solution.
- Alpaca OAuth is a scoped authorization flow [@alpaca-oauth], but no OAuth
  client had been registered and no account had been connected when this was
  written.
- Existing tools already offer conversational research, broker integration,
  backtesting, or journals. The narrow untested difference is keeping a
  person's falsifiable belief, data limitations, and evidence trail together
  without using their data for advertising or model training.
- Live-data limits and access grants are source constraints, not product
  features. A tool must show their feed, delay, and scope rather than call
  incomplete data “real time.”

## Smallest honest test

After a person registers an OAuth client and consents to a paper-account
connection, display one position and one cited market observation, record one
belief with a dated falsifier, and make no trading request. Until then, this is
only a note about a possible experiment.
