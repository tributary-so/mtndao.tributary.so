---
name: SOL Balance Monitor
summary: Autopilot for your wallet's life support — never watch a position die from
  rent exhaustion or fee starvation again. Threshold-triggered refueling, validated
  on-chain, paid for only when it fires.
category: "\U0001F527 Infrastructure & Tools"
status: "✅ shipped"
protocol-version: v0
tributary_models:
- PayAsYouGo
- Subscription
category_slug: infrastructure-tools
---


# Autopilot for your wallet's life support — never watch a position die from rent exhaustion again

# Every active Solana account bleeds SOL. Rent, transaction fees, compute budget — a thousand tiny cuts.

# Core Mechanics

The user configures three things once: a **target account** to keep alive, a **critical threshold** (e.g. 0.05 SOL), and a **funding source** — either a USDC balance or a WSOL position on the same wallet or a delegated reserve wallet. They grant Tributary a pull cap ("refuel up to 1 SOL per week, max $200"). From there the loop runs autonomously:

1. **Observe** — Lighthouse continuously attests the live SOL balance of the target account. Lighthouse is the validation layer: the agent doesn't trust its own RPC read, it trusts a signed oracle claim about the balance. This is what makes the trigger tamper-resistant and auditable after the fact.
2. **Decide** — when the attested balance crosses below threshold, the agent computes the top-up amount (e.g. refill to 0.2 SOL). If the funding source is USDC, it prices the swap; if WSOL, it sizes the unwrap directly.
3. **Fund** — Tributary's delegation pulls the required input asset from the user's approved funding source, up to the pre-authorized cap. No per-action signature. The cap is the only safety rail needed.
4. **Swap** — USDC routes through Jupiter (or any DEX aggregator) into WSOL. Slippage, priority fees, and route are set by policy.
5. **Unwrap** — the agent burns WSOL via the SPL token program's native `sync_native` / close-account path, landing native rent-paying SOL in the target account.
6. **Settle** — the agent pulls its fee via PayAsYouGo: a small flat fee per successful refuel, or a basis-point cut of the top-up. No refuel, no charge.

The whole chain — observe → decide → fund → swap → unwrap → settle — is one Tributary-delegated transaction flow. The user's role ended at configuration.

### Why each piece is load-bearing

- **Lighthouse** turns "is the balance really low?" from an RPC race into a verifiable oracle claim. Without it, the agent is just trusting whichever node answered last, and any glitch becomes a false trigger — or a missed one. Lighthouse is the reason this is safe to run unattended.
- **DEX swap (Jupiter)** lets users fund refueling from the asset they actually hold. Forcing WSOL-only would doom adoption; most reserves sit in USDC.
- **Wrapper contract unwrap** is the bridge between the SPL token world (where swaps live) and the native SOL world (where rent and fees live). The agent composes them so the user never has to.
- **Tributary delegation** is the only thing that lets all of the above happen without a human in the loop. Push payments would require a signature per refuel — defeating the entire purpose.

# Psychological Hook

**"The wallet that never dies."** The magical moment is the first time you check a wallet you'd written off as empty and find it still has rent-exempt balance — topped up overnight, in a market dip, while you slept. It reframes SOL from a consumable you have to manage into a utility, like electricity. You don't think about the meter. The account just stays alive.

The inverse hook is fear-removal: every crypto user has lost something to a dead account — a closed position, a missed claim, a bot that stopped working at 3am because fees drained it. This use case doesn't optimize anything. It eliminates a category of failure. That's a cleaner pitch than "10% more yield."

- **Set-and-forget is permanent**: Once configured, the cognitive overhead of "do I have enough SOL?" drops to zero. Removing a recurring anxiety is stickier than adding a feature.
- **Receipts build trust**: Every refuel is a clean on-chain event: threshold attested by Lighthouse, swap routed, unwrap landed, fee pulled. The audit trail compounds confidence until users forget it's running.
- **The meter is satisfying**: A dashboard showing "refuels this month: 7, SOL kept alive: 1.4, fees paid: $0.21" turns invisible plumbing into visible value. Tiny numbers, constant reassurance.
- **Compose with everything**: This is the floor under every other Tributary use case. Auto-DCA, payroll, treasury sweeps, wallet guardian — none of them work if the account runs out of SOL. The monitor becomes the prerequisite, which makes it the default install.
- **Network effect via uptime**: Every bot, every agent, every delegated pull that depends on a target account benefits when that account can't die. The monitor's value grows with the number of things relying on the watched account.

# Brief Market Research

SOL balance monitoring is a known pain point, but no solution combines threshold triggers with automated refueling and protocol-level validation.

**Current alternatives:**

- **Manual monitoring**: Users check balances manually — reactive, error-prone, time-consuming
- **Wallet auto-refuel**: Some wallets (Phantom, Solflare) have basic auto-refuel — single wallet, limited funding sources, no protocol validation
- **Custom scripts**: Developers build custom monitoring scripts — maintenance burden, no audit trail, single-purpose
- **Centralized services**: Third-party monitoring services — custodial risk, no on-chain validation
- **No protocol-level solution**: No existing Tributary-like solution for automated SOL balance management

**The gap**: Every existing solution is either manual, wallet-specific, or custodial. None combine threshold triggers with automated refueling across multiple funding sources and protocol-level validation. Tributary's Pull Payment model with Lighthouse validation solves this natively.

# Business Model

**Revenue streams:**

- Per-refuel fee: $0.10-0.50 per successful refuel (PayAsYouGo)
- Monthly subscription: $5-20/month for monitoring and automated refueling
- Premium features: Multi-account monitoring, advanced alerts, priority refueling ($10-50/month)
- Enterprise: Bulk account monitoring for protocols and DAOs ($100-1,000/month)

**Unit economics:**

- 10,000 active monitors × $10/month subscription = $100,000/month
- 50,000 refuels/month × $0.25 average fee = $12,500/month
- 1,000 premium users × $20/month = $20,000/month
- Total: ~$132,500/month at scale

# Technical Specifications

## Architecture

```
User → Configures target account, threshold, funding source
  ↓
Lighthouse → Continuously attests SOL balance
  ↓
Trigger Engine → Detects threshold breach
  ↓
Tributary Pull → Claims funding from approved source
  ↓
Jupiter Swap → Converts USDC to WSOL
  ↓
Unwrap → Burns WSOL, lands native SOL in target account
  ↓
Settlement → Pulls fee via PayAsYouGo
```

## How This Hooks Into Tributary

- **PayAsYouGo + Subscription**: Per-refuel fees or monthly subscription for monitoring
- **Lighthouse integration**: Critical — balance attestation ensures accurate triggers
- **Guardian module**: Rate limiting, abuse prevention, emergency stops
- **Loyalty module**: Volume discounts for high-frequency refuelers, loyalty rewards for consistent users

## Recommended Tech Stack

- **Frontend**: Next.js monitoring dashboard with alerts and analytics
- **Backend**: Rust trigger service, Redis for balance caching, PostgreSQL for monitor configuration
- **Database**: PostgreSQL for user/monitor data, Redis for real-time balance tracking
- **Solana**: Tributary program for pulls, Lighthouse for validation, Jupiter for swaps
- **Monitoring**: Grafana for refuel metrics, PagerDuty for alerts

## MVP Scope

1. Basic threshold monitoring for single account
2. Simple refueling from USDC to SOL
3. Lighthouse validation for balance attestation
4. Basic dashboard with refuel history
5. Email alerts for threshold breaches

# Non-Technological Requirements

- User education on threshold configuration (too low = emergency refuels, too high = unnecessary fees)
- Oracle reliability assessment (what happens if Lighthouse goes down?)
- Emergency procedures for failed refuels
- Documentation for funding source setup
- Support for multiple wallet providers

# Potential Risks

- **Oracle failure**: Lighthouse attests a wrong (too-low) balance, agent refuels unnecessarily, burns the user's reserve. Mitigation: multi-attestation and a cooldown between triggers.
- **Swap blow-through**: A thin liquidity moment turns a 0.1 SOL top-up into a $40 USDC burn via slippage. Hard caps on input amount and max slippage are non-negotiable; without them the monitor becomes a leak.
- **Funding source exhaustion**: The user's USDC reserve runs dry and the next refuel silently fails. The monitor must surface "funding source critical" as loudly as it surfaces "target account critical," or it's just relocated the problem.
- **Cap drift**: Gas-heavy periods push per-refuel cost above the user's mental model. A cap set in a calm market gets eaten in a volatile one. Adjustable caps and honest reporting are required.
- **Delegation scope creep**: The pull authority granted for refueling is also, in principle, authority to move that USDC anywhere. Tight, programmatic scope (swap + unwrap only, target account only) is the difference between a feature and an exploit waiting to happen.
- **Competition with native wallet features**: Wallets will eventually ship auto-refuel themselves. Tributary's defensibility is being the cross-wallet, cross-funding-source, agent-callable primitive, not the consumer UI.
