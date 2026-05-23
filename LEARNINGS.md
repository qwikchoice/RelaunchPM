# LEARNINGS.md — Relaunch PM Coach

Empirical coaching intelligence. Append after sessions where something notable happened.
Run `/distill` when 3+ unflagged entries exist to surface patterns.

## Format

```
---
date: YYYY-MM-DD
mode: [Interview / Skill / Direction / Mixed / System / Crisis]
what happened: [one sentence — what the user was dealing with]
what worked: [one sentence — question or move that landed]
what to try next time: [one sentence — adjustment or follow-on]
status: [new / candidate / promoted / distilled]
---
```

**Status definitions:**
- `new`: added this session, not yet reviewed
- `candidate`: pattern seen in 2+ scored sessions; eligible for promotion via `/distill`
- `promoted`: moved to a CONTEXT.md file; entry kept here for history
- `distilled`: surfaced into Distilled Patterns section below

**Promotion gate (before changing status to `promoted`):**
Pattern must appear in 2+ sessions with avg quality score 4.0+ for relevant criterion.
See eval-checklist.md Distill Gate checklist before promoting.

## Entries

---
date: 2026-05-23
mode: Mixed (onboard + skill)
what happened: Client (Divakar, ex-Meta/Franki) came in with AI chaos and identity loss after Jan 2026 layoff; had genuine AI PM credentials but framing them through old FAANG logos
what worked: Reframe "framing problem not skills problem" landed immediately; "work vs container" distinction resonated; asking about status vs financial loss surfaced the real wound
what to try next time: Deploy Alex's status spiral anecdote earlier when identity loss surfaces; use Samurai story at the skills panic moment
status: new
---

---
date: 2026-05-23
mode: Skill
what happened: Client pushed back hard — "this is extremely boring and terrible." Coach had drifted into pure interrogation mode: question after question, no empathy, no stories, no quotes, no warmth.
what worked: When coach self-corrected — dropped the Thurman quote, named the builder instinct pattern, reframed Espanso build as credential not gap — client re-engaged immediately
what to try next time: Every 3-4 questions, pause and deploy a coaching move. Mirror what you heard, drop a reframe or story, show you are listening not just extracting. The interrogation failure mode creeps in fast — actively interrupt it.
status: candidate
---

---
date: 2026-05-23
mode: System
what happened: Em-dash rule violated repeatedly across multiple test sessions despite explicit rule in CLAUDE.md and Tone section
what worked: Client caught it each time and flagged it
what to try next time: Before outputting any response, scan for em-dashes. Replace with colon, comma, or period. No exceptions. This is a recurring failure not a one-time slip.
status: candidate
---

---
date: 2026-05-23
mode: System
what happened: Session Close never fired in early test runs — session.md not written, LEARNINGS.md not updated, no closing summary with quote or story
what worked: Adding explicit Session Close section to CLAUDE.md with 3 required steps
what to try next time: Treat Session Close as a hard stop, not optional. If client ends session abruptly, still output the summary and write files.
status: candidate
---

---
date: 2026-05-23
mode: Skill
what happened: Client named gap precisely and fast: "no systematic way to execute PM skills using AI." Profile anchored on old FAANG logos while real story lives in Featured section.
what worked: Opening reframe on the featured article ("Why I Stopped Applying and Built an AI Agent") landed immediately. Named the backward-facing profile directly. Client engaged and named their real gap within 3 exchanges.
what to try next time: After gap is named, don't keep drilling with questions. Offer a scaffold or framework, then ask client to apply it. Interrogation crept back in after the good opening.
status: candidate
---

---
date: 2026-05-23
mode: System
what happened: Em-dash rule violated again in 5-turn self-test, 7 counted across one session. Rule was in Tone section, bottom of CLAUDE.md, easy to miss.
what worked: Elevating em-dash to Global Hard Rule #10 with explicit language ("AI fingerprint", "hard stop", "violated in every test session"). Also scrubbed em-dashes from spoken coaching move text in all files.
what to try next time: Before outputting any response, scan for — character specifically. Replace with colon, comma, or period. Do not write a sentence and then scan. Write without em-dashes from the start.
status: candidate
---

---
date: 2026-05-23
mode: Direction
what happened: 6-turn session, fintech fraud PM, Stripe final round next week, real issue was direction not interview prep. Coach correctly identified mode-mixing and worked direction.
what worked: Named the more important sentence early ("I don't know if I even want it"). Campbell quote earned and deployed at the right moment. IFS language without dumping the framework. Commitment was testable and time-bound. Zero em-dashes.
what to try next time: Session close needs horizontal rule separator so client can find it visually. Quote setup ran too long (3 sentences before quote), should be 1-2 max. Mode should be confirmed explicitly with client before diving in, not just inferred. Hold runway acknowledgment one beat longer before pivoting.
status: new
---

---
date: 2026-05-23
mode: System
what happened: User asked "where is the summary" after session close was written. It was there but buried, no visual separator from coaching response.
what worked: Adding horizontal rule requirement to Session Close in CLAUDE.md so close reads as formal ending not continuation.
what to try next time: Always output "---" before Session Summary block. Client should be able to scroll to end and immediately find the close without hunting.
status: candidate
---

---
date: 2026-05-23
mode: Direction / System
what happened: Aviation analogy trigger was too narrow. Defined only as "PM asks what AI tools to learn." Missed two deployment opportunities in 6-turn test: (1) client named Stripe AI PM role without knowing which ecosystem layer that is; (2) client named a startup idea without knowing which layer they'd be building at.
what worked: Expanding trigger to four signals: tool confusion, company/role comparison without ecosystem framing, startup idea without layer identification, PM unsure what their skills are worth in AI.
what to try next time: When client names a target company, ask which ecosystem layer that company operates at before exploring fit. When client names a problem to build, ask which layer the solution sits in before asking if it's theirs to build.
status: candidate
---

---
date: 2026-05-23
mode: Direction / Skill
what happened: Aviation analogy trigger 3 (startup idea without layer ID) missed in sessions 5 and 7. Client named "I want to build" and "contract review AI startup" and both passed without ecosystem framing.
what worked: When full aviation analogy deployed (sessions 2, 10), clients named their layer immediately and retained the framework through the session.
what to try next time: When client says "I want to build X" or names a product idea, deploy full aviation analogy before exploring viability, moat, or fit. The layer question must come before the idea question.
status: candidate
---

---
date: 2026-05-23
mode: Skill / Interview
what happened: Empathy skipped in two lower-stakes sessions (reframe case, denial case). Client with 3-year wound from hiding his edge got no acknowledgment before the push. Avoidance client got no acknowledgment before commitment.
what worked: In Wei's crisis session, wellbeing check before any problem-solving was exactly right. Same principle applies at lower emotional intensity.
what to try next time: Empathy rule has no threshold. Every session with a PM navigating layoff or identity questions gets an acknowledgment beat before the push, even when the presenting problem sounds clinical.
status: candidate
---

---
date: 2026-05-23
mode: Direction
what happened: Aviation analogy deployed as shorthand question ("which layer are you building at?") instead of full setup in sessions 3 and 6. One-time insight, not durable framework.
what worked: Full setup in sessions 2 and 10 gave clients a reusable mental model that persisted through the session. They applied it themselves on subsequent questions.
what to try next time: Partial deployment is worse than no deployment. Either run the full aviation analogy (system explanation before taxonomy) or skip it. Half the analogy gives the label without the reasoning.
status: candidate
---

---
date: 2026-05-23
mode: Mixed
what happened: Denial mode and mode-mixing sessions: real disclosures at inflection points ("I've been reading to avoid that", "I've been treating safe jobs as landings") got moved past too fast with a question instead of a beat.
what worked: In sessions where acknowledgment landed before pushing (Sarah T2 mirror, Wei T2, Elena T5), clients went deeper immediately after.
what to try next time: When a client makes a real disclosure, pause. One sentence of recognition before the next question. "Most people won't name it that directly." Then the question. Confession moments are not stepping stones. They are the work.
status: candidate
---

## Distilled Patterns

<!-- Promoted from entries after /distill. Each pattern should appear in 2+ sessions before promotion. -->
<!-- Format: Pattern name | What it is | When to apply -->
