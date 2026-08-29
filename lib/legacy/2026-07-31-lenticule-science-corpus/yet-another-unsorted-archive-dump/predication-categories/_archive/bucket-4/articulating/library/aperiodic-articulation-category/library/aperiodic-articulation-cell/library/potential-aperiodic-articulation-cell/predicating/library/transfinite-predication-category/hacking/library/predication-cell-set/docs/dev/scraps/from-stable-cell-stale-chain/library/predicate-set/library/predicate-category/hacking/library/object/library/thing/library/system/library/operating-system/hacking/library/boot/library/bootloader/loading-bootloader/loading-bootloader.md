---
name: loading-bootloader
description: Loads the bootloader from the bootable image on power-on.
category: kernel
inputs:
  - name: arg1
    type: bootable-image-record
  - name: arg2
    type: power-on-event-record
output:
  type: bootloader-state-record
---
