---
name: shopping-wishlists
keywords:
  - idea
  - shopping
  - wishlist
part-of: relational-computer
description: "Tracks products, prices, and purchases as recognitions for practical planning."
---

Track products, prices, and purchases as recognitions for practical day-to-day
planning.

## 1. Recognitions

- `ProductRecognition`: item name, brand, specs, URLs, tags.
- `StoreRecognition`: vendors (online/local) with metadata.
- `WishlistItemRecognition`: product + priority + context (“for project X”).
- `PurchaseRecognition`: purchase events with price, date, store, notes.

## 2. Topology and measurement

- Topology:
  - products ↔ projects, gifts ↔ people, vendors ↔ categories.
- Measurement:
  - spending by category, price history, regret/satisfaction notes.

Runbooks like `add_to_wishlist`, `plan_purchases`, `review_spending` keep this
simple but structured.

