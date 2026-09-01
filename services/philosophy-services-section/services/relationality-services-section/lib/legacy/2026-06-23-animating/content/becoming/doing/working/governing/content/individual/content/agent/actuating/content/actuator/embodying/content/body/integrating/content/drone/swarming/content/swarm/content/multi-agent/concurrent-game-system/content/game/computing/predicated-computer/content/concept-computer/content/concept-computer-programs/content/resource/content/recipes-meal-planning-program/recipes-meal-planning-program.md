---
title: Recipes and Meal Planning Program
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

This program models recipes and meal plans as recognitions so nutrition and
shopping can be coordinated and audited.

## Behaviour

- Represent recipes, ingredients, meals, and plans as recognitions with
  provenance.
- Link to inventory, shopping, and nutrition measurements.
- Measure cost, nutrition, and preparation effort.

## Intended operators

- Plan meals; generate shopping lists; track preparation.
- Adjust plans based on inventory and measurements.
- Share or adapt recipes with provenance.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

