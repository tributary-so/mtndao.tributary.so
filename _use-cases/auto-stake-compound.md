---
name: Auto-Stake & Auto-Compound
summary: Staking rewards and yield that reinvest themselves — never leave a reward
  sitting idle, never manually compound again.
category: "\U0001F4B0 DeFi & Trading"
status: "\U0001F50D research"
protocol-version: v0
tributary_models:
- PayAsYouGo
- Subscription
category_slug: defi-trading
---


# Your Staking Position Grows Itself

Rewards detected, pulled, and routed back into the staking position automatically on every accrual. The position compounds itself. No signature, no reminder, no idle rewards.

# Pitch of the Core Idea

Every staking position leaks value the same way: rewards accrue, sit idle, and stop earning. The optimal move — compound immediately, every epoch — is obvious and almost nobody does it. Manual compounding is tedious, gas-sensitive, and easy to forget. The gap between theoretical and realized APY is pure drag.

Solana liquid staking TVL crossed $20B in Q2 2026. Jito controls 44% of the LST market with $2.3B in JitoSOL. Marinade has $924M in mSOL. The staking base APR sits around 6.8%, with JitoSOL adding 0.8% MEV yield on top. Yet liquid staking penetration is only 7-21% of total staked SOL — massive room for growth. The problem isn't staking infrastructure. It's that rewards sit idle between manual compound events.

This use case closes the gap. The same `ComposablePolicy` + CPI routing layer that powers Auto-DCA powers this — the only difference is the trigger (reward threshold vs. schedule) and the destination (back into position vs. target asset).

# Core Mechanics

1. **User delegates pull authority** over their rewards position and configures reinvestment policy
2. **Observe** — system watches accrued rewards on staking positions (Marinade, Jito, Kamino, or any yield position with readable rewards state)
3. **Trigger** — when rewards cross a threshold (> 0.1 SOL, or every epoch), Tributary pulls the accrued amount
4. **Route** — pulled rewards flow back into the stake (compound) or into chosen destination asset via DEX swap (diversify)
5. **Land** — reinvested capital is back in the position, earning on top of itself

For the diversify path: SOL staking rewards swept into USDC, or JitoSOL rewards DCA'd into a diversified bag. User defines the policy once; system executes every epoch.

# Psychological Hook and Addictiveness

**"My stake grows itself."** The visceral satisfaction of opening a staking position after three months and seeing a balance materially larger than the sum of deposits — with zero manual compounding. The compounding curve is the product. Users who experience uninterrupted exponential growth once will not go back to manual.

**Closed drag** — the gap between theoretical and realized APY closes to near-zero. Users see the difference within weeks. **Zero-effort optimization** — the single highest-leverage action on any staking position becomes the default, not a chore. **Reward diversification** — sweep staking rewards into a different asset turns every stake into an automatic DCA, for free.

# Brief Market Research

| Metric                     | Data                |
| -------------------------- | ------------------- |
| Solana Liquid Staking TVL  | $20B+ (Q2 2026)     |
| JitoSOL Market Cap         | $2.3B               |
| mSOL Market Cap            | $924M               |
| SOL Staking Base APR       | ~6.8%               |
| JitoSOL Total APR          | ~7.6% (with MEV)    |
| Liquid Staking Penetration | 7-21% of staked SOL |

**Key Competitors**:

- **Jito** (44% LST share): Largest Solana LST, MEV-boosted yields, 202 validators
- **Marinade Finance** (17% share): First Solana LST, 100+ validator delegation, native staking option
- **Jupiter/JupSOL** (12% share): Fast-growing, launched 2025, integrated with Jupiter DEX
- **Sanctum**: Custom LST creation, Infinity Pool for LST liquidity

**None offer auto-compounding.** All require manual claim + reinvest. Auto-compound is a missing primitive.

# Business Model

- **Gateway fee**: 0.3-0.5% on each compound event routed through Tributary
- **Performance fee**: 5-10% of the "improved yield" (difference between auto-compound and manual)
- **Premium strategies**: Advanced users pay for multi-protocol compounding (stake → lend → LP rotation)
- **Yield optimization**: Protocol takes cut of improved execution from multi-venue routing

# Summary of Technical Specifications

## Architecture

- Reward monitoring service (watches staking program accounts)
- Threshold trigger engine (gas-aware, not just time-based)
- Tributary policy engine with ComposablePolicy per user
- DEX routing for diversification path (Jupiter)
- Staking program integrations (Jito, Marinade, Kamino)

## How This Hooks Into Tributary

- **PayAsYouGo**: Pulls accrued rewards when threshold crossed
- **ComposablePolicy**: Defines compound vs. diversify rules, threshold amounts, target assets
- **Forward**: CPI back to staking program (compound) or to DEX (diversify)

## Recommended Tech Stack

- Solana + Anchor
- Tributary SDK for pull streams
- Jito/Marinade SDK for staking interaction
- Jupiter API for diversification swaps
- Pyth/Switchboard for price feeds (gas-aware threshold)

## MVP Scope

- Single-stake auto-compound (JitoSOL or mSOL)
- Threshold-based trigger (> 0.05 SOL rewards)
- Compound back into same position
- Basic dashboard showing compound history and improved yield
- Buildable in 2 days

# Non-Technological Requirements

- **Staking program partnerships**: Jito, Marinade integration coordination
- **Tax compliance**: Every compounding event is taxable. Automated tax reporting mandatory
- **Gas optimization**: Compound events must be gas-aware — threshold triggers must consider gas vs. reward
- **Validator communication**: Users need to understand auto-compound doesn't protect against slashing

# Potential Risks

- **Reward-state readability** — not every staking program exposes rewards cleanly. Integration breadth determines coverage
- **Gas vs. reward** — at low reward amounts, gas can exceed compounded value. Threshold triggers must be gas-aware
- **Validator/protocol risk passthrough** — auto-compounding doesn't protect against slashing or protocol exploits. Users may conflate "automated" with "safe"
- **Tax complexity** — every compounding event is taxable in many jurisdictions. Automated tax reporting is mandatory, not optional
