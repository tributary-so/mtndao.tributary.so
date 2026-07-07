---
name: Pay-Per-Use SaaS
summary: Infrastructure and trading tools that charge per API call, per trade, or
  per query — no flat subscriptions, pay only for what you use.
category: "\U0001F527 Infrastructure & Tools"
status: "\U0001F4AD ideation"
protocol-version: v0
tributary_models:
- PayAsYouGo
category_slug: infrastructure-tools
---


# Pay only for what you use — no flat fees, no wasted subscriptions

# A flat $49/month trading bot loses casual users who feel ripped off — a $0.10/trade model retains them AND extracts more from power users trading 800x/month

# Core Mechanics

Tributary's PayAsYouGo model is built for this. The user approves a delegation with `max_amount_per_period` (e.g., $50/month cap) and `max_chunk_amount` (e.g., $0.05 per pull). The service pulls micro-amounts as usage occurs — $0.01 per trade executed by the bot, $0.002 per analytics query, $0.50 per successful sniper hit. Periods reset automatically. The user's exposure is always bounded by the approved cap.

This kills flat subscriptions dead. A trading bot that costs $49/month loses users who trade 3 times that month — they feel ripped off. The same bot at $0.10/trade retains those casual users _and_ extracts more revenue from power users who trade 800 times. It's a better deal for both sides.

# Psychological Hook

**Loss aversion inversion.** With flat subscriptions, every day you don't use the tool feels like a loss. With pay-per-use, every time you _do_ use it, the cost feels justified because it's tied to a specific action with specific value. The pain of payment is absorbed into the moment of value delivery.

- **Frictionless scaling**: Power users naturally spend more without upgrade friction
- **Micro-payment invisibility**: $0.01 per trade feels like nothing; it accumulates beautifully
- **Transparent value**: Users see exactly what they're paying for — no mystery line items
- **Commitment avoidance**: "I'm not subscribed, I just use it" reduces churn psychology
- **Usage gamification**: "You processed 1,247 queries this month" feels like achievement, not cost

# Brief Market Research

The global SaaS market reached $465B in 2026, with 45% of companies now adopting usage-based pricing models. Dedicated usage-based pricing platforms represent a $7.8B market growing at 16.2% CAGR.

**Current alternatives:**

- **Stripe Billing**: Traditional subscription billing with metered add-ons — not crypto-native, requires credit cards, no micro-payment efficiency
- **Gumroad/Lemon Squeezy**: Digital product sales — flat pricing, no usage tracking, no real-time pulls
- **Zuora/Recurly**: Enterprise subscription management — heavy, expensive, no crypto integration
- **Traditional SaaS**: $49-299/month flat subscriptions — misaligned incentives, churn from casual users, capped revenue from power users

**The gap**: No existing solution enables truly granular, crypto-native pay-per-use billing for developer tools and trading infrastructure. Credit card micro-transactions are economically unviable (<$0.50 minimum). Tributary's Pull Payment model solves this natively.

# Business Model

**Revenue streams:**

- Transaction fee: 0.5-2% of each pull payment
- Volume licensing: Tools built on Tributary can offer white-label pay-per-use infrastructure
- Analytics dashboard: Premium usage insights for service providers

**Unit economics:**

- 1,000 trading bot users × avg $15/month usage = $15,000/month processed
- Platform fee at 1% = $150/month from one tool
- 50 tools integrated × $150 = $7,500/month platform revenue

# Technical Specifications

## Architecture

```
User → Approves delegation (cap + chunk limit)
  ↓
Tool Provider → Monitors usage (API calls, trades, queries)
  ↓
Tributary Pull Payment → Micro-transactions pulled per usage event
  ↓
Usage Dashboard → Real-time spending visibility
  ↓
Period Reset → Cap resets, user re-evaluates
```

## How This Hooks Into Tributary

- **PayAsYouGo model**: Direct match — `max_amount_per_period` defines spending cap, `max_chunk_amount` defines per-pull limit
- **Lighthouse integration**: Optional time-locked pulls for monthly billing cycles
- **Guardian module**: Rate limiting and abuse prevention at protocol level
- **Loyalty module**: Volume discounts for power users (e.g., 1,000+ trades/month = 10% discount)

## Recommended Tech Stack

- **Frontend**: Next.js usage dashboard with real-time Solana RPC polling
- **Backend**: Rust service tracking usage events, batching pulls
- **Database**: PostgreSQL for usage logs, Redis for rate limiting
- **Solana**: Tributary program for delegation management, SPL tokens for payments
- **Monitoring**: Grafana for provider analytics, custom dashboard for user spending

## MVP Scope

1. Basic delegation creation with cap and chunk limit
2. Single tool integration (e.g., trading bot) pulling per trade
3. User dashboard showing spending history and current period usage
4. Provider dashboard showing revenue and user activity
5. Period reset mechanism

# Non-Technological Requirements

- Tool provider must implement usage tracking in their backend
- User education on pay-per-use vs. subscription economics
- Legal review for financial tool billing compliance
- Provider onboarding documentation and SDK

# Potential Risks

- **Revenue unpredictability**: Monthly revenue fluctuates with usage. Harder to forecast than flat subs.
- **Free rider detection**: Users who approve caps but rarely trigger pulls cost more in infrastructure than they generate.
- **Pull frequency abuse**: A buggy integration could pull too aggressively. Rate limiting must exist outside the protocol.
- **Competitive race to zero**: If every tool goes pay-per-use, margins compress. Differentiation becomes critical.
- **User cap anxiety**: Some users will constantly check "how much have I spent this period?" — dashboards must be excellent.
