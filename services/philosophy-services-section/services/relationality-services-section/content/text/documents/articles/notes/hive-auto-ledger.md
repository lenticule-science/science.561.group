---
title: Hive Auto Ledger
type: doc
status: draft
keywords:
  - tooling
  - systems
  - hive
  - blockchain
  - tokenomics
external_links: []
description: Last updated from triage notes on 2025-08-26.
created: 2025-08-26
df: pd.DataFrame(processed_trades)
    vwap = (df['price'] * df['hive_volume']).sum() / df['hive_volume'].sum()
    logger.info(f"Calculated VWAP: {vwap:.3f}")
    return vwap
vwap_spread: market_status['ask'] - vwap
    logger.info(f"VWAP Analysis - Current: {vwap:.3f}, Spread to Ask: {vwap_spread:.3f}")
spread: market_status['ask'] - market_status['bid']
    if spread <= TRADE_CONFIG['MIN_SPREAD']:
        return None
buy_price: market_status['ask']
    sell_price = buy_price + TRADE_CONFIG['SELL_PRICE_INCREMENT']
    min_trade_hive = TRADE_CONFIG['MIN_TRADE_AMOUNT_HBD'] / (sell_price - buy_price)
    required_hbd = min_trade_hive * buy_price
orderbook: get_orderbook(market, logger)
    if orderbook:
        store_orderbook(db_conn, orderbook)
market_status: analyze_orderbook(orderbook, logger)
trades: get_trade_history(market, logger)
    if trades:
        store_market_history(db_conn, trades)
vwap: calculate_vwap(trades, logger)
    balances = get_balances(account, logger)
opportunity: analyze_opportunity(market_status, vwap, balances, logger)
try:
        while True:
            trade_cycle(market, account, dryfire, logger, db_conn)
            time.sleep(cycle_speed)
    except KeyboardInterrupt:
        logger.info("Shutting down...")
rows: \[\] for trade in trades: if 'hive' in trade and 'non<sub>hive</sub>' in trade: hive<sub>data</sub> = trade\['hive'\] non<sub>hive</sub> = trade\['non<sub>hive</sub>'\]
market: Market("HIVE:HBD", blockchain<sub>instance</sub>=self.hive<sub>instance</sub>) self.order<sub>analyzer</sub> = OrderAnalyzer(market) self.trade<sub>analyzer</sub> = TradeAnalyzer(market) self.wallet<sub>handler</sub> = WalletHandler(self.account) self.opportunity<sub>analyzer</sub> = OpportunityAnalyzer( self.order<sub>analyzer</sub>, self.trade<sub>analyzer</sub>, self.wallet<sub>handler</sub>)
dryfire: not (args.dryfire.lower() == "false" and args.live.lower() == "true") cleanup<sub>mode</sub> = args.cleanup.lower() account<sub>name</sub> = args.account or os.environ.get('HIVE<sub>ACCOUNT</sub>') active<sub>key</sub> = args.key or os.environ.get('HIVE<sub>ACTIVEKEY</sub>')
bot: HiveTradingBot(active<sub>key</sub>, account<sub>name</sub>, dryfire, cleanup<sub>mode</sub>) bot.run(cycle<sub>speed</sub>=CYCLE<sub>SPEED</sub>)
args: parser.parse<sub>args</sub>() dryfire = not (args.dryfire.lower() == "false" and args.live.lower() == "true") cleanup<sub>mode</sub> = args.cleanup.lower() account<sub>name</sub> = args.account or os.environ.get('HIVE<sub>ACCOUNT</sub>') active<sub>key</sub> = args.key or os.environ.get('HIVE<sub>ACTIVEKEY</sub>')
---


_Last updated from triage notes on 2025-08-26._

## Overview

Hive Auto-Ledger (HAL) is a speculative platform designed to manage Hive blockchain wallets with a focus on transparency, usability, and automation. The app will provide tools to track wallet contents, manage transactions, and analyze market data, all while maintaining an accurate Beancount ledger. Future iterations will integrate advanced features such as trade bots, post analytics, CMS capabilities, and tokenomics.

## Roadmap

### HIVE/HBD Market Analyzer

- A view of the current metrics around HIVE/HBD trade and book details, on the chain's internal market.
- Include trade analysis information, VWAP, etc.

### Subscription

- Users can subscribe to HAL by delegating 10 (or more) HP to `@hiveautoledger` (Tier 1 Subscriber).
- Subscription lasts as long as the delegator.
- Validated by logging in with Hive Keychain.
- Subscribers gain access to, at first, a synthesis of trade analysis into signals: buy/sell, discounted/elevated value, etc.
- Subscribers will be curated by `@hiveautoledger` proportional to delegation.

### Market History Analyzer

- Keep market data in a database.
- Include longer-term trade analysis information.
- Subscribers can see longer-term analysis synthesis/signals.
- Subscribers who delegate >50HP (Tier 2 subscriber) can export this data.

### Wallet Analyzer

- A view of a wallet's HIVE/HBD holdings, staked and liquid.
- Tier 2 subscribers get their account history turned into a double-booked ledger, where holdings have cost basis.
- Tier 3 subscribers can use that, and info from the Market History Analyzer, to show what the wallet's market value and at-cost value for its holdings were over time; convert all value to HIVE on a given day, or HBD.
- Tier 3 can export wallet history as a Beancount file.

### Hive Engine Token Pair Analyzer

- A view on the market between tokens paired on TribalDex.
- Same subscription structure as mainchain.

### Wallet Engine Analyzer

- Same as the other wallet analyzer, but for the Engine tokens.
- Same subscription structure as mainchain.

### Synthesized Wallet Analyzer

- Wallet analyzer that takes both parts into account.
- Same subscription structure as mainchain.

### HIVE/HBD Trade Interface

- Allow trading from the trade analysis interface.
- Free.

### HIVE/HBD Trade Automation

- Interface for creating and managing trade bots.
- Bot designer available to Tier 4:
  - trade cycle frequency,
  - buy/sell conditions.
- Pay-to-deploy, pay-per-cycle, pay-per-trade:
  - users' bots prioritized by subscription delegation amount.

### HAL Token Launch

- 100,000 HAL are minted and distributed based on all-time curation returns.
- HAL/SWAP.HBD liquidity pool established.

### Engine DEX

- Set up frontend for the Engine DEX.

### Content Analytics

- Look at the curation rewards and all available analytics for a given Hive post/comment.

### Wallet Post Analytics

- Look at the metrics for all of a wallet's posts.

### Wallet Curation Analytics

- Look at the metrics for a wallet's curation.

### Content Management

- Allow users to draft, edit, publish posts.
- Allow for post templating and scheduling.

### AI Content Analytics

- Use AI to do more analysis of content.

### AI Content Writing

- Use AI to help folk write content.

## Tokens

HAL is designed to support a robust token-based economy, with its own set of tokens to help provide that support.

### Layer 1

#### HAL

HAL is the governance and utility token at the core of the Hive Auto Ledger (HAL) platform, designed to integrate all aspects of its economy into a single, cohesive system. HAL facilitates decentralized decision-making, with governance weighted by staked tokens. Users propose changes, allocate resources, and guide development by staking and spending HAL, creating a self-sustaining cycle of demand.

Revenue from the platform—whether from pay-to-use features like market analytics, trading fees, or contributions like Hive Power delegation—is collected in various tokens and converted into HAL through market buybacks. This ensures HAL remains the sole internal currency, directly tying its value to the platform’s success. Early liquidity providers register their contributions manually, earning proportional rewards in HAL, with plans to evolve into tokenized liquidity pool models as the system scales.

As the platform grows, HAL’s utility extends to funding proposals, incentivizing community engagement, and supporting key infrastructure like Resource Credit management. Its economy is built to align incentives, ensuring every participant—from app users to liquidity providers to governance contributors—can shape and benefit from the platform’s success. HAL is not just a token; it is the foundation of a circular, utility-driven economy designed to evolve alongside the Hive Auto Ledger.

### Layer 2

#### Liquidity Derivatives

##### HLDSHBD

HLDSHBD is a liquid token derived from pooled staked HBD. The token is managed by a smart contract that stakes all deposited HBD, earning rewards that are automatically compounded back into the pool. HLDSHBD represents a proportional claim on the pool, including both the staked principal and accrued rewards. The token can be traded or integrated into DeFi protocols, offering holders liquidity and yield simultaneously. Redemption is facilitated by sending HLDSHBD to the contract, which unstakes and returns the corresponding share of the pool’s value to the sender.

##### HLDSHP

HLDSHP (HAL Liquidity Derivative, Staked Hive Power) is a straightforward financial tool representing pooled staked Hive Power. Users stake HIVE through a smart contract, receiving HLDSHP tokens that denote their proportional share of the pool. Staking rewards are compounded automatically, and redemption involves returning HLDSHP to the contract, which unstakes the corresponding HIVE and distributes it after the standard on-chain unstaking period.

#### Liquidity Pools (Layer 2)

##### HLPSWAPHBD

- Pairing of HAL and SWAP.HBD.

##### HLPSWAPHIVE

- Pairing of HAL and SWAP.HIVE.

### Layer 3

#### Liquidity Pools

Each of the tokens in Layer 1 can be paired with each of the tokens in Layer 2, for Layer 3 LPs.

For example, HAL and HLDSHAL can be paired to make `HLPHLDSHAL` (when a HLP token is starting with HAL, we don't bother putting that in the name; it's the only thing we can do to keep them shorter).

### Layer 4

#### Liquidity Pools

Every token in Layer 1 and Layer 2 can be paired with every token in Layer 3, for 84 Layer 4 LPs.

Here is a potential token and its breakdown:

- HLP
  - HLP
    - HLD
      - SHAL
    - HLD
      - SHP
  - HLP
    - HLD
      - SHAL
    - HLD
      - SHBD

For a token name of `HLPHLPHLDSHALHLDSHPHLPHLDSHALHLDSHBD`, where:

- `HLP` stands for HAL Liquid Derivative,
- `HLP` (second position) stands for HAL Liquidity Pair,
- `SHAL` for Staked HAL,
- `SHP` for Staked Hive Power,
- `SHBD` for Staked Hive Backed Dollar.

## HAL Token Overview

HAL is the governance and utility token at the core of the Hive Auto Ledger (HAL) platform, designed to integrate all aspects of its economy into a single, cohesive system. HAL facilitates decentralized decision-making, with governance weighted by staked tokens. Users propose changes, allocate resources, and guide development by staking and spending HAL, creating a self-sustaining cycle of demand.

Revenue from the platform—whether from pay-to-use features like market analytics, trading fees, or contributions like Hive Power delegation—is collected in various tokens and converted into HAL through market buybacks. This ensures HAL remains the sole internal currency, directly tying its value to the platform’s success. Early liquidity providers register their contributions manually, earning proportional rewards in HAL, with plans to evolve into tokenized liquidity pool models as the system scales.

As the platform grows, HAL’s utility extends to funding proposals, incentivizing community engagement, and supporting key infrastructure like Resource Credit management. Its economy is built to align incentives, ensuring every participant—from app users to liquidity providers to governance contributors—can shape and benefit from the platform’s success. HAL is not just a token; it is the foundation of a circular, utility-driven economy designed to evolve alongside the Hive Auto Ledger.

## Hive Investment Bot

### Version 0.0.1

```python
#!/usr/bin/env python3
import os
import time
import logging
import argparse
from beem import market
import pandas as pd
from datetime import datetime, timedelta
from beem import Hive
from beem.account import Account
from beem.market import Market
from rich.console import Console

# Configuration Variables
CYCLE_SPEED = 15  # Time between cycles in seconds

console = Console()


# Logger setup
def setup_logger():
    logging.basicConfig(level=logging.INFO,
                        format='%(asctime)s - %(message)s',
                        datefmt='%H:%M:%S')
    return logging.getLogger('bot')


# Order analysis class
class OrderAnalyzer:

    def __init__(self, market):
        self.market = market

    def get_orderbook(self):
        try:
            return self.market.orderbook()
        except Exception as e:
            console.print(f"[red]Error retrieving orderbook: {str(e)}[/red]")
            return None

    def analyze_orderbook(self):
        orderbook = self.get_orderbook()
        if not orderbook or 'asks' not in orderbook or 'bids' not in orderbook:
            return None
        lowest_ask = float(orderbook['asks'][0]['price'])
        highest_bid = float(orderbook['bids'][0]['price'])
        spread = lowest_ask - highest_bid
        spread_percentage = (spread /
                             highest_bid) * 100 if highest_bid > 0 else 0
        console.print(
            f"      [cyan]Ask[/cyan] [red]{lowest_ask:.3f}[/red]  to  [green]{highest_bid:.3f} [/green] bid"
        )
        console.print(
            f"        [cyan]Spread:[/cyan] [yellow]{spread:.3f}[/yellow]")
        market_status = {
            'ask': lowest_ask,
            'bid': highest_bid,
            'spread': spread
        }
        return market_status


# Trade analysis class
class TradeAnalyzer:

    def __init__(self, market):
        self.market = market

    def get_trade_history(self):  # Last 3 minutes
        try:
            return self.market.market_history(1, 360, 0)
        except Exception as e:
            console.print(
                f"[red]Error retrieving trade history: {str(e)}[/red]")
            return None

    def calculate_vwap(self):
        trades = self.get_trade_history()
        if not trades:
            return None

        rows = []
        for trade in trades:
            if 'hive' in trade and 'non_hive' in trade:
                hive_data = trade['hive']
                non_hive = trade['non_hive']

                if float(hive_data['close']) > 0:
                    price = float(non_hive['close']) / float(
                        hive_data['close'])
                    hive_volume = float(hive_data['volume'])
                    rows.append({'price': price, 'hive_volume': hive_volume})

        df = pd.DataFrame(rows)

        if not df.empty:
            vwap = (df['price'] *
                    df['hive_volume']).sum() / df['hive_volume'].sum()
            return vwap

        console.print("[yellow]No trades in the last 3 minutes.[/yellow]")
        return None


# Opportunity analysis class
class OpportunityAnalyzer:

    def __init__(self, order_analyzer, trade_analyzer, wallet_analyzer):
        self.order_analyzer = order_analyzer
        self.trade_analyzer = trade_analyzer
        self.wallet_analyzer = wallet_analyzer

    def find_opportunity(self):
        market_status = self.order_analyzer.analyze_orderbook()
        if not market_status:
            return None

        vwap = self.trade_analyzer.calculate_vwap()
        vwap_spread = market_status['ask'] - vwap
        console.print(
            f"  [cyan]3mVWAP[/cyan] [yellow]{vwap:.3f}[/yellow]  to  [red]{market_status['ask']:.3f}[/red] [cyan]ask[/cyan]"
        )
        console.print(
            f"      [cyan]Spread:[/cyan] [yellow] {vwap_spread:.3f}[/yellow]")

        if market_status['ask'] <= vwap:
            if vwap_spread <= 0.000:
                spread = market_status['ask'] - market_status['bid']
                if spread > 0.000:
                    console.print(
                        f"Spread of {market_status['spread']:.3f} is beyond precision tolerance..."
                    )
                    buy_price = market_status['ask']
                    sell_price = (buy_price + 0.001)
                    min_trade_hive = 0.001 / (sell_price - buy_price)
                    balances = self.wallet_analyzer.get_balances()
                    required_hbd = min_trade_hive * buy_price
                    if balances['HIVE'] >= min_trade_hive and balances['HBD'] >= required_hbd:
                        console.print(
                            f"Minimum trade size of {min_trade_hive:.3f} HIVE and {required_hbd:.3f} HBD is liquid in wallet..."
                        )
                        console.print(
                            f"OPPORTUNITY FOUND: Buy {min_trade_hive:.3f} at {buy_price:.3f}, sell at {sell_price:.3f}"
                        )
                        return {
                            'buy': buy_price,
                            'sell': sell_price,
                            'volume': min_trade_hive
                        }
                    else:
                        console.print(
                            f"Insufficient funds. Need {min_trade_hive:.3f} HIVE and {required_hbd:.3f} HBD, have {balances['HIVE']:.3f} HIVE and {balances['HBD']:.3f} HBD"
                        )
                else:
                    console.print(
                        f"Market spread of {spread} too narrow for precision tolerance. NO OPPORTUNITY."
                    )
            else:
                console.print(
                    "     [yellow]3mVWAP spread[/yellow] <= [yellow]0.001[/yellow]"
                )
        else:
            console.print(
                "        [yellow]3mVWAP[/yellow]  <=  [red]Ask[/red]")
        return None


# Wallet handling class
class WalletHandler:

    def __init__(self, account):
        self.account = account

    def get_balances(self):
        try:
            balances = {
                'HIVE': float(self.account.get_balance('available', 'HIVE')),
                'HBD': float(self.account.get_balance('available', 'HBD'))
            }
            return balances
        except Exception as e:
            console.print(f"[red]Error retrieving balances: {str(e)}[/red]")
            return None


# Main bot class
class HiveTradingBot:

    def __init__(self, active_key, account_name, dryfire, cleanup_mode):
        self.logger = setup_logger()
        self.dryfire = dryfire
        self.cleanup_mode = cleanup_mode
        nodes = [
            "https://api.hive.blog", "https://api.hivekings.com",
            "https://anyx.io", "https://api.openhive.network"
        ]
        self.hive_instance = Hive(nodes=nodes, keys=[active_key])
        self.account = Account(account_name,
                               blockchain_instance=self.hive_instance)

        market = Market("HIVE:HBD", blockchain_instance=self.hive_instance)
        self.order_analyzer = OrderAnalyzer(market)
        self.trade_analyzer = TradeAnalyzer(market)
        self.wallet_handler = WalletHandler(self.account)
        self.opportunity_analyzer = OpportunityAnalyzer(
            self.order_analyzer, self.trade_analyzer, self.wallet_handler)

    def cleanup(self):
        """Cancel all open orders and perform cleanup"""
        try:
            if self.cleanup_mode == 'all' and not self.dryfire:
                console.print("[yellow]Cancelling all open orders...[/yellow]")
                self.order_analyzer.market.cancel_all(account=self.account)
                console.print("[green]All orders cancelled[/green]")
            else:
                console.print("[yellow]Cleanup skipped - dryfire mode or cleanup not enabled[/yellow]")
        except Exception as e:
            console.print(f"[red]Error during cleanup: {str(e)}[/red]")

    def run(self, cycle_speed):
        print("Beginning trade cycle")
        if self.dryfire:
            print("Dryfire mode enabled. No trades will be executed.")
        else:
            print("LIVE TRADING MODE!!! REAL FUNDS WILL BE USED!!!")
        try:
            while True:
                try:
                    console.print(
                        "\n[bold cyan]Trade cycle beginning...[/bold cyan]")
                    opportunity = self.opportunity_analyzer.find_opportunity()
                    if opportunity:
                        if not self.dryfire:
                            # Double check balance before placing orders
                            current_balance = self.wallet_handler.get_balances()
                            if current_balance and current_balance['HIVE'] >= opportunity['volume']:
                                console.print(
                                    f"Placing orders for {opportunity['volume']:.3f} HIVE")
                                # Place orders here
                            else:
                                console.print("[red]Insufficient balance to execute trade[/red]")
                        else:
                            console.print("Dryfire mode enabled. Moving on.")
                    else:
                        console.print(
                            "[bold cyan]Cycle ending:[/bold cyan] [cyan]No move[/cyan]"
                        )
                    console.print(
                        f"[cyan]Sleeping[/cyan] [yellow]{cycle_speed}s[/yellow]")
                    time.sleep(cycle_speed)
                except KeyboardInterrupt:
                    raise
                except Exception as e:
                    console.print(f"[red]Error in trading loop: {str(e)}[/red]")
                    raise
        finally:
            console.print("\n[yellow]Shutting down...[/yellow]")
            self.cleanup()


def main():
    parser = argparse.ArgumentParser(description="Hive Trading Bot")
    parser.add_argument(
        "--dryfire",
        type=str,
        default="true",
        help=
        "Run in dryfire mode (default: true). Must set --dryfire=false and --live=true to execute trades."
    )
    parser.add_argument(
        "--live",
        type=str,
        default="false",
        help="Explicitly confirm live trading mode (default: false).")
    parser.add_argument("--account",
                        type=str,
                        help="Hive account name for the bot to use.")
    parser.add_argument("--key",
                        type=str,
                        help="Active key for the Hive account.")
    parser.add_argument("--cleanup",
                        type=str,
                        default="none",
                        help="Cleanup mode on shutdown: 'none' or 'all' (default: none)")
    args = parser.parse_args()

    dryfire = not (args.dryfire.lower() == "false"
                   and args.live.lower() == "true")
    cleanup_mode = args.cleanup.lower()
    account_name = args.account or os.environ.get('HIVE_ACCOUNT')
    active_key = args.key or os.environ.get('HIVE_ACTIVE_KEY')

    if not account_name or not active_key:
        console.print(
            "[red]Error: Hive account name and active key are required. Provide them using --account and --key arguments or set HIVE_ACCOUNT and HIVE_ACTIVE_KEY as environment variables.[/red]"
        )
        return

    bot = HiveTradingBot(active_key, account_name, dryfire, cleanup_mode)
    bot.run(cycle_speed=CYCLE_SPEED)


if __name__ == "__main__":
    main()
```

### Version 0.0.2

```python
#!/usr/bin/env python3
import os
import time
import logging
import argparse
from typing import Dict, Any, Optional, List, Tuple, Callable
from functools import partial, reduce
from beem import Hive
from beem.account import Account
from beem.market import Market
from rich.console import Console
import pandas as pd

CYCLE_SPEED = 15
console = Console()


def setup_logger() -> logging.Logger:
    logging.basicConfig(
        level=logging.INFO,
        format='%(asctime)s - %(message)s',
        datefmt='%H:%M:%S'
    )
    return logging.getLogger('bot')


def get_orderbook(market: Market) -> Optional[Dict]:
    try:
        return market.orderbook()
    except Exception as e:
        console.print(f"[red]Error retrieving orderbook: {str(e)}[/red]")
        return None


def analyze_orderbook(orderbook: Optional[Dict]) -> Optional[Dict]:
    if not orderbook or 'asks' not in orderbook or 'bids' not in orderbook:
        return None

    lowest_ask = float(orderbook['asks'][0]['price'])
    highest_bid = float(orderbook['bids'][0]['price'])
    spread = lowest_ask - highest_bid

    console.print(f"      [cyan]Ask[/cyan] [red]{lowest_ask:.3f}[/red]  to  [green]{highest_bid:.3f} [/green] bid")
    console.print(f"        [cyan]Spread:[/cyan] [yellow]{spread:.3f}[/yellow]")

    return {'ask': lowest_ask, 'bid': highest_bid, 'spread': spread}


def get_trade_history(market: Market) -> Optional[List]:
    try:
        return market.market_history(1, 360, 0)
    except Exception as e:
        console.print(f"[red]Error retrieving trade history: {str(e)}[/red]")
        return None


def process_trade(trade: Dict) -> Optional[Dict]:
    if 'hive' not in trade or 'non_hive' not in trade:
        return None

    hive_data = trade['hive']
    non_hive = trade['non_hive']

    if float(hive_data['close']) <= 0:
        return None

    return {
        'price': float(non_hive['close']) / float(hive_data['close']),
        'hive_volume': float(hive_data['volume'])
    }


def calculate_vwap(trades: Optional[List]) -> Optional[float]:
    if not trades:
        console.print("[yellow]No trades in the last 3 minutes.[/yellow]")
        return None

    processed_trades = list(filter(None, map(process_trade, trades)))
    if not processed_trades:
        return None

    df = pd.DataFrame(processed_trades)
    return (df['price'] * df['hive_volume']).sum() / df['hive_volume'].sum()
```

### Content Management
- Allow users to draft, edit, and publish posts.
- Allow for post templating and scheduling.

### AI Content Analytics
- Use AI to perform additional analysis of content.

### AI Content Writing
- Use AI to help people write content.

##### HLPSWAPHBD
- Pairing of HAL and SWAPHBD.

##### HLPSWAPHIVE
- Pairing of HAL and SWAPHIVE.

For example, HAL and HLDSHAL can be paired to make HLPHLDSHAL (when an HLP token starts with HAL, we do not repeat HAL in the name to keep them shorter).

def run(self, cycle_speed):
        print("Beginning trade cycle")
        if self.dryfire:
            print("Dryfire mode enabled. No trades will be executed.")
        else:
            print("LIVE TRADING MODE!!! REAL FUNDS WILL BE USED!!!")
        try:
            while True:
                try:
                    console.print(
                        "\n[bold cyan]Trade cycle beginning...[/bold cyan]")
                    opportunity = self.opportunity_analyzer.find_opportunity()
                    if opportunity:
                        if not self.dryfire:
                            # Double check balance before placing orders
                            current_balance = self.wallet_handler.get_balances()
                            if current_balance and current_balance['HIVE'] >= opportunity['volume']:
                                console.print(
                                    f"[bold cyan]Cycle ending:[/bold cyan] [cyan]Placing order pair:[/cyan] [yellow]{opportunity['volume']:.3f} HIVE[/yellow] at [red]{opportunity['buy']:.3f}[/red]|[green]{opportunity['sell']:.3f}[/green]"
                                )
                                self.order_analyzer.market.buy(opportunity['buy'],
                                                               opportunity['volume'],
                                                               account=self.account)
                                self.order_analyzer.market.sell(opportunity['sell'],
                                                                opportunity['volume'],
                                                                account=self.account)
                            else:
                                console.print("[red]Insufficient balance to execute trade[/red]")
                        else:
                            console.print("Dryfire mode enabled. Moving on.")
                    else:
                        console.print(
                            "[bold cyan]Cycle ending:[/bold cyan] [cyan]No move[/cyan]"
                        )
                    console.print(
                        f"[cyan]Sleeping[/cyan] [yellow]{cycle_speed}s[/yellow]")
                    time.sleep(cycle_speed)
                except KeyboardInterrupt:
                    raise
                except Exception as e:
                    console.print(f"[red]Error in trading loop: {str(e)}[/red]")
                    raise
        finally:
            console.print("\n[yellow]Shutting down...[/yellow]")
            self.cleanup()

# Trading Configuration
TRADE_CONFIG = {
    # Market parameters
    'MIN_SPREAD': 0.001,  # Minimum spread between ask and bid to consider trading
    'VWAP_MINUTES': 5,    # Number of minutes for VWAP calculation (minimum 5)
    'MAX_ASK_VWAP_SPREAD': 0.000,  # Maximum allowable spread between ask and VWAP
    'MIN_TRADE_AMOUNT_HBD': 0.001,  # Minimum trade amount in HBD
    'SELL_PRICE_INCREMENT': 0.001,  # How much above buy price to place sell order

# Order book depth
    'ASK_DEPTH': 5,  # How many ask orders to consider
    'BID_DEPTH': 5,  # How many bid orders to consider

# Trade cycle parameters
    'CYCLE_SPEED': 15,  # Seconds between trade cycles
    'MAX_ORDERS': 10    # Maximum number of open orders allowed
}

def decimal_to_float(obj):
    if isinstance(obj, Decimal):
        return float(obj)
    elif isinstance(obj, datetime):
        return obj.isoformat()
    elif isinstance(obj, dict):
        return {k: decimal_to_float(v) for k, v in obj.items()}
    elif isinstance(obj, list):
        return [decimal_to_float(x) for x in obj]
    return obj

CYCLE_SPEED = TRADE_CONFIG['CYCLE_SPEED']
console = Console()

def setup_logger() -> logging.Logger:
    logger = logging.getLogger('bot')
    logger.setLevel(logging.INFO)

# Console handler for trader info
    console_handler = logging.StreamHandler()
    console_handler.setLevel(logging.INFO)
    console_formatter = logging.Formatter('%(message)s')
    console_handler.setFormatter(console_formatter)

# File handler for developer info
    file_handler = logging.FileHandler('bot_dev.log')
    file_handler.setLevel(logging.DEBUG)
    file_formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
    file_handler.setFormatter(file_formatter)

logger.addHandler(console_handler)
    logger.addHandler(file_handler)
    return logger

def setup_database() -> psycopg2.extensions.connection:
    database_url = os.environ.get('DATABASE_URL')
    if not database_url:
        raise ValueError("DATABASE_URL environment variable not set")
    conn = psycopg2.connect(database_url)

with conn.cursor() as cur:
        # Create tables if they don't exist
        cur.execute("""
            CREATE TABLE IF NOT EXISTS market_history (
                id SERIAL PRIMARY KEY,
                timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                trade_data JSONB
            )
        """)
        cur.execute("""
            CREATE TABLE IF NOT EXISTS orderbook_history (
                id SERIAL PRIMARY KEY,
                timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                orderbook_data JSONB
            )
        """)
        cur.execute("""
            CREATE TABLE IF NOT EXISTS account_orders (
                id SERIAL PRIMARY KEY,
                timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                order_data JSONB
            )
        """)
        conn.commit()
    return conn

def store_market_history(conn: psycopg2.extensions.connection, trades: List[Dict]) -> None:
    with conn.cursor() as cur:
        cur.execute(
            "INSERT INTO market_history (trade_data) VALUES (%s)",
            (Json(decimal_to_float(trades)),)
        )
        conn.commit()

def store_orderbook(conn: psycopg2.extensions.connection, orderbook: Dict) -> None:
    with conn.cursor() as cur:
        cur.execute(
            "INSERT INTO orderbook_history (orderbook_data) VALUES (%s)",
            (Json(decimal_to_float(orderbook)),)
        )
        conn.commit()

def store_account_order(conn: psycopg2.extensions.connection, order: Dict) -> None:
    with conn.cursor() as cur:
        cur.execute(
            "INSERT INTO account_orders (order_data) VALUES (%s)",
            (Json(decimal_to_float(order)),)
        )
        conn.commit()

def get_orderbook(market: Market, logger: logging.Logger) -> Optional[Dict]:
    try:
        orderbook = market.orderbook()
        logger.debug(f"Retrieved orderbook: {orderbook}")
        return orderbook
    except Exception as e:
        logger.error(f"Error retrieving orderbook: {str(e)}")
        return None

def analyze_orderbook(orderbook: Optional[Dict], logger: logging.Logger) -> Optional[Dict]:
    if not orderbook or 'asks' not in orderbook or 'bids' not in orderbook:
        return None

logger.info(f"Market Status - Ask: {lowest_ask:.3f}, Bid: {highest_bid:.3f}, Spread: {spread:.3f}")

def get_trade_history(market: Market, logger: logging.Logger) -> Optional[List]:
    try:
        trades = market.market_history(1, TRADE_CONFIG['VWAP_MINUTES'] * 60, 0)
        logger.debug(f"Retrieved trade history: {trades}")
        return trades
    except Exception as e:
        logger.error(f"Error retrieving trade history: {str(e)}")
        return None

def calculate_vwap(trades: Optional[List], logger: logging.Logger) -> Optional[float]:
    if not trades:
        logger.info("No trades in the last 3 minutes")
        return None

def get_balances(account: Account, logger: logging.Logger) -> Optional[Dict]:
    try:
        balances = {
            'HIVE': float(account.get_balance('available', 'HIVE')),
            'HBD': float(account.get_balance('available', 'HBD'))
        }
        logger.info(f"Account Balances - HIVE: {balances['HIVE']:.3f}, HBD: {balances['HBD']:.3f}")
        return balances
    except Exception as e:
        logger.error(f"Error retrieving balances: {str(e)}")
        return None

def analyze_opportunity(
    market_status: Optional[Dict],
    vwap: Optional[float],
    balances: Optional[Dict],
    logger: logging.Logger
) -> Optional[Dict]:
    if not all([market_status, vwap, balances]):
        return None

if not (market_status['ask'] <= vwap and vwap_spread <= TRADE_CONFIG['MAX_ASK_VWAP_SPREAD']):
        return None

if balances['HIVE'] < min_trade_hive or balances['HBD'] < required_hbd:
        logger.info(f"Insufficient funds - Need {min_trade_hive:.3f} HIVE and {required_hbd:.3f} HBD")
        return None

def execute_trade(
    market: Market,
    opportunity: Dict,
    account: Account,
    logger: logging.Logger,
    db_conn: psycopg2.extensions.connection
) -> None:
    buy_order = market.buy(opportunity['buy'], opportunity['volume'], account=account)
    sell_order = market.sell(opportunity['sell'], opportunity['volume'], account=account)

logger.info(f"Orders placed - Volume: {opportunity['volume']:.3f} HIVE")
    store_account_order(db_conn, {'buy': buy_order, 'sell': sell_order})

def cleanup(market: Market, account: Account, cleanup_mode: str, dryfire: bool, logger: logging.Logger) -> None:
    try:
        if cleanup_mode == 'all' and not dryfire:
            logger.info("Cancelling all open orders...")
            market.cancel_all(account=account)
            logger.info("All orders cancelled")
    except Exception as e:
        logger.error(f"Error during cleanup: {str(e)}")

if opportunity and not dryfire:
        execute_trade(market, opportunity, account, logger, db_conn)
    elif opportunity:
        logger.info("Dryfire mode enabled. Moving on.")
    else:
        logger.info("No trading opportunity found")

def create_bot(active_key: str, account_name: str) -> Tuple[Market, Account]:
    nodes = [
        "https://api.hive.blog",
        "https://api.hivekings.com",
        "https://anyx.io",
        "https://api.openhive.network"
    ]
    hive_instance = Hive(nodes=nodes, keys=[active_key])
    account = Account(account_name, blockchain_instance=hive_instance)
    market = Market("HIVE:HBD", blockchain_instance=hive_instance)
    return market, account

def run_bot(market: Market, account: Account, dryfire: bool, cycle_speed: int, logger: logging.Logger, db_conn: psycopg2.extensions.connection) -> None:
    logger.info("Beginning trade cycle")
    logger.info("Dryfire mode enabled." if dryfire else "LIVE TRADING MODE!!!")

def parse_args() -> Tuple[bool, str, Optional[str], Optional[str]]:
    parser = argparse.ArgumentParser(description="Hive Trading Bot")
    parser.add_argument("--dryfire", type=str, default="true")
    parser.add_argument("--live", type=str, default="false")
    parser.add_argument("--account", type=str)
    parser.add_argument("--key", type=str)
    parser.add_argument("--cleanup", type=str, default="none")

return dryfire, cleanup_mode, account_name, active_key

def main():
    logger = setup_logger()
    try:
        db_conn = setup_database()
    except Exception as e:
        logger.error(f"Failed to setup database: {str(e)}")
        return

dryfire, cleanup_mode, account_name, active_key = parse_args()

if not account_name or not active_key:
        logger.error("Error: Hive account name and active key are required.")
        return

market, account = create_bot(active_key, account_name)
    try:
        run_bot(market, account, dryfire, CYCLE_SPEED, logger, db_conn)
    finally:
        cleanup(market, account, cleanup_mode, dryfire, logger)
        db_conn.close()

## HiveMeta
HiveMeta is a decentralized application on the Hive blockchain designed for community-driven curation of account metadata. Using proof-of-stake, users can delegate Hive Power (HP) to the HiveMeta Curation Bot (MCB) to propose and vote on metadata tags for Hive accounts, such as “tip bot,” “curation account,” or “vaporware.” Voting power grows progressively with the duration of HP delegation, ensuring that only sustained participants have significant influence, while undelegation triggers a gradual decay of voting rights to discourage opportunistic behavior.

Metadata changes are time-locked for review, remaining provisional for 30 days to prevent manipulation and allow for disputes. Proposal fees, paid in HBD, discourage spam and fund rewards for long-term delegators and accurate voters. All metadata, proposals, and votes are transparently stored on-chain, enabling easy integration with other Hive dApps. HiveMeta fosters trust and accountability within the Hive ecosystem, empowering the community to collaboratively enhance transparency and improve the user experience.

\## Overview

\### Subscription

\### Market History Analyzer

\### Wallet Analyzer

- A view on the market between tokens paired on TribalDex
- Same subscription stuff as mainchain

\### Wallet Engine Analyzer

- Same as the other wallet analyzer, but for the Engine tokens
- same subscription stuff as mainchain

\### Synthesized Wallet Analyzer

- Wallet analyzer that takes both parts into account
- same subscription stuff as mainchain

\### HIVE/HBD Trade Interface

\### HIVE/HBD Trade Automation

\### HAL Token Launch

\### Engine DEX

\### Content Analytics

\### Wallet Post Analytics

- Look at the metrics for all of a wallets posts

\### Wallet curation analytics

\### Content Management

\### AI content analytics

\### AI content writing

- use AI to do help folk write content

\## Tokens

\##### HLPSWAPHIVE

\### Layer 4 \#### Liquidity Pools

Where HLP stands for HAL Liquid Derivative and HLP for HAL Liquidity Pair, SHAL for Staked HAL, SHP for Staked Hive Power, SHBD for Staked Hive Backed Dollar

CYCLE<sub>SPEED</sub> = 15 \# Time between cycles in seconds

def setup<sub>logger</sub>(): logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(message)s', datefmt='%H:%M:%S') return logging.getLogger('bot')

def \_<sub>init</sub>\_<sub>(self, market)</sub>: self.market = market

def get<sub>orderbook</sub>(self): try: return self.market.orderbook() except Exception as e: console.print(f"\[red\]Error retrieving orderbook: {str(e)}\[/red\]") return None

def analyze<sub>orderbook</sub>(self): orderbook = self.get<sub>orderbook</sub>() if not orderbook or 'asks' not in orderbook or 'bids' not in orderbook: return None lowest<sub>ask</sub> = float(orderbook\['asks'\]\[0\]\['price'\]) highest<sub>bid</sub> = float(orderbook\['bids'\]\[0\]\['price'\]) spread = lowest<sub>ask</sub> - highest<sub>bid</sub> spread<sub>percentage</sub> = (spread / highest<sub>bid</sub>) \* 100 if highest<sub>bid</sub> \> 0 else 0 console.print( f" \[cyan\]Ask\[/cyan\] \[red\]{lowest<sub>ask</sub>:.3f}\[/red\] to \[green\]{highest<sub>bid</sub>:.3f} \[/green\] bid" ) console.print( f" \[cyan\]Spread:\[/cyan\] \[yellow\]{spread:.3f}\[/yellow\]") market<sub>status</sub> = { 'ask': lowest<sub>ask</sub>, 'bid': highest<sub>bid</sub>, 'spread': spread } return market<sub>status</sub>

def get<sub>tradehistory</sub>(self): \# Last 3 minutes try: return self.market.market<sub>history</sub>(1, 360, 0) except Exception as e: console.print( f"\[red\]Error retrieving trade history: {str(e)}\[/red\]") return None

def calculate<sub>vwap</sub>(self): trades = self.get<sub>tradehistory</sub>() if not trades: return None

if float(hive<sub>data</sub>\['close'\]) \> 0: price = float(non<sub>hive</sub>\['close'\]) / float( hive<sub>data</sub>\['close'\]) hive<sub>volume</sub> = float(hive<sub>data</sub>\['volume'\]) rows.append({'price': price, 'hive<sub>volume</sub>': hive<sub>volume</sub>})

if not df.empty: vwap = (df\['price'\] \* df\['hive<sub>volume</sub>'\]).sum() / df\['hive<sub>volume</sub>'\].sum() return vwap

def \_<sub>init</sub>\_<sub>(self, order<sub>analyzer</sub>, trade<sub>analyzer</sub>, wallet<sub>analyzer</sub>)</sub>: self.order<sub>analyzer</sub> = order<sub>analyzer</sub> self.trade<sub>analyzer</sub> = trade<sub>analyzer</sub> self.wallet<sub>analyzer</sub> = wallet<sub>analyzer</sub>

def find<sub>opportunity</sub>(self): market<sub>status</sub> = self.order<sub>analyzer</sub>.analyze<sub>orderbook</sub>() if not market<sub>status</sub>: return None

if market<sub>status</sub>\['ask'\] \<= vwap: if vwap<sub>spread</sub> \<= 0.000: spread = market<sub>status</sub>\['ask'\] - market<sub>status</sub>\['bid'\] if spread \> 0.000: console.print( f"Spread of {market<sub>status</sub>\['spread'\]:.3f} is beyond precision tolerance…" ) buy<sub>price</sub> = market<sub>status</sub>\['ask'\] sell<sub>price</sub> = (buy<sub>price</sub> + 0.001) min<sub>tradehive</sub> = 0.001 / (sell<sub>price</sub> - buy<sub>price</sub>) balances = self.wallet<sub>analyzer</sub>.get<sub>balances</sub>() required<sub>hbd</sub> = min<sub>tradehive</sub> \* buy<sub>price</sub> if balances\['HIVE'\] \>= min<sub>tradehive</sub> and balances\['HBD'\] \>= required<sub>hbd</sub>: console.print( f"Minimum trade size of {min<sub>tradehive</sub>:.3f} HIVE and {required<sub>hbd</sub>:.3f} HBD is liquid in wallet…" ) console.print( f"OPPORTUNITY FOUND: Buy {min<sub>tradehive</sub>:.3f} at {buy<sub>price</sub>:.3f}, sell at {sell<sub>price</sub>:.3f}" ) return { 'buy': buy<sub>price</sub>, 'sell': sell<sub>price</sub>, 'volume': min<sub>tradehive</sub> } else: console.print( f"Insufficient funds. Need {min<sub>tradehive</sub>:.3f} HIVE and {required<sub>hbd</sub>:.3f} HBD, have {balances\['HIVE'\]:.3f} HIVE and {balances\['HBD'\]:.3f} HBD" ) else: console.print( f"Market spread of {spread} too narrow for precision tolerance. NO OPPORTUNITY." ) else: console.print( " \[yellow\]3mVWAP spread\[/yellow\] \<= \[yellow\]0.001\[/yellow\]" ) else: console.print( " \[yellow\]3mVWAP\[/yellow\] \<= \[red\]Ask\[/red\]") return None

def \_<sub>init</sub>\_<sub>(self, account)</sub>: self.account = account

def get<sub>balances</sub>(self): try: balances = { 'HIVE': float(self.account.get<sub>balance</sub>('available', 'HIVE')), 'HBD': float(self.account.get<sub>balance</sub>('available', 'HBD')) } return balances except Exception as e: console.print(f"\[red\]Error retrieving balances: {str(e)}\[/red\]") return None

def \_<sub>init</sub>\_<sub>(self, active<sub>key</sub>, account<sub>name</sub>, dryfire, cleanup<sub>mode</sub>)</sub>: self.logger = setup<sub>logger</sub>() self.dryfire = dryfire self.cleanup<sub>mode</sub> = cleanup<sub>mode</sub> nodes = \[ "<https://api.hive.blog>", "<https://api.hivekings.com>", "<https://anyx.io>", "<https://api.openhive.network>" \] self.hive<sub>instance</sub> = Hive(nodes=nodes, keys=\[active<sub>key</sub>\]) self.account = Account(account<sub>name</sub>, blockchain<sub>instance</sub>=self.hive<sub>instance</sub>)

def cleanup(self): """Cancel all open orders and perform cleanup""" try: if self.cleanup<sub>mode</sub> == 'all' and not self.dryfire: console.print("\[yellow\]Cancelling all open orders…\[/yellow\]") self.order<sub>analyzer</sub>.market.cancel<sub>all</sub>(account=self.account) console.print("\[green\]All orders cancelled\[/green\]") else: console.print("\[yellow\]Cleanup skipped - dryfire mode or cleanup not enabled\[/yellow\]") except Exception as e: console.print(f"\[red\]Error during cleanup: {str(e)}\[/red\]")

def run(self, cycle<sub>speed</sub>): print("Beginning trade cycle") if self.dryfire: print("Dryfire mode enabled. No trades will be executed.") else: print("LIVE TRADING MODE!!! REAL FUNDS WILL BE USED!!!") try: while True: try: console.print( "Trade cycle beginning…\[/bold cyan\]") opportunity = self.opportunity<sub>analyzer</sub>.find<sub>opportunity</sub>() if opportunity: if not self.dryfire:

current<sub>balance</sub> = self.wallet<sub>handler</sub>.get<sub>balances</sub>() if current<sub>balance</sub> and current<sub>balance</sub>\['HIVE'\] \>= opportunity\['volume'\]: console.print( f"\[bold cyan\]Cycle ending:\[/bold cyan\] \[cyan\]Placing order pair:\[/cyan\] \[yellow\]{opportunity\['volume'\]:.3f} HIVE\[/yellow\] at \[red\]{opportunity\['buy'\]:.3f}\[/red\]\|\[green\]{opportunity\['sell'\]:.3f}\[/green\]" ) self.order<sub>analyzer</sub>.market.buy(opportunity\['buy'\], opportunity\['volume'\], account=self.account) self.order<sub>analyzer</sub>.market.sell(opportunity\['sell'\], opportunity\['volume'\], account=self.account) else: console.print("\[red\]Insufficient balance to execute trade\[/red\]") else: console.print("Dryfire mode enabled. Moving on.") else: console.print( "\[bold cyan\]Cycle ending:\[/bold cyan\] \[cyan\]No move\[/cyan\]" ) console.print( f"\[cyan\]Sleeping\[/cyan\] \[yellow\]{cycle<sub>speed</sub>}s\[/yellow\]") time.sleep(cycle<sub>speed</sub>) except KeyboardInterrupt: raise except Exception as e: console.print(f"\[red\]Error in trading loop: {str(e)}\[/red\]") raise finally: console.print("Shutting down…\[/yellow\]") self.cleanup()

def main(): parser = argparse.ArgumentParser(description="Hive Trading Bot") parser.add<sub>argument</sub>( "–dryfire", type=str, default="true", help= "Run in dryfire mode (default: true). Must set –dryfire=false and –live=true to execute trades." ) parser.add<sub>argument</sub>( "–live", type=str, default="false", help="Explicitly confirm live trading mode (default: false).") parser.add<sub>argument</sub>("–account", type=str, help="Hive account name for the bot to use.") parser.add<sub>argument</sub>("–key", type=str, help="Active key for the Hive account.") parser.add<sub>argument</sub>("–cleanup", type=str, default="none", help="Cleanup mode on shutdown: 'none' or 'all' (default: none)") args = parser.parse<sub>args</sub>()

if not account<sub>name</sub> or not active<sub>key</sub>: console.print( "\[red\]Error: Hive account name and active key are required. Provide them using –account and –key arguments or set HIVE<sub>ACCOUNT</sub> and HIVE<sub>ACTIVEKEY</sub> as environment variables.\[/red\]" ) return

if <u><u>name</u></u> == "<u><u>main</u></u>": main() \`\`\` \## 0.0.2

\`\`\`python

CYCLE<sub>SPEED</sub> = 15 console = Console()

def setup<sub>logger</sub>() -\> logging.Logger: logging.basicConfig( level=logging.INFO, format='%(asctime)s - %(message)s', datefmt='%H:%M:%S' ) return logging.getLogger('bot')

def analyze<sub>orderbook</sub>(orderbook: Optional\[Dict\]) -\> Optional\[Dict\]: if not orderbook or 'asks' not in orderbook or 'bids' not in orderbook: return None

lowest<sub>ask</sub> = float(orderbook\['asks'\]\[0\]\['price'\]) highest<sub>bid</sub> = float(orderbook\['bids'\]\[0\]\['price'\]) spread = lowest<sub>ask</sub> - highest<sub>bid</sub>

console.print(f" \[cyan\]Ask\[/cyan\] \[red\]{lowest<sub>ask</sub>:.3f}\[/red\] to \[green\]{highest<sub>bid</sub>:.3f} \[/green\] bid") console.print(f" \[cyan\]Spread:\[/cyan\] \[yellow\]{spread:.3f}\[/yellow\]")

return {'ask': lowest<sub>ask</sub>, 'bid': highest<sub>bid</sub>, 'spread': spread}

def get<sub>tradehistory</sub>(market: Market) -\> Optional\[List\]: try: return market.market<sub>history</sub>(1, 360, 0) except Exception as e: console.print(f"\[red\]Error retrieving trade history: {str(e)}\[/red\]") return None

def process<sub>trade</sub>(trade: Dict) -\> Optional\[Dict\]: if 'hive' not in trade or 'non<sub>hive</sub>' not in trade: return None

hive<sub>data</sub> = trade\['hive'\] non<sub>hive</sub> = trade\['non<sub>hive</sub>'\]

if float(hive<sub>data</sub>\['close'\]) \<= 0: return None

return { 'price': float(non<sub>hive</sub>\['close'\]) / float(hive<sub>data</sub>\['close'\]), 'hive<sub>volume</sub>': float(hive<sub>data</sub>\['volume'\]) }

def calculate<sub>vwap</sub>(trades: Optional\[List\]) -\> Optional\[float\]: if not trades: console.print("\[yellow\]No trades in the last 3 minutes.\[/yellow\]") return None

processed<sub>trades</sub> = list(filter(None, map(process<sub>trade</sub>, trades))) if not processed<sub>trades</sub>: return None

def get<sub>balances</sub>(account: Account) -\> Optional\[Dict\]: try: return { 'HIVE': float(account.get<sub>balance</sub>('available', 'HIVE')), 'HBD': float(account.get<sub>balance</sub>('available', 'HBD')) } except Exception as e: console.print(f"\[red\]Error retrieving balances: {str(e)}\[/red\]") return None

def analyze<sub>opportunity</sub>( market<sub>status</sub>: Optional\[Dict\], vwap: Optional\[float\], balances: Optional\[Dict\] ) -\> Optional\[Dict\]: if not all(\[market<sub>status</sub>, vwap, balances\]): return None

vwap<sub>spread</sub> = market<sub>status</sub>\['ask'\] - vwap console.print(f" \[cyan\]3mVWAP\[/cyan\] \[yellow\]{vwap:.3f}\[/yellow\] to \[red\]{market<sub>status</sub>\['ask'\]:.3f}\[/red\] \[cyan\]ask\[/cyan\]") console.print(f" \[cyan\]Spread:\[/cyan\] \[yellow\] {vwap<sub>spread</sub>:.3f}\[/yellow\]")

if not (market<sub>status</sub>\['ask'\] \<= vwap and vwap<sub>spread</sub> \<= 0.000): return None

buy<sub>price</sub> = market<sub>status</sub>\['ask'\] sell<sub>price</sub> = buy<sub>price</sub> + 0.001 min<sub>tradehive</sub> = 0.001 / (sell<sub>price</sub> - buy<sub>price</sub>) required<sub>hbd</sub> = min<sub>tradehive</sub> \* buy<sub>price</sub>

if balances\['HIVE'\] \< min<sub>tradehive</sub> or balances\['HBD'\] \< required<sub>hbd</sub>: console.print(f"Insufficient funds. Need {min<sub>tradehive</sub>:.3f} HIVE and {required<sub>hbd</sub>:.3f} HBD") return None

return {'buy': buy<sub>price</sub>, 'sell': sell<sub>price</sub>, 'volume': min<sub>tradehive</sub>}

def execute<sub>trade</sub>(market: Market, opportunity: Dict, account: Account) -\> None: market.buy(opportunity\['buy'\], opportunity\['volume'\], account=account) market.sell(opportunity\['sell'\], opportunity\['volume'\], account=account) console.print(f"\[bold cyan\]Orders placed:\[/bold cyan\] \[yellow\]{opportunity\['volume'\]:.3f} HIVE\[/yellow\]")

def cleanup(market: Market, account: Account, cleanup<sub>mode</sub>: str, dryfire: bool) -\> None: try: if cleanup<sub>mode</sub> == 'all' and not dryfire: console.print("\[yellow\]Cancelling all open orders…\[/yellow\]") market.cancel<sub>all</sub>(account=account) console.print("\[green\]All orders cancelled\[/green\]") except Exception as e: console.print(f"\[red\]Error during cleanup: {str(e)}\[/red\]")

def trade<sub>cycle</sub>( market: Market, account: Account, dryfire: bool ) -\> None: orderbook = get<sub>orderbook</sub>(market) market<sub>status</sub> = analyze<sub>orderbook</sub>(orderbook) trades = get<sub>tradehistory</sub>(market) vwap = calculate<sub>vwap</sub>(trades) balances = get<sub>balances</sub>(account)

if opportunity and not dryfire: execute<sub>trade</sub>(market, opportunity, account) elif opportunity: console.print("Dryfire mode enabled. Moving on.") else: console.print("\[bold cyan\]Cycle ending:\[/bold cyan\] \[cyan\]No move\[/cyan\]")

def create<sub>bot</sub>(active<sub>key</sub>: str, account<sub>name</sub>: str) -\> Tuple\[Market, Account\]: nodes = \[ "<https://api.hive.blog>", "<https://api.hivekings.com>", "<https://anyx.io>", "<https://api.openhive.network>" \] hive<sub>instance</sub> = Hive(nodes=nodes, keys=\[active<sub>key</sub>\]) account = Account(account<sub>name</sub>, blockchain<sub>instance</sub>=hive<sub>instance</sub>) market = Market("HIVE:HBD", blockchain<sub>instance</sub>=hive<sub>instance</sub>) return market, account

def run<sub>bot</sub>(market: Market, account: Account, dryfire: bool, cycle<sub>speed</sub>: int) -\> None: print("Beginning trade cycle") print("Dryfire mode enabled." if dryfire else "LIVE TRADING MODE!!!")

def parse<sub>args</sub>() -\> Tuple\[bool, str, Optional\[str\], Optional\[str\]\]: parser = argparse.ArgumentParser(description="Hive Trading Bot") parser.add<sub>argument</sub>("–dryfire", type=str, default="true") parser.add<sub>argument</sub>("–live", type=str, default="false") parser.add<sub>argument</sub>("–account", type=str) parser.add<sub>argument</sub>("–key", type=str) parser.add<sub>argument</sub>("–cleanup", type=str, default="none")

return dryfire, cleanup<sub>mode</sub>, account<sub>name</sub>, active<sub>key</sub>

def main(): dryfire, cleanup<sub>mode</sub>, account<sub>name</sub>, active<sub>key</sub> = parse<sub>args</sub>()

if not account<sub>name</sub> or not active<sub>key</sub>: console.print("\[red\]Error: Hive account name and active key are required.\[/red\]") return

market, account = create<sub>bot</sub>(active<sub>key</sub>, account<sub>name</sub>) try: run<sub>bot</sub>(market, account, dryfire, CYCLE<sub>SPEED</sub>) finally: cleanup(market, account, cleanup<sub>mode</sub>, dryfire)

if <u><u>name</u></u> == "<u><u>main</u></u>": main()

\## 0.0.3 \`\`\`python

\#!/usr/bin/env python3 import os import time import logging import argparse import json from datetime import datetime from typing import Dict, Any, Optional, List, Tuple, Callable from functools import partial, reduce from beem import Hive from beem.account import Account from beem.market import Market from rich.console import Console import pandas as pd import psycopg2 from psycopg2.extras import Json from decimal import Decimal

TRADE<sub>CONFIG</sub> = {

'MIN<sub>SPREAD</sub>': 0.001, \# Minimum spread between ask and bid to consider trading 'VWAP<sub>MINUTES</sub>': 5, \# Number of minutes for VWAP calculation (minimum 5) 'MAX<sub>ASKVWAPSPREAD</sub>': 0.000, \# Maximum allowable spread between ask and VWAP 'MIN<sub>TRADEAMOUNTHBD</sub>': 0.001, \# Minimum trade amount in HBD 'SELL<sub>PRICEINCREMENT</sub>': 0.001, \# How much above buy price to place sell order

'ASK<sub>DEPTH</sub>': 5, \# How many ask orders to consider 'BID<sub>DEPTH</sub>': 5, \# How many bid orders to consider

'CYCLE<sub>SPEED</sub>': 15, \# Seconds between trade cycles 'MAX<sub>ORDERS</sub>': 10 \# Maximum number of open orders allowed }

def decimal<sub>tofloat</sub>(obj): if isinstance(obj, Decimal): return float(obj) elif isinstance(obj, datetime): return obj.isoformat() elif isinstance(obj, dict): return {k: decimal<sub>tofloat</sub>(v) for k, v in obj.items()} elif isinstance(obj, list): return \[decimal<sub>tofloat</sub>(x) for x in obj\] return obj

CYCLE<sub>SPEED</sub> = TRADE<sub>CONFIG</sub>\['CYCLE<sub>SPEED</sub>'\] console = Console()

def setup<sub>logger</sub>() -\> logging.Logger: logger = logging.getLogger('bot') logger.setLevel(logging.INFO)

console<sub>handler</sub> = logging.StreamHandler() console<sub>handler</sub>.setLevel(logging.INFO) console<sub>formatter</sub> = logging.Formatter('%(message)s') console<sub>handler</sub>.setFormatter(console<sub>formatter</sub>)

file<sub>handler</sub> = logging.FileHandler('bot<sub>dev</sub>.log') file<sub>handler</sub>.setLevel(logging.DEBUG) file<sub>formatter</sub> = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s') file<sub>handler</sub>.setFormatter(file<sub>formatter</sub>)

logger.addHandler(console<sub>handler</sub>) logger.addHandler(file<sub>handler</sub>) return logger

def setup<sub>database</sub>() -\> psycopg2.extensions.connection: database<sub>url</sub> = os.environ.get('DATABASE<sub>URL</sub>') if not database<sub>url</sub>: raise ValueError("DATABASE<sub>URL</sub> environment variable not set") conn = psycopg2.connect(database<sub>url</sub>)

cur.execute(""" CREATE TABLE IF NOT EXISTS market<sub>history</sub> ( id SERIAL PRIMARY KEY, timestamp TIMESTAMP DEFAULT CURRENT<sub>TIMESTAMP</sub>, trade<sub>data</sub> JSONB ) """) cur.execute(""" CREATE TABLE IF NOT EXISTS orderbook<sub>history</sub> ( id SERIAL PRIMARY KEY, timestamp TIMESTAMP DEFAULT CURRENT<sub>TIMESTAMP</sub>, orderbook<sub>data</sub> JSONB ) """) cur.execute(""" CREATE TABLE IF NOT EXISTS account<sub>orders</sub> ( id SERIAL PRIMARY KEY, timestamp TIMESTAMP DEFAULT CURRENT<sub>TIMESTAMP</sub>, order<sub>data</sub> JSONB ) """) conn.commit() return conn

def store<sub>markethistory</sub>(conn: psycopg2.extensions.connection, trades: List\[Dict\]) -\> None: with conn.cursor() as cur: cur.execute( "INSERT INTO market<sub>history</sub> (trade<sub>data</sub>) VALUES (%s)", (Json(decimal<sub>tofloat</sub>(trades)),) ) conn.commit()

def store<sub>orderbook</sub>(conn: psycopg2.extensions.connection, orderbook: Dict) -\> None: with conn.cursor() as cur: cur.execute( "INSERT INTO orderbook<sub>history</sub> (orderbook<sub>data</sub>) VALUES (%s)", (Json(decimal<sub>tofloat</sub>(orderbook)),) ) conn.commit()

def store<sub>accountorder</sub>(conn: psycopg2.extensions.connection, order: Dict) -\> None: with conn.cursor() as cur: cur.execute( "INSERT INTO account<sub>orders</sub> (order<sub>data</sub>) VALUES (%s)", (Json(decimal<sub>tofloat</sub>(order)),) ) conn.commit()

def analyze<sub>orderbook</sub>(orderbook: Optional\[Dict\], logger: logging.Logger) -\> Optional\[Dict\]: if not orderbook or 'asks' not in orderbook or 'bids' not in orderbook: return None

logger.info(f"Market Status - Ask: {lowest<sub>ask</sub>:.3f}, Bid: {highest<sub>bid</sub>:.3f}, Spread: {spread:.3f}")

def get<sub>tradehistory</sub>(market: Market, logger: logging.Logger) -\> Optional\[List\]: try: trades = market.market<sub>history</sub>(1, TRADE<sub>CONFIG</sub>\['VWAP<sub>MINUTES</sub>'\] \* 60, 0) logger.debug(f"Retrieved trade history: {trades}") return trades except Exception as e: logger.error(f"Error retrieving trade history: {str(e)}") return None

def calculate<sub>vwap</sub>(trades: Optional\[List\], logger: logging.Logger) -\> Optional\[float\]: if not trades: logger.info("No trades in the last 3 minutes") return None

def get<sub>balances</sub>(account: Account, logger: logging.Logger) -\> Optional\[Dict\]: try: balances = { 'HIVE': float(account.get<sub>balance</sub>('available', 'HIVE')), 'HBD': float(account.get<sub>balance</sub>('available', 'HBD')) } logger.info(f"Account Balances - HIVE: {balances\['HIVE'\]:.3f}, HBD: {balances\['HBD'\]:.3f}") return balances except Exception as e: logger.error(f"Error retrieving balances: {str(e)}") return None

def analyze<sub>opportunity</sub>( market<sub>status</sub>: Optional\[Dict\], vwap: Optional\[float\], balances: Optional\[Dict\], logger: logging.Logger ) -\> Optional\[Dict\]: if not all(\[market<sub>status</sub>, vwap, balances\]): return None

vwap<sub>spread</sub> = market<sub>status</sub>\['ask'\] - vwap logger.info(f"VWAP Analysis - Current: {vwap:.3f}, Spread to Ask: {vwap<sub>spread</sub>:.3f}")

if not (market<sub>status</sub>\['ask'\] \<= vwap and vwap<sub>spread</sub> \<= TRADE<sub>CONFIG</sub>\['MAX<sub>ASKVWAPSPREAD</sub>'\]): return None

buy<sub>price</sub> = market<sub>status</sub>\['ask'\] sell<sub>price</sub> = buy<sub>price</sub> + TRADE<sub>CONFIG</sub>\['SELL<sub>PRICEINCREMENT</sub>'\] min<sub>tradehive</sub> = TRADE<sub>CONFIG</sub>\['MIN<sub>TRADEAMOUNTHBD</sub>'\] / (sell<sub>price</sub> - buy<sub>price</sub>) required<sub>hbd</sub> = min<sub>tradehive</sub> \* buy<sub>price</sub>

if balances\['HIVE'\] \< min<sub>tradehive</sub> or balances\['HBD'\] \< required<sub>hbd</sub>: logger.info(f"Insufficient funds - Need {min<sub>tradehive</sub>:.3f} HIVE and {required<sub>hbd</sub>:.3f} HBD") return None

def execute<sub>trade</sub>( market: Market, opportunity: Dict, account: Account, logger: logging.Logger, db<sub>conn</sub>: psycopg2.extensions.connection ) -\> None: buy<sub>order</sub> = market.buy(opportunity\['buy'\], opportunity\['volume'\], account=account) sell<sub>order</sub> = market.sell(opportunity\['sell'\], opportunity\['volume'\], account=account)

logger.info(f"Orders placed - Volume: {opportunity\['volume'\]:.3f} HIVE") store<sub>accountorder</sub>(db<sub>conn</sub>, {'buy': buy<sub>order</sub>, 'sell': sell<sub>order</sub>})

def cleanup(market: Market, account: Account, cleanup<sub>mode</sub>: str, dryfire: bool, logger: logging.Logger) -\> None: try: if cleanup<sub>mode</sub> == 'all' and not dryfire: logger.info("Cancelling all open orders…") market.cancel<sub>all</sub>(account=account) logger.info("All orders cancelled") except Exception as e: logger.error(f"Error during cleanup: {str(e)}")

def trade<sub>cycle</sub>( market: Market, account: Account, dryfire: bool, logger: logging.Logger, db<sub>conn</sub>: psycopg2.extensions.connection ) -\> None: logger.info("Trade cycle beginning…")

market<sub>status</sub> = analyze<sub>orderbook</sub>(orderbook, logger)

if opportunity and not dryfire: execute<sub>trade</sub>(market, opportunity, account, logger, db<sub>conn</sub>) elif opportunity: logger.info("Dryfire mode enabled. Moving on.") else: logger.info("No trading opportunity found")

def run<sub>bot</sub>(market: Market, account: Account, dryfire: bool, cycle<sub>speed</sub>: int, logger: logging.Logger, db<sub>conn</sub>: psycopg2.extensions.connection) -\> None: logger.info("Beginning trade cycle") logger.info("Dryfire mode enabled." if dryfire else "LIVE TRADING MODE!!!")

def main(): logger = setup<sub>logger</sub>() try: db<sub>conn</sub> = setup<sub>database</sub>() except Exception as e: logger.error(f"Failed to setup database: {str(e)}") return

dryfire, cleanup<sub>mode</sub>, account<sub>name</sub>, active<sub>key</sub> = parse<sub>args</sub>()

if not account<sub>name</sub> or not active<sub>key</sub>: logger.error("Error: Hive account name and active key are required.") return

market, account = create<sub>bot</sub>(active<sub>key</sub>, account<sub>name</sub>) try: run<sub>bot</sub>(market, account, dryfire, CYCLE<sub>SPEED</sub>, logger, db<sub>conn</sub>) finally: cleanup(market, account, cleanup<sub>mode</sub>, dryfire, logger) db<sub>conn</sub>.close()
