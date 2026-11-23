# AI Lab Tycoon — Game Systems

**Status:** Working design, with explicit approval levels  
**Implementation warning:** Preferred directions and future concepts are not implementation-ready.

## 1. Hardware store — Approved core

A physical, shared, Goodwill-meets-Best-Buy electronics store, initially targeting roughly ten players per server (capacity to test).

- **New stock:** Unlimited, predictable prices, guaranteed progression.
- **Used stock:** Limited quantities shared by server, frequent refreshes, random bargains and rarity. Availability creates excitement, not hard progression locks.
- **Rarity tiers:** Common, Uncommon, Rare, Epic, Legendary, Mythic, Cosmic. Cosmic is not available from ordinary store stock. Exact distributions and effects are open.
- **Future:** Auctions, resale, market shortages, shipping, bulk purchasing, collectible displays.

## 2. Computing equipment — Approved core

- Starter configurable parts: CPU, GPU, RAM, alongside provided case and peripherals.
- Basic physical installation; no detailed compatibility/power/cooling simulation in the introductory loop.
- Hardware constrains **training capability, throughput, scale, memory and operating efficiency**. It should not independently guarantee model quality.
- Future servers and data centers should reuse item/computing principles rather than require disconnected systems.

## 3. Model development — Preferred direction, not yet designed

Inspired by *Game Dev Tycoon*: a comprehensible product-development sequence, strategy decisions, investment and a satisfying reveal.

- Begin with one or very few specialized model types, likely a binary classifier.
- Prefer **strategic choices and a discrete logarithmic investment control**, not thousands of linear slider points.
- High tiers cost exponentially more; brute-forcing one model becomes inefficient without new data, research or infrastructure.
- Appropriate dataset/task combinations and good development strategy should matter.
- More compute makes bigger/faster training feasible and can unlock new generations, but does not replace thoughtful choices.
- Visual neural diagrams, connected components and flowing data may enrich presentation. **Mandatory detailed neuron/layer authoring is out of the early game.** Optional advanced research is a future idea.
- Illustrative approaches: prioritize accuracy, speed/efficiency, or balance. Exact choices and scoring need design, not coding yet.
- Testing reveals or diagnoses quality; testing should not automatically improve the underlying model.

## 4. Model outcomes — Open design

Possible outputs: task quality/accuracy, speed and cost efficiency. Contributions may come from dataset fit, strategy, training investment, compute constraints, and future employee/research bonuses.

- Informed choices must matter more than random rolls.
- Give clear, brief, actionable feedback rather than opaque scores.
- Make especially good releases exciting while avoiding arbitrary loot-box-like model quality.
- No approved weights, equations, thresholds, randomness or rarity mapping.

## 5. Publishing and lineage — Preferred direction

Players name and publish a model to receive recurring income. Successful models may have successors (e.g. `PetVision 1.0` -> `2.0`). A successor likely **supersedes** its earlier release rather than stacking identical income forever. Different product lineages may coexist.

Revenue might later reflect quality, specialization, speed, efficiency, demand, and serving capacity. **Income formula and simultaneous-model limits are open.**

## 6. Economy — Approved principles, open balance

Training should have steep diminishing returns within a technology generation. Players can improve a lineage, launch a niche model, shop/resell hardware, or eventually invest in staff and infrastructure. No universal strategy should dominate every stage.

Scarcity rewards opportunism but never disables normal progression. Better hardware, specialized data, and research create different trade-offs. Avoid infinite income stacking and passive growth that erases active play.

## 7. Employees and automation — Future approved direction

Players first perform work themselves. Later staff/contractors automate tasks the player recognizes: labeling, model development, procurement, assembling equipment, operations. Their quality and specialization should affect decisions. Delegation changes play, not merely a production percentage.

Researcher and entrepreneur are **playstyle directions**, not mandatory fixed classes. Both should be viable and mixable.

## 8. Infrastructure and serving — Future exploration

- Scale from single PC to servers, equipment racks, offices, data centers and bulk hardware logistics.
- Eventually distinguish **training compute** from **inference/serving compute**.
- Potential later trade-off: improve an existing model or expand capacity to serve existing demand.
- Renting compute could enable experiments or temporary capability before owning large systems.
- Energy, cooling and reliability could matter later; do not implement before needed.

## 9. Contracts, market events, publicity — Future exploration

Contracts may reward reliability, efficiency, quality or capacity with meaningful risks. Player competition should not starve new players. Future events could include component shortages, investment booms and energy constraints. Press conferences and outrageous CEO statements could provide satire and trade-offs in hype/trust/sales.

## 10. Offline progression and visuals

- **Preferred:** Heavily reduced, capped offline earnings with a reason to return; exact values not defined.
- **Approved:** Strong visual progression — better PCs, garages, displays, offices and data centers, with fast readable upgrades.
- Cosmetic collecting/vanity money may provide goals beyond optimal economic progression.

## Core relationship

`Find hardware -> Build compute -> Develop/train model -> Evaluate/publish -> Earn -> Reinvest`

Long-term features must enrich this loop or provide understandable alternative ways to engage with it. They should not become arbitrary disconnected minigames.

## Explicitly out of early MVP scope

Detailed architecture editing; real AI training; sophisticated data-labeling; employees and bulk shipments; complete model demand/contract simulation; data centers; compute rental/inference serving; press conferences; full Robux monetization.
