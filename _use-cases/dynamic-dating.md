---
name: Dynamic Dating
summary: Continuous economic signaling replaces empty swipes — money talks, bots walk.
category: "\U0001F465 Social & Community"
status: "\U0001F4AD ideation"
protocol-version: v0
tributary_models:
- PayAsYouGo
category_slug: social-community
---


# Dynamic Dating

Continuous economic signaling replaces empty swipes — money talks, bots walk.

# Pitch of the Core Idea

Online dating is broken because it's free. When attention costs nothing, everyone pays in wasted time — ghosting, low-effort messages, bots, and the existential dread of matching with someone who never responds. The fundamental problem isn't matching algorithms. It's **filtering for intent**.

Users approve a daily or weekly "attention budget" — say $3–10/day. The platform pulls micropayments continuously based on real interaction signals: reply speed, message depth, conversation duration, AI-assessed compatibility scores. Want to DM someone? That costs. Want to boost your profile? Pull. Want to keep a conversation alive after 48 hours of silence? Renew the stake.

Tributary's PayAsYouGo model makes this seamless. One initial approval, then the protocol pulls incrementally as interactions happen. No wallet popup per message. No friction breaking the flow of conversation. The economic cost is felt in the aggregate — your weekly spend — not per action.

# Core Mechanics

1. **Attention Budget**: User sets daily/weekly spend cap ($3-10/day typical)
2. **Interaction Pricing**: AI scores conversations by quality (reply speed, depth, length, compatibility)
3. **Continuous Pull**: Tributary deducts based on engagement signals — not per-message, but per-quality-interaction
4. **Profile Boost**: Pay to surface profile to high-compatibility matches
5. **Conversation Renewal**: Stake a fee to keep dormant conversations alive past 48 hours
6. **Quality Feedback Loop**: Spending patterns inform matching algorithm — who you pay to talk to reveals preference

# Psychological Hook and Addictiveness

**Skin in the game is the ultimate filter.** Bots won't burn real money to spam matches. Casually interested people self-select out. The people who remain are genuinely invested — literally. High spenders signal genuine interest through revealed preference, not self-reported bios.

AI compatibility scoring combined with continuous spending creates a feedback loop: the system learns who you'll pay to talk to, refines matches, and charges more for high-quality introductions. Premium matches become economically validated.

"Pay to keep the convo alive" is viscerally compelling. It transforms passive swiping into active investment. Every dollar spent is a vote of confidence. The sunk cost effect creates retention — you've already invested $15 in this conversation, you're not walking away now.

**Variable ratio reinforcement**. You don't know which conversation will be worth the investment. The uncertainty creates the same compulsive loop as gambling, but the "jackpot" is human connection. Spending patterns become a status signal — "I spent $200 this month meeting people" implies seriousness and means.

# Brief Market Research

The **online dating market** generated $6-12B in revenue in 2025 across 350M+ global users. The market is projected to reach $15-23B by 2030-2034, growing at 7.5-9.3% CAGR. Tinder alone generated $3.3B in 2025 (Match Group total).

Key competitors:

- **Tinder** (Match Group): $3.3B revenue, 50M+ monthly active users
- **Bumble**: ~$1B revenue, strong in women-first positioning
- **Hinge**: Fastest-growing among 25-35 demographic
- **Badoo**: Strong in Europe and Latin America
- **Grindr**: Dominant in LGBTQ+ dating

The crypto-native dating audience is small. The bridge asset needed for mass adoption is a fiat on-ramp that makes the economic signaling invisible to non-crypto users. No competitor currently uses economic commitment as a filtering mechanism — the innovation is unique.

# Business Model

**Revenue Share**: Platform takes 20-30% of all interaction payments. The remaining 70-80% funds the matching infrastructure.

**Premium Matches**: Higher-quality introductions cost more. AI-scored compatibility drives pricing tiers.

**Profile Boosts**: Pay-per-boost to surface to high-compatibility users. Bidding dynamics create auction revenue.

**Verification Fees**: One-time identity verification ($5-10) that reduces bot prevalence and increases trust.

**Subscription Tiers**: Free (limited daily budget, basic matching), Premium ($15/mo, higher budgets, advanced AI scoring), Elite ($50/mo, unlimited, priority matching).

# Summary of Technical Specifications

## Architecture

- **Attention Budget Engine**: Tributary PayAsYouGo with continuous pull based on engagement scoring
- **Compatibility AI**: ML model trained on conversation quality signals (reply speed, depth, length, sentiment)
- **Matching Pipeline**: Multi-factor scoring combining economic signals, compatibility, and behavioral patterns
- **Anti-Bot Layer**: Economic filtering eliminates automated accounts — bots can't sustain real spending
- **Privacy Layer**: Spending patterns encrypted, never visible to other users

## How This Hooks Into Tributary

The **PayAsYouGo model** is essential. Without Tributary:

- Per-message payments create friction that kills conversation flow
- Pre-funded escrow accounts add custody risk
- Subscription models don't correlate cost with quality
- No mechanism for continuous economic signaling

With Tributary, one approval enables continuous pulling based on real interaction quality. The economic cost is felt in aggregate (weekly spend), not per action. This creates the seamless "attention budget" that makes the system work.

## Recommended Tech Stack

- **Protocol**: Tributary PayAsYouGo with custom engagement scoring
- **Backend**: Go or Rust API server for real-time interaction scoring
- **AI/ML**: Fine-tuned LLM for conversation quality assessment, recommendation engine for matching
- **Database**: PostgreSQL for user profiles, Redis for real-time scoring, vector DB for compatibility matching
- **Frontend**: React Native mobile app (iOS + Android)
- **Privacy**: End-to-end encryption for messages, zero-knowledge proofs for spending verification
- **Anti-Bot**: Behavioral analysis + economic filtering dual layer

## MVP Scope

1. **Single-city launch** (crypto-friendly city: Miami, Lisbon, Austin)
2. **Daily budget system**: $5/day default, configurable up to $50/day
3. **Basic interaction scoring**: Reply speed + message length + response rate
4. **Matching algorithm**: Compatibility scoring weighted by economic signals
5. **Profile boost**: Pay to surface to compatible users
6. **Conversation renewal**: Stake to keep conversations alive past 48 hours

# Non-Technological Requirements

- **Regulatory navigation**: Dating + money + crypto is a compliance nightmare across jurisdictions. Need legal counsel in launch markets.
- **Trust & safety team**: Moderation, abuse prevention, consent verification
- **PR strategy**: The "pay-to-date" narrative requires careful framing around quality filtering, not transactional dating
- **Fiat bridge**: Must support credit card / Apple Pay for mass adoption — crypto-native users are the early adopter niche

# Potential Risks

- **Dystopian optics:** Paying for human interaction feels transactional. Press will be brutal.
- **Whale dominance:** Rich users drown out genuine but lower-budget connections.
- **Regulatory:** Dating + money + crypto is a compliance nightmare across jurisdictions.
- **Reputation:** One data leak revealing spending patterns could be catastrophic for users.
- **Market size:** Crypto-native dating audience is small. Bridge asset needed for mass adoption.

The darkest read: this is the most honest dating app ever built, because money is the most honest signal. The most optimistic read: same thing.
