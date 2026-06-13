# Case 04 — Hire-track ceiling (Dilnoza)

**Tests:** the agent can award a HIGH score (guards against everyone clustering at Maybe-trial).
Synthetic strong candidate. Send the transcript, ask: "Evaluate (Telegram-concise)."

## Input
```
SYNTHETIC — fictional candidate "Dilnoza". No speaker labels.

 Hi, introduce yourself. You're okay in English?
 Yes, perfectly fine. I'm Dilnoza, third-year software engineering, I focus on backend and a bit of DevOps.
 What have you built?
 My main one is a booking + payments backend for a small clinic chain — FastAPI, Postgres, Redis,
 deployed on a VPS with Docker. Real users, around two thousand a month. I also freelance landing pages.
 Do you code yourself or use AI?
 Both. AI writes a lot, but I drive it. I read everything, and I make the architecture and the trade-off
 decisions myself — the AI is leverage, not the boss. From one to ten I'd say eight, I'm still improving on
 system design at real scale.
 Which models for what?
 Cheaper, faster model for boilerplate and refactors; the strong reasoning model for architecture and nasty
 bugs. And I never trust the first answer — I test it, and for design I cross-check against real cases.
 Okay, situation: client wants a scalable e-commerce site, ~100k users a month. Full AI access, 30 days, solo.
 Realistic? How do you start?
 Solo and perfectly scalable in 30 days isn't realistic — I'd commit to a solid MVP plus a clear scaling plan.
 To start: I load the whole client spec into the AI as context. Then I have it draft options and pull real
 examples — how others handle catalog, checkout, payment retries — and I compare. Then I challenge it: assume
 traffic spikes, assume payments fail, what breaks? Only then I decide the stack — Postgres with read replicas,
 Redis cache, a queue for orders. I write a wishlist, a roadmap, the data model and API contracts, documentation,
 and the mapping. Code comes last, and frontend after the backend is solid.
 If the database can't handle 500 users a week before launch?
 First measure — slow query logs, find the hot queries, add indexes, add caching for reads. If it's the schema
 or N+1 design, that's the real bug, and I'd refactor the worst path and load-test before I call it fixed.
 Honestly with seven days I'd protect the critical path and document the rest as known debt.
 Good. We're a product team, heavy AI use, one-month paid trial. Thoughts?
 Sounds like my kind of place. I like owning a problem end to end. The trial is fair.
 Thanks Dilnoza.
```

## Gold (expect)
- Overall ≈ **4.0–4.4 / 5**
- **Core Q ≈ 75–85/100** (strong band) — hits human-in-loop ("I drive it… I decide"), feed-context, AI research of real cases, red-team ("assume payments fail, what breaks?"), plan-before-code, stack+resources, dev-last.
- **Fit: HIRE-TRACK** + "needs human approval"
- English **5**; honest self-rating (8/10, backed); realistic about feasibility.

**Pass if:** core ≥ 70 and **Fit = Hire-track** (proves the ceiling fires).
**Fail if:** it caps her at Maybe-trial / can't exceed ~65 despite a clearly strong answer → the agent is too stingy; recheck anchors.
