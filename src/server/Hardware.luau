local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Catalog = require(ReplicatedStorage:WaitForChild("AILabShared"):WaitForChild("Catalog"))

local Hardware = {}
local states = {}
local stock = {}
local items = {}

for _, item in Catalog.Items do
    items[item.Id] = item
end

function Hardware.addPlayer(player)
    states[player] = { cash = Catalog.StartingCash, owned = {}, installed = {} }
    player:SetAttribute("Cash", Catalog.StartingCash)
end

function Hardware.removePlayer(player)
    states[player] = nil
end

function Hardware.restock()
    for _, item in Catalog.Items do
        stock[item.Id] = item.Stock
    end
end

function Hardware.getStock(id)
    return stock[id]
end

function Hardware.purchase(player, id)
    local state, item = states[player], items[id]
    if not state or not item then
        return false, "Product unavailable."
    end
    local remaining = stock[id]
    if state.owned[item.Category] then
        return false, "You already own " .. item.Category .. "."
    end
    if remaining ~= nil and remaining <= 0 then
        return false, "Sold out. Check back after restock."
    end
    if state.cash < item.Price then
        return false, "You need more cash."
    end

    state.cash -= item.Price
    state.owned[item.Category] = item
    if remaining ~= nil then
        stock[id] = remaining - 1
    end
    player:SetAttribute("Cash", state.cash)
    player:SetAttribute("Owned" .. item.Category, id)
    return true, "Bought " .. item.Name .. "."
end

function Hardware.missingParts(player)
    local state = states[player]
    if not state then
        return nil
    end
    local missing = {}
    for _, category in Catalog.Categories do
        if not state.installed[category] then
            table.insert(missing, category)
        end
    end
    return missing
end

function Hardware.install(player)
    local state = states[player]
    if not state then
        return false, "Garage unavailable."
    end
    for _, category in Catalog.Categories do
        if state.owned[category] then
            if not state.installed[category] then
                state.installed[category] = state.owned[category]
                player:SetAttribute("Installed" .. category, true)
            end
        end
    end
    local missing = Hardware.missingParts(player)
    if #missing > 0 then
        return false, "Still needed: " .. table.concat(missing, ", ")
    end
    return true, "PC online."
end

Hardware.restock()
return Hardware
