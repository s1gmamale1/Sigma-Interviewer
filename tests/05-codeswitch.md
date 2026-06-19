# Case 05 — Code-switch (language gate, not a hidden penalty)

**Tests:** the agent scores **English** from what was produced in English, but still **credits technical
content** the candidate expressed in Uzbek (recovered) — i.e. weak English doesn't zero a real thinker.
Synthetic. Bracketed `[uz→en: …]` represents the recovered translation the pipeline produces.

## Input
```
SYNTHETIC — fictional candidate "Sardor". Mixed Uzbek/English. No speaker labels.

 Can you speak English?
 A little... sorry, I will explain in Uzbek, easier for me.
 Okay, go ahead.
 [uz→en: First I take the client's requirements and give all of them to the AI as context.
  Then I ask the AI to suggest an architecture, but I choose myself — the AI proposes, I decide.
  I also tell it to find real examples online of how similar shops are built, and I compare them.
  Before coding I write a plan and the database schema, then the API, documentation, and code last.]
 In English, how would you handle the database failing at 500 users?
 Ehm... database... slow. I add... index? And cache. [uz→en: If the schema design is wrong I'd refactor
  the heavy queries and load-test before saying it works.]
 Okay, thank you Sardor.
```

## Gold (expect)
- **English: ~2–3/10** — could not sustain a technical conversation in English; flag English as the limiter / gate concern.
- **Technical content still CREDITED** from the recovered Uzbek: human-in-the-loop ("the AI proposes, I decide"), feed-context, AI research of real cases, plan-before-code → **Core Q meaningfully > 0 (~45–75/100 depending on credited translated evidence)**.
- Verdict notes the split clearly: *decent process thinking, blocked by English* → typically **Maybe-trial pending an English re-check** (or Pass-on-gate if English is hard-required), **not** a flat low score that ignores his reasoning.

**Pass if:** English scored low AND the Uzbek-expressed process is credited (core well above 0), with the language gate called out.
**Fail if:** it zeros him purely for weak English, ignoring the recovered content — that's the exact bias the language rule exists to prevent.
