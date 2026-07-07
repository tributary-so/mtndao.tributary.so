---
name: Social Commitment Contracts
summary: Put real money behind your promises — fitness goals, habits, and commitments
  enforced by delegated economic consequences.
category: "\U0001F9E0 Psychology & Emotion"
status: "\U0001F50D research"
protocol-version: v0
tributary_models:
- PayAsYouGo
- Milestone
category_slug: psychology-emotion
---


# Put real money behind your promises — fitness goals, habits, and commitments enforced by economic consequences

# Promises are free. That's why they're worthless. Commitment contracts fix this by attaching real economic consequences to failure.

# Core Mechanics

Users define a commitment and delegate economic consequences via Tributary's pull primitive:

- **Fitness goals**: "I'll go to the gym 3x/week. If I miss, $10 goes to charity (or my friend, or a cause I hate)." The system connects to fitness tracking data. Missed workouts trigger automatic pulls. No self-enforcement needed.
- **Habit formation**: "I'll meditate daily for 30 days." Delegation authorizes pulls on missed days. The cost makes skipping feel worse than doing.
- **Study commitments**: "I'll complete this course by March." Oracle-verified progress. Missed deadline → funds released to designated recipient.
- **Social commitments**: Friends make shared commitments. Both delegate stakes. Either fails → both pay. Mutual accountability through mutual financial exposure.
- **Public commitments**: Post your commitment on social media with verifiable on-chain stakes. Followers can see you're serious. The public nature amplifies accountability.

The Milestone model handles time-based goals. PayAsYouGo handles per-event triggers. The designated recipient can be a friend (motivating), a charity (constructive), or an "anti-charity" — a cause you oppose (maximum motivation through spite).

# Psychological Hook

**"My money is on the line."** The moment real economic consequences attach to a commitment, behavioral compliance jumps dramatically. Behavioral economics research shows loss aversion is 2x stronger than gain motivation. People work harder to avoid losing $10 than to gain $10. Commitment contracts weaponize loss aversion for self-improvement.

- **Streak preservation**: The financial cost of breaking a streak creates genuine urgency. Duolingo mechanics with real teeth
- **Social accountability**: Visible commitments with visible stakes. Your friends see you risking $100 on your goals
- **Competitive commitment**: "I bet I can stick to this longer than you." PvP commitment contracts
- **Win notifications**: "You completed your commitment! $0 pulled this week." The positive reinforcement of not losing money
- **Progress tracking**: Visual habit chains, commitment completion percentages, streak histories

# Brief Market Research

Commitment contracts exist in various forms, but none combine economic stakes with social accountability at protocol level.

**Current alternatives:**

- **StickK**: Commitment contracts with monetary stakes — fiat-only, no crypto integration, limited verification
- **Beeminder**: Goal tracking with financial consequences — fiat-based, no social accountability features
- **Habitica**: Gamified habit tracking — virtual rewards only, no real economic stakes
- **Streaks**: Simple streak tracking — no financial consequences, no social accountability
- **Duolingo**: Language learning with streaks — gamification only, no real economic stakes
- **Coach.me**: Habit coaching — subscription-based, no commitment contracts

**The gap**: Every existing solution is either fiat-based (StickK, Beeminder) or gamification-only (Habitica, Duolingo). None combine real economic stakes with social accountability and protocol-level verification. Tributary's Pull Payment model with Milestone and PayAsYouGo models solves this natively.

# Business Model

**Revenue streams:**

- Transaction fee: 1-3% of commitment stakes (on completion or failure)
- Premium features: Advanced verification, social features, analytics ($10-50/month)
- Enterprise: Corporate wellness programs with commitment contracts ($100-500/employee/year)
- Integration fees: Fitness apps, learning platforms paying for commitment integration

**Unit economics:**

- 10,000 active users × $20 average monthly stakes = $200,000/month processed
- Transaction fee at 2% = $4,000/month
- 1,000 premium users × $20/month = $20,000/month
- 5 corporate clients × $10,000/month = $50,000/month
- Total: ~$74,000/month at scale

# Technical Specifications

## Architecture

```
User → Defines commitment (goal + stakes + deadline)
  ↓
Commitment Engine → Monitors progress via oracles (fitness, learning, etc.)
  ↓
Tributary Pull → Executes stakes on missed milestones
  ↓
Social Layer → Public commitments, friend accountability
  ↓
Verification → Oracle integration for goal verification
  ↓
Dashboard → Progress tracking, streak visualization
```

## How This Hooks Into Tributary

- **PayAsYouGo + Milestone**: PayAsYouGo for per-event triggers (missed workouts), Milestone for time-based goals (course completion)
- **Lighthouse integration**: Progress verification, deadline validation, milestone assertions
- **Guardian module**: Rate limiting, abuse prevention, affordability checks
- **Loyalty module**: Consistent completion rewards, streak bonuses, community recognition

## Recommended Tech Stack

- **Frontend**: React commitment dashboard with social features, React Native mobile app
- **Backend**: Rust commitment engine, Redis for progress tracking, PostgreSQL for commitment storage
- **Database**: PostgreSQL for user/commitment data, Redis for real-time progress caching
- **Solana**: Tributary program for stake execution, oracles for progress verification
- **Integrations**: Fitness APIs (Strava, Apple Health), learning platforms (Coursera, Udemy)

## MVP Scope

1. Basic commitment creation (goal, stakes, deadline)
2. Simple verification (manual check-in or basic oracle)
3. Stake execution on missed milestones
4. Basic progress tracking and streak visualization
5. Simple social sharing

# Non-Technological Requirements

- Legal review for commitment contracts (enforceability?)
- User education on financial risks of commitment stakes
- Mental health considerations (avoid harmful pressure)
- Oracle partnerships for fitness/learning verification
- Community guidelines for public commitments

# Potential Risks

- **Financial harm**: Users genuinely cannot afford the penalties they commit to. Hard caps and affordability checks needed
- **Gaming the verification**: Cheating on gym check-ins, using fake progress data. Robust oracle integration is critical
- **Psychological pressure**: Some users will experience genuine distress from financial stakes. Needs opt-out mechanisms
- **Anti-charity controversy**: Designating "causes you hate" as penalty recipients creates reputation risk
- **Addictive commitment**: The gamification could encourage users to stake more than they should on increasingly ambitious goals
