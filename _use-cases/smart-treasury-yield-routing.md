---
name: Smart Treasury Yield Routing
summary: A third-party service monitors a business or user's idle balances and automatically
  routes surplus capital into the best available yield source — rebalancing based
  on APY, risk, and liquidity constraints. Lighthouse validates conditions; the composable
  contract pulls and forwards.
category: "\U0001F4B0 DeFi & Trading"
status: "\U0001F50D research"
protocol-version: v1
tributary_models:
- PayAsYouGo
- Subscription
validation: lighthouse
forward_targets:
- Jupiter V6
- Kamino Vault
- MarginFi
- Meteora DLMM
category_slug: defi-trading
---


# A third-party service monitors idle balances and automatically routes surplus into the best yield source

# Businesses hold idle stablecoins that earn nothing — this turns idle capital into a yield engine

# Core Mechanics

A treasury management service configures `ComposablePolicy` instances that encode yield strategies:

1. **Pre-validation (Lighthouse)** — Asserts the user's balance exceeds a configurable liquidity floor (e.g., "only route if USDC balance > $10K"). Validates the target yield protocol is healthy (TVL above threshold, no known exploits). Checks APY oracle data against minimum thresholds.
2. **Pull (Token Delegation)** — Claims the surplus amount above the liquidity floor from the user's token account. The user retains the floor; only excess moves.
3. **Forward (CPI)** — Routes to the best-yielding whitelisted protocol: deposit into Kamino vault, lend via MarginFi, or swap + LP via Meteora. Output receipt tokens land in the user's wallet.

```
WHEN (condition: USDC balance > $10K threshold)
  → VALIDATE (Lighthouse: balance check + Kamino health check + APY > 5%)
  → PULL (surplus above floor)
  → FORWARD (deposit into Kamino USDC vault)
  → LAND (kamino receipt tokens → user wallet)
```

The service triggers execution when their off-chain monitor detects the threshold is met. The user approved the strategy once. Every subsequent rebalance is autonomous.

### Business Scenarios

- **Corporate treasury**: A company holds $500K USDC for operations. Anything above $200K is surplus. The policy routes surplus into Kamino (8% APY) automatically, pulling back when the balance drops near the floor.
- **DAO yield vault**: Treasury USDC auto-deposits into the highest-yield whitelisted venue. Lighthouse rebalances when a better APY appears elsewhere, pulling from the old position and forwarding to the new one.
- **Auto-compounding**: Staking rewards accumulate in a user's wallet. When they exceed $100, Lighthouse triggers: pull rewards → swap to SOL → re-stake. Position compounds without manual intervention.

### Trust Boundary Design

- **Liquidity floor enforcement**: Lighthouse checks the user's balance against the configured floor. The pull amount is capped at surplus only — the protocol cannot drain operational capital.
- **Protocol health gating**: Lighthouse validates the target protocol's on-chain state before forwarding. If a lending market is paused, frozen, or under attack, the validation fails and nothing moves.
- **Revocation**: User revokes delegation → next validation fails → routing stops. No lock-up, no exit fee, no custody delay.
- **Capped per-period**: `PayAsYouGo` schedule with `max_amount_per_period` prevents runaway routing if a bug or oracle manipulation causes repeated triggers.

### Abuse Prevention

- **Whitelisted venues only**: Forward CPI targets are protocol-upgrade-gated. A service cannot route to an unlisted or malicious program.
- **Output verification**: After forward CPI, the protocol reads the output balance and checks against `min_output_amount`. If a yield venue returns fewer receipt tokens than expected (indicating a bug or manipulation), the transaction reverts.
- **Slippage bounds**: For swap-containing routes, slippage protection prevents MEV extraction on the routing transaction.

# Psychological Hook

**"My money makes money while I sleep."** The relief of seeing idle capital automatically routed to yield sources without manual intervention. Financial management transforms from a chore into a passive income stream.

- **Set-and-forget**: Configure once, earn continuously
- **Yield optimization**: Always routing to the best available source
- **Transparency**: Every routing decision is on-chain and verifiable
- **Control**: User retains liquidity floor, only surplus is deployed

# Brief Market Research

DeFi yield optimization is a growing space, but no solution combines automated routing with protocol-level validation and user-controlled liquidity floors.

**Current alternatives:**

- **Robo-DeFi-Advisor**: AI-powered portfolio management — autonomous decisions, no user-defined liquidity floors
- **Aegis**: DeFi risk management — protocol-level focus, not treasury yield routing
- **Ava AI Agent**: AI-driven trading — autonomous, not user-triggered yield optimization
- **SeiLens**: Portfolio analytics — read-only, no execution capabilities
- **Autonomous Finance Dexi**: DeFi agent — AI-managed, not yield routing-based
- **Singularry**: AI portfolio advisor — recommendations only, no automated execution
- **zkde.fi**: DeFi rebalancer — rebalancing only, not yield optimization

**The gap**: Every existing solution either makes autonomous decisions (AI) or provides read-only analytics. None enable businesses to define yield strategies with liquidity floors and protocol-level validation. Tributary's v1 composable contract with Lighthouse validation solves this natively.

# Business Model

**Revenue streams:**

- Yield routing fee: 5-10% of yield generated (performance-based)
- Platform subscription: $100-1,000/month for treasury management dashboard
- Premium strategies: Advanced yield optimization algorithms ($500-2,000/month)
- Integration fees: DeFi protocols paying for placement in allowed forward list

**Unit economics:**

- 100 businesses × $500/month platform fee = $50,000/month
- $10M total assets under routing × 8% APY × 7.5% fee = $60,000/month
- 50 premium users × $1,000/month = $50,000/month
- Total: ~$160,000/month at scale

# Technical Specifications

## Architecture

```
Treasury Service → Monitors balances and yields
  ↓
Lighthouse → Validates balance, liquidity floor, protocol health
  ↓
Tributary Pull → Claims surplus above floor
  ↓
Forward CPI → Routes to best yield source (Kamino, MarginFi, Meteora)
  ↓
Receipt Tokens → Land in user's wallet
  ↓
Rebalance Monitor → Continuously watches for better yields
```

## How This Hooks Into Tributary

- **v1 Composable Contract**: Direct implementation — `ComposablePolicy` with condition, validation, and forward targets
- **Lighthouse integration**: Critical — pre-validation ensures safe execution and protocol health
- **Guardian module**: Rate limiting, abuse prevention, emergency stops for yield routing
- **Loyalty module**: Volume discounts for high-AUM users, performance rewards for consistent yields

## Recommended Tech Stack

- **Frontend**: Next.js treasury dashboard with yield visualization
- **Backend**: Rust yield monitoring service, Redis for price/yield caching, PostgreSQL for policy storage
- **Database**: PostgreSQL for user/treasury data, Redis for real-time yield tracking
- **Solana**: Tributary v1 program, Lighthouse for validation, Kamino/MarginFi/Meteora for yield sources
- **Monitoring**: Grafana for yield metrics, custom dashboard for treasury analytics

## MVP Scope

1. Basic yield strategy configuration (liquidity floor, target APY)
2. Single yield source integration (Kamino vault)
3. Lighthouse validation for balance and protocol health
4. Automated routing when conditions are met
5. Basic treasury dashboard

# Non-Technological Requirements

- Legal review for automated yield generation (securities implications?)
- DeFi protocol due diligence (security audits, TVL verification)
- User education on yield risks and liquidity floor importance
- Insurance consideration for smart contract exploits in target protocols
- Oracle reliability assessment (what happens if APY feeds fail?)

# Potential Risks

- **Smart contract risk in target protocols**: The protocol routes to whitelisted programs, but those programs can still be exploited. Lighthouse checks health state, but zero-day exploits bypass on-chain health checks.
- **Impermanent loss on LP routes**: Routing into LP positions introduces IL risk. The policy should encode the user's risk tolerance, not just yield targets.
- **Oracle staleness**: If APY oracles lag, capital may route to a venue whose yield has already dropped. Time-weighted averages in the Lighthouse assertion mitigate this.
