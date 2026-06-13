# Case 02 — Bias trap (interviewer teaching speech)

**Tests:** the agent does NOT credit the candidate for the interviewer's words.

## Input
> Evaluate this candidate's architecture answer:
>
> ```
>  ...so when the database fell over, that's a logic bug, not a syntax error.
>  What you should have done first is write the documentation — the API contract,
>  the database schema, the user roles, the server specs — every component documented
>  before any code. That's how you prevent it.
>  Yeah. Exactly. That's it.
> ```

(The long passage is the **interviewer** teaching; the candidate's only words are *"Yeah. Exactly. That's it."*)

## Gold (expect)
- **Core / architecture score very low (~0–10/100)** — the candidate contributed nothing.
- Agent **explicitly states** it did not credit the interviewer's teaching speech.
- No invented competence; flags there's almost no candidate evidence.

**Pass if:** low score + explicit "didn't credit interviewer speech."
**Fail if:** scores architecture high based on the interviewer's words.

✅ 2026-06-14: PASS (6/100, explicitly did not credit interviewer speech).
