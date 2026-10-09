---
name: rebuilding-from-source-cells
description: Reads source cells, produces a Nix flake, builds a new bootable image.
category: kernel
inputs:
  - name: arg1
    type: source-cell-record
output:
  type: bootable-image-record
title: rebuilding-from-source-cells
---
