# eval-checklist.md: Per-Session Human Scoring Form

Fill this in within 5 minutes of ending a session. Copy the block, score it, append to the Eval Log in evals.md.

---

## Scoring Form (copy and fill per session)

```
date: YYYY-MM-DD
persona / client name:
mode: [Interview / Skill / Direction / Mixed / Crisis]
session length (turns):

## Binary Checks (pass/fail)
em-dash present:           [ ] pass  [ ] fail
first response had question: [ ] pass  [ ] fail
no bullet list in turn 1-3:  [ ] pass  [ ] fail
session close fired:         [ ] pass  [ ] fail
session.md written:          [ ] pass  [ ] fail

## Quality Scores (1-5)
coaches not answers:         /5
domain specific:             /5
methodology clean (GROW):    /5
empathy / story / quote:     /5
aviation analogy (if triggered): /5 or N/A
minimized drift:             /5

## Aviation Analogy (if any trigger fired)
trigger present (1/2/3/4):   [ ] yes  [ ] no
which trigger:               [ ]
full setup deployed:         [ ] yes  [ ] no / N/A
client named their layer:    [ ] yes  [ ] no / N/A

## Outcome
client made specific commitment: [ ] yes  [ ] no
commitment time-bound:           [ ] yes  [ ] no

## Notes (optional: what landed, what missed)

---
average quality score:       /5
binary checks all pass:      [ ] yes  [ ] no
```

---

## Drift Thresholds

Act on these immediately. Do not wait for next session.

| Signal | Threshold | Action |
|---|---|---|
| Any em-dash | 1 found | Stop session. Identify source file. Fix before continuing. |
| First response is a list | Occurs | Check CLAUDE.md Rule 2. Review recent file changes. |
| Any quality criterion | Below 3.5 rolling average (last 5 sessions) | Read LEARNINGS.md entries for that criterion. Check if a pattern has been missed. |
| Aviation analogy trigger present, not deployed | 2+ sessions | Review coaching-moves.md trigger table. Add to LEARNINGS.md. |
| Client made no commitment | 3 consecutive sessions | Review GROW section in CLAUDE.md. Session may be ending without Way Forward. |

---

## Distill Gate

Before promoting a LEARNINGS.md entry from `candidate` to `promoted` (via `/distill`), verify:

- [ ] Pattern appears in 2 or more scored sessions
- [ ] Average quality score for relevant criterion is 4.0+ in those sessions
- [ ] Promotion target (which CONTEXT.md file) is identified
- [ ] No conflicting entry already exists in the target CONTEXT.md

If any check fails, status stays `candidate`. Document the gap in LEARNINGS.md.

---

## Eval Log

Append scored sessions here. One row per session.

| Date | Persona | Mode | Avg Score | Binary Pass | Analogy Trigger | Analogy Deployed | Commitment Made | Notes |
|---|---|---|---|---|---|---|---|---|
| 2026-05-23 | 10 diverse personas (batch audit) | Mixed | 4.5 | Yes (0 em-dashes) | T3 missed x2 | 4/6 triggered | 9/10 | Trigger 3 misses and empathy gaps documented in LEARNINGS |
