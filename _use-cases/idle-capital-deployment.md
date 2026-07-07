---
name: Idle Capital Deployment
summary: Keep $X liquid. Everything above goes to work automatically. The universal
  painkiller that onboards users to automated DeFi.
category: "\U0001F4B0 DeFi & Trading"
status: "\U0001F50D research"
protocol-version: v0
tributary_models:
- PayAsYouGo
- Subscription
category_slug: defi-trading
---


# Your Money Works While You Sleep

Set a liquidity floor. Everything above it deploys automatically to yield strategies. See returns without lifting a finger. The strongest wedge in the Tributary roadmap.

# Pitch of the Core Idea

Nearly every crypto user has the same problem: capital sitting idle. SOL waiting to be staked. USDC parked for "next time." Rewards accrual nobody harvested. A DAO treasury in stables doing nothing. A startup's runway earning zero. The pain is universal, the ROI is measurable, and the value proposition is immediate — "your money works while you don't."

This is **the wedge**. Of every use case in the roadmap, this is the one to lead with in product, pitch, and narrative. It spans retail and B2B. It pays for itself in visible yield the first week. And it is the cleanest possible gateway from "I trust the system to move my money" (Stage 0) to "I trust the system to route into DeFi" (Stage 1) and beyond.

The user configures one thing: a **liquidity floor**. "Keep $2,000 liquid." Everything above the floor is the deployable surplus. From there the loop runs continuously: observe the balance, compute surplus, pull via Tributary, deploy to yield strategy, rebalance as needed. The floor is always preserved.

# Core Mechanics

1. **Floor Setup**: User sets liquidity floor (e.g., "Keep $2,000 liquid") → configures preferred yield strategy
2. **Surplus Detection**: System continuously monitors wallet balance → identifies capital above floor
3. **Auto-Deployment**: Tributary pulls surplus → routes to chosen yield strategy (lending, staking, diversified DeFi)
4. **Yield Harvest**: Returns flow back automatically → compound or distribute per user preference
5. **Rebalancing**: As user spends toward floor, system re-evaluates → re-deploys when surplus reappears
6. **Dashboard**: Real-time visibility into deployed capital, yield earned, floor status

**Tributary Primitives Used**:

- PayAsYouGo for continuous surplus pulls within configured limits
- ComposablePolicy for strategy selection and risk parameters
- Lighthouse for real-time balance monitoring and yield verification
- Forward for automatic yield distribution and rebalancing

# Psychological Hook and Addictiveness

"Money that works while I sleep." The first time a user opens their dashboard a week after configuring this and sees yield that materialized without a single action on their part, the category is sold. Idle capital becomes embarrassing — the thought of leaving USDC at zero yield after this feels like lighting money on fire. The product creates its own urgency.

The floor framing is the entire unlock. Without it, "deploy my capital" sounds risky. With it, "keep $X liquid, deploy the rest" sounds like common sense. Same mechanism, opposite emotional valence.

**Visible, measurable ROI**: Yield appears on a dashboard. There is no ambiguity about whether the product is working. **Immediate value**: Set it once, benefit forever. Time-to-first-value is measured in days. **Universal pain**: Retail users, DAOs, and startups all have idle capital. The same wedge opens three markets. **Trust escalation gateway**: Users who see the system deploy capital reliably are ready for more complex financial products.

# Brief Market Research

DeFi total value locked reached $94.9 billion in 2024, up 75% year-over-year. The yield market specifically grew 148.6% to $9.1 billion. DeFi yields earned by liquidity providers surpassed $6 billion in 2024, with 77% coming from real fee revenues rather than token emissions.

**Key Competitors**:

- **Lido**: $48B TVL, liquid staking leader, 5-7% APR on ETH staking
- **Aave**: $32.7B TVL, lending protocol, 2-10% yields on stablecoins
- **Pendle**: $4.8B TVL, yield trading protocol, lets users speculate on yield curves
- **Yearn Finance**: Yield aggregator, automated strategies, 2-15% APY
- **Coinbase/Earn**: Centralized yield products, 4-5% on staking, but custodial

The market is fragmented across dozens of protocols, each requiring manual setup and management. The opportunity is aggregation — one interface to deploy across multiple strategies. Tributary's non-custodial, multi-protocol approach is the differentiator.

# Business Model

**Revenue Streams**:

- **Deployment Fee**: 0.5-1% on capital deployed (one-time)
- **Yield Spread**: 10-20% of yield earned (performance fee)
- **Premium Strategies**: Advanced or exclusive strategies at $9-49/month
- **Enterprise API**: DAOs and startups integrate auto-deployment — $100-1000/month

**Cost Structure**:

- Solana transaction fees: ~$0.00025 per deployment
- Infrastructure: $1000-3000/month for monitoring and rebalancing
- Smart contract audits: $50-200K initial
- Customer support: $500-2000/month at scale

**Unit Economics**: At 10,000 users with average $5,000 deployed, platform revenue is ~$250,000/year (0.5% deployment fee) plus $150,000/year yield spread (10% of 3% average yield) = $400,000/year revenue minus $100,000/year costs = $300,000/year profit.

# Summary of Technical Specifications

## Architecture

- **Frontend**: React web app with dashboard for floor management and yield visualization
- **Backend**: Solana program for balance monitoring, surplus calculation, deployment execution
- **Yield Integration**: Adapter layer for multiple DeFi protocols (Lido, Aave, Marinade, etc.)
- **Monitoring**: Real-time balance tracking, yield verification, alert system

## How This Hooks Into Tributary

- **PayAsYouGo**: Core primitive — continuous surplus pulls within configured limits
- **ComposablePolicy**: Strategy selection, risk parameters, deployment rules
- **Lighthouse**: Real-time balance monitoring and yield verification
- **Forward**: Automatic yield distribution and rebalancing

## Recommended Tech Stack

- **Blockchain**: Solana (low fees essential for frequent rebalancing)
- **Framework**: Anchor for Solana program, React frontend
- **SDK**: Tributary SDK for payment flows
- **Yield**: Jupiter/Marinade for SOL staking, Raydium for LP positions
- **Monitoring**: Custom dashboard with real-time yield tracking

## MVP Scope

**2-3 Day Hackathon Build**:

- Basic floor configuration (keep $X liquid)
- Single yield strategy (SOL staking via Marinade)
- Simple dashboard showing deployed capital and yield
- Auto-deployment when balance exceeds floor

**Not in MVP**: Multi-strategy support, advanced rebalancing, enterprise API, DAO integration.

# Non-Technological Requirements

- **Risk Education**: Users need to understand that yield strategies carry risk — clear documentation required
- **Support Infrastructure**: Help users set appropriate floors, understand yield sources
- **Legal/Compliance**: Automated investment advice may trigger regulatory requirements — legal review needed
- **Trust Building**: Start with conservative strategies (staking) before expanding to higher-risk DeFi
- **Community**: User community for sharing strategies, floor settings, yield optimization

# Potential Risks

- **Yield Strategy Risk**: If the underlying strategy underperforms or gets exploited, users lose money they parked expecting safety. Risk-tiered strategies and clear risk labeling are non-negotiable
- **Floor Miscalibration**: Set the floor too low and the user can't access funds when they need them; too high and the product under-delivers. Smart floor suggestions based on spending history reduce this
- **Withdrawal Friction**: Deployed capital isn't instantly liquid. Users will expect to spend "their money" immediately and hit redemption latency. Managing this expectation is a UX problem, not just a tech one
- **Competition**: Every wallet and DeFi dashboard will ship some version of "auto-deploy." Tributary's defensibility is being the non-custodial, multi-protocol, cross-wallet primitive beneath all of them, not the consumer UI on top
- **Smart Contract Risk**: DeFi protocols can be exploited — diversification across strategies is essential
- **Regulatory Risk**: Automated yield farming may be classified as investment advice in some jurisdictions
