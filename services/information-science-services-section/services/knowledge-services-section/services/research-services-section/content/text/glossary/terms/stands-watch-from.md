---
inversion: watch-station-of
---

# stands-watch-from

`stands-watch-from` names the location an office stands its watch from (the bridge, the comms console, the ledger desk). Inversion populates `watch-station-of` at the location subject so a query at a place returns which offices stand watch there. The location is itself a substrate subject (the bridge is a room with its own predicates), so this inversion lets the spatial geometry compose with the office geometry.
