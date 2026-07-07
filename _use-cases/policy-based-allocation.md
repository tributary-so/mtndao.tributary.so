---
name: Policy-Based Capital Allocation
summary: Stop specifying transactions. Specify rules. Stop-losses, rebalancing, concentration
  caps, drawdown limits — the system executes within your constraints, validated on-chain.
category: "\U0001F4B0 DeFi & Trading"
status: "\U0001F50D research"
protocol-version: v0
tributary_models:
- PayAsYouGo
- Subscription
- Milestone
category_slug: defi-trading
---


# Stop specifying transactions. Specify rules. The system executes within your constraints.

# "If drawdown exceeds 15%, move to USDC" — the system watches conditions and acts when they fire, validated on-chain

# Core Mechanics

The user defines policies — declarative constraints on their capital — and delegates execution authority within them. The system watches conditions and acts when they fire:

- **Risk policies**: "Stop-loss at -10% on this position." "If drawdown exceeds 15%, move to USDC." "Never allocate more than 20% to any single LP."
- **Allocation policies**: "Rebalance to target allocation monthly." "Keep $2,000 liquid, deploy everything above."
- **Concentration policies**: "Cap any single protocol exposure at 30%." "Enforce a 40% stablecoin ratio."

What makes this safe enough to run unattended is that **every execution is gated by validation CPI**. Lighthouse assertions, oracle checks, and balance validators fire before any pull — the system doesn't trust its own read of the world, it trusts a signed, verifiable claim. A stop-loss only triggers when an oracle attests the price has actually moved. A rebalance only fires when a balance validator confirms the drift.

### Three sub-markets, one engine

| Sub-market                     | Who                                | Why they pay                                    | Existing analog                                |
| ------------------------------ | ---------------------------------- | ----------------------------------------------- | ---------------------------------------------- |
| **Personal wealth automation** | Retail crypto holders              | Idle capital + risk management                  | Wealthfront / Betterment (TradFi robo-advisor) |
| **Startup treasury**           | Crypto-native startups             | Founders don't want to manage DeFi              | Brex Treasury / Stripe Treasury                |
| **DAO treasury**               | DAOs with stables/SOL sitting idle | Diversification, laddered yield, liquidity mgmt | (covered in Autonomous Treasury Management)    |

# Psychological Hook

**"My money has guardrails."** The feeling of sleeping through a 20% market move and waking up to find your stop-loss fired, your position is in stables, and you didn't have to do anything. Risk management transforms from an anxiety you carry into a system you configured. The relief is permanent — once users have experienced enforced guardrails, managing DeFi manually feels like driving without a seatbelt.

- **Audit-ready by construction**: Every policy, every trigger, every execution is on-chain and verifiable. The system is a compliance layer, not just an automation layer
- **Risk as a feature**: Downturns make risk-management features _more_ attractive, not less. The platform hedges the market cycle
- **The leap to platform**: This is where product revenue (policy subscriptions, treasury management fees, spreads) exists beyond protocol fees
- **B2B de-risks the retail concern**: DAO and startup treasury customers are retained, high-AUM, and defensible in a way pure retail isn't
- **Gateway to delegation**: Users who've watched the system enforce their rules are ready to relax the rules into goals (Intent-Based Finance). The guardrails are what make the next leap feel safe

# Brief Market Research

DeFi portfolio management tools are fragmented — none offer policy-based enforcement with on-chain validation.

**Current alternatives:**

- **Robo-DeFi-Advisor**: AI-powered portfolio management on Solana — uses off-chain ML, no policy engine
- **Aegis**: DeFi risk management protocol — focuses on protocol-level risk, not personal policy enforcement
- **Ava AI Agent**: AI-driven trading on Solana — autonomous decisions, no user-defined constraints
- **SeiLens**: Portfolio analytics — read-only, no execution capabilities
- **Autonomous Finance Dexi**: DeFi agent — AI-managed, no declarative policy engine
- **Singularry**: AI portfolio advisor — recommendations only, no automated enforcement
- **zkde.fi**: DeFi rebalancer — rebalancing only, no multi-policy engine

**The gap**: Every existing solution either makes autonomous decisions (AI) or provides read-only analytics. None enable users to define declarative policies that execute automatically with on-chain validation. Tributary's Pull Payment + Lighthouse integration solves this natively.

# Business Model

**Revenue streams:**

- Policy subscription: $20-100/month for advanced policy engine (stop-loss, rebalancing, concentration caps)
- Treasury management fee: 0.5-1% AUM for DAO/startup treasury automation
- Execution spread: 0.1-0.3% on each policy-triggered rebalance
- Premium templates: Pre-built policy templates ($50-200 one-time)

**Unit economics:**

- 1,000 personal users × $50/month = $50,000/month
- 50 startup treasuries × $500/month = $25,000/month
- 10 DAO treasuries × $2,000/month = $20,000/month
- Execution fees on $10M monthly volume at 0.2% = $20,000/month
- Total: ~$115,000/month at scale

# Technical Specifications

## Architecture

```
User → Defines policies (risk, allocation, concentration)
  ↓
Policy Engine → Compiles constraints into execution logic
  ↓
Condition Monitor → Watches oracle prices, balances, time triggers
  ↓
Validation Layer → Lighthouse assertions + oracle checks before execution
  ↓
Tributary Pull → Executes policy-triggered transactions
  ↓
Audit Trail → Every policy, trigger, execution on-chain and verifiable
```

## How This Hooks Into Tributary

- **PayAsYouGo + Subscription + Milestone**: Policy engine uses all three models — recurring policy maintenance fees, per-execution pulls, milestone-based rebalancing
- **Lighthouse integration**: Critical — validation CPI ensures every execution is gated by verifiable assertions
- **Guardian module**: Rate limiting and abuse prevention for policy execution
- **Loyalty module**: Volume discounts for high-AUM users, compliance rewards for consistent policy adherence

## Recommended Tech Stack

- **Frontend**: Next.js policy editor with visual rule builder and backtesting
- **Backend**: Rust policy engine evaluating conditions against oracle feeds
- **Database**: PostgreSQL for policy storage, Redis for real-time condition caching
- **Solana**: Tributary program for execution, Lighthouse for validation, Switchboard for oracle feeds
- **Monitoring**: Grafana for policy execution metrics, custom dashboard for audit trails

## MVP Scope

1. Basic policy editor (stop-loss, allocation target, concentration cap)
2. Single oracle integration (Switchboard price feeds)
3. Simple condition monitoring and execution
4. Audit trail showing every policy trigger and execution
5. Basic backtesting against historical data

# Non-Technological Requirements

- Legal review for automated asset management (regulatory surface)
- Oracle reliability assessment (what happens if Switchboard goes down?)
- User education on policy design (misconfiguration risks)
- Insurance consideration for catastrophic policy failures

# Potential Risks

- **Validation robustness**: Lighthouse assertions and oracle checks must fire correctly through live volatility. A missed trigger during a crash is catastrophic; a false trigger in calm markets erodes trust fast
- **Policy misconfiguration**: A badly written constraint locks funds or allows unauthorized exposure. Simulation and policy-testing before activation is critical
- **Regulatory surface**: "Managing assets within constraints" edges closer to advisor/broker regulation than pure execution does. Jurisdictional care is required
- **Scope creep vs. the guardian angle**: Overlaps with Wallet Guardian & Optimizer. The distinction is mechanism: policy-based allocation is the rules engine; wallet guardian is the reactive protection product built on top of it. Keep the layers clean
