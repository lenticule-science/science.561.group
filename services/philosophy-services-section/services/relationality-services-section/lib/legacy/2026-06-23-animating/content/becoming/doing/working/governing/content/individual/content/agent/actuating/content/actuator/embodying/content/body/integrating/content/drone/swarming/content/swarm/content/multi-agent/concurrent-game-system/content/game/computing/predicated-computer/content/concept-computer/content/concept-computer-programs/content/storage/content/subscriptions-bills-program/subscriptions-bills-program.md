---
title: Subscriptions and Bills Program
kind: structure
layer: program
status: someday
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---
# Subscriptions and Bills Program

This program tracks subscriptions and bills as recognitions so obligations and
payments are traceable.

## Behaviour

- Represent subscriptions, bills, payments, and renewals as recognitions with
  provenance.
- Link to budgets, accounts, and policies; schedule renewals and reminders.
- Measure spending, upcoming obligations, and compliance with policy.

## Intended operators

- Register subscriptions and bills; schedule and record payments.
- Alert on upcoming or failed payments; reconcile with accounts.
- Review obligations against budgets and policies.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

