---
name: blockchain-onchain-reading
layer: spec
keywords:
  - blockchain
  - onchain
part-of: relational-computer
description: "Treats on-chain data as read-only recognitions so the relational computer can understand and relate blockchain activity to everything else."
---

Treat on-chain data as read-only recognitions so the relational computer can
understand and relate blockchain activity to everything else (markets, legal,
governance, ecology, personal finance, etc.).

## 1. Core recognitions

- `ChainRecognition`
  - a particular blockchain (Ethereum mainnet, L2, Cosmos zone, etc.).
  - fields: chain ID, RPC endpoints, consensus type, average block time.
- `BlockRecognition`
  - height, hash, parent hash, timestamp, miner/validator, gas used.
  - linked to `ChainRecognition`.
- `TransactionRecognition`
  - hash, from/to addresses, value, gas, status, logs.
  - linked to a `BlockRecognition` and optionally to higher-level recognitions
    (contracts, governance events, markets).
- `ContractRecognition`
  - address, code hash, ABI/interface summary, deployment transaction.
- `StateSnapshotRecognition`
  - a captured view of specific contract state at a time (e.g., balances,
    config variables).

These recognitions are *read-only views* of on-chain state/history in your
graph. Any on-chain writes remain external; you simply mirror them in your
relational universe.

## 2. Intake runbooks

Runbooks for importing chain data:

- `import_block_range`
  - inputs: `chain_id`, `from_block`, `to_block`.
  - behavior: fetch blocks from RPC/indexer, build `BlockRecognition` and
    `TransactionRecognition` objects, pass them through intake (schema/policy),
    and persist.
- `import_contract_events`
  - inputs: `chain_id`, `contract_address`, `event_signature`, `from_block`.
  - behavior: query logs/events, normalize to recognitions specific to that
    contract’s domain (e.g., DAO votes, token transfers).
- `import_account_activity`
  - inputs: `chain_id`, `address`, `from_block`.
  - behavior: fetch transactions and link them to existing recognitions
    (portfolios, contracts, DAOs).

Intake responsibilities:

- schema validation of raw RPC/indexer payloads,
- policy checks (which chains/addresses are allowed, rate limits),
- normalization (consistent units, timestamps).

## 3. Topology: connecting on-chain to everything else

Topology links on-chain recognitions to:

- **Markets** (`docs/app/spec/markets-analysis.md`)
  - `InstrumentRecognition` ↔ `ContractRecognition` for tokens/ETFs.
  - `PriceSeriesRecognition` updated by on-chain trades or oracle events.
- **Governance** (`docs/app/spec/governance-community.md`)
  - DAO proposals/votes as `ProposalRecognition` / `DecisionRecognition` linked
    to `TransactionRecognition` and `ContractRecognition`.
- **Legal** (`docs/app/spec/legal-contracts.md`)
  - `ContractRecognition` ↔ legal contract recognitions when an on-chain
    contract mirrors or enforces a legal agreement.
- **Ecology / climate** (`docs/app/spec/socio-ecological.md`, `docs/app/spec/measurements-ecology-health.md`)
  - funding transactions from DAOs or protocols to projects in your
    socio-ecological graph.

This makes it possible to phrase questions like:

- “Which on-chain events affected recognitions I depend on?”
- “How does this DAO’s on-chain behavior align with my values and ecological
  recognitions?”

## 4. Measurement over on-chain activity

Measurement channels can track:

- per-address metrics: activity rates, gas spent, patterns of use.
- per-contract metrics: upgrade events, pauses, proxy changes, governance
  participation.
- per-chain metrics: latency, reorg frequency, RPC health.

These observables are just another set of measurement channels in the fabric,
comparable with:

- your portfolio metrics,
- governance participation,
- ecological or social indicators.

## 5. Minimal slice for future implementation

A first vertical slice might be:

- `ChainRecognition` for Ethereum mainnet.
- Runbook `import_block_range` for a small block window around a known event.
- Recognitions:
  - a specific `ContractRecognition` (e.g., a DAO or token),
  - its `TransactionRecognition`s over that window,
  - a `ProposalRecognition` / `DecisionRecognition` tied to on-chain votes.
- Simple queries:
  - “show all transactions related to this proposal,”
  - “summarize how this DAO actually behaves vs its stated governance rules.”

This keeps the chain firmly as a read-only, external but relationally linked
signal, consistent with your universal relational computer ethos.
