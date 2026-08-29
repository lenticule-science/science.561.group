---

title: "Customer Lifetime Value"
description: "The total revenue a business expects to earn from a single customer over the entire duration of their relationship — the metric that determines sustainable acquisition spending."
defines: Customer Lifetime Value
domain: business
measures: audience
contrasts-with: customer-acquisition-cost
determined-by: churn-rate
governs: [marketing-plan, e-commerce]
date-created: 2026-03-29
---

Customer lifetime value (LTV) is the total revenue a business expects to earn from a single customer over the entire duration of their relationship. It is the most important metric in any recurring-revenue business because it determines how much the business can spend to acquire each customer while remaining profitable.

The simplest formula for a subscription business:

$$\text{LTV} = \frac{\text{Average Revenue Per Customer Per Period}}{\text{Churn Rate Per Period}}$$

A $10/month subscription with a 5% monthly [churn rate](theories/marketing/theories/digital-marketing/terms/churn-rate.md) has an LTV of $10 / 0.05 = $200. The same subscription with 2% churn has an LTV of $500. This formula assumes constant revenue per customer and constant churn — both simplifications, but useful for back-of-envelope calculations that drive real decisions.

A more precise formulation accounts for margins (not all revenue is profit), discount rates (a dollar received in three years is worth less than a dollar today), and variable revenue (customers may upgrade, downgrade, or make additional purchases over time). But the simple formula captures the essential insight: **LTV is driven more by retention than by price.** Halving the churn rate doubles LTV. Doubling the price doubles LTV only if churn doesn't increase — and it usually does, because [price elasticity](../../economics/terms/price-elasticity.md) means some customers will leave at the higher price.

The strategic use of LTV is in combination with [customer acquisition cost](theories/marketing/terms/customer-acquisition-cost.md) (CAC). The **LTV:CAC ratio** determines whether the unit economics of the business work:

| LTV:CAC ratio | Interpretation |
|---|---|
| Below 1:1 | The business loses money on every customer |
| 1:1 to 3:1 | Marginally viable; growth investment may not pay off |
| 3:1 to 5:1 | Healthy — the business earns back its acquisition cost with margin |
| Above 5:1 | Either very efficient or underinvesting in growth |

A venture-funded SaaS company might tolerate a 1:1 ratio early on, betting that improving the product will reduce churn and increase LTV over time. A bootstrapped content business needs 3:1 or better from the start because it cannot absorb prolonged losses.

LTV varies by customer segment, and treating it as a single company-wide number obscures important strategic information. Customers acquired through organic search might have higher LTV than customers acquired through paid advertising (because they found the product themselves, suggesting stronger intent). Customers on annual plans have higher LTV than monthly customers (lower churn). Customers in certain industries or demographics may generate more revenue or stay longer. Segmented LTV analysis tells the business where to focus acquisition spending and what customer types to optimize the product for.

For web publishers specifically, LTV applies most directly to subscription and membership models. A newsletter with 1,000 paying subscribers at $8/month and 3% monthly churn has an average subscriber LTV of $267. If the publisher spends $50 in content and marketing effort per new subscriber acquired, the LTV:CAC ratio is approximately 5:1 — healthy. If churn rises to 8% (perhaps because publication frequency drops), LTV falls to $100 and the ratio drops to 2:1 — now the business is barely viable.
