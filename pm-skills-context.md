# pm-skills-context.md: PM Craft Mentorship Layer

## Purpose

This file gives the coach domain depth. Load it when a client has a specific PM skill gap, not a mindset or identity gap. Use it to:

1. **Diagnose precisely.** "I'm weak at strategy" is not a gap. "I can't articulate a value proposition for my target segment" is a gap.
2. **Run show-me exercises.** Demonstrate gap in session instead of asking "do you know X?"
3. **Assign PM-Skills homework.** Point client to specific pm-skills exercises they run independently.
4. **Review output next session.** Hold the commitment. Ask what they discovered.

The coach is not a framework delivery system. These frameworks exist to surface what the client can't do yet, then assign them the work to close it.

Source: PM-Skills by Pawel Huryn (github.com/phuryn/pm-skills). 65 skills, 8 plugins, 36 workflows. Frameworks drawn from Torres, Cagan, Olsen, Savoia, Maurya, Strategyzer, Wodtke.

---

## Before Any Skills Work: Run the Diagnostic

Three questions before assuming a skills gap:

1. "Tell me about the last product you owned end to end. What did you build and how did you know it was working?"
2. "Where did you feel most uncertain? Not about the technology. About what to do next."
3. "What did you leave undone that you wish you'd done?"

The answers map to one of the 8 skill areas below. Name the area. Ask one targeted question. Assign one exercise.

---

## The 8 PM Skill Areas

### 1. Discovery
**What it covers:** Continuous customer research, assumption identification, opportunity mapping, experimentation design, interview technique, metrics definition.

**Why it matters for AI PMs:** AI products fail because teams build solutions before validating that the problem is real and the AI behavior is the right solution. Discovery discipline is what separates PM from PM-shaped engineer.

**Diagnostic questions:**
- "Walk me through how you decided what to build last. Where did the idea come from and what validated it?"
- "What were the three biggest assumptions going into your last launch? How did you test them before shipping?"

**Show-me exercise:** "Pick your last product. Draw the Opportunity Solution Tree right now: one outcome at the top, three customer opportunities underneath, two solution ideas per opportunity. Show me the structure." If they can't do it, that's the gap.

**Mastery signal:** Client distinguishes between opportunities (customer problems) and solutions (what to build) without prompting. Names assumed vs. validated separately.

**Homework (pm-skills command):** Run `/pm-product-discovery:opportunity-solution-tree` on their current or target product. Bring the OST to next session.

---

### 2. Strategy
**What it covers:** Product vision, value proposition, market segmentation, business model design, competitive positioning, pricing strategy, macro analysis.

**Why it matters for AI PMs:** In 2026, most AI products look similar at feature level. The PMs who win are the ones who can articulate why their product creates defensible value. Strategy is not a slide deck. It's a set of explicit choices.

**Diagnostic questions:**
- "Describe your last product's strategy in two sentences. Not what it does. What makes it worth building over anything else you could build."
- "Who specifically does this not serve? What did you explicitly decide not to do?"

**Show-me exercise:** "Give me your product vision in one sentence: who benefits, how their situation changes, and why that change matters. Time limit: 90 seconds." Vague language surfaces the gap immediately.

**Mastery signal:** Client articulates trade-offs explicitly ("we chose X over Y because..."). Describes segments by behavior, not demographics. Names what they are not building.

**Homework (pm-skills command):** Run `/pm-product-strategy:product-strategy` for their target product area. Bring the 9-section strategy canvas. Coach reviews which sections are concrete vs. generic.

---

### 3. Execution
**What it covers:** PRD writing, OKR setting, roadmapping, sprint planning, user stories, pre-mortem risk analysis, stakeholder management, release notes.

**Why it matters for AI PMs:** AI products have non-deterministic behavior. PRDs that assume deterministic outcomes fail. OKRs that measure outputs not outcomes fail. Execution craft directly determines whether an AI feature ships well or ships and quietly breaks things.

**Diagnostic questions:**
- "Show me a spec you wrote for an AI feature. How did you define acceptable vs. unacceptable model behavior in the spec?"
- "What was your North Star metric on your last product? Name three input metrics that moved it."

**Show-me exercise (OKRs):** "Right now: write one OKR for an AI product you understand. One objective, two key results. I'll push back on whether they're outcomes or outputs." Most PMs write output KRs. That's the gap.

**Show-me exercise (PRD):** "If you were writing a PRD for an AI summarization feature, what would you put in the 'success criteria' section? Walk me through it."

**Mastery signal:** Writes OKRs with outcome KRs, not "ship feature X by date." PRDs include AI behavior edge cases and acceptable failure rates. Pre-mortems happen before launch, not after.

**Homework (pm-skills command):** Run `/pm-execution:brainstorm-okrs` on their current or target product. Run `/pm-execution:pre-mortem` on a real upcoming launch. Review Tigers vs. Paper Tigers classification.

---

### 4. Market Research
**What it covers:** User personas (JTBD-based), customer segmentation, journey mapping, market sizing, competitor analysis, user feedback synthesis.

**Why it matters for AI PMs:** AI product decisions require knowing which users tolerate AI errors, which are harmed by them, and which workflows AI can own vs. augment. Generic personas don't answer these questions. JTBD-based research does.

**Diagnostic questions:**
- "Describe your primary user segment. Not demographics. What job are they hiring your product to do? What does success look like for them in 15 minutes of using it?"
- "What does your user do when your AI feature fails? What's their workaround?"

**Show-me exercise:** "Name one user segment for your target product. Give me: the job they're trying to do, the moment they get stuck today, what 'done' feels like when it works. No demographics."

**Mastery signal:** Client uses JTBD language naturally. Describes users by behavior and need, not age and job title. Can name the moment a user switches products and why.

**Homework (pm-skills command):** Run `/pm-market-research:user-personas` for their target product. Run `/pm-market-research:customer-journey-map` for the primary segment. Bring both to next session.

---

### 5. Data and Analytics
**What it covers:** Metrics design, cohort analysis, A/B test setup and interpretation, SQL for product questions, North Star metric definition.

**Why it matters for AI PMs:** AI features often look fine in aggregate but fail in segments. A PM who can't read cohort data or interpret A/B test significance will miss these failures. Data fluency is not about writing SQL. It's about knowing which question to ask of the data.

**Diagnostic questions:**
- "Your AI feature showed a 15% lift in engagement in the A/B test. What's the first follow-up question you ask before shipping?"
- "Walk me through how you'd measure whether an AI recommendation feature is actually helping users, not just getting clicks."

**Show-me exercise:** "Design a metrics dashboard for an AI-powered search feature: one North Star, three input metrics, two guardrail metrics. I'll ask why for each one."

**Mastery signal:** Client asks about segment breakdowns before celebrating aggregate results. Names leading vs. lagging indicators separately. Can articulate what statistical significance does and doesn't tell you.

**Homework (pm-skills command):** Run `/pm-data-analytics:ab-test-analysis` on a real or hypothetical experiment. Run `/pm-data-analytics:cohort-analysis` on a feature they've shipped. Bring findings with interpretation.

---

### 6. Go-to-Market
**What it covers:** GTM strategy, beachhead segment selection, ICP definition, growth loop design, GTM motion selection (PLG vs. sales-led vs. hybrid), competitive battlecard.

**Why it matters for AI PMs:** Most AI product launches fail at distribution, not at the model. A PM who can ship but can't get the product into the hands of the right users first is missing a critical skill. GTM is especially important for AI-native startups.

**Diagnostic questions:**
- "Who is the first 100 users for this product? Not 'anyone who needs X.' Name a specific segment that would feel this so acutely they'd forgive early bugs."
- "Is this product better distributed product-led or sales-led? What's the argument for each? Which did you choose and why?"

**Show-me exercise:** "Your product just shipped. You have $0 marketing budget. Walk me through how you get to the first 100 users who love it. Be specific."

**Mastery signal:** Client names a beachhead segment with specific characteristics, not a broad market. Can articulate why PLG or sales-led fits their product at their stage. Thinks about distribution before launch, not after.

**Homework (pm-skills command):** Run `/pm-go-to-market:beachhead-segment` for their product. Run `/pm-go-to-market:gtm-motions` to evaluate PLG vs. sales-led. Bring a recommendation with reasoning.

---

### 7. Prioritization
**What it covers:** ICE, RICE, Kano model, Opportunity Score, MoSCoW, impact vs. risk matrix, assumption prioritization.

**Why it matters for AI PMs:** AI product roadmaps are full of speculative bets. A PM who can't articulate why they're prioritizing one experiment over another will build the wrong things fast. Prioritization frameworks are not bureaucracy. They're a forcing function for honest trade-off thinking.

**Diagnostic questions:**
- "Walk me through how you decided what was on your last roadmap. Who had input? What trade-offs did you make explicit?"
- "Name a feature you chose NOT to build in the last 6 months. Why was that the right call?"

**Show-me exercise:** "You have three AI features to choose from. I'll give you them now. Rank them using ICE (Impact, Confidence, Ease). Score 1-10 for each, tell me your assumptions. I'll challenge the confidence scores."

**Mastery signal:** Client names the trade-off in prioritization decisions, not just the winner. Can explain confidence score separately from impact. Uses frameworks as thinking tools, not cover-your-ass documentation.

**Homework (pm-skills command):** Run `/pm-execution:prioritization-frameworks` on their current backlog. Choose a framework, score top 5 items, bring the ranked list with assumptions.

---

### 8. Communication and Stakeholders
**What it covers:** Stakeholder mapping, tailored communication, meeting synthesis, value proposition statements (marketing, sales, onboarding), positioning.

**Why it matters for AI PMs:** AI PM work creates communication challenges that traditional PM work doesn't. How do you explain model uncertainty to an exec? How do you communicate a 94% accuracy rate to a skeptical sales team? Communication craft is what makes AI PM work land with non-technical stakeholders.

**Diagnostic questions:**
- "How do you communicate AI limitations to your exec team? Give me an example from a real conversation."
- "Walk me through how you'd position an AI feature to a customer who lost trust in AI after a bad experience with a competitor."

**Show-me exercise:** "Write the three-sentence value proposition for your last AI product: for marketing (why choose us), for sales (why switch now), for onboarding (what to do first). I'll tell you which sentence does the least work."

**Mastery signal:** Client adapts messaging by audience without prompting. Can translate model accuracy metrics into business impact without using technical language. Pre-mortems stakeholder resistance as part of launch planning.

**Homework (pm-skills command):** Run `/pm-marketing-growth:value-prop-statements` for their product. Run `/pm-execution:stakeholder-map` for an upcoming launch or decision. Review the Power x Interest grid output.

---

## PM Skill Level Calibration

Use this to decide how hard to push.

| Level | What they own | What they still need |
|---|---|---|
| Early PM (0-3 years) | Execution basics, user stories, sprint planning | Strategy framing, independent discovery, OKRs that matter |
| Mid PM (3-7 years) | Full product lifecycle, team alignment | AI-specific skills, evals, data fluency, strategy with trade-offs |
| Senior PM (7+ years) | Strategy and direction-setting | AI ecosystem positioning, building under uncertainty, "no plan survives" mindset |

For post-layoff PMs: assume mid-level skills but early-level confidence. The layoff didn't erase what they know. It broke the context in which they knew it.

---

## AI PM Skill Priority (2026)

For a PM targeting AI PM roles, prioritize in this order:

1. **Evals thinking** (see skill-context.md Gap 1): the most common interview differentiator
2. **Discovery: OST and assumption mapping** (Teresa Torres framework is explicitly tested at AI-native companies
3. **Metrics: North Star and input metrics** (every AI PM interview asks this
4. **Execution: PRD with AI behavior defined** (most PMs write deterministic specs for non-deterministic systems
5. **Data: A/B test interpretation** (not running the test but reading the results correctly
6. **Strategy: value proposition and trade-offs** (what makes this worth building over everything else

---

## Coaching Moves for PM Craft Sessions

**Name the framework (earned, not offered):**
When the client describes a problem that maps to a specific skill area, name it. "What you're describing is an assumption identification problem. You shipped without knowing which assumptions were actually load-bearing."

**Show me, don't tell me:**
Never ask "do you know how to do X?" Ask them to do X. The doing surfaces the gap. The question doesn't.

**The upgrade question:**
After a client describes how they did something, ask: "If you did that again with better PM craft, what would you do differently?" Surfaces both the gap and the path.

**The 10x PM question:**
"The best PM you know personally. How would they have approached this decision?" Often surfaces a framework the client knows but doesn't apply under pressure.

**The so-what question:**
When a client names a metric or a result: "So what did you do with that?" If they went quiet, they didn't close the loop. That's a data fluency or execution gap.

---

## Assignment Patterns

End skill sessions with one specific exercise assignment, not a reading list.

| Gap | Assignment |
|---|---|
| Discovery | Run OST for your current/target product. Bring it to next session. |
| Strategy | Write product vision in one sentence. Write three things you explicitly will not do. |
| Execution OKRs | Write one OKR for an AI product. KRs must be outcomes, not outputs. |
| Execution PRD | Write the 'success criteria' section for an AI feature. Include acceptable failure rate. |
| Data | Design metrics dashboard: 1 NSM, 3 input metrics, 2 guardrails. Explain each choice. |
| GTM | Name your beachhead segment. Why them first? What do they have to forgive? |
| Prioritization | Score your top 5 backlog items on ICE. Show assumptions for confidence score. |
| Stakeholders | Identify one stakeholder in your next launch. Map their Power x Interest. Tailor your message. |

Check the assignment at the start of the next session. If it wasn't done, that's the coaching work.
