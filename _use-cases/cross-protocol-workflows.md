---
name: Cross-Protocol Financial Workflows
summary: Multi-step financial pipelines that chain conditions and forward CPIs across
  protocols — DeFi lego blocks assembled into autonomous workflows.
category: "\U0001F4B0 DeFi & Trading"
status: "\U0001F50D research"
protocol-version: v1
tributary_models:
- PayAsYouGo
- Subscription
category_slug: defi-trading
---


# DeFi Legos Assembled Into Autonomous Pipelines

Multi-step financial pipelines where each step is a Lighthouse-validated pull-and-forward, chained into a coherent financial strategy. The user sets up the workflow once; the protocol executes each leg in sequence.

# Pitch of the Core Idea

DeFi protocols are siloed. Each does one thing well — lend, swap, provide liquidity, stake — but stitching them together requires manual coordination: deposit here, withdraw there, swap in between, sign at every step. The cross-chain interoperability market is $1.7B in 2024, growing to $13.2B by 2033 at 25.8% CAGR. Yet intra-chain composability remains manual.

Tributary v1 enables cross-protocol workflows: multi-leg pipelines where each step is a Lighthouse-validated pull-and-forward. Receive USDC, auto-split into staking + LP + insurance + buffer. Detect liquidation risk, auto-borrow + repay + re-collateralize. The protocol handles execution; the user defines the strategy once.

# Core Mechanics

1. **Workflow service configures chains** of `ComposablePolicy` instances, each representing one leg
2. **Pre-validation (Lighthouse)** — Each leg has its own condition:
   - Leg 1 validates the trigger (incoming payment, time schedule)
   - Leg 2 validates output of Leg 1 (received tokens, achieved state)
   - Leg 3 validates market conditions for its action
3. **Pull (Token Delegation)** — Each leg pulls from output of previous leg (or user's wallet)
4. **Forward (CPI)** — Each leg routes to different protocol: swap → deposit → stake → hedge

```
LEG 1: Pull incoming USDC from user wallet
  → VALIDATE (Lighthouse: balance > $1,000 threshold)
  → PULL ($1,000)
  → FORWARD (Jupiter swap: 50% → SOL)

LEG 2: Pull SOL from Leg 1 output
  → VALIDATE (Lighthouse: SOL received > 4.0)
  → PULL (4.0 SOL)
  → FORWARD (Raydium stake: delegate SOL)

LEG 3: Pull remaining USDC from Leg 1
  → VALIDATE (Lighthouse: USDC remaining > $500)
  → PULL ($500)
  → FORWARD (Meteora DLMM: add USDC-SOL liquidity)
```

# Psychological Hook and Addictiveness

**"My money flows through strategies like water through pipes."** The satisfaction of watching a complex financial strategy execute autonomously — each leg triggering the next, each validation ensuring correctness. Users become architects of financial plumbing.

**Strategy marketplace**: Creators publish proven workflows. Users subscribe to strategies. The network effect of strategy sharing creates a DeFi strategy marketplace.

# Brief Market Research

| Metric                     | Data   |
| -------------------------- | ------ |
| Cross-Chain Interop (2024) | $1.7B  |
| Projected (2033)           | $13.2B |
| CAGR                       | 25.8%  |
| DeFi TVL                   | $50B+  |
| Cross-chain bridging share | 41.2%  |

**Key Competitors**:

- **Chainlink CCIP**: Cross-chain messaging, but not workflow orchestration
- **LayerZero**: Modular cross-chain messaging, but no financial workflow engine
- **Axelar**: Cross-chain communication, but infrastructure-level, not user-facing
- **Zapier/Make**: Workflow automation, but off-chain, not DeFi-native
- **DeFi Saver**: Single-protocol automation (Aave/Compound), not cross-protocol

**None provide Lighthouse-validated cross-protocol workflow orchestration.**

# Business Model

- **Workflow execution fee**: 0.3-1% on total capital moved through workflow
- **Strategy marketplace**: 15-30% revenue share on premium strategy subscriptions
- **Enterprise workflow tier**: $500-2,000/mo for custom multi-protocol workflows
- **Performance fee**: 10-20% of improved yield vs. manual execution
- **API access**: $100-500/mo for programmatic workflow creation

# Summary of Technical Specifications

## Architecture

- Workflow engine (chains ComposablePolicy instances in sequence)
- Per-leg Lighthouse validation (condition evaluation per step)
- Per-leg token delegation (pull from previous leg's output)
- Per-leg forward CPI (route to different protocol per step)
- Intermediate token account management (user sees intermediate states)
- Workflow dashboard (strategy visualization, execution history)

## How This Hooks Into Tributary

- **PayAsYouGo**: Per-leg pulling within workflow
- **ComposablePolicy**: Each leg is a separate policy
- **Lighthouse**: Per-leg validation
- **Forward**: Per-leg CPI to different protocols

## Recommended Tech Stack

- Solana + Anchor
- Tributary SDK (full v1 stack)
- Jupiter V6 for swaps
- Kamino, MarginFi, Meteora for yield/LP
- Pyth/Switchboard for market conditions
- React dashboard with workflow builder

## MVP Scope

- 2-3 leg workflow (swap → stake → LP)
- Jupiter + one yield protocol
- Sequential execution (not atomic)
- Basic workflow builder UI
- Buildable in 3 days with Tributary v1 SDK

# Non-Technological Requirements

- **Protocol integration**: Need partnerships with Jupiter, Kamino, Meteora for reliable CPI
- **Workflow templates**: Need pre-built templates for common strategies
- **User education**: Cross-protocol workflows are complex — need clear documentation
- **Monitoring/alerting**: Users need visibility into multi-leg execution
- **Gas optimization**: Multi-leg pipelines multiply gas costs

# Potential Risks

- **Partial execution**: If pipeline fails at Leg 3, Legs 1-2 are complete. Tokens in intermediate state — recoverable but requires manual intervention
- **Composability bugs**: Each protocol in chain may have quirks. Bug in Protocol B affects every pipeline including it
- **Gas multiplication**: Multi-leg pipelines multiply gas costs. For small workflows, gas may exceed automation value
- **Timing-dependent strategies**: Arbitrage and yield rotation are timing-sensitive. Sequential execution with block gaps may miss opportunity window
- **Not atomic**: v1 executes legs sequentially. True atomic multi-leg pipelines require custom forward program or v2
