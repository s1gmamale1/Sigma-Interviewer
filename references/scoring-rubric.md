# Scoring rubric

Two instruments: the **7-dimension rubric** (the whole interview) and the **0–100 core-question key** (the one big design question). Always back scores with a quote, and score each dimension independently.

## A. The 7 dimensions (1–5)

| Dimension | What you're measuring | Look for |
|---|---|---|
| **English** | Can they sustain a *technical* conversation in English? | Full sentences, correct terms, no fallback to another language. **Hard gate** if the role requires English. |
| **Behaviour / communication** | Clarity, honesty, composure, coachability | Direct answers, owns gaps, not defensive under push |
| **Response completeness** | Do answers land or fragment? | Complete, structured replies vs. one-word dodges |
| **AI knowledge** | How well they *use* AI | Right model/tool for the job, deliberate prompting, **verifies** AI output |
| **Critical thinking** | Reasoning quality | Challenges assumptions, red-teams, reasons from cases |
| **Decision-making** | Judgment under ambiguity | Makes a call and justifies it; doesn't freeze |
| **Architecture / system design** | Conceptual grasp | Data/back-end-first instinct; separates concerns; designs before building |

**Anchors:** `5` = fluent/expert, unprompted depth · `4` = strong, minor gaps · `3` = competent, correct instinct, real gaps · `2` = shallow, needed prompting · `1` = absent or wrong, needed full correction.

## B. Weighting (tune to the role)
Default for **junior AI-orchestration** hires — *personality over skills, skills conceptual*:
- **Personality / traits ≈ 55%** — critical thinking, learning speed/coachability, discipline & punctuality, decision-making, **self-awareness/integrity**, communication.
- **AI fluency & problem approach ≈ 25%.**
- **Conceptual technical foundation ≈ 20%.**
- **English = pass/fail gate** (not a weighted slice).

> Self-awareness is a *trait*: a candidate who self-rates 9/10 but can't back it should **lose** points under a personality-first weighting, not gain them. Confident delivery is not competence.

## C. The 0–100 core-question key

**Question:** *"A client wants a scalable product (e.g. ~100k-user e-commerce). You have full AI access, 30 days, solo. Is it realistic, and how do you start?"*

Grade the **process**, not whether they say "yes/no." The ideal is **human-directed AI orchestration with research and planning before code**:

| Component | Pts |
|---|---|
| **Human-in-the-loop:** AI proposes, the human approves & makes the critical decisions | **25** |
| Feed AI the spec/requirements (TZ) as context first; orchestrate AI as leverage | 15 |
| AI does **research from real cases / online** (evidence, not vibes) | 15 |
| **Challenge the idea** — theories, assume scenarios, red-team | 15 |
| Planning artifacts **before code**: wishlist → roadmap → plan → documentation → final mapping | 15 |
| Deliberate **environment/stack** choice + resource allocation | 10 |
| Sequencing: **development LAST** (not front-end-first, not one-shot) | 5 |
| **Total** | **100** |

**Anti-patterns (score near 0 on the relevant rows):** "I'd start coding / from the front-end," "one-shot prompt the whole thing," "I can't plan," over-optimistic "done in a day."

**Calibration band (typical):**
- **70–100** — strong: leads with research + human-in-the-loop decisions, plans before building.
- **30–69** — partial: gestures at documentation/planning or names AI tools, but shallow on the decision discipline or research.
- **0–29** — anti-pattern: jumps to code, front-end-first, or can't articulate a process.

## D. Turning scores into a verdict
- Overall = weighted blend (Section B) on a /5 scale, **but** two overrides:
  1. Missing a **hard requirement** (e.g. English collapse) caps the ceiling.
  2. A **credibility flag** (inflated/contradictory claims) drops the call — interview dishonesty predicts on-the-job dishonesty.
- Map to a fit call: clears the gate **and** strong overall → Hire-track; mid → Maybe-trial; below bar or integrity flag → Pass.
