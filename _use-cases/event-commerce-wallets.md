---
name: Event Commerce Wallets
summary: Attendees approve a spending authority at events — meals, merch, upgrades
  flow without checkout. The event becomes a frictionless economic zone.
category: "\U0001F6D2 Commerce & Payments"
status: "\U0001F4AD ideation"
protocol-version: v0
tributary_models:
- PayAsYouGo
- Subscription
category_slug: commerce-payments
---


# One Approval. Zero Checkout. Infinite Spending.

Turn any event into a frictionless economic zone where attendees pre-authorize a budget and every purchase just happens — no cards, no QR codes, no lines.

# Pitch of the Core Idea

Conferences, festivals, sports events, concerts — all share the same payment UX nightmare. Long lines. Card readers that fail. Cash nobody carries. QR codes that open apps that crash. Every transaction is a small friction that accumulates into a terrible experience.

What if the entire event was a frictionless economic zone? One approval. Zero subsequent transactions. Attendees scan a QR code or NFC tag upon entering, approve an "event budget" — say €500 for a 3-day conference, €100 for a concert — and from that point forward, everything just works. Food and drinks? Vendor scans the wristband, payment pulls automatically. Grab a t-shirt, scan, walk away. Mid-event upgrade to VIP access? Instant. No payment screen.

The hospitality variant is equally powerful: weddings, group trips, shared accommodations. Hosts receive delegated authority for specific categories. Guests approve spending permissions for the duration. "The trip manages itself" — no expense tracking, no splitting, no awkward settlement conversations.

# Core Mechanics

1. **Onboarding (30 seconds)**: Attendee scans QR/NFC at entry → opens Tributary-powered wallet → approves spending cap (e.g., €500 for 3 days)
2. **Continuous Authorization**: Tributary's PayAsYouGo model activates — vendors can pull payments within the approved cap without further user interaction
3. **Vendor Interaction**: Vendor scans attendee wristband/phone → system checks remaining balance → pulls payment in <1 second → confirms with haptic/visual feedback
4. **Real-Time Balance**: Remaining budget displayed on attendee's phone and at vendor POS — creates gentle spending pressure and transparency
5. **Auto-Settlement**: Event ends → remaining balance returns to attendee → clean summary of all transactions delivered
6. **Top-Up Flow**: If budget runs low, attendee can increase cap with one tap — frictionless but controlled

**Tributary Primitives Used**:

- PayAsYouGo for continuous pulls within approved limits
- Subscription for vendor integration fees (monthly platform access)
- Lighthouse validation for real-time balance checks
- Forward routing for automatic settlement at event end

# Psychological Hook and Addictiveness

"The event manages my money." When the entire venue is a pre-approved spending zone, consumption behavior changes dramatically. The pre-approved budget creates a mental model of "this money is already allocated" — spending from it doesn't feel like spending. It feels like using something that's already yours. Hotel minibar psychology at venue scale.

**Zero-friction consumption**: The speed of grab-and-go is genuinely delightful. After 3 interactions, it feels natural. **Event momentum**: Day 1: cautious. Day 2: comfortable. Day 3: spending without thinking. The adaptation curve is fast. **Social proof**: Watching everyone around you scan-and-grab normalizes the behavior instantly. **Budget transparency**: Real-time remaining balance displayed everywhere. The countdown creates gentle spending pressure. **Post-event settlement**: Clean summary of all event spending. No mystery charges, no receipt hunting.

# Brief Market Research

The global festival cashless wristband app market was valued at $291 million in 2025, projected to reach $972.4 million by 2034 (14.2% CAGR). The broader cashless event payments market is $12.4 billion in 2025, expected to hit $42.8 billion by 2034.

**Key Competitors**:

- **Intellitix**: Market leader, deployed at 150+ international festivals, offers RFID-based cashless payments with AI analytics
- **PlayPass**: Strong European presence (Awakenings, ADE), focuses on attendee personalization and sponsor engagement
- **Glownet**: White-label solutions for ticketing agencies, targets midsize festivals
- **Tappit**: Specializes in small conferences and corporate events
- **Eventbrite**: Integrating wristband functionality into core ticketing platform

The market is consolidating rapidly — larger event tech companies are acquiring specialized vendors. The blockchain/crypto angle remains underpenetrated, creating an opportunity for Tributary-powered solutions that offer lower fees and true self-custody.

# Business Model

**Revenue Streams**:

- **Platform Fee**: 2-3% on every transaction within the event zone (vs. 5-8% for traditional POS at events)
- **Vendor Integration Fee**: $500-2000 per event for vendor onboarding and hardware setup
- **Sponsor Analytics**: Aggregated spending data sold to sponsors for attendee behavior insights
- **White-Label Licensing**: Event organizers can brand the wallet as their own

**Cost Structure**:

- Hardware (NFC wristbands, scanners): $2-5 per attendee
- Payment processing: 0.5-1% on Solana (vs. 2.5-3.5% traditional)
- Event support staff: $200-500 per event day

**Unit Economics**: At a 3,000-person conference with average €300 spend per attendee, platform revenue is ~€27,000 (3% fee) minus €15,000 costs = €12,000 profit per event.

# Summary of Technical Specifications

## Architecture

- **Frontend**: React Native mobile wallet (iOS/Android) + web fallback
- **Backend**: Solana program handling spending caps, vendor registration, real-time balance tracking
- **Vendor POS**: Simple web app or hardware terminal with NFC reader
- **Settlement Layer**: Automated settlement at event end via Tributary Forward routing

## How This Hooks Into Tributary

- **PayAsYouGo**: Core primitive — continuous payment pulls within pre-approved limits
- **ComposablePolicy**: Define spending categories (food, merch, VIP) with different rules
- **Lighthouse**: Real-time validation of balance and spending authority
- **Forward**: Automatic settlement of remaining balance at event end

## Recommended Tech Stack

- **Blockchain**: Solana (low fees, high throughput essential for event-scale transactions)
- **Framework**: Anchor for Solana program, React Native for mobile wallet
- **SDK**: Tributary SDK for payment flows and policy management
- **Hardware**: NFC wristbands (Gantner or similar), handheld scanners
- **Oracle**: Pyth for real-time EUR/USD conversion if needed

## MVP Scope

**2-3 Day Hackathon Build**:

- Basic Solana program handling spending cap approval and vendor pulls
- Simple web wallet (no mobile app needed for MVP)
- Vendor dashboard showing real-time transactions
- Demo scenario: simulated "festival" with 3 vendor types

**Not in MVP**: Real hardware integration, offline queuing, multi-currency support, sponsor analytics.

# Non-Technological Requirements

- **Event Partnerships**: Need 1-2 pilot events to demonstrate value — conferences or festivals with 500+ attendees
- **Hardware Sourcing**: NFC wristbands and scanners require supplier relationships
- **Vendor Onboarding**: Each vendor needs setup and training — staff needed for event deployment
- **Legal/Compliance**: Payment processing regulations vary by jurisdiction — may need money transmitter license
- **Customer Support**: Real-time support during events is critical — broken payment = ruined experience

# Potential Risks

- **Budget Exhaustion**: Running out of approved funds mid-event is embarrassing. Real-time balance visibility and top-up flows are critical
- **Vendor Onboarding**: Every food truck, merch stand, and service provider needs integration. Hardware and software costs add up
- **Network Reliability**: If Solana stalls during peak event hours, commerce breaks. Offline queuing needed for large events
- **Refund Complexity**: Event cancellations, vendor disputes, incorrect charges. Post-event support must be robust
- **Privacy Concerns**: Attendees may not want their entire event spending history visible on-chain — need privacy solutions
- **Adoption Risk**: Events are conservative — organizers may resist crypto-native solutions without proven track record
