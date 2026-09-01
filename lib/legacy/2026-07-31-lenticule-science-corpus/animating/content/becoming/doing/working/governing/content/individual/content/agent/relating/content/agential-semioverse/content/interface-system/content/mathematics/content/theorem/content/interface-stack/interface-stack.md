---
title: Interface Structure
tags:
  - interface
  - ingestion
  - api
depends_on:
  - theorem/internal/intake-stack
  - theorem/internal/measurement-stack
  - theorem/internal/policy-stack
# Interface Structure

The intake, measurement, and policy stacks induce an interface structure: a
collection of input and output ports, with constraints describing how external
requests and responses are converted into internal recognitions and observables.

Formally, there exists a structure

```text
Interface = (InPorts, OutPorts, Validate, Present)
```

such that:

1. **Input validation.**  
   `InPorts` are ports at which external data may enter. The `Validate`
   relation uses intake and policy acts to determine when an incoming payload
   at a given input port can be turned into recognised observations or views,
   and under which policy regimes this is allowed.

2. **Output shaping.**  
   `OutPorts` are ports from which observables are exposed. The `Present`
   relation uses measurement acts to determine which observables or metrics
   may be presented at each output port and how they are derived from internal
   recognitions and sections.

This interface structure is the mathematical object that external APIs must
realise: concrete HTTP, MCP, or RDF interfaces provide carriers for `InPorts`
and `OutPorts` and implement `Validate` and `Present` in accordance with the
intake, measurement, and policy theorems.
