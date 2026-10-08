---
title: "Hive HBD, savings, conversion, DHF, custom_json and resource credits: rules and live values"
description: "The numeric rules in hived 1.28.8 source and the on-chain values on 2026-10-08 for HBD debt limits, savings interest, collateralized conversion, the Decentralized Hive Fund, custom_json and resource credits, read as inputs to a cross-chain cooperative pool."
date-created: 2026-10-08
aliases:
  - hive hbd and dhf mechanics
keywords: [Hive, HBD, savings, Decentralized Hive Fund, custom_json, resource credits, hardfork 28]
teaches:
  - the HBD print-rate, hard-cap and conversion rules with source lines
  - how the Decentralized Hive Fund pays proposals and counts votes
  - what a custom_json operation costs and can carry
requires: []
authors: [claude-sonnet-5-5]
type: text
references:
  hivedconfig2026:
    authors:
      - Hived Config
    title: hived libraries/protocol/include/hive/protocol/config.hpp (master 45044109, 2026-10-07)
    year: 2026
    url: https://gitlab.syncad.com/hive/hive/-/blob/master/libraries/protocol/include/hive/protocol/config.hpp
  hivedchain2026:
    authors:
      - Hived Chain
    title: hived libraries/chain/database.cpp, hive_evaluator_transfer.cpp, hive_evaluator.cpp (master 45044109)
    year: 2026
    url: https://gitlab.syncad.com/hive/hive/-/blob/master/libraries/chain/database.cpp
  hiveapistate2026:
    authors:
      - Hive API State
    title: api.hive.blog condenser_api.get_dynamic_global_properties, get_feed_history, get_witness_schedule, get_hardfork_version at head block 110602401 (2026-10-08T19:18:45)
    year: 2026
    url: https://api.hive.blog
  hiveapiaccounts2026:
    authors:
      - Hive API Accounts
    title: api.hive.blog condenser_api.get_accounts for hive.fund, hbdstabilizer and get_account_history
    year: 2026
    url: https://api.hive.blog
  coingeckohive2026:
    authors:
      - CoinGecko Hive
    title: CoinGecko API coins/hive and coins/hive_dollar, 2026-10-08
    year: 2026
    url: https://api.coingecko.com/api/v3/coins/hive_dollar
  defillamahive2026:
    authors:
      - DeFiLlama Hive
    title: DeFiLlama stablecoins and protocols lists searched for Hive/HBD
    year: 2026
    url: https://stablecoins.llama.fi/stablecoins
  hiveapiwitnesses2026:
    authors:
      - Hive API Witnesses
    title: api.hive.blog database_api.list_witnesses by_vote_name, top 20 by votes
    year: 2026
    url: https://api.hive.blog
  blocktrades2021:
    authors:
      - Blocktrades HBD Interest Post
    title: Proposal to make HBD interest payable only to savings accounts (hive.blog, 2021-04-15)
    year: 2021
    url: https://hive.blog/hive-102930/@blocktrades/proposal-to-make-hbd-interest-payable-only-to-savings-accounts
  smooth2021:
    authors:
      - Smooth HBD Interest Post
    title: Why I set my witness HBD interest rate parameter to 7% (hive.blog, 2021-06-02)
    year: 2021
    url: https://hive.blog/hbd/@smooth/why-i-set-my-witness-hbd-interest-rate-parameter-to-7
  empoderat2024:
    authors:
      - Empoderat HBD APR Post
    title: Regarding DHF and HBD APR (hive.blog, 2024-08-09)
    year: 2024
    url: https://hive.blog/hive/@empoderat/regarding-dhf-and-hbd-apr
  gtg2023:
    authors:
      - Gtg HBD APR Post
    title: gtg witness update, upcoming changes in HBD APR (hive.blog, 2023-08-24)
    year: 2023
    url: https://hive.blog/hive-160391/@gtg/gtg-witness-update-upcoming-changes-in-hbd-apr
  arcange2026:
    authors:
      - Arcange HBD Stabilizer Post
    title: HBD Stabilizer - Renewal R4-2026 (hive.blog post, DHF proposal 388, 2026-09-03)
    year: 2026
    url: https://peakd.com/hive-139531/@arcange/hbdstabilizer-2026-r4
  hiveapiproposals2026:
    authors:
      - Hive API Proposals
    title: api.hive.blog database_api.list_proposals status active, order by_total_votes descending
    year: 2026
    url: https://api.hive.blog
  hivedhf2026:
    authors:
      - Hived DHF
    title: hived libraries/chain/util/dhf_processor.cpp, dhf_evaluator.cpp, dhf_processor.hpp (master 45044109)
    year: 2026
    url: https://gitlab.syncad.com/hive/hive/-/blob/master/libraries/chain/util/dhf_processor.cpp
  hivedforks2026:
    authors:
      - Hived Hardforks
    title: hived libraries/protocol/hardfork.d/1_28.hf and 1_29.hf (master 45044109)
    year: 2026
    url: https://gitlab.syncad.com/hive/hive/-/blob/master/libraries/protocol/hardfork.d/1_28.hf
  hiveapirc2026:
    authors:
      - Hive API RC
    title: api.hive.blog rc_api.get_rc_stats, get_resource_pool, find_rc_accounts
    year: 2026
    url: https://api.hive.blog
---

Everything here was read on 2026-10-08 from the hived source (master, commit 45044109 of 2026-10-07) and from api.hive.blog at head block 110602401. Line numbers refer to those files.

## HBD and its limits

Hive Dollar (HBD) is a chain-native asset whose supply is created by witnesses-priced conversion and by savings interest. The rules live in three places. The thresholds are in config.hpp (Hived Config 2026): the print-rate cut starts and stops at 20 percent of market cap since hardfork 26 (lines 342-343), and an artificial price floor applies at 30 percent (line 345; it was 10 percent before hardfork 26, line 344). The calculation is in database.cpp (Hived Chain 2026). The debt ratio is the non-treasury HBD supply, valued in HIVE at the median feed price, divided by virtual supply; HBD held in the `hive.fund` treasury is subtracted first (lines 2886-2905). The print rate is 0 at or above the stop percent, 100 percent at or below the start percent, and linear between (lines 2924-2929). Because start and stop are both 20 percent, it behaves as a switch.

The brief's "30 percent haircut" has no counterpart under that name in source: the word appears only in a words list. What the source contains is the 30 percent price floor. At every feed update the effective median price is raised to `min_price = (100-L) * hbd_supply / (L * hive_supply)` with L = 30 whenever the market median would let non-treasury HBD exceed 30 percent of combined HIVE and HBD value (lines 2511-2530). That makes a large HBD holder unable to redeem HBD into HIVE at a price below the floor.

Live state (Hive API State 2026): current HBD supply 31,982,272.560, of which 23,218,354.254 sits in `hive.fund` (Hive API Accounts 2026). The remaining 8,763,918.306 HBD is 153.75 million HIVE at the 0.057 HBD-per-HIVE median, 20.68 percent of 743.5 million HIVE-equivalent, so `hbd_print_rate` is 0 and `hbd_stop_percent` and `hbd_start_percent` both read 2000. The 30 percent floor price would be 0.0347 HBD per HIVE, below the median, so it is not binding. The market prices read from CoinGecko are HIVE 0.0530 USD and HBD 1.019 USD with a 24-hour HBD volume of 5.10 USD (CoinGecko Hive 2026); no ticker list and no contract address was returned for HBD, and DeFiLlama has no HBD stablecoin row and no Hive chain (DeFiLlama Hive 2026).

## Savings interest and the witness rate

Interest is paid only on savings since hardfork 25. It accrues as hbd-seconds on the savings balance and is minted as new HBD when more than 30 days have passed since the last payment, evaluated on the next balance change on that account (database.cpp 3327-3339; the formula is in hbd_interest.hpp: hbd-seconds divided by seconds per year, times the rate, divided by 100 percent). Interest is therefore simple within a 30-day window and compounds across windows. A withdrawal from savings waits `HIVE_SAVINGS_WITHDRAW_TIME`, which is 3 days, not 3.5 (config.hpp line 197), and an account may hold at most 100 pending withdrawals (line 198). The 3.5 days belong to conversions (line 192).

The rate is a witness property, `hbd_interest_rate`, set with witness_update or witness_set_properties (hive_evaluator.cpp 151-154). The network value is the median over the 21 scheduled witnesses. It reads 1000, which is 10 percent APR (Hive API State 2026). Among the top 20 witnesses by votes nine vote 1000, four vote 1200, and the rest vote between 600 and 1010 (Hive API Witnesses 2026). The same constant, 10 percent, is the default in source (config.hpp line 251). Witness posts give the sequence: 3 percent in the spring of 2021 (Blocktrades HBD Interest Post 2021), 7 percent by early summer of 2021 (Smooth HBD Interest Post 2021), 20 percent from the spring of 2022 and sustained for two to three years, with an estimate of about 1.5 million HBD a year of added inflation at 20 percent and 1.1 million at 15 percent (Empoderat HBD APR Post 2024), and an announcement on 2023-08-24 by gtg of a gradual reduction of his vote to 10 percent (Gtg HBD APR Post 2023). No single first-party time series of the median was found; this sequence is assembled from those four posts.

## Conversions

The legacy `convert` operation takes HBD, waits 3.5 days, and pays HIVE at the median of the last 84 hourly feed medians. The collateralized convert, available since hardfork 25, takes HIVE (hive_evaluator_transfer.cpp from line 486): it is refused while `hbd_print_rate` is 0; half of the posted collateral converts immediately into HBD at the rolling minimum price less a 5 percent fee (200 percent collateral ratio and 5 percent fee, config.hpp lines 194-195); creation fails if it would push the HBD share above the stop percent (line 527); and the unused collateral returns after 3.5 days when the median price settles the debt. Today the first condition fails: HIVE cannot be turned into HBD on chain until the debt ratio falls below 20 percent.

## The stabilizer

`hbdstabilizer` is a DHF-funded account run to keep the HBD price near one dollar. Its renewal post says it sells HBD above the target, converts HIVE into HBD above 1.05, and returns all proceeds to the DHF (Arcange HBD Stabilizer Post 2026). It is funded by proposal 388 at 12,000 HBD per day until 2026-11-05 (Hive API Proposals 2026). At the time of reading the account held 62.6 HIVE and 741 million VESTS and was sending 100 to 132 HIVE to `hive.fund` every few seconds (Hive API Accounts 2026).

## The Decentralized Hive Fund

The treasury account `hive.fund` is filled by 10 percent of inflation (config.hpp line 261, `proposal_fund_percent` 1000) plus proposal fees and stabilizer proceeds, and converts 0.05 percent of its HIVE to HBD each hourly maintenance pass (dhf_processor.cpp 343). Each pass distributes up to 1 percent of the treasury HBD per day (dhf_processor.hpp 25, cpp 154) to active proposals in descending order of total votes, skipping zero-vote proposals and stopping when the budget is exhausted (cpp 188-210, Hived DHF 2026). A proposal costs 10 HBD plus 1 HBD per day of run time beyond 60 days, and its daily pay and end date can only be lowered after creation (dhf_evaluator.cpp 44-53, 120-132).

The return proposal, id 0, asks for 240 million HBD a day to `steem.dao`; any proposal ranked below it receives nothing, because it consumes the remaining budget. The cut-off is therefore a vote contest against proposal 0. Votes weigh each voter's governance power, own staked VESTS plus proxied VESTS to depth 4, and a voter who has set a proxy contributes nothing directly (cpp 99-102; config.hpp line 231). Proposal 0 holds 81.66e9 VESTS, 23.4 percent of all VESTS, about 50.8 million HP (Hive API Proposals 2026). Daily budget today is 232,183 HBD. Five proposals rank above it and are paid 13,250 HBD per day together: Keychain (540), hdev.fund (415), Ecency (100), the stabilizer (12,000) and worldmappin (195). The proposal for Magi Network at 900 HBD per day has 19.6e15 votes against 81.66e15 for proposal 0 and is unfunded. Eight further proposals, including HiveSQL, HiveBuzz, PeakD and a hivewatchers proposal, also rank below the return proposal. The unit pattern is infrastructure and tooling funding by recurring daily pay; no proposal in the active list is a savings, lending or mutual pool.

## custom_json as a data carrier

`custom_json` carries an id of at most 32 characters and a JSON string of at most 8192 characters, authorised by `required_auths` (active-level) or `required_posting_auths` (posting-level) with at most 40 account names in total and at least one (config.hpp lines 424-425, 374; hive_operations.cpp 421-434; hive_evaluator.cpp 343-344, Hived Chain 2026). A transaction is limited to 64 KiB (line 363). Hardfork 28 allows posting authority to be mixed with active authority in one transaction and redundant signatures (Hived Hardforks 2026). The operation does not alter any balance; applications read it from the block stream.

The cost is in resource credits, not in a fee. The average observed cost of a custom_json was 179,578,104 RC over 281,296 operations in the sampled window, about the same as a transfer (178,304,256) (Hive API RC 2026). RC maximum equals staked micro-VESTS regenerating over 5 days (config.hpp line 480). An account holding 107.65 billion RC can send about 600 custom_json operations from a full bar, and about 120 operations per day in steady state. Hardfork 29, defined in source but unscheduled, makes RC part of consensus (Hived Hardforks 2026).

## Other pool primitives in the operation set

Recurrent transfers (at most 255 open per account, recurrence at least 24 hours, at most 730 days, removal after 10 consecutive failures) give a native standing order for contributions (config.hpp lines 200-238). Escrow transfers have a ratification deadline, an agent and a dispute path, limited to 255 pending per account (hive_evaluator_transfer.cpp from line 75). Savings give delayed withdrawal with interest. Account authorities are weighted multisignature sets with a threshold, up to 40 members. The `vsc.gateway` account uses 18 keys with threshold 6667 of 10000 (see the layer-2 note). HIVE can reach the treasury only as HBD from savings (hive_evaluator_transfer.cpp 632).

## Openings for a cross-chain pool

HBD at a 10 percent savings rate is readable and settleable on chain today, but new HBD cannot be created from HIVE while the debt ratio exceeds 20 percent, and HBD has no measurable external market volume. A pool that settles HBD on Hive and in USDC on EVM chains is therefore bridging through the Hive internal market and layer-2 or custodial paths, not through an exchange listing. The DHF has no cooperative-finance precedent; funding cost is a vote contest against a 23 percent stake block.
