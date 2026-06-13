# Adapter: OpenClaw

OpenClaw agents are driven by a system prompt / persona file. Sigma Interviewer ships its full operating prompt as **`AGENT.md`** — load that as the agent's system prompt.

## Install
Register `AGENT.md` as the agent's system/persona prompt. Depending on how your OpenClaw is configured, that's one of:

- **Config-referenced file** — point the agent's `system_prompt` (or `instructions` / `persona`) field at the absolute path of `AGENT.md`:
  ```yaml
  # example agent definition
  name: sigma-interviewer
  system_prompt_file: /path/to/Sigma-Interviewer/AGENT.md
  tools: [shell, files]     # needs shell (for transcribe.sh) + file read
  ```
- **Inline** — paste the contents of `AGENT.md` into the agent's system-prompt field.

Make sure the agent has **shell + filesystem** access so it can run `scripts/transcribe.sh` and read `references/`.

## Usage
```
You are Sigma Interviewer. Transcribe ./candidates, then score each candidate on the
rubric and the 0–100 core-question key, and return a comparative ranked report.
```

> The exact field name (`system_prompt` / `instructions` / `persona`) depends on your OpenClaw build — `AGENT.md` is plain Markdown and platform-agnostic, so it works wherever the system prompt is set. Keep candidate data git-ignored; `AGENT.md` forbids committing PII.
