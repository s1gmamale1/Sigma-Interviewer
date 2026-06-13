# Adapter: OpenAI Codex CLI

Codex loads project guidance from `AGENTS.md` and supports reusable custom prompts. Two ways to install Sigma Interviewer.

## Option A — project instructions (simplest)
Put the skill's brain where Codex auto-reads it:
```bash
# from your working repo (the one with the candidate transcripts)
cp /path/to/Sigma-Interviewer/AGENT.md ./AGENTS.md
# or append, if you already have an AGENTS.md:
cat /path/to/Sigma-Interviewer/AGENT.md >> ./AGENTS.md
```
Codex will follow it for the whole session. Keep `scripts/transcribe.sh` and `references/` available in the repo so the agent can run/read them.

## Option B — reusable prompt (slash command)
Codex reads custom prompts from `~/.codex/prompts/`:
```bash
mkdir -p ~/.codex/prompts
ln -s /path/to/Sigma-Interviewer/AGENT.md ~/.codex/prompts/sigma-interviewer.md
```
Then invoke `/sigma-interviewer` in a Codex session and point it at your transcripts folder.

## Usage
```
Transcribe ./candidates with scripts/transcribe.sh, then evaluate every transcript
against the Sigma rubric and give me a comparative ranked report.
```

> Codex runs shell commands, so `transcribe.sh` works natively. Keep candidate data in a git-ignored folder — `AGENT.md` instructs the agent not to commit PII.
