---
name: "vendor lock-in"
aliases:
  - platform lock-in
  - cloud lock-in
date-created: 2026-04-03
description: "A dependency on a specific vendor's proprietary technology that makes switching to an alternative expensive or impractical."
---

**Vendor lock-in** is a condition where a customer depends on a vendor's proprietary technology to the point where switching to an alternative would be prohibitively expensive, time-consuming, or risky. The dependency is created not by contract (though contracts may reinforce it) but by technical coupling — the customer's systems use interfaces, formats, or services that only one vendor provides.

In computing, lock-in arises from three sources:

**Proprietary APIs.** When an application is built on a vendor-specific service (AWS Lambda, Google BigQuery, Azure Cosmos DB), the application's code contains calls to that vendor's API. Migrating to another provider requires rewriting every integration point. The more services used, the deeper the coupling.

**Proprietary data formats.** When data is stored in a vendor-specific format or database that lacks standard export mechanisms, extracting the data for migration is difficult or lossy. This is especially acute for managed databases and analytics platforms that accept standard SQL for input but use proprietary storage internally.

**Ecosystem integration.** When a vendor's services work well together but poorly with external tools, using one service creates pressure to use others. Each additional service deepens the dependency. Cloud platforms are designed to produce this effect — their managed services integrate tightly with each other and loosely (or not at all) with competitors.

The cost of lock-in is not the vendor's current pricing — it is the vendor's future pricing, because the customer has lost the ability to leave. Vendors with locked-in customers can raise prices, degrade service, or change terms with limited competitive pressure.

Countermeasures include [infrastructure as code](./infrastructure-as-code.md) (defining infrastructure in portable configuration), [software containers](./software-container.md) (packaging applications independent of the host environment), open standards (SQL, HTTP, OCI container format), and multi-cloud strategies (distributing workloads across vendors to limit dependency on any one).

A 2025 trend documented across multiple sources is **cloud repatriation** — organizations moving workloads from hyperscale cloud platforms back to VPS or self-hosted infrastructure, motivated by cost predictability and reduced vendor dependency. The pattern is most pronounced among small teams whose workloads do not require elastic scaling.
