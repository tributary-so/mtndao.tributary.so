---
name: Stream-to-Own Commerce
summary: Pay per second for continuous access to services, spaces, and compute — no
  subscriptions, just presence
category: "\U0001F6D2 Commerce & Payments"
status: "\U0001F4AD ideation"
protocol-version: v0
tributary_models:
- PayAsYouGo
category_slug: commerce-payments
---


# Pay per second for continuous access to services, spaces, and compute — no subscriptions, just presence

# Not subscriptions. Not one-time purchases. Continuous possession — you pay while you use, down to the second.

# Core Mechanics

Tributary's pull primitive enables a provider to debit a user's account incrementally and continuously. The user pre-approves a spending cap. The provider pulls at a defined rate (e.g., $0.003/second) while the user is active. Disconnect? The pulls stop. Reconnect? They resume. All on-chain, all sub-cent granularity, all without per-transaction signing.

Crypto rails are uniquely suited here. Traditional payment systems can't meter at sub-second intervals at sub-cent amounts. Stripe's minimum is $0.50. Credit card networks won't process a $0.003 charge. Solana + Tributary makes this economically viable for the first time.

### Use Cases

- **Premium Discord/Telegram access** — pay while you're in the channel. AFK? The meter pauses. Active? You're paying for real-time alpha
- **GPU rental** — metered by the second. No hourly rounding. Your training job finishes in 47 minutes, you pay for 47 minutes
- **Shared vehicles** — pay while driving. The car knows you've stopped because the ignition is off
- **VR worlds** — existence costs money continuously. Premium environments charge per second of presence
- **AI API access** — every inference call billed at exact token cost, pulled automatically
- **Coworking spaces** — walk in, pay while inside, walk out, billing stops

# Psychological Hook

**The "meter running" psychology is powerful and dual-natured.** For providers, it guarantees revenue proportional to value delivered. For users, it creates a sense of perfectly fair pricing — you only pay for what you use. This feels _radically_ different from subscriptions where you pay the same whether you use the service or not.

The spending becomes invisible. Users stop thinking in dollars and start thinking in time. "Another 10 minutes in this VR world" doesn't feel like a purchase — it feels like a choice to stay.

- **Perfect fairness perception**: No overpaying for unused time
- **Zero commitment**: Try anything instantly, leave without penalty
- **Flow state billing**: Money moves in the background while you're immersed
- **Discovery loop**: Low cost of entry encourages trying new services

# Brief Market Research

Time-based billing exists in limited forms, but no solution enables true sub-second, sub-cent metering at scale.

**Current alternatives:**

- **AWS/GCP/Azure**: Cloud compute metering — hourly/minute billing, not sub-second, enterprise-focused
- **Stripe Billing**: Subscription and usage-based billing — $0.50 minimum, not suitable for micro-metering
- **Superfluid**: Streaming payments — continuous flow, but no metering or presence detection
- **Sablier**: Payment streaming — linear streaming, not usage-based metering
- **Helium**: Decentralized wireless — time-based data credits, but network-specific
- **Pool Together**: No-loss lottery — time-based deposits, not metering

**The gap**: Every existing billing solution has minimums ($0.50+) or uses hourly/minute increments. None enable true sub-second, sub-cent metering with automatic start/stop based on presence. Tributary's PayAsYouGo model with continuous pulls makes this economically viable on Solana.

# Business Model

**Revenue streams:**

- Transaction fee: 1-3% of metered revenue (higher due to micro-transaction complexity)
- Platform subscription: $10-100/month for provider dashboard and management
- Premium features: Advanced analytics, presence detection, custom metering ($50-500/month)
- Integration fees: Service providers paying for metering integration

**Unit economics:**

- 100 providers × $1,000 average monthly metered revenue = $100,000/month processed
- Transaction fee at 2% = $2,000/month
- 50 premium providers × $100/month = $5,000/month
- Total: ~$7,000/month at early stage

# Technical Specifications

## Architecture

```
Provider → Configures metering rate and spending cap
  ↓
Presence Detection → Monitors user activity/connection
  ↓
Tributary Pull → Continuous pulls at defined rate while active
  ↓
Metering Dashboard → Real-time spending visualization
  ↓
Auto-Stop → Pulls cease on disconnection/inactivity
  ↓
Settlement → Final meter reading on session end
```

## How This Hooks Into Tributary

- **PayAsYouGo model**: Perfect match — `max_amount_per_period` = session cap, `max_chunk_amount` = per-second rate limit
- **Lighthouse integration**: Presence validation, balance checks before continuous pulls
- **Guardian module**: Rate limiting, abuse prevention, emergency stops for metering
- **Loyalty module**: Volume discounts for heavy users, provider loyalty rewards

## Recommended Tech Stack

- **Frontend**: React provider dashboard with real-time metering, React Native user app
- **Backend**: Rust metering engine, Redis for presence tracking, PostgreSQL for billing data
- **Database**: PostgreSQL for provider/user data, Redis for real-time metering state
- **Solana**: Tributary program for continuous pulls, WebSocket for presence detection
- **Integrations**: Discord/Telegram bots, GPU rental platforms, VR world APIs

## MVP Scope

1. Basic metering rate configuration
2. Simple presence detection (connection/disconnection)
3. Continuous pulls while active
4. Auto-stop on disconnection
5. Basic metering dashboard

# Non-Technological Requirements

- Legal review for time-based billing (consumer protection?)
- Provider education on metering configuration
- User education on spending caps and metering
- Presence detection reliability (what happens on network disconnect?)
- Dispute resolution for metering disagreements

# Potential Risks

- **Bill shock**: Users who lose track of time may accumulate unexpectedly large charges. Real-time balance display is essential
- **Provider trust**: Users must trust the provider to meter honestly. Cryptographic metering proofs could help
- **Network reliability**: If Solana stalls, does the meter keep running? Edge cases around disconnection need clear rules
- **Unit economics**: At sub-cent amounts, Tributary's own fees must be negligible. Fee structure matters enormously
- **User experience**: The "paying by the second" anxiety is real. Some users hate meters. Offer flat-rate alternatives
