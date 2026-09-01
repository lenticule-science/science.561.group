---
inversion: delegate-of
---

# delegates-to

`delegates-to` carries the offices an office can delegate work to. Inversion populates `delegate-of` at each delegate subject so a query at any office returns which superiors can delegate to it. Composes with `reports-to` / `reported-to-by`: delegation is the downward-facing power, accountability is the upward-facing duty, and both fibers are walkable from any office.
