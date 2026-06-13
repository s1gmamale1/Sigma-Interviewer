# Sigma Interviewer

A portable AI **interviewing + candidate-evaluation skill** that runs on Claude Code, OpenAI Codex, OpenClaw, and Hermes.

It turns an AI agent into a rigorous, bias-aware hiring assistant that can:

1. **Transcribe** interview recordings — including code-switched **Uzbek/English** audio — locally with `whisper.cpp`.
2. **Score** each candidate on a fixed 7-dimension rubric *plus* a weighted 0–100 key for the core "how would you build it?" question.
3. **Produce comparative analytics** — a ranked scorecard with evidence quotes, strengths/risks, and a clear hire/maybe/pass call per candidate.
4. **Coach the interviewer** — run a tight 15-minute, dynamic-assessment ("push and watch them climb") interview, debias your own judgment, and standardize scoring.

It is built for hiring **junior / student AI-orchestration talent**: people who direct AI to research, plan, and build, while keeping the critical decisions human. The philosophy is **personality and judgment over raw skill; skills assessed conceptually.**

> ⚠️ **Privacy:** this repo is **methodology only**. Never commit candidate audio, transcripts, names, or assessments. The `.gitignore` blocks the common file types; keep real candidate data in a private, local working folder.

---

## What's in here

```
SKILL.md                  # Claude Code skill entry (progressive disclosure)
AGENT.md                  # Self-contained agent prompt (Codex / OpenClaw / Hermes)
references/
  methodology.md          # End-to-end pipeline: transcribe → score → analyze → report
  scoring-rubric.md       # 7 dimensions + anchors + the 0–100 core-question key
  runsheet-15min.md       # 15-min interview runsheet + the dynamic-assessment hint-ladder
  interviewer-coaching.md # Debiasing, talk-ratio, ZPD, research grounding
  scorecard-template.md   # Printable per-candidate scorecard
scripts/
  transcribe.sh           # whisper.cpp pipeline for Uzbek/English audio
adapters/
  codex.md                # Wire into OpenAI Codex CLI
  openclaw.md             # Wire into OpenClaw
  hermes.md               # Wire into Hermes
examples/
  transcript-sample.txt   # Synthetic interview transcript (fictional candidate)
  sample-report.md        # The report Sigma Interviewer produces from it
```

## See it in action
[`examples/transcript-sample.txt`](examples/transcript-sample.txt) is a fictional interview (no real candidate), written in the same no-speaker-label, forced-English style real transcripts come in. [`examples/sample-report.md`](examples/sample-report.md) is the full report the skill produces from it — per-candidate card, the 0–100 core-question breakdown, signature moments, verdict, and how it rolls into a comparative ranking.

---

## Install

### Claude Code
```bash
git clone https://github.com/s1gmamale1/Sigma-Interviewer.git ~/.claude/skills/sigma-interviewer
```
Then invoke it in a session: `/sigma-interviewer` (or just ask Claude to "evaluate these interview recordings" — the skill auto-triggers).

### OpenAI Codex / OpenClaw / Hermes
These platforms load a single instruction file. Point them at **`AGENT.md`** (the self-contained brain). Per-platform wiring is in [`adapters/`](adapters/). In short:
- **Codex:** copy `AGENT.md` content into your project's `AGENTS.md`, or add it as a custom prompt — see [`adapters/codex.md`](adapters/codex.md).
- **OpenClaw:** load `AGENT.md` as the agent's system prompt — see [`adapters/openclaw.md`](adapters/openclaw.md).
- **Hermes:** register `AGENT.md` as the agent persona/system message — see [`adapters/hermes.md`](adapters/hermes.md).

---

## Quick start (any platform)

1. Drop interview recordings into a local, **git-ignored** folder (e.g. `./candidates/`).
2. Transcribe:
   ```bash
   ./scripts/transcribe.sh ./candidates
   ```
   Produces `<name>.txt` (English) and `<name>.uztr.txt` (Uzbek→English recovery) per file.
3. Ask the agent: *"Evaluate these transcripts against the Sigma rubric and give me comparative analytics."*
4. The agent reads [`references/scoring-rubric.md`](references/scoring-rubric.md), scores each candidate, and returns a ranked report.

---

## Why it works (the short version)

- **Structured > unstructured:** same questions, same order, anchored scoring ≈ 2× the predictive validity of a freestyle chat.
- **Dynamic assessment:** pressure a weak point with a *standardized hint-ladder* and grade how far the candidate climbs — the closest thing to measuring learning potential.
- **Debias on purpose:** score each dimension independently, immediately, from evidence quotes — to beat the halo effect (confident delivery ≠ competence).

Full grounding and citations are in [`references/interviewer-coaching.md`](references/interviewer-coaching.md).

---

## License
MIT — see [LICENSE](LICENSE).
