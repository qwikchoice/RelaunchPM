#!/usr/bin/env bash
# eval-runner.sh: Automated compliance checks for Relaunch PM Coach
#
# Runs 10 spot-check prompts against the coaching system.
# Checks binary criteria: em-dash, first-response question, no opening list.
# Requires Claude CLI (claude) in PATH and CLAUDE.md in current directory.
#
# Usage:
#   ./eval-runner.sh              # run all 10 prompts
#   ./eval-runner.sh --quick      # run first 3 only (fast smoke test)
#   ./eval-runner.sh --prompt 4   # run single prompt by number

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

PASS=0
FAIL=0
RESULTS=()
QUICK=false
SINGLE=""

for arg in "$@"; do
    case $arg in
        --quick) QUICK=true ;;
        --prompt) SINGLE="${2:-}" ;;
    esac
done

# ── Prompts ────────────────────────────────────────────────────────────────

declare -a PROMPTS
declare -a NAMES

PROMPTS[1]="I have an interview at Google in 2 weeks for an AI PM role. What should I prep?"
NAMES[1]="Interview prep request"

PROMPTS[2]="I'm behind on AI. I don't know RAG, fine-tuning, or LLM evals. What should I learn first?"
NAMES[2]="Skills anxiety / course request"

PROMPTS[3]="I don't know whether to join a Big Tech AI team or a startup."
NAMES[3]="Direction decision: ecosystem framing trigger"

PROMPTS[4]="I'm building an AI tool for HR teams. How do I know if it's the right idea?"
NAMES[4]="Startup idea: aviation analogy trigger"

PROMPTS[5]="I got rejected from 3 companies. I think my experience isn't strong enough."
NAMES[5]="Rejection / skills deficit belief"

PROMPTS[6]="I have 2 months of runway left and I'm scared."
NAMES[6]="Runway anxiety: fear-driven decision risk"

PROMPTS[7]="Everyone I know seems further ahead than me in their AI PM career."
NAMES[7]="Comparison spiral"

PROMPTS[8]="I'm ready to interview. I just need to practice some behavioral questions."
NAMES[8]="Denial mode: readiness claim"

PROMPTS[9]="I think my technical background is hurting me as a PM."
NAMES[9]="Technical background as liability belief"

PROMPTS[10]="I need to make a decision by Friday or I'll lose the offer."
NAMES[10]="Artificial urgency / fast decision pressure"

# ── Scoring ────────────────────────────────────────────────────────────────

check_response() {
    local idx="$1"
    local response="$2"
    local issues=()

    # Binary check 1: no em-dash
    if echo "$response" | grep -q "—"; then
        issues+=("EM-DASH FOUND")
    fi

    # Binary check 2: first response contains a question mark
    first_block=$(echo "$response" | head -8)
    if ! echo "$first_block" | grep -q "?"; then
        issues+=("NO QUESTION IN OPENING")
    fi

    # Binary check 3: no bullet list in opening lines
    if echo "$first_block" | grep -qE "^[[:space:]]*[-*•]|^[[:space:]]*[0-9]+\."; then
        issues+=("BULLET LIST IN OPENING")
    fi

    # Binary check 4: no "here are X" opener
    if echo "$first_block" | grep -iqE "here are [0-9]|here's [0-9]|[0-9]+ (ways|tips|strategies|steps|things)"; then
        issues+=("KNOWLEDGE-BASE OPENER")
    fi

    if [ ${#issues[@]} -eq 0 ]; then
        PASS=$((PASS + 1))
        RESULTS+=("  PASS  [$idx] ${NAMES[$idx]}")
    else
        FAIL=$((FAIL + 1))
        joined=$(IFS=", "; echo "${issues[*]}")
        RESULTS+=("  FAIL  [$idx] ${NAMES[$idx]} — $joined")
    fi
}

# ── Runner ─────────────────────────────────────────────────────────────────

run_prompt() {
    local idx="$1"
    echo "  Running [$idx] ${NAMES[$idx]}..."
    response=$(claude -p "${PROMPTS[$idx]}" 2>/dev/null)
    check_response "$idx" "$response"
}

echo ""
echo "Relaunch PM Coach: Eval Runner"
echo "================================"
echo "Directory: $SCRIPT_DIR"
echo "Date: $(date +%Y-%m-%d)"
echo ""

if [ -n "$SINGLE" ]; then
    run_prompt "$SINGLE"
elif [ "$QUICK" = true ]; then
    echo "Quick mode: prompts 1-3 only"
    echo ""
    for i in 1 2 3; do run_prompt "$i"; done
else
    for i in $(seq 1 10); do run_prompt "$i"; done
fi

# ── Report ─────────────────────────────────────────────────────────────────

echo ""
echo "Results"
echo "-------"
for r in "${RESULTS[@]}"; do echo "$r"; done
echo ""
echo "Score: $PASS passed, $FAIL failed out of $((PASS + FAIL)) prompts"

if [ $FAIL -gt 0 ]; then
    echo ""
    echo "THRESHOLD NOT MET. Investigate failures before next session."
    exit 1
else
    echo ""
    echo "All checks passed. Append results to eval log in evals.md."
    exit 0
fi
