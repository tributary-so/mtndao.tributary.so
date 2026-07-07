---
name: PvP Spending & Competitive Consumption
summary: Turn spending into a multiplayer game — visible streams, real-time leaderboards,
  and clan warfare where money is the ammunition.
category: "\U0001F465 Social & Community"
status: "\U0001F4AD ideation"
protocol-version: v0
tributary_models:
- PayAsYouGo
category_slug: social-community
---


# Turn spending into a multiplayer game — visible streams, real-time leaderboards, and clan warfare

# The spending itself IS the gameplay. Biggest donor wins status. Highest burn rate unlocks rooms.

# Core Mechanics

Users join spending competitions powered by Tributary's PayAsYouGo pull model. They approve a competition budget upfront, and the system pulls funds as they spend in real-time. The spending is visible, public, and gamified:

- **Leaderboards**: Real-time ranking by spending rate, total spent, and streaks. Updated every second.
- **Room control**: Top spender "owns" the room — custom name, special privileges, moderator powers. Lose the top spot, lose the perks.
- **Spending races**: Timed competitions. Who can burn the most in 24 hours? Winner takes a percentage of the pool.
- **Clan warfare**: Groups pool spending streams against rival clans. Collective burn rate determines clan rank.
- **Milestone unlocks**: Community-wide spending targets unlock exclusive access, content, or events for participants.
- **Patron wars**: Multiple patrons competing to be the top supporter of a creator, project, or cause. Real-time bidding war via continuous spending.

The pull primitive makes this seamless. Users approve once, then the competition pulls continuously as they compete. No "confirm transaction" per spend. The spending is frictionless — which is exactly what makes it dangerous and compelling.

# Psychological Hook

**Humans LOVE visible commitment.** A subscription is private — nobody sees you pay $10/month. But a spending STREAM is performative. Everyone can see you dropping $50/minute to hold the top spot. That visibility fundamentally changes behavior.

This is Twitch donations meets DeFi meets clan warfare. The social pressure is immense. When you can see that someone just passed you on the leaderboard, the urge to spend more is visceral. It's auction psychology at scale — nobody wants to be outbid, and the cost of losing is social, not just financial.

- **Social status**: Money = rank. The correlation is direct, visible, and updating in real-time.
- **Sunk cost**: "I've already spent $500 to hold this spot, I can't let them take it now."
- **Tribal warfare**: Clan-based spending creates team loyalty. You're not just spending for yourself — you're spending for THE CLAN.
- **Intermittent victories**: Taking the top spot, hitting a milestone, winning a race — each is a dopamine spike.
- **FOMO**: Watching others spend creates irresistible competitive pressure.

# Brief Market Research

Competitive spending is already a massive driver in gaming and social platforms — but no one has built a dedicated protocol for it.

**Current alternatives:**

- **Twitch/YouTube**: Donation leaderboards — platform-specific, no cross-platform competition, no clan mechanics
- **Discord Nitro**: Server boosting — subscription-based, not competitive, limited gamification
- **Pump.fun**: Token launch competitions — speculation-focused, not spending-based
- **Farcaster**: Decentralized social — no built-in competitive spending mechanics
- **Friend.tech**: Social token trading — speculation, not sustained spending competition
- **Gaming loot boxes**: Proven competitive spending psychology — but isolated to individual games

**The gap**: Every existing platform has elements of competitive spending (leaderboards, donations, boosting), but none are purpose-built for sustained, cross-platform spending competitions. Tributary's continuous pull model enables frictionless, real-time competitive spending at scale.

# Business Model

**Revenue streams:**

- Competition entry fees: 5-10% of competition pools
- Platform commission: 2-5% of all competitive spending
- Premium features: Custom clan branding, advanced analytics, exclusive competitions ($20-100/month)
- Sponsor integrations: Brands sponsoring competitions for visibility

**Unit economics:**

- 10,000 active competitors × $50 average monthly spend = $500,000/month processed
- Platform commission at 5% = $25,000/month
- 500 premium users × $50/month = $25,000/month
- Competition entry fees on 100 competitions × $500 average pool × 10% = $5,000/month
- Total: ~$55,000/month at scale

# Technical Specifications

## Architecture

```
User → Approves competition budget
  ↓
Competition Engine → Manages leaderboards, rooms, clans
  ↓
Tributary Pull → Continuous spending during competition
  ↓
Real-time Dashboard → Leaderboards, rankings, spending velocity
  ↓
Room System → Top spender controls, privileges, moderation
  ↓
Clan System → Group pooling, collective rankings, warfare
```

## How This Hooks Into Tributary

- **PayAsYouGo model**: Perfect match — `max_amount_per_period` = competition budget, `max_chunk_amount` = spending rate limit
- **Lighthouse integration**: Competition duration locks, milestone-based rewards, scheduled events
- **Guardian module**: Spending abuse prevention, fraud detection, rate limiting
- **Loyalty module**: Consistent competitor rewards, clan loyalty bonuses, streak multipliers

## Recommended Tech Stack

- **Frontend**: React real-time dashboard with WebSocket leaderboards, React Native mobile app
- **Backend**: Rust competition engine, Redis for real-time rankings, WebSocket for live updates
- **Database**: PostgreSQL for user/competition data, Redis for leaderboards and caching
- **Solana**: Tributary program for continuous pulls, SPL tokens for competition currencies
- **Streaming**: Real-time event streaming for leaderboard updates and spending events

## MVP Scope

1. Basic competition creation and joining
2. Real-time leaderboard with spending velocity
3. Simple room system with top spender controls
4. Clan creation and collective spending tracking
5. Basic competition duration and budget limits

# Non-Technological Requirements

- Responsible gambling/spending safeguards (daily/weekly limits, cool-down periods)
- Legal review for competitive spending mechanics (gambling regulations?)
- Community moderation tools for competition rooms
- User education on spending risks and budget management
- Anti-addiction features (spending alerts, mandatory breaks)

# Potential Risks

- **Predatory by design**: This literally gamifies spending money. The ethics are questionable at best.
- **Whale dominance**: Rich users always win. The "game" is pay-to-win with no skill ceiling.
- **Addictive spending**: Users may spend far beyond their means chasing social status.
- **Regulatory scrutiny**: Gamified financial products targeting social competition will attract regulators fast.
- **Reputation risk**: "They built a platform that tricks people into spending competitions" is a bad headline.
- **Churn after loss**: When users lose their rank and realize how much they spent, they may leave entirely.
