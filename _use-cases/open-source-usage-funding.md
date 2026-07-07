---
name: Open Source Usage-Based Funding
summary: Package usage drives funding flows automatically — the npm install that pays
  the maintainer, no donations required.
category: "\U0001F527 Infrastructure & Tools"
status: "\U0001F4AD ideation"
protocol-version: v0
tributary_models:
- PayAsYouGo
- Subscription
category_slug: infrastructure-tools
---


# Every `npm install` pays the author.

A usage-based funding system where developers approve a monthly open-source budget and the system monitors their package dependencies, distributing funds proportionally to maintainers based on actual usage.

# Pitch of the Core Idea

Open source funding is broken. GitHub Sponsors is donation theater — median maintainer income from donations is under $200/month. Most maintainers earn nothing. Critical infrastructure runs on unpaid labor. The 2024 OpenSSF study found 86% of critical open source packages have ten or fewer contributors; 60% of maintainers receive no compensation. Donations, corporate sponsorship, Open Collective — they all share the same flaw: they rely on guilt and generosity. That's not a sustainable funding model.

Usage-based funding fixes this. Not donations. Not sponsorships. **Proportional payment for actual dependency usage.** Developers approve a monthly budget — say $10-50/month. The system monitors their package dependencies (via package.json, Cargo.toml, or on-chain program dependencies). Every month, funds are pulled automatically via Tributary's PayAsYouGo model and distributed proportionally to the maintainers of packages they actually use. Used React, Next.js, and Prisma this month? Your $20 budget splits across them based on usage weight. A package you imported once gets $0.10. A framework you depend on daily gets $8.

The pull primitive is essential: developers approve the budget once, then forget. No monthly decision about "should I donate this month?" No friction. The money moves invisibly, proportional to value received. Like utility billing for software infrastructure.

# Core Mechanics

1. **Budget Setup**: Developer approves a monthly open-source budget via Tributary delegation (e.g., $30/month cap, $5 max per pull).
2. **Dependency Monitoring**: System scans package.json, Cargo.toml, or on-chain program dependencies to build a dependency graph.
3. **Usage Weighting**: Each dependency is weighted by import frequency, transitive dependency depth, and direct vs indirect usage.
4. **Automatic Distribution**: At the end of each billing period, Tributary's PayAsYouGo pulls the budget and distributes proportionally to maintainers.
5. **Maintainer Payouts**: Maintainers receive aggregated micro-payments from thousands of developers. A package used by 50,000 developers each contributing $0.20/month generates $10,000/month.

Tributary primitives used: PayAsYouGo for pulling budgets, Subscription for recurring allocations, Forward routing for distributing to multiple maintainers.

# Psychological Hook and Addictiveness

**"Every install pays"** reframes open source consumption from free-riding to participation. Developers who set up the budget feel good — they're contributing without effort. The invisible nature of the payment is the feature: generosity that doesn't require willpower.

- **Usage dashboard**: "You funded 47 packages this month. Your most-supported project: React ($4.20)." The data is fascinating.
- **Maintainer income tracking**: Watching your open-source income grow month over month is deeply validating.
- **Dependency awareness**: Developers discover dependencies they didn't realize they had. The audit side-effect is valuable.
- **Community leaderboards**: "Top funders of open source this month" creates status-driven generosity.
- **Package health scores**: Projects with more funding show better maintenance metrics, creating a virtuous cycle.

# Brief Market Research

The open source funding landscape in 2026 is fragmented across 10+ channels with no dominant solution:

| Channel         | Realistic Maintainer Ceiling | Tax Handling                |
| --------------- | ---------------------------- | --------------------------- |
| GitHub Sponsors | $1k-$5k/month                | Maintainer's responsibility |
| Polar.sh        | $5k-$20k/month               | MoR (Polar handles)         |
| Open Collective | $5k-$30k/month (group)       | Host handles                |
| Tidelift        | $1k-$10k/month               | Tidelift handles            |
| Thanks.dev      | $10-$200/month/maintainer    | Stripe handles              |

**Key competitors**:

- **Thanks.dev**: Dependency-graph-based auto sponsorship — closest analog but corporate-focused, 0% platform fee, company subscription model.
- **Polar.sh**: Developer-first monetization with MoR, 5% fee, GitHub integration.
- **Open Source Endowment** (2026): Nonprofit aiming for $100M endowment to fund critical OSS — different model (endowment vs usage).

**Market size**: GitHub has 49,148+ sponsorable developers as of March 2026 (232% increase from 2022). The Open Source Pledge ($2k/year per engineer) could generate $200k+/year per 100-person company. Global OSS funding is estimated at $500M-$1B annually across all channels combined, but distribution is extremely skewed — top 1% captures most.

The gap: **nobody does usage-based proportional distribution**. Thanks.dev is close but targets companies, not individual developers. This use case fills the individual developer gap with a crypto-native solution.

# Business Model

- **Protocol fee**: 1% of all distributed funds (standard Tributary fee).
- **Gateway fee**: 0.5% for routing through the distribution gateway.
- **Premium dashboards**: $5/month for advanced analytics, dependency visualization, and tax reporting.
- **Enterprise tier**: Custom pricing for companies wanting to match employee contributions or sponsor specific packages.
- **Data licensing**: Anonymized dependency-to-funding correlation data for research.

Revenue scales with adoption: 10,000 developers at $30/month average = $3.6M/year in flow. At 1.5% total fee take, that's $54k/year — modest but growing with network effects.

# Summary of Technical Specifications

## Architecture

- **Dependency Scanner**: Parses package manifests to build dependency graphs. Supports npm, Cargo, PyPI, Go modules.
- **Usage Tracker**: Monitors actual imports/usage via package manager hooks or on-chain program dependency analysis.
- **Distribution Engine**: Calculates proportional splits based on usage weights. Handles thousands of micro-payments per cycle.
- **Maintainer Dashboard**: Real-time income tracking, dependency visualization, tax reporting.

## How This Hooks Into Tributary

- **PayAsYouGo**: Pulls developer's monthly budget automatically.
- **Forward routing**: Distributes pulled funds to multiple maintainer wallets in one transaction.
- **ComposablePolicy**: Defines budget caps, distribution rules, and usage weighting algorithms.
- **Lighthouse validation**: Verifies dependency graph accuracy and prevents gaming.

## Recommended Tech Stack

- **Solana + Anchor**: On-chain distribution logic and delegation management.
- **Tributary SDK**: Budget management and pull-payments.
- **Package registry APIs**: npm, crates.io, PyPI for dependency data.
- **Frontend**: Next.js + Tailwind for developer dashboard.
- **Indexer**: Helius or custom for tracking distribution history.

## MVP Scope

**2-3 day hackathon MVP**:

1. Connect wallet, set monthly budget ($10-50).
2. Input GitHub repo or package.json URL.
3. System parses dependencies, assigns weights.
4. Demo distribution to 3-5 test maintainer wallets.
5. Dashboard showing "You funded X packages this month."

Non-technical: Pre-populate with popular Solana ecosystem packages (Anchor, SPL Token, etc.) for demo.

# Non-Technological Requirements

- **Partnerships**: Package registries (npm, crates.io) for dependency data access. Maintainer communities for adoption.
- **Legal**: Tax implications for maintainers receiving income from thousands of micro-sources. May need fiscal host partnership.
- **Marketing**: Developer communities (GitHub, Twitter, Discord) for cold-start. Maintainer advocacy for two-sided marketplace.
- **Growth**: Cold-start problem — need both funders and maintainers. Start with Solana ecosystem where crypto-native devs are concentrated.

# Potential Risks

- **Cold start**: Maintainers won't sign up until funders exist. Funders won't pay until maintainers exist. Classic two-sided marketplace — mitigate by bootstrapping with Solana-native packages.
- **Gaming usage metrics**: Package authors could inflate import counts or create artificial dependencies. Mitigate with Lighthouse validation and usage attestation.
- **Fair allocation**: How do you weight a one-line utility vs. a framework? Usage-based doesn't mean value-based. Mitigate with configurable weighting algorithms.
- **Budget fatigue**: Developers accumulate subscriptions. The $10-50/month budget competes with every other recurring cost.
- **Tax implications**: Maintainers receiving income from thousands of micro-sources face accounting complexity.
