---
title: "American gig work as a workforce and a cost structure"
description: "The founding research note of gig-work-science-services-section: who does American gig work, what it pays net of costs, the federal tax mechanics, the benefit interactions, the state and city pay-floor laws, the algorithmic-management literature, and the worker-owned data-cooperative precedent — every figure cited to a first-party source with its published date, its effective date, and the date this note observed it."
date-created: 2026-09-05
type: notes
authors:
  - claude-sonnet-5
references:
  bls2024conemp:
    authors: ["U.S. Bureau of Labor Statistics"]
    title: "Contingent and Alternative Employment Arrangements — July 2023"
    publisher: "U.S. Bureau of Labor Statistics, News Release USDL-24-2244"
    year: 2024
    url: "https://www.bls.gov/news.release/conemp.nr0.htm"
  pew2021gig:
    authors: ["Pew Research Center"]
    title: "The State of Gig Work in 2021"
    publisher: "Pew Research Center"
    year: 2021
    url: "https://www.pewresearch.org/internet/2021/12/08/the-state-of-gig-work-in-2021/"
  frb2025shed:
    authors: ["Board of Governors of the Federal Reserve System"]
    title: "Report on the Economic Well-Being of U.S. Households in 2024 — Employment and Gig Work"
    publisher: "Federal Reserve Board"
    year: 2025
    url: "https://www.federalreserve.gov/publications/2025-economic-well-being-of-us-households-in-2024-employment-and-gig-work.htm"
  uber202510k:
    authors: ["Uber Technologies, Inc."]
    title: "Uber Technologies, Inc. Form 10-K for the fiscal year ended December 31, 2025"
    publisher: "U.S. Securities and Exchange Commission, EDGAR"
    year: 2026
    url: "https://www.sec.gov/Archives/edgar/data/1543151/000154315126000015/uber-20251231.htm"
  lyft202510k:
    authors: ["Lyft, Inc."]
    title: "Lyft Reports Record Q4 and Full-Year 2025 Results"
    publisher: "Lyft, Inc."
    year: 2026
    url: "https://www.lyft.com/blog/posts/lyft-reports-record-q4-and-full-year-2025-results"
  doordash2025dashreport:
    authors: ["DoorDash, Inc."]
    title: "Dash Report 2025: Delivery in America"
    publisher: "DoorDash, Inc."
    year: 2025
    url: "https://dasher.doordash.com/en-us/dash-report-2025"
  maplebear202510k:
    authors: ["Maplebear Inc. (Instacart)"]
    title: "Maplebear Inc. (Instacart) Form 10-K for the fiscal year ended December 31, 2025"
    publisher: "U.S. Securities and Exchange Commission, EDGAR"
    year: 2026
    url: "https://www.sec.gov/Archives/edgar/data/1579091/000157909126000018/cart-20251231.htm"
  zoepf2018:
    authors: ["Stephen M. Zoepf", "Stella Chen", "Paa Adu", "Gonzalo Pozo"]
    title: "The Economics of Ride-Hailing: Driver Revenue, Expenses, and Taxes"
    publisher: "MIT Center for Energy and Environmental Policy Research, Working Paper 2018-005"
    year: 2018
    url: "https://ceepr.mit.edu/publications/working-papers/"
    note: "Original median $3.37/hour before taxes; lead author Zoepf publicly corrected the vehicle-cost treatment in March 2018 to a median $8.55/hour, with 41-54 percent of drivers still below their state minimum wage."
  berkeley2022prop22:
    authors: ["UC Berkeley Labor Center", "Center for Wage and Employment Dynamics"]
    title: "Ride-hailing and delivery drivers' net pay under Proposition 22"
    publisher: "National Equity Atlas / UC Berkeley Labor Center"
    year: 2022
    url: "https://www.nationalequityatlas.org/research/analyses/prop-22-pay-study"
    note: "Data collected January 2022: 52,370 trips by 1,088 drivers across six platforms in five metro areas (Boston, Chicago, Los Angeles, San Francisco Bay, Seattle)."
  parrottreich2018:
    authors: ["James A. Parrott", "Michael Reich"]
    title: "An Earnings Standard for New York City's App-based Drivers"
    publisher: "Center for New York City Affairs, The New School, and the Institute for Research on Labor and Employment, UC Berkeley"
    year: 2018
    url: "http://www.centernyc.org/an-earnings-standard"
  parrottreich2020:
    authors: ["James A. Parrott", "Michael Reich"]
    title: "A Minimum Compensation Standard for Seattle TNC Drivers"
    publisher: "Report to the City of Seattle Office of Labor Standards"
    year: 2020
    url: "https://www.seattle.gov/documents/Departments/LaborStandards/Parrott-Reich-Seattle-Report_July-2020(0).pdf"
  nycdcwp2022:
    authors: ["NYC Department of Consumer and Worker Protection"]
    title: "A Minimum Pay Rate for App-Based Restaurant Delivery Workers in NYC"
    publisher: "City of New York"
    year: 2022
    url: "https://rules.cityofnewyork.us/wp-content/uploads/2023/06/DCWP-NOA-Minimum-Pay-for-Food-Delivery-Workers.pdf"
    note: "Study mandated by Local Law 115 of 2021; corroborated through the 2023 rulemaking record after a direct fetch of the November 2022 report returned an HTTP 403."
  irs2025mileagenotice:
    authors: ["Internal Revenue Service"]
    title: "IRS sets 2026 business standard mileage rate at 72.5 cents per mile, up 2.5 cents (IR-2025-128; Notice 2026-10)"
    publisher: "Internal Revenue Service"
    year: 2025
    url: "https://www.irs.gov/newsroom/irs-sets-2026-business-standard-mileage-rate-at-725-cents-per-mile-up-25-cents"
  irs2026mileageannouncement:
    authors: ["Internal Revenue Service"]
    title: "Announcement 2026-11: revised standard mileage rates, 2026-29 I.R.B. 49"
    publisher: "Internal Revenue Service"
    year: 2026
    url: "https://www.irs.gov/irb/2026-29_irb"
  irs2026semploymenttax:
    authors: ["Internal Revenue Service"]
    title: "Self-Employment Tax (Social Security and Medicare Taxes)"
    publisher: "Internal Revenue Service"
    year: 2026
    url: "https://www.irs.gov/businesses/small-businesses-self-employed/self-employment-tax-social-security-and-medicare-taxes"
  irs2026f1099k:
    authors: ["Internal Revenue Service"]
    title: "Understanding Your Form 1099-K"
    publisher: "Internal Revenue Service"
    year: 2026
    url: "https://www.irs.gov/businesses/understanding-your-form-1099-k"
  irs2026f1099nec:
    authors: ["Internal Revenue Service"]
    title: "About Form 1099-NEC"
    publisher: "Internal Revenue Service"
    year: 2026
    url: "https://www.irs.gov/forms-pubs/about-form-1099-nec"
  obbba2025:
    authors: ["119th Congress of the United States"]
    title: "One Big Beautiful Bill Act (Public Law 119-21)"
    publisher: "U.S. Government Publishing Office"
    year: 2025
    note: "Enacted 2025-07-04; made the section 199A Qualified Business Income deduction permanent, reverted the Form 1099-K threshold to $20,000/200 transactions, and raised the Form 1099-NEC/1099-MISC threshold to $2,000 for payments made after 2025-12-31."
  irs2026qbi:
    authors: ["Internal Revenue Service"]
    title: "Qualified Business Income Deduction"
    publisher: "Internal Revenue Service"
    year: 2026
    url: "https://www.irs.gov/newsroom/qualified-business-income-deduction"
  ssa2024ssiresources:
    authors: ["Social Security Administration"]
    title: "POMS SI 01110.003 — Resources Limits for SSI Benefits"
    publisher: "Social Security Administration"
    year: 2024
    url: "https://secure.ssa.gov/poms.nsf/lnx/0501110003"
  crs2026ptc:
    authors: ["Congressional Research Service"]
    title: "Enhanced Premium Tax Credit and 2026 Exchange Premiums: Frequently Asked Questions (R48290)"
    publisher: "Congressional Research Service"
    year: 2026
    url: "https://www.congress.gov/crs-product/R48290"
  castellanos2024:
    authors: ["Supreme Court of California"]
    title: "Castellanos v. State of California, No. S279622"
    publisher: "Supreme Court of California"
    year: 2024
    url: "https://law.justia.com/cases/california/supreme-court/2024/s279622.html"
  nycdcwp2026rate:
    authors: ["NYC Department of Consumer and Worker Protection"]
    title: "Delivery Worker Laws: FAQs"
    publisher: "City of New York"
    year: 2026
    url: "https://www.nyc.gov/site/dca/workers/workersrights/food-delivery-worker-laws-faqs.page"
  seattle2026payup:
    authors: ["Seattle Office of Labor Standards"]
    title: "App-Based Worker Minimum Payment Ordinance (SMC 8.37)"
    publisher: "City of Seattle"
    year: 2026
    url: "https://www.seattle.gov/laborstandards/ordinances/app-based-worker-ordinances/app-based-worker-minimum-payment-ordinance"
  minnesota2024tncpay:
    authors: ["Minnesota Department of Labor and Industry"]
    title: "New statewide minimum compensation for transportation network company drivers"
    publisher: "State of Minnesota"
    year: 2024
    url: "https://www.dli.mn.gov/node/7291"
  washington2022hb2076:
    authors: ["Washington State Legislature"]
    title: "House Bill 2076 (2021-2022): concerning rights and obligations of transportation network company drivers and transportation network companies"
    publisher: "Washington State Legislature"
    year: 2022
    url: "https://app.leg.wa.gov/billsummary?BillNumber=2076&Year=2021"
  rosenblatstark2016:
    authors: ["Alex Rosenblat", "Luke Stark"]
    title: "Algorithmic Labor and Information Asymmetries: A Case Study of Uber's Drivers"
    publication: "International Journal of Communication 10"
    year: 2016
    url: "https://ijoc.org/index.php/ijoc/article/view/4892"
  woodgraham2019:
    authors: ["Alex J. Wood", "Mark Graham", "Vili Lehdonvirta", "Isis Hjorth"]
    title: "Good Gig, Bad Gig: Autonomy and Algorithmic Control in the Global Gig Economy"
    publication: "Work, Employment and Society 33(1), pp. 56-75"
    year: 2019
    doi: "10.1177/0950017018785616"
  griesbach2019:
    authors: ["Kathleen Griesbach", "Adam Reich", "Luke Elliott-Negri", "Ruth Milkman"]
    title: "Algorithmic Control in Platform Food Delivery Work"
    publication: "Socius 5"
    year: 2019
    doi: "10.1177/2378023119870041"
  driversseat2023:
    authors: ["The Rockefeller Foundation"]
    title: "Driver's Seat Puts Data — and Power — in Gig Workers' Hands"
    publisher: "The Rockefeller Foundation"
    year: 2023
    url: "https://www.rockefellerfoundation.org/grantee-impact-stories/drivers-seat-puts-data-and-power-in-gig-workers-hands/"
  wao2026:
    authors: ["The Workers' Algorithm Observatory"]
    title: "The Workers' Algorithm Observatory"
    publisher: "Princeton University"
    year: 2026
    url: "https://wao.cs.princeton.edu/"
  aaa2025drivingcosts:
    authors: ["AAA"]
    title: "Your Driving Costs 2025"
    publisher: "American Automobile Association"
    year: 2025
    url: "https://newsroom.aaa.com/wp-content/uploads/2025/09/UPDATE-AAA-Fact-Sheet-Your-Driving-Cost-9.2025-1.pdf"
  uber2026instantpay:
    authors: ["Uber Technologies, Inc."]
    title: "Cashing out with Instant Pay"
    publisher: "Uber Help Center"
    year: 2026
    url: "https://help.uber.com/en/driving-and-delivering/article/cashing-out-with-instant-pay?nodeId=1287939c-a6bb-448b-8d1a-20fa887aa7cb"
  lyft2026expresspay:
    authors: ["Lyft, Inc."]
    title: "Express Pay"
    publisher: "Lyft Help Center"
    year: 2026
    url: "https://help.lyft.com/hc/en-us/all/articles/115012923167-Express-Pay"
  doordash2026fastpay:
    authors: ["DoorDash, Inc."]
    title: "What is Fast Pay?"
    publisher: "DoorDash Help Center"
    year: 2026
    url: "https://help.doordash.com/en-us/dashers/article/what-is-fastpay"
  instacart2021cashout:
    authors: ["Instacart"]
    title: "With Instant Cashout, Every Day is Payday"
    publisher: "Instacart"
    year: 2021
    url: "https://company.instacart.com/shopper-community/with-instant-cashout-every-day-is-payday"
---

This is gig-work-science-services-section's founding note: the science of American gig
work that the [561 Group Work Services Section](../../../../../../../../../../../../../../../../../561-group-services-section/services/561-group-operations-services-section/services/561-group-work-services-section/README.md)
names as the Reticle Research row's holding — who does gig work, what it
pays net of costs, the tax mechanics, the benefit interactions, the
pay-floor laws, the algorithmic-management literature, and the closest
structural kin the program has. Every figure below is cited to a
first-party source (an agency, a court, a company filing, or a
peer-reviewed article) carrying that source's own published or
last-updated date, the effective date of any rate or rule it states, and
the UTC date-time this note observed it: **2026-09-05T16:39:13Z**, unless
stated otherwise. Where a first-party surface could not be reached or did
not state the figure, this note says "unverified" in plain words rather
than asserting it.

## 1. Who does gig work in the United States

The Bureau of Labor Statistics' Contingent Worker Supplement to the July
2023 Current Population Survey, released as a news release on
2024-11-08, found 4.3 percent of workers (6.9 million people) held
contingent jobs on their sole or main job, up from 3.8 percent in May
2017, and reported 7.4 percent of total employment (11.9 million
workers) as independent contractors on their sole or main job, up from
6.9 percent in May 2017 [@bls2024conemp]. The independent-contractor
share is not gig-platform-specific — it covers all independent
contracting, from construction (18.5 percent of the category) to real
estate — so it bounds gig-platform work from above rather than measuring
it directly [@bls2024conemp].

The direct platform-specific measure is Pew Research Center's survey,
fielded 2021-08-23 through 2021-08-29 among 10,348 U.S. adults and
published 2021-12-08: 16 percent of U.S. adults had ever earned money
through an online gig platform, and 9 percent had done so in the 12
months before the survey — the current-or-recent gig workforce [@pew2021gig].
The Federal Reserve's Survey of Household Economics and Decisionmaking
(SHED) uses a broader definition that includes reselling and informal
selling alongside platform tasks; its 2024 wave, published 2025-05,
found 20 percent of adults had done some gig activity in the prior
month, of whom 9 percentage points did short-term tasks such as
driving or delivery, and 31 percent of everyone doing gig activity said
that without it they would have trouble making ends meet [@frb2025shed].
Read together, these three surveys triangulate the same shape from three
different nets: a large and growing occasional-earner population (SHED,
Pew), a smaller committed core doing it as their main job (BLS), and a
worker base for whom the income is not discretionary for a meaningful
minority (SHED's 31 percent).

Platform-reported worker counts, from each company's own most recent
annual filing, are global counts, not U.S.-only, and are not
directly comparable to the survey figures above because the companies
count differently (Uber's figure spans four platform-earner types
across ride-hailing and delivery; Lyft's is ride-hailing only; DoorDash
and Instacart are delivery-only) and none isolates U.S. earners in the
headline metric:

- Uber's Form 10-K for fiscal year 2025 (filed 2026-02-13) reports 10
  million active Drivers and Couriers worldwide coordinating an average
  of 42 million trips and delivery orders per day across 70 countries
  and 15,000 cities [@uber202510k]. This figure is corroborated across
  multiple independent financial-press summaries of the filing; this
  note could not extract the exact sentence and footnote from the filed
  HTML document directly, so the U.S.-only breakdown is unverified.
- DoorDash's FY2025 disclosures report Dashers completing over 3 million
  deliveries per day and earning over $20 billion in aggregate during
  2025, but the company's annual report does not publish a headline
  active-Dasher count the way it publishes consumer metrics; a specific
  U.S. Dasher count is unverified from the first-party filing [@doordash2025dashreport].
- Maplebear Inc. (Instacart)'s Form 10-K for fiscal year 2025 reports
  approximately 600,000 active shoppers [@maplebear202510k].
- Lyft's Q4/full-year 2025 results report over 500,000 weekly active
  drivers [@lyft202510k].

## 2. What it pays net of costs

The peer-reviewed and institutional literature on net driver pay
converges on the same finding by different methods: gross fares and
gross hourly pay look respectable; net pay, after vehicle expenses and
before benefits, is frequently near or below the local minimum wage.

Zoepf, Chen, Adu, and Pozo's 2018 MIT Center for Energy and
Environmental Policy Research working paper, "The Economics of
Ride-Hailing: Driver Revenue, Expenses, and Taxes" (published February
2018), paired a survey of over 1,100 drivers with per-vehicle cost data
and found a median profit of $3.37 per hour before taxes, with 74
percent of drivers earning less than their state's minimum wage and 30
percent losing money once vehicle expenses were counted [@zoepf2018].
After Uber disputed the paper's treatment of vehicle costs, the lead
author, Stephen Zoepf, publicly acknowledged the criticism had merit and
recalculated: the corrected median net profit was $8.55 per hour, with
41 to 54 percent of drivers still below minimum wage [@zoepf2018]. This
note treats both the original and corrected figures as part of the
citable record — see the bibliography carrier for what the correction
does and does not settle.

The UC Berkeley Labor Center and Center for Wage and Employment
Dynamics's 2022 study, "Ride-hailing drivers' and delivery workers' net
pay under Proposition 22" (data collected January 2022 from 52,370 trips
by 1,088 drivers across six platforms in five metro areas including Los
Angeles and the San Francisco Bay Area, published via National Equity
Atlas), found rideshare passenger drivers earned a median $7.12 per hour
net of expenses and before tips — a fraction of California's contemporary
$16 minimum wage — and delivery workers averaged $5.93 per hour net of
expenses and before tips [@berkeley2022prop22].

Parrott and Reich's driver-pay-standard studies, prepared for regulators
using the companies' own trip- and pay-level data, found comparable
results in two cities: their 2018 New York City study (published July
2018) underlay the city's Driver Income and Transparency Rules, adopted
by the Taxi and Limousine Commission on 2018-12-04 and effective
2019-02-01 [@parrottreich2018]; their 2020 Seattle study (published July
2020) found gross driver pay of about $21.53 per hour falling to $9.73
per hour net of $11.80 in expenses, and proposed a standard matching the
independent-contractor equivalent of Seattle's $16.39 large-employer
minimum wage plus a $1.17-per-mile expense allowance [@parrottreich2020].

The NYC Department of Consumer and Worker Protection's own study, "A
Minimum Pay Rate for App-Based Restaurant Delivery Workers in NYC"
(published November 2022 under the mandate of Local Law 115 of 2021),
found delivery workers earned $14.18 per hour with tips and $7.09
without, against $3.06 per hour in expenses, for a net of $11.12 per
hour with tips and $4.03 without — annualized to roughly the city's
poverty line for a single adult at actual hours worked. This note
corroborates the figures through the rulemaking record at
rules.cityofnewyork.us rather than a direct fetch of the original PDF
report, which returned an HTTP 403; the figures should be read as
well-corroborated but not independently re-derived by this note
[@nycdcwp2022].

## 3. The cost structure

**Mileage.** The IRS set the 2026 optional business standard mileage
rate at 72.5 cents per mile, up 2.5 cents from the 2025 rate of 70 cents
per mile, in Notice 2026-10 (IR-2025-128, issued 2025-12-29), effective
for miles driven 2026-01-01 through 2026-06-30 [@irs2025mileagenotice].
The IRS then issued a midyear revision, Announcement 2026-11 (2026-29
I.R.B. 49, dated 2026-07-13), raising the business rate to 76 cents per
mile "to reflect recent increases in the price of fuel," effective for
miles driven on or after 2026-07-01 — the first midyear mileage-rate
adjustment since 2022 [@irs2026mileageannouncement]. A gig driver's true
per-mile cost therefore has two distinct 2026 IRS reference rates
depending on which half of the year the miles fall in.

**Ownership cost, independent of the IRS rate.** AAA's "Your Driving
Costs 2025" (published September 2025) puts the average new-vehicle
total cost of ownership at $11,577 per year ($964.78 per month) over a
five-year, 15,000-mile-per-year ownership assumption, and separately
reports per-mile operating costs (fuel plus maintenance) of 20.13 cents
per mile for a small sedan rising to 26.44 cents per mile for a medium
SUV — before financing and depreciation [@aaa2025drivingcosts]. The IRS
standard mileage rate is meant to approximate the fully loaded cost
(fuel, maintenance, depreciation, insurance) of operating a vehicle for
business use; AAA's operating-cost-only figures are lower than the IRS
rate precisely because they exclude depreciation and finance cost, which
the IRS rate includes. A worker who deducts only the IRS rate and never
separately tracks depreciation is not missing money on the deduction
itself.

**Deadhead miles.** Every study above nets pay against total miles
driven, not paid miles: the miles driven to reach a pickup, waiting
between assignments, and returning from a delivery all cost the same
mileage-rate dollar as a paid mile but earn nothing directly. This is
the single largest reconciling item between a platform's own
per-trip-mile earnings statement and a worker's true cost basis, which
is why every peer-reviewed study above computes net pay from independent
GPS or survey mileage data rather than from the platform's own reported
trip miles.

**Platform fees.** Each major platform charges a fee for immediate
access to earned pay rather than the standard multi-day deposit cycle,
confirmed from each platform's own help center:

- Uber's Instant Pay requires a minimum $1 in available earnings, allows
  up to 6 cash-outs per day (1 per day in New York City), a $6,000
  weekly cap and $3,000 per-cashout cap, and a $1.75 fee per transfer,
  waived in New York City [@uber2026instantpay].
- Lyft's Express Pay charges a $1.75 fee per transfer ($1.25 in Canada
  and Puerto Rico), requires a $6.75 minimum balance ($5 in New York),
  and allows up to 5 cash-outs per 24 hours (1 per day in New York)
  [@lyft2026expresspay].
- DoorDash's Fast Pay charges $1.99 per cash-out, once per day, and
  requires 25 lifetime deliveries, 14 days on the platform, and a debit
  card added at least 7 days prior [@doordash2026fastpay].
- Instacart's Instant Cashout is reported by secondary driver-advice
  sources (Ridester, The Rideshare Guy, The Budget Diet) at $0.50 to a
  linked debit card or $1.50 to any other bank account, with a 5-delivery
  minimum to unlock the feature; this note could not confirm the current
  fee from Instacart's own help center, which sits behind a shopper
  login wall, so the exact figure is **unverified** from a first-party
  surface as of this note's observation, though Instacart's own company
  blog confirms the feature exists and that weekly direct deposit
  remains free [@instacart2021cashout].

## 4. Federal tax rules

**Self-employment tax.** The combined SE tax rate is 15.3 percent: 12.4
percent Social Security (on the first $168,600 of combined wage and
self-employment earnings for 2024, per the IRS's own current published
figure) and 2.9 percent Medicare (uncapped), owed once net self-employment
earnings reach $400; the taxpayer deducts the employer-equivalent half of
SE tax (effectively half the 15.3 percent) from adjusted gross income on
Schedule 1, which lowers income tax but not the SE tax itself
[@irs2026semploymenttax]. Because a gig worker is both "employer" and
"employee" for tax purposes, an unclaimed mileage deduction inflates net
self-employment earnings and therefore both income tax and SE tax at
once — the mechanism the program carrier's fintech note names as
overpayment through a missed deduction.

**Schedule C, Schedule SE, and quarterly estimates.** A gig worker
reports gross platform income and business expenses (including the
standard mileage deduction) on Schedule C, carries net profit to
Schedule SE to compute self-employment tax, and — because no employer
withholds tax on 1099 income — is generally required to pay estimated
tax quarterly via Form 1040-ES when the worker expects to owe $1,000 or
more for the year, with an underpayment penalty when withholding and
estimated payments together fall short of a safe harbor (generally 90
percent of the current year's tax or 100 percent of the prior year's,
110 percent for higher earners). This note could not reach a live
irs.gov copy of the current-year 1040-ES instructions (the fetch
returned an HTTP 404) to quote the exact current quarterly due dates and
safe-harbor percentages verbatim from a 2026 first-party page; the
mechanism above is standard and stable IRS practice across years, but
**the exact 2026 due dates and safe-harbor percentages are unverified
from a first-party source in this note** and should be confirmed against
a live Form 1040-ES or Publication 505 before being relied on for a
specific worker's filing.

**1099 reporting thresholds, and their reversion history.** The Form
1099-K threshold for reporting third-party network payments (the form a
gig platform issues) is $20,000 and more than 200 transactions per year,
confirmed directly from the IRS's own current page [@irs2026f1099k].
This is a reversion: Congress's 2021 American Rescue Plan Act had set a
$600 threshold with no transaction minimum, which the IRS delayed
several times and phased toward gradually ($5,000 for 2024, $2,500 for
2025) before the One Big Beautiful Bill Act (Public Law 119-21, enacted
2025-07-04) retroactively restored the pre-2022 $20,000/200-transaction
threshold for 2025 and later years [@obbba2025]. Separately, the same
Act raised the Form 1099-NEC and 1099-MISC threshold — the form a gig
platform issues for nonemployee compensation paid directly rather than
through a card network — from $600 (unchanged since 1954) to $2,000 for
payments made after 2025-12-31, with inflation adjustment starting 2027
[@irs2026f1099nec] [@obbba2025]. A worker earning below both thresholds
receives no 1099 of either kind but still owes tax on every dollar of
net self-employment income; the reporting threshold is a paperwork
trigger for the platform, not an income-tax exemption for the worker.

**Qualified Business Income deduction.** The section 199A Qualified
Business Income deduction — 20 percent of qualified business income from
a sole proprietorship, subject to taxable-income limits — was previously
scheduled to expire after tax year 2025; the One Big Beautiful Bill Act
made it permanent with the 20 percent rate unchanged, and, starting in
2026, widened the phase-in range for specified service businesses and
added a minimum $400 deduction for a taxpayer who materially
participates in a business with at least $1,000 of income
[@irs2026qbi] [@obbba2025]. A gig worker's Schedule C net profit is
generally QBI, so the SE-tax deduction taken above the line also lowers
QBI (the IRS's own guidance includes the deductible part of SE tax in
the QBI computation), meaning the mileage deduction's tax value compounds
across income tax, SE tax, and QBI rather than applying once.

## 5. Benefit interactions

**ACA marketplace subsidies.** The American Rescue Plan Act (2021) and
Inflation Reduction Act (2022) eliminated the 400-percent-of-poverty-line
subsidy cliff for ACA marketplace premium tax credits through the end of
2025; Congress did not extend that enhancement, so it expired
2025-12-31, and the pre-2021 cliff at 400 percent of the federal poverty
level returned for coverage year 2026 — a household with self-employment
income (net of the deductions above) that crosses that line loses
subsidy eligibility entirely rather than phasing out gradually, per the
Congressional Research Service's own explainer [@crs2026ptc]. Because
marketplace eligibility is based on Modified Adjusted Gross Income, the
same mileage and SE-tax deductions that lower a gig worker's income tax
also lower the income counted against this cliff.

**SNAP and Medicaid.** Both programs count net self-employment income —
gross receipts minus allowable business costs — rather than gross
platform payouts; Medicaid specifically uses Modified Adjusted Gross
Income (MAGI), under which the Schedule C net profit, already reduced by
the mileage deduction and the deductible half of SE tax, is what counts
toward eligibility. This note found the MAGI treatment corroborated only
through secondary compilations of federal MAGI rules (CMS's own MAGI job
aid PDF returned an HTTP 403 to direct fetch) rather than a directly
quoted first-party CMS sentence, so **the precise self-employment
income-counting language is unverified from a first-party CMS source in
this note**, though the general MAGI-uses-net-Schedule-C-income rule is
well established federal policy and the fintech note's use of it should
be read as directionally correct pending that direct confirmation. SNAP's
federal rule (this note could not reach fns.usda.gov directly; two fetch
attempts timed out) is reported by every secondary source consistently
as a standard percentage cost-of-doing-business deduction rather than
itemized expenses, applied before further SNAP deductions — **this note
states this as reported, not as independently confirmed from
fns.usda.gov**, and states plainly that state SNAP agencies vary in
implementation detail even where the federal floor is uniform.

**SSI's asset test.** The Social Security Administration's own POMS
manual (SI 01110.003, last updated 2024-12-17) states the countable
resource limit for SSI eligibility is $2,000 for an individual and
$3,000 for a couple, unchanged since 1989 [@ssa2024ssiresources]. A
dollar of gig earnings an SSI recipient has not spent by the end of the
month it was counted can push them over a line frozen for more than three
decades.

## 6. State and city pay-floor law

**California.** Proposition 22 (2020) exempted app-based transportation
and delivery drivers from California's ABC independent-contractor test
(AB 5) while creating a narrower earnings guarantee and benefits scheme
of its own. A coalition of drivers and unions challenged it as an
unconstitutional restriction on the legislature's workers'-compensation
power; the California Supreme Court, in Castellanos v. State of
California (No. S279622, decided 2024-07-25), unanimously upheld
Proposition 22 as constitutional, affirming the Court of Appeal below
[@castellanos2024]. Drivers in California remain independent
contractors under Proposition 22's own (not the state minimum wage's)
earnings-guarantee formula.

**New York City.** DCWP's minimum pay rate for app-based food and
grocery delivery workers, excluding tips, is $22.13 per hour for pay
periods beginning on or after 2026-04-01, a 3.2 percent inflation
adjustment over the prior rate; the same rate now applies to grocery
delivery apps including Instacart, which previously paid a separate,
lower rate; DCWP is required to announce each year's adjustment by
February 1 [@nycdcwp2026rate]. Platforms may structure pay by any
method (hourly, per-trip, per-order, bonus) as long as the worker's
total meets the floor, and tips may never be counted toward it
[@nycdcwp2026rate].

**Seattle.** The App-Based Worker Minimum Payment Ordinance (SMC 8.37,
part of the 2022 "PayUp" legislative package, effective 2024-01-13)
guarantees the greater of a per-minute-plus-per-mile formula or a
per-offer minimum; the per-minute/per-mile rates have risen from $0.44
per minute and $0.74 per mile in 2024, to $0.45 and $0.77 in 2025, to
$0.47 per minute and $0.80 per mile in 2026, or a $5.34 per-offer
minimum if higher [@seattle2026payup].

**Minnesota.** A statewide law effective 2024-12-01 sets minimum
transportation-network-company driver compensation at $1.28 per mile
and $0.31 per minute, with a $5 minimum per ride, calculated over each
driver's rolling activity rather than per individual ride as many
drivers initially expected [@minnesota2024tncpay].

**Washington.** House Bill 2076 (2022) sets statewide minimum
per-trip, per-minute, and per-mile compensation for transportation
network company drivers, indexed annually to the state minimum wage by
the Department of Labor and Industries, alongside paid sick leave,
workers'-compensation coverage, earnings-statement transparency, and a
just-cause deactivation appeals process [@washington2022hb2076].

## 7. Algorithmic management and the worker's information position

Rosenblat and Stark's "Algorithmic Labor and Information Asymmetries: A
Case Study of Uber's Drivers" (International Journal of Communication
10, 2016, based on a nine-month empirical study) is the founding
peer-reviewed account: Uber's app produces significant indirect control
over how drivers work while simultaneously marketing drivers as
independent entrepreneurs, and the information and power asymmetries the
app creates — what fares are available, what a trip will pay before
acceptance, why a rating changed — are structural to that control rather
than incidental to it [@rosenblatstark2016]. Wood, Graham, Lehdonvirta,
and Hjorth's "Good Gig, Bad Gig: Autonomy and Algorithmic Control in the
Global Gig Economy" (Work, Employment and Society 33(1), 2019, pp.
56–75) generalizes the finding across platforms: workers experience real
schedule autonomy alongside low pay, social isolation, and algorithmic
control simultaneously — autonomy and control are not opposites on the
same platform but co-occurring dimensions [@woodgraham2019]. Griesbach,
Reich, Elliott-Negri, and Milkman's "Algorithmic Control in Platform
Food Delivery Work" (Socius 5, 2019, drawing on 55 interviews and a
955-respondent survey) finds meaningful cross-platform variation in how
tightly algorithmic management constrains a worker's schedule and
activity, naming Instacart's regime among the most constraining
("algorithmic despotism") in their sample [@griesbach2019].

The sociology glossary's [emotional labor](../../../../../../../../../../../../content/text/glossary/terms/emotional-labor.md)
term already names the open question this literature sits beside: "How
does emotional labor change under platform-mediated conditions? ...
The metrics that monitor and price the labor are continuous and
algorithmic. Whether the analytical apparatus developed for traditional
service work transfers cleanly is contested." This note does not resolve
that question; it supplies the algorithmic-management literature the
question presupposes. The critical-theory note on
[freedom at the edge of the held](../../../../../../../../../../../critical-theory-science-services-section/content/text/documents/articles/notes/2026/08/23/2026-08-23-note-on-freedom-at-the-edge-of-the-held.md)
already names the normative reading this literature supports empirically:
"the gig economy's freedom-talk describes imposed unholding (no standing,
no return path) in the excursion's language," and its own reply to the
objection that gig workers "choose" flexibility holds that "modality is
exactly where ideology operates" — the manufactured-consent problem the
algorithmic-management literature documents mechanically, trip by trip.

## 8. Worker-owned data cooperatives and mutual aid

Driver's Seat Cooperative, founded in 2020 and supported by the
Rockefeller Foundation, was a driver-owned cooperative: members who used
its app to log time, miles, and pay across multiple gig platforms with
permission could join as cooperative members, share in its profits, and
elect its board; between September 2021 and December 2022 its user base
grew from about 2,000 to more than 5,000, with users reporting an
average 13 percent income increase from the app's own analytics
[@driversseat2023]. The cooperative has since closed as an independent
entity; its mission and its FairFare tool (crowdsourced fare-data
analysis across states) continued at Princeton University's Workers'
Algorithm Observatory, a nonprofit that also runs FareShare (automated
deactivation-appeal reports) and Handlebar (in-development
accessibility-based pay-data collection) [@wao2026]. This is the
closest structural kin the program has, not a marketing comparison: a
worker-owned cooperative aggregating members' own data to give them back
market information the platforms already hold about them is exactly the
data-cooperative half of what Gig Assist and the pool it feeds are
trying to build, and its closure as an independent entity — folded into
an academic observatory rather than sustaining itself as a business — is
itself evidence about how hard the business model is to sustain on
its own, not evidence against the approach.

## 9. What this means for the program

At the micro layer, the numbers above make the fintech note's claim
concrete rather than aspirational: a worker paying Uber's or Lyft's
$1.75 instant-pay fee twice a week to avoid a multi-day wait is paying
roughly $180 a year for liquidity timing, on top of a net hourly rate
that the peer-reviewed literature puts well below minimum wage before
that fee — and the single largest correctable leak, in every study
above, is the gap between a platform's own reported trip miles and the
worker's true total miles (deadhead included), which is exactly the
mileage figure Odometer Work Systems' compute package has to produce
independently of the platform's own statement. At the macro layer, the
tax and benefit rules above are not independent knobs: the mileage
deduction lowers Schedule C profit, which lowers SE tax, which lowers
MAGI, which affects ACA subsidy eligibility and Medicaid eligibility at
once, while the reinstated $20,000 Form 1099-K threshold and the SSI
asset limit's three-decade freeze mean a worker's exposure to each rule
depends on exactly how much and through which mechanism a platform pays
them — a state of affairs no worker can be expected to track by hand
across four or five apps, and precisely the state of affairs a
two-witness ledger per member, reconciling every platform statement
against the bank and against these rules, exists to hold legible.
