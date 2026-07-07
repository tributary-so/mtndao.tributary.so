---
name: Autonomous AI Agents (Auto Ape)
summary: AI agents that autonomously trade, farm, and spend on-chain while you sleep
  — funded by pull-based spending limits you approve once.
category: "\U0001F916 AI & Automation"
status: "\U0001F4AD ideation"
protocol-version: v0
tributary_models:
- PayAsYouGo
- Subscription
category_slug: ai-automation
---


# AI Agents With Their Own Checking Account

You approve a daily spend cap. Set a risk profile. Go to bed. Your agent trades, farms, copies whales, and spends on-chain — all without asking you. You wake up to P&L reports.

# Pitch of the Core Idea

The automated crypto trading market is $22.2B in 2025, growing to $66.6B by 2033 at 14.8% CAGR. The agentic AI market is $7.3B in 2025, projected to hit $139B by 2034 at 40.5% CAGR. Gemini just launched Agentic Trading. Bitget has an Agent Hub. Yet every solution requires either custodial access or per-transaction signing.

Tributary's pull primitive changes the game. The agent holds a delegated spending authority — it can pull tokens within your approved limits without triggering a wallet popup per transaction. No signing. No friction. The agent acts like it has its own checking account with a daily allowance. Beyond trading, the agent becomes an economic actor: buys API access, pays humans for microtasks, rents GPU compute, rebalances positions, buys ad inventory, tips data providers. **Stripe for autonomous agents.** Every AI agent that needs to spend money on-chain needs exactly this infrastructure.

# Core Mechanics

1. **User approves daily spend cap** and sets risk profile
2. **Agent operates within spending envelope** via Tributary's `PayAsYouGo`
3. **`Subscription` layer** covers baseline services (compute, data feeds)
4. **Agent executes autonomously**: scans mempool, buys/sells, farms airdrops, copies whale wallets
5. **No per-action approvals needed** — within approved limits, agent acts freely

The agent can also spend on non-trading activities: API access, compute, microtasks, advertising. Every spend is a Tributary pull within the approved cap.

# Psychological Hook and Addictiveness

**People anthropomorphize agents _fast_**. Within days, users give them names, avatars, backstories. "Damn, my agent went aggressive today — 14 trades, 9 wins." They obsessively check spend velocity, ROI curves, win rate.

**Spectator sport**: Watching your agent trade is dopamine. Win streaks, loss streaks, clutch calls. **RPG progression**: Agents level up, unlock strategies, gain "experience" in specific markets. **Social comparison**: Leaderboards. "Your agent is ranked #47 out of 12,000 this week." **Loss aversion**: You funded it. It's _yours_. You optimize its parameters compulsively. **Autonomy illusion**: It acts independently. You feel pride when it wins, frustration when it loses — exactly like a sports team.

# Brief Market Research

| Metric                          | Data   |
| ------------------------------- | ------ |
| Automated Crypto Trading (2025) | $22.2B |
| Projected (2033)                | $66.6B |
| CAGR                            | 14.8%  |
| Agentic AI Market (2025)        | $7.3B  |
| Projected (2034)                | $139B  |
| CAGR                            | 40.5%  |
| AI Crypto Bot Market            | $1.8B  |

**Key Competitors**:

- **3Commas** (500K+ subscribers): DCA/grid bots, $75-90M revenue, multi-exchange, but custodial API keys
- **Cryptohopper** ($1.8B managed): AI signal engine, Strategy Designer, 22 exchanges, cloud-based
- **Pionex**: 16 free built-in bots, built-in exchange, beginner-friendly
- **Gemini Agentic Trading**: LLM-powered trading via MCP, custodial, CEX-only
- **Neyro/Aurum**: Non-custodial AI agents on DEX, closest to Tributary model but early

**All existing solutions are custodial or require per-trade signing.** Tributary enables non-custodial autonomous agents.

# Business Model

- **Platform fee**: 10-20% of agent's profits (performance-based)
- **Subscription**: $20-100/mo for agent compute, data feeds, strategy marketplace
- **Strategy marketplace**: Creators sell proven agent strategies, Tributary takes 15-30% cut
- **Agent-as-a-service**: Managed agent tiers for non-technical users ($50-200/mo)
- **Data licensing**: Anonymized agent trading data for institutional research

# Summary of Technical Specifications

## Architecture

- Agent runtime (LLM + strategy engine + market data feeds)
- Tributary policy engine defining spend caps, risk limits, allowed protocols
- PayAsYouGo streams for agent spending (trading, compute, data)
- Multi-DEX routing (Jupiter, Raydium, Meteora)
- Risk management layer (circuit breakers, daily caps, real-time alerts)

## How This Hooks Into Tributary

- **PayAsYouGo**: Agent's "checking account" — pulls within approved limits
- **Subscription**: Baseline services (compute, data feeds, API access)
- **ComposablePolicy**: Defines risk limits, allowed protocols, spending categories

## Recommended Tech Stack

- Solana + Anchor
- Tributary SDK for pull streams
- Jupiter V6 for DEX routing
- Pyth/Switchboard for price feeds
- OpenAI/Anthropic for agent reasoning
- Redis + PostgreSQL for agent state
- React dashboard for monitoring

## MVP Scope

- Basic trading agent with daily spend cap
- Jupiter-only routing, 2-3 strategies (momentum, mean-reversion, whale-copy)
- Simple dashboard showing P&L, trades, spend velocity
- Circuit breaker at daily cap
- Buildable in 3 days with Tributary SDK + Jupiter API + LLM

# Non-Technological Requirements

- **Trading strategy development**: Need quant expertise for profitable strategies
- **Risk management framework**: Circuit breakers, position limits, correlation limits
- **Regulatory analysis**: Autonomous trading agents may trigger KYC/AML depending on jurisdiction
- **User education**: Users must understand agent can lose money within approved limits
- **Security auditing**: Agent spending authority is a high-value target

# Potential Risks

- **Agent goes rogue**: Bugs or adversarial manipulation could drain approved limits fast. Need circuit breakers, daily caps, real-time alerts
- **Regulatory gray zone**: Autonomous trading agents may trigger KYC/AML questions
- **User over-trust**: People will treat agent outputs as financial advice. Disclaimers won't help
- **Race to the bottom**: If every agent copies the same strategies, alpha decays to zero. Need diversity incentives
- **Key management**: If delegation authority is compromised, funds drain within cap limits until revoked
