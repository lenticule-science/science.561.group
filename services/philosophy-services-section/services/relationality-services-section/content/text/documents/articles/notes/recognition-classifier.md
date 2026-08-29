---
title: Recognition Classifier
id: recognition-classifier
role: structure
status: plan
derived_from: math/structure/subobject-classifier
proof_refs: []
---


# Recognition Classifier

Identification of the recognition algebra with the subobject classifier
`Omega` in the earned topos.

## Definition
- Carrier: the recognition algebra viewed as `Omega`, with truth values
  represented by recognitions.
- Map: isomorphism between recognitions and sieves/characteristic maps that
  classify subobjects.

## Invariants
- Isomorphism: recognition order/operations coincide with the logical
  structure on `Omega`.
- Truth alignment: `true` corresponds to the maximal recognition; characteristic
  maps correspond to earned recognitions of subobjects.
- Stability: classification is natural with respect to pullbacks/transport in
  the topos.

## Proof
- Uses: [Relational Logic Algebra](./relational-logic-algebra.md) to supply the
  logical operations; [Subobject Classifier](./subobject-classifier.md) to supply
  classifier structure.
- Shows that: the recognition algebra satisfies the classifier axioms and thus
  serves as `Omega`, aligning truth values with earned recognitions.
