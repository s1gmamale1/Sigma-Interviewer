# Case 01 — Core competence (Jasur)

**Tests:** the 7-dimension rubric + the 0–100 core key are applied faithfully, with evidence quotes.

## Input
Send the full contents of [`../examples/transcript-sample.txt`](../examples/transcript-sample.txt) and ask:
> "Evaluate this candidate (Telegram-concise)."

## Gold (expect)
- Overall ≈ **3.3–3.5 / 5**
- **Core Q ≈ 58/100** (partial band)
- **Fit: MAYBE-TRIAL** + "needs human approval"
- Per-dimension 1–5 scores **each with a quote** (e.g. Eng 4, Behav 4, Complete 3, AI 3, Critical 4, Decision 3, Arch 4)
- Strengths note honesty/self-awareness + schema-first + coachable; risks note no research/red-team reflex
- At least 2 verbatim quotes (e.g. *"I read the code and fix it myself, I don't just paste blindly"*)

**Pass if:** fit = Maybe-trial, core in the 50–65 band, dims scored 1–5 with quotes.
**Fail if:** no /100, no fit label, or no quotes.

✅ 2026-06-14: PASS (Core 58/100, Maybe-trial).
