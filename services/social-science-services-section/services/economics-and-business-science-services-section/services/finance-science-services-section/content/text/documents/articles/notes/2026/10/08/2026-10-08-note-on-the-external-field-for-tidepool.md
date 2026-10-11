---
title: "Note on the External Field for Tidepool"
description: "The real external world around a cooperative, non-custodial, yield-routing, credit-issuing protocol as measured on 2026-10-08: Breadchain taken apart at the contract level, the adjacent protocol field mechanism by mechanism, the theory that licenses strange pooling instruments, US law as a set of design inputs, the live Base and Gnosis primitives a pool can compose, and Hive and cross-chain economics, each block ending in its openings for Tidepool"
date-created: 2026-10-08
aliases:
  - "Tidepool external field synthesis"
  - "Tidepool research briefing"
keywords:
  - tidepool
  - breadchain
  - crowdstaking
  - yield-routing
  - mutual-credit
  - smart-contracts
  - cooperative-law
  - cross-chain
  - hive
teaches:
  - "The external field of Tidepool"
requires: [crowdstaking, rotating-savings-and-credit-association, stablecoin]
authors:
  - claude-sonnet-5-5
type: text
---

This is the canonical synthesis of the 2026-10-08 external research for Tidepool, the house's cooperative financial-pooling protocol. It states what first-party sources establish: contract source and deployed state read from the chain, protocol documents, statute and rule text, court opinions, and the academic literature. Where something was looked for and not found, it says so, and the search row that backs the statement is in the named record. Each block ends with its openings for Tidepool.

The measurement method is in `science-services-section/content/text/documents/articles/notes/2026/10/08/2026-10-08-note-on-measuring-protocols-law-and-chains-with-the-literature-record.md`. Records are literature-measurement records; every figure below is dated 2026-10-08 unless it carries another date. Sibling notes carry the same facts at the depth of one record each; this note integrates them. Records live under `science-services-section/services/social-science-services-section/services/economics-and-business-science-services-section/services/<section>/data/records/2026-10-08-<slug>.json`, where `<section>` is `finance-science-services-section` (protocols, primitives, law, Hive and cross-chain), `monetary-economics-science-services-section` (money theory and mutual credit) or `economics-science-services-section` (ergodicity, ROSCA, governance, cybernetic planning).

## What the field shows in one page

1. The nearest deployed relative, Breadchain (now Bread Cooperative), is small and unfinished: $393,337 of TVL on one asset (xDAI in the Gnosis sDAI vault), 15 voters in the live cycle, $1,427.80 of BREAD distributed on 2026-09-01, 64,180.45 BREAD distributed in all since 2024-07-01. A 5-of-12 Safe with no timelock can upgrade its token and distributor and chooses its recipients. Its savings-circle product charges no interest, takes no collateral and has no default remedy for a member who has already received the pot. It does not lend.
2. The public-goods and yield-donation field (Octant, Glo Dollar, Giveth, Gitcoin and Allo, Drips, Juicebox, Baal, conviction voting, bonding curves) computes a member's claim from a payment rate, a declared weight, a vote or the issuer's say-so; none computes it from verified contribution, and the tallies that matter (Octant v1 matching, Glo votes, Giveth matching) run off chain. Most conviction-voting and bonding-curve projects are dead or tiny.
3. The money-and-credit field has working mutual credit (Sardex, 10,000 firms) with no yield under it, and yield protocols with no credit under them. No source read for any of them ties a credit limit to energy return. That cell is open.
4. The theory is specific: pooling raises the time-average growth rate of members whose shocks are not perfectly correlated by (sigma squared over two) times (1 minus 1 over N); demurrage's measured velocity gains came paired with tax acceptance and a redemption link; the theory licenses instruments nobody has built.
5. US law is more permissive by construction than the house's own drafts assumed: the GENIUS Act's yield ban binds issuers, its definition of a payment stablecoin needs a promise of redemption at a fixed amount, and its service-provider definition excludes liquidity-pool participation and immutable self-custodial interfaces; Colorado's limited cooperative association is the only workable cooperative form; Wyoming has no such statute.
6. On Base a pool can hold principal as shares of existing ERC-4626 vaults (Morpho Vault V2, MetaMorpho, Spark, Aave), stream yield with Superfluid distribution pools, write membership with EAS predeploys, assign roles with Hats, custody with Safe and Zodiac Roles, and onboard through ERC-4337 with Coinbase Smart Wallet. Almost nothing needs building for custody.
7. Hive appears in no cross-chain registry read; HBD has no EVM contract; CCTP v2 covers Base, Arbitrum, Optimism and Solana but not Gnosis. A cross-chain pool puts its dollar ledger on an EVM chain and treats Hive as an additional accounting venue.

## A. Breadchain Cooperative, taken apart

Records: `finance-science-services-section/data/records/literature-measurement-records/2026-10-08-breadchain-cooperative-teardown.json`; note `2026-10-08-breadchain-cooperative-teardown.md` (same date) carries the full account. Fifteen rows, nine searches, source code read from shallow clones of the BreadchainCoop repositories, deployed state read at Gnosis block 48,656,674 (2026-10-08 19:21 UTC).

**Products.** The organisation publishes 51 repositories (BreadchainCoop 2026). Money-holding products: the Solidarity Fund (BREAD plus a YieldDistributor, Gnosis), Stacks (savings circles; Gnosis and Celo), Safety Net (a Broodfonds-style mutual; Gnosis, deployed 2026-07-04), the crowdstake.fun factory framework, and CoopStable on Stellar. Smaller: Builders Dollar (an EAS-gated Optimism builder dollar, last push 2025-06-23, no deployment found), an on-ramp bot for Curacao, Aruba and Bonaire (Base Sepolia sandbox), mutualaid.fun, labor.fun, and EigenLayer AVS and Jito restaking tooling that is the cooperative's contract-development work.

**BREAD.** Token 0xa555d5344f6FB6c65da19e403Cb4c1eC4a1a5Ee3 (EIP173 proxy, implementation 0x3146b62466b76642127b9f4fe34fa7cd9968bf96). mint: xDAI to wxDAI to the sDAI vault 0xaf204776c7245bF4147c2612BF6e5972Ee483701, one to one. burn: withdraw exactly the amount from sDAI, return native xDAI; no fee, no delay. Yield is sDAI asset value minus BREAD total supply; `claimYield` (owner or claimer only) mints that surplus as new BREAD (Breadchain Token Source 2026). Supply 392,011.84; accrued unclaimed yield 1,755.87; 672 holders; sDAI returned +0.3724% over the last 518,400 blocks, 4.53% annualised, so the whole pool yields about $17,800 a year (Bread Gnosis Chain State 2026). The contract has no loss rule: if sDAI assets fall below supply, burn pulls exact amounts from the vault and fails when it cannot, so the last out bears the loss.

**YieldDistributor.** Proxy 0xeE95A62b749d8a2520E0128D9b3aCa241269024b (implementation 0x238662b4523149c7148bd1db4728bd3f4432d203, verified on Blockscout and matching the repository). Parameters: cycleLength 518,400 blocks (30 days at 5 s), maxPoints 10,000, yieldFixedSplitDivisor 2, voting cycle 26, 15 voters, 8 recipients. Voting power is the sum over a holder's checkpoints of balance times blocks over the previous cycle's window, BREAD plus ButteredBread, returned undivided (the documentation says "average"); a new deposit has no vote until the next cycle. A voter allocates integer points across projects and the voter's power is split by points over total points; an optional streak multiplier adds a bonus per consecutive cycle voted and lapses after two silent cycles (Breadchain Fund Source 2026). Payout: balance halved; one half split equally among projects, the other by vote weight. `distributeYield()` has no access control once `resolveYieldDistribution()` is true (currentVotes above zero, cycle elapsed, enough yield). On 2026-10-08 it returned true 627,057 blocks after the last distribution against a 518,400-block cycle, about six days past due, and nothing had run: the trigger rests on a keeper (PowerPool resolver; the Gas Killer EigenLayer AVS for off-chain tallying is wired in and its repository is archived). The last distribution, 2026-09-01, was 1,427.8 BREAD, so the equal half was about 89 BREAD per project and the largest project (25.5% of vote weight) received about 271 (Breadchain Claimed Yield Log 2026).

**ButteredBread.** Non-transferable vote token minted for an allowlisted LP token at scalingFactor/100. One LP (Curve BREAD/WXDAI 0xf3D8F3dE71657D342db60dd714c8a2aE37Eac6B4) at factor 32 earns 0.32 votes; supply 558.58 against 392,011.84 BREAD, 0.14%. Its owner is a single externally owned account that also signs the core Safe.

**Stacks.** `SavingCircles` is a plain ROSCA: 2 to 25 members, a fixed deposit per interval, the pot (deposit times members) to the member whose index equals the round; payout order is join order. No interest, no auction, no collateral, no credit. If a round's deposits are incomplete the circle can be decommissioned and members who have not yet claimed get their deposits back; a member who already took the pot keeps it. Version 1.1.0 (2026-10-05) adds goal circles and automated deposits (Breadchain Stacks Source 2026). No deployed address or circle count was found.

**Safety Net.** Broodfonds clone: a member deposit credits the pool and a withdrawable balance of deposit times a ratio (1 to 25); the effective ratio is capped by 1 / (p + z sqrt(p(1-p)/N)) with p = 2%, z = 1.65, plus a six-month runway cap; requests are contestable; shortfall settles pro rata. Proxy 0x63c3c299CD5C5479E6999189D7827490Ea71cEAe; its ProxyAdmin is owned by an externally owned account, so one key can upgrade it. Eight nets and two requests created (Breadchain Safety Net Source 2026).

**Crowdstake and CoopStable.** The framework generalises BREAD to any ERC-4626 vault with pluggable cycle, voting, registry, distribution and automation modules and cross-chain votes; its time-weighted power averages the current cycle, not the previous (Crowdstake Source 2026). CoopStable sends 10% of yield to a treasury and 90% equally to members daily with no vote; cUSD supply on Stellar is 15.25 units with 7 trustlines (Coopstable Source 2026, Stellar Expert 2026).

**Governance, keys, legal, audits.** The core Safe 0x918dEf5d593F46735f74F9E2B280Fe51AF3A99ad has 12 owners and threshold 5, no timelock, and owns the BREAD proxy, the distributor's ProxyAdmin and the distributor; it alone queues project additions and removals, and sets cycle length, point cap, split and claimer. BREAD holders do not vote on membership or rules. Admission of a project needs a unanimous vote of existing projects; the documents list seven (annex), sixteen (knowledge base) and the chain holds eight recipient addresses (Breadchain Docs 2026, Breadchain Knowledge Base 2026). Legal form is stated nowhere: one repository README names "Bread Cooperative DAO LLC" with no jurisdiction; searches for a registry entry or Open Collective host found none. The cooperative earns from contract-development work; no protocol fee exists. The only audit artefact is a pro bono review of `Bread.sol` by two KebabSec members with three findings (two informational, one low), dated 2025-03-10 in the file name; none was found for the distributor, ButteredBread, Stacks or Safety Net, though the Stacks app guide calls its contracts audited. DeFiLlama lists zero audits and a TVL history from $258,434 (2024-04-15) to a peak of $565,968 (2025-05-25) and $393,337 now (DeFiLlama Breadchain 2026). OpenAlex returns three irrelevant works for "Breadchain" and Crossref none: no scholarly evaluation exists.

**What Breadchain does not do.** It does not lend; it does not diversify (one asset, one vault, one chain, no loss rule); it gives holders no say over membership or rules; it prices no risk outside the Safety Net throttle and charges nothing for going first in a circle; it indexes to nothing but a dollar savings rate; it has no clearing, no demurrage and no identity layer, so votes follow balance and time; its protocol earns nothing; its distribution depends on a keeper and was late; it has a pro bono token review and no timelock; it does not state its legal form.

### Openings for Tidepool (from A)

- Keep Breadchain's cheap, proven core (permissionless, cycle-lagged, time-weighted split with an equal floor) and add what is absent: priced rotation (bids for payout position flowing to the pool as yield) where Stacks has an unpriced default hole; member credit lines; multi-strategy, multi-chain yield with an explicit loss waterfall; timelocked, role-scoped governance (Hats plus Safe and Zodiac Roles) where Bread has a 5-of-12 Safe; a recipient set chosen by members, not owner-queued.
- Borrow Safety Net's actuarial formula (p, z, runway cap) for credit-line sizing; fix its one-key admin.
- crowdstake.fun proves a factory-and-module split; Tidepool can ship credit and clearing modules Bread lacks and stay Bread-compatible, because its token accepts any ERC-4626 vault.
- Pay a keeper from yield (a bounty) to remove the late-distribution failure.
- The real opening is scale: $393k of deposits yields $17.8k a year, with no fee, no credit and one revenue term. A pool that also routes credit interest and position bids has several.

## B. The adjacent field, mechanism by mechanism

Records: yield donation `2026-10-08-yield-donation-protocols.json`, public goods `2026-10-08-public-goods-funding-protocols.json`, treasury and contribution `2026-10-08-treasury-and-contribution-primitives.json`, conviction voting and curves `2026-10-08-conviction-voting-and-bonding-curves.json` (B1); streaming `2026-10-08-streaming-and-distribution-protocols.json`, UBI and local currency `2026-10-08-ubi-and-local-currency-protocols.json`, trustlines `2026-10-08-mutual-credit-and-trustline-protocols.json`, mutuals `2026-10-08-on-chain-mutuals-and-insurance.json`, ROSCA and prize savings `2026-10-08-rosca-and-prize-savings-protocols.json`, uncollateralized credit `2026-10-08-uncollateralized-credit-protocols.json`, rate markets `2026-10-08-rate-markets-and-collateral-baskets.json` (all finance), `2026-10-08-mutual-credit-first-party-sardex-wir-credit-commons.json` (monetary) and `2026-10-08-contribution-circles-and-employment-commons.json` (economics) (B2). Each has a note of the same slug; the TEC, conviction and openings notes add depth.

### B1. Funding, yield donation and treasury protocols

**Octant v1.** Five small contracts on mainnet (Auth 0x287493F76b8A1833E9E0BF2dE0D972Fb16C6C8ae, Epochs 0xc292eBCa7855CB464755Aa638f9784c131F27D59, Deposits 0x879133Fd79b7F48CE1c368b0fCA9ea168eaF117c, Vault 0xc64783f0BE60A81A716535287539a694403183ba). Deposits is a bare GLM lock ledger (1,139,205.58 GLM held); Epochs derives epoch numbers from wall time (start 2023-08-08, 43-day epochs, 14-day decision window, epoch 17 current); the Vault pays by merkle proof against one root per epoch set by the Golem multisig (0xA40FcB633d0A6c0d27aA9367047635Ff656229B0), which can also call emergencyWithdraw. All arithmetic is off chain: total rewards 70%, individual rewards equilibrium 35%, matched rewards 35% shrinking as more GLM is locked, operational cost 25%, community fund 5%, each project's match capped at 20%, project score the square of the sum of square roots of Passport-weighted allocations, uniqueness threshold 15. The README states "Rest of functionality is currently implemented on the server" (Octant V1 Contracts 2026, Octant V1 Backend 2026).

**Octant v2.** `YieldDonatingTokenizedStrategy` (0xb27064A2C51b8C5b39A5Bb911AD34DB039C3aB9c) on Yearn v3's TokenizedStrategy: `report()` mints profit shares to the dragon router and burns the router's shares first on a loss; the router address changes only after a 14-day cooldown; strategy factories for Morpho, Yearn v3 and Sky are deployed on mainnet; a pull-model PaymentSplitter, a MultistrategyVault, RegenStaker and an alpha-weighted quadratic-plus-linear funding mechanism are in the repository, with Spearbit, Cantina and Bailsec audits listed (Octant V2 Core 2026). The Shutter DAO plan routes 1.2M USDC to a Morpho strategy with all yield to a funding pool. Octant's docs, app and API sit behind Cloudflare 403 and per-epoch totals were not read.

**Glo Dollar.** A UUPS-proxied USDGLO token (0x4F604735c1cF31399C6E711D5962b2B3E0225AD3) with pauser, minter, denylister (including `destroyDenylistedFunds`) and upgrader roles; reserves are off chain at Brale (2,133,683 issued on 2026-06-30, cash $1,818,189 and Treasuries $315,494, down 37% in a year); Brale keeps all earnings on the first $2M of reserves; holders vote with one USDGLO one vote, stored off chain as signed messages; March 2026 earned $5,016 and donated $2,000. The GENIUS Act's yield ban binds issuers and Glo's yield goes to charities, not holders (Glo Dollar Contract 2026, Brale Reserve Report 2026).

**Giveth.** Donation platform with a loyalty token and GIVbacks; DeFiLlama TVL 0; the Gnosis TokenDistro duration (11,262,857 s) conflicts with the documented schedule to 2026-12-23 and both are recorded.

**Gitcoin and Allo, Optimism Retro Funding, Hypercerts, Protocol Guild, Flow State, clr.fund, Thrive, Nouns, Kleros, Hats, Metagov.** Allo v2 is a registry-plus-strategies contract (quadratic funding, direct grants, donation voting); Passport scores gate Sybil resistance; Retro Funding moved to metrics-based evaluation; Hypercerts mint ERC-1155 impact claims; Protocol Guild vests ETH through Splits to a member list; Flow State Flow Councils stream funds to recipients through a Superfluid distribution pool with weighted votes (Gitcoin Governance and Allo rows in the public-goods record).

**Drips, Juicebox and Revnet, Baal, 0xSplits, Regen, Toucan and Klima, Safe, Zodiac, Hats.** Claims come from a payment rate (Juicebox, Revnet), a declared weight (Drips, Splits), a vote (Baal) or the issuer's say-so (Regen). Baal's ragequit has no rate limit and is run-prone. Regen moved to proof of authority with one proposer. Toucan's BCT token minted at par over variable-quality carbon credits and KlimaDAO is near zero.

**Conviction voting and bonding curves.** 1Hive Gardens v1 (Aragon, Gnosis) and Gardens v2 (Optimism, Gnosis, Arbitrum, Base, Celo, Polygon, Ethereum; $74k TVL; one externally owned account as proxy owner on four chains). The Token Engineering Commons' 12% exit tribute made a round trip cost 13.8% and funded a pool projected to run dry in a year; it sunset and opened claims in 2025-2026. Augmented bonding curves, Bancor, Continuous Organizations, Praise and Proof of Humanity are covered in the bonding-curve note.

**Findings across B1.** No surveyed contract computes a member's claim from verified contribution. Octant v1's roots and project lists sit under one multisig with no timelock found; Glo's roles can pause, denylist, destroy and upgrade; tallies run off chain.

#### Openings for Tidepool (B1)

- Compose a contribution ledger, an on-chain pairwise or cluster-matched allocation, and principal-preserving yield routing; no surveyed system ships all three.
- Copy Octant v2's loss rule (the router's shares burn first), add a delayed parameter change and a rate-limited, solvency-tiered exit (the answer to ragequit runs and to the TEC's exit tribute).
- Tally and pay in contract: Octant v1, Glo and Giveth all do the important arithmetic off chain.

### B2. Credit, money, mutual and streaming protocols

**Superfluid.** On Base the host is 0x4C073B3baB6d8826b8C5b229f3cfdC1eC6E47E74, constant flow agreement 0x19ba78B9cDB05A877718841c574325fdB53601bb, general distribution agreement 0xfE6c87BE05feDB2059d2EC41bA0A09826C9FD7aa, all UUPS proxies under a 2-of-4 Safe; audits include a 2026-01-27 collaborative audit and a 2026-05-25 public contest. The distribution pool is a share ledger of integer member units with continuous settlement; Flow Councils reuse the units as votes. Base TVL is $1.25M to $5.59M depending on the source; the February 2022 exploit was a forged-context bug with conflicting loss figures ($8.7M and $13M).

**Sablier.** Lockup v4.0 0xc19a09A66887017F603E5dF420ed3Cb9a5c07C0A (1,227 streams on Base) and Flow v3.0 0x0cbfe6ce6f05c47d6243bb3818837971c6ccb46b (5 streams); Lockup is the vesting form, Flow the payroll form where the receiver bears uncovered debt; no first-party volume figure.

**Circles v2.** Hub 0xc12C1E50ABB450d6205Ea2C3Fa861b3B834d13e8 on Gnosis; 27,572 humans, 678 groups, 2,186 organisations; demurrage 7% a year; welcome bonus 48 CRC; an invite costs the inviter 96 CRC; consented flow over bidirectional trust edges that expire. The Berlin pilot ended with its cooperative in 2023.

**Sarafu and Cosmo-Local Credit.** From 2023-07-05 to 2025-07-20: 745 vouchers, 188 pools, 26,367 users, 285,197 exchanges; SwapPool with a fee policy, a limiter, a quoter and irreversible configuration seals, with a 1% protocol-fee floor; internal audit only.

**Trustlines, Kolektivo, GoodDollar.** Trustlines: bilateral credit lines with per-direction interest and imbalance fees, contracts last changed 2022-12-16, public sites down on 2026-10-08. Kolektivo: a territorial currency system on a modified Mento exchange. GoodDollar: a daily UBI claim funded from a reserve whose bonding curve moved from Bancor on Ethereum to Mento on Celo and XDC.

**Mutual credit in operation.** Sardex: 10,000 firms and over one billion credits transacted by 2025-06, run by a company that sets limits; accounts trade within limits straddling zero with a balance-of-trade account; WIR, Credit Commons (last commit 2021-02-22) and HoloFuel ("has not launched").

**Mutuals, prize savings, rotating pools, uncollateralized credit, rate markets.** Nexus Mutual: 43,328.2 ETH in the pool against a minimum capital requirement of 5,998.7 ETH (7.2 times), NXM book value 0.02615 ETH, claims by a three-person committee since 2025-11, a discretionary mutual with no enforceable cover contract. PoolTogether v5: Base prize pool 0x45b2010d8A4f08b53c9fa7544C51dFd9733732cb, daily draws, time-weighted balances, permissionless claims, shutdown path, no upgrade key. Goodghosting wound down. ChitChain (Aptos) is the minimal priced rotating pool: full collateral, monthly discount auctions, no audit or deployment found. Goldfinch, Maple, TrueFi, Clearpool and Credix read far below their dashboard peaks. Liquity v2 lets each borrower set an annual rate that decides redemption order. Reserve ranks losses: trade to restore backing, seize a first-loss stake, then a haircut.

#### Openings for Tidepool (B2)

1. Credit object: signed-balance lines with a limit pair, a pool-level balance-of-trade account, routed yield paying keepers who keep lines liquid. No mutual credit system found has a yield stream underneath.
2. The share ledger exists: a Tidepool contract as Superfluid pool admin, member units as shares, routed yield as the flow.
3. Priced rotation: ChitChain's bid-discount auction with PoolTogether v5's audited time-weighted balance and permissionless claims.
4. Write the loss order before launch (Reserve, Goldfinch, Nexus).
5. Let members price their own liquidity as Liquity v2 does: the rate paid becomes exit queue position.
6. Admission by priced sponsorship (Circles).
7. Member-issued vouchers settling against a pool (Cosmo-Local Credit), with an accountable, witnessed quoter role.
8. A discretionary-mutual wrapper for pooled risk (Nexus).
9. No source read for any of these systems ties a limit to energy return; a credit unit whose limit is a function of measured net energy return is open ground.

Gaps: Superfluid's own post-mortem, WIR turnover, Nexus claims-paid total, a Kolektivo reserve contract, Unyt source, Metri, Sarafu totals after 2025-07-20, Etherisc, Colony, Aragon, Sky Lending contracts.

## C. The theory that licenses strange pooling instruments

Records: `economics-science-services-section/data/records/literature-measurement-records/2026-10-08-ergodicity-and-pooling.json`, `monetary-economics-science-services-section/data/records/literature-measurement-records/2026-10-08-demurrage-and-local-currency-evidence.json` and, as completed, the energy, mutual-credit, ROSCA, cybernetic-planning, commons-governance, Rendanheyi-and-collapse and Lakota records of the same date (see the section at the end of this note).

**Ergodicity and pooling.** Each entity's resources follow multiplicative noisy growth with drift mu and volatility sigma. Alone, long-run growth is mu minus sigma squared over two; N entities that pool and share every step grow at mu minus sigma squared over 2N. The premium is (sigma squared over two) times (1 minus 1 over N); with correlation rho between members' shocks the limit is mu minus rho sigma squared over two, so a benefit exists unless shocks are perfectly correlated (Peters & Adamou 2018 preprint, published as Peters & Adamou 2022; Peters 2019 is paywalled and was read from preprints). In the worked insurance case a shipowner's growth rises from 1.9% to 2.2% per month and the insurer's by 0.0071% per month, so both sign. On a 4096-agent lattice with insurance only between neighbours, every agent profits but clusters of rich and poor form and a rich agent collapses unless other rich agents are near (Wand et al. 2024). Two stated-preference experiments (n = 200 each) found people share gains and losses in line with time-average optimisation (Vanhoyweghen et al. 2025). No measured pooling gain in an operating cooperative is reported.

**Demurrage and local-currency velocity.** Fisher's stamp scrip (52 weekly stamps at 2 cents) estimated a velocity four times the dollar's. Wörgl 1932-33: a 1% monthly stamp, 36.43 passes a year, ATS 1.3 in circulation per citizen, tax-arrears receipts up 53.8%, employment effect corrected from the quoted 25% to 11-16%, ended by court and National Bank action. Chiemgauer: 8% a year demurrage, 5% reconversion fee, velocity three times the euro's after five years. A table of nine currencies gives velocities from 0.79 (Bristol Pound) to 13.50 (Palmas), WIR 2.60. Every measured velocity gain coexisted with a fixed redemption link, an issuer-run reserve and a way to pay taxes or fees in the currency. Keynes's objection stands: taxing money sends liquidity into substitutes, so the exit fee and redemption queue set the real decay.

### Openings for Tidepool (from C so far)

- Make correlation a design variable: a pool's marginal member is worth most when least correlated with the others, so admission and tranche weights should price diversification, and a pool that links poor clusters to rich ones addresses the clustering result.
- Demurrage is a revenue line (8-12% decay, 2-5% exit fee) and works where the currency is accepted for fees or taxes; a pool that accepts its own credit unit for dues and for loan service has the Wörgl mechanism without needing a tax authority.

## D. US law as design inputs, as of 2026-10-08

Records (finance section): `2026-10-08-stablecoin-and-yield-law.json`, `2026-10-08-defi-developer-and-custody-law.json`, `2026-10-08-cooperative-entity-law.json`, `2026-10-08-securities-and-member-shares.json`, `2026-10-08-lending-and-credit-law.json`, `2026-10-08-tax-of-cooperative-yield-routing.json`; notes of the same slugs carry quotations and section numbers.

**GENIUS Act (Pub. L. 119-27).** A payment stablecoin is a digital asset used or designed to be used as a means of payment or settlement whose issuer is obligated to redeem it for a fixed amount of monetary value and represents that it will hold a stable value (Section 2(22)). Only a subsidiary of an insured depository institution, a federal qualified issuer or a state qualified issuer may issue (Section 2(23), 3(a)); a penalty of $1,000,000 and five years applies to knowing participation (Section 3(f)). The yield ban, Section 4(a)(11), says no permitted issuer shall pay the holder any form of interest or yield "solely in connection with the holding, use, or retention" of the coin; it binds issuers. The OCC proposal adds a rebuttable presumption for arrangements with affiliates or related third parties offering yield as a service. A digital asset service provider does not include a distributed ledger protocol, developing protocols or self-custodial interfaces, an immutable self-custodial software interface, validators, or "participating in a liquidity pool or other similar mechanism for the provisioning of liquidity for peer-to-peer transactions" (Section 2(7)(B)); Section 3(h)(1) exempts own-custody wallet transactions. No final implementing rule is in the Federal Register as read; the effective date resolves to 2027-01-18 and the service-provider offer-and-sale ban starts 2028-07-18.

**Market-structure bill.** The CLARITY text failed cloture 49 to 50 on 2026-09-15 and is not law. Section 404(c) would bar covered parties from paying yield solely for holding payment stablecoins while allowing activity-based rewards (liquidity provision, collateral, governance, staking); Section 604 would give a non-controlling developer a money-transmitter safe harbor; Sections 309 and 601 would exempt automated, non-discretionary DeFi protocols that no person can materially alter.

**Money transmission and custody.** FinCEN's 2019 guidance (FIN-2019-G001) turns on four factors: who owns the value, where it is stored, whether the owner interacts directly with the payment system, and whether the intermediary has total independent control. A user of an unhosted wallet transacting for themselves is not a transmitter; a provider that only adds a validating key is not one; holding value as entries in the provider's accounts makes one. On 2026-10-06 FinCEN withdrew its 2020 unhosted-wallet proposal. Section 1960 of title 18 criminalises unlicensed money transmitting on three theories; the April 2025 Blanche memo narrows prosecution of the first two but keeps (b)(1)(C); the Storm trial is the live test (guilt on one conspiracy count reported, retrial reset to 2027-04-26; read from press only). Van Loon (5th Cir. 2024) holds Tornado Cash's immutable contracts are not "property" and cannot be blocked under IEEPA; it does not decide Section 1960 or criminal liability. Treasury delisted Tornado Cash on 2025-03-21. The Wyoming virtual-currency exemption removes a pure virtual-currency transmitter from its money transmitter act; Colorado's statute read has no such exemption and a mutual-credit clearing leg that issues or sells instruments is inside it, so the design question is whether the pool only records members' own signed transfers.

**Entity.** Colorado's limited cooperative association (C.R.S. 7-58) supports patron and investor members (7-58-102), one vote per patron unless articles allocate by patronage, equity or use (7-58-511, 512), investor votes by articles (7-58-513), profits to patrons in the ratio of patronage with a fifty-percent patron floor once investors exist (7-58-1004(3)-(5)), distributions in money, capital credits or the association's securities subject to a solvency test (7-58-1005, 1007), and an exemption from the state securities act for evidence of membership and patronage instruments issued to patron members (7-58-1009). Wyoming has no limited cooperative association act; W.S. 17-10-230, which the house drafts cite, is the agricultural processing cooperative's patron vote. Wyoming's DUNA (17-32) requires at least one hundred members and bars distribution of profits; its DAO LLC (17-31-109) requires all smart contracts to be "capable of being updated, modified or otherwise upgraded", the opposite of the immutability Van Loon rests on. Courts treated unwrapped DAOs as partnerships or associations (Lido 2024, Ooki 2023, bZx 2023).

**Securities.** Howey, Forman (nonprofit housing shares not securities), Reves (a cooperative's notes were securities), Marine Bank. The SEC and CFTC 2026 interpretation treats a digital tool such as a membership with no passive yield as not a security and protocol staking including liquid staking as not a securities offer; it does not discuss lending claims or vault tokens. The federal exemption for cooperatives (Securities Act Section 3(5)) does not reach an LCA; the route is Regulation CF ($5M), Regulation A ($20M and $75M tiers), or the Howey analysis supported by the 2011 NCB no-action letter, whose features were: issued only as part of the patronage refund, evidencing membership, no ordinary dividend, transferable only to eligible borrowers at par.

**Credit and tax.** Regulation Z excludes credit primarily for a business, commercial or agricultural purpose and credit to other than a natural person; a no-finance-charge line not payable in more than four installments is outside the creditor definition. Colorado's supervised-loan licence applies where the rate exceeds twelve percent per year. Subchapter T lets a cooperative exclude patronage dividends paid under a bylaw obligation that existed before the amounts were received, at least twenty percent in money; the member who owns the asset and directs yield away is still taxed on it (Lucas 1930, Horst 1940); no ruling on member-directed vault yield was found.

**What the house documents get wrong, per the sources.** There is no Wyoming LCA; the draft articles omit the patron fifty-percent profit floor; the specification missed the liquidity-pool carve-out in GENIUS Section 2(7)(B), the Colorado and Wyoming cooperative securities exemptions and the Wyoming virtual-currency exemption.

### Openings for Tidepool (design pattern, legal basis)

| Pattern | Legal basis |
|---|---|
| Members hold principal as their own vault positions; the pool only executes members' signed routing | GENIUS 2(7)(B) and 3(h)(1) carve-outs; FinCEN 2019 four factors (no total independent control) |
| Credit units are tallies not promised redeemable at a fixed amount of money | outside the Section 2(22) payment stablecoin definition |
| Yield is routed by the holder, not paid by an issuer | Section 4(a)(11) binds issuers; the OCC presumption targets issuer affiliates |
| Immutable pool core with no admin key, upgrade proxy or pauser | Van Loon 2024 (immutable contracts are not property); non-controlling developer definitions |
| Colorado LCA with patron members (users) and optional investor members | C.R.S. 7-58-102, 511-513, 1004 |
| Membership interest non-transferable except to the entity at par, issued in the course of using the service, return only as patronage | NCB 2011 letter, Forman, C.R.S. 7-58-1009 |
| Patronage bylaw adopted before the first yield cycle, 20% cash floor | Subchapter T 1382(b), 1388(a), (c) |
| Business credit to member enterprises; no finance charge to individuals | Regulation Z 1026.3(a), 1026.2(a)(17) |

Hard edges: immutability and a Wyoming DAO LLC are incompatible; a Colorado clearing leg that issues instruments needs money-transmitter analysis; no authority says member-directed yield is "business done with" the cooperative; an LCA is not covered by the federal cooperative exemption; California's DFAL and New York were not read.

## E. Live EVM primitives on Base and Gnosis

Records (finance section): `2026-10-08-base-yield-venues.json`, `2026-10-08-base-streaming-and-distribution.json`, `2026-10-08-base-identity-roles-treasury.json`, `2026-10-08-base-account-abstraction-and-wallets.json`, `2026-10-08-gnosis-primitives.json`, `2026-10-08-erc-standards-for-vaults.json`.

| Primitive | Address on Base (Gnosis where noted) | Dated measurement and control |
|---|---|---|
| Morpho Blue | 0xBBBBBbbBBb9cC5e90e3b3Af64bdAF62C37EEFFCb | $4.40B Base TVL; owner Safe 0xcBa28b38103307Ec8dA98377ffF9816C164f9AFa, 5 of 9 |
| Morpho MetaMorpho factories | 0xA9c3D3a366466Fa809d1Ae982Fb2c46E5fC41101 (v1.0), 0xFf62A7c278C62eD665133147129245053Bbf5918 (v1.1); Vault V2 factory 0x4501125508079A99ebBebCE205DeC9593C2b5857 | V2 factory has no Sourcify match |
| Steakhouse High Yield USDC (Vault V2) | 0xbeeff2490FEffa212faC2f6553682C219E6a8845 | 459.26M USDC; 25% performance fee; 3-day adapter timelock |
| Gauntlet USDC Prime (MetaMorpho) | 0xeE8F4eC5672F09119b96Ab6fB59C27E1b7e44b61 | 414.48M USDC; zero fee; 7-day timelock |
| Spark USDC vault | 0x7BfA7C4f149E7415b73bdeDfe609237e29CBF34A | about $355M; 10% fee; 10-day timelock |
| Aave v3 pool | 0xA238Dd80C259a72e81d7e4664a9801593F98d1c5 | USDC supply 4.49%, borrow 5.49%; aToken 181.2M; governance level-1 executor; no Umbrella on Base |
| Spark PSM3 and sUSDS | PSM3 0x1601843c5E9bC251A3272907010AFa41Fa18347E | savings rate 3.80%; sUSDS 10.83M on Base |
| Compound III Comet | 0xb125E6687d4313864e53df431d5425969c15Eb2F | 9.56M supplied, 91% utilised, 6.46%; 1-day timelock |
| Euler v2 | EVC 0x5301c7dD20bD945D2013b48ed0DEE3A284ca8989; factory 0x7F321498A801A191a93C840750ed637149dDf8D0 | 432 vaults; $16.0M |
| Uniswap v4 PoolManager | 0x498581fF718922c3f8e6A244956aF099B2652b2b | hook permissions in the low 14 address bits |
| Superfluid | host 0x4C073B3baB6d8826b8C5b229f3cfdC1eC6E47E74; USDCx 0xD04383398dD2426297da660F9CCA3d439AF9ce1b | USDCx supply 216,478.5; Base TVL $1.25M |
| Sablier | Lockup 0xc19a09A66887017F603E5dF420ed3Cb9a5c07C0A; Flow 0x0cbfe6ce6f05c47d6243bb3818837971c6ccb46b | 1,227 and 5 streams |
| EAS | 0x4200000000000000000000000000000000000021; schema registry 0x4200000000000000000000000000000000000020 | version 1.0.1, predeploys |
| Safe 1.4.1 | singleton 0x41675C099F32341bf84BFc5382aF534df5C7461a | also on Gnosis |
| Zodiac Roles v2 | mastercopy 0x9646fDAD06d3e24444381f44362a3B0eB343D337 | module proxy factory 0x000000000000aDdB49795b0f9bA5BC298cDda236 |
| Hats Protocol v1 | 0x3bc1A0Ad72417f2d411118085256fC53CBdDd137 | 1,899 top hats |
| ERC-4337 EntryPoints | v0.7 0x0000000071727De22E5E9d8BAf0edAc6f37da032; v0.8 0x4337084D9E255Ff0702461CF8895CE9E3b5Ff108 | verified; audits listed |
| Coinbase Smart Wallet | factories 0x0BA5ED0c6AA8c49038F819E587E2633c4A9F428a, 0xBA5ED110eFDBa3D005bfC882d75358ACBbB85842; implementation 0x000100abaad02f1cfC8Bbe32bD5a564817339E72 | VerifyingPaymaster 0x2FAEB0760D4230Ef2aC21496Bb4F0b47D634FD4c, operator not established |
| Permit2 | 0x000000000022D473030F116dDEE9F6B43aC78BA3 | canonical |
| USDC and CCTP v2 | USDC 0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913; TokenMessengerV2 0x28b5a0e9C621a5BadaA536219b3a228C8168cf5d | 4.35B supply |
| Yearn v3 TokenizedStrategy | 0xD377919FA87120584B21279a491F82D5265A139c | audited by yAcademy, Statemind, ChainSecurity |
| Allo v2 | 0x1133eA7Af70876e64665ecD07C0A0476d09465a1 | no Sourcify match, no audit link found |
| Chainlink USDC/USD and sequencer feed | 0x7e860098F58bBFC8648a4311b374B1D669a2bc6B; 0xBCF85224fc0756B9Fa45aA7892530B47e10b6433 | $0.99981288; sequencer up |
| sDAI (Gnosis) | 0xaf204776c7245bF4147c2612BF6e5972Ee483701 | 42.08M assets, 33.38M shares, price 1.2608 |
| Aave v3 (Gnosis) | 0xb50201558B00496A145fE76f7424749556E326D8 | USDC.e supply about 0.001% |
| Circles Hub (Gnosis) | 0xc12C1E50ABB450d6205Ea2C3Fa861b3B834d13e8 | 27,572 humans |

DeFiLlama Base TVL: Morpho Blue $4.40B, Aave v3 $544M, Uniswap v4 $68M, Euler v2 $16.0M, Moonwell $10.9M, Spark savings $5.76M, Pendle $3.3M, Sablier Flow $39.9K, Sablier Lockup $5.5K. ERC-4626 is Final and every vault above answers it; ERC-7540 (asynchronous request, pending, claimable, claim) and ERC-7575 (separate share token) are Final; ERC-6909 and ERC-3009 define multi-id tokens and relayer-submitted signed transfers. No production ERC-7540 vault on Base was found. Not read: Octant v2 deployments on Base, Pimlico and Alchemy paymasters, the Coinbase paymaster operator, RIP-7212, Gnosis Pay, Spark on Gnosis, Pendle, Ethena, Centrifuge, Ondo, Kleros, UMA, World ID.

### Openings for Tidepool (compose, do not build)

- Principal: pool shares as holdings of ERC-4626 vaults (Morpho Vault V2, MetaMorpho, Spark, Aave) read with `convertToAssets`; vault curator, owner and guardian are separate roles and a timelock gates risk increases, so a pool's own risk policy is a vault allowlist plus a cap per venue.
- Distribution: Superfluid GDA pool units as member shares; Sablier for vesting a credit line's repayment schedule.
- Membership and roles: EAS attestations written by the pool; Hats trees for roles; Safe with Zodiac Roles scoping what a treasury signer may call; nothing to deploy for EAS.
- Onboarding: ERC-4337 with Coinbase Smart Wallet factories and a paymaster the pool funds; Permit2 and ERC-3009 for gasless deposits.
- Async credit tranche: ERC-7540 request-then-claim fits a batched credit settlement; no production vault on Base was found, so a Tidepool tranche would be the first.
- Dollars cross-chain: CCTP v2 contracts are already on Base.

## F. Hive and cross-chain economics

Records (finance section): `2026-10-08-hive-hbd-and-dhf-mechanics.json`, `2026-10-08-hive-layer2-and-smart-contract-options.json`, `2026-10-08-cross-chain-messaging-trust-models.json`, `2026-10-08-cross-chain-stablecoin-transfer.json`, `2026-10-08-arbitrum-and-solana-specifics.json`. Source: hived master at commit 45044109 (2026-10-07) and live api.hive.blog reads at head block 110,602,401.

**HBD.** Savings withdrawal takes 3 days (`config.hpp`, `fc::days(3)`); conversions take 3.5 days (`HIVE_CONVERSION_DELAY`); collateralised conversion needs 200% collateral and a 5% fee. The HF26 constants set the print-rate cut and stop at a 20% debt ratio and a hard cap at 30% (`config.hpp`); the debt ratio excluding treasury HBD is 20.68%, above the 20% stop, so the print rate is 0 and collateralised conversion into new HBD is blocked now. There is no "30% haircut" function; what exists is a median-price floor that keeps non-treasury HBD within 30% of combined market cap, not binding today. The savings rate is 10% APR (witness median; 11 of 20 elected witnesses vote 10%). HBD supply is 31,982,272; the feed price is 0.057 HBD per HIVE; `hive.fund` holds 23,218,354 HBD and 27.9M HIVE. Interest accrues in hbd-seconds and is paid when a balance changes after 30 days. HBD has a CoinGecko record of about $33.6M market capitalisation, a 24-hour volume of about $5, no ticker list and no contract on any chain.

**DHF.** The daily budget is 1% of treasury HBD, about 232,183 HBD per day, paid in vote order; proxies count under the proxy (depth 4); proposal fee 10 HBD plus 1 HBD per day beyond 60 days. Fifteen proposals are active; the return proposal (id 0) carries 81.66e15 votes and everything ranked below it gets nothing. Five proposals above it are funded, 13,250 HBD per day in total (Keychain 540, hdev 415, Ecency 100, hbdstabilizer 12,000, worldmappin 195). The stabiliser account sells HBD above the peg and converts HIVE to HBD above $1.05, funded through proposal 388. No cooperative-finance proposal is active.

**custom_json and resources.** 8,192 bytes of JSON, id up to 32 characters, one to forty authorities; average cost 179,578,104 RC per operation, so an account with 107.6B maximum RC can make about 600 per full bar. Recurrent transfers: up to 255 open, minimum 24 hours, maximum 730 days.

**Layer two and smart contracts.** Hive Engine (sidechain at block 63,539,307, 28 witnesses, 13 signatures): SWAP.HBD supply 219,175 issued by a single-key account holding 46,606 HBD (21%). Magi/VSC (mainnet 2025-03-31): WebAssembly contracts on WasmEdge; the gateway account holds 217,175 HIVE and 4,702 HBD under an 18-key authority with threshold 6,667 of 10,000; its own audit lists a disabled settlement handler as Critical; an Ethereum light-client bridge exists as code with no deployed EVM contract found. No wrapped HIVE or HBD exists on any EVM chain read.

**Trust models, one line each, and permission to deploy.**

| Protocol | Trust model | Gnosis | Solana | Deploy without listing |
|---|---|---|---|---|
| Hyperlane | per-app interchain security module, usually m-of-n validators; default ISM governed by a 6-of-10 Safe | yes | yes | yes |
| LayerZero v2 | per-app required and optional verifier networks; the default includes LayerZero Labs | yes (eid 30145) | yes | yes; lane DVN availability varies |
| Chainlink CCIP | committee of 16 node operators plus a risk layer that can curse a chain or lane | yes | yes | tokens self-register; lanes Chainlink-listed |
| Wormhole | 13 of 19 guardians | yes (chain 25) | not read | messages yes |
| Across | HubPool, relayer capital, UMA optimistic oracle | no SpokePool | yes | no, supported chains and tokens only |
| ERC-7683 and Open Intents Framework | settlement-defined | EVM contracts deployable | not covered | yes |
| OP Stack interop | Superchain dependency set | not an OP chain | no | only inside the Superchain |
| IBC | on-chain light clients | via EVM implementation | stated | yes |
| Gnosis bridge | arbitrary message bridge, 4 of 7 validators | native | no | n/a |

**CCTP v2.** Burn on source, mint native USDC on destination after Circle's attestation. Domains: Ethereum 0, OP 2, Arbitrum 3, Solana 5, Base 6; Gnosis has none. Same addresses on every listed EVM chain (TokenMessengerV2 0x28b5a0e9C621a5BadaA536219b3a228C8168cf5d, MessageTransmitterV2 0x81D40F21F12A8F0E3252Bccb954D722d4c464B64, TokenMinterV2 0xfd78EE919681417d192449715b2594ab58f5D002); signature threshold 2; per-message burn limit 10M USDC. Standard transfers cost no protocol fee; Fast Transfer costs 1.3 basis points Base to Arbitrum and 1.4 the other way against an allowance of 53.25M USDC. Hooks are metadata the destination integrator's own contract must read and execute. USDC circulates 66.24B in total, with Gnosis at 12.8 million, a bridged representation.

**Chain specifics.** Arbitrum Stylus adds WebAssembly beside the EVM but storage costs are about the same, activation must be renewed every 365 days and new activations are paused; Timeboost delays non-express transactions 200 ms; BoLD makes validation permissionless with a 6.4-day window plus two days of Security Council grace, so canonical withdrawals take about a week; gas 0.0205 gwei (Arbitrum One) and 0.006 gwei (Base). Solana Token-2022 extensions: interest-bearing mints are display only (a pool cannot pay yield through them), transfer hooks can enforce allowlists, non-transferable mints fit membership shares, a permanent delegate is a custodial control.

### Openings for Tidepool (from F)

- Put the dollar ledger on an EVM chain; use Hive for HBD accounting and as a settlement venue, not as the hub: nothing bridges HBD to EVM except layer-two custodians with single or eighteen-key authorities.
- Pool architecture: EVM hub on Base with CCTP v2 spokes for Arbitrum, Optimism and Solana and a Hyperlane or LayerZero spoke for Gnosis, with the pool's own required verifier set chosen by the cooperative; intents (Across) need a listing and skip Gnosis.
- The HBD savings rate (10%) is higher than any EVM USDC venue read (3.5% to 6.5%); the debt-ratio stop and the thin HBD market are the constraints, and the DHF is a funding source for a Hive-side cooperative (the return proposal gates it).
- Self-registered CCIP token pools and own-deployed OFTs let a pool token or credit unit move across chains without asking anyone.
- Solana: non-transferable Token-2022 mints for membership shares and a transfer hook for allowlists; yield must come from a program, not the token standard.

## Gaps stated across the blocks

Not read or not found, each backed by an empty search row in the named record: any audit of Breadchain's distributor, ButteredBread, Stacks or Safety Net; Breadchain's legal form; deployed Stacks addresses; Octant's per-epoch totals; who holds Glo's contract roles; a production ERC-7540 vault on Base; Hive in any cross-chain registry; a wrapped HBD; WIR turnover and Nexus claims paid; the Storm docket; California and New York money-transmitter text; Regulation B, ECOA and CFPB actions; Native CDFI provisions; any authority on whether member-directed yield is business done with a cooperative.
