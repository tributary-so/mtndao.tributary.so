---
name: Dead Man's Switch Inheritance
summary: Authorize a heir to claim your wallet after a countdown — stay alive, push
  the deadline. Go dark, they inherit.
category: "\U0001F527 Infrastructure & Tools"
status: "\U0001F50D research"
protocol-version: v0
tributary_models:
- Milestone
- PayAsYouGo
category_slug: infrastructure-tools
---


# Your Crypto Outlives You

Billions in crypto are lost every year — not to hacks, not to rugs, but to death. Private keys die with their owners. This is different: you don't share your keys, you don't hire a lawyer, you install a time-locked policy.

# Pitch of the Core Idea

The crypto inheritance market is projected to reach $26B by 2025, part of the broader $29.5B digital legacy industry by 2030 (18.6% CAGR). $6T in digital assets will transfer between generations. Yet every solution has the same flaw: they require you to trust someone with your keys while alive, or demand legal infrastructure that defeats the purpose of decentralized finance.

This is different. You authorize a designated heir — family member, friend, charity — to empty your wallet after a countdown expires. The countdown is long: 5-10 years. As long as you're alive and active, you push the deadline forward with a single signature. Any on-chain activity counts as proof of life: swap, transfer, DeFi interaction, even micro-payment. The heir never has access until the clock runs out. You never surrender custody. The smart contract is the executor.

# Core Mechanics

1. **Set the heir**: Specify wallet address that can claim after deadline
2. **Set the countdown**: 10 years from now, heir's claim window opens
3. **Stay alive, push the deadline**: Any on-chain activity resets/extends timer
4. **Go dark, they inherit**: If deadline passes without reset, heir submits claim. Entire wallet balance transfers automatically

**Configuration options**:

- Multiple heirs with different percentages
- Cascading deadlines (primary claims within 5 years, backup after)
- Conditional inheritance (heir gets funds only if their wallet has activity — proving they're alive)
- Alerts: 90 days, 30 days before deadline expiry via Telegram

# Psychological Hook and Addictiveness

**"Your crypto outlives you, and YOU decide where it goes."** Hits something primal. People don't just want to protect wealth — they want to control what happens after they're gone. This offers a third path: program your intent into the chain and let the code execute when you can't.

**Annual "push the deadline" ritual**: A moment of reflection — "I'm still here, my assets are still mine, my plan is still in place." Like renewing a promise to yourself and heirs simultaneously. **Heir engagement**: Heirs monitor the countdown, creating unique relationship with the protocol. **Refinement loop**: Users tweak allocations, add heirs, adjust deadlines — becomes a living document evolving with life changes.

# Brief Market Research

| Metric                       | Data                      |
| ---------------------------- | ------------------------- |
| Crypto Inheritance (2025)    | $26B                      |
| Digital Legacy Market (2030) | $29.5B                    |
| CAGR                         | 18.6%                     |
| Digital Assets Transferring  | $6T                       |
| Crypto Ownership (US adults) | 18% (up from 12% in 2022) |

**Key Competitors**:

- **Cipherwill**: Digital will platform, web-only, encrypted vault, but not crypto-native
- **Inheriti**: Blockchain-based inheritance using Shamir's Secret Sharing, VeChain/Ethereum/Polygon, but complex
- **DGLegacy**: Password manager + inheritance, heartbeat monitoring, $5.99/mo
- **AbsentKey**: Dead man's switch without check-ins, recipient-initiated requests
- **Safe (Gnosis)**: Multisig with social recovery, but requires trusted signers while alive

**None provide non-custodial, time-locked inheritance without trusted intermediaries.**

# Business Model

- **Setup fee**: $50-200 one-time for policy creation
- **Annual maintenance**: $10-50/yr for monitoring and alert services
- **Premium features**: Multiple heirs, cascading deadlines, conditional inheritance ($100-500)
- **Estate planning integration**: $200-500 for lawyer-reviewed policy templates
- **Heir verification**: $20-50 per heir identity verification

# Summary of Technical Specifications

## Architecture

- Time-locked policy engine (ComposablePolicy with countdown + reset mechanism)
- Activity monitor (detects on-chain activity from owner's wallet)
- Alert system (Telegram notifications at 90/30/7 days before deadline)
- Claim submission interface (heir submits claim after deadline)
- Multi-heir support (percentage-based distribution)
- Emergency controls (owner can pause/revoke at any time)

## How This Hooks Into Tributary

- **Milestone**: Time-based release condition (deadline expiry)
- **PayAsYouGo**: Activity monitoring for "proof of life" detection
- **ComposablePolicy**: Defines heir addresses, percentages, deadlines, conditions

## Recommended Tech Stack

- Solana + Anchor
- Tributary SDK (Milestone + PayAsYouGo)
- Activity monitoring service (watches owner's wallet)
- Telegram bot for alerts
- React interface for policy management
- On-chain clock/timestamp verification

## MVP Scope

- Single heir, single countdown (10 years)
- Activity-based deadline reset
- Basic alert system (email/Telegram)
- Claim submission interface
- Buildable in 2-3 days with Tributary SDK

# Non-Technological Requirements

- **Legal review**: On-chain wills have no established legal precedent. Family members could challenge in court regardless of smart contract
- **Estate planning integration**: Need to work with existing estate planning frameworks
- **User education**: Users must understand key management — if keys are lost before death conditions trigger, protocol is worthless
- **Heir communication**: Heirs need to know about the policy and how to claim
- **Regulatory awareness**: Inheritance law is jurisdictional and heavily regulated

# Potential Risks

- **Premature claim exploit**: If reset mechanism has bug, heir could claim while owner is alive. Multiple confirmation layers essential
- **Lost access while alive**: Owner loses key but is alive. Countdown runs out, heir inherits. Needs "pause" mechanism via alternative verification
- **Heir wallet compromise**: Designated heir's wallet gets drained before claiming. Needs claim-window time limits and revocation options
- **Legal ambiguity**: On-chain wills have no established legal precedent. Family members could challenge regardless of smart contract
- **Regulatory collision**: Inheritance law is jurisdictional and heavily regulated. Trustless protocol bypassing probate will attract legal attention
- **Countdown anxiety**: Some users find ticking clock psychologically distressing. UX must emphasize user control, not mortality
