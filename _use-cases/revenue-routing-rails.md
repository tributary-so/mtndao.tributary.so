---
name: Revenue Routing Rails
summary: Programmable payment splitting infrastructure — every incoming dollar routes
  itself to the right destination instantly, no manual accounting.
category: "\U0001F527 Infrastructure & Tools"
status: "\U0001F4AD ideation"
protocol-version: v0
tributary_models:
- PayAsYouGo
- Subscription
category_slug: infrastructure-tools
---


# Programmable payment splitting infrastructure — every incoming dollar routes itself

# Every creator, agency, DAO, and protocol wastes hours manually splitting revenue. This is infrastructure that should not exist.

# Core Mechanics

A user or organization defines revenue split rules. When funds arrive, Tributary's pull primitive executes the split automatically:

- **Creator revenue**: 1,000 USDC arrives from content sales → 10% manager, 10% editor, 5% accountant, 75% creator. Instant. No manual accounting.
- **DAO income**: Protocol fees flow in → contributor payments, treasury allocation, grants fund, reserve replenishment. All on schedule.
- **Agency billing**: Client pays $50K → automatically splits across team leads, subcontractors, tools, overhead, and profit distribution.
- **AI app revenue**: Every payment splits among model provider, frontend, data provider, and affiliate in real-time.

The routing is composable: splits can trigger further splits. A creator's 75% share can itself auto-route to taxes (20%), savings (10%), and spending (70%). Revenue becomes a waterfall of automated allocation.

The key insight: **you are monetizing flow**. Every dollar that passes through the routing layer generates a fee. The more splits, the more flow, the more revenue. Network effects compound as more participants join — a creator who uses the rails attracts collaborators who also use the rails.

# Psychological Hook

**"Money that knows where to go."** The relief of never manually splitting a payment again is profound. Bookkeeping becomes auditing, not data entry. The system doesn't just save time — it eliminates an entire category of financial anxiety.

- **Instant settlement**: Collaborators see their share arrive the moment revenue lands. No waiting for monthly reconciliation
- **Transparent accounting**: Every split is on-chain, verifiable, auditable. Trust is structural, not social
- **Revenue velocity**: Dashboards showing real-time income streams, split percentages, and distribution history
- **Composable splits**: "My 30% automatically goes to my own split rules" creates recursive routing that users love configuring
- **Network effects**: The more people who use the rails, the more valuable joining becomes

# Brief Market Research

Payment splitting is a proven model — Stripe Connect, PayPal Payouts, and traditional royalty systems exist — but none are crypto-native or composable.

**Current alternatives:**

- **Stripe Connect**: Payment splitting for marketplaces — fiat-only, high fees (2.9% + $0.30), no crypto integration
- **PayPal Payouts**: Bulk payments — fiat-only, limited customization, no composable routing
- **Request Finance**: Crypto invoicing — focuses on invoicing, not automated splitting
- **Request Network**: Decentralized payments — no built-in revenue routing
- **Superfluid**: Streaming payments — continuous flow, not split-based routing
- **Sablier**: Payment streaming — linear streaming, not composable splits

**The gap**: Every existing solution is either fiat-based (Stripe, PayPal) or single-stream (Superfluid, Sablier). None enable composable, multi-destination revenue routing with on-chain verification. Tributary's Pull Payment model with composable policies solves this natively.

# Business Model

**Revenue streams:**

- Transaction fee: 0.5-1% of each routed payment
- Premium routing: Advanced features (conditional splits, time-based routing) at $50-200/month
- API access: Developer access to routing infrastructure at $100-1,000/month
- Enterprise licensing: Custom routing solutions for large organizations

**Unit economics:**

- 1,000 businesses × $100/month premium = $100,000/month
- $10M monthly volume processed × 0.75% fee = $75,000/month
- 100 enterprise clients × $500/month = $50,000/month
- Total: ~$225,000/month at scale

# Technical Specifications

## Architecture

```
Revenue Source → Payment arrives (USDC, SOL, etc.)
  ↓
Routing Engine → Evaluates split rules (percentage, amount, condition)
  ↓
Tributary Pull → Executes splits automatically
  ↓
Multi-Wallet Delivery → Each recipient receives their share
  ↓
Audit Trail → Every split recorded on-chain
  ↓
Dashboard → Real-time revenue flow visualization
```

## How This Hooks Into Tributary

- **PayAsYouGo + Subscription**: Routing fees charged per transaction or monthly subscription
- **Lighthouse integration**: Validation of split rules, balance checks before execution
- **Guardian module**: Rate limiting, fraud detection, abuse prevention
- **Loyalty module**: Volume discounts for high-throughput users, loyalty rewards for consistent routing

## Recommended Tech Stack

- **Frontend**: Next.js routing dashboard with visual rule builder
- **Backend**: Rust routing engine, Redis for rule caching, PostgreSQL for configuration storage
- **Database**: PostgreSQL for user/routing data, Redis for real-time balance tracking
- **Solana**: Tributary program for split execution, SPL tokens for multi-destination routing
- **Analytics**: Custom dashboard for revenue flow visualization and audit trails

## MVP Scope

1. Basic split rules (percentage-based, fixed amounts)
2. Single-level routing (no composable splits yet)
3. Real-time execution and audit trail
4. Simple dashboard for rule management
5. Basic analytics for revenue flow

# Non-Technological Requirements

- Legal review for payment splitting regulations (money transmission?)
- Business onboarding documentation
- Tax implications education (split recipients may have different tax obligations)
- Dispute resolution framework for split disagreements
- Integration documentation for existing payment systems

# Potential Risks

- **Split rule complexity**: Multi-level splits with conditions, caps, and time-based changes create a configuration nightmare
- **Gas cost at scale**: Splitting every incoming payment across 10+ wallets generates transaction costs that eat into margins
- **Regulatory classification**: Revenue splitting may trigger money transmission regulations in some jurisdictions
- **Dispute resolution**: When someone believes they received the wrong split percentage, resolution requires off-chain coordination
- **Dependency**: Once a team relies on automated splitting, any failure creates immediate cascading payment delays
