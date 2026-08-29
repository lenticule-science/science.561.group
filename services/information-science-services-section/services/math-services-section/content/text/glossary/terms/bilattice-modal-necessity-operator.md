---
title: "Bilattice Modal Necessity Operator"
description: "The truth-order meet of accessibility-residuated values across worlds in a bilattice-valued modal model."
aliases:
  - "bilattice necessity operator"
  - "Box_R"
date-created: 2026-03-30
type: term
---

For a world-indexed valuation $u=(u_w)_{w\in W}$ over a bilattice-valued predication fiber, the bilattice modal necessity operator is defined cellwise by

$$
(\Box_Ru)_w(s,o)=\bigwedge_t\{R(w,w')\Rightarrow u_{w'}(s,o):w'\in W\}.
$$

Here $\bigwedge_t$ is truth-order meet, $R$ is a bilattice-valued accessibility relation, and $\Rightarrow$ is the strong implication (equivalently, the twist-product right residual) used for each cell. When the value algebra and accessibility relation are Boolean, this reduces to the classical Kripke necessity operator.
