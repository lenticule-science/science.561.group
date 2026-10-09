# Macaulay2 scripts for the saturated-EDD question

Attempts at the SPD-interior-saturated EDD of $V(\Pi_A)$, per [../saturated-edd.md](../saturated-edd.md).

Run via `M2 --no-readline -q < script.m2`.

- `edd_saturate.m2` — saturates $V(\Pi_A)$ by $\det Q_0 \cdot \det Q_1 \cdot \det Q_2$ before computing the ED ideal.
- `edd_PiA_saturated.m2` — the saturated ED-ideal computation itself.

## Status

Gröbner basis blew up on direct elimination — the saturated ED ideal couldn't be computed this way. See [../saturated-edd.md](../saturated-edd.md) for approaches still to try.
