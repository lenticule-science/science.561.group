---
name: sending-parameters-to-a-script
description: Invoke a POSIX-addressed ESM Node script function with JSON parameters and return its local invocation envelope.
source: parameters
target: message
---

# Sending parameters to a script

This transformer is the local execution boundary for a script realization.
It receives a script path plus JSON parameters, imports the ESM module at that path, calls its default export, and returns the local send envelope.

The called script's own transformer supplies the domain and codomain contract.
This transformer only records the POSIX/ESM invocation envelope.
