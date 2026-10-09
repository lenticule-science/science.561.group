---
name: disqualifying-rate-limited-endpoint
description: Disqualifies an endpoint whose rate-limit observation reads zero remaining.
category: kernel
inputs:
  - name: arg1
    type: rate-limit-observation-record
output:
  type: assignment-record
title: disqualifying-rate-limited-endpoint
---
