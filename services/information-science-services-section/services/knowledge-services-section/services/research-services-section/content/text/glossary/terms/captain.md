---
inversion: captains
---

# captain

`captain` names the person who commands a ship. Inversion populates `captains` at the captain subject so a query at a person returns the ships they command, without anyone authoring the reverse claim by hand. The relation is one-to-many in principle (a captain can command several ships across time) but the substrate keeps each ship's `captain` claim separate, and the inversion preserves channel.
