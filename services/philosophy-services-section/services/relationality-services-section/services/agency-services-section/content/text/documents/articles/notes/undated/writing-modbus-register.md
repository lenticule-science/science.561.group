---
name: writing-modbus-register
description: Writes to a Modbus register; the write itself is a cell on the named actuator.
category: industrial-control
inputs:
  - name: arg1
    type: modbus-driver-record
  - name: arg2
    type: actuator-record
output:
  type: cell-record
title: writing-modbus-register
---
