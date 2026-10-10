---
name: loading-kernel
description: Loads the kernel binary into memory and transfers control from bootloader to kernel.
category: kernel
inputs:
  - name: arg1
    type: bootloader-state-record
  - name: arg2
    type: kernel-binary-record
output:
  type: kernel-loaded-state-record
---
