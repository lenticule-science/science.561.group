---
title: 0.0.1
description: "def init(self, market): self.market = market"
aliases:
  - Hive Investment Bot
---
# 0.0.1

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


# Main entry point
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
## 0.0.2

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
	
	def get_balances(account: Account) -> Optional[Dict]:
	    try:
	        return {
	            'HIVE': float(account.get_balance('available', 'HIVE')),
	            'HBD': float(account.get_balance('available', 'HBD'))
	        }
	    except Exception as e:
	        console.print(f"[red]Error retrieving balances: {str(e)}[/red]")
	        return None
	
	def analyze_opportunity(
	    market_status: Optional[Dict],
	    vwap: Optional[float],
	    balances: Optional[Dict]
	) -> Optional[Dict]:
	    if not all([market_status, vwap, balances]):
	        return None
	
	    vwap_spread = market_status['ask'] - vwap
	    console.print(f"  [cyan]3mVWAP[/cyan] [yellow]{vwap:.3f}[/yellow]  to  [red]{market_status['ask']:.3f}[/red] [cyan]ask[/cyan]")
	    console.print(f"      [cyan]Spread:[/cyan] [yellow] {vwap_spread:.3f}[/yellow]")
	
	    if not (market_status['ask'] <= vwap and vwap_spread <= 0.000):
	        return None
	
	    spread = market_status['ask'] - market_status['bid']
	    if spread <= 0.000:
	        return None
	
	    buy_price = market_status['ask']
	    sell_price = buy_price + 0.001
	    min_trade_hive = 0.001 / (sell_price - buy_price)
	    required_hbd = min_trade_hive * buy_price
	
	    if balances['HIVE'] < min_trade_hive or balances['HBD'] < required_hbd:
	        console.print(f"Insufficient funds. Need {min_trade_hive:.3f} HIVE and {required_hbd:.3f} HBD")
	        return None
	
	    return {'buy': buy_price, 'sell': sell_price, 'volume': min_trade_hive}
	
	def execute_trade(market: Market, opportunity: Dict, account: Account) -> None:
	    market.buy(opportunity['buy'], opportunity['volume'], account=account)
	    market.sell(opportunity['sell'], opportunity['volume'], account=account)
	    console.print(f"[bold cyan]Orders placed:[/bold cyan] [yellow]{opportunity['volume']:.3f} HIVE[/yellow]")
	
	def cleanup(market: Market, account: Account, cleanup_mode: str, dryfire: bool) -> None:
	    try:
	        if cleanup_mode == 'all' and not dryfire:
	            console.print("[yellow]Cancelling all open orders...[/yellow]")
	            market.cancel_all(account=account)
	            console.print("[green]All orders cancelled[/green]")
	    except Exception as e:
	        console.print(f"[red]Error during cleanup: {str(e)}[/red]")
	
	def trade_cycle(
	    market: Market,
	    account: Account,
	    dryfire: bool
	) -> None:
	    orderbook = get_orderbook(market)
	    market_status = analyze_orderbook(orderbook)
	    trades = get_trade_history(market)
	    vwap = calculate_vwap(trades)
	    balances = get_balances(account)
	    
	    opportunity = analyze_opportunity(market_status, vwap, balances)
	    
	    if opportunity and not dryfire:
	        execute_trade(market, opportunity, account)
	    elif opportunity:
	        console.print("Dryfire mode enabled. Moving on.")
	    else:
	        console.print("[bold cyan]Cycle ending:[/bold cyan] [cyan]No move[/cyan]")
	
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
	
	def run_bot(market: Market, account: Account, dryfire: bool, cycle_speed: int) -> None:
	    print("Beginning trade cycle")
	    print("Dryfire mode enabled." if dryfire else "LIVE TRADING MODE!!!")
	    
	    try:
	        while True:
	            console.print("\n[bold cyan]Trade cycle beginning...[/bold cyan]")
	            trade_cycle(market, account, dryfire)
	            time.sleep(cycle_speed)
	    except KeyboardInterrupt:
	        console.print("\n[yellow]Shutting down...[/yellow]")
	
	def parse_args() -> Tuple[bool, str, Optional[str], Optional[str]]:
	    parser = argparse.ArgumentParser(description="Hive Trading Bot")
	    parser.add_argument("--dryfire", type=str, default="true")
	    parser.add_argument("--live", type=str, default="false")
	    parser.add_argument("--account", type=str)
	    parser.add_argument("--key", type=str)
	    parser.add_argument("--cleanup", type=str, default="none")
	    
	    args = parser.parse_args()
	    dryfire = not (args.dryfire.lower() == "false" and args.live.lower() == "true")
	    cleanup_mode = args.cleanup.lower()
	    account_name = args.account or os.environ.get('HIVE_ACCOUNT')
	    active_key = args.key or os.environ.get('HIVE_ACTIVE_KEY')
	    
	    return dryfire, cleanup_mode, account_name, active_key
	
	def main():
	    dryfire, cleanup_mode, account_name, active_key = parse_args()
	    
	    if not account_name or not active_key:
	        console.print("[red]Error: Hive account name and active key are required.[/red]")
	        return
	        
	    market, account = create_bot(active_key, account_name)
	    try:
	        run_bot(market, account, dryfire, CYCLE_SPEED)
	    finally:
	        cleanup(market, account, cleanup_mode, dryfire)
	
	if __name__ == "__main__":
	    main()

```

## 0.0.3
```python

#!/usr/bin/env python3
import os
import time
import logging
import argparse
import json
from datetime import datetime
from typing import Dict, Any, Optional, List, Tuple, Callable
from functools import partial, reduce
from beem import Hive
from beem.account import Account
from beem.market import Market
from rich.console import Console
import pandas as pd
import psycopg2
from psycopg2.extras import Json
from decimal import Decimal

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
    
    lowest_ask = float(orderbook['asks'][0]['price'])
    highest_bid = float(orderbook['bids'][0]['price'])
    spread = lowest_ask - highest_bid
    
    logger.info(f"Market Status - Ask: {lowest_ask:.3f}, Bid: {highest_bid:.3f}, Spread: {spread:.3f}")
    
    return {'ask': lowest_ask, 'bid': highest_bid, 'spread': spread}

def get_trade_history(market: Market, logger: logging.Logger) -> Optional[List]:
    try:
        trades = market.market_history(1, TRADE_CONFIG['VWAP_MINUTES'] * 60, 0)
        logger.debug(f"Retrieved trade history: {trades}")
        return trades
    except Exception as e:
        logger.error(f"Error retrieving trade history: {str(e)}")
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

def calculate_vwap(trades: Optional[List], logger: logging.Logger) -> Optional[float]:
    if not trades:
        logger.info("No trades in the last 3 minutes")
        return None
        
    processed_trades = list(filter(None, map(process_trade, trades)))
    if not processed_trades:
        return None
        
    df = pd.DataFrame(processed_trades)
    vwap = (df['price'] * df['hive_volume']).sum() / df['hive_volume'].sum()
    logger.info(f"Calculated VWAP: {vwap:.3f}")
    return vwap

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

    vwap_spread = market_status['ask'] - vwap
    logger.info(f"VWAP Analysis - Current: {vwap:.3f}, Spread to Ask: {vwap_spread:.3f}")

    if not (market_status['ask'] <= vwap and vwap_spread <= TRADE_CONFIG['MAX_ASK_VWAP_SPREAD']):
        return None

    spread = market_status['ask'] - market_status['bid']
    if spread <= TRADE_CONFIG['MIN_SPREAD']:
        return None

    buy_price = market_status['ask']
    sell_price = buy_price + TRADE_CONFIG['SELL_PRICE_INCREMENT']
    min_trade_hive = TRADE_CONFIG['MIN_TRADE_AMOUNT_HBD'] / (sell_price - buy_price)
    required_hbd = min_trade_hive * buy_price

    if balances['HIVE'] < min_trade_hive or balances['HBD'] < required_hbd:
        logger.info(f"Insufficient funds - Need {min_trade_hive:.3f} HIVE and {required_hbd:.3f} HBD")
        return None

    return {'buy': buy_price, 'sell': sell_price, 'volume': min_trade_hive}

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

def trade_cycle(
    market: Market,
    account: Account,
    dryfire: bool,
    logger: logging.Logger,
    db_conn: psycopg2.extensions.connection
) -> None:
    logger.info("Trade cycle beginning...")
    
    orderbook = get_orderbook(market, logger)
    if orderbook:
        store_orderbook(db_conn, orderbook)
    
    market_status = analyze_orderbook(orderbook, logger)
    
    trades = get_trade_history(market, logger)
    if trades:
        store_market_history(db_conn, trades)
    
    vwap = calculate_vwap(trades, logger)
    balances = get_balances(account, logger)
    
    opportunity = analyze_opportunity(market_status, vwap, balances, logger)
    
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
    
    try:
        while True:
            trade_cycle(market, account, dryfire, logger, db_conn)
            time.sleep(cycle_speed)
    except KeyboardInterrupt:
        logger.info("Shutting down...")

def parse_args() -> Tuple[bool, str, Optional[str], Optional[str]]:
    parser = argparse.ArgumentParser(description="Hive Trading Bot")
    parser.add_argument("--dryfire", type=str, default="true")
    parser.add_argument("--live", type=str, default="false")
    parser.add_argument("--account", type=str)
    parser.add_argument("--key", type=str)
    parser.add_argument("--cleanup", type=str, default="none")
    
    args = parser.parse_args()
    dryfire = not (args.dryfire.lower() == "false" and args.live.lower() == "true")
    cleanup_mode = args.cleanup.lower()
    account_name = args.account or os.environ.get('HIVE_ACCOUNT')
    active_key = args.key or os.environ.get('HIVE_ACTIVE_KEY')
    
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

if __name__ == "__main__":
    main()

```
