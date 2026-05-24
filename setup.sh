#!/usr/bin/env bash
# setup.sh — one-time setup for Relaunch PM Coach
# Run once after cloning: bash setup.sh

set -uo pipefail

PASS=0
FAIL=0
WARN=0

ok()   { echo "  [OK]   $1"; PASS=$((PASS+1)); }
fail() { echo "  [FAIL] $1"; FAIL=$((FAIL+1)); }
warn() { echo "  [WARN] $1"; WARN=$((WARN+1)); }

echo ""
echo "Relaunch PM Coach — Setup"
echo "========================="
echo ""

# ── 1. Claude CLI ─────────────────────────────────────────────────────────────
echo "Checking dependencies..."
echo ""

if command -v claude &>/dev/null; then
    VERSION=$(claude --version 2>/dev/null | head -1)
    ok "Claude CLI found: $VERSION"
else
    fail "Claude CLI not found. Install from: https://claude.ai/download (Claude Code)"
fi

# ── 2. Node / npm ─────────────────────────────────────────────────────────────
if command -v node &>/dev/null; then
    ok "Node.js found: $(node --version)"
else
    warn "Node.js not found. Required for claude-eval (automated evals). Install from https://nodejs.org"
fi

if command -v npm &>/dev/null; then
    ok "npm found: $(npm --version)"
fi

# ── 3. claude-eval ────────────────────────────────────────────────────────────
echo ""
echo "Installing claude-eval (LLM eval runner)..."
if npm install -g claude-eval 2>/dev/null; then
    ok "claude-eval installed"
else
    warn "claude-eval install failed — automated evals won't work. Try: npm install -g claude-eval"
fi

# ── 4. Pre-commit hook ────────────────────────────────────────────────────────
echo ""
echo "Installing pre-commit hook (em-dash blocker)..."
HOOK_PATH=".git/hooks/pre-commit"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ ! -d "$SCRIPT_DIR/.git" ]; then
    warn "Not a git repo root — skipping pre-commit hook. Run 'git init' first if needed."
else
    cat > "$SCRIPT_DIR/$HOOK_PATH" <<'HOOK'
#!/usr/bin/env bash
STAGED_MD=$(git diff --cached --name-only --diff-filter=ACM | grep '\.md$' || true)
if [ -z "$STAGED_MD" ]; then exit 0; fi
VIOLATIONS=$(git diff --cached -- $STAGED_MD | grep '^\+' | grep '—' || true)
if [ -n "$VIOLATIONS" ]; then
    echo ""
    echo "COMMIT BLOCKED: Em-dash (—) found in staged .md files."
    echo "Replace every — with a colon, comma, or period."
    echo ""
    echo "Violations:"
    git diff --cached -- $STAGED_MD | grep -n '^\+.*—' | head -20
    echo ""
    exit 1
fi
exit 0
HOOK
    chmod +x "$SCRIPT_DIR/$HOOK_PATH"
    ok "Pre-commit hook installed (.git/hooks/pre-commit)"
fi

# ── 5. Session state check ────────────────────────────────────────────────────
echo ""
echo "Checking session state..."
SESSION_FILE="$SCRIPT_DIR/session.md"

if [ -f "$SESSION_FILE" ]; then
    SESSION_COUNT=$(grep "session_count:" "$SESSION_FILE" | awk '{print $2}' | tr -d '[:space:]')
    if [ "$SESSION_COUNT" = "0" ] || [ -z "$SESSION_COUNT" ]; then
        ok "session.md found — session_count: 0 (first session, onboard will run automatically)"
    else
        ok "session.md found — session_count: $SESSION_COUNT (continuing from last session)"
    fi
else
    warn "session.md not found — coach will start blind. Restore from backup or run onboard."
fi

# ── 6. ANTHROPIC_API_KEY check ────────────────────────────────────────────────
echo ""
echo "Checking environment..."
if [ -n "${ANTHROPIC_API_KEY:-}" ]; then
    ok "ANTHROPIC_API_KEY set (required for automated evals)"
else
    warn "ANTHROPIC_API_KEY not set — CI evals and eval-runner.sh won't work."
    echo "         Set it: export ANTHROPIC_API_KEY=sk-ant-..."
    echo "         Add to ~/.zshrc or ~/.bashrc to persist."
fi

# ── Summary ───────────────────────────────────────────────────────────────────
echo ""
echo "─────────────────────────────────"
echo "Setup complete: $PASS ok, $WARN warnings, $FAIL failures"
echo ""

if [ $FAIL -gt 0 ]; then
    echo "Fix failures before starting. Claude CLI is required."
    echo ""
elif [ $WARN -gt 0 ]; then
    echo "Warnings won't block coaching — only automated evals."
    echo ""
fi

echo "Next step:"
echo ""
SESSION_COUNT=$(grep "session_count:" "$SESSION_FILE" 2>/dev/null | awk '{print $2}' | tr -d '[:space:]')
if [ "$SESSION_COUNT" = "0" ] || [ -z "$SESSION_COUNT" ]; then
    echo "  Open this folder in Claude Code, then type: onboard"
    echo "  The coach will read your resume and ask 3 targeted questions."
else
    echo "  Open this folder in Claude Code and start talking."
    echo "  The coach picks up from your last session automatically."
fi
echo ""
