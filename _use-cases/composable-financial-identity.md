---
name: Composable Financial Identity
summary: Your payment history becomes your credit score, your reputation, your passport
  — all onchain.
category: "\U0001F527 Infrastructure & Tools"
status: "\U0001F4AD ideation"
protocol-version: v0
tributary_models:
- PayAsYouGo
- Subscription
category_slug: infrastructure-tools
---


# Your Wallet Is Your Reputation

Onchain behavioral data — proof that this wallet represents a reliable, consistent, economically rational actor. Tributary's pull primitive generates this data as a natural byproduct of existing payment flows.

# Pitch of the Core Idea

Onchain identity is a solved problem in search of data. Everyone has a wallet address. Nobody knows what to do with it. NFT profile pictures and ENS names are decorative. What's missing is **behavioral data** — proof that this wallet represents a reliable, consistent, economically rational actor.

A user approves recurring pull access to their wallet. Not for one app — for their entire financial life. Taxes auto-pay. Savings auto-accumulate. Insurance premiums pull monthly. DAO dues deduct. Memberships renew. Portfolio fees settle. Every pull creates a data point. Over months, the wallet develops a rich, verifiable payment history. From this history, you extract composable financial personas: "high spender," "diamond hands," "degen tier 5," "supports open source," "reliable subscriber." These aren't self-attested — they're cryptographically provable claims derived from actual onchain behavior.

Third-party apps query spending patterns (with explicit consent) to offer better terms. DeFi protocols offer lower collateral requirements to wallets with consistent repayment history. Undercollateralized lending becomes possible because the lender can verify — onchain — that this wallet has never missed a subscription payment in 18 months.

# Core Mechanics

1. **User approves recurring pull access** to their wallet for various financial activities
2. **Automated payments create behavioral data**: taxes, savings, insurance, memberships, subscriptions
3. **Each pull creates a data point** — verifiable onchain payment history
4. **Composable personas extracted**: "high spender," "diamond hands," "reliable subscriber"
5. **Third-party apps query** spending patterns (with consent) to offer better terms
6. **Credit scoring becomes transparent**: user-controlled, composable across protocols

# Psychological Hook and Addictiveness

**"My wallet is my reputation."** Reframes spending from consumption to investment in identity. Every payment isn't just a cost — it's a deposit into social and financial credit. Users who understand this optimize spending patterns to build the persona they want.

**Gamification of financial responsibility**: Streak mechanics (X months on-time payments), tier progression (Silver → Gold → Diamond), visible social proof (verifiable badges). Same psychology as credit card churning, applied to identity construction.

# Brief Market Research

| Segment               | Data                            |
| --------------------- | ------------------------------- |
| Credit Scoring Market | $12B+ globally                  |
| On-chain Identity     | Early stage, no clear leader    |
| DeFi Credit           | Experimental (Goldfinch, Maple) |
| Soulbound Tokens      | EIP-5192 standard exists        |

**Key Competitors**:

- **Spectral Finance**: On-chain credit scoring, but limited to DeFi activity
- **ARCx**: Soulbound credit scores, but early stage
- **Goldfinch**: Decentralized credit protocol, but requires off-chain verification
- **Maple Finance**: Institutional undercollateralized lending, KYC-based
- **Sismo**: Zero-knowledge attestations, but not payment-focused

**None generate behavioral data from automated payment flows.** Tributary's pull primitive creates the data layer as a byproduct.

# Business Model

- **Identity-as-a-Service**: $0.50-2/query for third-party apps accessing credit data
- **Premium credit reports**: $5-15/mo for detailed credit analytics and scoring
- **Protocol integration fees**: DeFi protocols pay to access Tributary credit data for lending decisions
- **Data licensing**: Anonymized payment pattern data for institutional research
- **Identity verification**: $1-5 per verification for KYC-lite onboarding

# Summary of Technical Specifications

## Architecture

- Payment monitoring layer (tracks all Tributary payment flows)
- Behavioral analytics engine (extracts personas from payment patterns)
- Credit scoring model (payment history → creditworthiness score)
- Consent management (user controls what data is shared)
- Query API (third-party apps access credit data with authorization)
- Attestation layer (on-chain verifiable claims)

## How This Hooks Into Tributary

- **PayAsYouGo**: Generates continuous payment data from automated flows
- **Subscription**: Generates recurring payment history for credit scoring
- **ComposablePolicy**: User controls what data is generated and shared

## Recommended Tech Stack

- Solana + Anchor
- Tributary SDK for payment monitoring
- Zero-knowledge proofs for privacy-preserving queries
- On-chain attestations (Soulbound tokens or equivalent)
- Analytics pipeline (Apache Spark or similar)
- REST API for third-party access

## MVP Scope

- Basic payment tracking across Tributary flows
- Simple credit score (payment consistency, on-time rate)
- User dashboard showing credit profile
- Basic API for querying credit scores
- Buildable in 3 days with Tributary SDK + analytics layer

# Non-Technological Requirements

- **Privacy framework**: Payment history is sensitive. ZK proofs essential but add complexity
- **Regulatory compliance**: Financial profiling triggers consumer protection scrutiny
- **Partnership with DeFi protocols**: Need lending protocols to accept Tributary credit scores
- **User consent management**: GDPR/CCPA compliance for data access
- **Credit model validation**: Need to prove credit scores correlate with actual creditworthiness

# Potential Risks

- **Privacy catastrophe**: Payment history is sensitive. Zero-knowledge proofs essential but add complexity
- **Sybil resistance**: Fresh wallets have no history. New user cold-start problem is real
- **Gaming the score**: Once scoring criteria are known, behavior optimizes for metric, not genuine reliability
- **Centralization pressure**: If one scoring standard dominates, it becomes the new credit bureau
- **Regulatory**: Financial profiling triggers consumer protection scrutiny in most jurisdictions
