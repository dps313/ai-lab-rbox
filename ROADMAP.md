# AI Lab Tycoon — Historical roadmap proposal

The [product roadmap and work policy](docs/05-ROADMAP.md) is authoritative. The proposal below preserves earlier planning and tracker references for context. Its chatbot recipe, timing, rewards, issue sequencing, and suggested sessions were proposals. Current work is product definition, and implementation requires explicit approval under the canonical roadmap.

Milestone 1.1 has a playable garage, shared computer store, hardware purchases and installation. Build the next loop around a powered PC that trains a model and earns enough for an upgrade. Each child below should fit one Codex session and one focused change. Priorities are P1 for the next playable build, P2 for the following build or its polish, and P3 for later systems.

## Powered PC and model training · Existing tracker #5

**Exit:** A player can assemble a PC, train a model and collect the result. Design proposal for #4: Starter Chatbot, free to start, 20 seconds, $25 on collection, repeatable. Confirm those values before implementation. Base hardware of either condition qualifies.

| Child | Priority | Depends on | Acceptance |
|---|---|---|---|
| Confirm model loop rules (#4) | P1 | — | Record the agreed recipe, duration, reward, and reset behavior in GAME_DESIGN.md. |
| Open a PC terminal | P1 | — | Only the owner can interact with the terminal; the off state names missing parts; the powered state shows the training entry point. |
| Start and run one recipe (#6) | P1 | Rules, terminal interface | The server starts one run per player and rejects duplicate or offline starts; progress and remaining time show on the PC; character reset preserves the run for that session. |
| Collect the model and reward (#7) | P1 | Run recipe | A completed job shows a result and grants cash once; replaying collect does not pay twice; another player cannot collect it. |
| View model history | P2 | Collect result | PC lists session results by recipe and completion time, with a clear empty state. |

## Hardware upgrades and economy · New tracker

**Exit:** Earnings buy one upgrade that changes the next run.

| Child | Priority | Depends on | Acceptance |
|---|---|---|---|
| Add one affordable GPU upgrade | P2 | Rules | A configured listing clearly shows its price and speed benefit; the server validates affordability and eligibility. |
| Replace installed GPU | P2 | Upgrade listing | An owner can install the new GPU; the resulting old-part handling is explicit; duplicate requests cannot consume cash twice or duplicate an item. |
| Apply the upgrade to training speed | P2 | Run recipe, replace GPU | The terminal predicts the shorter run; the server snapshots runtime at start; replacing hardware mid-run does not change a running job. |
| Tune the first upgrade target | P2 | Collect result, upgrade listing | Record the number of starter runs needed for the upgrade and check the path with both starter and used parts. |

## Garage and store experience · New tracker

**Exit:** The locations feel distinct and players can tell what to do in each.

| Child | Priority | Depends on | Acceptance |
|---|---|---|---|
| Give the garage a clear visual focus | P2 | Terminal interface | The arrival faces a visible desk and PC; the interaction stays reachable and room movement remains unobstructed. |
| Make the store easier to read | P2 | — | New and used sections are recognizable from arrival; players can distinguish price, sold-out and unlimited stock while approaching the counters. |
| Improve travel arrival presentation | P2 | — | Destination is clear after the fade and the camera faces the relevant interaction; repeat trips return control normally. |
| Show visible PC upgrade feedback | P2 | Replace GPU | The garage PC visibly acknowledges the installed upgrade when the owner returns or installs it. |

## First-run guidance and UI polish · Existing tracker #8

**Exit:** A first-time player can complete a run on desktop and phone without outside instructions.

| Child | Priority | Depends on | Acceptance |
|---|---|---|---|
| Guide the player to the next action (#9 scope) | P1 | Terminal interface | Guidance advances from buy parts to install to train to collect, including when a player buys parts in a different order. |
| Make purchase and install feedback readable | P2 | — | Successful purchases, duplicate ownership, insufficient cash, and missing parts are easy to distinguish; feedback does not hide inventory. |
| Polish PC terminal and job states | P2 | Run recipe, collect result | Ready, running, complete, and collected states are distinct; progress and reward are legible at a glance. |
| Add run-complete audio and motion | P2 | Collect result | Completion has one short cue with a visible equivalent; it does not replay on every terminal open. |
| Fit core HUD to small phones | P2 | Guidance, terminal | Travel, inventory, and PC controls are readable and tappable in portrait and landscape; movement and jump remain accessible. |
| Make travel failures recoverable | P2 | — | Busy arrival or timeout restores the controls, clears the fade, and displays a retry message. |

## Saved progression · New tracker, move #12 here

**Exit:** Players can leave and return with their cash, hardware and completed models.

| Child | Priority | Depends on | Acceptance |
|---|---|---|---|
| Define saved state and failure behavior (#12) | P3 | Collect result, replace GPU | Agree on save fields, schema version, pending-job policy, and load/save failure handling. |
| Save and load progression | P3 | Saved-state design | A rejoin restores supported fields, while load errors neither overwrite a prior save nor grant duplicate cash. |

## Model publishing and revenue · New tracker, move #13 here

**Exit:** A completed model can earn value through a simple publishing action.

| Child | Priority | Depends on | Acceptance |
|---|---|---|---|
| Define publishing and revenue rules (#13) | P3 | Collect result, saved-state design | Specify eligibility, audience, revenue timing and limits. |
| Publish one finished model | P3 | Publishing rules, save/load | An eligible owner can publish once and see its status after rejoining. |
| Pay the first publishing revenue | P3 | Publish model | Server grants the agreed reward once, with an understandable receipt. |

## Existing QA and session handoff

- #3 was reported complete by its session. Keep its findings attached to the hardware baseline.
- Carry #2 travel findings into the travel work. Travel polish and training can proceed independently unless a discovered bug blocks the actual play loop.
- Remove #2 and #3 as blanket dependencies of #6. Keep each feature's Studio verification in its own acceptance criteria.
- Keep #10 as conditional maintenance if training exposes a concrete reason to split the server code.
- Next three sessions: **PC terminal**, **training rules and job design** (#4), and **store readability**. The first two can agree on the terminal-to-training interface while store work proceeds independently. Start #6 once the rules and interface are agreed.
