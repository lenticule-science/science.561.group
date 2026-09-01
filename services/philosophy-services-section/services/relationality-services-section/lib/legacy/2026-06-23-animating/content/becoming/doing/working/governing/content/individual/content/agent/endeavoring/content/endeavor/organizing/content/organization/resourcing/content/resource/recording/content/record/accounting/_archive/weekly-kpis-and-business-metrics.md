---
title: "Weekly KPIs and Business Metrics"
date-created: 2026-03-06T00:00:00
type: lesson
aliases:
  - "Weekly KPIs and Business Metrics"
  - "weekly KPIs and business metrics"
keywords:
  - Business
description: "What to measure, how often, and what the numbers mean — building a weekly dashboard of leading and lagging indicators that lets the owner detect problems early and make decisions from data."
requires:
  - /business/curricula/reading-financial-statements.md
  - /business/curricula/managing-cash-flow.md
teaches:
  - "Leading vs. lagging indicators"
  - "Weekly cash and revenue metrics"
  - "Operational metrics: labor, food cost, capacity"
  - "Customer metrics: acquisition, retention, average check"
  - "Building a one-page weekly dashboard"
  - "Setting thresholds and triggers"
---

## What this lesson covers

Financial statements tell you what happened last month or last quarter — they're rearview mirrors.
This lesson covers the forward-looking metrics (leading indicators) and the real-time operational metrics that let you detect problems early, course-correct weekly, and run the business from data rather than intuition.
The output is a one-page weekly dashboard: the 8–12 numbers you look at every Monday morning.

## Prerequisites

[Reading Financial Statements](./reading-financial-statements.md) and [Managing Cash Flow](./managing-cash-flow.md).
You need to understand what the financial statements measure before building metrics that supplement them.

---

## Leading vs. lagging indicators

**Lagging indicators** report outcomes after they've happened: monthly revenue, quarterly profit, annual growth.
They're important but slow — by the time they show a problem, the problem has been building for weeks.

**Leading indicators** predict future outcomes: daily customer count trends, this week's reservation bookings, today's cash position vs. forecast.
They show problems early enough to respond.

| Lagging (outcome) | Leading (predictor) |
|---|---|
| Monthly revenue | Daily/weekly sales trend vs. last year |
| Quarterly profit | Weekly food cost % and labor cost % |
| Annual customer retention | Weekly repeat customer rate |
| Monthly cash balance | Weekly cash forecast accuracy |

A good dashboard combines both: lagging indicators confirm whether past actions worked; leading indicators show where to act now.

---

## The weekly dashboard

### Financial metrics

**1.
Weekly revenue (and vs. same week last year)**

Total revenue for the week, compared to the same week one year ago (or same week last month for a new business).
This controls for seasonality — comparing March to March, not March to February.

**What it tells you**: Top-line trend.
Is the business growing, flat, or declining?
Week-to-week volatility is normal; four consecutive weeks of decline is a pattern requiring investigation.

**Source**: [POS](../terms/point-of-sale.md) daily reports, summed weekly.

---

**2.
Cash position (actual vs. forecast)**

The bank balance right now, compared to what the [cash flow forecast](./managing-cash-flow.md) predicted for this date.

**What it tells you**: Whether your cash forecast is accurate and whether the business is on track.
If actual cash is consistently below forecast, either revenue is soft, expenses are higher than planned, or collections are slow.

**Source**: Bank account balance (check Monday morning).
Compare to the rolling forecast.

---

**3.
[Accounts receivable](../terms/accounts-receivable.md) aging**

Total outstanding AR, broken into buckets: current (not yet due), 1–30 days past due, 31–60 days past due, 60+ days past due.

**What it tells you**: How much money is owed to you and how collectible it is.
AR aging past 60 days is at high risk of becoming uncollectible.
The total AR figure also affects [working capital](../terms/working-capital.md) — receivables aren't cash until they're collected.

**Source**: Accounting software AR aging report.

---

### Operational metrics

**4.
Food cost percentage (or COGS %)**

[Cost of goods sold](../terms/cost-of-goods-sold.md) ÷ Revenue for the week.

**What it tells you**: Whether ingredient costs are under control.
Track weekly to catch problems (supplier price increases, portioning drift, waste) before they compound.
Compare to your target (typically 28–35% for restaurants).

**Source**: Purchases this week (from invoices or accounting software) plus beginning and ending [inventory](../terms/inventory.md) if you count weekly.
For a simpler weekly proxy: total food purchases ÷ total food revenue.

---

**5.
Labor cost percentage**

Total labor cost (wages + employer [payroll](../terms/payroll.md) taxes) ÷ Revenue for the week.

**What it tells you**: Whether staffing levels match revenue.
A high labor percentage during a slow week is expected; a high labor percentage during a busy week means either too many people are scheduled or per-employee productivity is low.

**Target**: Varies by business type.
Full-service restaurants: 28–35%.
Quick-service: 25–30%.
Retail: 15–25%.

**Source**: Payroll system or scheduling software (scheduled hours × rate) compared to POS revenue.

---

**6.
[Gross margin](../terms/gross-margin.md)**

(Revenue − COGS) ÷ Revenue, expressed as a percentage.

**What it tells you**: The combined picture of pricing power and cost control.
Gross margin declining over several weeks signals that input costs are rising faster than prices, portions are growing, or waste is increasing.

**Source**: Calculated from metrics 1 and 4.

---

**7.
Capacity utilization**

What percentage of total capacity was used this week?

For a restaurant: (actual covers served ÷ maximum possible covers) × 100.
If you have 50 seats, turn tables twice per service, and operate 6 days: maximum = 50 × 2 × 6 = 600 covers/week.
If you served 420 covers, utilization is 70%.

**What it tells you**: How much room you have to grow without adding capacity (seats, hours, staff).
At 90%+ utilization, the business is near capacity — growth requires physical expansion, extended hours, or higher [average check](../terms/average-check.md).
Below 50%, the priority is driving more customers, not improving operations.

**Source**: POS cover count or transaction count.

---

### Customer metrics

**8.
[Average check](../terms/average-check.md) (and trend)**

Total revenue ÷ Total transactions for the week.

**What it tells you**: Whether customers are spending more or less per visit.
A declining average check may indicate menu mix shifting toward lower-priced items, reduced add-on sales, or discount-driven traffic.
An increasing average check may reflect successful upselling, menu price increases, or [menu engineering](../terms/menu-engineering.md) improvements.

**Source**: POS summary report.

---

**9.
Customer count (and trend)**

Total unique transactions (or covers) per week.

**What it tells you**: Top-line traffic.
Revenue is customer count × average check.
If revenue declines, this metric tells you whether you're losing customers (count down, check flat) or losing spend per customer (count flat, check down) — two different problems requiring two different responses.

**Source**: POS transaction count.

---

**10.
New vs. repeat customer ratio**

What percentage of this week's customers are returning?
(Measurable if you use a loyalty program, email capture, or POS with customer tracking.)

**What it tells you**: Customer retention.
A business that depends entirely on new customers is running on a treadmill — acquisition is expensive and unreliable.
A high repeat rate (50%+ for a neighborhood restaurant) indicates satisfaction and habit formation.
A declining repeat rate is an early warning of quality or experience problems.

**Source**: Loyalty program data, POS customer records, or manual tracking.

---

## Building the dashboard

### Format

One page.
Print it or display it on a screen.
The owner (and the management team, if there is one) reviews it every Monday morning.

| Metric | This week | Last week | Same week last year | Target | Status |
|---|---|---|---|---|---|
| Revenue | \$12,400 | \$11,800 | \$11,200 | \$12,000 | On track |
| Cash position | \$8,100 | \$7,400 | — | Per forecast | \$600 below |
| AR outstanding | \$3,200 | \$2,800 | — | <\$3,000 | Watch |
| Food cost % | 31.2% | 29.8% | 30.5% | ≤30% | Over |
| Labor cost % | 27.4% | 28.1% | 27.0% | ≤28% | On track |
| Gross margin | 68.8% | 70.2% | 69.5% | ≥70% | Under |
| Capacity utilization | 72% | 68% | 64% | — | Growing |
| Average check | \$18.40 | \$18.20 | \$17.50 | ≥\$18 | On track |
| Customer count | 674 | 648 | 640 | ≥650 | On track |
| Repeat customer % | 48% | 51% | — | ≥50% | Watch |

### Reading the dashboard

This week's story: Revenue is on track and growing year-over-year.
Customer count and average check are both healthy.
But food cost spiked to 31.2% (over the 30% target), which pulled gross margin below 70%.
Cash is \$600 below forecast, partly because AR grew by \$400 (a pending invoice).
Repeat customer rate dipped below 50%.

**Actions this week:** - Investigate food cost: check waste log, verify portion sizes, review this week's invoices for price changes. - Follow up on the overdue AR — which invoices are aging? - Look at customer feedback from the past two weeks — anything explaining the repeat rate dip?

This takes 15 minutes.
Without the dashboard, these issues might not surface until the monthly financial statements arrive — three weeks later.

---

## Thresholds and triggers

Set automatic trigger points for critical metrics:

| Metric | Green | Yellow | Red |
|---|---|---|---|
| Cash position vs. forecast | Within \$1,000 | \$1,000–\$3,000 below | >\$3,000 below |
| Food cost % | ≤30% | 30–33% | >33% |
| Labor cost % | ≤28% | 28–32% | >32% |
| AR aging >30 days | <\$1,000 | \$1,000–\$3,000 | >\$3,000 |
| Weekly revenue vs. target | ≥95% | 85–95% | <85% |

**Green**: No action needed.
Monitor. **Yellow**: Investigate this week.
Identify the cause.
Prepare a response if it continues. **Red**: Act this week.
The issue is costing real money and will compound if unaddressed.

---

## Advanced metrics (once the basics are stable)

Once you're consistently tracking the core 10, consider adding:

**Customer acquisition cost (CAC)**: Monthly marketing spend ÷ new customers acquired.
If you spent \$800 on marketing and gained 40 new customers, CAC is \$20.
Compare this to the average customer's lifetime value to determine if marketing spend is justified.

**Inventory turnover**: [COGS](../terms/cost-of-goods-sold.md) ÷ Average inventory value.
Higher turnover means less cash tied up in stock.
For perishable goods, turnover below 1× per week suggests over-ordering.

**Revenue per labor hour**: Total revenue ÷ Total labor hours worked.
This measures team productivity independent of wage rates.
Declining revenue per labor hour means you're either overstaffed or underperforming on sales.

**[Break-even](../terms/break-even-analysis.md) tracking**: Cumulative weekly revenue vs. the weekly break-even point.
Are you above or below break-even, and by how much?

---

## Guidance

- Build your first weekly dashboard using the 10 metrics above.
  Fill in this week's numbers.
  Which metrics can you pull from existing systems (POS, accounting software, bank)?
  Which require new tracking?
- Set threshold levels (green/yellow/red) for your five most important metrics based on your [financial projections](../terms/financial-projections.md) and industry benchmarks.
  What would trigger you to act?
- Review the dashboard for four consecutive weeks.
  What patterns emerge?
  Which metrics correlate (e.g., does customer count predict revenue better than average check)?
