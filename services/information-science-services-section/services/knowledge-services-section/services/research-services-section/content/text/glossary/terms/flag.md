---
inversion: flown-by
---

# flag

`flag` names whose colors a ship flies — typically the commissioning confederacy. Inversion populates `flown-by` at the flag subject so a query at a confederacy returns the ships flying its flag. Independent of `commissioned-by` and `chartered-by`: a ship's flag can change without recommissioning (e.g. a transfer between confederacies), and the predicate separation lets each act be witnessed in its own fiber.
