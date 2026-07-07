---
name: Capital Autonomy Layer
summary: 'The meta-use-case: users set financial rules once — risk limits, yield targets,
  allocation ratios, spending caps — and their capital self-operates within those
  boundaries.'
category: "\U0001F527 Infrastructure & Tools"
status: "\U0001F50D research"
protocol-version: v1
tributary_models:
- PayAsYouGo
- Subscription
- Milestone
category_slug: infrastructure-tools
---


# Self-Driving Money: Set Rules Once, Capital Self-Operates

The abstraction layer that lets money operate within user-defined boundaries. Every specific use case (DCA, yield routing, risk management, payroll) is a configuration of this layer. The layer itself is the platform.

# Pitch of the Core Idea

DeFi is powerful but operationally intensive. To participate, users must understand protocols, monitor positions, sign transactions repeatedly, and react to market conditions in real time. This is why DeFi has ~5M active users while traditional finance serves billions. The gap isn't awareness — it's operational overhead.

Tributary v1 with the composable contract closes this gap. Users define _what they want their money to do_, and the protocol handles the execution. Set rules once. Capital self-operates. Always non-custodial. The value proposition shifts from "automated payments" to "self-driving money" — the financial OS for programmable capital on Solana.

# Core Mechanics

1. **User defines a "financial constitution"** — rules, limits, goals encoded as `ComposablePolicy` instances
2. **Pre-validation (Lighthouse)** — Each rule has its own assertion, continuously evaluates:
   - Portfolio within risk tolerance? (LTV check, concentration check)
   - Yield meeting target? (APY comparison)
   - Spending within budget? (period total check)
   - Allocation targets met? (ratio check across positions)
3. **Pull (Token Delegation)** — When a rule triggers, protocol claims tokens for correction
4. **Forward (CPI)** — Executes corrective action: rebalance, re-allocate, hedge, swap, deposit, withdraw

```
USER'S FINANCIAL CONSTITUTION:
  - Risk: LTV never above 70%
  - Yield: USDC always earning > 5%
  - Allocation: 60% USDC, 30% SOL, 10% alt
  - Spending: max $500/week discretionary
  - Savings: 10% of all inflows to staking

EACH RULE = ONE ComposablePolicy:
  Rule violated? → Lighthouse validates → Pull → Forward correction → Rule restored
```

# Psychological Hook and Addictiveness

**"My money has a brain."** The feeling of watching your portfolio maintain itself — rebalancing, harvesting yield, managing risk — without your intervention. Financial planning transforms from chore to automated discipline. Users who experience self-driving money once will not go back to manual.

The constitution becomes a living document. Users refine rules over time, adding new policies as their financial life evolves. It's financial self-knowledge encoded in code.

# Brief Market Research

This is the meta-layer that encompasses all other use cases. Relevant market segments:

| Segment                | Market Size | Growth     |
| ---------------------- | ----------- | ---------- |
| DeFi (overall)         | $50B+ TVL   | Growing    |
| Auto-trading bots      | $22.2B      | 14.8% CAGR |
| Wealth management tech | $4.5B       | 12% CAGR   |
| Portfolio rebalancing  | $2.1B       | 15% CAGR   |

**Key Competitors**:

- **Enzyme Finance**: On-chain portfolio management, vault-based, but manual configuration
- **Yearn Finance**: Yield optimization vaults, but single-strategy, not multi-rule
- **Coherent Finance**: DeFi portfolio tracking, but no autonomous execution
- **Zapper**: Portfolio tracking, tax reporting, but no policy-based automation
- **DeFi Saver**: Automated leverage management for Aave/Compound, single-protocol focus

**None provide a cross-protocol, policy-based autonomy layer with Lighthouse validation.**

# Business Model

- **Platform fee**: 0.5-2% of managed capital annually (AUM-based)
- **Transaction fee**: 0.1-0.5% on each corrective action executed
- **Premium policies**: Advanced users pay for complex multi-rule strategies
- **White-label licensing**: Wallet apps integrate the autonomy layer for their users
- **Data insights**: Anonymized policy performance data for institutional research

# Summary of Technical Specifications

## Architecture

- Financial constitution engine (ComposablePolicy management)
- Lighthouse validation layer (per-rule assertions)
- Token delegation system (per-rule caps)
- Forward CPI routing (multi-protocol execution)
- State monitoring (portfolio tracking, condition evaluation)
- User dashboard (constitution editor, policy performance)

## How This Hooks Into Tributary

- **PayAsYouGo**: Dynamic corrective actions within policy caps
- **Subscription**: Ongoing monitoring and management fees
- **Milestone**: Milestone-based policy activation/deactivation
- **ComposablePolicy**: Core primitive — each rule is a policy
- **Lighthouse**: Validation for each rule's trigger condition
- **Forward**: CPI to whitelisted protocols for execution

## Recommended Tech Stack

- Solana + Anchor
- Tributary SDK (full stack: Subscription, PayAsYouGo, Milestone, ComposablePolicy, Lighthouse, Forward)
- Jupiter V6 for swaps
- Pyth/Switchboard for price feeds
- Kamino, MarginFi, Meteora for yield
- React/Next.js for constitution editor

## MVP Scope

- Basic constitution: 3-5 rules (allocation, risk, yield)
- Single-protocol execution (Jupiter for swaps)
- Simple dashboard showing policy status and corrections
- Manual rule creation and editing
- Buildable in 3 days with full Tributary v1 SDK

# Non-Technological Requirements

- **Financial advisory compliance**: May trigger regulatory requirements in some jurisdictions
- **User education**: Must understand that rules can be wrong and automate losses
- **Insurance/auditing**: Smart contract risk concentration across whitelisted programs
- **Wallet integration**: Must work with major Solana wallets
- **Documentation**: Extensive docs for rule creation and policy configuration

# Potential Risks

- **Complexity management**: Full constitution with 15 policies is complex to configure, monitor, debug. UX determines adoption
- **Responsibility shift**: "Set rules and let system run" sounds great until rules are wrong. User is responsible for constitution
- **Regulatory uncertainty**: Autonomous capital management blurs line between user control and automated financial advisory
- **Smart contract risk concentration**: If many users flow through same whitelisted programs, bug in one affects all
