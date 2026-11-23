# AI Lab Tycoon — Project Constitution

## 1. Core philosophy

Build the simplest maintainable implementation that delivers the intended gameplay.

**Priorities, in order:**
1. Correctness and player experience
2. Simplicity and readability
3. Security and data integrity
4. Maintainability and extensibility
5. Performance
6. Architectural elegance

Do not sacrifice simplicity for hypothetical future requirements.

The game should be easy to understand, easy to modify, and easy to test.

## 2. Code quality

### Keep code concise
- Prefer small, focused functions with descriptive names.
- Avoid unnecessary abstraction, boilerplate, and excessive indirection.
- Don't create a new module for every small function.
- Avoid deeply nested conditions; use early returns where appropriate.
- Avoid duplicating business logic.
- Use comments to explain *why*, not restate *what* the code does.
- Do not add speculative features or defensive code for impossible states.

### Keep code understandable
- Prefer explicit logic over clever shortcuts.
- Use consistent naming conventions.
- Keep functions and modules focused on clear responsibilities.
- Use typed Luau where it improves correctness and clarity.
- Avoid large, monolithic scripts.
- Avoid magic numbers; centralize meaningful gameplay constants.

### Avoid overengineering
- Do not introduce elaborate dependency injection, event buses, frameworks, or generic systems without a demonstrated need.
- Do not build infrastructure for features that aren't being implemented.
- Prefer extending existing systems over creating parallel implementations.
- A small amount of duplication is acceptable when abstraction would be more complicated.

## 3. Roblox architecture

### Server authority
The server owns:
- Player currency
- Inventory
- Purchases
- Shared store stock
- Hardware installation state
- Model training results
- Published models
- Revenue calculations
- Persistent progression

Clients handle presentation, input, animation, and interface state.

Never trust client-provided prices, rewards, item attributes, or ownership claims.

Validate remote requests server-side and reject invalid operations.

### Networking
- Use Roblox RemoteEvents and RemoteFunctions only where necessary.
- Keep remote interfaces small and understandable.
- Avoid excessive network traffic.
- Never replicate authoritative economic calculations to the client as trusted inputs.
- Handle duplicate requests and rapid interactions safely.

### Performance
- Avoid expensive operations every frame when events or periodic updates are sufficient.
- Avoid unnecessary polling.
- Clean up connections and temporary objects.
- Keep large numbers of physical parts and visual effects under control.
- Consider mobile performance from the beginning.

## 4. Data-driven gameplay

Define hardware, rarity, costs, and progression values in centralized configuration modules.

Do not scatter gameplay balancing values throughout scripts.

Prefer reusable item definitions to writing separate logic for each item.

Game systems should support future expansion without implementing that expansion prematurely.

Examples:
- CPU, GPU, and RAM should share an item-definition pattern.
- Store inventory should support adding new items through configuration.
- Model training should eventually be configurable without rewriting the entire system.

## 5. Game design principles

### Accessibility first
- Gameplay should be understandable without technical knowledge.
- Prefer simple interactions with clear feedback.
- Technical complexity should emerge gradually.
- Support keyboard/mouse and mobile-friendly interfaces.

### Meaningful progression
- Every important upgrade should improve capability, change gameplay, or provide visible progression.
- Avoid repetitive interactions that exist only to consume time.
- Repetition should eventually lead to automation or new mechanics.

### Player choice
- Avoid a single universally optimal strategy when meaningful alternatives are feasible.
- Balance investment, quality, speed, and efficiency.
- Rare items should offer advantages without becoming mandatory progression blockers.

### Immediate feedback
- Make purchases, upgrades, training, and rewards visually understandable.
- Players should know why actions succeeded or failed.
- Prefer clear feedback over complicated statistics.

## 6. Scope discipline

Only implement the currently approved milestone.

Do not introduce future systems merely because they have been discussed.

For every feature:
1. Identify the smallest viable implementation.
2. Reuse existing systems.
3. Implement the requested behavior.
4. Test it.
5. Stop.

If an implementation requires a major architectural change, explain the reason before proceeding.

Avoid unrelated refactors during feature work.

## 7. Testing and verification

Every meaningful gameplay change should be verified.

Minimum expectations:
- Run the Rojo build.
- Test core interactions in Roblox Studio when available.
- Test multiplayer behavior when changing shared state.
- Validate server-side purchases and resource consumption.
- Check that existing functionality continues working.
- Report what was tested and what remains unverified.

Never claim a test passed unless it was actually executed.

## 8. Development workflow

Before implementation:
- Read existing project instructions and relevant code.
- Understand the current architecture.
- Make a concise implementation plan.
- Identify affected systems.

During implementation:
- Make focused, incremental changes.
- Preserve working behavior.
- Avoid modifying unrelated files.
- Prefer the smallest coherent change.
- Keep implementation aligned with the current milestone.

After implementation:
- Run available checks.
- Summarize changed files and behavior.
- Report test results and limitations.
- Update the roadmap only when milestone status changes.
- Do not automatically start the next milestone.

## 9. Documentation

Documentation should remain concise and useful.

Maintain:
- `README.md` — Setup and development instructions
- `GAME_DESIGN.md` — Approved gameplay design
- `ROADMAP.md` — Current milestones and future scope
- `PROJECT_CONSTITUTION.md` — Permanent engineering principles
- `AGENTS.md` — Codex operating instructions

Avoid duplicating the same information across files.

Documentation should describe implemented behavior accurately, distinguishing it from planned features.

## 10. Decision hierarchy

When requirements conflict, follow this order:

1. Explicit instructions for the current task
2. Project constitution and security
