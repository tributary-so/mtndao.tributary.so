---
name: Auto-DCA (Non-Custodial)
summary: Dollar-cost averaging from your own wallet, across any protocol, on your
  schedule — no custodian, no exchange, no per-buy signature.
category: "\U0001F4B0 DeFi & Trading"
status: "\U0001F50D research"
protocol-version: v0
tributary_models:
- PayAsYouGo
- Subscription
category_slug: defi-trading
---


# DCA That Actually Runs From Your Wallet

Non-custodial, multi-protocol, schedule-driven dollar-cost averaging running from the wallet you already use. No exchange custody. No per-buy signature. The trust-builder that onboards users to automated DeFi.

# Pitch of the Core Idea

DCA is the most rational investment strategy and the most proven on-ramp in crypto. Everyone knows they should. Almost nobody does it well. The options today all force a tradeoff: custodial exchange DCA (your keys aren't yours), single-protocol DCA (locked to one venue), or manual (you'll forget). The crypto DCA app market is valued at $2.8B in 2025, growing to $10.6B by 2034 at 15.9% CAGR. Coinbase has 110M+ users. Swan Bitcoin surpassed $1B in accumulated BTC. Yet every solution requires giving up custody or staying locked to one venue.

This is the **trust-builder** for the entire Tributary ladder. It's not venture-scale on its own — it's the cleanest possible way to get a user to say yes to "let the system route your capital into DeFi" for the first time. The magical moment is the first week they check their wallet and find SOL there that they didn't manually buy — bought at a moment they didn't pick, through a venue they didn't have to trust with their keys.

# Core Mechanics

1. **User configures three things**: pull cap ("up to $100/week"), target asset ("SOL"), schedule ("weekly")
2. **Delegates pull authority** to Tributary once
3. **At scheduled moment**:
   - Tributary pulls up to the cap of the funding asset from their wallet
   - Routes through whitelisted DEX programs (Jupiter, Meteora, Raydium) via CPI
   - Target asset lands in user's own wallet — non-custodial end to end

The whole flow: `WHEN (schedule) → PULL (cap) → ROUTE (to DEX) → LAND (user wallet)`. No per-buy signature. Built on `ComposablePolicy`, `ForwardConfig`, and `ALLOWED_FORWARD_PROGRAMS` allowlist.

# Psychological Hook and Addictiveness

**Set-and-forget is permanent** — once configured, the cognitive overhead of "did I DCA this week?" drops to zero. Users have been trained to choose between custody and convenience. This removes the choice.

**Multi-protocol routing** — system picks the best venue each time, better execution than single-protocol tools. **Habit, not feature** — weekly DCA becomes a financial ritual. **On-ramp to everything** — DCA users are pre-qualified for Idle Capital Deployment and Policy-Based Allocation. They've already crossed the "let the system route my capital" threshold.

# Brief Market Research

| Metric               | Data                    |
| -------------------- | ----------------------- |
| Market Size (2025)   | $2.8B (crypto DCA apps) |
| Market Size (2034)   | $10.6B                  |
| CAGR                 | 15.9%                   |
| Coinbase Users       | 110M+ verified          |
| Swan BTC Accumulated | $1B+                    |
| Bitpanda Users       | 4M+                     |

**Key Competitors**:

- **Coinbase** (110M users): Recurring buy feature, 1.5-4% fees, custodial, no auto-withdrawal
- **Swan Bitcoin** (US-only): 0.99% fee, Bitcoin-only, auto-withdrawal to hardware wallet, IRA support
- **River Financial**: Zero-fee DCA (spread only), Bitcoin-only, Lightning support
- **Strike**: ~0.3% spread, Lightning-native, global, but no advanced DCA tooling
- **Bitpanda** (4M users): European leader, 400+ assets, multi-asset DCA

**None are non-custodial multi-protocol.** Every solution requires either exchange custody or single-protocol lock-in.

# Business Model

- **Gateway fee**: 0.5-1% on each DCA execution routed through Tributary
- **Protocol fee**: Revenue share on Tributary's pull mechanism
- **Premium routing**: Higher tiers get priority routing, better slippage optimization
- **Yield on idle**: User's stablecoins earn yield while waiting for DCA schedule (Kamino integration)
- **Data insights**: Anonymized DCA pattern data sold to institutions (opt-in)

# Summary of Technical Specifications

## Architecture

- Scheduler service (cron-like, triggers on user-defined intervals)
- Tributary policy engine with ComposablePolicy per user
- DEX aggregation layer (Jupiter V6 as primary router)
- Price feed oracles (Pyth) for TWAP reporting
- User wallet connection (Phantom, Solflare)

## How This Hooks Into Tributary

- **PayAsYouGo**: Pulls funding asset up to cap per DCA cycle
- **Subscription**: Optional — recurring DCA budgets with monthly caps
- **ComposablePolicy**: Defines allowed routes, slippage limits, target assets
- **Forward**: CPI to Jupiter/Meteora/Raydium for execution

## Recommended Tech Stack

- Solana + Anchor
- Tributary SDK for pull streams
- Jupiter V6 API for DEX aggregation
- Pyth oracle for price feeds
- React + Phantom wallet adapter
- Cron service for scheduling

## MVP Scope

- Single-asset DCA (SOL purchase from USDC)
- Weekly schedule, user-defined cap
- Jupiter routing, non-custodial execution
- Basic dashboard showing DCA history and cost basis
- Buildable in 2 days with Tributary SDK + Jupiter API

# Non-Technological Requirements

- **Smart contract auditing**: DCA involves pulling user funds — security is paramount
- **Exchange integration partnerships**: Jupiter, Meteora coordination for routing
- **Regulatory awareness**: DCA from wallet may trigger different regulations than exchange-based DCA
- **User education**: "Non-custodial" is a feature but requires explaining self-custody risks
- **Tax reporting integration**: Each DCA buy is a taxable event — need Koinly/CoinTracker integration

# Potential Risks

- **Crowded category** — Jupiter ships scheduled DCA natively. Tributary's wedge is non-custodial + multi-protocol + gateway to the rest of the ladder
- **Fee economics** — per-swap fees on small DCAs can eat the position. Output-based fees and batching required
- **Not venture-scale solo** — DCA is a feature that earns trust; it is not the business
- **Market timing complaints** — users will blame the schedule for buying at local highs. Transparent TWAP reporting is the only defense
