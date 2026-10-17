# Mathematical Relational-Graph Service

This actor serves normalized finite relational-graph metrology over signed A2A.
It derives a canonical component partition, H0/H1 ranks, coordination and
Landauer quantities, and exact/harmonic ranks from a typed RMN graph request.

CoverNerve count arithmetic is implemented locally from the finite graph
counts this service already derives. This keeps the readout self-contained:
`H1rank = cells + components - entities`.

The A2A face is served by `scripts/serve-a2a.mjs`; its executor is
`scripts/execute-a2a-task.mjs`. The Cloudflare carrier exposes only the normalized
relational-graph operation. Neither carrier claims ActivityPub, x402, EVM
settlement, or a service-performance receipt.
