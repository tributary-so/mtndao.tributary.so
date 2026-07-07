---
protocol-version: v0
name: Onchain Payroll Network
summary: Crypto-native payroll that automatically routes salaries, taxes, savings,
  and benefits — not payroll software, a payroll network.
status: "\U0001F4AD ideation"
category: "\U0001F527 Infrastructure & Tools"
tributary_models:
- PayAsYouGo
- Subscription
- Milestone
category_slug: infrastructure-tools
---


# Onchain Payroll Network

## One Line Idea Description

A programmable payroll infrastructure that automatically routes salaries to taxes, savings, investments, and bills — the first crypto-native payroll _network_, not just software.

## Pitch of the Core Idea

Crypto payroll today is painful. Companies manually send USDC to contractor addresses. Employees manually allocate to taxes, savings, expenses. Nobody automates the entire flow. The result is the same fragmented mess that traditional payroll solved decades ago — except crypto somehow made it worse.

This isn't payroll software. It's a **payroll network**. Every company connects once. Every employee delegates once. Tributary handles the rest.

The network effect is the moat: companies that join make it easier for employees to receive payroll. Employees with established routing rules make it easier for new employers to pay them. Integration with stablecoin payroll providers creates an on-ramp from traditional employment.

## Core Mechanics

The company approves a payroll wallet with Tributary. Every pay period, the system pulls from the company treasury and automatically routes:

- **Employee salaries** — primary compensation to each employee's wallet
- **Tax reserves** — 20-30% automatically routed to a tax vault per employee's configured rate
- **Benefits allocations** — insurance premiums, retirement contributions, health savings
- **Bonus pools** — milestone-based or performance-based distributions via Milestone payments
- **Contractor payments** — instant settlement for gig workers, no invoicing delays

On the employee side, incoming salary triggers a cascade of auto-allocations via PayAsYouGo pulls: savings buckets, investment auto-DCA, bill payments, subscription renewals. The employee configures routing rules once. Every paycheck self-organizes.

The architecture supports both employer-initiated pushes and employee-configured pulls — a hybrid model that no current crypto payroll solution offers.

## Psychological Hook and Addictiveness

**Hook:** "Money that organizes itself."

The moment your salary lands and automatically disperses to taxes, savings, investments, and bills without you touching anything — you can't go back to manual. The convenience is permanent. Users describe it as "my money has a brain."

**Why It's Addictive:**

- **Payday ritual**: Watching your salary cascade into 6 different buckets in real-time is viscerally satisfying
- **Zero-effort savings**: Money you never see is money you never spend. Automated savings rates skyrocket
- **Tax confidence**: "20% is already set aside" eliminates the quarterly estimated tax anxiety that plagues every freelancer
- **Network value**: Each new company on the network increases value for every employee already enrolled
- **Financial clarity**: Dashboard showing exactly where every dollar of your salary went, every period

## Brief Market Research

### Crypto Payroll Market

| Metric                              | Value     | Source                          |
| ----------------------------------- | --------- | ------------------------------- |
| Crypto Payroll Market (2025)        | $1.4–2.8B | Dataintelo, GrowthMarketReports |
| Crypto Payroll Market (2034)        | $9–19B    | Multiple analyst consensus      |
| CAGR                                | 21–25%    | Multiple sources                |
| Blockchain Payroll Platforms (2025) | $4B       | HTF Market Intelligence         |
| Blockchain Payroll Platforms (2033) | $9.3B     | HTF Market Intelligence         |
| CAGR (Blockchain segment)           | 28%       | HTF Market Intelligence         |

### Adoption Stats

- **25% of companies globally** now use crypto for payroll (2025), up from 15% in 2023 (Rise Report)
- **Individual adoption tripled**: 3% (2023) → 9.6% (2024) (Pantera Capital survey of 1,600 professionals)
- **75% of Gen Z workers** prefer receiving stablecoins as part of their salaries (AInvest)
- **Stablecoins processed $8.9 trillion** in H1 2025 alone (Rise Report)
- **USDC dominates**: 63% market share vs USDT's 28.6% in payroll (Pantera Capital)

### Cost Savings Driving Adoption

| Metric                 | Traditional Banking  | Crypto Payroll | Savings |
| ---------------------- | -------------------- | -------------- | ------- |
| International wire fee | $35–45 + 2–4% FX     | <$5 flat       | 95%+    |
| Settlement time        | 3–5 business days    | <2 minutes     | 99%+    |
| Cross-border avg fee   | 6.62% of transaction | 0.5–3%         | 85%+    |

### Traditional Payroll Incumbents

| Company                      | 2025 Revenue  | Market Share        |
| ---------------------------- | ------------- | ------------------- |
| ADP                          | $20.6B        | 9.9% (global)       |
| Paychex                      | $5.57B        | 8%                  |
| Gusto                        | $1.0B ARR     | 2% (SMB)            |
| Rippling                     | $570M ARR     | 1% (63% YoY growth) |
| **Total Traditional Market** | **$8.1–8.4B** | —                   |

### Key Insight

Traditional payroll is an $8B+ market growing at 8.3% CAGR. Crypto payroll is a $1.4B market growing at 24%+ CAGR. The traditional giants (ADP, Paychex) are slow-moving incumbents. The crypto-native leaders (Rise, Bitwage) are moving fast but haven't built programmable routing networks — they're still "pay employees in crypto" tools, not true payroll automation.

**The gap:** No one has built the _infrastructure layer_ that makes crypto payroll self-organizing. This is Tributary's opening.

## Business Model

### Revenue Streams

1. **Pay-as-you-go (Transaction Fees)**
   - 0.1–0.5% per payroll routing transaction
   - Micro-fees on auto-DCA, bill payments, savings allocations
   - Lowest barrier to entry for hackathon MVP

2. **Subscription Tiers**
   - Free: Up to 5 employees, basic routing
   - Pro ($29/mo): Up to 50 employees, advanced tax automation, multi-jurisdiction
   - Enterprise (custom): Unlimited employees, API access, dedicated support, compliance dashboards

3. **Milestone-Based Revenue**
   - Performance bonuses and contractor payments trigger milestone fees
   - Automatic compliance checking as a premium service

4. **Value-Added Services**
   - Tax filing automation (partner with tax services)
   - Benefits integration (insurance, retirement providers)
   - Analytics dashboard for financial planning

### Unit Economics (Target)

- **Average payroll transaction:** $3,000
- **Take rate:** 0.3%
- **Revenue per employee per month:** ~$9
- **B2B SaaS economics** with network effects

## Summary of Technical Specifications

### Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    Company Treasury                          │
│  (Multi-sig or Smart Contract Wallet)                       │
└─────────────────┬───────────────────────────────────────────┘
                  │ PayAsYouGo Pull
                  ▼
┌─────────────────────────────────────────────────────────────┐
│              Tributary Payroll Router                        │
│  ┌─────────────┬─────────────┬─────────────┬──────────────┐ │
│  │   Salary    │    Tax      │   Savings   │    Bills     │ │
│  │   Route     │   Vault     │   Auto-DCA  │   Auto-Pay   │ │
│  └─────────────┴─────────────┴─────────────┴──────────────┘ │
└─────────────────┬───────────────────────────────────────────┘
                  │
    ┌─────────────┼─────────────┬─────────────┐
    ▼             ▼             ▼             ▼
┌────────┐  ┌────────┐  ┌────────┐  ┌────────┐
│Employee│  │ Tax    │  │ Savings│  │ Bill   │
│Wallet  │  │ Vault  │  │ Buckets│  │ Payees │
└────────┘  └────────┘  └────────┘  └────────┘
```

### How This Hooks Into Tributary

| Tributary Primitive | Payroll Use Case                                                                              |
| ------------------- | --------------------------------------------------------------------------------------------- |
| **PayAsYouGo**      | Auto-allocation of salary portions (savings, investments, bills) triggered on each pay period |
| **Milestone**       | Bonus distributions, contractor payments triggered by deliverables or performance             |
| **Subscription**    | Recurring benefits payments (insurance, retirement contributions)                             |
| **Pull Payments**   | Employees authorize future employer payments; seamless job transitions                        |

### Recommended Tech Stack

- **Blockchain:** Arbitrum (low fees, Ethereum security) or Base
- **Stablecoins:** USDC (63% payroll market share, Circle partnership potential)
- **Smart Contracts:** Solidity + OpenZeppelin
- **Backend:** Node.js/TypeScript + The Graph for indexing
- **Frontend:** Next.js + wagmi for wallet connections
- **Tax Integration:** Partner with crypto tax services (CoinTracker, Koinly)
- **Identity:** ENS or Worldcoin for employee verification

### MVP Scope (4 Weeks)

**Week 1–2: Core Router**

- Smart contract that splits incoming USDC into configurable routes
- Employee dashboard showing allocation rules
- Company view for bulk payroll sends

**Week 3: Auto-Allocations**

- Savings bucket auto-DCA integration
- Bill payment scheduling
- Tax vault with configurable withholding rates

**Week 4: Network Effects**

- Employee routing profiles (share across employers)
- Integration with Rise/Request Finance APIs for on-ramp
- Basic compliance dashboard

### Non-Technological Requirements

- **Legal structure:** Need to clarify if Tributary is a payment processor or payroll service (different regulatory requirements)
- **Tax compliance:** Automated withholding requires integration with tax authorities or licensed partners
- **Employment classification:** Smart contract vs. employment law distinction per jurisdiction
- **Insurance/partnerships:** Benefits integration requires partnerships with insurance providers

## Potential Risks

- **Regulatory minefield**: Payroll triggers employment law, tax withholding obligations, and labor regulations across every jurisdiction
- **Tax accuracy**: Automated tax reserves are estimates. Wrong estimates create liability for the employee
- **Single point of failure**: If the payroll network goes down on payday, everyone's angry simultaneously
- **Onboarding friction**: Companies won't switch payroll providers lightly. Needs to be 10x better, not marginally better
- **Multi-jurisdiction complexity**: Tax rates, employment classifications, and reporting requirements vary wildly globally
- **Stablecoin risk**: USDC/USDT regulatory status could change; need fallback payment rails

## Open Questions

- Should MVP focus on B2B (company-initiated) or B2C (individual freelancer) first?
- How to handle tax compliance without becoming a licensed payroll provider?
- Partnership vs. build for stablecoin on-ramp integration?
- DAO payroll as beachhead market (simpler regulatory environment)?

## Backlinks

- Related to [[gamified-auto-dca]] (employee savings routing)
- Related to [[Income Waterfall]] (salary distribution)
- Related to [[internet-salary]] (salary as programmable flow)
- Related to [[milestone-escrow-marketplace]] (contractor payments)
