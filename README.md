# AI Lab Tycoon

## Run locally

From the repository root, run `rojo serve` (or `.\.tools\rojo.exe serve` with the workspace-local binary). Open a local place in Roblox Studio, connect the Rojo plugin to the address shown by the server, and press **Play**. The store and garages are generated when the server starts.

If Studio was already connected before Milestone 1, disconnect and reconnect Rojo so it picks up the new `ReplicatedStorage.AILabShared` and `StarterPlayer.StarterPlayerScripts.AILabClient` mappings.

Alternatively, run `rojo build -o Milestone1.1.rbxlx` and open that file in Studio for a standalone local test. With the workspace-local binary, use `.\.tools\rojo.exe build -o Milestone1.1.rbxlx`.

## Play through

1. Spawn in your garage and check that the inventory shows $100 and three empty slots.
2. Select **Computer Store** in the Travel panel. After a short fade, you should land facing the counters. The new starter CPU ($30), GPU ($45), and RAM ($20) leave $5. Check that buying a second CPU leaves your balance unchanged.
3. Select **My Garage** and activate **Install owned parts** at the computer case. Try it with missing parts first to see the missing categories. With all three installed, the monitor lights up and reads **PC ONLINE**.
4. Reset your character and confirm that you return to your garage with the same session cash and installed parts.

## Test with two clients

1. In Studio, choose **Server & Clients**, set the client count to **2**, and start a fresh session. Confirm each player spawns above a solid floor, facing their own desk with $100. Walk and jump near the walls and across the floor. The rooms have no walkable connection.
2. Select **Computer Store** on both clients close together. Each screen should fade briefly, and both characters should land on the same store floor facing the counters, with space between them. Repeat travel in both directions to check for clipping or misplaced arrivals.
3. Have both players approach **Used CPU**. Buy it with Player 1. Both clients should see **0 left**, and Player 2's attempt should leave their balance and inventory unchanged. Buy the same **Starter GPU** on both clients and check that the listing stays **Unlimited**.
4. Wait for the next server restock (every 90 seconds from startup). Both clients should see **1 left** for Used CPU. Player 2 can now buy it. Buy RAM and select **My Garage** on both clients. Each should arrive in their own garage with the same cash and parts. Install the parts and verify **PC ONLINE**.
5. Reset each character, including one from the store. Verify each respawns in their own garage and keeps their session cash, parts, and PC state.
6. In a separate Studio playtest, use the **Device Emulator** with a phone profile in portrait and landscape. Check that both Travel buttons fit, respond to taps, and leave the movement and jump controls accessible.

## Source control

Use one short-lived branch per issue and link the issue in the pull request. Run the Rojo build before merging. Record any Studio checks the change needs, including a two-client check for shared state and a phone-emulator check for UI changes.

Review `git status --short` before committing. Commit Luau source, the Rojo project file, and project docs. Local tools and generated `.rbxl` and `.rbxlx` files are ignored.

## Run unit tests

Run `rojo build test.project.json -o unit-tests.rbxlx`, open the generated place in Studio, and press **Play**. Studio Output reports whether the hardware unit tests passed. The test project runs separately from the game.
