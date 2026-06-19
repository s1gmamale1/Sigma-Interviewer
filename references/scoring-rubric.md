# Scoring rubric

Two instruments: the **7-dimension rubric** (the whole interview) and the **0–100 core-question key** (the one big design question). Always back scores with a quote, and score each dimension independently.

## A. The 7 dimensions (0–10)

| Dimension | What you're measuring | Look for |
|---|---|---|
| **English** | Can they sustain a *technical* conversation in English? | Full sentences, correct terms, no fallback to another language. **Hard gate** if the role requires English. |
| **Behaviour / communication** | Clarity, honesty, composure, coachability | Direct answers, owns gaps, not defensive under push |
| **Response completeness** | Do answers land or fragment? | Complete, structured replies vs. one-word dodges |
| **AI knowledge** | How well they *use* AI | Right model/tool for the job, deliberate prompting, evidence-based verification, and clear verbalized workflow (what prompted, what checked, what changed) |
| **Critical thinking** | Reasoning quality | Challenges assumptions, red-teams, reasons from cases |
| **Decision-making** | Judgment under ambiguity | Makes a call and justifies it; doesn't freeze |
| **Architecture / system design** | Conceptual grasp | Data/back-end-first instinct; separates concerns; designs before building |

**Anchors:** `10` = fluent/expert, unprompted depth · `8` = strong, minor gaps · `6` = competent, correct instinct, real gaps · `4` = shallow, needed prompting · `2` = largely absent or wrong, needed full correction · `0` = not demonstrated / contradicted.

**Default session rule:** Evaluate all candidates on **0–10** by default, including overall, and keep this scale for future sessions unless the user explicitly requests a different scale.

## B. Weighting (tune to the role)
Default for **junior AI-orchestration** hires — *personality over skills, skills conceptual*:
- **Personality / traits ≈ 55%** — critical thinking, learning speed/coachability, discipline & punctuality, decision-making, **self-awareness/integrity**, communication.
- **AI fluency & problem approach ≈ 25%**.
- **Conceptual technical foundation ≈ 20%**.
- **English = pass/fail gate** (not a weighted slice).

**AI evidence floor:** score for **AI knowledge** cannot exceed **2/10** unless there is explicit evidence that candidate described concrete AI workflow. Minimum evidence: 1) model/tool or model class used, 2) why chosen, and 3) how they validated the result. Full-credit evidence also includes prompting strategy, revision loop, and fallback when AI is wrong.
- Generic claims like “I used AI” or “AI helped” cap AI knowledge at 2 until a follow-up elicits specifics.
- Named exact model/tool is ideal, but a concrete model class/role (e.g. “cheap fast model for boilerplate; strong reasoning model for architecture”) can count for junior interviews when paired with why + verification evidence.
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
**Strict core-scoring calibration:** Award points for demonstrated depth, not keyword presence.
- Research real cases / online: full credit only when they explicitly compare real examples/cases and explain how that changes the decision. A vague "I search/check online" is partial.
- Challenge/red-team: full credit only when they state concrete failure scenarios/assumptions (traffic spikes, payment failure, DB limits, rollback, etc.). General caution or "if it looks strange" is partial/low.
- Planning artifacts: full credit requires multiple artifacts (wishlist/roadmap/spec/data model/API contracts/docs/mapping). A simple "make a plan/schema" is partial.
- Stack/resource: full credit requires deliberate stack and resource/scaling choices, not just naming FastAPI/Postgres.
- Verification: "run it/test it" is a good junior signal but not enough by itself for high AI-workflow scores unless paired with model/tool choice, prompt strategy, and fallback behavior.
Calibration anchor: a candidate who says "Cursor/Claude, I test it, maybe search, plan/schema first, API then frontend" is a solid **Maybe-trial** around Core Q 55–65, not Hire-track. A candidate who explicitly drives AI, cross-checks real cases, red-teams concrete failures, lists planning artifacts, chooses stack/resources, and keeps code last is **Hire-track**.
**Core-score ceilings (mandatory):**
- If the answer lacks concrete red-team/failure scenarios before building, Core Q max is **65**, even if it mentions planning and AI.
- If the answer lacks deliberate resource/stack/scaling choices beyond naming a common stack, Core Q max is **69**.
- If planning artifacts are only "plan/schema/API" without wishlist/roadmap/docs/contracts/mapping, planning-artifact credit is partial and Core Q should usually stay **≤65**.
- Simple runtime fixes like "add indexes/cache/load test" after a failure do not count as pre-build red-team unless the candidate framed them as planned assumptions before building.
- Use this anchor strictly: Cursor/Claude + test/check docs + plan/schema first + API/frontend last, but no concrete real-case comparison, no concrete red-team scenarios, and no full artifact map = **Core Q about 58 and Maybe-trial**, not Hire-track.



## D. Turning scores into a verdict
- Overall = weighted blend (Section B) on a /10 scale, **but** two overrides:
  1. Missing a **hard requirement** (e.g. English collapse) caps the ceiling.
  2. A **credibility flag** (inflated/contradictory claims) drops the call — interview dishonesty predicts on-the-job dishonesty.
- Map to a fit call (mandatory operating policy):
  1. **Pass**: under **6.0/10**, English-gate fail for an English-required role, explicit credibility red flag, or hard AI-process evidence failure.
  2. **Maybe-trial**: **6.0–6.5/10** (and no hard fail), only with explicit human approval + a clear remediation plan.
  3. **Hire-track**: **7.0/10+** and no hard fail/credibility risks. Human approval and/or a paid trial may still be required operationally, but that does **not** downgrade the fit label.
  4. If **Core Q ≥70/100** and the weighted overall is **≥7.0/10** with no hard fail, the fit call must be **Hire-track**, not Maybe-trial.

**Operational scoring guardrails (mandatory):**
- If a candidate says they used AI but cannot describe concrete workflow evidence (model/tool or model class, why, verification; ideally prompt strategy + fallback), set **AI knowledge = 2/10**.
- If CV says "English B2" but live transcript shows poor comprehension/fluency, apply an **English gate fail or hard downgrade** to the fit call despite CV labels.

