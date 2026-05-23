# claude-eval GitHub Actions Template

Copy `evals.yml` from this directory into any project's `.github/workflows/` to get automated evals on every push.

## Requirements

1. Add `ANTHROPIC_API_KEY` as a GitHub repo secret:
   - GitHub repo Settings > Secrets and variables > Actions > New repository secret
   - Name: `ANTHROPIC_API_KEY`
   - Value: your Anthropic API key from console.anthropic.com

2. Create an `evals/` directory at repo root with at least one `.yaml` eval file.

## Minimal eval file

```yaml
description: First response must be a question
category: compliance

prompt: >
  What should I do about X?

expected_behavior:
  - Responds with a question, not advice
  - Does not output a numbered or bulleted list
```

## What each field does

| Field | Required | Description |
|---|---|---|
| `description` | no | Human label for the test |
| `category` | no | Group tests by type |
| `prompt` | yes | What the user says to the system |
| `expected_behavior` | yes | List of criteria; each judged PASS/FAIL independently |

## Writing good criteria

Observable beats intentional:
- Good: "Does not output a bullet list in the first 3 lines"
- Bad: "Is thoughtful and coaching-oriented"

Negative criteria work well:
- "Does not say 'you've got this' or equivalent"
- "Does not recommend a specific course or tool"
- "Does not contain an em-dash character"

## Triggers

The template runs on:
- Push to master/main when any `.md` or `evals/*.yaml` file changes
- Pull requests to master/main
- Manual trigger via Actions tab (workflow_dispatch)

## Local run

```bash
# Install once globally
npm install -g claude-eval

# Run all evals
claude-eval evals/*.yaml

# Single test
claude-eval evals/01-my-test.yaml

# Verbose output
claude-eval evals/*.yaml --verbose
```
