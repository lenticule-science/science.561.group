---
title: "Calculate Depreciation"
type: skill
date-created: 2026-03-06T00:00:00
keywords:
  - Accounting
---

[Depreciation](../../../glossary/terms/depreciation.md) systematically allocates
the depreciable amount of a long-lived asset across the periods expected to
consume its service potential. It is not a periodic appraisal of market value.
Calculation begins only after the asset, historical cost, capitalization
policy, in-service date, residual value, useful life, and method are supported.

**Key terms:**
- **Cost**: recognized acquisition or construction cost under the governing
  basis, which may differ from a single invoice price
- **Salvage value** (residual value): the estimated value at the end of its useful life
- **Depreciable base**: cost minus salvage value
- **Useful life**: how long the business expects to use the asset

**Straight-line depreciation**
The simplest method — equal expense each period.

Formula: `(cost - residual value) / useful life`

Example: A machine costs \$50,000, has a salvage value of \$5,000, and a useful life of 10 years.
Annual depreciation = (\$50,000 - \$5,000) / 10 = \$4,500 per year.

The [journal entry](../../../glossary/terms/journal.md) each year:

| Account | Debit | Credit |
|---|---|---|
| Depreciation Expense | \$4,500 | |
| Accumulated Depreciation | | \$4,500 |

After 3 years, accumulated depreciation is \$13,500 and the book value (carrying value) is \$50,000 - \$13,500 = \$36,500.

**Double-declining balance depreciation**
An accelerated method — higher expense in early years, lower in later years.

Formula: `(2 / useful life) × carrying amount at beginning of period`

Same machine: Rate = 2/10 = 20%.
- Year 1: 20% × \$50,000 = \$10,000 (book value drops to \$40,000)
- Year 2: 20% × \$40,000 = \$8,000 (book value drops to \$32,000)
- Year 3: 20% × \$32,000 = \$6,400 (book value drops to \$25,600)
- Continue until book value reaches salvage value, then stop depreciating.

Double-declining balance applies its rate to the opening carrying amount rather
than subtracting residual value before each calculation. Expense is capped so
the asset is not depreciated below its residual value.

## Partial periods, changes, and disposal

The allocation starts when the asset is available for its intended use, not
necessarily when it is ordered or paid for. The entity's convention determines
partial-period expense, but that convention must be applied consistently and
must not override a governing reporting or tax rule.

Useful life, residual value, and consumption pattern are estimates. When the
applicable framework requires reassessment, a supported change is generally
applied prospectively to the remaining depreciable amount; it is not a silent
rewrite of prior expense. Impairment is a separate measurement from routine
depreciation. On disposal, stop depreciation at the appropriate date,
derecognize cost and accumulated depreciation, record consideration received,
and recognize the resulting gain or loss under the governing basis.

**When to use which:** For financial reporting, select the permitted method that
represents the expected consumption pattern and revisit the required estimates
under the governing framework. Tax depreciation is a separate measurement. In
the United States, the current [IRS Publication 946](https://www.irs.gov/publications/p946)
describes which property uses MACRS, the applicable systems, recovery periods,
methods, conventions, elections, and exceptions. A book method must not be
silently reused as a tax conclusion, or vice versa.
