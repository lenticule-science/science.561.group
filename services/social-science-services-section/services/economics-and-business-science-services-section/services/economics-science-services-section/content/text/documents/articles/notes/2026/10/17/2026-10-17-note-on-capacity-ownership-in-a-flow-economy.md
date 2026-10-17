---
title: "Capacity Ownership in a Flow Economy"
description: "A proposed economy of claims on bounded regenerative capacity instead of titles to underlying stocks, parcels, or machinery; EROEI, stewardship, authority, and settlement remain distinct."
name: 2026-10-17-note-on-capacity-ownership-in-a-flow-economy
date-created: 2026-10-17
type: notes
status: proposed-research-program
authors:
  - chatgpt-web
keywords: [capacity-share, flow-capacity-economy, EROEI, distal-bypass, watershed, commons, exergy, ecological-additionality]
references:
  hallbaloghmurphy2009:
    title: What Is the Minimum EROI That a Sustainable Society Must Have?
    year: 2009
    doi: 10.3390/en20100025
  globaleroi2017:
    title: Energy Returns and The Long-run Growth of Global Industrial Society
    url: https://www.sciencedirect.com/science/article/abs/pii/S0921800916308138
  extendederoi2019:
    title: Extended Energy Return on Investment of multiproduct energy systems
    url: https://www.sciencedirect.com/science/article/pii/S0360544219323953
  wunder2020:
    title: "Payments for Environmental Services: Past Performance and Pending Potentials"
    doi: 10.1146/annurev-resource-100518-094206
  epa2020:
    title: Water Quality Trading on a Watershed Scale
    url: https://www.epa.gov/npdes/water-quality-trading-watershed-scale
  usda2012:
    title: "Baselines in Environmental Markets: Tradeoffs Between Cost and Additionality"
    url: https://ers.usda.gov/publications/42855
---

# Capacity Ownership in a Flow Economy

**Proposed (Leader direction, 2026-10-17):** The 561 Group seeks an energy-based global economy in which the central economic holding is a **fraction of sustainable productive capacity**, not a title to a parcel of Earth, a water body, equipment, a technology, or a particular shipment of energy. Watersheds and atmospheric currents are candidate domains. A fully on-chain game might first simulate a deliberately underpowered version, but this paper's object is the economy, not the game.

**Legal distinction:** A recognized transferable claim remains a form of property. The thesis is that a share does **not convey ownership of the underlying land, ecological stock, flow, equipment, sovereignty, or extraction permission**. It names a conditional contractual right to participate in a bounded future service and surplus, if that service remains lawful, physically possible, and ecologically admissible.

## 1. What can be shared?

A watershed is a connected system, not a rectangular tract. Its seasonal discharge, hydraulic head, temperature, sediment, habitat, flood buffering, and legal uses differ. Atmospheric kinetic energy likewise is not automatically delivered electricity. Energy is conserved; **exergy** (useful work potential) degrades through conversion. One cannot add megawatt-hours, hectares of habitat, and tonnes of avoided sediment as though they were one homogeneous currency.

**Model:** Fix a region/network domain \(b\), interval \(T\), service types \(u=1,\ldots,m\), policies \(\pi\), ecological state \(h\), and service delivery \(d_u(b,T,\pi)\). Each service has its own units and reliability requirement. Define the sustainable capacity envelope
\[
\mathcal K_{b,T}=\{(d_1,\ldots,d_m)\in\mathbb R^m_{\ge0}:\exists\pi\text{ that produces the delivery under all admissibility constraints}\}.
\]
Constraints include (i) energy/mass balance, exergy, loss, storage and time-resolved delivery; (ii) replacement, maintenance, and ecosystem regeneration across a stated time horizon; (iii) ecological floors and uncertainties; and (iv) relevant law, Indigenous and territorial sovereignty, consent, and rights of access. The envelope can be nonconvex, stochastic, and partly unknown. Its coordinates cannot be monetized or added without an explicit conversion model and value judgment.

A capacity share \(s_{i,b,T,u,\tau}\) is a fraction between zero and one of one **identified service tranche** \(\tau\), with a period, service unit, measurement method, receiving party, legal authority, priority, transfer conditions and expiry. The issuance invariant is \(\sum_i s_{i,b,T,u,\tau}\le1\). Claims in two tranches sharing the same hydrologic, grid, storage, or social dependency must be reconciled against a common constraint set. Selling both at unconstrained nameplate capacity violates the model.

A share of *capacity* differs from both a claim on a specific energy **flow** (realized MWh) and a claim on gross **capability** (what a machine can theoretically perform). Capacity is conditioned possibility across a time interval. A share can remain valid during a drought while its actual yield falls to zero, subject to the contract; it is not a promise of guaranteed energy or income.

## 2. EROEI belongs in the physical account, not the title deed

For a stated energy-production boundary \(B\) and period \(T\), with energy delivered \(G_{B,T}\) and invested \(I_{B,T}>0\) on a consistent comparison basis,
\[
\mathrm{EROEI}_{B,T}=G_{B,T}/I_{B,T},\quad N_{B,T}=G_{B,T}-I_{B,T}.
\]
When investment is a fraction of the same gross delivered total, the net fraction is \(1-1/\mathrm{EROEI}\). The identity says **nothing** by itself about exergy timing, electricity reliability, ownership, wellbeing, prices, payment allocation or biodiversity. Embedded manufacturing energy, storage and delivery losses, operating energy and ecological repair must be counted consistently and not twice. Multiproduct allocation and boundary choices are contested in the literature [@hallbaloghmurphy2009] [@globaleroi2017] [@extendederoi2019].

**Proposed bridge:** EROEI, energy-exergy timing and life-cycle costs restrict the feasible production subset of \(\mathcal K\). They do not define capacity shares. A high-EROEI hydro project destroying fish passage must fail the ecological admissibility condition even if its energy surplus is high. A riparian restoration producing no electricity may create habitat or water-quality services but has **no meaningful generation EROEI** by itself.

The source note [Absolute Energy Decline Research](https://github.com/lenticule-science/science-services-section/blob/main/research/energy-systems/absolute-energy-decline-research.md) contains model forecasts and empirical claims about energy descent. The 2021 model's forecast of a **2024** net-oil energy peak is a forecast, not direct evidence that such a peak was observed. No global absolute-net-energy-decline premise is required for this capacity-share thesis.

## 3. Ecological outcome and economic settlement are other sorts

**Hypothesis:** Making participation in a capacity tranche contingent on independently measured ecological conditions applies a weak economic incentive to maintain the underlying living system. **Unverified:** a payout correlated with ecosystem health causes better stewardship.

Let \(R_{\tau,T}\) be **realized** revenue in a declared monetary unit, \(C_{\tau,T}\) eligible operating/maintenance/monitoring costs, and \(Q_{\tau,T}\) a separate restoration, loss and reliability reserve not already included in \(C\). The illustrative distributable monetary pool is
\[
D_{\tau,T}=\max(0,R_{\tau,T}-C_{\tau,T}-Q_{\tau,T}).
\]
Let \(g_\tau(h,\Delta h,e)\in[0,1]\) be a precommitted eligibility factor determined by independently measured ecological state and evidence \(e\), including a baseline and a counterfactual design. The proposed payout rule is
\[
P_{i,\tau,T}=s_{i,\tau,T}\,g_\tau\,D_{\tau,T}.
\]
If \(g<1\), undistributed money stays in the designated commons/restoration pool and is tracked explicitly. This is an **example contractual rule**, not a physical law and not a claim that ecosystems send money. A simulated token has no demonstrated backing without eligible receivables and separate settlement evidence.

The baseline must distinguish naturally wet years from genuine land stewardship. Track quality, habitat and access independently of power output. Set ecological non-negotiable floors before any optional aggregate score; publish uncertainty, data gaps, adverse evidence, monitoring costs, and distributional effects. EPA's watershed water-quality trading approach makes legal boundary, hydrologic connectivity and pollutant processing material to the market [@epa2020]. PES reviews find additionality, targeting, and enforcement to be material problems [@wunder2020] [@usda2012]. Those existing programs are research comparators, **not** validation of our new institution.

**Governance:** Fractional ownership does not confer permission to divert, develop, exclude, privatize a watershed, or govern an Indigenous nation. Affected communities and competent governments retain their own authorities and consent requirements. Benefit-sharing, local choice, dispute remedy, revocability, monitoring and domination resistance must be specified before issuance. Remote holders cannot vote themselves new sovereign rights.

## 4. Distal bypass: a bridge still requiring source recovery

The Leader explicitly connects capacity ownership with **distal bypass**, closure and compaction. **Unknown:** the authoritative Obsmetrologia definition, type signature and proof obligations of distal bypass were not recovered in this research pass; the unavailable L-Space corpus reader is not evidence that no such source exists. The following is a candidate *economic test model*, not a definition of the original mathematical term.

In a network of transformations and receivers, compare a route \(p\) from source \(a\) to receiver \(z\) with an alternative route \(p'\) avoiding an intervening bottleneck. Count **all** exergy losses, new infrastructure, maintenance, delayed damage, jurisdictional duties and ecological constraints under the same boundary. A useful bypass must improve a declared outcome (net deliverable service, robustness or accessible capacity) rather than merely shift cost to a less visible node. An institutional bypass of an intermediary is not automatically a thermodynamic bypass, and neither creates energy.

**Formal research question:** Can the actual Obsmetrologia distal-bypass operation be typed as a lawful morphism between capacity envelopes, with defined objects, identities, composition, invariants and closure? Recover the original source before deriving any equivalence or numerical reward formula.

## 5. Falsifiers and assays

- **Extraction trap:** More saleable output and higher EROEI, but habitat or water access is harmed. Correct result: capacity tranche fails admissibility.
- **Double sale:** Watershed and wind shares both sell full balancing capacity from one coupled battery. Correct result: reject or reduce issuance.
- **Weather fraud:** Rain alone improves river quality, with no stewardship intervention. Correct result: do not claim intervention additionality.
- **Title confusion:** A token buyer claims access to land, water or an Indigenous jurisdiction. Correct result: no conveyance, no change in governance.
- **Drought:** Yield falls without failure of stewardship. Correct result: distinguish weather variance, equipment failure, breach and invalid measurement.
- **Speculative price:** Tokens rise in price while physical feasible capacity is unchanged. Correct result: token appreciation cannot enter a measured capacity numerator.
- **Nonenergy service:** A restored habitat has value but no electricity. Correct result: its service quantity is not relabeled as kilowatt-hours.

**Minimum science-to-engineering data contract (proposed):** Basin/network identity; source revision; time; typed service and unit; capacity-envelope model and uncertainty; coupled dependencies; EROEI boundary if energy production applies; ecological constraints and baseline; legitimate rights and consent; fractional claims and total issuance; eligible receivables; cost and reserve rule; independent monitoring; dispute/expiry states. Science owns meaning and evidence, Engineering builds the instrument, Operations parametrizes it, and the applicable Group/Public offices own lawful admissions.

**Test program:** (1) Recover and read primary Obsmetrologia distal-bypass proofs. (2) Build one watershed baseline with primary hydrologic and governance sources. (3) Model feasible capacity under drought, flood and restoration constraints. (4) Simulate concentration, double issuance, data manipulation and absence of additionality. (5) Compare stewardship-linked and output-only reward designs under the same ecological measures. (6) Independently receive any claimed effect; a passing transaction is not environmental evidence.

## 6. Epistemic register

**Established from external research:** thermodynamic constraints, the conditional nature of EROEI, coupled watershed processes, common-pool governance and environmental incentive schemes.

**Proposed 561 Group synthesis:** a multi-service feasible-capacity envelope; fractional economic rights to constrained future service and surplus; ecological fitness and legitimate authority as prior constraints; relatedness across territorial and atmospheric networks, rather than a gridded Earth of alienable parcels.

**Unverified:** that this improves stewardship, legal transferability in any jurisdiction, precise distal-bypass equivalence, valid cross-service comparability, and a solvent global settlement mechanism. This research note establishes a rigorous target and counterexamples, **not** an operating game, deployed ledger, proven theorem or measured ecological outcome.
