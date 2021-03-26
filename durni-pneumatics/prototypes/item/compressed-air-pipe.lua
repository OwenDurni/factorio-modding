local tables = require "tables"

local vPipeItem = data.raw["item"]["pipe"]
local item =
  tables.copyUpdateAll(
  vPipeItem,
  {
    name = "durni:compressed-air-pipe",
    place_result = "durni:compressed-air-pipe",
    icon = "__durni-pneumatics__/graphics/icons/compressed-air-pipe.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]z"
  }
)
data:extend {item}
