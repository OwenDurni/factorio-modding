local tables = require "tables"
local todo = require "todo"

local vItem = data.raw["item"]["electric-furnace"]
local vOffshorePump = data.raw["item"]["offshore-pump"]
local item =
  tables.copyUpdateAll(
  vItem,
  {
    name = "durni:air-compressor",
    place_result = "durni:air-compressor",
    subgroup = "extraction-machine",
    order = "b[fuilds]-a[offshore-pump]z",
    icons = {
      {
        icon = vItem.icon,
        tint = todo.tint
      }
    }
  }
)
data:extend {item}
