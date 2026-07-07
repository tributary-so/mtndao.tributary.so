---
name: Streaming SaaS Billing
summary: Per-API-call, per-token, per-compute-unit billing with automatic token swaps
  when the user holds a different token than the billing token. A SaaS provider pulls
  micro-amounts on usage, Lighthouse validates the usage proof, and if needed the
  protocol forwards through a DEX swap before settling. No invoices, no monthly subscriptions,
  no manual payments.
category: "\U0001F527 Infrastructure & Tools"
status: "\U0001F50D research"
protocol-version: v1
tributary_models:
- PayAsYouGo
validation: lighthouse
forward_targets:
- SPL Transfer
- Jupiter V6
category_slug: infrastructure-tools
---


# Per-API-call, per-token, per-compute-unit billing with automatic token swaps

# Modern SaaS billing is usage-based. Crypto payments don't fit this model — until now.

# Core Mechanics

A SaaS provider configures a `ComposablePolicy` with usage-based billing rules:

1. **Pre-validation (Lighthouse)** — Validates the usage claim against metering data: API call count from an on-chain attestation, compute units from a service oracle, token consumption from a verified log. Prevents the provider from claiming more than was actually consumed.
2. **Pull (Token Delegation)** — Claims the billed amount from the user's token account. Micro-amounts per period: $0.001 per API call, $0.0001 per token, $0.01 per compute unit. Capped by `max_amount_per_period` and `max_chunk_amount`.
3. **Forward (CPI)** — If the user's billing token matches the provider's accepted token, direct SPL transfer. If not, forward through Jupiter swap first: pull SOL → swap to USDC → transfer USDC to provider.

```
WHEN (condition: usage threshold reached — e.g., every 1000 API calls)
  → VALIDATE (Lighthouse: assert usage oracle confirms 1000 calls consumed)
  → PULL (1.5 SOL from user — user holds SOL, provider bills USDC)
  → FORWARD (Jupiter swap: 1.5 SOL → USDC, min_output: 200 USDC)
  → LAND (200 USDC → provider wallet)
```

The provider triggers billing when accumulated usage crosses a batch threshold. The user never sees a payment prompt during active usage.

### Business Scenarios

- **AI inference API**: Charges $0.002 per 1K tokens. User holds SOL, service bills USDC. Every 10M tokens consumed, Lighthouse validates the usage log, protocol pulls SOL, swaps to USDC, settles. Zero payment friction during inference.
- **Compute marketplace**: Per-GPU-minute billing. Lighthouse validates compute time from an on-chain job completion attestation. Payment auto-pulled and forwarded — no invoicing, no NET-30 terms.
- **Premium API tier**: Pay-as-you-go access to rate-limited endpoints. User delegates a $50/month cap. Provider pulls per-request. If the cap is approached, Lighthouse warns; if exceeded, access auto-revokes.
- **Data feed subscription**: Oracle/price feed service charges per-query. Micropayments flow automatically — pull 0.0001 USDC per query, batched to reduce gas overhead.

### Trust Boundary Design

- **Usage proof requirement**: Lighthouse validates usage claims against an on-chain oracle or attestation. The provider cannot bill for usage that didn't happen.
- **Period caps**: `max_amount_per_period` bounds total billing per day/week/month. Even if usage spikes, the user's liability is capped. The provider absorbs the overflow or suspends service.
- **Chunk limits**: `max_chunk_amount` prevents the provider from pulling the entire period cap in one claim. Forces incremental billing aligned with actual usage.
- **Revocation = cancellation**: User revokes delegation → next Lighthouse check fails → provider detects failed payment → service suspended. Natural cancellation flow.

### Abuse Prevention

- **Oracle-gated usage**: The usage metering oracle is referenced in the Lighthouse assertion. A provider cannot self-attest usage — it must come from a verifiable source.
- **Output verification**: For swap-containing routes, the protocol verifies the swap output meets `min_output_amount`. A provider cannot manipulate the swap to receive more than the market rate provides.
- **Transparent metering**: All claims and pulls are on-chain. Users can audit their exact usage-to-payment ratio at any time.
- **Gateway isolation**: Each SaaS provider operates under its own `PaymentGateway`. A compromised provider cannot affect users of other gateways.

# Psychological Hook

**"Pay only for what you use."** The relief of never overpaying for unused capacity or being locked into subscriptions you don't need. Financial management transforms from anxiety-inducing budgeting to transparent, metered consumption.

- **Perfect fairness**: No overpaying for unused time
- **Zero commitment**: Try anything instantly, leave without penalty
- **Transparent metering**: Every charge is on-chain and verifiable
- **Auto-convenience**: No invoices, no manual payments, no reminders

# Brief Market Research

Usage-based SaaS billing is the industry trend, but no crypto-native solution exists for per-API-call, per-token, or per-compute-unit billing.

**Current alternatives:**

- **Stripe Billing**: Usage-based billing — fiat-only, $0.50 minimum, not suitable for crypto-native services
- **Twilio**: Per-API-call billing — fiat-only, enterprise-focused
- **AWS/GCP/Azure**: Cloud compute metering — hourly/minute billing, not sub-second, fiat-based
- **Alchemy/QuickNode**: Blockchain API metering — fiat billing, no crypto-native payment options
- **Helius/RPC providers**: Solana RPC metering — fiat billing, no per-call crypto payments

**The gap**: Every existing usage-billing solution is fiat-based (Stripe, Twilio, AWS). None enable crypto-native, per-API-call, per-token, or per-compute-unit billing with automatic token swaps. Tributary's v1 composable contract with Lighthouse validation solves this natively.

# Business Model

**Revenue streams:**

- Transaction fee: 1-3% of metered revenue (higher due to micro-transaction complexity)
- Platform subscription: $50-500/month for provider dashboard and management
- Premium features: Advanced analytics, usage alerts, custom metering ($100-1,000/month)
- Integration fees: SaaS providers paying for billing integration

**Unit economics:**

- 500 providers × $500 average monthly metered revenue = $250,000/month processed
- Transaction fee at 2% = $5,000/month
- 100 premium providers × $200/month = $20,000/month
- Total: ~$25,000/month at early stage

# Technical Specifications

## Architecture

```
SaaS Provider → Configures usage-based billing rules
  ↓
Usage Oracle → Attests actual consumption (API calls, tokens, compute)
  ↓
Lighthouse → Validates usage claim against oracle data
  ↓
Tributary Pull → Claims billed amount from user wallet
  ↓
Optional Swap → Routes through Jupiter if token mismatch
  ↓
Provider Wallet → Receives payment
  ↓
Dashboard → Real-time usage and billing visualization
```

## How This Hooks Into Tributary

- **v1 Composable Contract**: Direct implementation — `ComposablePolicy` with usage condition, validation, and forward targets
- **Lighthouse integration**: Critical — usage validation prevents overbilling
- **Guardian module**: Rate limiting, abuse prevention, emergency stops for billing
- **Loyalty module**: Volume discounts for high-usage users, provider loyalty rewards

## Recommended Tech Stack

- **Frontend**: Next.js provider dashboard with usage analytics
- **Backend**: Rust billing engine, Redis for usage caching, PostgreSQL for billing data
- **Database**: PostgreSQL for provider/user/billing data, Redis for real-time usage tracking
- **Solana**: Tributary v1 program, Lighthouse for validation, Jupiter for token swaps
- **Oracles**: Custom usage oracles for API call counting, compute unit tracking

## MVP Scope

1. Basic usage-based billing configuration
2. Single usage metric (API calls or tokens)
3. Lighthouse validation for usage claims
4. Simple billing dashboard
5. Basic usage alerts and caps

# Non-Technological Requirements

- Legal review for usage-based billing (consumer protection?)
- Provider education on metering configuration
- User education on usage-based pricing risks
- Oracle reliability assessment (what happens if usage oracle fails?)
- Dispute resolution framework for billing disagreements

# Potential Risks

- **Dispute resolution**: If the usage oracle is wrong, the user is billed incorrectly. Off-chain dispute mechanisms (provider support) are the fallback — the protocol cannot reverse executed payments.
- **Gas cost vs. payment size**: For true microtransactions ($0.001), even batched gas costs may be significant. Works best for services with moderate per-unit pricing ($0.01+) or high-volume batching.
- **Provider trust**: The provider controls when to trigger billing. A malicious provider could front-load claims early in the period. Period caps and chunk limits mitigate but don't eliminate this.
- **Swap slippage on micro-transactions**: Jupiter minimum swap sizes and slippage tolerances may not handle sub-cent swaps gracefully. Direct-token billing (no swap) is preferred where possible.
