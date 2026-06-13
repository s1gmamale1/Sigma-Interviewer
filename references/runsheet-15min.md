# The 15-minute interview runsheet

A tight, high-signal format for screening junior AI-orchestration talent. Designed for an interviewer who wants speed and a "pressure-and-watch-them-climb" style. The interviewer should talk **≤20–30%** of the time.

## Runsheet

| Time | Block | What you're reading | Tool |
|---|---|---|---|
| 0:00–1:00 | Intro + **English gate** | Can they hold English at all? (know in 60s) | — |
| 1:00–3:00 | One project, fast: *"What did **you** decide vs. what AI/others did?"* | Director vs. executor | — |
| **3:00–9:00** | **Core question + hint-ladder** (the meat) | AI-orchestration process + **learnability** | 0–100 key + ladder |
| 9:00–11:00 | *"Which AI model for what — and how do you catch it being wrong?"* | Real AI depth & verification habit | rubric: AI knowledge |
| 11:00–13:30 | **Your offer / company pitch** (jump here on purpose) | Reaction to terms & pressure | — |
| 13:30–15:00 | Their questions + logistics | Motivation, fit | — |

## The dynamic-assessment hint-ladder
The core question is where you apply **dynamic assessment**: pressure a weak point with a *standardized* ladder and grade **how far they climb per push**. This measures *learning potential* (Vygotsky's Zone of Proximal Development) — the trait you're hiring for.

Rules:
- **Push with hints/questions, never the full answer.** The instant you hand over the solution, you've taught it and can no longer measure whether they had it.
- **Same ladder for everyone** → fair and comparable (the fix for stress-interview unfairness).
- **Score the elevation**, not the start. Note which rung they needed.

Ladder for the core ("how would you build it?") question:
- **R0 — open:** *"Client spec, full AI access, 30 days, solo. Walk me through your process from the moment you get the order."*
- **R1 — nudge:** *"Before any code — what happens first?"*
- **R2 — hint:** *"What's AI's job here, and what's **yours**?"* → probes human-in-the-loop.
- **R3 — hint:** *"How do you make sure the idea is right **before** building?"* → probes research / red-teaming.

Reading it:
- **High at R0** → strong (advance).
- **Climbs at R1–R2** → coachable; this is the hire signal for juniors.
- **Flat or defensive at R3** → pass.

## Testing "confident vs. arrogant" (coachability)
When a candidate **overclaims** (e.g. self-rates 9/10), push directly on it: *"Show me the agent system / library you built."*
- Owns the gap and adjusts → **coachable** → green light.
- Doubles down / bluffs → **disqualifier.**

This resolves the most common gut-vs-evidence trap: smooth confidence read as competence.

## Optional async work-sample (no interview minutes)
Send a 20-minute take-home: *"Use AI to scope this feature — return the plan, the model(s) you used, and where you overrode the AI."* A work sample is among the most predictive selection methods; the candidate's *plan + overrides* reveal the human-in-the-loop discipline directly.
