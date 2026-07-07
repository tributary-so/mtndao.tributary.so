---
name: Income Waterfall
summary: Every incoming payment auto-splits across purpose-specific wallets the moment
  it lands — pay yourself first, without willpower
category: "\U0001F527 Infrastructure & Tools"
status: "\U0001F4AD ideation"
protocol-version: v0
tributary_models:
- PayAsYouGo
- Subscription
category_slug: infrastructure-tools
---


# Pay Yourself First. Automatically. Forever.

Money arrives and instantly cascades through predefined routing rules — taxes to a vault, savings to yield, investments to DCA, only the remainder to your hot wallet. Configure once, route forever.

# Pitch of the Core Idea

Everyone knows they should save more, invest more, and set aside taxes. Almost nobody does it consistently. The problem isn't knowledge — it's friction. Income arrives as a lump sum in a spending wallet. The user sees the full amount. They intend to allocate "later." Later becomes never. The money gets spent.

The income waterfall fixes this structurally. Money never arrives in the spending wallet whole. It **cascades** through predefined routing rules the moment it lands — taxes to a vault, savings to yield, investments to DCA, and only the remainder to the hot wallet. The user configured this once. Every incoming payment routes itself forever.

This is infrastructure. Every income source on Solana should flow through this: salaries, freelance payments, creator revenue, DAO contributions. If Tributary owns the routing layer between "money arriving" and "money going everywhere it needs to go," every other use case becomes a downstream consumer. The waterfall is the top of the funnel — and the top of the funnel is the most valuable position in any infrastructure stack.

# Core Mechanics

1. **Receiving Address**: User designates single entry point for all income — the waterfall trigger
2. **Priority-Based Routing**: Buckets fill in order: Tax reserve first (non-negotiable), emergency fund next until target, then investments, spending wallet gets remainder
3. **Fixed Split Mode**: Simple percentages — 20% hot wallet, 20% investments, 60% savings
4. **Conditional Routing**: "If monthly income exceeds $5,000, route excess to aggressive yield strategy"
5. **Cap-Based Overflow**: "Fill tax vault to $15,000. Everything above goes to next priority"
6. **Destination Composability**: Each destination is itself a Tributary delegation point — recursive routing tree

**Tributary Primitives Used**:

- PayAsYouGo for continuous surplus pulls within configured limits
- ComposablePolicy for routing rules, priorities, and conditions
- Lighthouse for real-time balance monitoring and yield verification
- Forward for automatic yield distribution and rebalancing

# Psychological Hook and Addictiveness

**"Pay yourself first" — the advice everyone knows, finally automated.** The single most cited personal finance principle across every culture and every era. The waterfall doesn't ask if you want to save. It doesn't give you the option to skip. The money routes before you can rationalize spending it. This is behavioral economics weaponized for your benefit — loss aversion inverted.

**Cascade visualization**: Watching $5,000 arrive and instantly split into 6 buckets in real-time is viscerally satisfying. **Savings on autopilot**: Users discover they've saved $4,000 this quarter "without trying." **Portfolio dashboard**: "Your routing tree saved $12,400 this year. $3,200 earned yield. $8,400 invested." **Priority tweaking**: Users obsess over their waterfall order — it becomes a reflection of values. **Progress bars**: Emergency fund at 73%. Tax vault at 91%. Visual targets create completion drive.

# Brief Market Research

The personal finance apps market was $133 billion in 2024, projected to reach $330 billion by 2028 (25.5% CAGR). The smart budgeting apps market specifically is $1.21 billion in 2024, growing at 18.4% CAGR. The personal financial management (PFM) market is $10.78 billion in 2025, projected to reach $24.4 billion by 2034.

**Key Competitors**:

- **YNAB**: $100M+ revenue, zero-based budgeting philosophy, $99/year subscription — manual allocation, no automation
- **Acorns**: $5B+ AUM, round-up investing, $3-5/month — limited to micro-investing, not full income routing
- **Monarch Money**: $50M+ ARR, Mint successor, $9.99/month — aggregation and tracking, not active routing
- **Wealthfront**: $50B+ AUM, automated investing, 0.25% fee — investment-focused, not income routing
- **Betterment**: $40B+ AUM, robo-advisor, 0.25% fee — portfolio management, not cash flow automation

The market is dominated by tracking tools (YNAB, Monarch) and investment platforms (Wealthfront, Betterment). None offer true income routing — the ability to automatically split incoming payments across multiple destinations with priority rules. This is the gap Tributary fills.

# Business Model

**Revenue Streams**:

- **Routing Fee**: 0.1-0.5% on every routed payment (micro-fee)
- **Premium Features**: Advanced conditional routing, analytics, priority support — $9-29/month
- **Enterprise API**: Companies integrate income routing for employees/contractors — $100-1000/month
- **Yield Partnerships**: Referral fees from integrated yield protocols (Kamino, Marinade)

**Cost Structure**:

- Solana transaction fees: ~$0.00025 per routing event
- Infrastructure: $500-2000/month for routing engine and monitoring
- Customer support: $500-2000/month at scale
- Marketing: $5-15 per acquired user

**Unit Economics**: At 10,000 users routing average $5,000/month, platform revenue is ~$25,000/month (0.5% fee) minus $5,000/month costs = $20,000/month profit.

# Summary of Technical Specifications

## Architecture

- **Frontend**: React web app with routing configuration dashboard
- **Backend**: Solana program for routing logic, balance monitoring, cascade execution
- **Yield Integration**: Adapter layer for destination protocols (Kamino, Marinade, Jupiter)
- **Monitoring**: Real-time routing visualization, yield tracking, alert system

## How This Hooks Into Tributary

- **PayAsYouGo**: Core primitive — continuous routing within configured rules
- **ComposablePolicy**: Routing priorities, conditions, and destination configurations
- **Lighthouse**: Real-time balance monitoring and yield verification
- **Forward**: Automatic yield distribution and rebalancing

## Recommended Tech Stack

- **Blockchain**: Solana (low fees essential for frequent routing)
- **Framework**: Anchor for Solana program, React frontend
- **SDK**: Tributary SDK for payment flows
- **Yield**: Jupiter/Marinade for staking, Kamino for lending
- **Monitoring**: Custom dashboard with real-time routing visualization

## MVP Scope

**2-3 Day Hackathon Build**:

- Basic routing configuration (taxes, savings, spending)
- Single income source integration
- Simple dashboard showing routing events and balances
- Auto-routing when income arrives

**Not in MVP**: Conditional routing, yield integration, enterprise API, multi-source income.

# Non-Technological Requirements

- **Financial Education**: Users need to understand routing priorities and trade-offs — documentation required
- **Trust Building**: Start with simple rules (50/30/20) before enabling complex conditional routing
- **Support Infrastructure**: Help users configure appropriate floors and priorities
- **Legal/Compliance**: Automated financial routing may trigger regulatory requirements — legal review needed
- **Community**: User community for sharing routing configurations and optimization strategies

# Potential Risks

- **Over-Routing**: Users who allocate 95% to savings/investments and starve their spending wallet. The system needs spending floor warnings
- **Routing Complexity**: Multi-level conditional routing becomes hard to reason about. Simple defaults matter
- **Gas Costs at Scale**: Every incoming payment triggering 5+ transfers adds up. Batch routing may be more practical for small frequent payments
- **Failed Destinations**: If a Kamino vault is full or a Jupiter route fails mid-cascade, what happens to the stuck funds? Robust fallback routing is essential
- **Revocation Cascades**: Revoking the routing delegation while money is mid-cascade creates edge cases. Atomic routing or clear failure modes needed
- **Cold Start Friction**: Users won't configure 6 routing destinations on day one. Needs progressive disclosure — start with 2 buckets, add complexity over time
- **User Over-Reliance**: If the routing program has a bug, users lose money they didn't manually verify was going to the right place. Audit trails and transparency are non-negotiable
