---
title: Inventory and Assets
keywords:
  - idea
  - inventory
  - assets
part-of: relational-computer
description: "Models physical and digital assets as recognitions to track ownership, location, and usage."
---
# Idea: Inventory & Assets

Model physical and digital assets as recognitions to keep track of what you own, where it is, and how it’s used.

## 1. Recognitions

- `AssetRecognition`: devices, books, tools, licenses, subscriptions.
- `LocationRecognition`: shelves, rooms, storage units, virtual locations.
- `AssignmentRecognition`: who is using/holding an asset.
- `MaintenanceRecognition`: repairs, updates, replacements.

## 2. Topology and measurement

- Topology:
  - asset ↔ location, asset ↔ person, asset ↔ projects.
- Measurement:
  - usage frequency, age, condition, cost-of-ownership.

Runbooks: `add_asset`, `move_asset`, `schedule_maintenance`, `decommission` provide a straightforward asset tracker.
