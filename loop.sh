#!/usr/bin/env bash
set -euo pipefail

# Ralph Wiggum Loop — autonomous AI development loop
#
# Usage:
#   ./loop.sh              # Build mode, unlimited iterations
#   ./loop.sh 10           # Build mode, max 10 iterations
#   ./loop.sh plan         # Planning mode, unlimited
#   ./loop.sh plan 3       # Planning mode, max 3 iterations

MODE="build"
MAX_ITERATIONS=0
ITERATION=0

if [[ "${1:-}" == "plan" ]]; then
  MODE="plan"
  shift
fi

if [[ -n "${1:-}" ]]; then
  MAX_ITERATIONS="$1"
fi

PROMPT_FILE="PROMPT_${MODE}.md"

if [[ ! -f "$PROMPT_FILE" ]]; then
  echo "Error: $PROMPT_FILE not found"
  exit 1
fi

BRANCH=$(git branch --show-current 2>/dev/null || echo "unknown")

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Ralph Wiggum Loop"
echo "  Mode:   $MODE"
echo "  Branch: $BRANCH"
echo "  Prompt: $PROMPT_FILE"
[[ "$MAX_ITERATIONS" -gt 0 ]] && echo "  Max:    $MAX_ITERATIONS iterations"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

while true; do
  ITERATION=$((ITERATION + 1))

  if [[ "$MAX_ITERATIONS" -gt 0 && "$ITERATION" -gt "$MAX_ITERATIONS" ]]; then
    echo "=== Reached max iterations ($MAX_ITERATIONS) ==="
    break
  fi

  echo "=== Iteration $ITERATION ($MODE mode) ==="

  # Each iteration gets a fresh context window
  # -p: headless mode (non-interactive, reads from stdin)
  # --dangerously-skip-permissions: auto-approve all tool calls
  cat "$PROMPT_FILE" | claude --dangerously-skip-permissions -p -

  EXIT_CODE=$?
  if [[ $EXIT_CODE -ne 0 ]]; then
    echo "=== Claude exited with code $EXIT_CODE, stopping ==="
    break
  fi

  # Optional: push after each iteration
  # git push origin "$BRANCH" 2>/dev/null || true

  echo "=== Iteration $ITERATION complete ==="
  echo ""
done

echo "=== Loop finished after $((ITERATION - 1)) iterations ==="
