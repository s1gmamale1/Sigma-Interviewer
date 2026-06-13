# Methodology — end to end

The full pipeline: **transcribe → score → analyze → report**. Read alongside `scoring-rubric.md`.

## 0. Setup & privacy
- Keep all candidate audio/transcripts in a **git-ignored** local folder (`candidates/`).
- Never push names, verdicts, or recordings to a shared repo or external service. This skill repo is methodology only.

## 1. Transcribe
Run `scripts/transcribe.sh <folder>`. For each `*.m4a/*.mp3/*.wav` it produces:
- `<name>.txt` — **forced-English** transcript → use to judge **English proficiency** (what English they actually produced).
- `<name>.uztr.txt` — **Uzbek→English** translation → use to judge **technical content** (what they meant, even if spoken in another language).

Why two passes: candidates code-switch. Forcing English shows whether they can sustain the working language; the translate pass recovers reasoning expressed in their native language so weak English doesn't unfairly bury a good thinker. **Trust points where both agree**; the translate pass adds some hallucination (wrong names, places), so discount translate-only claims.

Hard-won flags (see `scripts/transcribe.sh`): force `-l en` (auto-detect mis-fires), `-mc 0` (kills repetition loops that otherwise erase whole sections), `-sns` (suppress non-speech). Repeated identical lines in output = transcription loops; read the content once.

## 2. Read with speaker attribution
Transcripts have **no speaker labels**. Infer:
- **Interviewer** = questions, probing, corrections, the company pitch, and any *teaching speech* that recurs across multiple candidates' transcripts.
- **Candidate** = the answers.
- ⚠️ Do **not** credit a candidate for the interviewer's repeated teaching speech (a classic attribution error that inflates weak candidates).

## 3. Score
Score every candidate on the **7-dimension rubric** and the **0–100 core-question key** (`scoring-rubric.md`). Rules:
- One short **quote per score**.
- Score each dimension **independently and immediately** (debias).
- Mark inflated/unverifiable claims explicitly.
- English is a **gate**, not just a weighted dimension.

## 4. Report
Per candidate, output a card:
1. **Snapshot** — age, education, work experience, stack, specialty, biggest project. Flag inflated claims.
2. **Scores table** — 7 dimensions × (score | one-line justification with quote).
3. **Core-question score** — X/100 vs the key + what they actually said.
4. **Signature moments** — self-rating & "do you code yourself"; the 30-day/core question; any curveball.
5. **Strengths (3) / Risks (3).**
6. **Language note** — reliance on the non-English language; did translation change the read?
7. **Verdict** — overall /5, 2-sentence bottom line, fit call (Hire-track / Maybe-trial / Pass), confidence + caveats.

Then a **comparative ranked table** (all candidates × all dimensions) and a recommendation that **stress-tests the user's lean** rather than rubber-stamping it. Surface gut-vs-evidence gaps (e.g. a smooth-but-overconfident candidate the user liked who the evidence rates lower).

## 5. Fit-call definitions
- **Hire-track** — clears the bar on this interview; advance toward an offer.
- **Maybe-trial** — borderline; the interview can't decide it; resolve with a paid trial / work sample.
- **Pass** — *decline* (recruiting sense: "pass on them"). Judges the interview, not the person — they may fit a different role.

## 6. Parallel evaluation
For 3+ candidates, give each its own sub-agent/context (one candidate per agent), then integrate the returned cards. Each analysis stays focused; no cross-contamination. Have a final pass reconcile scores and produce the comparative table.
