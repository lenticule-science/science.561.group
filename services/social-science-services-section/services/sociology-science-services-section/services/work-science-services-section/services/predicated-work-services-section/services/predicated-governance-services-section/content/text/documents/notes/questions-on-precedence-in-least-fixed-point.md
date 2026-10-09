---
type: question
status: open
explores: [charter-as-closure-system, operations-settling]
title: How does charter-tier precedence behave in the least-fixed-point construction?
description: "The charter-as-closure-system theorem treats the charter as a partition of $\\mathcal{S}{\\mathrm{op}}$ into rules, guidelines, preferences, and instructions, with strict precedence: rules > guidelines > preferences > instructions."
---

# How does charter-tier precedence behave in the least-fixed-point construction?

The [charter-as-closure-system theorem](../theorems/charter-as-closure-system.md) treats the charter as a partition of $\mathcal{S}_{\mathrm{op}}$ into rules, guidelines, preferences, and instructions, with strict precedence: rules > guidelines > preferences > instructions. The theorem states that the precedence is "enforced by the closure-rule system's least-fixed-point construction."

Open: when a guideline's consequent contradicts a rule's consequent on some cell — guideline-rule says "settle to $\mathbf{t}$"; rule-rule says "settle to $\mathbf{f}$" — what does the LFP $\mathrm{cl}^{\mathcal{S}_{\mathrm{op}}}$ produce?

The math's [closure-rule-system definition](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) constructs the LFP as the *least* operator satisfying both rules' consequents jointly. Joint satisfaction of contradicting consequents drives the cell to $\top$ (both $\mathbf{t}$ and $\mathbf{f}$ asserted) — a contradiction state requiring repair. This treats rule and guideline symmetrically; the LFP construction does not natively respect precedence.

The work vocabulary's strict precedence requires that the higher-tier rule's consequent prevail; the substrate's LFP does not provide this for free. Whether precedence is encoded structurally (tiered closure operators, antecedent-shape excluding higher-tier-pinned cells, post-LFP repair resolving $\top$ by tier, or some other construction) is open. The resolution determines whether the predicated-work program's charter handling is faithful to the work-vocabulary's strict precedence or a relaxation thereof, and where in the substrate the contradiction-marker $\top$ accumulates.
