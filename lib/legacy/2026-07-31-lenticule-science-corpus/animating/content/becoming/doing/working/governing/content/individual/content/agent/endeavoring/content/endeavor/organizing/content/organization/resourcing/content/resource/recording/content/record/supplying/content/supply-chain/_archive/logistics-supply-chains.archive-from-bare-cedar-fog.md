---
title: Logistics & Supply Chains
status: someday
keywords:
  - idea
  - logistics
  - supply-chain
---
# Idea: Logistics & Supply Chains

Treat products, shipments, and routes as recognitions so flows are explicit and traceable.

## 1. Recognitions

- `ProductRecognition`: goods with specs and sources.
- `ShipmentRecognition`: movements between locations.
- `RouteRecognition`: paths and modes of transport.
- `WarehouseRecognition`: storage nodes.

## 2. Topology and measurement

- Topology:
  - supplier networks, route graphs, inventory relationships.
- Measurement:
  - delays, lead times, stockouts, emissions, spoilage.

Runbooks: `plan_shipment`, `reroute`, `rebalance_inventory` allow logistics to live in the same relational space as everything else.
