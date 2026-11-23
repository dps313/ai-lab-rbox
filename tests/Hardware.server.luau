local Catalog = require(game.ReplicatedStorage.AILabShared.Catalog)
local Hardware = require(script.Parent.Hardware)

local function makePlayer()
    return {
        attributes = {},
        SetAttribute = function(self, name, value)
            self.attributes[name] = value
        end,
    }
end

local function expectMissing(player, expected)
    local actual = table.concat(assert(Hardware.missingParts(player)), ", ")
    assert(actual == expected, ("expected missing parts '%s', got '%s'"):format(expected, actual))
end

local owner = makePlayer()
local visitor = makePlayer()
local allParts = table.concat(Catalog.Categories, ", ")
assert(Hardware.missingParts(owner) == nil, "unregistered players have no PC state")
Hardware.addPlayer(owner)
Hardware.addPlayer(visitor)
expectMissing(owner, allParts)

assert(Hardware.purchase(owner, "new_cpu"))
expectMissing(owner, allParts)

local powered, message = Hardware.install(owner)
assert(not powered and message == "Still needed: GPU, RAM")
expectMissing(owner, "GPU, RAM")
expectMissing(visitor, allParts)

assert(Hardware.purchase(owner, "new_gpu"))
assert(Hardware.purchase(owner, "new_ram"))
assert(Hardware.install(owner))
assert(Hardware.install(owner), "repeated installation should keep the PC powered")
expectMissing(owner, "")
expectMissing(visitor, allParts)

Hardware.removePlayer(owner)
assert(Hardware.missingParts(owner) == nil, "leaving clears PC state")
print("[AI Lab Tycoon] Hardware unit tests passed")
