---
title: Audit Structure
tags:
  - audit
  - traceability
  - governance
depends_on:
  - theorem/internal/introspection-stack
  - theorem/internal/relational-storage
  - theorem/internal/distribution-stack
# Audit Structure

The introspection structure, relational storage, and distribution structure
induce an audit structure: a way to reconstruct, for any observable, the trace,
context, and invariant state that produced it.

Formally, there exists a structure

```text
Audit = (Events, Reports, Provenance)
```

such that:

1. **Events.**
   `Events` are observable emissions captured by probes in the introspection
   structure and stored via relational storage. Each event records:
   - the observable payload,
   - the associated trace identifiers and channels,
   - and any relevant invariant states (e.g., baseline tails, fixed
     recognitions, contexts).

2. **Provenance relation.**
   `Provenance` relates events to the packets and channels they traversed in
   the distribution structure, yielding a path through the network and
   scheduling structures for each event.

3. **Reports.**
   `Reports` are derived carriers that summarise the provenance and state
   information for one or more events, suitable for inspection by governance
   or compliance tools.

Given any observable, the audit structure allows us to construct a report
linking it to the exact recognitions, contexts, and dataflow paths involved.
This provides the mathematical backbone for audit and governance features in
the relational computer.
