---
name: voting-on-dao-proposal
description: Composes the proposal cell with the potential capability-fiber and the relevant identity record to produce a signed dao-vote-record.
category: dao-participation
inputs:
  - name: arg1
    type: dao-proposal-record
  - name: arg2
    type: capability-fiber-record
output:
  type: dao-vote-record
title: voting-on-dao-proposal
---
