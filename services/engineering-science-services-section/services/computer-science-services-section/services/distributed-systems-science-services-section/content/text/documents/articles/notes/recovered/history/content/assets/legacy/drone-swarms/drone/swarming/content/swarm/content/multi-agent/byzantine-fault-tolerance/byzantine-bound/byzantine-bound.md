---
type: theorem
class: classical
status: proved
depends-on:
  - teaching/explanations/byzantine-fault-tolerance.md
see-also:
  - cap-coordination-impossibility.md
references:
  - references/lamport-byzantine1982.md
---

# Byzantine bound (n > 3f)

## Statement

Byzantine consensus among $n$ agents tolerating $f$ arbitrary (Byzantine) faults requires $$n \geq 3f + 1$$ or equivalently $n > 3f$.
With fewer than $3f + 1$ total agents, no protocol exists that achieves agreement among the non-faulty agents in the presence of $f$ Byzantine faults under standard synchrony and authentication assumptions.

## Why $3f + 1$

The bound has an intuitive structure.
Consider $n$ agents, $f$ of which are Byzantine.
To reach agreement:

- The non-faulty agents number $n - f$.
- They must agree among themselves *despite* the $f$ faulty agents potentially sending conflicting messages.
- A non-faulty agent receiving $f$ messages claiming X and $f$ messages claiming not-X cannot distinguish (in the worst case) which set is faulty without *additional* witnesses.
- Hence non-faulty agents need *strict majority* among themselves: $n - f > 2f$, i.e., $n > 3f$.

## Proof structure

Lamport, Shostak & Pease (1982) prove the bound for the oral-message (no signatures) case via a combinatorial argument: with three agents and one Byzantine, the non-faulty pair cannot reach agreement because neither can distinguish whether the Byzantine is sending contradictory messages or whether the other non-faulty agent is the Byzantine.

The bound generalizes to $n > 3f$ for arbitrary $f$.

## With cryptographic signatures

If agents can authenticate messages cryptographically (unforgeable signatures), the bound improves to $$n \geq 2f + 1$$ because lying agents cannot forge other agents' messages, reducing the worst-case coordination problem.

Most modern BFT protocols (PBFT and successors) assume authenticated messages and operate at the $n = 3f + 1$ bound (since this also suffices for liveness under asynchrony assumptions).

## What it implies

- **Quorum design.** BFT protocols need quorums of size $\geq 2f + 1$ (out of $3f + 1$ total) to ensure any two quorums overlap in at least one non-faulty agent.
- **Replication overhead.** Tolerating one Byzantine fault requires four agents (3.0 redundancy); two faults requires seven (3.5 redundancy); three requires ten.
- **Limits on decentralized agreement.** No protocol can cheat the bound; deeper tolerance requires more participants.

## In multi-agent AI

The bound constrains:

- **AI ensemble robustness.** Tolerating $f$ compromised or malfunctioning AI agents in a voting ensemble requires $> 3f$ total.
- **AI debate frameworks.** Robustness of multi-AI debate to compromised arguers follows the same bound.
- **Federated AI training.** Byzantine-robust gradient aggregation faces the same fundamental bound.
- **Decentralized AI marketplaces.** Consensus on shared AI-system state in adversarial settings requires the $3f + 1$ overhead.

## Limits

- **Synchrony assumptions matter.** Under full asynchrony, the celebrated FLP impossibility (Fischer- Lynch-Paterson) shows deterministic consensus is impossible *with even one* faulty agent — synchrony assumptions are load-bearing.
- **Cryptographic assumptions.** With signatures, the bound improves to $2f + 1$.
- **Probabilistic protocols** (Nakamoto consensus) get around the bound by using economic incentives and weakening agreement to probabilistic finality.

## Status

Proved (Pease, Shostak & Lamport 1980; Lamport, Shostak & Pease 1982).
Tight (matched by PBFT and successors).
Foundational result of distributed systems.
