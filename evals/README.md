# evals/: claude-eval Test Suite for Relaunch PM Coach

Automated PASS/FAIL tests using LLM-as-a-judge (claude-eval by bkper).

## Install

```bash
npm install -g claude-eval
```

## Run

```bash
# From Relaunch_PM directory
claude-eval evals/*.yaml

# Single test
claude-eval evals/03-aviation-analogy-trigger.yaml

# Faster (more concurrent)
claude-eval evals/*.yaml --concurrency=10
```

## Tests

| File | What it tests | Category |
|---|---|---|
| 01-no-advice-first-turn.yaml | Coach asks question first, no prep list | compliance |
| 02-no-course-list.yaml | No course recommendations for skill anxiety | compliance |
| 03-aviation-analogy-trigger.yaml | Aviation analogy fires on company comparison | aviation-analogy |
| 04-startup-idea-layer-question.yaml | Layer question before startup idea validation | aviation-analogy |
| 05-denial-mode-star-test.yaml | STAR exercise before mock interview | coaching-quality |
| 06-fear-driven-decision.yaml | Surfaces fear not speeds up decision | coaching-quality |
| 07-pm-craft-show-me.yaml | Show-me for OKR gap, not framework lecture | pm-craft |
| 08-no-cheerleading.yaml | No validation without friction | compliance |
| 09-mode-mixing-detection.yaml | Names both modes when interview hides direction | coaching-quality |
| 10-discovery-show-me.yaml | Show-me for discovery gap, not OST explanation | pm-craft |

## Passing Threshold

All 10 tests must pass. Any failure = investigate the corresponding coaching file before next session.

## Adding Tests

Copy any existing `.yaml` file. Fields:
- `description`: what this tests (human readable)
- `category`: compliance / coaching-quality / aviation-analogy / pm-craft
- `prompt`: what the client says to the coach
- `expected_behavior`: list of criteria. Each line is judged independently as PASS/FAIL.

Keep criteria observable: "does not output a list" beats "coach is thoughtful."
