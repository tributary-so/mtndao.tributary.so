---
name: Human Attention Leasing
summary: Turn human attention into a continuously billable API — metered by the minute,
  pulled on demand
category: "\U0001F6D2 Commerce & Payments"
status: "\U0001F50D research"
protocol-version: v0
tributary_models:
- PayAsYouGo
category_slug: commerce-payments
---


# Rent Your Focus. Bill by the Second. Become a Human API.

Turn human time into a metered resource — experts, coaches, influencers, and consultants become continuously billable APIs with per-minute pull payments.

# Pitch of the Core Idea

People approve "rent my focus." Others pull minutes of attention, responses, consulting, gameplay, coaching. You become a continuously billable API.

Tributary's pull-payment primitive turns human time into a metered resource. A user sets a per-minute rate and availability window. When someone wants their attention, the protocol pulls funds continuously from the requester's pre-approved budget and connects the two parties. No invoices. No "send me a payment first." No wallet popup per interaction. The billing is invisible and continuous — like leaving a meter running.

The demand side is equally compelling. Want to talk to a specific crypto founder? A legal expert? A dating coach? Their rate is right there. Approve the budget, get connected. No scheduling friction, no back-and-forth on pricing. Instant access to human expertise, metered precisely.

# Core Mechanics

1. **Provider Setup**: Expert creates profile → sets per-minute rate (e.g., $5/min) → defines availability window → Tributary activates PayAsYouGo billing
2. **Consumer Request**: Consumer browses experts → selects one → approves budget (e.g., $50) → connects via voice/video/text
3. **Metered Billing**: Clock runs during session → Tributary pulls incrementally from consumer's approved budget → credits provider in real-time
4. **Session End**: Consumer hangs up or budget exhausted → final settlement → provider receives earnings instantly
5. **Reputation System**: Ratings, reviews, total minutes sold, revenue-per-hour metrics
6. **Gamification**: Streaks, leaderboards, "most expensive attention" rankings

**Tributary Primitives Used**:

- PayAsYouGo for continuous per-minute billing
- ComposablePolicy for different session types (voice, text, group)
- Lighthouse for real-time rate validation and balance checks
- Forward for instant settlement to provider wallets

# Psychological Hook and Addictiveness

"I am a continuously billable API." That sentence rewires how people think about their own time. Once you internalize that every minute has a price and someone will pay it, procrastination becomes expensive and focus becomes revenue. The platform doesn't just facilitate transactions — it creates a marketplace where human attention becomes a tradeable, metered commodity. Like AWS but for people.

**For providers**: Watching your balance tick up in real-time while you talk is dopamine on tap. Every conversation literally pays you, second by second. **For consumers**: Frictionless access to anyone. No negotiation, no waiting. Just approve and connect. **Status signaling**: Higher rates = higher perceived value. A leaderboard of "most expensive attention" creates a Veblen good dynamic. **Gamification**: Streaks, total minutes sold, revenue-per-hour leaderboards.

# Brief Market Research

The global expert network industry surpassed $2.5 billion in 2024, growing 9% year-over-year. The market is projected to reach $6.1 billion by 2030 (8.5% CAGR). The US market alone is $1.8 billion. Consulting remains the spending engine (~50% of industry spend), while corporates are now the adoption engine (~45% of clients by number).

**Key Competitors**:

- **GLG (Gerson Lehrman Group)**: Market leader, $1B+ revenue, 900K+ experts, enterprise-focused
- **AlphaSights**: Fast-growing, $100M+ revenue, strong in private equity and consulting
- **Guidepoint**: $200M+ revenue, 900K+ experts, strong compliance focus
- **Third Bridge**: $150M+ revenue, focused on private equity and hedge funds
- **Capvision**: $100M+ revenue, strong in Asia-Pacific markets

The expert network market is dominated by enterprise-focused platforms with high minimum engagements ($500-5000 per call). The opportunity is democratizing access — making expert attention available to individuals, not just Fortune 500 companies. Tributary's micro-payment capability enables per-minute billing at scale.

# Business Model

**Revenue Streams**:

- **Transaction Fee**: 5-10% on every billable minute (provider pays)
- **Premium Features**: Priority listing, analytics, scheduling tools — $19-99/month
- **Enterprise API**: Companies integrate expert access into their workflows — $500-5000/month
- **Verified Expert Program**: Background checks, credential verification — $99-299 one-time

**Cost Structure**:

- Solana transaction fees: ~$0.00025 per minute billing
- Infrastructure: $2000-5000/month for video/audio infrastructure
- Customer support: $1000-3000/month at scale
- Marketing: $5-15 per acquired user

**Unit Economics**: At 1,000 experts billing average $5/min for 10 hours/month, platform revenue is ~$25,000/month (10% fee) minus $8,000/month costs = $17,000/month profit.

# Summary of Technical Specifications

## Architecture

- **Frontend**: React web app with mobile-responsive design
- **Backend**: Node.js/Express API for user management, scheduling, matching
- **Video/Audio**: WebRTC for real-time communication
- **Billing**: Solana program for continuous per-minute pulls via Tributary

## How This Hooks Into Tributary

- **PayAsYouGo**: Core primitive — continuous per-minute billing within approved budget
- **ComposablePolicy**: Different rates for voice, text, group sessions
- **Lighthouse**: Real-time rate validation and balance checks during sessions
- **Forward**: Instant settlement to provider wallets after session ends

## Recommended Tech Stack

- **Blockchain**: Solana (low fees essential for per-minute billing)
- **Framework**: Anchor for Solana program, React frontend
- **SDK**: Tributary SDK for payment flows
- **Real-Time**: WebRTC for video/audio, Socket.io for text chat
- **Scheduling**: Cal.com or custom scheduling integration

## MVP Scope

**2-3 Day Hackathon Build**:

- Simple provider profiles with per-minute rates
- Basic session booking and WebRTC connection
- Tributary integration for per-minute billing
- Simple dashboard showing earnings and session history

**Not in MVP**: Scheduling calendar, group sessions, enterprise API, verified expert program.

# Non-Technological Requirements

- **Provider Acquisition**: Need experts willing to list — crypto founders, developers, consultants
- **Quality Control**: Verification of credentials, ratings, reviews — trust is critical
- **Legal/Compliance**: Are these financial services? Employment? Something new? Unclear regulatory landscape
- **Support Infrastructure**: Dispute resolution, harassment prevention, refund mechanisms
- **Cold Start Problem**: Needs density on both sides — a marketplace with 3 experts isn't interesting

# Potential Risks

- **Race to the Bottom**: If anyone can list, rates collapse. Curation and verification become critical
- **Attention Fragmentation**: People optimizing for billable minutes may degrade conversation quality
- **Regulatory Gray Zone**: Are these financial services? Employment? Something new? Unclear
- **Harassment Vector**: High-spend users may feel entitled to demanding behavior. Needs robust blocking and refund mechanisms
- **Cold Start Problem**: Needs density on both sides. A marketplace with 3 experts isn't interesting
- **Trust Risk**: Experts need to trust they'll get paid, consumers need to trust they'll get value — reputation system is critical
