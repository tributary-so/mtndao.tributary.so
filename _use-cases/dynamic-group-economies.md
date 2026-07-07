---
name: Dynamic Group Economies
summary: Shared wallets for friend groups, roommates, and communities — expenses settle
  automatically, nobody chases anyone for money.
category: "\U0001F465 Social & Community"
status: "\U0001F50D research"
protocol-version: v0
tributary_models:
- PayAsYouGo
- Subscription
category_slug: social-community
---


# Dynamic Group Economies

Shared wallets for friend groups, roommates, and communities — expenses settle automatically, nobody chases anyone for money.

# Pitch of the Core Idea

Splitwise exists because splitting bills is painful. Venmo exists because paying each other back is awkward. Both solve symptoms. Neither solves the root problem: **people shouldn't have to think about money within trusted groups**.

Delegation creates a middle ground between individual wallets and multisigs. Friends delegate small spending permissions to the group. The group acts as an economic unit without custody.

A group is formed when members delegate constrained spending rights via Tributary:

- **Group budget**: Each member approves a monthly contribution (e.g., €50/month). The group can spend up to the total delegated pool
- **Auto-split**: Group expenses — dinners, gifts, trips, subscriptions — pull from the pool and split automatically. No "you owe me $23" conversations
- **Category budgets**: "Up to €30/month on shared subscriptions, €20 on gifts, remainder flexible"
- **Permission tiers**: All members contribute equally, or weighted by income/usage. Configurable
- **Friendship streams**: Small delegated permissions between individuals. "I trust Alice to buy me lunch up to $20/month." Not custody. Just permission.

The pull primitive eliminates the entire "chase people for money" dynamic. When the group incurs an expense, the system pulls each member's share automatically. Nobody asks. Nobody reminds. Nobody feels awkward. Money moves like it does between close friends — smoothly, without accounting.

Extended to autonomous friendships: birthdays trigger automatic gift budgets. Events trigger travel contributions. Life milestones trigger support payments. The friendship becomes a programmable economic relationship, not just a social one.

# Core Mechanics

1. **Group Formation**: Members invite friends, set contribution amounts and rules
2. **Delegation Setup**: Each member approves monthly contributions via Tributary pull
3. **Expense Logging**: Any member logs a group expense (dinner, gift, trip)
4. **Auto-Split**: System pulls each member's share automatically based on configured split rules
5. **Category Budgets**: Separate pools for different expense types (food, gifts, travel, subscriptions)
6. **Friendship Streams**: Bilateral micro-delegations between close friends
7. **Milestone Automation**: Birthdays, anniversaries, life events trigger automatic contributions

# Psychological Hook and Addictiveness

**Money between friends just works.** The relief of never having an awkward money conversation again is enormous. Friendships die over money disputes. Automated splitting eliminates the dispute entirely. The group acts like a household — shared expenses, shared convenience, zero friction.

**Frictionless sharing**: "I got dinner" actually means "I initiated a group expense that auto-split"

**Group memories**: Dashboard of every shared expense — dinners, trips, gifts — becomes a social scrapbook

**Trust accumulation**: The longer a group runs without disputes, the more members increase their delegation

**Spontaneous coordination**: "Let's all chip in for Sarah's birthday" becomes one tap, not 8 DMs

**Social bonding**: Groups that share finances develop stronger social ties. Economic interdependence creates real community

# Brief Market Research

The **social commerce market** was valued at $872B-$2T in 2025, with the group buying segment specifically at $33-95B. Community group buying reached $13.5B in 2025 and is projected to hit $44.4B by 2034 (14.2% CAGR).

Key competitors in adjacent space:

- **Splitwise** (50M+ users): Expense splitting, but no autonomous execution — still requires manual payment
- **Venmo/Zelle**: Peer-to-peer payments, but no group budgeting or automatic splitting
- **Groupon**: Group buying for deals, but no shared wallet or ongoing group economics
- **Pinduoduo**: Community group buying in China ($300B+ market cap), but focused on product purchases, not social expense sharing
- **Meituan**: Chinese super-app with group buying + local services
- **TikTok Shop**: Social commerce integration, but no shared group dynamics

The gap: No platform combines **shared spending authority** with **automatic execution**. Splitwise tracks debt. Venmo executes payments. Neither provides the autonomous group wallet that Tributary enables.

# Business Model

**Transaction Fee**: 1-3% on all group expenses. Low enough to be invisible, high enough to scale.

**Premium Groups**: Free tier (3 members, $200/mo cap), Pro ($5/mo, 10 members, $1K/mo cap), Family ($10/mo, 20 members, $5K/mo cap).

**Milestone Automation**: $2-5 per automated milestone (birthday gift, anniversary contribution). Premium feature.

**Insights Dashboard**: Aggregated group spending analytics for budgeting-conscious users.

**Merchant Partnerships**: Revenue share with restaurants, event venues, travel platforms that benefit from group spending.

# Summary of Technical Specifications

## Architecture

- **Group Wallet Layer**: Tributary delegation with multi-member contribution pools
- **Expense Engine**: Real-time expense logging, splitting, and automatic pull execution
- **Category System**: Configurable budget categories with separate pools and rules
- **Milestone Scheduler**: Automated triggers for birthdays, anniversaries, life events
- **Friendship Streams**: Bilateral micro-delegation between individuals
- **Analytics Dashboard**: Group spending visualization, contribution tracking, memory timeline

## How This Hooks Into Tributary

The **pull primitive** eliminates the "chase people for money" problem. Without Tributary:

- Group expenses require manual reimbursement (Splitwise model)
- Shared cards create custody and liability issues
- Multisig wallets are too complex for casual friend groups
- Venmo/Zelle require per-transaction action

With Tributary, each member approves contributions once. The group spends. Members are pulled automatically. No reminders. No awkward conversations. No debt tracking.

The **PayAsYouGo model** enables real-time splitting. The **Subscription model** enables predictable monthly contributions. Both work together for different expense types.

## Recommended Tech Stack

- **Protocol**: Tributary (PayAsYouGo + Subscription)
- **Backend**: Node.js/TypeScript API with real-time expense processing
- **Database**: PostgreSQL for group profiles, Redis for real-time splitting, event sourcing for expense history
- **Frontend**: React Native mobile app with group dashboards
- **Integrations**: Plaid for bank connections, Stripe for merchant payments, calendar APIs for milestone triggers
- **Notifications**: Push notifications for expense alerts, contribution reminders, milestone celebrations

## MVP Scope

1. **Group formation**: Invite friends, set contribution amounts
2. **Basic expense splitting**: Log expense, auto-split equally or by custom ratios
3. **Automatic execution**: Tributary pulls each member's share on expense logging
4. **Monthly contributions**: Subscription-based group budget with auto-replenishment
5. **Group dashboard**: Real-time view of shared expenses, balances, contribution history
6. **Simple milestone**: Birthday automation with configurable gift budgets

# Non-Technological Requirements

- **Trust calibration**: Help users set appropriate delegation levels without over-committing
- **Conflict resolution**: Clear terms for disputed expenses, exit mechanics for departing members
- **Social norms**: Design that avoids implicit comparison of contribution amounts ("Bob only gives €10?")
- **Legal clarity**: Group financial arrangements may have tax implications in some jurisdictions
- **Education**: Most users have never had a "shared wallet" — need clear onboarding

# Potential Risks

- **Free rider problem**: Members who consume group resources disproportionately without increasing their delegation
- **Group dissolution**: When members leave, how are remaining funds distributed? Needs exit mechanics
- **Spending disputes**: "I didn't agree to that group expense" requires dispute resolution
- **Social pressure**: Visible delegation amounts create implicit comparison ("why is Bob only contributing €10?")
- **Relationship strain**: Automating money between friends changes the nature of the relationship. Some friendships can't handle financial entanglement
