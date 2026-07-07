---
name: Intent-Based Finance (The Agent)
summary: Specify goals, not rules. 'Grow my SOL.' 'Best risk-adjusted yield.' 'Save
  for my tax bill.' The agent decides where, when, and how much — within guardrails
  you defined.
category: "\U0001F916 AI & Automation"
status: "\U0001F50D research"
protocol-version: v0
tributary_models:
- PayAsYouGo
- Subscription
category_slug: ai-automation
---


# Say What You Want. The Agent Figures Out How.

Specify goals, not rules. "Grow my SOL." "Best risk-adjusted yield." "Save for my tax bill." The agent decides where, when, and how much — within guardrails you defined.

# Pitch of the Core Idea

Stage 1 users trusted the system to route capital. Stage 2 users trusted it to enforce their constraints. Stage 3 asks for the final, biggest leap: let the system **make the decisions**. Not "execute my schedule," not "obey my rules" — "achieve my outcome, and figure out the rest yourself."

This is genuinely novel. The closest analogs are Wealthfront and Betterment, but those are custodial TradFi products. A non-custodial agent that makes allocation decisions on-chain, within user-defined guardrails, composably across DeFi — this category doesn't quite exist yet. By the time we reach it, users have already climbed three rungs of trust, so the ask is far smaller than it would be cold.

The critical design property: **the agent never bypasses Tributary**. It composes policies _through_ it. Every decision the agent makes is expressed as a Tributary-delegated action, gated by the user's constraints, and recorded on-chain. The user can always see what the agent did, why it was allowed, and revoke authority instantly.

# Core Mechanics

1. **Intent Specification**: User expresses goal in natural language ("Grow my SOL conservatively") → agent interprets against current market state and user's guardrails
2. **Plan Generation**: Agent produces allocation plan — which protocols, how much, when to rebalance
3. **Policy Composition**: Plan becomes set of Tributary policies and composable pulls, expressed through same primitives as prior stages
4. **On-Chain Execution**: Pulls fire, routing happens, capital moves — all within user-defined constraints
5. **Auditable Accounting**: Every decision is an on-chain action — agent is never a black box
6. **Continuous Learning**: Agent refines strategy based on outcomes, user feedback, market conditions

**Tributary Primitives Used**:

- PayAsYouGo for continuous capital deployment within guardrails
- ComposablePolicy for user-defined constraints and risk parameters
- Lighthouse for real-time market data and portfolio validation
- Forward for automatic rebalancing and yield distribution

# Psychological Hook and Addictiveness

"I don't think about protocols anymore. I think about outcomes." The moment a user realizes they can say "grow my SOL conservatively" and the system just… does it — choosing venues, managing risk, rebalancing — without the user ever opening a DeFi UI again. That is the moment the category changes. Every prior stage was reducing the work of managing capital. This stage eliminates it.

**Outcomes, not mechanics**: Users stop caring which protocol their yield came from and start caring whether their goal was met. The abstraction is total. **Deepening delegation**: The ultimate trust signal is users who set an intent and _increase_ the agent's latitude over time. Retention curves that slope upward as trust compounds. **Constrained, not black-box**: Unlike a custodial advisor, every action is auditable and revocable. The agent earns its authority one visible, verifiable decision at a time.

# Brief Market Research

The robo-advisory market was $10.84 billion in 2024, projected to reach $154 billion by 2034 (30.4% CAGR). Robo-advisors stewarded approximately $1.2 trillion at year-end 2024. The market is dominated by custodial platforms: Vanguard ($365B AUM), Schwab ($89.5B), Betterment ($56.4B), Wealthfront ($35.3B).

**Key Competitors**:

- **Wealthfront**: $35.3B AUM, fully automated, 0.25% fee — custodial, TradFi only
- **Betterment**: $56.4B AUM, hybrid model, 0.25% fee — custodial, limited DeFi integration
- **Vanguard Digital Advisor**: $21.2B AUM, 0.15% fee — massive distribution, traditional assets
- **Robinhood Strategies**: New entrant, algorithmic portfolio service, $0 commission
- **PortfolioPilot**: AI-driven, $2B AUM in 24 months, generative AI chat interface

The market is entirely custodial. No platform offers non-custodial, on-chain, intent-based investing across DeFi protocols. This is the blue ocean. Tributary's composable policy layer enables the first truly autonomous, non-custodial asset management agent.

# Business Model

**Revenue Streams**:

- **Management Fee**: 0.25-0.50% annually on assets under management (AUM)
- **Performance Fee**: 10-20% of gains above benchmark (optional, aligns incentives)
- **Premium Features**: Advanced AI strategies, priority execution, tax optimization — $19-99/month
- **Enterprise API**: Companies integrate intent-based investing for employees/clients — $100-1000/month

**Cost Structure**:

- Solana transaction fees: ~$0.00025 per rebalancing event
- AI inference: $0.01-0.10 per intent interpretation
- Infrastructure: $2000-5000/month for AI models and monitoring
- Smart contract audits: $50-200K initial

**Unit Economics**: At 10,000 users with average $10,000 AUM, platform revenue is ~$300,000/year (0.3% management fee) minus $100,000/year costs = $200,000/year profit. Performance fees on 10% average gains add $100,000/year.

# Summary of Technical Specifications

## Architecture

- **Frontend**: React web app with natural language intent input
- **Backend**: Solana program for policy composition and execution, AI inference layer
- **AI Engine**: LLM-based intent interpretation, market analysis, strategy generation
- **DeFi Integration**: Adapter layer for multiple protocols (Aave, Lido, Jupiter, etc.)

## How This Hooks Into Tributary

- **PayAsYouGo**: Core primitive — continuous capital deployment within guardrails
- **ComposablePolicy**: User-defined constraints and risk parameters
- **Lighthouse**: Real-time market data and portfolio validation
- **Forward**: Automatic rebalancing and yield distribution

## Recommended Tech Stack

- **Blockchain**: Solana (low fees essential for frequent rebalancing)
- **Framework**: Anchor for Solana program, React frontend
- **SDK**: Tributary SDK for payment flows
- **AI**: OpenAI/Anthropic for intent interpretation, custom models for strategy generation
- **DeFi**: Jupiter/Marinade/Aave adapters for multi-protocol deployment

## MVP Scope

**2-3 Day Hackathon Build**:

- Basic intent input ("Grow my SOL")
- Simple strategy generation (staking vs. lending)
- Tributary integration for policy composition and execution
- Basic dashboard showing agent decisions and portfolio performance

**Not in MVP**: Natural language interface, multi-protocol support, advanced AI strategies, tax optimization.

# Non-Technological Requirements

- **Trust Building**: Users need to see consistent, auditable decisions before delegating more authority
- **Regulatory Compliance**: Autonomous investment advice may trigger SEC/FINRA requirements — legal review essential
- **Risk Communication**: Clear documentation of agent capabilities, limitations, and risk parameters
- **Support Infrastructure**: Users will have questions about agent decisions — support team needed
- **Community**: User community for sharing intents, strategies, and feedback

# Potential Risks

- **Decision Acceptance**: The biggest behavioral leap on the ladder. Users will second-guess the agent's first few decisions. The on-chain auditability is the only thing that makes this survivable
- **Black-Box Perception**: Even with full transparency, "the AI decided" carries a trust tax that "the policy fired" does not. UX must make reasoning legible, not just logged
- **Goal Ambiguity**: "Grow my SOL conservatively" is underspecified. The agent must either ask clarifying questions or interpret conservatively enough that surprises are upside, not downside
- **Failure Mode Asymmetry**: One bad allocation decision undoes months of trust-building. The guardrails are the entire safety net; if they're loose here, the agent can do real damage
- **Regulatory Risk**: Autonomous investment advice may be classified as investment advisory services — SEC registration may be required
- **This Is the Venture Bet**: Stage 3 is where the company becomes fundable on the agentic narrative. If users don't escalate to intent-level delegation, the ladder stalls here
