---
name: Conditional Payment Router
summary: Escrow-like conditional payments without custom contracts — Lighthouse enforces
  oracle conditions, then the protocol pulls and forwards.
category: "\U0001F527 Infrastructure & Tools"
status: "\U0001F50D research"
protocol-version: v1
tributary_models:
- Milestone
- PayAsYouGo
category_slug: infrastructure-tools
---


# If-This-Then-That for Money

Every escrow, every milestone payment, every conditional release today requires either a custom smart contract per use case or a trusted intermediary. The v1 composable contract eliminates both: Lighthouse evaluates conditions, and if they hold, the protocol pulls and forwards. No escrow contract. No intermediary. No funds locked.

# Pitch of the Core Idea

Traditional escrow requires custom contracts per use case or trusted intermediaries holding funds. Both are expensive, slow, and custodial. The conditional payment market underpins $2.14B in crowdfunding (2024), growing to $5.53B by 2030 at 17.6% CAGR. Kickstarter alone has facilitated $8B+ in pledges from 250K+ funded projects.

Tributary's v1 composable contract enables conditional payments without custom contracts: Lighthouse evaluates arbitrary on-chain conditions, and if they hold, the protocol pulls and forwards. The validation CPI _is_ the escrow logic. Supplier gets paid only when oracle confirms delivery. Trader's stop-loss fires only when price feed confirms threshold. Contractor gets paid only when GitHub milestone is verified.

# Core Mechanics

1. **User configures conditional payment policies** with release conditions gated by external state
2. **Pre-validation (Lighthouse)** — Evaluates release condition against on-chain state:
   - Oracle price within range?
   - Governance proposal passed?
   - Delivery confirmation posted?
   - Balance threshold met?
   - Time window open?
3. **Pull (Token Delegation)** — Only if validation passes, claims approved amount
4. **Forward (CPI)** — Routes to recipient or program (SPL transfer, DEX swap)

```
WHEN (condition: oracle confirms delivery / price target / KPI met)
  → VALIDATE (Lighthouse: assert condition holds on-chain)
  → PULL (approved amount)
  → FORWARD (transfer to supplier, or swap on DEX)
```

# Psychological Hook and Addictiveness

**"My money only moves when conditions are met."** Complete control over fund release. No trust required. No intermediary. No counterparty risk. The satisfaction of programmable money that does exactly what you told it to do, nothing more.

**For suppliers**: "I get paid automatically when I deliver." No invoicing, no chasing payments, no 30-day net terms. **For buyers**: "I only pay when I receive." No escrow fees, no dispute resolution overhead for the happy path.

# Brief Market Research

| Metric                      | Data                 |
| --------------------------- | -------------------- |
| Crowdfunding Market (2024)  | $2.14B               |
| Projected (2030)            | $5.53B               |
| CAGR                        | 17.6%                |
| Kickstarter Total Pledges   | $8B+                 |
| Kickstarter Funded Projects | 250K+                |
| Escrow Market               | $4.5B+ (traditional) |

**Key Competitors**:

- **Kickstarter/Indiegogo**: Custodial, 5-8% fee, platform-mediated disputes
- **Escrow.com**: Traditional escrow, 0.88-3.25% fee, custodial, slow
- **Milestone-based contracts**: Custom Anchor/Rust per use case, expensive to build
- **Request Network**: Invoicing protocol, but no conditional release logic
- **Superfluid**: Streaming payments, but no conditional validation

**None combine oracle-validated conditions with non-custodial pull-based execution.**

# Business Model

- **Gateway fee**: 0.5-2% on each conditional payment executed
- **Policy creation fee**: $10-50 per conditional payment policy (one-time)
- **Oracle integration fee**: $100-500/mo for custom oracle connections
- **Enterprise tier**: $500-2,000/mo for high-volume conditional payment workflows
- **Dispute resolution**: $50-200 per dispute (when conditions are ambiguous)

# Summary of Technical Specifications

## Architecture

- Policy engine (condition definitions, release triggers)
- Lighthouse validation layer (on-chain condition evaluation)
- Oracle integration (Pyth, Switchboard, custom oracles)
- Token delegation system (pull authorization)
- Forward CPI routing (SPL transfer, DEX swap)
- Policy dashboard (condition status, payment history)

## How This Hooks Into Tributary

- **Milestone**: Condition-based release of milestone payments
- **PayAsYouGo**: Continuous conditional payments (e.g., per-delivery)
- **Lighthouse**: Core validation primitive for condition evaluation
- **Forward**: CPI to recipient programs
- **ComposablePolicy**: Defines condition, amount, recipient, timing

## Recommended Tech Stack

- Solana + Anchor
- Tributary SDK (Milestone + Lighthouse + Forward)
- Pyth/Switchboard for oracle data
- Custom Lighthouse assertions for complex conditions
- React dashboard for policy management
- Webhook system for off-chain condition triggers

## MVP Scope

- Oracle-gated conditional payments (price threshold)
- Simple condition: "Pay when price > $X"
- SPL transfer to recipient
- Basic dashboard showing policy status
- Buildable in 2 days with Tributary v1 SDK + Pyth

# Non-Technological Requirements

- **Oracle partnerships**: Pyth, Switchboard integration for reliable price feeds
- **Condition specification**: Need clear language for expressing conditions
- **Legal framework**: Conditional payments may have different legal treatment than escrow
- **Dispute resolution**: Need mechanism for ambiguous conditions
- **Industry adoption**: Supply chain partners, freelance platforms for real-world use cases

# Potential Risks

- **Oracle manipulation**: Compromised oracle feed triggers false payments. Use decentralized oracles with staleness checks
- **Condition ambiguity**: Poorly-specified assertions may pass in unintended states. Assertion design is critical security surface
- **Gas cost of validation**: Validation CPI adds compute overhead. For micro-transactions, may be significant
- **Single condition per policy**: v1 supports one validation CPI per execution. Multi-condition logic must be encoded within assertion
