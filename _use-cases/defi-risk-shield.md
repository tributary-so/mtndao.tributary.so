---
name: DeFi Risk Shield
summary: Automated risk management for DeFi positions — auto-repay loans when LTV
  spikes, exit LPs when impermanent loss exceeds thresholds. Non-experts get professional-grade
  protection.
category: "\U0001F4B0 DeFi & Trading"
status: "\U0001F50D research"
protocol-version: v1
tributary_models:
- PayAsYouGo
category_slug: defi-trading
---


# Your DeFi Positions Defend Themselves

Lighthouse continuously evaluates position health against configurable thresholds. When danger appears, the protocol executes corrective actions — repay, exit, rebalance — without the user signing anything.

# Pitch of the Core Idea

DeFi positions require constant monitoring. A lending position can get liquidated while you sleep. An LP position can bleed impermanent loss during a volatility spike. Most users don't have the tools, time, or expertise to manage this actively. The onchain risk curator market reached $7B AUM in early 2026, with Steakhouse ($1.53B), Sentora ($1.34B), and Gauntlet ($1.29B) controlling 70%. Yet these serve institutions, not retail.

Tributary v1 enables automated risk management: Lighthouse continuously evaluates position health, and when danger appears, the protocol executes corrective actions. Users approve protective strategies at setup; the protocol executes within those bounds. Non-experts get institutional-grade protection.

# Core Mechanics

1. **Risk management service configures ComposablePolicy** instances encoding protective actions
2. **Pre-validation (Lighthouse)** — Evaluates position health against thresholds:
   - LTV ratio below safety margin?
   - Impermanent loss exceeds max tolerance?
   - Collateral value dropped below minimum?
   - Oracle price moved beyond volatility band?
3. **Pull (Token Delegation)** — Claims tokens for corrective action (USDC for repayment, LP token for exit)
4. **Forward (CPI)** — Executes corrective action: repay loan, withdraw LP, swap to stablecoin

```
WHEN (condition: LTV > 75% danger threshold)
  → VALIDATE (Lighthouse: assert MarginFi LTV for user position > 0.75)
  → PULL (repayment amount USDC)
  → FORWARD (repay loan on MarginFi → reduce LTV to safe level)
```

# Psychological Hook and Addictiveness

**"I sleep while my positions defend themselves."** The anxiety reduction is enormous. No more 3am wake-up calls from liquidation alerts. No more checking positions every hour during volatility. The shield runs continuously, silently, effectively.

**Risk dashboard**: Real-time view of all protected positions, threshold status, corrective actions taken. **Protection history**: Log of every prevented liquidation, every IL mitigation — tangible proof of value. **Confidence to deploy more capital**: With protection in place, users allocate more to DeFi, earning higher yields.

# Brief Market Research

| Metric                   | Data       |
| ------------------------ | ---------- |
| Onchain Risk Curator AUM | $7B (2026) |
| Steakhouse AUM           | $1.53B     |
| Sentora AUM              | $1.34B     |
| Gauntlet AUM             | $1.29B     |
| DeFi TVL                 | $50B+      |
| Lending Protocol TVL     | $20B+      |

**Key Competitors**:

- **Gauntlet**: Risk simulation for protocols, $1.29B AUM, institutional focus
- **Steakhouse**: RWA risk curation, $1.53B AUM, Coinbase backend
- **Sentora**: AI-driven risk models, $1.34B AUM, Kraken backend
- **DeFi Saver**: Single-protocol automation for Aave/Compound, but no Lighthouse validation
- **Antidote**: Margin call protection on Uniswap v4, but EVM-only

**None provide non-custodial, Lighthouse-validated risk management across Solana DeFi.**

# Business Model

- **Protection fee**: 0.5-2% of protected capital annually
- **Execution fee**: 0.1-0.5% on each corrective action
- **Premium thresholds**: Advanced risk parameters for sophisticated users ($20-100/mo)
- **Institutional tier**: $500-2,000/mo for portfolio-wide risk management
- **Insurance pool**: Users contribute to mutual insurance pool for extreme events

# Summary of Technical Specifications

## Architecture

- Position monitor (reads lending/LP protocol state)
- Lighthouse validation layer (evaluates risk thresholds)
- Corrective action engine (repay, exit, rebalance)
- Token delegation system (pull for corrective actions)
- Forward CPI routing (execute corrective actions)
- Risk dashboard (position health, threshold status, history)

## How This Hooks Into Tributary

- **PayAsYouGo**: Pulls tokens for corrective actions within delegated cap
- **Lighthouse**: Validates risk thresholds against position state
- **Forward**: CPI to lending/LP/DEX protocols for corrective actions
- **ComposablePolicy**: Defines risk thresholds, corrective actions, delegation caps

## Recommended Tech Stack

- Solana + Anchor
- Tributary SDK (PayAsYouGo + Lighthouse + Forward)
- MarginFi, Kamino, Meteora SDK for position reading
- Pyth/Switchboard for price feeds
- Keeper service for threshold monitoring
- React dashboard for risk visualization

## MVP Scope

- Single-protocol risk management (MarginFi lending)
- Auto-repay on LTV threshold breach
- Basic risk dashboard
- Simple keeper service
- Buildable in 2-3 days with Tributary v1 SDK + MarginFi

# Non-Technological Requirements

- **Keeper service reliability**: Off-chain keeper triggers execution. Must be fast, reliable, decentralized
- **Protocol integration**: Need deep integration with lending/LP protocols for position state reading
- **Threshold calibration**: Over-protection triggers too early; under-protection misses danger. Key UX challenge
- **User education**: Users must understand protection is not guarantee — extreme events may still cause losses
- **Insurance considerations**: May need mutual insurance pool for black swan events

# Potential Risks

- **Validation lag**: Keeper service triggers execution off-chain. If slow, position may liquidate between threshold-cross and execution
- **Cascade risk**: During market-wide crashes, many positions cross thresholds simultaneously. Gas spikes may delay protective actions
- **Over-protection**: Aggressive thresholds trigger protective actions too early — exiting positions that would have recovered
- **Protocol-specific account layouts**: Each lending/LP protocol has different account structures. Lighthouse assertions must be protocol-specific
