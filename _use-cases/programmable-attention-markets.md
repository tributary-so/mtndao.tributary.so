---
name: Programmable Attention Markets
summary: Attention becomes programmable money — creators earn by the second, feeds
  become live markets, communities deploy capital to capture and compete for human
  attention.
category: "\U0001F465 Social & Community"
status: "\U0001F50D research"
protocol-version: v0
tributary_models:
- PayAsYouGo
category_slug: social-community
---


# Attention becomes programmable money — creators earn by the second, feeds become live markets

# TikTok, except attention IS money. Not metaphorically — literally, programmatically, continuously.

# Core Mechanics

Users approve an entertainment budget per day — say $2. As they scroll, watch, engage, money flows automatically. $0.001 per minute watched. $0.01 if they finish a video. $0.50 if they join a creator's community. Creators don't need ads, sponsors, or brand deals. They earn directly from attention capture. The better they are at holding focus, the more they earn.

The feed itself becomes a **live attention market** — AI-optimized clips compete for flow, memes earn while being viewed, engagement routes money in real-time.

But that's just the supply side. The real play is **Attention Wars** — a PvP social layer where communities deploy capital against each other. Users approve influence budgets. Creators, AI agents, and apps spend to capture attention, reward engagement, launch campaigns against rival communities, bribe users into migration. Feeds become economic battlefields. The strongest memes absorb attention _and_ treasury simultaneously.

Tributary's `PayAsYouGo` model is the only one that works here. Every attention event is a micro-pull: watch time, engagement, community joins, content creation, tipping. The amounts are tiny ($0.0001–$0.50) but continuous and high-frequency. No wallet popup per scroll — that would kill the product instantly. Users approve a daily cap. The protocol pulls within it. Period.

# Psychological Hook

**You're not doom-scrolling anymore — you're spending.** Every second of attention has a price tag. This sounds like a bug, but it's a feature: it makes you _choose_. "Is this video worth $0.002 of my attention budget?" Paradoxically, putting a price on attention makes people more intentional about it — while simultaneously making the platform more engaging because real money flows create real stakes.

- **Creator economy unlocked**: No minimum follower count. Earn from view one. The meritocracy dream.
- **PvP social dynamics**: Community wars, treasury raids, influence battles. Tribalism with financial stakes.
- **Attention as asset class**: Users discover they have a valuable resource (their attention) and learn to allocate it strategically.
- **Real-time markets**: Trending content earns more. Creators race to capture moments. The feed is a live auction.
- **Economic griefing**: Fund campaigns against rival memes. Bankroll migrations. Weaponize attention.
- **Meta-game**: Power users optimize their attention spend for maximum return (entertainment + earnings + social capital).

# Brief Market Research

The creator economy is projected to reach $234B by 2026, with SocialFi markets growing from $14.78B (2025) to $63.6B by 2035 at 15.71% CAGR. Creator monetization rates vary wildly: YouTube pays $3-5 RPM, TikTok $0.40-1.00 RPM, while paid communities generate $5-15K/month per 1K fans.

**Current alternatives:**

- **TikTok/YouTube**: Ad-revenue sharing — platform controls monetization, creators get pennies per view, no direct viewer-creator payment
- **Pump.fun**: Token launchpad — creators launch tokens, but no attention-based monetization
- **Friend.tech**: Social token trading — speculation-focused, not attention-based
- **Lens Protocol**: Decentralized social — no built-in attention monetization
- **Mirror**: Web3 publishing — subscription-based, not pay-per-attention
- **Rally**: Creator coins — failed to gain traction, no micro-payment infrastructure

**The gap**: Every existing social platform monetizes through ads or subscriptions. None enable direct, real-time, micro-payment flows from viewer to creator based on actual attention. Tributary's PayAsYouGo model with sub-cent pulls makes this economically viable.

# Business Model

**Revenue streams:**

- Platform fee: 5-10% of all attention payments (higher than typical payment processing due to micro-transaction complexity)
- Attention Wars treasury: 1-2% of community war chest deployments
- Creator tools: Premium analytics, audience insights, campaign management ($10-50/month)
- Verified humanity: Proof-of-humanity integration for Sybil resistance ($5/month)

**Unit economics:**

- 100,000 daily active users × $2 average daily budget = $200,000/day processed
- Platform fee at 8% = $16,000/day = $480,000/month
- 10,000 creators × $10/month tools = $100,000/month
- Total: ~$580,000/month at scale

# Technical Specifications

## Architecture

```
User → Approves daily attention budget ($2/day)
  ↓
Feed Engine → Tracks watch time, engagement, completion
  ↓
Tributary Pull → Micro-payments per attention event
  ↓
Creator Dashboard → Real-time earnings, audience insights
  ↓
Attention Wars → Community capital deployment, PvP campaigns
  ↓
Anti-Sybli Layer → Proof-of-humanity for authentic engagement
```

## How This Hooks Into Tributary

- **PayAsYouGo model**: Perfect match — `max_amount_per_period` = daily budget, `max_chunk_amount` = micro-payment limit
- **Lighthouse integration**: Daily budget resets, weekly creator payouts, campaign duration locks
- **Guardian module**: Sybil resistance, bot detection, abuse prevention
- **Loyalty module**: Consistent viewer rewards, creator tenure bonuses, community loyalty tiers

## Recommended Tech Stack

- **Frontend**: React Native mobile app (TikTok-like UX), Next.js web dashboard
- **Backend**: Rust engagement tracking service, Redis real-time counters
- **Database**: PostgreSQL for user/creator data, TimescaleDB for engagement time-series
- **Solana**: Tributary program for micro-payments, SPL tokens for attention credits
- **ML Layer**: Recommendation engine for feed optimization, anomaly detection for Sybil attacks

## MVP Scope

1. Basic feed with attention tracking (watch time, completion)
2. Simple micro-payment flow from viewer to creator
3. Creator dashboard showing real-time earnings
4. Daily budget approval and tracking
5. Basic anti-bot measures (rate limiting, simple CAPTCHA)

# Non-Technological Requirements

- Content moderation system (attention monetization could incentivize harmful content)
- Legal review for micro-payment labor implications
- Proof-of-humanity integration (critical for Sybil resistance)
- Creator onboarding and education
- Community guidelines for Attention Wars (prevent harassment campaigns)

# Potential Risks

- **Attention exploitation**: Literally monetizing human attention at its most vulnerable. Ethical review required.
- **Budget blowouts**: Users who aren't financially literate could burn through budgets fast. Hard caps and alerts essential.
- **Content quality race-to-bottom**: Optimizing for attention capture ≠ optimizing for quality. Could incentivize rage-bait, engagement farming.
- **Bot abuse**: Fake views, fake engagement, Sybil attacks draining creator budgets. Needs robust identity/proof-of-humanity.
- **Network effects dependency**: Only works at scale. Cold start is brutal — creators won't earn without viewers, viewers won't come without creators.
- **Regulatory**: Micro-payments for attention looks like wage labor without protections. Labor law questions incoming.
