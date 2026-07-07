---
name: GUMROAD (Creator Marketplace)
summary: A Gumroad-style platform for selling digital products built entirely on Tributary's
  payment infrastructure
category: "\U0001F3A8 Creator Economy"
status: "\U0001F50D research"
protocol-version: v0
tributary_models:
- Subscription
- PayAsYouGo
category_slug: creator-economy
---


# 3% Fees. Instant Payouts. Non-Custodial. The Creator Marketplace Gumroad Should Have Been.

A Gumroad-style platform for selling digital products built entirely on Tributary's payment infrastructure — with 70% lower fees, instant settlement, and true creator ownership.

# Pitch of the Core Idea

Gumroad takes 10% + $0.50 per sale. Creators wait a week for payouts. Funds sit in Gumroad's custody. The creator economy is a $250B+ market crying out for lower fees and instant settlement.

A Tributary-based marketplace flips every one of those constraints: 1% protocol fee + your gateway fee (you pick the split). Instant settlement on Solana — no weekly payout cycle. Non-custodial — funds never leave the creator's control. Global by default — no banking restrictions, no Stripe onboarding.

This isn't just a cheaper Gumroad. It's a fundamentally different architecture: creators own their payment infrastructure, customers get wallet-less purchasing via Action Codes, and usage-based billing (pay-per-use) becomes possible — something no existing platform can do.

# Core Mechanics

1. **Creator Onboarding**: Creator connects wallet → creates PaymentGateway PDA → sets up storefront in minutes
2. **Product Listing**: Upload digital product → set price in USDC → publish to marketplace or own domain
3. **Customer Purchase**: Customer clicks "Buy" → Action Code generated → approve in wallet later → content unlocks
4. **Recurring Memberships**: Patreon-style tiers ($5/mo, $15/mo, $50/mo) via Tributary Subscriptions — auto-renew, cancel anytime
5. **Pay-Per-Use**: AI tools, API access, metered content — customer approves spending limit, platform claims chunks as consumed
6. **Instant Settlement**: Every transaction settles immediately to creator's wallet — no waiting, no custody

**Tributary Primitives Used**:

- Subscription for memberships and recurring revenue
- PayAsYouGo for usage-based billing and metered content
- ComposablePolicy for tiered access and affiliate splits
- Lighthouse for payment verification and content access
- Forward for instant settlement to creator wallets

# Psychological Hook and Addictiveness

**Creator empowerment**: Non-custodial means creators always control their funds. No platform can hold earnings hostage. This builds trust and loyalty.

**Customer convenience**: Action Codes solve the #1 conversion killer in crypto — wallet friction at checkout. Buy on phone, approve on desktop. Buy now, approve later.

**Pricing flexibility**: Mix one-time purchases, subscriptions, and usage-based billing in one storefront. No other platform enables this combination.

**Global accessibility**: No banking restrictions, no Stripe onboarding. Anyone with a crypto wallet can sell and buy worldwide.

# Brief Market Research

The creator economy market was valued at $205-250 billion in 2024, projected to reach $700-1,345 billion by 2033-2034 (15-23% CAGR). Digital products specifically are a $32 billion segment growing at 22-28% annually.

**Key Competitors**:

- **Gumroad**: $206M tracked revenue, 146K products, 10% flat fee — dominant but expensive. Estimated $580M GMV in 2026
- **Whop**: $400M+ creator payouts in 2025, 3% fee, Discord-native — fastest growing competitor
- **Teachable**: 15% market share in courses, $480M GMV, focused on high-ticket course businesses
- **Systeme.io**: 28% year-over-year growth, all-in-one approach, dominates European/Latin American markets
- **Patreon**: Subscription-focused, 5-12% fees, strong brand but limited payment models

Gumroad's 10% fee is the 2nd-most-expensive major platform. Cheaper alternatives exist (Whop 3%, Payhip 5%, Sellfy $29/mo flat), but none offer the payment flexibility of Tributary. The opportunity is clear: same functionality, 70% lower fees, instant settlement, and usage-based billing.

# Business Model

**Revenue Streams**:

- **Gateway Fees**: 2-5% per transaction (configurable per creator tier)
- **Premium Features**: Custom storefronts, analytics, email tools — $9-49/month
- **Discovery Platform**: Optional marketplace with curated listings — 1-2% additional
- **Action Code Volume**: Transaction fees on wallet-less purchases

**Creator Tiers**:

| Tier       | Gateway Fee | Features                          |
| ---------- | ----------- | --------------------------------- |
| Free       | 3%          | Basic storefront, file hosting    |
| Pro        | 2%          | Custom domain, analytics, email   |
| Enterprise | 1.5%        | White-label, API access, priority |

**Revenue Projection (Conservative)**:

| Metric                      | Month 6 | Month 12 | Month 24 |
| --------------------------- | ------- | -------- | -------- |
| Active creators             | 500     | 2,000    | 10,000   |
| Avg monthly revenue/creator | $200    | $300     | $400     |
| Platform GMV                | $100K   | $600K    | $4M      |
| Gateway revenue (2.5%)      | $2.5K   | $15K     | $100K    |
| Protocol fees (1%)          | $1K     | $6K      | $40K     |

**Example: Creator sells $20 ebook at 100 copies/month**

- Gumroad: $20 × 100 × 10.25% = **$205 in fees**, paid weekly
- Tributary (2% gateway): $20 × 100 × 3% = **$60 in fees**, instant

The creator keeps $145 more per month and gets paid immediately.

# Summary of Technical Specifications

## Architecture

```
┌──────────────────────────────────────────────────────────────────┐
│  Frontend Layer                                                  │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐           │
│  │ Creator      │  │ Product      │  │ Customer     │           │
│  │ Dashboard    │  │ Storefront   │  │ Library      │           │
│  └──────────────┘  └──────────────┘  └──────────────┘           │
├──────────────────────────────────────────────────────────────────┤
│  API Layer (Node.js/Express)                                    │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐           │
│  │ Products API │  │ Orders API   │  │ Users API    │           │
│  └──────────────┘  └──────────────┘  └──────────────┘           │
├──────────────────────────────────────────────────────────────────┤
│  Tributary Integration                                           │
│  ┌───────────────────────────────────────────────────────────┐   │
│  │  @tributary-so/sdk (payments)                             │   │
│  │  ┌─────────────┐  ┌──────────────┐  ┌─────────────┐      │   │
│  │  │ One-time    │  │ Subscription │  │ Pay-as-you- │      │   │
│  │  │ Payments    │  │ (memberships)│  │ go (usage)  │      │   │
│  │  └─────────────┘  └──────────────┘  └─────────────┘      │   │
│  └───────────────────────────────────────────────────────────┘   │
├──────────────────────────────────────────────────────────────────┤
│  Storage Layer                                                   │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐           │
│  │ PostgreSQL   │  │ S3/Arweave   │  │ Redis        │           │
│  │ (metadata)   │  │ (files)      │  │ (cache)      │           │
│  └──────────────┘  └──────────────┘  └──────────────┘           │
└──────────────────────────────────────────────────────────────────┘
```

## How This Hooks Into Tributary

Every Gumroad concept has a direct Tributary equivalent:

| Gumroad Concept     | Tributary Primitive                                 |
| ------------------- | --------------------------------------------------- |
| Creator account     | PaymentGateway PDA (one per creator)                |
| Product listing     | PostgreSQL metadata + Arweave/S3 content            |
| One-time purchase   | Single-execution Subscription (max_renewals = 0)    |
| Membership tier     | Subscription policy with monthly frequency          |
| Pay-per-use content | Pay-as-you-go policy with chunk limits              |
| Tip jar / donations | Pay-as-you-go with no chunk limit                   |
| Affiliate system    | Split recipient on PaymentPolicy                    |
| Creator payout      | Direct — funds land in creator wallet on execution  |
| Customer library    | Off-chain index of UserPayment + PaymentPolicy PDAs |

## Recommended Tech Stack

- **Blockchain**: Solana (low fees, instant settlement)
- **Framework**: Anchor for Solana program, Node.js/Express backend
- **SDK**: Tributary SDK for payment flows
- **Storage**: PostgreSQL (metadata), Arweave/S3 (files), Redis (cache)
- **Frontend**: React with Next.js for SSR

## MVP Scope

**Phase 1: Core Marketplace (4-6 weeks)**

- Creator onboarding (wallet connect → PaymentGateway creation)
- Product listing (upload + metadata + price)
- One-time purchase flow (checkout → verify → deliver)
- Customer library (purchased content index)
- Basic storefront (product page per creator)

**Phase 2: Memberships (3-4 weeks)**

- Tier creation (multiple subscription levels per creator)
- Recurring payment setup via Tributary SDK
- Access control based on active subscription status
- Scheduler integration for automatic renewals

**Phase 3: Discovery & Polish (4-6 weeks)**

- Marketplace homepage (curated, trending, categories)
- Action Code integration for wallet-less purchasing
- Creator analytics dashboard
- Email notifications (payment receipts, renewals)

**Phase 4: Pay-Per-Use & API (4-6 weeks)**

- Pay-as-you-go product type
- Usage metering via x402 middleware
- API access for developer tools
- Consumption dashboards

# Non-Technological Requirements

- **Legal/Compliance**: Merchant of Record functionality may be needed for tax handling — third-party integration or build
- **Creator Onboarding**: Each creator needs guided setup — documentation, video tutorials, support
- **Customer Support**: Payment disputes, content access issues, refund requests — need support system
- **Marketing**: Creator acquisition is expensive — need content marketing, partnerships, influencer outreach
- **Community Building**: Creator community for feedback, feature requests, organic growth

# Potential Risks

- **Regulatory Risk**: Non-custodial payments may face regulatory scrutiny in some jurisdictions — legal review needed
- **Adoption Risk**: Creators are creatures of habit — migrating from Gumroad requires compelling value proposition
- **Competition**: Gumroad could lower fees or add crypto payments — first-mover advantage matters
- **Smart Contract Risk**: Payment infrastructure must be bulletproof — audits required
- **Content Piracy**: Digital products are easily copied — need DRM or value-add beyond just the file
- **Stablecoin Risk**: USDC/USDT de-peg could affect pricing — need multi-stablecoin support

# Why This Works

**Tributary is not a payment button.** It's a payment protocol. That distinction matters:

1. **You own the relationship** — Customer data, branding, communication stays with you
2. **Composable pricing** — Mix one-time, recurring, and usage in one storefront
3. **No platform lock-in** — Creators can verify their PaymentGateway on-chain independently
4. **Action Codes** — No other platform offers wallet-less crypto purchases
5. **Solana economics** — Sub-cent transaction fees make microtransactions viable

The creator economy is a $250B market crying out for lower fees and instant settlement. Gumroad's 10% cut is the status quo. A 3% total cost platform with instant payouts isn't just competitive — it's a different league.
