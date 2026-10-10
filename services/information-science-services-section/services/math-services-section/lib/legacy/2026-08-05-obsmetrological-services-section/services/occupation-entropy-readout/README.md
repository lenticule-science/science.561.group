# Occupation Entropy Readout

A signed A2A face for one computation: the Boltzmann occupation-entropy
readout of an occupation list.

Given an occupation list — one non-negative integer count per cell (for
example, hires per provider) — it returns:

- `cells` — the number of cells (the occupation list's length)
- `totalObjects` — `N`, the sum of the occupation counts
- `configH` — Boltzmann's `H = Σ log2(n_i!)` over the cells
- `entropyBits` — `log2(N!) − configH`, the log₂ multinomial multiplicity
  `log2(N! / Π n_i!)`: the spread of the occupation. It is `0` when every
  object sits in one cell, and larger the more evenly the objects are spread
  across cells.

`configH` is computed as an exact log-sum (`Σ_{k=2}^{n} log2(k)` per cell),
not by forming `n!` directly, so it does not overflow for large occupation
counts.

## Spec sheet

This readout is specified by
`Obsmetrologia/Thermodynamics/BoltzmannEntropy.lean`
(`Obsmetrologia.Thermodynamics.fact`, `.cellH`, `.configH`). The Lean file's
bytes are pinned by sha256 in `src/occupation-entropy.mjs`; every served answer
attaches a `certificate` recomputing that digest on every call and refusing
to answer if the pinned bytes have drifted. The JavaScript in this die is
a separate implementation, not an extraction from the Lean.

## A2A face

The die serves one signed A2A 1.0 face (`scripts/serve-a2a.mjs`, executor
`scripts/execute-a2a-task.mjs`), reachable publicly through the settlement's
existing tunnel:

```
https://bare-cedar-fog.561.group/a2a/occupation-entropy-readout/.well-known/agent-card.json
```

(locally: `http://127.0.0.1:8812/.well-known/agent-card.json`). Request: one
A2A `ROLE_USER` message carrying one `application/rmn+cbor` raw part whose
RMN term is a single Mark labeled with a JSON object:

```
["mark", "{\"occupation\":[2,2]}"]
```

Response: a `ROLE_AGENT` message, `metadata.disposition: "completion"`, one
RMN Mark part whose JSON label carries `cells`, `totalObjects`,
`configH: 2`, `entropyBits: 2.584962500721156` (`log2(6)`), a measured
`cost` block, and the source `certificate`. A malformed occupation is a
refusal (nonzero executor exit), not a completion.

Default local port: `8812` (`PORT` environment variable); `BASE_URL` names
the public face the agent card advertises.
