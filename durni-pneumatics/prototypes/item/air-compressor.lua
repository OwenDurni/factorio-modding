local todo = require "todo"

local vItem = data.raw["item"]["electric-furnace"]
local vOffshorePump = data.raw["item"]["offshore-pump"]
local item =
  util.merge {
  vItem,
  {
    name = "durni:air-compressor",
    place_result = "durni:air-compressor",
    subgroup = "extraction-machine",
    order = "b[fuilds]-a[offshore-pump]z"
  }
}
item.icons = {
  {
    icon = vItem.icon,
    tint = todo.copperTint
  }
}
data:extend {item}
