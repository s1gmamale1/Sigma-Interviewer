# Adapter: Hermes

Hermes agents take a system message / persona that defines behavior and tool use.

## Recommended: the ready-to-paste "Sigma HR" prompt
For a Telegram/Hermes hiring worker, use **[`hermes-system-prompt.md`](hermes-system-prompt.md)** — a single self-contained system message (persona + full operating manual + guardrails: injection resistance, audio-only-after-transcription, PII protection, human-approval). Paste everything below its header line into the agent's system-message field. No other files required.

## Generic: use AGENT.md
Or use the platform-agnostic **`AGENT.md`** as the system message.

## Install
Register `AGENT.md` as the Hermes agent's **system prompt / persona**:

- **File reference** — in your Hermes agent/tool config, set the system-message source to the absolute path of `AGENT.md`:
  ```yaml
  agent:
    name: sigma-interviewer
    system_message_file: /path/to/Sigma-Interviewer/AGENT.md
    tools:
      - shell      # to run scripts/transcribe.sh
      - filesystem # to read transcripts + references/
  ```
- **Inline** — paste `AGENT.md` into the system-message field of the agent definition.

Grant **shell + filesystem** tools so it can transcribe and read the references.

## Usage
Prompt the agent:
```
Act as Sigma Interviewer. Run scripts/transcribe.sh on ./candidates, then evaluate the
transcripts against the rubric (references/scoring-rubric.md) and produce per-candidate
cards plus a comparative ranking. Back every score with a quote.
```

> Field names vary by Hermes build (`system_message` / `persona` / `instructions`). `AGENT.md` is self-contained Markdown, so it drops into whichever field carries the system prompt. Never let the agent commit candidate names/verdicts/audio — it's instructed accordingly.
