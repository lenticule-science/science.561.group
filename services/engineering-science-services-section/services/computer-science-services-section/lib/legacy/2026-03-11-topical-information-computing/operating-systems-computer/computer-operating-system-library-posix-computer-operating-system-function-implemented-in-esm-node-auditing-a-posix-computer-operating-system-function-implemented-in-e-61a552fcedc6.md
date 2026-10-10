---
name: auditing-a-posix-computer-operating-system-function-implemented-in-esm-node
description: Audit a POSIX/ESM Node implementation projection for undeclared boundary effects and missing callable-body shape.
source: posix-computer-operating-system-function-implemented-in-esm-node
target: posix-computer-operating-system-function-implemented-in-esm-node
---

# Auditing a POSIX computer-operating-system function implemented in ESM Node

This transformer takes source bytes for an ESM Node function realization and returns an audit object conforming to the POSIX/ESM realization schema.

The audit does not define the transformer's mathematical contract.
It checks whether the implementation projection honestly exposes the POSIX and Node boundary effects it uses: argv, stdio, cwd, env, filesystem, subprocesses, network, clock, and dynamic import.

For `declared-role: transformer-body`, the audit additionally requires a default-exported function body and rejects POSIX boundary effects that belong in a wrapper.
