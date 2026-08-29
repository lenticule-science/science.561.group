---
name: blockchain-onchain-reading-program
role: structure
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Program idea to read and interpret on-chain data using the relational computer,
mirroring on-chain history as read-only recognitions.

## Behaviour
- Core recognitions:
  - `ChainRecognition`: chain id/endpoints/consensus/avg block time.
  - `BlockRecognition`: height/hash/parent/time/validator/gas, linked to chain.
  - `TransactionRecognition`: from/to/value/gas/status/logs; linked to blocks
    and higher-level recognitions (contracts, governance events, markets).
  - `ContractRecognition`: address/code hash/ABI/deployment tx.
  - `StateSnapshotRecognition`: captured contract state (balances/config).
- Runbooks:
  - `import_block_range`: fetch blocks/txs, normalise via intake/policy, persist.
  - `import_contract_events`: query logs/events, normalise to domain recognitions.
  - `import_account_activity`: fetch txs for address, link to portfolios/DAOs.
- Topology:
  - Link on-chain recognitions to markets/governance/legal/ecology graphs.
- Measurement:
  - Track per-address/contract/chain metrics (activity, gas, latency, reorgs).

## Proof
- Derived from: [Documentation Interpreter](../../../computer/type/documentation-interpreter.md).
- Shows that: this program instantiates the documentation interpreter to realise the described behaviour without extending machine semantics.

