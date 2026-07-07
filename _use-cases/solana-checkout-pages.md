---
name: Solana Checkout Pages
summary: Plug-and-play checkout infrastructure for Solana commerce — embeddable pages,
  one-click upsells, native subscriptions, and post-purchase revenue loops. The missing
  conversion layer for on-chain merchants.
category: "\U0001F6D2 Commerce & Payments"
status: "\U0001F50D research"
protocol-version: v0
tributary_models:
- PayAsYouGo
- Subscription
- Milestone
category_slug: commerce-payments
---


# Plug-and-play checkout infrastructure for Solana commerce — the missing conversion layer

# Every Solana merchant reinvents the checkout. Solana Pay gives you a QR code. That's it. No upsells. No order bumps.

# Core Mechanics

### For Merchants

The merchant dashboard is deliberately simple:

- **Create product**: Name, description, image, price (SOL, USDC, any SPL token). Set it as one-time, subscription, payment plan, or pay-what-you-want
- **Configure checkout**: Brand colors, logo, custom domain. Add order bump ("Add this for $5 more"). Add one-click upsell ("After purchase, offer this at 50% off"). Add quantity limits, countdown timers, social proof ("47 people bought this today")
- **Set fulfillment**: Digital download link, NFT mint, token-gated access, webhook to backend, or email delivery
- **Share link**: Checkout page is live. Embed as widget, share as URL, or generate QR code. Done

No merchant needs to touch a smart contract. No wallet integration to build. No payment flow to design. Tributary handles the entire payment layer — one-time pushes for purchases, pull-delegations for subscriptions and upsells, milestone releases for payment plans.

### For Customers

The customer experience is the product. It needs to feel like Shopify, not like sending a transaction:

- **Checkout page loads** — product info, price, timer if urgency is enabled. Clean, branded, fast
- **Connect wallet** — Phantom, Solflare, Backpack, or any Solana wallet. One click
- **Review order** — see the total, the order bump if they added it, the subscription terms if applicable
- **Approve** — one signature. For subscriptions, this signature also approves the Tributary delegation for future pulls. For one-time purchases, it's a standard transfer
- **Thank you page** — the upsell offer appears. "Get X at 50% off, only for the next 60 seconds." The customer already approved a pull delegation during checkout. The upsell requires zero additional signing. One click. The pull executes instantly
- **Fulfillment** — digital download unlocks, NFT mints, access grants, email arrives. Automated

The entire flow: click link → connect wallet → approve → upsell → done. Under 30 seconds.

### The Tributary Advantage

This doesn't work without pull payments:

- **Native Subscriptions**: Tributary's pull-delegation means the checkout flow can natively offer subscription products — the customer signs once, approving both the initial payment AND the recurring pull authority. Future charges happen automatically. No monthly wallet popup. No churn at renewal.
- **One-Click Upsells That Actually Work**: During checkout, the customer approves a bounded pull delegation — say, up to $100 in additional purchases within the next 10 minutes. The upsell offer appears on the thank-you page. The customer clicks "yes." The pull executes. No signature. No friction.
- **Order Bumps**: "Add this complementary item for $4.99" — checked by default on the checkout page. With pull-payments, the bump is absorbed into the single checkout signature.
- **Payment Plans**: "Pay in 4 installments of $25." The customer approves a milestone-based Tributary delegation. Automatic pulls. Klarna on-chain.
- **Free Trials**: "Try for 7 days, then $29/month." The customer approves the subscription delegation with a 7-day activation delay. During the trial, no funds move.

# Psychological Hook

**"I launched a product and my first sale came in 12 minutes."** The merchant's first experience with the checkout page is magical. Create product → share link → money arrives. No integration. No developer. No "setting up your payment provider." The checkout page IS the store.

For customers, the experience needs to feel like magic too. "I bought something with crypto and it felt... normal." That sentence is the product. The first time a crypto-native checkout doesn't feel like a crypto checkout, you've won.

- **Merchant dashboard**: Real-time sales feed. "Someone just bought your product." That notification never gets old
- **Conversion analytics**: "Your checkout page converts at 23%. Industry average: 18%. Your upsell converts at 12%." Data porn for merchants
- **Revenue stacking**: "You made $470 today. $340 from initial sales, $85 from upsells, $45 from order bumps." Seeing the layered revenue is addictive
- **Subscription growth**: "You gained 14 new subscribers today. Monthly recurring revenue: $2,340." The MRR number going up is the ultimate retention mechanic
- **Template optimization**: Merchants A/B test checkout designs, copy, urgency elements. The optimization game hooks them
- **Affiliate network**: Other people promote your checkout link for a cut. Your sales grow without your effort. Network effects compound

# Brief Market Research

Solana commerce infrastructure is growing, but no solution combines checkout pages with upsells, subscriptions, and post-purchase flows.

**Current alternatives:**

- **Solana Commerce Kit (official)**: Open-source toolkit — developer-focused, no hosted checkout pages, requires integration
- **MoonPay Commerce**: Fiat-to-crypto on-ramp — focuses on on-ramping, not merchant checkout
- **PayCash**: Crypto payment processing — basic payments, no upsells or subscriptions
- **Sphere**: Shopify plugin for crypto — limited customization, no native subscription support
- **Helio**: Solana payment platform — subscription support, but no hosted checkout pages or upsells
- **Session Pay**: Web3 checkout — focuses on token-gated access, not general commerce

**The gap**: Every existing solution is either developer-focused (Commerce Kit), on-ramp focused (MoonPay), or basic payment processing (Helio, PayCash). None provide hosted checkout pages with upsells, order bumps, subscriptions, and post-purchase flows. Tributary's pull-payment model enables native subscriptions and one-click upsells that are impossible with traditional crypto payments.

# Business Model

**Revenue streams:**

- Per-transaction fee: 1-2% on each checkout. Lower than Stripe (2.9% + $0.30)
- Subscription fee: 1% on each recurring pull. Compounds beautifully as merchants accumulate subscribers
- Premium plans: Custom domains, advanced analytics, A/B testing, affiliate management, multi-currency support
- Upsell revenue share: Small cut of upsell revenue generated through the platform
- Checkout page marketplace: Browse high-converting checkout templates. Free ones for basics, premium ones for proven funnels

**Unit economics:**

- 1,000 merchants × $100 average monthly revenue processed = $100,000/month
- Transaction fee at 1.5% = $1,500/month
- 100 premium merchants × $50/month = $5,000/month
- Total: ~$6,500/month at early stage, scales with merchant growth

# Technical Specifications

## Architecture

```
Merchant → Creates product + configures checkout
  ↓
Checkout Engine → Generates hosted/embeddable page
  ↓
Customer → Connects wallet, approves payment
  ↓
Tributary Pull → Executes one-time, subscription, or milestone payments
  ↓
Fulfillment → Triggers delivery (download, NFT, access, webhook)
  ↓
Post-Purchase → Upsells, order bumps, thank-you page
```

## How This Hooks Into Tributary

- **PayAsYouGo + Subscription + Milestone**: All three models used — one-time purchases, subscriptions, payment plans
- **Lighthouse integration**: Payment validation, subscription scheduling, milestone verification
- **Guardian module**: Fraud prevention, rate limiting, abuse detection
- **Loyalty module**: Merchant volume discounts, customer loyalty rewards

## Recommended Tech Stack

- **Frontend**: Next.js merchant dashboard, React checkout page components
- **Backend**: Rust payment engine, Redis for session management, PostgreSQL for merchant/product data
- **Database**: PostgreSQL for merchant/product/order data, Redis for real-time checkout state
- **Solana**: Tributary program for payments, SPL tokens for multi-currency support
- **Integrations**: Webhook system for fulfillment, email service for receipts

## MVP Scope

1. Basic product creation and hosted checkout page
2. One-time payment flow with wallet connection
3. Simple order bumps and upsells
4. Basic merchant dashboard with sales feed
5. Email receipts and basic fulfillment

# Non-Technological Requirements

- Merchant onboarding documentation and tutorials
- Legal review for payment processing (money transmission?)
- Refund flow design (on-chain transactions are irreversible)
- Customer support infrastructure for failed checkouts
- Wallet compatibility testing (Phantom, Solflare, Backpack)

# Potential Risks

- **Merchant education**: Most Solana merchants are technically capable but have never used a checkout page product. Onboarding must be dead simple
- **Wallet UX dependency**: The checkout experience is only as smooth as the wallet allows. Phantom and Solflare are good, but weird edge cases (mobile deep links, hardware wallets) will cause support tickets
- **Competitive moat**: Stripe Checkout took years to build and defend. On Solana, a competitor could fork the concept quickly. Execution speed and merchant lock-in (through subscription management) are the moats
- **Regulatory gray zone**: Processing payments for merchants may trigger money transmission concerns. Non-custodial design (funds go directly to merchant wallet) helps, but legal review is needed
- **Token volatility**: Merchants pricing in SOL face volatility risk. USDC-denominated checkouts solve this but add stablecoin dependency
- **Refund handling**: On-chain transactions are irreversible. Refund flows need to be built into the checkout product — merchant approves a push-back, or the customer requests through the platform
- **Support burden**: When a checkout fails, the customer blames the merchant. The merchant blames the checkout product. Clear error handling and merchant education are critical
