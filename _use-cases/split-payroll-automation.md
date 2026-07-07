---
name: Split Payroll Automation
summary: Companies pay employees in USDC/SOL on schedule with automatic splits — taxes
  to a vault, savings into yield, bonuses swapped to volatile assets — all from one
  treasury delegation, triggered by the payroll service, validated by Lighthouse.
category: "\U0001F527 Infrastructure & Tools"
status: "\U0001F50D research"
protocol-version: v1
tributary_models:
- Subscription
- Milestone
validation: lighthouse
forward_targets:
- SPL Transfer
- Jupiter V6
- Kamino Vault
category_slug: infrastructure-tools
---


# Companies pay employees in USDC/SOL on schedule with automatic splits — all from one treasury delegation

# Real payroll is multi-destination: salary to wallet, taxes to withholding, retirement into yield, bonus swapped to SOL

# Core Mechanics

A payroll provider configures per-employee `ComposablePolicy` instances that encode the compensation structure:

1. **Pre-validation (Lighthouse)** — Asserts the employee is still active (on-chain employment registry or HR API → oracle). Validates FX oracle rates if payroll is denominated in one currency but paid in another. Checks the pay period has elapsed (`ScheduleConfig` timing).
2. **Pull (Token Delegation)** — Claims the total gross payroll amount from the company treasury's token account. One pull, not four.
3. **Forward (CPI)** — Routes the pulled amount to multiple destinations. For v1, this executes as sequential forward CPIs within a single policy or as multiple chained policies:
   - Net salary → SPL transfer to employee wallet
   - Tax withholding → SPL transfer to tax vault
   - Retirement contribution → Jupiter swap USDC→SOL + stake
   - Bonus accrual → deposit into Kamino yield vault

```
WHEN (schedule: bi-weekly)
  → VALIDATE (Lighthouse: employee active + FX rate valid)
  → PULL ($5,000 USDC from treasury)
  → FORWARD 1: $3,500 → employee wallet (SPL transfer)
  → FORWARD 2: $1,000 → tax vault (SPL transfer)
  → FORWARD 3: $500 → Kamino yield vault (CPI deposit)
```

The payroll service triggers execution every period. The company treasury signed once. Employees receive their splits automatically.

### Business Scenarios

- **Web3 company payroll**: 50 employees, bi-weekly. Each has a split policy (net + tax + savings). Payroll service triggers all 50 policies in one batch transaction. Total signing: one treasury delegation, set up once.
- **DAO contributor compensation**: Contributors paid in USDC from the DAO treasury. Milestone-based policies release payment when GitHub PRs merge (Lighthouse validates the on-chain attestation). Automatic split: 80% to contributor, 20% to DAO treasury buffer.
- **Cross-border payroll**: Company in one jurisdiction pays contractors globally. Lighthouse validates FX rates from Pyth oracle. Payment denominated in USDC, optionally auto-swapped to local stablecoin if available on Solana.
- **Performance-adjusted payroll**: Base salary is fixed. Bonus component is variable — Lighthouse checks a performance oracle (revenue, KPIs) and the bonus forward CPI only executes if the threshold is met.

### Trust Boundary Design

- **Treasury delegation cap**: The company delegates a specific amount covering N pay periods. Lighthouse checks remaining delegation before each pull. When delegation runs low, the payroll service notifies the company to re-delegate.
- **Employee status gate**: Lighthouse validates employment status against an on-chain registry or HR oracle. Terminated employees' policies fail validation — no payments to ex-employees.
- **Immutable splits**: Once a policy is created, the forward destinations and split ratios are fixed in the `ForwardConfig`. An employee cannot redirect their own tax withholding. The company must create a new policy to change splits.
- **Payroll service scope**: The gateway signer (payroll service) can trigger execution but cannot modify amounts, destinations, or schedules. Their only power is "execute now" or "don't."

### Abuse Prevention

- **Hard caps per period**: `max_amount_per_period` in the schedule prevents a compromised payroll service from draining the treasury in one execution.
- **Allowlist enforcement**: Forward targets are whitelisted. The payroll service cannot route to an unlisted program.
- **Audit trail**: Every payroll execution is on-chain — timestamp, amount, employee, splits, forward programs. Full transparency for accounting and compliance.
- **Multi-sig treasury**: The treasury wallet itself can be a Squads multisig. Tributary pulls from the multisig's token account — the multisig members approved the delegation, Tributary executes within that approval.

# Psychological Hook

**"Payroll just works."** The relief of eliminating manual payroll processing — no more spreadsheets, no more manual transfers, no more reconciling split payments. Financial operations transform from a chore into an automated system.

- **Set-and-forget**: Configure once, execute every pay period automatically
- **Transparency**: Every split is on-chain and verifiable
- **Compliance**: Audit trail for tax and regulatory requirements
- **Employee satisfaction**: Automatic splits mean employees don't have to manually manage tax payments, retirement contributions

# Brief Market Research

Crypto payroll exists on Solana, but no solution combines multi-destination splitting with protocol-level validation.

**Current alternatives:**

- **Rise**: Crypto payroll platform — Solana integration, but single-destination payments only
- **expaynse**: Privacy-first streaming payroll — focuses on privacy, not multi-destination splits
- **Paycheck by WCLAW**: Crypto payroll — basic payment processing, no automatic splits
- **Pagga**: AI CFO — financial management, not payroll-specific
- **Request Finance**: Crypto invoicing — focuses on invoicing, not automated payroll splits
- **Superfluid**: Streaming payments — continuous flow, not split-based routing

**The gap**: Every existing crypto payroll solution is single-destination (send USDC to employee). None enable automatic splitting across taxes, savings, and bonuses with protocol-level validation. Tributary's v1 composable contract with Lighthouse validation solves this natively.

# Business Model

**Revenue streams:**

- Per-employee fee: $5-20 per employee per pay period
- Platform subscription: $100-1,000/month for payroll dashboard and management
- Premium features: Multi-currency support, advanced analytics, compliance tools ($50-500/month)
- Integration fees: HR systems paying for payroll integration

**Unit economics:**

- 100 companies × 50 employees average × $10 per employee per month = $50,000/month
- 50 premium companies × $200/month = $10,000/month
- Total: ~$60,000/month at scale

# Technical Specifications

## Architecture

```
Payroll Service → Configures per-employee policies
  ↓
Lighthouse → Validates employee status, FX rates, schedule
  ↓
Tributary Pull → Claims gross payroll from treasury
  ↓
Forward CPI → Routes to multiple destinations (net, tax, savings)
  ↓
Employee Wallet → Receives net salary
  ↓
Tax Vault → Receives withholding
  ↓
Yield Strategy → Receives retirement contribution
```

## How This Hooks Into Tributary

- **v1 Composable Contract**: Direct implementation — `ComposablePolicy` with schedule, validation, and forward targets
- **Lighthouse integration**: Critical — employee status validation, FX rate checks, schedule enforcement
- **Guardian module**: Rate limiting, fraud prevention, emergency stops for payroll execution
- **Loyalty module**: Volume discounts for large companies, employee loyalty rewards

## Recommended Tech Stack

- **Frontend**: Next.js payroll dashboard with employee management
- **Backend**: Rust payroll engine, Redis for scheduling, PostgreSQL for employee/company data
- **Database**: PostgreSQL for payroll data, Redis for real-time validation caching
- **Solana**: Tributary v1 program, Lighthouse for validation, Jupiter for swaps, Kamino for yield
- **Integrations**: HR system APIs, accounting software, tax authority oracles

## MVP Scope

1. Basic employee policy configuration
2. Single destination (net salary to employee)
3. Lighthouse validation for employee status
4. Simple schedule (bi-weekly)
5. Basic payroll dashboard

# Non-Technological Requirements

- Legal review for payroll tax withholding compliance
- HR system integration partnerships
- Employee onboarding documentation
- Tax advisor consultation for split configuration
- Multi-jurisdiction compliance framework

# Potential Risks

- **Regulatory complexity**: Payroll tax withholding rules vary by jurisdiction. The split policy encodes the company's chosen structure but doesn't enforce compliance — that's the company's responsibility.
- **FX volatility**: If payroll is denominated in one currency but paid in another, FX rate changes between periods affect real cost. Lighthouse can assert rate bounds but cannot eliminate FX risk.
- **Key management**: The treasury wallet's delegation is the single point of failure. If the treasury key is compromised, the attacker can create new policies (not just execute existing ones). Multi-sig treasury is strongly recommended.
