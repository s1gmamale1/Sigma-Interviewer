# Decision policy (Sigma Interviewer)

## Thresholds (hard)

- **Pass** if any apply:
  - Overall below **6.0/10**
  - English gate FAIL (cannot sustain technical English in real-time exchange)
  - Credibility mismatch (CV vs live claims conflict, inflated/unsupported statements)
  - hard AI-workflow evidence gap in core questions (cannot explain even a model/tool/model-class choice, why, and how output was checked)

- **Maybe-trial** if **6.0–6.5/10** **and** no hard fail:
  - must have explicit human approval before any trial is scheduled
  - requires a 1-line remediation plan (what to verify in the one-month period)

- **Hire-track** at **7.0/10+** with no hard-fail flags
  - manager retains final decision; human approval/trial logistics do **not** downgrade Hire-track to Maybe-trial
  - if Core Q ≥70/100 and weighted overall ≥7.0/10 with no hard fail, label **Hire-track**

## Mandatory AI-workflow evidence floor (for AI Knowledge)

For an AI Knowledge score above **2/10**, candidate must provide evidence for each:
1) model/tool used, or a concrete model class/role when exact name was not asked,
2) why it was chosen,
3) how they prompted,
4) how they verified output,
5) what changed after validation,
6) how they handled wrong output.

If they only say things like “I used AI,” without concrete process, cap AI Knowledge at **2/10**.

## Language policy

- Use forced-English transcript for **English** scoring.
- Use Uzbek→English transcript only for technical content depth.
- If CV-language claims (“English B2”) do not match transcript quality, prioritize transcript evidence and annotate the mismatch.