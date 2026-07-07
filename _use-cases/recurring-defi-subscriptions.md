---
name: Recurring DeFi Subscriptions
summary: True recurring payments where a business pulls tokens from a user and forwards
  them into a DeFi position — auto-staking fees, vault management fees, recurring
  DCA into protocol positions — all from one delegation, triggered by a third party
  without per-transaction signing.
category: "\U0001F4B0 DeFi & Trading"
status: "\U0001F50D research"
protocol-version: v1
tributary_models:
- Subscription
- PayAsYouGo
validation: lighthouse
forward_targets:
- Jupiter V6
- Meteora DLMM
- Raydium AMM
category_slug: defi-trading
---


# True recurring payments where a business pulls tokens and forwards them into DeFi positions

# Today on Solana, "subscriptions" are fake recurring payments — they require user signing or are custodial

# Core Mechanics

A business configures a `ComposablePolicy` with three layers:

1. **Pre-validation (Lighthouse)** — Before any token moves, Lighthouse asserts the user's account still has sufficient balance, the delegation is still active, and any business-defined preconditions hold (e.g., "user's portfolio hasn't been frozen by compliance").
2. **Pull (Token Delegation)** — The protocol claims the approved amount from the user's SPL token account. Non-custodial — funds were in the user's wallet until this exact moment. Limited to TokenProgram tokens (99% of Solana tokens).
3. **Forward (CPI to DeFi)** — The pulled tokens route through a whitelisted program: swap via Jupiter, deposit into a Meteora LP, stake via Raydium. The output lands in the user's wallet. The business never touches the funds.

```
WHEN (schedule: monthly) → VALIDATE (Lighthouse: balance + delegation active) → PULL ($50 USDC) → FORWARD (Jupiter swap USDC→SOL) → LAND (user wallet)
```

A third party — the business, a keeper bot, or any gateway signer — triggers execution. The user doesn't sign per-transaction. The business doesn't hold keys. The protocol enforces the boundaries.

### Business Scenarios

- **Auto-staking service**: Charges 10 USDC/month, automatically stakes the user's SOL position and compounds rewards. The fee is pulled and forwarded to the service; the staking action is a separate forward CPI.
- **Vault management**: A yield vault charges a 0.5% management fee, pulled quarterly from the user's USDC and forwarded into the vault's deposit position.
- **Recurring DCA into LP**: User wants $200/month split into a USDC-SOL LP position. Business configures: pull $200 → swap half to SOL → deposit both into Meteora DLMM. One policy, monthly execution.

### Trust Boundary Design

- **Revocation**: User revokes delegation at any time via the Token Program. Next Lighthouse check fails — execution halts.
- **Spending caps**: The `ScheduleConfig` enforces hard amount limits per period. The forward CPI cannot pull more than the schedule allows.
- **Emergency stops**: `PaymentGateway` signer can pause all policies under its gateway instantly. `ProgramConfig` has an emergency freeze.
- **Allowlist lock**: Forward targets are hard-coded in `ALLOWED_FORWARD_PROGRAMS`. A business cannot route to an unlisted program without a protocol upgrade.

### Abuse Prevention

- **Instruction-level validation**: `ByteRangeCheck` on the forward CPI instruction data ensures only the pre-approved instruction (e.g., Jupiter swap, not Jupiter freeze) executes.
- **Output-based fees**: Protocol fees are calculated on the output amount after forward CPI. A malicious business cannot inflate fees by manipulating the input.
- **Slippage protection**: `min_output_amount` in `ForwardConfig` prevents sandwich attacks during the forward swap. If slippage exceeds the threshold, the entire transaction reverts.
- **Audit trail**: Every execution is on-chain. Gateway, policy, amounts, forward program, output — all verifiable post-hoc.

# Psychological Hook

**"Set it and forget it — but with DeFi yields."** Users get the convenience of subscriptions (auto-pay, no manual signing) while their money works in DeFi instead of sitting idle. The psychological shift: "I'm not paying a fee, I'm investing my fee."

- **Yield awareness**: Users see their subscription payments growing through DeFi positions
- **DeFi onboarding**: Simplified entry point — no need to understand complex DeFi mechanics
- **Trust through transparency**: Every execution is on-chain and verifiable
- **Financial automation**: True hands-off recurring investments without custodial risk

# Brief Market Research

DeFi portfolio management is fragmented, with no solution combining recurring payments with automated DeFi deployment.

**Current alternatives:**

- **Robo-DeFi-Advisor**: AI-powered portfolio management — autonomous decisions, no recurring payment infrastructure
- **Aegis**: DeFi risk management — protocol-level focus, not personal recurring investments
- **Ava AI Agent**: AI-driven trading — autonomous, not user-triggered recurring payments
- **SeiLens**: Portfolio analytics — read-only, no execution capabilities
- **Autonomous Finance Dexi**: DeFi agent — AI-managed, not recurring payment-based
- **Singularry**: AI portfolio advisor — recommendations only, no automated execution
- **zkde.fi**: DeFi rebalancer — rebalancing only, not subscription-based

**The gap**: Every existing solution either makes autonomous decisions (AI) or provides read-only analytics. None enable businesses to trigger recurring DeFi deployments from user delegations. Tributary's v1 composable contract with Lighthouse validation solves this natively.

# Business Model

**Revenue streams:**

- Transaction fee: 1-2% of each recurring pull + forward execution
- Platform licensing: Businesses pay for access to recurring DeFi infrastructure ($100-1,000/month)
- Premium features: Advanced scheduling, multi-asset forwarding, analytics ($50-200/month)
- Integration fees: DeFi protocols paying for placement in allowed forward list

**Unit economics:**

- 500 businesses × $500/month platform fee = $250,000/month
- 10,000 users × $100 average monthly recurring = $1,000,000/month processed
- Transaction fee at 1.5% = $15,000/month
- Total: ~$265,000/month at scale

# Technical Specifications

## Architecture

```
User → Delegates tokens to business (one-time)
  ↓
Business → Configures ComposablePolicy (schedule + amount + forward target)
  ↓
Keeper Bot → Triggers execution on schedule
  ↓
Lighthouse → Validates balance, delegation, preconditions
  ↓
Tributary Pull → Claims approved amount from user wallet
  ↓
Forward CPI → Routes to DeFi protocol (Jupiter, Meteora, Raydium)
  ↓
Output → Lands in user's wallet (swapped, staked, or deposited)
```

## How This Hooks Into Tributary

- **v1 Composable Contract**: Direct implementation — `ComposablePolicy` with schedule, validation, and forward targets
- **Lighthouse integration**: Critical — pre-validation ensures safe execution
- **Guardian module**: Rate limiting, abuse prevention, emergency stops
- **Loyalty module**: Volume discounts for high-frequency users, business tenure rewards

## Recommended Tech Stack

- **Frontend**: Next.js business dashboard for policy management, React user portal
- **Backend**: Rust keeper bot service, Redis for scheduling, PostgreSQL for policy storage
- **Database**: PostgreSQL for business/user data, Redis for real-time validation caching
- **Solana**: Tributary v1 program, Lighthouse for validation, Jupiter/Meteora/Raydium for forwarding
- **Monitoring**: Grafana for execution metrics, custom dashboard for business analytics

## MVP Scope

1. Basic ComposablePolicy creation with schedule and amount
2. Single forward target (Jupiter swap)
3. Lighthouse validation for balance and delegation
4. Keeper bot for automated execution
5. Basic business dashboard for policy management

# Non-Technological Requirements

- Legal review for automated recurring payments (consumer protection regulations)
- Business onboarding documentation and SDK
- User education on DeFi risks and delegation mechanics
- DeFi protocol partnerships for forward target integration
- Insurance consideration for failed forward CPIs

# Potential Risks

- **Failed forward CPI**: If the target program rejects the instruction (insufficient liquidity, slippage), the entire transaction reverts. No tokens move. The business sees the failure and can retry.
- **Stale slippage**: If `min_output_amount` was set at policy creation and market conditions shift significantly, valid executions may fail. Businesses should set generous slippage or recreate policies periodically.
- **Delegation expiry**: Token delegation doesn't auto-renew. If the user's delegation amount is exhausted, Lighthouse catches it — but the user must manually re-delegate.
