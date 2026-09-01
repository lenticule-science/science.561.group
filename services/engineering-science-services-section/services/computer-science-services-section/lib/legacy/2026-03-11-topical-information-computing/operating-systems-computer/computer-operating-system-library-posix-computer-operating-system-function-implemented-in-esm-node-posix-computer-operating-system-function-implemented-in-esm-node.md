---
name: posix-computer-operating-system-function-implemented-in-esm-node
description: A POSIX-addressable regular-file realization of a computer-operating-system function whose body is implemented as an ESM Node module.
specializing: computer-operating-system
realizes-standard:
  - posix-1003-1
  - node-esm
---

# POSIX computer-operating-system function implemented in ESM Node

A **posix-computer-operating-system-function-implemented-in-esm-node** is not the transformer contract.
The transformer contract is inherited through the inductive chain beginning at relationlessness and articulating, then through the specific transformer being realized.

This structure records the implementation projection: a POSIX regular file addressed by path, interpreted by Node, loaded as an ESM module, and optionally wrapped as a command-line utility.

The realization is conformant when:

- its module identity is resolved from the module URL, not from ambient current working directory;
- its transformer body is a default-exported function when the function is used as a callable body;
- argv, stdin, stdout, stderr, exit status, environment, filesystem, subprocess, network, and clock access are explicit POSIX/Node boundary effects;
- filesystem mutation and witness emission happen only through declared capabilities supplied by the caller or wrapper.
