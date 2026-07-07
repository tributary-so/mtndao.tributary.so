---
name: Personal Constitutions
summary: Your wallet becomes a moral operating system — spending rules that enforce
  your values, not just your budget.
category: "\U0001F9E0 Psychology & Emotion"
status: "\U0001F4AD ideation"
protocol-version: v0
tributary_models:
- PayAsYouGo
- Subscription
category_slug: psychology-emotion
---


# Your wallet becomes a moral operating system — spending rules that enforce your values, not just your budget

# Budgeting apps constrain amounts. They don't constrain values. What if your wallet enforced what you believe, not just what you can afford?

# Core Mechanics

Users define their constitution — a set of spending principles enforced by Tributary's pull primitive:

- "Never spend more than X on gambling" — hard cap on vice spending
- "Always donate 2% of income" — automatic charitable allocation
- "Always support open source" — proportional package funding
- "Always save for children" — education fund priority
- "Never fund companies on my blacklist" — value-based merchant exclusion
- "Reward learning" — automatically fund courses, books, educational content
- "Penalize waste" — charge yourself an internal "carbon tax" that routes to environmental causes

The constitution isn't a budget. It's a policy engine. Tributary intercepts transactions and routes, blocks, or modifies them based on the rules. The user defines the constitution once. The protocol enforces it continuously. Every payment that passes through the system is filtered through the user's stated values.

Constitutions are composable and shareable. A "minimalist constitution" template. An "environmentalist constitution." A "Catholic values constitution." Communities form around shared financial constitutions. "We're the people who auto-donate 5% and ban fast fashion."

# Psychological Hook

**"My wallet is a moral operating system."** This reframes financial management from anxiety-inducing budgeting to an act of identity expression. You're not restricting yourself — you're programming your values into your money. Every transaction becomes an affirmation of who you are.

The loss-aversion inversion is powerful: violating your own constitution feels like betraying yourself, not just overspending. The emotional stakes are higher than money.

- **Identity reinforcement**: Every enforced rule is proof that you're who you say you are
- **Constitution drafting**: The act of defining your values is inherently engaging. Users spend hours refining rules
- **Community belonging**: Shared constitutions create tribes. "We're the 2%-donators"
- **Moral accounting**: Monthly reports showing "you donated $X, avoided $Y in vice spending, saved $Z for education"
- **Progressive enhancement**: Start simple (donate 1%), gradually add rules. The constitution evolves with you

# Brief Market Research

Ethical spending tools are a growing niche, but none enforce rules at the protocol level.

**Current alternatives:**

- **Conscious (app)**: Tracks carbon footprint of purchases — passive tracking, no enforcement
- **Kestrl**: Muslim ethical finance app — focuses on halal investing, not spending rules
- **Commons app**: Climate-conscious spending — tracks impact but doesn't block transactions
- **Wholeheartedly**: Values-based budgeting — manual categorization, no automation
- **Goodbudget/YNAB**: Digital envelope budgeting — amount constraints only, no value constraints
- **StewardWise**: Christian financial management — guidelines, not enforcement

**The gap**: Every existing solution relies on user discipline. They suggest, they don't enforce. Tributary's Pull Payment model enables hard enforcement — rules execute automatically at the protocol level, not through willpower.

# Business Model

**Revenue streams:**

- Template marketplace: Premium constitution templates (e.g., "Catholic values", "FIRE Constitution", "Minimalist")
- Community features: Shared constitutions with group accountability ($5/month)
- Analytics dashboard: Monthly moral accounting reports ($3/month)
- Integration fees: Tools that respect constitution rules pay for access to user bases

**Unit economics:**

- 10,000 users × $3/month analytics = $30,000/month
- 500 premium template purchases × $20 = $10,000/month
- Community groups × $5/month = $15,000/month
- Total: ~$55,000/month at scale

# Technical Specifications

## Architecture

```
User → Drafts constitution (rules + thresholds)
  ↓
Constitution Engine → Compiles rules into enforcement logic
  ↓
Tributary Intercept → Monitors all pull payments against constitution
  ↓
Rule Evaluation → Allow / Block / Redirect / Modify each transaction
  ↓
Monthly Report → Aggregates compliance and generates moral accounting
  ↓
Community Layer → Shared constitutions, group accountability
```

## How This Hooks Into Tributary

- **PayAsYouGo + Subscription**: Constitution rules define how pull payments are routed and blocked
- **Lighthouse integration**: Monthly constitution reports and compliance summaries
- **Guardian module**: Real-time transaction filtering against constitution rules
- **Loyalty module**: Compliance rewards — consistent adherence unlocks template discounts

## Recommended Tech Stack

- **Frontend**: Next.js constitution editor with rule builder UI
- **Backend**: Rust rule engine evaluating transactions against constitution
- **Database**: PostgreSQL for constitution storage, Redis for real-time rule caching
- **Solana**: Tributary program for transaction interception, SPL tokens for routing
- **Analytics**: Custom dashboard for moral accounting and compliance metrics

## MVP Scope

1. Basic constitution editor (add/edit/remove rules)
2. Simple rule types: cap, percentage, blacklist, category filter
3. Real-time transaction evaluation against constitution
4. Monthly compliance report
5. One shared constitution template

# Non-Technological Requirements

- Legal review for financial enforcement (can users actually block their own transactions?)
- User research on rule types (hard block vs. soft notification vs. friction)
- Tax advisor consultation (constitutional donations may have tax implications)
- Community moderation guidelines for shared constitutions

# Potential Risks

- **Self-righteousness**: "My wallet is more ethical than yours" is an insufferable social dynamic
- **Value rigidity**: Values change. Constitutions that can't evolve become prisons
- **Enforcement vs. aspiration**: Hard-blocking transactions feels paternalistic. Soft enforcement (notifications, friction) may be more appropriate
- **Category ambiguity**: Is a craft beer "vice spending" or "supporting local business?" Classification disputes are inevitable
- **Gamification of morality**: Optimizing for constitutional compliance isn't the same as being a good person
