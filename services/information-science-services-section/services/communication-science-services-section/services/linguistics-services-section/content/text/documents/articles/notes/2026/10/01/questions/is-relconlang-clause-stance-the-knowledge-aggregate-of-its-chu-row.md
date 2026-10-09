---
kind: question
status: open-with-nonunique-projection
explores:
  - relconlang
  - chu
  - four
  - knowledge-order
  - stance
---
# Is RelConLang clause stance the knowledge aggregate of its Chu row?

The RelConLang manifest contains a charge-valued relation

[
R : Particle \times \{truth,falsity\} \to FOUR.
]

The relating algebra already defines `aggregate` of a charge pair as knowledge-order join.

Applying that operation to each RelConLang particle's two-state Chu row yields:

[
\begin{aligned}
ta &: potential \vee_k absurd = potential\\
na &: absurd \vee_k potential = potential\\
sha &: stable \vee_k active = stable\\
mu &: absurd \vee_k absurd = absurd.
\end{aligned}
]

These four results exactly match `data/stance-system.json`.

This gives a coherent candidate interpretation:

- the **Chu row** is the richer state-sensitive linguistic profile;
- the **clause stance value** is its knowledge-order aggregate;
- `ta` and `na` therefore differ structurally even though both project to `potential`.

This also provides evidence that the current flat witness-journal row `ta → active` is stale rather than the intended final semantics.

The derivation remains a hypothesis because no current RelConLang parser or manifest compiler applies this row aggregation. The next experiment should implement the projection only as an isolated reading and test it against the corpus before any manifest correction.


## Lossiness of the projection

The row aggregate is not invertible. Both `ta` and `na` aggregate to `potential`, so the aggregate forgets whether support was located at the Chu `truth` state or the `falsity` state.

Therefore exact agreement with `stance-system.json` is evidence for a lawful projection, but **not** evidence that the aggregate is the complete semantics of the particle.

A safer candidate factorization is:

[
Particle \mapsto Profile_{Chu} \mapsto AggregateReading,
]

where the profile remains available when polarity/orientation matters.

In particular, `na` is falsity-oriented in the Chu relation, but the recovered SignCraft history explicitly treated `na` as the same positive cell reading as `ta`. The current evidence does not justify reinterpreting `na` as ordinary proposition negation.

## Revision after relation-semantics audit

The row-join derivation is algebraically correct but **not semantically privileged** by the current code.

The generic relation API defines a state's extension through positive-side support of each matrix cell. Applied to this matrix, that yields `truth={ta,sha}` and `falsity={na}`; notably, `sha` is not in the falsity extension. A different non-bottom-occupancy projection recovers all four canonical side patterns.

Therefore exact agreement with `stance-system.json` is evidence that row knowledge-join is *a possible projection*, not proof that it is the intended meaning of the Chu space.

See [What does the RelConLang Chu matrix actually mean?](./what-does-the-relconlang-chu-matrix-actually-mean.md).
