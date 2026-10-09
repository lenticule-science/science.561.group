---
name: irrigating-when-dry-and-no-rain
description: The composed irrigation behavior — closure rule fires, pump runs, ledger entry posted, notification rendered.
category: industrial-control
inputs:
  - name: arg1
    type: soil-moisture-sensor-record
  - name: arg2
    type: weather-service-driver-record
output:
  type: notification-cell
title: irrigating-when-dry-and-no-rain
---
