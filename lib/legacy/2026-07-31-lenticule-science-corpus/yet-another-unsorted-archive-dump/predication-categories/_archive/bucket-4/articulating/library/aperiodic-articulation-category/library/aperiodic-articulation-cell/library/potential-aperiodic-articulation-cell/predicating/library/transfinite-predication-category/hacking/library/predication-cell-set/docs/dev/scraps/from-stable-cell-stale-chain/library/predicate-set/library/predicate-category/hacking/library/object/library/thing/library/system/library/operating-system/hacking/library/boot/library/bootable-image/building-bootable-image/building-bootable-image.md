---
name: building-bootable-image
description: Builds a bootable image from a Nix-flake record.
category: kernel
inputs:
  - name: arg1
    type: nix-flake-record
output:
  type: bootable-image-record
---
