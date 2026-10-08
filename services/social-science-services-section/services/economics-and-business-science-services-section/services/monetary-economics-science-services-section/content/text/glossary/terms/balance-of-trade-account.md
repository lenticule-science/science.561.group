---
aliases:
  - BoT account
  - intertrading account
description: In the Credit Commons protocol the balance-of-trade account is a node's account on its rootwards node, which records the net position of all the node's members against the rest of the tree and which members commit to bring back toward zero.
identity: balance-of-trade-account
name: Balance-of-trade account
date-created: 2026-10-08
---
In the Credit Commons protocol, nodes form a tree and each node has at most one rootwards account, called the balance-of-trade (BoT) account. A payment from a local account to a remote one debits the local account and credits the BoT account on the local node, while on the rootwards node the local node's account is debited; members connecting to a rootwards node commit to restoring the BoT balance to zero in the long run ([Mutual Credit at Scale](../../documents/articles/notes/2026/10/08/2026-10-08-mutual-credit-first-party-sardex-wir-credit-commons.md)).

It is the object that makes a group's net external position visible and that gives a federation a clearing duty. Limits on every account straddle zero.
