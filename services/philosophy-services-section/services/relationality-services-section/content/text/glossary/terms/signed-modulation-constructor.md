---
name: signed modulation constructor
symbol: ζ
type: signed value constructor
domains: N × {+, −}
codomain: Zμ
description: Constructs a signed modulation value from a magnitude and direction tag. This function builds Zμ by creating modulation-aware pairs that support total difference and bidirectional constraint operations.
aliases:
  - Signed Modulation Constructor
introduces: signed value constructor
---

ζ(n, s) := (n, s)  
 where n ∈ N  
    s ∈ {+, −}

Codomain:
Zμ := Image(ζ) = { ζ(n, s) | n ∈ N, s ∈ {+, −} }

Interpretation:
This function constructs signed modulation values explicitly.  
It forms the functional entry point into Zμ and grounds all bidirectional trace operations.

Canonical identity:
ζ(0, +) = ζ(0, −) = Ø  // modulation zero

Related operations:
- Inversion: inv(ζ(n, s)) = ζ(n, flip(s))  
  where flip(+) = −, flip(−) = +
