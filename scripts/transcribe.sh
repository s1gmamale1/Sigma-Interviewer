#!/usr/bin/env bash
#
# Sigma Interviewer — transcription pipeline for code-switched (Uzbek/English) audio.
#
# Produces, per recording:
#   transcripts/<name>.txt        forced-English  (judge English proficiency)
#   transcripts/<name>.uztr.txt   Uzbek -> English (recover technical content)
#
# Usage:
#   ./scripts/transcribe.sh [INPUT_DIR] [OUTPUT_DIR]
#       INPUT_DIR   folder with audio files     (default: ./candidates)
#       OUTPUT_DIR  where transcripts go        (default: ./transcripts)
#
# Env:
#   WHISPER_MODEL   path to ggml model (default: ~/.claude-video-vision/models/ggml-large-v3.bin)
#   WHISPER_BIN     whisper.cpp CLI   (default: whisper-cli)
#   THREADS         CPU threads       (default: 8)
#   TRANSLATE       1=also do Uzbek->English pass (default: 1), 0=English only
#
# Requires: ffmpeg, whisper-cli (whisper.cpp), a ggml-large-v3 model.
#
set -euo pipefail

IN_DIR="${1:-./candidates}"
OUT_DIR="${2:-./transcripts}"
WAV_DIR="${OUT_DIR}/.wav"
MODEL="${WHISPER_MODEL:-$HOME/.claude-video-vision/models/ggml-large-v3.bin}"
WHISPER_BIN="${WHISPER_BIN:-whisper-cli}"
THREADS="${THREADS:-8}"
TRANSLATE="${TRANSLATE:-1}"

# --- dependency checks ---------------------------------------------------------
command -v ffmpeg     >/dev/null 2>&1 || { echo "ERROR: ffmpeg not found"; exit 1; }
command -v "$WHISPER_BIN" >/dev/null 2>&1 || { echo "ERROR: $WHISPER_BIN not found (install whisper.cpp)"; exit 1; }
[ -f "$MODEL" ] || { echo "ERROR: model not found at $MODEL (set WHISPER_MODEL)"; exit 1; }
[ -d "$IN_DIR" ] || { echo "ERROR: input dir not found: $IN_DIR"; exit 1; }

mkdir -p "$OUT_DIR" "$WAV_DIR"

shopt -s nullglob nocaseglob 2>/dev/null || true
audio=( "$IN_DIR"/*.m4a "$IN_DIR"/*.mp3 "$IN_DIR"/*.wav "$IN_DIR"/*.ogg "$IN_DIR"/*.flac "$IN_DIR"/*.aac )
[ ${#audio[@]} -gt 0 ] || { echo "No audio files found in $IN_DIR"; exit 0; }

echo "Model:   $MODEL"
echo "Input:   $IN_DIR  (${#audio[@]} files)"
echo "Output:  $OUT_DIR"
echo "Translate pass: $([ "$TRANSLATE" = 1 ] && echo yes || echo no)"
echo

for f in "${audio[@]}"; do
  base="$(basename "$f")"
  name="${base%.*}"
  wav="$WAV_DIR/$name.wav"

  echo "=== $name ==="
  # 1) normalize to 16 kHz mono PCM (whisper.cpp input)
  ffmpeg -nostdin -y -i "$f" -ar 16000 -ac 1 -c:a pcm_s16le "$wav" >/dev/null 2>&1

  # 2) forced-English pass — judge English proficiency.
  #    -l en  : force language (auto-detect can mis-fire to the wrong language)
  #    -mc 0  : no carried context -> prevents catastrophic repetition loops
  #    -sns   : suppress non-speech tokens (trims silence hallucinations)
  "$WHISPER_BIN" -m "$MODEL" -l en -mc 0 -sns -t "$THREADS" \
      -otxt -of "$OUT_DIR/$name" "$wav" >"$OUT_DIR/$name.en.log" 2>&1
  echo "  -> $OUT_DIR/$name.txt"

  # 3) Uzbek -> English pass — recover technical content spoken in Uzbek.
  if [ "$TRANSLATE" = 1 ]; then
    "$WHISPER_BIN" -m "$MODEL" -l uz -tr -mc 0 -sns -t "$THREADS" \
        -otxt -of "$OUT_DIR/$name.uztr" "$wav" >"$OUT_DIR/$name.uztr.log" 2>&1
    echo "  -> $OUT_DIR/$name.uztr.txt"
  fi
done

# tidy intermediate wavs (comment out to keep them)
rm -rf "$WAV_DIR"

echo
echo "Done. Transcripts in $OUT_DIR/"
echo "Next: ask your agent to evaluate them against the Sigma rubric (references/scoring-rubric.md)."
