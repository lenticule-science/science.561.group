---
type: concept
class: process-discretization
symbol: h
depends-on: []
title: Layer
description: "The fundamental discretization of additive manufacturing: a continuous geometry $G \\subset \\mathbb{R}^3$ is partitioned into a stack of two-dimensional cross-sections $\\{Si\\}{i=0}^{N}$ at heights $\\{zi\\}$ with $z{i+1} - zi = hi$, and each…"
---

# Layer

The fundamental discretization of additive manufacturing: a continuous geometry $G \subset \mathbb{R}^3$ is partitioned into a stack of two-dimensional cross-sections $\{S_i\}_{i=0}^{N}$ at heights $\{z_i\}$ with $z_{i+1} - z_i = h_i$, and each $S_i$ is realized by a single process step (a deposited bead, a cured raster, a fused powder pass).

The **layer height** $h$ — the distance between adjacent slicing planes — is the single most important AM parameter. It sets, simultaneously:

- vertical resolution and stair-step amplitude on non-vertical surfaces,
- print time (linear in $1/h$ for fixed volume),
- the layer-adhesion failure mode (each $z_i$ is a fusion boundary; non-fused boundaries become crack-initiation sites under Z-axis load),
- minimum buildable feature height ($\geq h$),
- the interaction between [overhang](./predication-overhang.md) angle and slope (an overhang angle $\theta$ from vertical produces unsupported bead overhang of $h \tan\theta$ per layer).

Different AM processes set different practical bounds on $h$: FFF typically $0.05$–$0.40$ mm (constrained by nozzle diameter), SLA/MSLA $0.025$–$0.10$ mm (constrained by cure depth and Z-stage repeatability), SLS/MJF $0.08$–$0.12$ mm (constrained by powder layer recoating uniformity). The bounds are not arbitrary; each one derives from a process-specific physical constraint enumerated in the relevant sub-theory.

The layer is also the source of AM's defining mechanical property: see [anisotropy](./predication-anisotropy.md). A part is strong within a layer (covalent/metallic continuity inside each $S_i$) and weak across layers (whatever bond formed between $S_i$ and $S_{i+1}$ during the brief window when the lower layer was still hot/uncured/molten enough to fuse with the new one).
