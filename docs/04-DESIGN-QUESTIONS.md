# AI Lab Tycoon — Design Questions and Experiments

**Status:** Active; no item here authorizes implementation.

Questions are prioritized for **one-at-a-time discussion**. For each, record competing options, current leaning, what would falsify it, and the eventual decision ID.

## P0 — Gameplay identity and first product

### Q01 — What's the balance between hardware shopping and AI development?

- Hardware deals are immediately understandable and exciting; model development is the unique identity.
- Hypotheses: equal pillars, hardware as acquisition hook, or model-first.
- **Current leaning:** Fast hardware discovery hook; model creation creates durable differentiation.
- **Needed:** Test what makes players voluntarily repeat the loop.

### Q02 — What exactly happens during creation of the first AI model?

- Alternatives: a few development decisions; discrete logarithmic investment; both; occasional short interactive steps.
- **Current leaning:** Game Dev Tycoon-like decisions + investment; animated data flow rather than mandatory architecture editor.
- **Needed:** Screen-by-screen first model flow and an early player test.

### Q03 — What actually determines a model's score?

- Candidate influences: task/data match, training strategy, investment, compute limits, future research and staff.
- **Needed:** Outputs, simplified math, ceiling/diminishing returns, modest randomness, explanatory feedback.
- **Invariant:** More spending alone shouldn't always dominate.

### Q04 — Why make model 2.0 or a second product?

- Candidate drivers: improved rating, income, prestige, experimentation, niche coverage, progression unlocks.
- **Needed:** Demonstrate voluntary second-cycle engagement, not just forced tutorial completion.

## P1 — Early-game balance

### Q05 — First-session pacing

- How long shopping, assembly, first training, first income and first upgrade take.
- Prior ~5-minute first publication was a **hypothesis**, not approved timing.

### Q06 — Published-model revenue

- What determines $/sec, how many models can earn at once, how predecessors are superseded, and how to avoid infinite stacking.
- Demand and serving can be simplified in MVP; exact formula unapproved.

### Q07 — Training investment control

- How many discrete tiers? Exponential ratios, per-project suitability, compute duration, ceilings, frontier transitions and cost display.
- Avoid overly fine sliders or an always-optimal maximum setting.

### Q08 — First automation unlock

- Which early repeated task becomes delegatable, when, and how delegation changes the player's activity.

## P2 — World and collection

### Q09 — Store restocks and scarcity

- Refresh rate, visibility, competition, bargains, new-player fairness, item generation and cross-server implications.

### Q10 — Hardware rarity effects

- Compute, memory, efficiency, aesthetics, resale, quirks, special traits. Rarity should not be simple universal quality boosts.

### Q11 — How much manual assembly is fun?

- Touch/click count, feedback, mobile behavior, repetition and eventual automation.

### Q12 — Visual progression

- Smallest set of high-impact garage/store/PC upgrades, how they read in Roblox and how they map to achievement.

## P3 — Future, do not block MVP

Staff specialization; researcher vs entrepreneur advantage; data centers, bulk shipments and resale; rentals; inference capacity; real demand; contracts; publicity; offline earnings; advanced research and dataset labeling.

## Evaluation methods

Use quick UI mockups, paper scenarios, isolated prototypes, observation of Roblox players, and telemetry such as first publish, voluntary second development, time-to-feedback and retention. Compare approaches without constructing all systems in full.

## Next discussion topic

**Q02: The exact first model-development flow.** Resolve a single interaction or screen at a time. Record decisions before authorizing code.
