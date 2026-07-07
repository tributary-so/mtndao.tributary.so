---
name: Delegated Crowdfunding
summary: Kickstarter without the custodial risk — backers commit pull authority, not
  funds. Money stays in your wallet until the campaign earns it.
category: "\U0001F6D2 Commerce & Payments"
status: "\U0001F4AD ideation"
protocol-version: v0
tributary_models:
- Milestone
- PayAsYouGo
- Subscription
category_slug: commerce-payments
---


# Crowdfunding Without the Trust Problem

Backers don't send money. They grant **claim authority** — a delegation that lets the campaign pull from their wallet under specific conditions. The money stays in the backer's wallet until those conditions are met. The creator proves progress before a single cent moves.

# Pitch of the Core Idea

Crowdfunding is broken by a single design flaw: **money moves before value is delivered**. Kickstarter's own data shows ~9% of funded projects never deliver. That's hundreds of millions lost to custodial trust. The global crowdfunding market is $2.14B (2024), growing to $5.53B by 2030 at 17.6% CAGR. Kickstarter alone has facilitated $8B+ in pledges from 250K+ projects.

Pull-based crowdfunding eliminates the trust gap entirely. Backers "pledge" by approving a Tributary delegation. Funds remain in their wallet, earning yield, until the campaign claims them. Failed campaigns create zero friction — delegation expires, money was never touched. No refund process. No disputes. No chargebacks.

# Core Mechanics

1. **Creator launches campaign** with funding target, deadline, milestone roadmap
2. **Backers "pledge"** by approving Tributary delegation:
   - **All-or-nothing mode**: Campaign pulls only if total pledged crosses threshold by deadline
   - **Flexible mode**: Campaign pulls at any time, up to each backer's committed amount
   - **Milestone mode**: Campaign pulls incrementally as milestones verified
3. **Milestones verified** via oracle-confirmed, community vote, or manual backer approval
4. **Creator submits pull request** when milestones hit — Tributary pulls from every backer proportionally
5. **Failed campaigns**: Delegation expires. Money was never touched.

# Psychological Hook and Addictiveness

**"I committed, but my money is still mine."** Reframes crowdfunding from risky bet into conditional promise. Backers feel generous without feeling exposed. Perceived risk drops to zero — you're not "giving money," you're "authorizing a future pull if they deliver."

**Campaign momentum**: Live pledge counter approaching goal creates excitement. **Milestone dopamine**: Every milestone release is collective celebration — "We did it" energy. **Backer dashboard**: "You've backed 7 projects. 4 delivered, 2 in progress, 1 failed." Portfolio-style tracking. **Social proof cascades**: Visible pledges from respected members trigger bandwagon effects.

# Brief Market Research

| Metric                      | Data   |
| --------------------------- | ------ |
| Crowdfunding Market (2024)  | $2.14B |
| Projected (2030)            | $5.53B |
| CAGR                        | 17.6%  |
| Kickstarter Total Pledges   | $8B+   |
| Kickstarter Funded Projects | 250K+  |
| Non-delivery Rate           | ~9%    |

**Key Competitors**:

- **Kickstarter**: $8B+ pledged, all-or-nothing, custodial, 5% fee + 3-5% processing
- **Indiegogo**: Flexible funding, broader categories, 5% fee + 3-5% processing
- **GoFundMe**: Personal/charity focus, 0% platform fee (2.9% + $0.30 processing)
- **SeedInvest**: Equity crowdfunding, SEC-regulated, for startups
- **Republic**: Equity crowdfunding, revenue share, SEC-regulated

**All require custodial trust or are equity-based.** Delegated crowdfunding is trustless by construction.

# Business Model

- **Platform fee**: 3-5% on successful milestone claims (lower than Kickstarter's 5-8%)
- **Backer fee**: 1-2% on delegation creation (covers gas + platform cost)
- **Creator tools**: $10-50/mo for advanced campaign analytics, milestone management
- **Featured placement**: $100-500 for promoted campaigns
- **Success premium**: 1-2% bonus fee on campaigns exceeding goal by 50%+

# Summary of Technical Specifications

## Architecture

- Campaign manager (create, configure, manage campaigns)
- Delegation system (backers approve Tributary delegations)
- Milestone verification (oracle, community vote, manual approval)
- Pull engine (proportional pull from all backers on milestone)
- Campaign dashboard (pledge counter, milestone tracker, backer analytics)
- Failed campaign handling (delegation expiration, notification)

## How This Hooks Into Tributary

- **Milestone**: Milestone-based pull from backers
- **PayAsYouGo**: Flexible mode — continuous pull up to committed amount
- **Subscription**: Ongoing creator funding (patreon-style)
- **ComposablePolicy**: Defines campaign rules, milestones, conditions

## Recommended Tech Stack

- Solana + Anchor
- Tributary SDK (Milestone + PayAsYouGo)
- Oracle integration for milestone verification (Pyth/Switchboard or custom)
- React campaign builder
- Telegram/email notification system
- IPFS for campaign content

## MVP Scope

- All-or-nothing mode only
- Single milestone (final delivery)
- Basic campaign page with pledge counter
- Delegation creation and management
- Buildable in 3 days with Tributary SDK

# Non-Technological Requirements

- **Creator onboarding**: Need creators to set up campaigns — two-sided marketplace problem
- **Milestone verification**: Need reliable verification for non-trivial milestones
- **Community building**: Need backers to discover and trust campaigns
- **Legal compliance**: Delegated pledges may be classified differently across jurisdictions
- **Fulfillment infrastructure**: Need logistics for physical product campaigns

# Potential Risks

- **Pledge inflation**: Backers over-commit across campaigns. If multiple claim simultaneously, wallets could drain. Hard caps essential
- **Creator verification**: Who verifies milestone is actually met? Oracle manipulation, fake deliverables are hard problems
- **Revocation abuse**: Backers revoke right before milestone claim, undermining creator trust. Needs lock-up periods
- **Cold start problem**: Creators won't use without backers. Backers won't pledge without credible creators
- **Regulatory ambiguity**: Is a delegated pledge a "security"? "Pre-sale"? "Donation"? Legal classification varies by jurisdiction
- **Gas complexity**: Pulling from hundreds of delegated wallets generates significant transaction costs. Batch claiming critical
