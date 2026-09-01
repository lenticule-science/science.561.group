---

name: "Churn Rate"
description: "Churn rate is the percentage of subscribers who cancel their subscription within a given period, usually expressed monthly or annually."
date-created: 2026-03-29T00:00:00
aliases:
  - "churn rate"
  - "subscriber churn"
  - "customer churn"
  - "attrition rate"
keywords:
  - business
  - web
  - subscriptions
  - metrics
part-of: business/domains/web/terms
---

Churn rate is the percentage of subscribers who cancel their subscription within a given period, usually expressed monthly or annually. The formula:

$$\text{Monthly Churn Rate} = \frac{\text{Subscribers lost during the month}}{\text{Subscribers at start of month}} \times 100$$

Churn is the gravitational force that subscription businesses must constantly overcome. A subscription model does not just need to acquire new subscribers — it needs to retain existing ones faster than they leave. If a publication has 10,000 subscribers, a 5% monthly churn rate means 500 cancellations per month. To merely maintain its subscriber count, it must acquire 500 new subscribers every month. To grow, it must acquire more than that. This is why churn rate, not acquisition rate, is typically the binding constraint on subscription revenue growth.

The relationship between churn rate and subscriber lifetime is inverse and often unintuitive. At 5% monthly churn, the average subscriber stays for 20 months. At 3%, they stay for 33 months. At 1%, they stay for 100 months — over eight years. Small differences in churn produce large differences in **subscriber lifetime value** (LTV), which is calculated as:

$$\text{LTV} = \frac{\text{Average Revenue Per Subscriber Per Month}}{\text{Monthly Churn Rate}}$$

A $10/month subscription with 5% churn has an LTV of $200. The same subscription with 2% churn has an LTV of $500. This math explains why mature subscription businesses invest heavily in retention — reducing churn from 5% to 2% is worth more than doubling the subscriber acquisition rate.

Churn has two components: **voluntary churn** (the subscriber actively decides to cancel) and **involuntary churn** (the subscription lapses because of a failed payment — expired credit card, insufficient funds, bank decline). Involuntary churn accounts for 20-40% of total churn in digital subscriptions. It is recoverable through dunning (automated emails prompting the subscriber to update their payment method), payment retry logic, and card-updater services that automatically refresh expired card details. Reducing involuntary churn is the highest-leverage retention intervention because it requires no change in the product — only better payment infrastructure.

Benchmarks for digital content subscriptions as of 2025: monthly churn below 3% is strong, 3-5% is typical, and above 7% indicates a product or pricing problem. Annual subscription plans dramatically reduce measured churn because they lock subscribers in for longer and concentrate cancellation decisions at renewal points — annual plans typically show 15-25% annual churn versus 30-45% annualized churn from monthly plans.