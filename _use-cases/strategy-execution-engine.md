---
name: Strategy Execution Engine
summary: Pre-approved trading strategies that execute automatically when conditions
  are met — oracle signals, price targets, time schedules — without per-trade signing
  and without handing over private keys. The user delegates spending authority; the
  strategy service triggers; Lighthouse validates; the protocol routes through any
  whitelisted DEX.
category: "\U0001F4B0 DeFi & Trading"
status: "\U0001F50D research"
protocol-version: v1
tributary_models:
- PayAsYouGo
- Subscription
validation: lighthouse
forward_targets:
- Jupiter V6
- Meteora DLMM
- Raydium AMM
category_slug: defi-trading
---


# Pre-approved trading strategies that execute automatically when conditions are met

# Trading bots exist. Session keys exist. What doesn't exist is non-custodial, condition-gated, third-party-triggerable strategy execution.

# Core Mechanics

A strategy provider (or the user themselves) configures `ComposablePolicy` instances that encode trading logic:

1. **Pre-validation (Lighthouse)** — Evaluates the trigger condition against oracle data: price thresholds (Pyth/Switchboard feed), technical indicators (on-chain TWAP), timing windows, or composite conditions ("price below threshold AND RSI < 30"). The strategy only fires when the signal is confirmed on-chain.
2. **Pull (Token Delegation)** — Claims the trade size from the user's wallet. Capped by the schedule — the strategy cannot trade more than the user approved.
3. **Forward (CPI)** — Routes through a whitelisted DEX: Jupiter V6 for best-execution swaps, Meteora DLMM for concentrated liquidity, Raydium AMM for standard swaps. Slippage-protected via `min_output_amount`.

```
WHEN (condition: SOL/USD < $100 via Pyth oracle)
  → VALIDATE (Lighthouse: assert Pyth SOL/USD price < 100.0)
  → PULL (500 USDC)
  → FORWARD (Jupiter swap: 500 USDC → SOL, min_output: 4.5 SOL)
  → LAND (SOL → user wallet)
```

Any third party can trigger execution when the condition is met — the strategy service, a keeper bot, or even the user themselves. Permissionless triggering, custodied funds, validated conditions.

### Business Scenarios

- **DCA with conditional entry**: "Buy $200 SOL every Monday, but only if price is below the 7-day TWAP." Lighthouse validates the TWAP condition. The DCA executes only at favorable prices.
- **Grid trading**: Multiple policies at different price levels: "Buy at $90, sell at $110, buy at $85, sell at $115." Each is a separate `ComposablePolicy` with a Lighthouse price gate. The grid runs autonomously.
- **Take-profit / stop-loss ladder**: User holds SOL. Policies: "Sell 25% if SOL > $200," "Sell 50% if SOL > $300," "Sell all if SOL < $80." Lighthouse checks price; protocol executes. No CEX, no keeper bot, no per-order signing.
- **Signal-driven execution**: A strategy service publishes on-chain signals (attested via oracle). Lighthouse validates the signal. Strategy executes: pull → swap → land. The user approved the signal source at setup.

### Trust Boundary Design

- **Hard trade caps**: `max_amount_per_period` and `max_chunk_amount` in the schedule bound every trade. A strategy cannot exceed the user's approved risk envelope, even if signals fire rapidly.
- **Signal source lock**: The Lighthouse assertion references specific oracle accounts. A strategy service cannot swap the signal source post-creation — the user approved signals from Pyth, and only Pyth gates execution.
- **DEX allowlist**: Forward targets are hard-coded. A strategy cannot route to an unlisted DEX, even if it offers better prices. New DEXs require a protocol upgrade.
- **Revocation**: User revokes delegation → strategy halts. No exit period, no lock-up, no minimum commitment.

### Abuse Prevention

- **Instruction-level validation**: `ByteRangeChecks` on the forward CPI instruction ensure the strategy executes the approved instruction (swap) on the approved program (Jupiter), not an arbitrary instruction.
- **Slippage enforcement**: `min_output_amount` in `ForwardConfig` prevents the triggering party from sandwiching the trade. If a MEV bot front-runs the swap, slippage exceeds the threshold and the transaction reverts.
- **Output-based fees**: Protocol fees are on the output amount. A strategy service cannot inflate fees by manipulating trade parameters.
- **Auditable trail**: Every strategy execution is on-chain — condition, pull amount, DEX route, slippage, output. Full post-hoc analysis possible.

# Psychological Hook

**"My strategy runs itself."** The relief of knowing your trading plan executes automatically when conditions are met — no missed entries, no emotional decisions, no 3am wake-up calls to catch a price move.

- **Set-and-forget**: Configure once, execute continuously
- **Emotional detachment**: Strategy executes based on signals, not feelings
- **Transparency**: Every trade is on-chain and verifiable
- **Control**: User retains custody, only delegates spending authority

# Brief Market Research

Automated trading exists on Solana, but no solution combines non-custodial execution with protocol-level condition validation.

**Current alternatives:**

- **Robo-DeFi-Advisor**: AI-powered portfolio management — autonomous decisions, no user-defined conditions
- **Ava AI Agent**: AI-driven trading — autonomous, not condition-gated
- **SeiLens**: Portfolio analytics — read-only, no execution capabilities
- **Autonomous Finance Dexi**: DeFi agent — AI-managed, not user-defined strategies
- **Singularry**: AI portfolio advisor — recommendations only, no automated execution
- **zkde.fi**: DeFi rebalancer — rebalancing only, not strategy execution

**The gap**: Every existing solution either makes autonomous decisions (AI) or provides read-only analytics. None enable users to define declarative trading strategies with oracle-validated conditions and non-custodial execution. Tributary's v1 composable contract with Lighthouse validation solves this natively.

# Business Model

**Revenue streams:**

- Execution fee: 0.1-0.5% per trade executed
- Platform subscription: $50-500/month for strategy dashboard and management
- Premium strategies: Advanced condition types, multi-asset strategies ($100-1,000/month)
- Signal marketplace: Trading signal providers pay for placement ($500-5,000/month)

**Unit economics:**

- 1,000 active strategies × $100 average monthly volume = $100,000/month processed
- Execution fee at 0.25% = $250/month
- 100 premium users × $200/month = $20,000/month
- Total: ~$20,250/month at early stage

# Technical Specifications

## Architecture

```
Strategy Service → Defines conditions and trade parameters
  ↓
Lighthouse → Validates trigger conditions against oracle data
  ↓
Tributary Pull → Claims trade amount from user wallet
  ↓
Forward CPI → Routes through whitelisted DEX (Jupiter, Meteora, Raydium)
  ↓
User Wallet → Receives output tokens
  ↓
Audit Trail → Every execution recorded on-chain
```

## How This Hooks Into Tributary

- **v1 Composable Contract**: Direct implementation — `ComposablePolicy` with condition, validation, and forward targets
- **Lighthouse integration**: Critical — condition validation ensures strategy only fires when signals are confirmed
- **Guardian module**: Rate limiting, abuse prevention, emergency stops for strategy execution
- **Loyalty module**: Volume discounts for high-frequency traders, performance rewards for successful strategies

## Recommended Tech Stack

- **Frontend**: Next.js strategy dashboard with condition builder
- **Backend**: Rust strategy engine, Redis for oracle caching, PostgreSQL for strategy storage
- **Database**: PostgreSQL for strategy/user data, Redis for real-time oracle feeds
- **Solana**: Tributary v1 program, Lighthouse for validation, Jupiter/Meteora/Raydium for execution
- **Oracles**: Pyth/Switchboard for price feeds, custom oracles for technical indicators

## MVP Scope

1. Basic condition types (price threshold, time-based)
2. Single forward target (Jupiter swap)
3. Lighthouse validation for conditions
4. Simple strategy dashboard
5. Basic audit trail

# Non-Technological Requirements

- Legal review for automated trading (securities regulations?)
- Oracle reliability assessment (what happens if Pyth goes down?)
- User education on strategy risks and condition design
- MEV protection considerations (Jito bundles, private mempools)
- Performance monitoring for strategy execution metrics

# Potential Risks

- **MEV exposure**: Despite slippage protection, strategy transactions are visible in the mempool. Deterministic strategies (always buy at $100) can be front-run. Jito bundles or private mempools mitigate this.
- **Strategy overlap**: Multiple policies on the same asset can conflict — e.g., a buy signal and sell signal triggering simultaneously. Careful policy design is required.
- **Oracle dependency**: The strategy is only as reliable as its oracle. Pyth/Switchboard are robust but not infallible. Price spikes during oracle updates can trigger false executions.
- **Gas economics**: For small trade sizes, per-execution gas + protocol fees may erode returns. Strategies work best with meaningful trade sizes or longer intervals.
