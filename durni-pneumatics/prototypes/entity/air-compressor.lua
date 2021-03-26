local tables = require "tables"
local todo = require "todo"

local vFurnace = data.raw["furnace"]["electric-furnace"]
local vAssembler = data.raw["assembling-machine"]["assembling-machine-2"]
local vHeatExchanger = data.raw["boiler"]["heat-exchanger"]
local entity =
  tables.copyUpdateAll(
  vAssembler,
  {
    name = "durni:air-compressor",
    icons = {
      {
        icon = vFurnace.icon,
        tint = todo.tint
      }
    },
    minable = tables.copyUpdateAll(
      vFurnace.minable,
      {
        result = "durni:air-compressor"
      }
    ),
    crafting_categories = {"durni:air-compressor"},
    crafting_speed = 1,
    energy_usage = "100kW",
    source_inventory_size = 0,
    result_inventory_size = 0,
    fluid_boxes = {
      {
        production_type = "output",
        filter = "durni:compressed-air",
        base_area = 10,
        base_level = 0.2,
        pipe_covers = vHeatExchanger.energy_source.pipe_covers,
        pipe_connections = {{type = "output", position = {0, 2}}}
      }
    }
  }
)
data:extend {entity}
