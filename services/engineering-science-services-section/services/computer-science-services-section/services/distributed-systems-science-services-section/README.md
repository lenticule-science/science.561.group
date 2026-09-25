# Distributed Systems Science Services Section

This section holds the science of replicated, content-addressed, and
peer-to-peer storage: how a piece of data can be kept retrievable by
many independent operators rather than one, what that buys against
removal by a single party — a host compulsion, a domain seizure, a
DMCA notice, a sanctions listing — and what it costs in bandwidth,
storage, and operator liability. Its research spine runs from the
structural primitive (content addressing, the distributed hash table)
through the redundancy mechanisms built on it (replication,
erasure coding) to the economic and legal mechanisms that keep
redundant copies alive over years (pinning, incentivized storage,
web archiving, git mirroring, BitTorrent-style swarm distribution) and
the attacks and threat models that bound what "resistant" can mean
(Sybil and eclipse attacks, the takedown vectors censorship
resistance is defined against).

Blockchain-specific consensus and settlement patterns are a narrower,
sibling concern: `../blockchain-services-section/` holds autonomous-world,
hive-account, and on-chain vocabulary for state that must be globally
agreed, not merely stored. Where a storage mechanism happens to run on
a blockchain (Filecoin, Arweave), this section states the storage
guarantee and cites the blockchain section rather than restating chain
mechanics.

Its material is organized by artifact role under `content/`.
